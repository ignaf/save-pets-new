<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mapa Refugios</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script>
        function initMap() {

            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 13,
                center: ${direccionUsuario},
            });
            const infoWindow = new google.maps.InfoWindow();
            const icon = {
                url: "https://cdn-icons-png.flaticon.com/512/184/184197.png",
                scaledSize: new google.maps.Size(50, 50),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(0, 0),
            };
            const iconUser = {
                url: "https://static.thenounproject.com/png/331569-200.png",
                scaledSize: new google.maps.Size(50,50),
                origin: new google.maps.Point(0,0),
                anchor: new google.maps.Point(0,0),
            };
            var marker = new google.maps.Marker({
                position: ${direccionUsuario},
                map: map,
                icon: iconUser,
            });
            <c:forEach items="${refugios}" var="refugio">
            var coordenadasRefugio = ${refugio.coordenadas};
            var texto = '<a href="refugio/${refugio.nombre}"><img src="${refugio.imagen}" width=250px height=auto></a>' + '<h1>${refugio.nombre}</h1>' + '<p>Telefono:${refugio.numeroTelefono}' + '<p>Direccion:${refugio.direccion}</p>';
            var marker = new google.maps.Marker({
                position: coordenadasRefugio,
                map: map,
                info: texto,
                icon: icon,
            });

            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(this.info);
                infoWindow.open(map, this);
            })
            </c:forEach>
        }

        window.initMap = initMap;

    </script>

    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>

</head>
<body>

<%@include file="../../template/navbar.jsp"%>

<div class="container">
    <h3 class="text-center">Mapa de Refugios</h3>

    <div id="map">
        <script async
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDruCZjP_qnHh5ikKTqJWJWPAfM9CkhzIo&callback=initMap"></script>
    </div>
</div>
<%@include file="../../template/footer.jsp"%>
</body>
</html>