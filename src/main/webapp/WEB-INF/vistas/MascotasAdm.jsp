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

<div class="container mt-5">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach items="${listaDeMascotas}" var="mascota">
            <div class="col">

                <div class="card h-100" style="width: 18rem;">
                    <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                    <div class="card-body">
                        <h5 class="card-title">${mascota.nombre}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Visto por ultima vez en: ${mascota.direccion}</h6>
                        <p class="card-text">${mascota.descripcion}</p>
                        <a href="mapa-mascotas" class="btn btn-primary">Ver mapa</a>
                        <a href="asignar-refugio?id=${mascota.id}" class="btn btn-primary">Asignar Refugio</a>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</div>

<div id="cuida" class="mt-4 mb-4">
    <h1>Cuida a los animales</h1>
</div>
<div id="especialistas" class="container">
    <div class="row">
        <div class="col">
            <img src="css/Imagen1.png">
        </div>
        <div class="col">
            <img src="css/Imagen2.png">
        </div>
        <div class="col">
            <img src="css/Imagen3.png">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>