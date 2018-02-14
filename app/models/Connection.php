<?php namespace app\models;

class Connection(){

	private $datos = array(
		"host" => "localhost",
		"user" => "root",
		"pass" => "",
		"db" => "belbox"
	);
	private $con;

	public function __construct(){
		$this->con = new \mysqli($this->datos['host'], 
			$this->datos['user'], $this->datos['pass'],
			$this->datos['db']);

		/* verificar la conexión */
		if (mysqli_connect_errno()) {
			printf("Falló la conexión failed: %s\n", $this->con->connect_error);
			exit();
		}
	}

	public function consultaSimple($sql){
		$this->con->query($sql);
	}

	public function consultaRetorno($sql){
		$datos = $this->con->query($sql);
		return $datos;
	}
}

?>