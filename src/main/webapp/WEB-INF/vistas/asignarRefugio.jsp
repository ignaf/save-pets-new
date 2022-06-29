<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>

<body>

<%@include file="../../template/navbar.jsp"%>
<main>
<div class="container mt-5">
    <div class="">
        <c:forEach items="${refugios}" var="refugio">
            <div id="refugioAdmin" class="row mt-5">
                <div id="centrado" class="col">
                    <img src="${refugio.imagen}" alt="..." width="70px" height="50px">
                </div>
                <div id="centrado" class="col">
                    <h5 class="">${refugio.nombre}</h5>
                </div>
                <div id="centrado" class="col">
                    <h6 id="center">${refugio.direccion}</h6>
                </div>
                <div id="centrado" class="col">
                    <h6 class="">Capacidad maxima: ${refugio.capMax}</h6>
                </div>
                <div id="centrado" class="col">
                    <form:form action="asignar-refugio" method="post" modelAttribute="DatosMascota">
                        <input type="hidden" name="id" value="${mascota}">
                        <input type="hidden" name="refugioId" value="${refugio.id}">
                        <input type="submit" value="SELECCIONAR">
                    </form:form>
                </div>

            </div>
        </c:forEach>
    </div>
</div>

<div id="cuida" class="mt-4 mb-4">
    <h1>Cuida a los animales</h1>
</div>
<div id="especialistas" class="container">
    <div class="row">
        <div class="col">
            <img src="css/Imagen1.png">
        </div>
        <div class="col">
            <img src="css/Imagen2.png">
        </div>
        <div class="col">
            <img src="css/Imagen3.png">
        </div>
    </div>
</div>
</main>
<%@include file="../../template/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>