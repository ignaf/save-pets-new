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
</head>

<body>

<%@include file="../../template/navbar.jsp" %>
<main>
    <div class="container">
        <div class="row">
            <div id="marginRight" class="col-2 mt-4 mr-5">
                <form:form class="col" action="buscarMascota" method="POST" modelAttribute="datosMascota">
                    <div id="buscar" class="mt-3 ml-2">
                        <div class="col">
                            <div class="row mt-3">
                                <h4 class="center">Busca una mascota</h4>
                            </div>
                            <div class="row mt-3">
                                <input placeholder="especie" path="especie" name="especie" class="form-control me-2" type="text">
                            </div>
                            <div class="row mt-3">
                                <input placeholder="descripcion" path="descripcion" name="descripcion" class="form-control me-2" type="text">
                            </div>
                            <div class="row mt-3">
                                <input placeholder="direccion" path="direccion" name="direccion" class="form-control me-2" type="text">
                            </div>
                            <div class="row mt-3">
                                <input placeholder="raza" path="raza" name="raza" class="form-control me-2" type="text">
                            </div>
                            <div class="row mt-3">
                                <input placeholder="pelaje" path="pelaje" name="pelaje" class="form-control me-2" type="text">
                            </div>
                            <button id="botonBuscar" class="btn btn-outline-primary mt-3">Buscar</button>
                        </div>
                    </div>
                </form:form>
            </div>

            <div class="col">
                <div class="row">
                    <c:if test="${empty listaDeMascotas}">
                        <div class="col-8">
                            <h1 class="card-subtitle mb-2 text-muted mt-5" style="padding-left:20%">Busca en nuestros mascotas registradas</h1>
                        </div>
                    </c:if>
                    <c:forEach items="${listaDeMascotas}" var="mascota">
                        <div  class="col-4 mt-4" style="padding-left:10%">
                            <div   class="card h-100" style="width: 18rem; background-color: rgba(0,0,0,0.1);">
                                <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                                <div class="card-body">
                                    <div id="tarjetasAlto">
                                        <c:if test="${empty mascota.refugio}">
                                            <h5  class="card-title center" style="color: red">MASCOTA PERDIDA</h5>
                                        </c:if>
                                        <h5 class="card-title center" >${mascota.nombre}</h5>
                                    </div>
                                    <c:if test="${not empty mascota.refugio}">
                                        <h6 class="card-subtitle mb-2 text-muted">Refugio: ${mascota.refugio.nombre}</h6>
                                        <h6 class="card-subtitle mb-2 text-muted">Direccion: ${mascota.refugio.direccion}</h6>
                                    </c:if>
                                    <c:if test="${empty mascota.refugio}">
                                        <h6 class="card-subtitle mb-2 text-muted">Visto por ultima vez en: ${mascota.direccion}</h6>
                                    </c:if>
                                    <p class="card-text">Descripcion: ${mascota.descripcion}</p>
                                    <div class="mt-4 center">
                                        <c:if test="${empty mascota.refugio}">
                                            <a href="mapa-mascotas" class="btn btn-primary">Ver mapa</a>
                                        </c:if>
                                    </div>
                                    <div class="mt-4 center">
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
        </div>
    </div>
</main>
<%@include file="../../template/footer.jsp" %>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>



