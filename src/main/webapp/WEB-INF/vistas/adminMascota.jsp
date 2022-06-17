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
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="home">Save-Pets</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Refugios
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="mostrar-refugios">Ver todos</a></li>
                        <li><a class="dropdown-item" href="registrar-refugio">Registrar</a></li>
                        <li><a class="dropdown-item" href="mapa-refugios">Mapa</a></li>
                        <li><a class="dropdown-item" href="buscarRefugio">Buscador</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Pets
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="mostrar-mascotas">Ver todos</a></li>
                        <li><a class="dropdown-item" href="registrar-mascota">Registrar</a></li>
                        <li><a class="dropdown-item" href="mapa-mascotas">Mapa</a></li>
                        <li><a class="dropdown-item" href="buscarMascota">Buscador</a></li>
                    </ul>
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
<div id="centrado" class="row mt-4">
    <div class="col-5"></div>
    <div class="col"><a href="registrar-mascota" class="btn btn-primary">Nueva Mascota</a>
    </div>
    <div class="col"></div>
</div>
<div class="container mt-5">
    <div class="">
        <c:forEach items="${listaDeMascotas}" var="mascota">
            <div id="refugioAdmin" class="row mt-5">
                <div id="centrado" class="col">
                    <img src="${mascota.imagen}" alt="..." width="70px" height="50px">
                </div>
                <div id="centrado" class="col">
                    <h5 class="">${mascota.nombre}</h5>
                </div>
                <div id="centrado" class="col">
                    <h6 id="center">${mascota.direccion}</h6>
                </div>
                <div id="centrado" class="col">
                    <a href="borrar-mascota/${mascota.id}" class="btn btn-primary">Borrar Mascota</a>
                </div>
                <div id="centrado" class="col">
                    <a href="asignar-refugio?id=${mascota.id}" class="btn btn-primary">Asignar refugio</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="text-center text-dark p-3 mt-5" style="background-color: rgba(0, 0, 0, 0.2);">
    2022 Taller Web I / Ignacio Focas - Matias Cascini
</div>
</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>