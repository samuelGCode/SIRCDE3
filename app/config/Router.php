<?php namespace app\config;

use app\views;

class Router{
	
	public static function run(Request $request){
		//obtener el nombre de la clase del controlador
		$controller = $request->getClassNameController() . "Controller";
		//obtener la ruta del script php del controlador
		$route = ROOT . "server/controllers" . DS . $controller . ".php";

		//capturar el metodo y los argumentos
		$method = $request->getMethodName();
		if($method == "index.php")
			$method = "index";

		$arguments = $request->getArguments();

		//si la ruta es legible y existe
		if(is_readable($route)){
			//agregar el namespace e instanciar el controlador
			$controller = "server\\controllers\\" . $controller;
			$controller = new $controller;

			//ejecutar el metodo correspondiente del controlador y 
			//se le pasan los argumentos si es que los tiene
			if(empty($arguments)){
				$datos = call_user_func(array($controller, $method));
			}else{
				$datos = call_user_func_array(array($controller, $method), $arguments);
			}
		}

		//Cargar la vista
		views\View::show($request->getControllerName(), $request->getMethodName());

	}

	//futura funcion para asignar las rutas para gestionar las peticiones en ajax 
	//por el metodo get
	public static function ajaxGet(string $route, $callback, Controller $ctrl = null){
		
	}

	//futura funcion para asignar las rutas para gestionar las peticiones en ajax 
	//por el metodo post
	public static function ajaxPost(string $route, $callback, Controller $ctrl = null){
		
	}

}


?>