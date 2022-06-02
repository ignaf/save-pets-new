<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
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
<div id="seccion" class="container">
    <div class="row">
        <div class="col">
<div id="seccion_cartas">
      <c:forEach items="${listaDeRefugios}" var="refugio">
        <div id="cartas" class="card" style="width: 18rem;">
  			<img src="${refugio.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
  			<div class="card-body">
    		<h5 class="card-title">${refugio.nombre}</h5>
    		<h5 class="card-title">${refugio.direccion}</h5>
    		<p class="card-text">Capacidad máxima: ${refugio.capMax}</p>
    		<a href="mostrar-animales" class="btn btn-primary">Ver animales</a>
  			</div>
		</div>
	  </c:forEach>
    </div>
      			</div>
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
			
<footer id="footer">
    <div class="row pt-3">
        <div class="col-5">
            <i class="bi bi-whatsapp"></i><a href="#">Contactanos por Wpp</a>
            <i class="bi bi-instagram"></i><a href="#">Seguinos en instragram</a>
        </div>

        <div class="col-5">
            <i class="bi bi-twitter"></i><a href="#">Seguinos en twitter</a>
            <i class="bi bi-facebook"></i><a href="#">Seguinos en facebook</a>
            </div>
        </div>
    </div>
<div id="center" class="row mt-4 mb-2">
            <p>Grupo 1 - Matias Cascini / Focas Ignacio</p>
</div>
</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        </body>

        </html>