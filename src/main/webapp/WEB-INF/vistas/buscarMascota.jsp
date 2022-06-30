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
</head>

<body>

<%@include file="../../template/navbar.jsp" %>
<main>

<form:form action="buscarMascota" method="POST" modelAttribute="datosMascota">
    <div class="buscar d-flex">
        <input path="nombre" name="nombre" class="form-control me-2" type="text">
        <button class="btn btn-outline-dark">Buscar</button>
    </div>
</form:form>

<div class="resultado">
    <div class="seccion_cartas">
        <c:forEach items="${listaDeMascotas}" var="mascota">
            <div class="card h-100 mt20" style="width: 18rem; background-color: rgba(0,0,0,0.1)">
                <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                <div class="card-body">
                    <div class="carta-info">
                        <div style="min-height: 130px">
                        <h5 class="card-title">${mascota.especie}</h5>
                        <h5 class="card-title">${mascota.nombre}</h5>
                        <p class="card-text">${mascota.descripcion}</p>
                        </div>
                    </div>
                    <a href="mostrar-animales" id="center" class="btn btn-dark">Saber mas</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</main>
<%@include file="../../template/footer.jsp" %>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>



