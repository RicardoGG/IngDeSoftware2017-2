<%-- 
    Document   : AdministradorIH
    Created on : 20/04/2017, 09:03:48 AM
    Author     : jchav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
    </head>
    <body>
        <h1>Lista de Puestos:</h1>
       <form method="submit" action="/PrimerProyecto/ActualizarPuestoIH">
        <c:forEach var="puesto" items="${p}">
            ${puesto.nombre}
            <button>Actualizar</button>
        </form>
        </c:forEach>
            
    </body>
</html>
