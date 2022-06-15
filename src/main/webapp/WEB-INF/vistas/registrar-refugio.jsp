<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/formulario.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="js/formulario.js"></script>
</head>

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

<body>

<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form:form action="registrar-refugio" method="POST" modelAttribute="datosRefugio" id="regForm">
                <h1 id="register">Registrar Refugio</h1>
                <div class="all-steps" id="all-steps">
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-geo-alt-fill"></i></span>
                    <span class="step text-center"><i class="bi bi-telephone-fill"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-image"></i></span>
                </div>
                <div class="tab">
                    <h6>Nombre</h6>
                    <p>
                        <form:input placeholder="Nombre..." path="nombre" id="nombre" type="text" oninput="this.className = ''" name="nombre"/></p>

                </div>
                <div class="tab">
                    <h6>Direccion</h6>
                    <p><form:input placeholder="Direccion" path="direccion" type="text" id="direccion" oninput="this.className = ''" name="direccion"/></p>

                </div>
                <div class="tab">
                    <h6>Numero de telefono</h6>
                    <p><form:input placeholder="Numero de telefono" path="numeroTelefono" name="numeroTelefono"
                                   id="numeroTelefono" type="number" oninput="this.className = ''"/></p>

                </div>
                <div class="tab">
                    <h6>Capacidad maxima</h6>
                    <p><form:input placeholder="Capacidad maxima" path="capmax" name="capmax" id="capmax" type="number" oninput="this.className = ''" /></p>
                </div>
                <div class="tab">
                    <h6>Url de imagen</h6>
                    <p><form:input placeholder="url de imagen" path="urlimagen" name="urlimagen" id="urlimagen" type="text" oninput="this.className = ''" /></p>
                </div>


                <div class="thanks-message text-center" id="text-message"> <img src="https://i.imgur.com/O18mJ1K.png" width="100" class="mb-4">
                    <h3>Gracias por registrar el refugio!</h3> <span>Seguir sumando refugios nos ayuda a encontrar lugar para mas animales</span>
                    <br><button class="btn btn-outline-primary" type="submit">Confirmar registro</button>
                </div>
                <div style="overflow:auto;" id="nextprevious" class="mt-2">
                    <div style="float:right;">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)"><i class="bi bi-chevron-double-left"></i></button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)"><i class="bi bi-chevron-double-right"></i></button> </div>
                </div>
            </form:form>
        </div>
    </div>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
</html>