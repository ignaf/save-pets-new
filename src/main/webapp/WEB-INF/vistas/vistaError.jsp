<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
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
                        <li><a class="dropdown-item" href="../mapa-mascotas">Mapa Todas Las Mascotas</a></li>
                        <li><a class="dropdown-item" href="../mapa-mascotas-cercanas">Mapa Mascotas Cercanas</a></li>
                        <li><a class="dropdown-item" href="../buscarMascota">Buscador</a></li>
                    </ul>
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
    <div class="center titulo"><c:if test="${not empty error}">
        <h4 style="color: red"><span>${error}</span></h4>
        <br>
    </c:if>
        <a href="../home" class="btn btn-secondary">Ir a Home</a>
    </div>

</main>
<%@include file="../../template/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>