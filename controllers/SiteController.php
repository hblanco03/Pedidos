<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Pedido;
use yii\helpers\ArrayHelper;
use app\models\Pedidos;
use app\models\Categoria;
use app\models\Pais;
use app\models\Audiencia;
use app\models\Palabra;
use app\models\Archivo;
use app\models\Grabacion;
use app\models\FormUpload;
use yii\web\UploadedFile;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
      $model= new Pedido;
      $query = new \yii\db\Query;
      $query->select(['formato_texto.id_formato_texto','formato_texto.descripcion'])->from('formato_texto');
      $formato_texto = $query->all();
      $formato_texto = ArrayHelper::map($formato_texto,'id_formato_texto','descripcion');

      $query->select(['tipo_texto.id_tipo_texto','tipo_texto.descripcion'])->from('tipo_texto');
      $tipo_texto = $query->all();
      $tipo_texto=ArrayHelper::map($tipo_texto,'id_tipo_texto','descripcion');

      $query->select(['categoria.id_categoria','categoria.descripcion'])->from('categoria');
      $categoria = $query->all();
      $categoria=ArrayHelper::map($categoria,'id_categoria','descripcion');

      $query->select(['modalidad.id_modalidad','.descripcion'])->from('modalidad');
      $modalidad = $query->all();
      $modalidad=ArrayHelper::map($modalidad,'id_modalidad','descripcion');

      $query->select(['.id_extension','extension.descripcion'])->from('extension');
      $extension = $query->all();
      $extension=ArrayHelper::map($extension,'id_extension','descripcion');

      $query->select(['audiencia.id_audiencia','audiencia.descripcion'])->from('audiencia');
      $audiencia = $query->all();
      $audiencia=ArrayHelper::map($audiencia,'id_audiencia','descripcion');

      $query->select(['pais.id_pais','.descripcion'])->from('pais');
      $pais = $query->all();
      $pais=ArrayHelper::map($pais,'id_pais','descripcion');

      $query->select(['idioma.id_idioma','.descripcion'])->from('idioma');
      $idioma = $query->all();
      $idioma=ArrayHelper::map($idioma,'id_idioma','descripcion');

      $query->select(['perspectiva.id_perspectiva','.descripcion'])->from('perspectiva');
      $perspectiva = $query->all();
      $perspectiva=ArrayHelper::map($perspectiva,'id_perspectiva','descripcion');

      $query->select(['proposito.id_proposito','.descripcion'])->from('proposito');
      $proposito = $query->all();
      $proposito=ArrayHelper::map($proposito,'id_proposito','descripcion');

      $msg= null;
      if ($model->load(Yii::$app->request->post()))
       {
        if($model->validate())
             {
              $pedido = new Pedidos;
              $pedido->id_tipo_texto    = $model->tipo_texto;
              $pedido->id_formato_texto = $model->formato_texto;
              $pedido->id_modalidad     = $model->modalidad;
              $pedido->nombre_proyecto  = $model->nombre_pedido;
              $pedido->id_proposito     = $model->proposito;
              $pedido->id_extension     = $model->extension;
              $pedido->id_idioma        = $model->idioma;
              $pedido->optimizacion_seo = $model->posicionamiento_seo;
              $pedido->palabra_clave    = $model->palabra_clave;
              $pedido->descripcion      = $model->descripcion;
              $pedido->fecha            = $model->fecha;
              $pedido->id_perspectiva   = $model->perspectiva;
              if ($pedido->insert())
                {
                    $max = Pedidos::find()->max('id_pedido');
                    $cat = $model->categoria;
                    for ($i=0; $i < count($cat) ; $i++)
                    {
                      $cat_ped = new Categoria;
                      $cat_ped->id_pedido = $max;
                      $cat_ped->id_categoria = $cat[$i];
                      $cat_ped->insert();
                    }

                    $pais1 = $model->pais;
                    for ($i=0; $i < count($pais1) ; $i++)
                    {
                      $pais_ped = new Pais;
                      $pais_ped->id_pedido = $max;
                      $pais_ped->id_pais = $pais1[$i];
                      $pais_ped->insert();
                    }

                    $aud = $model->audiencia;
                    for ($i=0; $i < count($pais1) ; $i++)
                    {
                      $aud_ped = new Audiencia;
                      $aud_ped->id_pedido = $max;
                      $aud_ped->id_audiencia = $aud[$i];
                      $aud_ped->insert();
                    }

                    $pal_sec = $model->palabra_secundaria;
                    $pal_sec = explode(" ", $pal_sec);
                    for ($i=0; $i < count($pal_sec) ; $i++)
                    {
                      $pal_ped = new Palabra;
                      $pal_ped->id_pedido = $max;
                      $pal_ped->palabra = $pal_sec[$i];
                      $pal_ped->insert();
                    }


                    if (!empty($_FILES['Pedido']['name']['archivo'])) {

                       $solArch = new Archivo;
                       $file = UploadedFile::getInstance($model, 'archivo');
                       $ruta= 'archivos/'.'pedido_archivo_'.$max.'_'.$_FILES['Pedido']['name']['archivo'];
                       $file->saveAs($ruta);
                       $solArch->id_pedido = $max;
                       $solArch->ruta = $ruta;
                       $solArch->insert();
                     }

                     if (!empty($_FILES['Pedido']['name']['grabacion'])) {

                        $solArch1 = new Grabacion;
                        $file1 = UploadedFile::getInstance($model, 'grabacion');
                        $ruta1= 'archivos/'.'pedido_grabacion_'.'_'.$max.$_FILES['Pedido']['name']['grabacion'];
                        $file1->saveAs($ruta1);
                        $solArch1->id_pedido = $max;
                        $solArch1->ruta = $ruta1;
                        $solArch1->insert();
                      }


                    $msg = "Su pedido ha sido guardado éxitosamente";

                    $model->tipo_texto = null;
                    $model->formato_texto = null;
                    $model->modalidad = null;
                    $model->nombre_pedido = null;
                    $model->proposito = null;
                    $model->extension = null;
                    $model->idioma = null;
                    $model->posicionamiento_seo = null;
                    $model->palabra_clave = null;
                    $model->descripcion = null;
                    $model->fecha = null;
                    $model->perspectiva = null;
                    $model->categoria = null;
                    $model->audiencia = null;
                    $model->pais = null;
                    $model->palabra_secundaria = null;
                    $model->archivo = null;
                    $model->grabacion = null;
                }
                else
                {
                    $msg = "Ha ocurrido un error al insertar el registro";
                }
             }
             else
             {
                 $model->getErrors();
             }
       }

        return $this->render('index',
        ['model'=>$model,
         'formato_texto' => $formato_texto,
         'tipo_texto' => $tipo_texto,
         'categoria' => $categoria,
         'extension' => $extension,
         'audiencia' => $audiencia,
         'pais' => $pais,
         'idioma' => $idioma,
         'perspectiva' => $perspectiva,
         'modalidad' => $modalidad,
         'proposito' => $proposito,
         'msg' => $msg,
        ]);
    }
}
