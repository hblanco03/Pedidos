<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>


<?php
$this->title = 'Pedido';
$this->params['breadcrumbs'] = [['label' => $this->title]];
?>

<?php $form = ActiveForm::begin(["method" => "post", 'enableClientValidation' => true,"options" => ["enctype" => "multipart/form-data"],]);?>
<h3><?= $msg ?></h3>
<div class="container-fluid">
  <div class="card card-default">
    <div class="card-header">
      <h3 class="card-title">Formato</h3>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label>Formato </label>
            <?= $form->field($model, 'formato_texto')->label(false)->dropdownList($formato_texto,['prompt'=>'Seleccione el formato de texto']); ?>
          </div>

        </div>
        <!-- /.col -->
        <div class="col-md-6">
          <div class="form-group">
            <label>Tipo</label>
              <?= $form->field($model, 'tipo_texto')->label(false)->dropdownList($tipo_texto,['prompt'=>'Seleccione el tipo de texto']); ?>
          </div>
        </div>
      </div>
    </div>
    <!-- /.card-body -->

  </div>
  <div class="card card-default">
    <div class="card-header">
      <h3 class="card-title">Categoría</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <?= $form->field($model, 'categoria')->dropdownList($categoria,['multiple' => true,'prompt'=>'Seleccione al menos una categoria']);?>
          </div>
        </div>
      </div>
    </div>
</div>
<div class="card card-default">
  <div class="card-header">
    <h3 class="card-title">Modalidad deseada para su pedido </h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <div class="row">

      <div class="col-md-3">
        <label>Modalidad del Proyecto</label>
        <div class="custom-control custom-radio">
          <?= $form->field($model, 'modalidad')->label(false)->radioList($modalidad,['prompt'=>'Seleccione la modalidad']); ?>
        </div>
      </div>
      <div class="col-md-12">
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
      </div>
      <div class="col-md-3">
        <label>Propósito del Proyecto</label>
        <div class="custom-control custom-radio">
          <?= $form->field($model, 'proposito')->label(false)->radioList($proposito,['prompt'=>'Seleccione el propósito']); ?>
        </div>
      </div>
      <div class="col-md-12">
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
      </div>
      <div class="col-md-12">
        <label>Nombre del Proyecto</label>
        <div class="form-group">
          <?= $form->field($model, "nombre_pedido")->label(false)->input("text") ?>
        </div>
      </div>
      <div class="col-md-12">
        <label>Extensión Máxima de Palabras</label>
        <?= $form->field($model, 'extension')->label(false)->dropdownList($extension,['prompt'=>'Seleccione la extensión de palabras para el texto']); ?>
      </div>
      <div class="col-md-6">
        <label>Paises a los que va dirigido</label>
        <?= $form->field($model, 'pais')->label(false)->dropdownList($pais,['multiple' => true,'prompt'=>'Seleccione al menos un pais']);?>
      </div>
      <div class="col-md-6">
        <label>Idioma de tu pedido</label>

        <?= $form->field($model, 'idioma')->label(false)->dropdownList($idioma,['prompt'=>'Seleccione el idioma']);?>

      </div>
      <div class="col-md-12" style="margin-top:20px; margin-bottom:20px">
        <div class="form-check">
          <?= $form->field($model, 'posicionamiento_seo')->checkBox()?>
        </div>
      </div>
      <div class="col-md-6">
        <label>Palabra Clave</label>
        <div class="form-group">
          <?= $form->field($model, "palabra_clave")->label(false)->input("text") ?>
        </div>
      </div>
      <div class="col-md-6">
        <label>Palabras Secundarias</label>
        <div class="form-group">
          <?= $form->field($model, "palabra_secundaria")->label(false)->input("text") ?>
        </div>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <label>Descripción del Pedido</label>
          <?= $form->field($model, "descripcion")->label(false)->textarea(['rows' => '3', 'placeholder' =>'Describa']) ?>
        </div>
      </div>
      <div class="col-md-6">
        <?= $form->field($model, "grabacion")->fileInput() ?>
      </div>
      <div class="col-md-6">
          <?= $form->field($model, "archivo")->fileInput() ?>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <label>Público Objeto</label>
          <?= $form->field($model, 'audiencia')->label(false)->dropdownList($audiencia,['multiple' => true,'prompt'=>'Seleccione el público objetivo']); ?>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label>Perspectiva del texto</label>
          <div class="form-check">
            <?= $form->field($model, 'perspectiva')->label(false)->radioList($perspectiva,['class'=>'col-md-12']); ?>
          </div>
        </div>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <label>Fecha de Entrega</label>
          <div class="form-group">
                <?= $form->field($model, "fecha")->label(false)->input("date",['class'=>'form-control datetimepicker-input col-md-12']) ?>
          </div>
        </div>
      </div>
      <div class="col-md-5"></div>
      <div class="col-md-7">
        <div class="form-group">
          <?= Html::submitButton("Enviar", ["class" => "btn btn-primary"]) ?>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<?php $form->end() ?>
