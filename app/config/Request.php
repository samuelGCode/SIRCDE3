<?php namespace app\config;

class Request{
	private $controller;
	private $method;
	private $argument;

	public function __construct(){
		if(isset($_GET['url'])){
			$route = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);
			$route = explode('/', $route);
			$route = array_filter($route);
			print($_GET['url']);
			if($route[0] == "index.php")
				$this->controller = "home";
			else
				$this->controller = strtolower(array_shift($route));

			$this->method = strtolower(array_shift($route));
			if(empty($this->method)){
				$this->method = "index";
			}

			$this->argument = $route;
		}else{
			$this->controller = "home";
			$this->method = "index";
		}
	}
	
	public function getController(){
		return $this->controller;
	}

	public function getMethod(){
		return $this->method;
	}

	public function getArgument(){
		return $this->argument;
	}
}

?>