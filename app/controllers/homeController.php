<?php namespace app\controllers;

class homeController{


	public function __construct(){
	}

	public function index(){
		//print "ejecutando controlador: homeController <br>";
	}

	public function view(){
		//print "prueba -> ver numero: " . $num . "<br>";
	}



	public function agregar(){
		if(!$_POST){
			$datos = $this->seccion->listar();
			return $datos;
		}else{
			$permitidos = array("image/jpeg", "image/png", "image/gif", "image/jpg");
			$limite = 700;
			if(in_array($_FILES['imagen']['type'], $permitidos) && $_FILES['imagen']['size'] <= $limite * 1024){
				$nombre = date('is') . $_FILES['imagen']['name'];
				$ruta = "Views" . DS . "template". DS . "imagenes" . DS . "avatars" . DS . $nombre;
				move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);
				$this->estudiante->set("nombre", $_POST['nombre']);
				$this->estudiante->set("edad", $_POST['edad']);
				$this->estudiante->set("promedio", $_POST['promedio']);
				$this->estudiante->set("imagen", $nombre);
				$this->estudiante->set("id_seccion", $_POST['id_seccion']);
				$this->estudiante->add();
				header("Location: " . URL . "estudiantes");
			}
		}
	}

	public function editar($id){
		if(!$_POST){
			$this->estudiante->set("id", $id);
			$datos = $this->estudiante->view();
			return $datos;
		}else{
			$this->estudiante->set("id", $_POST['id']);
			$this->estudiante->set("nombre", $_POST['nombre']);
			$this->estudiante->set("edad", $_POST['edad']);
			$this->estudiante->set("promedio", $_POST['promedio']);
			$this->estudiante->set("id_seccion", $_POST['id_seccion']);
			$this->estudiante->edit();
			header("Location: " . URL . "estudiantes");
		}
	}

	public function listarSecciones(){
		$datos = $this->seccion->listar();
		return $datos;
	}

	public function ver($id){
		$this->estudiante->set("id",$id);
		$datos = $this->estudiante->view();
		return $datos;
	}

	public function eliminar($id){
		$this->estudiante->set("id",$id);
		$this->estudiante->delete();
		header("Location: " . URL . "estudiantes");
	}
}

?>