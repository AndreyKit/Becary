<nav class="navbar navbar-expand-lg navbar-light " id="asd">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">


            <li class="nav-item<?= $controllerType == 'eat' ? ' active' : '' ?>">
                <a class="nav-link" href="?action=show&type=eat">Торты</a>
            </li>

            <li class="nav-item<?= $controllerType == 'currentuserorders' ? ' active' : '' ?>">
                <a class="nav-link" href="?action=show&type=currentuserorders">Мои заказы</a>
            </li>

            <li class="nav-item<?= $controllerType == 'auth' ? ' active' : '' ?>">
                <a class="nav-link" href="?action=logout&type=auth">Выход</a>
            </li>



            <span class="navbar-text">
                <?= !empty($_SESSION['user']) ? $_SESSION['user']['FIO'] . '(' . $_SESSION['user']['name'] . ')' : '' ?>
            </span>
    </div>
</nav>