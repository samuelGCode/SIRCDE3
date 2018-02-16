<?php namespace app\config;

class Request{
	private $controller; //controlador
	private $method; //metodo
	private $argument; //argumentos

	public function __construct(){
		//capturar la ruta por metodo GET
		if(isset($_GET['url']))
			$route = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);
		//capturar la ruta por metodo POST
		if(isset($_POST['url']))
			$route = filter_input(INPUT_POST, 'url', FILTER_SANITIZE_URL);

		if(!empty($route)){
			//desglosar la ruta en un array
			$route = explode('/', $route);
			$route = array_filter($route);

			//capturar el nombre del controlador de la ruta y convertilo en minuscula
			if($route[0] == "index.php")
				$this->controller = "inicio";
			else
				$this->controller = strtolower(array_shift($route));

			//capturar el metodo
			$this->method = strtolower(array_shift($route));
			if(empty($this->method)){
				$this->method = "index";
			}

			//capturar los argumentos
			$this->argument = $route;
		}else{
			//en caso de no obtener ninguna ruta
			$this->controller = "inicio";
			$this->method = "index";
		}
	}
	
	//para que el enrutador obtenga el nombre del controlador
	public function getControllerName(){
		return $this->controller;
	}

	//para que el enrutador obtenga el nombre de la clase del controlador
	public function getClassNameController(){
		//se crea un auxiliar del nombre delcontrolador
		//y se convierte el primer caracter en mayuscula
		$className = $this->controller;
		$className[0] = strtoupper($className[0]);

		//se busca todas las coincidencias del caracter "-" para
		//luego convertir en mayuscula el caracter posterior y
		//por ultimo reemplazar todas las coincidencias del caracter "-"
		$count = substr_count($className, "-");
		for ($i=0; $i <= $count; $i++) { 
			$pos = strpos($className, "-");
			if($pos !== FALSE){
				$className[$pos + 1] = strtoupper($className[$pos + 1]);
				$className = preg_replace("/-/", "", $className, 1);
			}
		}

		return $className;
	}

	//para que el enrutador obtenga el nombre del metodo
	public function getMethodName(){
		return $this->method;
	}

	//para que el enrutador obtenga el nombre de los argumentos
	public function getArguments(){
		return $this->argument;
	}
}

?>