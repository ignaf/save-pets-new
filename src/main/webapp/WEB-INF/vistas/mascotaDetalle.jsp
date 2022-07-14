<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="../home">Save-Pets</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../home">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Refugios
                    </a>
                    <ul class="dropdown-menu" style="overflow: hidden" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="../mostrar-refugios">Ver todos</a></li>
                        <li><a class="dropdown-item" href="../mapa-refugios">Mapa</a></li>
                        <li><a class="dropdown-item" href="../buscarRefugio">Buscador</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Pets
                    </a>
                    <ul class="dropdown-menu" style="overflow: hidden" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="../mostrar-mascotas">Ver todos</a></li>
                        <li><a class="dropdown-item" href="../registrar-mascota">Registrar</a></li>
                        <li><a class="dropdown-item" href="../mapa-mascotas">Mapa</a></li>
                        <li><a class="dropdown-item" href="../buscarMascota">Buscador</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../tienda">Tienda</a>
                </li>

            </ul>
        </div>
    </div>
    <form class="container-fluid justify-content-end">
        <a href="../logout">
            <button class="btn btn-sm btn-outline-secondary" type="button">Cerrar sesion</button>
        </a>

    </form>
</nav>
<main>
    <div class="card mb-3 card-detalle">
        <img class="card-img-top img-detalle" src="${mascota.imagen}" >
        <div class="card-body">
            <c:if test="${empty mascota.refugio}">
                <h5  class="card-title center" style="color: red">MASCOTA PERDIDA</h5>
            </c:if>
            <h5 class="card-title">Nombre: ${mascota.nombre}</h5>
            <c:if test="${not empty mascota.refugio}">
                <h6 class="card-subtitle mb-2 text-muted">Refugio: ${mascota.refugio.nombre}</h6>
                <h6 class="card-subtitle mb-2 text-muted">Direccion: ${mascota.refugio.direccion}</h6>
            </c:if>
            <p class="card-text">Descripcion: ${mascota.descripcion}</p>
            <p class="card-text">Especie: ${mascota.especie}</p>
            <p class="card-text">Raza: ${mascota.raza}</p>
            <c:if test="${empty mascota.refugio}">
                <p class="card-text">Visto por ultima vez en: ${mascota.direccion}</p>
            </c:if>
            <p class="card-text">Tipo de pelaje: ${mascota.pelaje}</p>
        </div>
    </div>
</main>
<%@include file="../../template/footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</html>