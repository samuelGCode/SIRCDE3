function fotoCiudadano(){
	var cxt1 = canvas1.getContext("2d");
	var cxt2 = canvas2.getContext("2d");
	var cxt3 = canvas3.getContext("2d");
	canvas1 = document.getElementById("canvas1");
	canvas2 = document.getElementById("canvas2");
	canvas3 = document.getElementById("canvas3");
	video1 = document.getElementById("video1");
	video2 = document.getElementById("video2");
	video3 = document.getElementById("video3");

	if(!navigator.getUserMedia)
		navigator.getUserMedia = navigator.webkitGetUserMedia || 
	navigator.mozGetUserMedia || 
	navigator.msGetUserMedia;
	if(!window.URL)
		window.URL = window.webkitURL;

	if (navigator.getUserMedia) {
		navigator.getUserMedia({
			"video" : true,
			"audio": false
		}, function(stream) {
			video1.src = window.URL.createObjectURL(stream);
			video2.src = window.URL.createObjectURL(stream);
			video3.src = window.URL.createObjectURL(stream);
			video1.play();
			video2.play();
			video3.play();

		},function(err){
			console.log("Ocurrió el siguiente error: " + err);
		});
	}
	else{
		alert("getUserMedia no disponible");
		return;
	}

// Evento click para capturar una foto.
$("#foto1").click(function() {
	cxt1.drawImage(video1, 0, 0, 250, 200);
});
// Evento click para capturar una foto.
$("#foto2").click(function() {
	cxt2.drawImage(video2, 0, 0, 250, 200);
});
// Evento click para capturar una foto.
$("#foto3").click(function() {
	cxt3.drawImage(video3, 0, 0, 250, 200);
});

// Evento click para enviar la foto al servidor.
$("#guardar").click(function() {
	var data = canvas1.toDataURL("image/jpeg");

	// Separamos el "data:image/jpeg;base64,"
	//var info = data.split(",", 2);
	var info = data.replace('data:image/jpeg;base64,', '');
	var data = "data=" + info;
	$.ajax({
		type : "POST",
		url : "../Controller/guardar_foto_frente.php",
		data : data,
		success : function(data) {
		//alert(data);
	}
});
});
// Evento click para enviar la foto al servidor.
$("#guardar").click(function() {
	var data2 = canvas2.toDataURL("image/jpeg");
	

	// Separamos el "data:image/jpeg;base64,"
	//var info = data.split(",", 2);
	var info2 = data2.replace('data:image/jpeg;base64,', '');
	var data = "data=" + info2;
	$.ajax({
		type : "POST",
		url : "../Controller/guardar_foto_perfil_derecho.php",
		data : data,
		success : function(data) {
					//alert(data);
					
				}
			});
});
// Evento click para enviar la foto al servidor.
$("#guardar").click(function() {
	var data3 = canvas3.toDataURL("image/jpeg");
	

	// Separamos el "data:image/jpeg;base64,"
	//var info = data.split(",", 2);
	var info3 = data3.replace('data:image/jpeg;base64,', '');
	var data = "data=" + info3;
	$.ajax({
		type : "POST",
		url : "../Controller/guardar_foto_perfil_izquierdo.php",
		data : data,
		success : function(data) {
					//alert(data);
					
				}
			});
});
}
