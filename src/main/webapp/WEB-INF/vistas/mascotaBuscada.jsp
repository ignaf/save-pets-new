<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
</head>

<body id="body_patas">

<%@include file="../../template/navbar.jsp"%>
<form:form action="buscarMascota" method="POST" modelAttribute="datosMascota">
    <div id="buscar" class="d-flex">
        <button id="boton_buscar" class="btn btn-outline-primary">Buscar</button>
        <input path="nombre" name="nombre" class="form-control me-2" type="text">
    </div>
</form:form>
<div id="resultado">
<div id="seccion_cartas">
    <c:forEach items="${listaDeMascotas}" var="mascota">
        <div id="cartas" class="card" style="width: 18rem;">
            <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
            <div class="card-body">
                <h5 class="card-title">${mascota.especie}</h5>
                <h5 class="card-title">${mascota.nombre}</h5>
                <p class="card-text">${mascota.descripcion}</p>
                <a href="mostrar-animales" id="center" class="btn btn-primary">Saber mas</a>
            </div>
        </div>
    </c:forEach>
</div>
</div>

</body>
<%@include file="../../template/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</html>



