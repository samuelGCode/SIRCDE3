<?php namespace app\config;

use app\views;

class Router{

	private static $requests;
	
	public static function run(Request $request){

		$controller = $request->getController() . "Controller";
		$route = ROOT . "server/controllers" . DS . $controller . ".php";

		$method = $request->getMethod();
		if($method == "index.php")
			$method = "index";

		$argument = $request->getArgument();

		//Cargar vista
		views\View::show($request->getController(), $request->getMethod());

		if(is_readable($route)){
			//require_once $route;
			$mostrar = "server\\controllers\\" . $controller;
			$controller = new $mostrar;
			if(empty($argument)){
				$datos = call_user_func(array($controller, $method));
				print "hola soy la opcion 1";
			}else{
				$datos = call_user_func_array(array($controller, $method), $argument);
				print "hola soy la opcion 2";
			}
		}

	}

	public static function config(string $route, Controller $ctrl = null, $callback){
		self::$requests = array();

	}
}

?>