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
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach items="${listaDeRefugios}" var="refugio">
            <div class="col">

                <div class="card h-100" style="width: 18rem; background-color: rgba(0,0,0,0.1);">
                    <img src="${refugio.imagen}" class="card-img-top" alt="..." width="30px" height="200px">
                    <div class="card-body">
                        <div style="min-height: 110px">
                        <h5 class="card-title">${refugio.nombre}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${refugio.direccion}</h6>
                        <p class="card-text">Capacidad maxima: ${refugio.capMax}</p>
                        </div>
                        <a href="animales-refugio/${refugio.id}" class="btn btn-outline-dark">Ver animales</a>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</div>
</main>
<%@include file="../../template/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>