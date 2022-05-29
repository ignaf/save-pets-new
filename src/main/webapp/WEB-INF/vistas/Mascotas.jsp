<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body  id="body_patas">

<nav>
    <div id="navegador" class="row">
        <div class="col"><a href="home"><h1>Save-Pets</h1></a></div>
        <div id="nav_item" class="col"><a href="mostrar-mascotas"><h5>Mascotas</h5></a></div>
        <div id="nav_item" class="col"><a href="registrar-mascota"><h5>Registrar mascota</h5></a></div>
        <div id="nav_item" class="col"><a href="mostrar-refugios"><h5>Refugios</h5></a></div>
        <div id="nav_item" class="col"><a href="registrar-refugio"><h5>Registrar refugio</h5></a></div>
        <div id="nav_item" class="col"><a href="mapa-mascotas"><h5>Mapa Mascotas</h5></a></div>
        <div id="nav_item" class="col"><a href="mapa-refugios"><h5>Mapa Refugios</h5></a></div>
        <div id="botones_home" class="col">
            <a href="registrar-usuario"><button class="btn btn-outline-primary">Registrarme</button></a>
            <a href="login"><button class="btn btn-outline-primary">Login</button></a>
        </div>
    </div>
</nav>
<div id="seccion_cartas">
    <c:forEach items="${listaDeMascotas}" var="mascota">
        <div id="cartas" class="card" style="width: 18rem;">
            <img src="${mascota.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
            <div class="card-body">
                <h5 class="card-title">${mascota.especie}</h5>
                <h5 class="card-title">${mascota.nombre}</h5>
                <p class="card-text">${mascota.descripcion}</p>
                <a href="mostrar-animales" class="btn btn-primary">Saber mas</a>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>