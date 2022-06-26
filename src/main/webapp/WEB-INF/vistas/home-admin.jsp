<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
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
                zoom: 13,
                center: ${direccionUsuario},
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
            const iconUser = {
                url: "https://static.thenounproject.com/png/331569-200.png",
                scaledSize: new google.maps.Size(50, 50),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(0, 0),
            };
            var marker = new google.maps.Marker({
                position: ${direccionUsuario},
                map: map,
                icon: iconUser,
            });

            <c:forEach items="${listaDeMascotas}" var="mascota">
            var coordenadasMascota =
            ${mascota.coordenadas}
            var texto = '<a href="pet/${mascota.id}"><img src="${mascota.imagen}" width=250px height=auto></a>' + '<p><b>Visto por ultima vez en: ${mascota.direccion}</b></p>' + '<p>${mascota.descripcion}</p>'
            var marker = new google.maps.Marker({
                position: coordenadasMascota,
                map: map,
                info: texto,
                icon: <c:choose><c:when test="${mascota.especie=='gato'}">
                iconGato
                </c:when>
                <c:when test="${mascota.especie=='perro'}">
                iconPerro
                </c:when></c:choose>
            });

            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(this.info);
                infoWindow.open(map, this);
            })
            </c:forEach>
        }

        window.initMap = initMap;

    </script>
</head>
<body>

<%@include file="../../template/navbar.jsp"%>

<%@include file="../../template/modalMensaje.jsp"%>
<div class="container">

    <div class="container mt-5">
        <div class="row" style="justify-content: center">
            <div id="adminIcono" class="col">
            <a href="adminRefugio">
                <div class="">
                    <img id="iconoLeft" src="css/Casa.png" alt="...">
                    <div class="text-center">
                        <h4>Administrar refugios</h4>
                    </div>
                </div>
            </a>
            </div>
            

            <div id="adminIcono" class="col">
			<a href="adminMascota">
                <div class="">
                    <img id="iconoLeft" src="css/Mascota.png" alt="...">
                    <div class="text-center">
                        <h4>Administrar mascotas</h4>
                    </div>
                </div>
			</a>
            </div>

            <div id="adminIcono" class="col">
            <a href="enviar-mensaje">
                <div class="">
                    <img id="iconoLeft" src="css/Mensaje.png" alt="...">
                    <div class="text-center">
                        <h4>Enviar Mensaje</h4>
                    </div>
                </div>
            </a>
            </div>
        </div>
    </div>
    
    
    
    
    
    <h3 class="text-center mt-2">Mapa de Pets</h3>

    <div id="map">
        <script async
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDruCZjP_qnHh5ikKTqJWJWPAfM9CkhzIo&callback=initMap"></script>
    </div>
</div>
<%@include file="../../template/footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>