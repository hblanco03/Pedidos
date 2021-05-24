<?php
namespace app\models;
use Yii;
use yii\base\Model;

class Pedido extends model{
    public $tipo_texto;
    public $formato_texto;
    public $categoria;
    public $modalidad;
    public $extension;
    public $audiencia;
    public $pais;
    public $idioma;
    public $nombre_pedido;
    public $palabra_clave;
    public $palabra_secundaria;
    public $descripcion;
    public $posicionamiento_seo;
    public $archivo;
    public $grabacion;
    public $fecha;
    public $perspectiva;
    public $proposito;

    public function rules()
    {
        return [
            ['tipo_texto', 'required', 'message' => 'Selecione un tipo de texto'],
            ['formato_texto', 'required', 'message' => 'Selecione un formato de texto'],
            ['categoria', 'required', 'message' => 'Selecione al menos una categoría'],
            ['modalidad', 'required', 'message' => 'Selecione una modalidad'],
            ['extension', 'required', 'message' => 'Selecione una extensión de palabras'],
            ['audiencia', 'required', 'message' => 'Selecione el público objetivo'],
            ['pais', 'required', 'message' => 'Selecione al menos un país'],
            ['idioma', 'required', 'message' => 'Selecione el idioma'],
            ['nombre_pedido', 'required', 'message' => 'Indíque el nombre de su pedido'],
            ['nombre_pedido', 'match', 'pattern' => '/^[a-zA-Z\s]+$/', 'message' => 'El nombre debe contener únicamente letras sin espacios'],
            ['palabra_clave', 'required', 'message' => 'Indíque la palabra clave'],
            ['palabra_clave', 'match', 'pattern' => '/^[a-zA-Z]+$/', 'message' => 'La palabra clave debe contener únicamente letras'],
            ['palabra_secundaria', 'match', 'pattern' => '/^[a-zA-Z\s]+$/', 'message' => 'Las palabras secundarias debe contener únicamente letras'],
            ['descripcion', 'required', 'message' => 'Describa su pedido'],
            ['fecha', 'required', 'message' => 'Indíque una fecha'],
            ['fecha', 'required', 'message' => 'Indíque una fecha'],
            ['perspectiva', 'required', 'message' => 'Indíque el tipo de trato'],
            ['proposito', 'required', 'message' => 'Selecione un propósito'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'tipo_texto' => 'Tipo de Texto',
            'formato_texto' => 'Formato de Texto',
            'categoria' => 'Categoría',
            'modalidad' => 'Modalidad',
            'extension' => 'Extensión',
            'audiencia' => 'Público Objetivo',
            'pais' => 'País',
            'idioma' => 'Idioma',
            'nombre_pedido' => 'Nombre del Pedido',
            'palabra_clave' => 'Palabra Clave',
            'palabra_secundaria' => 'Palabras Secundarias',
            'descripcion' => 'Descripcion',
            'posicionamiento_seo' => 'Posicionamiento SEO',
            'archivo' => 'Archivo',
            'grabacion' => 'Grabación',
            'fecha' => 'Fecha',
            'perspectiva' => 'Perspectiva',
            'proposito' => 'Propósito'
        ];
    }

}
