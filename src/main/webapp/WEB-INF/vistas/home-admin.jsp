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
            var texto = '<img src="${mascota.imagen}" width=250px height=auto>'+'<p><b>Visto por ultima vez en: ${mascota.direccion}</b></p>'+'<p>${mascota.descripcion}</p>'
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

<%@include file="../../template/navbar.jsp"%>

<%@include file="../../template/modalMensaje.jsp"%>
<div class="container">

    <div class="container mt-5">
        <div class="row row-cols-1 row-cols-md-3 g-4" style="justify-content: center">
            <div class="col">
                <div class="card h-100 border-0" style="width: 18rem;">
                    <img src="https://cdn-icons-png.flaticon.com/512/184/184197.png" class="card-img-top" alt="..."
                         width="30px" height="200px">
                    <div class="card-body text-center">
                        <a href="adminRefugio" class="btn btn-primary">Administrar Refugios</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 border-0" style="width: 18rem;">
                    <img src="https://cdn-icons-png.flaticon.com/512/3460/3460335.png" class="card-img-top" alt="..."
                         width="30px" height="200px">
                    <div class="card-body text-center">
                        <a href="adminMascota" class="btn btn-primary">Administrar Animales</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 border-0" style="width: 18rem;">
                    <img src="https://icons.iconarchive.com/icons/graphicloads/colorful-long-shadow/256/Message-icon.png"
                         class="card-img-top" alt="..."
                         width="30px" height="200px">
                    <div class="card-body text-center">
                        <a href="enviar-mensaje" class="btn btn-primary">Enviar Mensaje</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 border-0" style="width: 18rem;">
                    <img src="https://icons.iconarchive.com/icons/graphicloads/colorful-long-shadow/256/Message-icon.png"
                         class="card-img-top" alt="..."
                         width="30px" height="200px">
                    <div class="card-body text-center">
                        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                            Ver Mensajes
                        </button>
                    </div>
                </div>
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