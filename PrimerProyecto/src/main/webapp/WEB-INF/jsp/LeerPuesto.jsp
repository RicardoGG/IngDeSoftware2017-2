<%-- 
    Document   : LeerPuesto
    Created on : 20/04/2017, 08:01:31 AM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leer Puesto</title>
    </head>
    <body>
        <h1>A cotinuacion se muestra la lista de puestos que hay:</h1>
        <form method="submit" action="/PrimerProyecto/verInformacionPuesto">
        <c:forEach var="puesto" items="${l}">
            ${puesto.nombre}
            <button>Ver</button>
        </form>
        </c:forEach>
    </body>
</html>
