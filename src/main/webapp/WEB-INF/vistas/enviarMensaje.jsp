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
                    <ul class="dropdown-menu" style="overflow: hidden" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="mostrar-refugios">Ver todos</a></li>
                        <li><a class="dropdown-item" href="mapa-refugios">Mapa</a></li>
                        <li><a class="dropdown-item" href="buscarRefugio">Buscador</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Pets
                    </a>
                    <ul class="dropdown-menu" style="overflow: hidden" aria-labelledby="navbarDropdownMenuLink">
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
        <a href="logout">
            <button class="btn btn-sm btn-outline-secondary" type="button">Cerrar sesion</button>
        </a>
    </form>
</nav>
<div class="container mt-5">
    <form:form action="enviar-mensaje" method="POST" modelAttribute="datosMensaje">
        <div class="form-group">
            <form:label for="idDestinatario" path="idDestinatario">Seleccione el destinatario:</form:label>
            <form:select class="form-control" path="idDestinatario" id="idDestinatario" name="idDestinatario">
                <c:forEach items="${usuarios}" var="usuario">
                    <form:option value="${usuario.id}">${usuario.email}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group mt-2">
            <form:label for="contenido" path="contenido">Mensaje:</form:label>
            <form:textarea class="form-control" path="contenido" name="contenido" rows="5" cols="30" id="contenido"/>
        </div>
        <button class="btn btn-outline-primary mt-2" type="submit">Enviar</button>
    </form:form>
</div>

<footer class="text-center text-white" style="background-color: #f1f1f1;">
    <div class="container pt-4">
        <section class="mb-4">
            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="#!"
                    role="button"
                    data-mdb-ripple-color="dark"
            ><i class="bi bi-facebook"></i
            ></a>
            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="#!"
                    role="button"
                    data-mdb-ripple-color="dark"
            ><i class="bi bi-twitter"></i
            ></a>
            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="#!"
                    role="button"
                    data-mdb-ripple-color="dark"
            ><i class="bi bi-whatsapp"></i
            ></a>

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="#!"
                    role="button"
                    data-mdb-ripple-color="dark"
            ><i class="bi bi-instagram"></i
            ></a>
        </section>
    </div>
    <div class="text-center text-dark p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        2022 Taller Web I / Ignacio Focas - Matias Cascini
    </div>
</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>

