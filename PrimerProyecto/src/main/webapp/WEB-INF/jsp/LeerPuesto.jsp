<%-- 
    Document   : LeerPuesto
    Created on : 20/04/2017, 08:01:31 AM
    Author     : Manuel & Servando
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leer Puesto</title>
    </head>
    <body>
        <h1>A continuacion se muestra la lista de puestos que hay:</h1>
        <c:forEach var="puesto" items="${puestos}">
            ${puesto.idNombre}<br>
        </form>
        </c:forEach>
    </body>
</html>
