<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>

<body >

<%@include file="../../template/navbar.jsp"%>

<div id="headerMascotas">
	<h1 id="tituloRefugios">Ayudanos a salvarlos</h1>
</div>

<div id="degrade-body">

<div class="container mt-5">
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
        <c:forEach items="${listaDeMascotas}" var="mascota">
            <div id="transition" class="col">
                <div id="columnaMascota"  class="card h-100" style="width: 18rem;">
                    <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                    <div class="card-body">
                    	<div id="tarjetasAlto">
                        <c:if test="${empty mascota.refugio}">
        				<h5 id="center" class="card-title" style="color: red">MASCOTA PERDIDA</h5>
    					</c:if>
        				<h5 id="center"class="card-title" >${mascota.nombre}</h5>
        				</div>
                        <c:if test="${not empty mascota.refugio}">
        				<h6 class="card-subtitle mb-2 text-muted">Refugio: ${mascota.refugio.nombre}</h6>
        				<h6 class="card-subtitle mb-2 text-muted">Direccion: ${mascota.refugio.direccion}</h6>
    					</c:if>
    					<c:if test="${empty mascota.refugio}">
        				<h6 class="card-subtitle mb-2 text-muted">Visto por ultima vez en: ${mascota.direccion}</h6>
    					</c:if>
                        <p class="card-text">Descripcion: ${mascota.descripcion}</p>
                        <div id="center" class="mt-4">
                        <c:if test="${empty mascota.refugio}">
        				<a href="mapa-mascotas" class="btn btn-primary">Ver mapa</a>
    					</c:if>
    					</div>
    					<div id="center" class="mt-4">
    					<c:if test="${not empty mascota.refugio}">
        				<a href="animales-refugio/${mascota.refugio.id}" class="btn btn-primary">Ver Refugio</a>
    					</c:if>
    					</div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@include file="../../template/footer.jsp"%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>