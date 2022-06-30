<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
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
            <button class="btn btn-sm btn-outline-secondary" type="button" style="margin-left: 10px">Registrarse</button>
        </a>
    </form>
</nav>
<main style="position:relative">
    <img src="css/perroRegisterRight.png" alt="" class="fondologin">
<div class="cardlogin">
    <c:if test="${not empty error}">
        <h4 style="color: red"><span>${error}</span></h4>
        <br>
    </c:if>
    ${msg}
    <h2 class="titulologin">Iniciar Sesion</h2>
    <form:form action="validar-login" method="post" modelAttribute="datosLogin">
        <div class="form-outline mb-4">
            <form:label class="form-label" for="email" path="email">Email</form:label>
            <form:input path="email" type="email" id="email" class="form-control"/>
        </div>

        <div class="form-outline mb-4">
            <form:label class="form-label" for="password" path="password">Clave</form:label>
            <form:input path="password" type="password" id="password" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-outline-dark btn-block mb-4" style="margin-left: 293px;">Ingresar</button>

        <div class="text-center">
            <p>No tienes una cuenta? <a href="registrar-usuario">Registrate</a></p>
        </div>
    </form:form>
</div>


</main>
<%@include file="../../template/footer.jsp"%>
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

</body>
</html>
