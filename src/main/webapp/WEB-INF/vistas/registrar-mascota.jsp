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
    <link rel="stylesheet" href="css/formulario.css">
    <script src="js/formulario.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
</head>


<body>

<%@include file="../../template/navbar.jsp" %>


<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form:form action="registrar-mascota" method="POST" modelAttribute="datosMascota" id="regForm">
                <h1 id="register">Registrar Mascota</h1>
                <div class="all-steps" id="all-steps">
                    <span class="step text-center"><i class="bi bi-geo-alt-fill"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-justify-left"></i></span>
                    <span class="step text-center"><i class="bi bi-image"></i></span>
                </div>
                <div class="tab">
                    <h6>Direccion</h6>
                    <p>
                        <form:input placeholder="Direccion..." path="direccion" id="direccion" type="text"
                                    oninput="this.className = ''" name="direccion"/></p>

                </div>
                <div class="tab">
                    <h6>Especie</h6>
                    <p><form:select path="especie" id="direccion" oninput="this.className = ''" name="especie">
                        <form:option value="perro">Perro</form:option>
                        <form:option value="gato">Gato</form:option>
                    </form:select></p>

                </div>
                <div class="tab">
                    <h6>Sabes su nombre?</h6>
                    <p><form:input placeholder="Nombre" path="nombre" name="nombre"
                                   id="nombre" type="text" oninput="this.className = ''"/></p>

                </div>
                <div class="tab">
                    <h6>Ingresa una breve descripcion</h6>
                    <p><form:textarea path="descripcion" name="descripcion" rows="5" cols="30" id="descripcion"
                                      oninput="this.className = ''"/></p>
                </div>
                <div class="tab">
                    <h6>Sabes su raza?</h6>
                    <p><form:input placeholder="Raza" path="raza" name="raza" id="raza"
                                   type="text" oninput="this.className = ''"/></p>
                </div>
                <div class="tab">
                    <h6>Tipo de pelaje</h6>
                    <p><form:select path="pelaje" id="pelaje" oninput="this.className = ''" name="pelaje">
                        <form:option value="" selected="true" disabled="disabled"> </form:option>
                        <form:option value="sin pelo">Sin pelo</form:option>
                        <form:option value="corto">Pelo Corto</form:option>
                        <form:option value="largo">Pelo Largo</form:option>
                        <form:option value="rizado">Pelo Rizado</form:option>
                    </form:select></p>

                </div>
                <div class="tab">
                    <h6>Url Imagen</h6>
                    <p><form:input placeholder="url imagen" path="imagen" name="imagen" id="imagen"
                                   type="text" oninput="this.className = ''"/></p>
                </div>

                <div class="thanks-message text-center" id="text-message"><img src="https://i.imgur.com/O18mJ1K.png"
                                                                               width="100" class="mb-4">
                    <h3>Gracias por registrar la mascota!</h3> <span>Registrando animales estas ayudando a que puedan encontrar un nuevo hogar, o que vuelvan al suyo los que se perdieron</span><br>
                    <button class="btn btn-outline-primary" type="submit">Confirmar registro</button>
                </div>
                <div style="overflow:auto;" id="nextprevious" class="mt-2">
                    <div style="float:right;">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)"><i
                                class="bi bi-chevron-double-left"></i></button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)"><i
                                class="bi bi-chevron-double-right"></i></button>
                    </div>
                </div>
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



