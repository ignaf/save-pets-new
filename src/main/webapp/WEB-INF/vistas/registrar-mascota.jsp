<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
</head>

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

<body id="body_patas">
<div id="formulario">
    <h4 id="titulo">REGISTRAR MASCOTA</h4>
    <form:form class="col s12" action="registrar-mascota" method="POST" modelAttribute="datosMascota">
            <div id="formulario_fila" class="row">
                <div class="col">
                    <form:input path="direccion" type="text" name="direccion" class="validate" required="true"/>
                    <form:label for="direccion" path="direccion">Direccion</form:label>
                </div>
            </div>

            <div id="formulario_fila" class="row">
                <div class="col">
                    <form:select path="especie" class="validate" name="especie" required="true">
                        <form:option value="perro">Perro</form:option>
                        <form:option value="gato">Gato</form:option>
                    </form:select>
                    <form:label path="especie" for="especie">Seleccione uno</form:label>
                </div>
            </div>

        <div id="formulario_fila" class="row">
            <div class="col">
                    <form:input path="nombre" type="text" name="nombre" />
                    <form:label for="nombre" path="nombre">Sabes su nombre?</form:label>
                </div>
            </div>

        <div id="formulario_fila" class="row">
            <div class="col">
                    <form:textarea path = "descripcion" name="descripcion" rows = "5" cols = "30" />
                    <form:label for="descripcion" path="descripcion">Ingresa una breve descripcion:</form:label>
                </div>
            </div>

        <div id="formulario_fila" class="row">
            <div class="col">
                    <form:input path="raza" type="text" name="raza" />
                    <form:label for="raza" path="raza">Sabes su raza?</form:label>
                </div>
            </div>

        <div id="formulario_fila" class="row">
            <div class="col">
                    <form:select path="pelaje" name="pelaje" >
                        <form:option value="" selected="true" disabled="disabled"> </form:option>
                        <form:option value="sin pelo">Sin pelo</form:option>
                        <form:option value="corto">Pelo Corto</form:option>
                        <form:option value="largo">Pelo Largo</form:option>
                        <form:option value="rizado">Pelo Rizado</form:option>
                    </form:select>
                    <form:label path="pelaje" for="pelaje">Seleccione uno</form:label>
                </div>
            </div>

        <div id="boton_formulario" class="row-8">
            <div class="col">
                <button class="btn btn-outline-primary" type="submit">Enviar</button>
            </div>
        </div>
    </form:form>
    <c:if test="${not empty error}">
        <h4><span>${error}</span></h4>
        <br>
    </c:if>
</div>
<!--JavaScript at end of body for optimized loading-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    $(document).ready(function(){
        $('select').formSelect();
    });
</script>

</body>
</html>



