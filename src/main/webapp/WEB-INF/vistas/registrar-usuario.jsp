<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body id="body_registro">

<div class="contenedor">
    <h1 id="Titulo">Bienvenidos</h1>
    <form:form action="registrarme" method="POST" modelAttribute="datosRegistro">
    <div id="Login2">
        <i class="material-icons medium">account_circle</i>
        <h3 id="caja">Usuario:<form:input path="email" id="email" class="form-control"/></h3>
        <h3 id="caja">Contrese?a:<form:input path="clave" type="password" id="password" class="form-control"/></h3>
        <h3 id="caja">Repetir contrase?a:<form:input path="repiteClave" type="password" id="password" class="form-control"/></h3>
        <button id="Boton" class="btn btn-lg btn-primary btn-block" Type="Submit"/>Registrarme</button>
        </form:form>
        <c:if test="${not empty error}">
            <h4><span>${error}</span></h4>
            <br>
        </c:if>
    </div>
</div>
</div>



<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>