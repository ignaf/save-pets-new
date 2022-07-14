<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Mensajes</h5>
                <a href="borrar-todos-mensajes">Borrar todos</a>
            </div>
            <div class="modal-body">
                <c:forEach items="${listaDeMensajes}" var="mensaje">
                    <p>${mensaje.contenido}</p><a href="borrar-mensaje/${mensaje.id}">Borrar</a>
                    <hr>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>