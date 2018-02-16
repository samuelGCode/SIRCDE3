<?php namespace app\views;

use app\controllers as ctrl;

class View{

	private static $layoutOption = "top-nav";

	public static function show($controller, $method){
		$layoutPath = ROOT . "app/views/layout-" . self::$layoutOption . ".html";
		$menuPath = ROOT . "app/views/menu-" . self::$layoutOption . ".html";
		$pagePath = ROOT . "app/views/pages/" . $controller . DS . $method . ".html";
		$modalsPath = ROOT . "app/views/pages/" . $controller . DS . "modals.html";

		if(!ctrl\SessionController::authenticate()){
			$pagePath = ROOT . "app/views/pages/error/403.html";
		}else{
			if(!file_exists($pagePath))
				$pagePath = ROOT . "app/views/pages/error/404.html";
		}

		$layoutView = file_get_contents($layoutPath);
		$menuView = file_get_contents($menuPath);
		$pageView = file_get_contents($pagePath);

		$layoutView = str_replace("%menu%", $menuView, $layoutView);
		$layoutView = str_replace("%content-wrapper%", $pageView, $layoutView);

		if(file_exists($modalsPath)){
			$modalsView = file_get_contents($modalsPath);
			$layoutView = str_replace("%modals%", $modalsView, $layoutView);
		}

		echo $layoutView;
	}

	public static function setLayoutOption($name){
		self::$layoutOption = $name;
	}

	private static function drawMenu($menuView, $privileges){

	}

}

?>