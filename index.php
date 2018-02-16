<?php
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', realpath(dirname(__FILE__)) . DS);
define('URL', "http://localhost/sircde3/");

require_once("app/config/Autoload.php");

use app\config as App;

App\Autoload::run();
App\Router::run(new App\Request());
?>

