<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" initial-scale=1.0>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

</head>

<body>

<%@include file="../../template/navbar.jsp"%>
<div class="container mt-5">
    <form:form action="enviar-mensaje" method="POST" modelAttribute="datosMensaje">
        <div class="form-group">
            <form:label for="idDestinatario" path="idDestinatario">Seleccione el destinatario:</form:label>
            <form:select class="form-control" path="idDestinatario" id="idDestinatario" name="idDestinatario">
                <c:forEach items="${usuarios}" var="usuario">
                    <form:option value="${usuario.id}">${usuario.email}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group mt-2">
            <form:label for="contenido" path="contenido">Mensaje:</form:label>
            <form:textarea class="form-control" path="contenido" name="contenido" rows="5" cols="30" id="contenido"/>
        </div>
        <button class="btn btn-outline-primary mt-2" type="submit">Enviar</button>
    </form:form>
</div>

<%@include file="../../template/footer.jsp"%>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</html>

