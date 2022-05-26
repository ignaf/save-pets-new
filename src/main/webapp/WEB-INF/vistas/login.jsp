	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- Bootstrap core CSS
	    <link href="css/bootstrap.min.css" rel="stylesheet" >
	    <link href="css/bootstrap-theme.min.css" rel="stylesheet">-->
	</head>

	<body id="body">
    <div class="contenedor">
        <h1 id="Titulo">Bienvenidos</h1>
        <form:form action="validar-login" method="POST" modelAttribute="datosLogin">
        <div id="Login">
        <i class="material-icons medium">account_circle</i>  
        <h3>Usuario:<form:input path="email" id="email" class="form-control" /></h3>
        <h3>Contese�a:<form:input path="password" type="password" id="password" class="form-control"/></h3>
        <button id="Boton" class="btn btn-lg btn-primary btn-block" Type="Submit"/>Login</button>
       	<p id="NoCuenta"><b>�Aun no tenes cuenta?</b></p>
        <a href="registrar-usuario"	><b>Registrarme</b></a>
        <a href="mostrar-refugios"	><b>Refugios</b></a>
        </div>
        </form:form>
				<%--Bloque que es visible si el elemento error no esta vacio--%>
				<c:if test="${not empty error}">
			        <h4><span>${error}</span></h4>
			        <br>
		        </c:if>
				${msg}
	</div>

		
		
		
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script>
		<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	</body>
</html>
