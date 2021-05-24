<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link">
        <span class="brand-text font-weight-light">Pedidos</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?=$assetDir?>/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Hillary Blanco</a>
            </div>
        </div>


        <nav class="mt-2">
            <?php
            echo \hail812\adminlte\widgets\Menu::widget([
                'items' => [
                    ['label' => 'Tu Panel','icon' => 'user'],
                    ['label' => 'Notificaciones', 'icon' => 'bell'],
                    ['label' => 'Pedidos', 'icon' => 'file'],
                    ['label' => 'Cuenta', 'icon' => 'cog'],
                    ['label' => 'Calculadora', 'icon' => 'calculator'],
                    ['label' => 'Credito', 'icon' => 'credit-card'],
                    ['label' => 'Análisis SEO', 'icon' => 'search'],
                ],
            ]);
            ?>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
