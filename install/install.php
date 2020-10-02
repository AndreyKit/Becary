<?php

require "vendor/autoload.php";

use TexLab\MyDB\Runner;
use TexLab\MyDB\DB;
use Core\Config;



$runner = new Runner(
    DB::Link([
        'host' => Config::MYSQL_HOST,
        'username' => Config::MYSQL_USER_NAME,
        'password' => Config::MYSQL_PASSWORD
    ]));


$runner->setErrorHandler(function ($mysqli, $sql) {
    echo "$mysqli->error\n";
});

$runner->runScript(file_get_contents('install/Becary.sql'));

