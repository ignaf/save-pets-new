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
<%@include file="../../template/navbar.jsp" %>

<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form:form action="registrar-refugio" method="post" modelAttribute="datosRefugio">
                <h1>Registrar Refugio</h1>
                <div>
                    <h6>Nombre</h6>
                    <p>
                        <form:input type="text" path="nombre" class="form-control" name="nombre" id="nombre" placeholder="Nombre"/></p>
                </div>
                <div>
                    <h6>Direccion</h6>
                    <form:input type="text" path="direccion" class="form-control" name="direccion" id="direccion" placeholder="Direccion"/>
                </div>
                <div>
                    <h6>Numero de telefono</h6>
                    <form:input type="number" path="numeroTelefono" class="form-control" name="numeroTelefono" id="numeroTelefono" placeholder="Numero de telefono"/>
                </div>
                <div>
                    <h6>Capacidad maxima</h6>
                    <form:input type="number" path="capmax" class="form-control" name="capmax" id="capmax" placeholder="Capacidad maxima"/>
                </div>
                <div>
                    <h6>URL de imagen</h6>
                    <form:input type="text" path="urlimagen" class="form-control" name="urlimagen" id="urlimagen" placeholder="Url imagen"/>
                </div>
                <button class="btn btn-outline-primary mt-2" type="submit">Confirmar registro</button>
            </form:form>
        </div>
    </div>
</div>

<%@include file="../../template/footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
</html>