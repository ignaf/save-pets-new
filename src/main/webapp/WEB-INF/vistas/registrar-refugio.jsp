<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
</head>

<nav>
    <div id="navegador" class="row">
        <div class="col"><a href="home"><h1>Save-Pets</h1></a></div>
        <div id="nav_item" class="col"><a href="mostrar-mascotas"><h3>Mascotas</h3></a></div>
        <div id="nav_item" class="col"><a href="registrar-mascota"><h3>Registrar mascota</h3></a></div>
        <div id="nav_item" class="col"><a href="mostrar-refugios"><h3>Refugios</h3></a></div>
        <div id="nav_item" class="col"><a href="registrar-refugio"><h3>Registrar refugio</h3></a></div>
        <div id="nav_item" class="col"><a href="mapa-mascotas"><h3>Mapa Mascotas</h3></a></div>
        <div id="nav_item" class="col"><a href="mapa-refugios"><h3>Mapa Refugios</h3></a></div>
        <div id="botones_home" class="col">
            <a href="registrar-usuario"><button class="btn btn-outline-primary">Registrarme</button></a>
            <a href="login"><button class="btn btn-outline-primary">Login</button></a>
        </div>
    </div>
</nav>

<body  id="body_patas">

<div id="formulario" class="" >
    <h4 id="titulo"	>REGISTRAR REFUGIO</h4>
    <form:form action="registrar-refugio" method="POST" modelAttribute="datosRefugio" class="col s12">
        <div id="formulario_fila" class="row">
            <div class="col">
                <form:input placeholder="Nombre" path="nombre" name="nombre" id="nombre" type="text" class="form-control me-2" required="true"/>
            </div>
        </div>
        <div id="formulario_fila" class="row">
            <div class="col">
                <form:input placeholder="Direccion" path="direccion" name="direccion" id="direccion" type="text" class="form-control me-2" required="true"/>
            </div>
        </div>
        <div id="formulario_fila" class="row">
            <div class="col">
                <form:input placeholder="Numero de telefono" path="numeroTelefono" name="numeroTelefono" id="numeroTelefono" type="number" class="form-control me-2" required="true"/>
            </div>
        </div>
        <div id="formulario_fila" class="row">
            <div class="col">
                <form:input placeholder="Capacidad Maxima" path="capmax" name="capmax" id="capmax" type="number" class="form-control me-2" required="true"/>
            </div>
        </div>
        <div id="formulario_fila" class="row">
            <div class="col">
                <form:input placeholder="Imagen" path="urlimagen" name="urlimagen" id="urlimagen" type="text" class="form-control me-2" required="true"/>
            </div>
        </div>

        <div id="boton_formulario" class="row-8">
            <div class="col">
                <button class="btn btn-outline-primary" type="submit">Enviar</button>
            </div>
        </div>
    </form:form>
</div>


<c:if test="${not empty error}">
    <h4><span>${error}</span></h4>
    <br>
</c:if>
</div>
<!--JavaScript at end of body for optimized loading-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


</body>
</html>