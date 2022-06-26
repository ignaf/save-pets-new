<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('input[type=text]').forEach(node => node.addEventListener('keypress', e => {
                if (e.keyCode == 13) {
                    e.preventDefault();
                }
            }))
        });</script>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Save-Pets</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
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
<div class="container mt-5">
    <c:if test="${not empty error}">
        <h4 style="color: red"><span>${error}</span></h4>
        <br>
    </c:if>
    ${msg}
    <div class="row">
    	<div class="col-5 mt-5">
    <form:form action="registrar-usuario" method="post" modelAttribute="datosRegistro">
        <div class="form-outline mb-4">
            <form:input path="email" type="email" id="email" class="form-control"/>
            <form:label class="form-label" for="email" path="email">Email</form:label>
        </div>

        <div class="form-outline mb-4">
            <form:input path="direccion" type="text" id="direccion" class="form-control"/>
            <form:label class="form-label" for="direccion" path="direccion">Direccion</form:label>
        </div>

        <div class="form-outline mb-4">
            <form:input path="clave" type="password" id="clave" class="form-control"/>
            <form:label class="form-label" for="clave" path="clave">Clave</form:label>
        </div>

        <div class="form-outline mb-4">
            <form:input path="repiteClave" type="password" id="repiteClave" class="form-control"/>
            <form:label class="form-label" for="repiteClave" path="repiteClave">Repetir clave</form:label>
        </div>

        <button type="submit" class="btn btn-primary btn-block mb-4">Registrarme</button>

        <div class="text-center">
            <p>Ya tienes una cuenta? <a href="login">Inicia sesion</a></p>
        </div>
    </form:form>
    	</div>
    <div id="marginLeft" class="col-6 ml-5">
    <img src="css/perroRegister.jpg">
    </div>

	</div>

</div>
<%@include file="../../template/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

</body>
</html>
