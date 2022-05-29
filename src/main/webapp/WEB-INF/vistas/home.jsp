<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
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
            const icon = {
                url: "https://cdn-icons-png.flaticon.com/512/3460/3460335.png",
                scaledSize: new google.maps.Size(50,50),
                origin: new google.maps.Point(0,0),
                anchor: new google.maps.Point(0,0),
            };

            <c:forEach items="${listaDeMascotas}" var="mascota">
            var coordenadasMascota = ${mascota.coordenadas}
            var texto = '<h1>${mascota.especie}</h1>'+'<p>${mascota.direccion}</p>'

            var marker = new google.maps.Marker({
                position: coordenadasMascota,
                map: map,
                info: texto,
                icon: icon,
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

<nav>
    <div id="navegador" class="row">
        <div class="col"><a href="home"><h1>Save-Pets</h1></a></div>
        <div id="nav_item" class="col"><a href="mostrar-mascotas"><h5>Mascotas</h5></a></div>
        <div id="nav_item" class="col"><a href="registrar-mascota"><h5>Registrar mascota</h5></a></div>
        <div id="nav_item" class="col"><a href="mostrar-refugios"><h5>Refugios</h5></a></div>
        <div id="nav_item" class="col"><a href="registrar-refugio"><h5>Registrar refugio</h5></a></div>
        <div id="nav_item" class="col"><a href="mapa-mascotas"><h5>Mapa Mascotas</h5></a></div>
        <div id="nav_item" class="col"><a href="mapa-refugios"><h5>Mapa Refugios</h5></a></div>
        <div id="botones_home" class="col">
            <a href="registrar-usuario"><button class="btn btn-outline-primary">Registrarme</button></a>
            <a href="login"><button class="btn btn-outline-primary">Login</button></a>
        </div>
    </div>
</nav>

<div class="row">
    <div id="menu-lateral"class="col-3">
        <ul>
            <ul><b>Mascotas</b></ul>
            <a href="buscarMascota"><li>Buscar por nombre</li></a>
            <a href="buscarMascota"><li>Buscar por tipo</li></a>
            <a href="buscarMascota"><li>Buscar por raza</li></a>
            <ul><b>Refugios</b></ul>
            <a href="buscarRefugio"><li>Buscar por nombre</li></a>
            <a href="buscarRefugio"><li>Buscar por barrio</li></a>
        </ul>
    </div>
    <div class="col-9">
        <h3 id="titulo_mapa">Mapa de mascotas</h3>
        <div id="map">
            <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDruCZjP_qnHh5ikKTqJWJWPAfM9CkhzIo&callback=initMap"></script>
        </div>
    </div>
</div>
<h2 id="titulo_index_refugios">Nuestro refugios</h2>
<div id="seccion" class="container">
    <div class="row">
        <div class="col">
            <div id="seccion_cartas">
                <c:forEach items="${listaDeRefugios}" var="refugio">
                    <div id="cartas" class="card" style="width: 18rem;">
                        <img src="${refugio.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                        <div class="col card-body">
                            <h5 class="card-title">${refugio.nombre}</h5>
                            <h5 class="card-title">${refugio.direccion}</h5>
                            <p class="card-text">Capacidad maxima: ${refugio.capMax}</p>
                            <a href="mostrar-animales" class="mt-2 btn btn-primary">Ver animales</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="center">
    <a href="mostrar-refugios">Ver todos</a>
</div>
<h2 id="titulo_index_refugios">Mascotas disponibles</h2>
<div id="seccion" class="container">
    <div class="row">
        <div class="col">
            <div id="seccion_cartas">
                <c:forEach items="${listaDeMascotas}" var="mascota">
                    <div id="cartas" class="card" style="width: 18rem;">
                        <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                        <div class="col card-body">
                            <h5 class="card-title">${mascota.especie}</h5>
                            <h5 class="card-title">${mascota.nombre}</h5>
                            <p class="card-text">${mascota.descripcion}</p>
                            <a href="mostrar-animales" class="mt-2 btn btn-primary">Saber mas</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="center">
    <a href="mostrar-mascotas">Ver todos</a>
</div>
<footer>
    <div class="row">
        <div class="col">
            <p id="footer">Grupo 1 - Matias Cascini / Focas Ignacio</p>
        </div>
    </div>

</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</html>