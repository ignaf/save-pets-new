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
</head>


<body>

<%@include file="../../template/navbar.jsp" %>


<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form:form action="registrar-mascota" method="post" modelAttribute="datosMascota">
               <h1 id="register">Registrar Pet</h1>
                <div>
                    <h6>Direccion</h6>
                    <p>
                    <form:input type="text" path="direccion" class="form-control" name="direccion" id="direccion" placeholder="Direccion"/></p>
                </div>
                <div>
                    <h6>Seleccionar especie</h6>
                    <form:select class="form-control" path="especie" name="especie" id="pelaje">
                        <form:option value="perro">Perro</form:option>
                        <form:option value="gato">Gato</form:option>
                    </form:select>
                </div>
                <div>
                    <h6>Nombre</h6>
                    <form:input type="text" path="nombre" class="form-control" name="nombre" id="nombre" placeholder="Nombre"/>
                </div>
                <div>
                    <h6>Descripcion</h6>
                    <form:textarea path="descripcion" class="form-control" id="descripcion" name="descripcion" rows="3"></form:textarea>
                </div>
                <div>
                    <h6>Sabes su raza?</h6>
                    <form:input type="text" path="raza" class="form-control" name="raza" id="raza" placeholder="Raza"/>
                </div>
                <div>
                    <h6>Seleccionar tipo de pelaje</h6>
                    <form:select class="form-control" path="pelaje" name="pelaje" id="pelaje">
                        <form:option value="" selected="true" disabled="disabled">-----</form:option>
                        <form:option value="sin pelo">Sin pelo</form:option>
                        <form:option value="corto">Pelo Corto</form:option>
                        <form:option value="largo">Pelo Largo</form:option>
                        <form:option value="rizado">Pelo Rizado</form:option>
                    </form:select>
                </div>
                <div>
                    <h6>URL de imagen</h6>
                    <form:input type="text" path="imagen" class="form-control" name="imagen" id="imagen" placeholder="Url imagen"/>
                </div>
                <button class="btn btn-outline-primary mt-2" type="submit">Confirmar registro</button>
            </form:form>
        </div>
    </div>
</div>

<%@include file="../../template/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $('select').formSelect();
    });
</script>

</body>
</html>



