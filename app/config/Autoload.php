<?php namespace app\config;

class Autoload{

	public static function run(){
		spl_autoload_register(function($class){
			//print "->".$class."<br>";
			$ruta = str_replace("\\", "/", $class) . ".php";
			include_once $ruta;
		});
	}

}

?>