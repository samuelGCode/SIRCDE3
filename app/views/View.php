<?php namespace app\views;

use app\controllers as ctrl;

class View{

	public static function show($controller, $method){
		$layoutPath = ROOT . "views/layout.html";
		$pagePath = ROOT . "views/pages/" . $controller . DS . $method . ".html";

		if(!ctrl\SessionController::authenticate())
			$pagePath = ROOT . "views/pages/403.html";
		else{
			if(!file_exists($pagePath))
				$pagePath = ROOT . "views/pages/404.html";
		}

		$readyView = file_get_contents($layoutPath);
		$readyView = str_replace("%content-wrapper%", file_get_contents($pagePath), $readyView);

		echo $readyView;
	}

}

?>