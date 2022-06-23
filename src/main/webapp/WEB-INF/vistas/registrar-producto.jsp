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
<%@include file="../../template/navbar.jsp"%>

<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form:form action="registrar-producto" method="POST" modelAttribute="datosProducto">
            <h1 id="register">Registrar Producto</h1>
            <div class="">
                <h6>Nombre</h6>
                <p>
                    <form:input placeholder="Nombre..." path="nombre" id="nombre" type="text" name="nombre"/></p>
            </div>
            <div class="">
                <h6>Descripcion</h6>
                <p><form:input placeholder="Descripcion" path="descripcion" type="text" id="descripcion" name="descripcion"/></p>
            </div>
            <div class="">
                <h6>Precio</h6>
                <p><form:input placeholder="Precio" path="precio" name="precio" id="precio" type="number"/></p>
            </div>
            <div class="">
                <h6>Animales</h6>
                <p><form:input placeholder="Animales" path="animales" name="animales" id="animales" type="text"/></p>
            </div>
            <div class="">
                <h6>Url de imagen</h6>
                <p><form:input placeholder="url de imagen" path="imagen" name="imagen" id="imagen" type="text" /></p>
            </div>
            <button class="btn btn-outline-primary" type="submit">Confirmar registro</button>
        </div>
        </form:form>
    </div>
</div>
</div>

<%@include file="../../template/footer.jsp"%>
<!--JavaScript at end of body for optimized loading-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
</html>