<?php

namespace Controller;

use Core\Config;
use Model\EatModel;
use Model\OrdersModel;
use Model\UsersModel;
use TexLab\MyDB\DB;
use View\View;

class UserFilterOrdersController extends ManagerFilterOrdersController
{
    protected $groupCod = "user";

}
