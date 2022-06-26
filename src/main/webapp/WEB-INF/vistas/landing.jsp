<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script>
        function initMap() {

            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 10,
                center: { "lat": -34.670283, "lng": -58.5638904 },
            });
            const infoWindow = new google.maps.InfoWindow();
            const iconGato = {
                url: "https://cdn-icons-png.flaticon.com/512/616/616430.png",
                scaledSize: new google.maps.Size(50, 50),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(0, 0),
            };
            const iconPerro = {
                url: "https://cdn-icons-png.flaticon.com/512/616/616408.png",
                scaledSize: new google.maps.Size(50, 50),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(0, 0),
            };

            <c:forEach items="${listaDeMascotas}" var="mascota">
            var coordenadasMascota = ${mascota.coordenadas}
            var texto = '<img src="${mascota.imagen}" width=250px height=auto>'+'<p><b>Visto por ultima vez en: ${mascota.direccion}</b></p>'+'<p>${mascota.descripcion}</p>'
            var marker = new google.maps.Marker({
                position: coordenadasMascota,
                map: map,
                info: texto,
                icon: <c:choose><c:when test="${mascota.especie=='gato'}">
                iconGato,
                </c:when>
                <c:when test="${mascota.especie=='perro'}">
                iconPerro
                </c:when></c:choose>
            });

            google.maps.event.addListener(marker,'click',function(){
                infoWindow.setContent(this.info);
                infoWindow.open(map,this);
            })
            </c:forEach>
        }

        window.initMap = initMap;

    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Save-Pets</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
            </ul>
        </div>
    </div>
    <form class="container-fluid justify-content-end">
        <a href="login">
            <button class="btn btn-sm btn-outline-secondary" type="button">Login</button>
        </a>
        <a href="registrar-usuario">
            <button class="btn btn-sm btn-outline-secondary" type="button">Registrarse</button>
        </a>
    </form>
</nav>

	<div id="portada">
	<div id="centrado">
		<h1 id="textoGrande">Salvemos a las mascotas</h1>
		<h2 id="textoMediano" class="pt-5">Rescatemos a los animales que estan en la calle</h2>
	</div>
	</div>
	
	<div id="degrade"></div>
	
	<div id="fondoColor" class="row">
		<div class="col">
		<img src="css/Perro y gato.jpeg">
		</div>
		<div class="col mt-5">
		<div class="row mt-5">
		<h2 id="textoGrande">Inicia sesion para poder ver los animales en los refugios</h2>
		<div id="center" class="col mt-5">
		<a href="login"><button class="btn btn-outline-secondary btn-lg">Iniciar Sesion</button></a>
		</div>
		<div class="col mt-5">
		<a href="registrar-usuario"><button class="btn btn-outline-secondary btn-lg">Registrarme</button></a>
		</div>
		</div>
		</div>
	</div>
	
	<div class="row pl-3">
	
	<div id="margenIzquierdo" class="col-5">
	<img src="css/Carteles.jpg">
	</div>
	
	<div id="derecha" class="col-2">
	<img src="css/perroSolitario.jpg">
	</div>
	
	<div class="col  mt-5">
    <div id="map">
    <script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDruCZjP_qnHh5ikKTqJWJWPAfM9CkhzIo&callback=initMap"></script>
    </div>
    </div>
    </div>
    
    <hr>
    
    <div>
    <h2 id="center" class="mt-5">Mira todas las macotas registradas</h2>
    </div>
    
    <div id="imagenGrupal">
    <a href="mostrar-mascotas"><img id="huella" src="css/huella.png"></a>
    </div>
<%@include file="../../template/footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>