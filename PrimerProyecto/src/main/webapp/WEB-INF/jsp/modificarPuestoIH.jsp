<%-- 
    Document   : modificarPuestoIH
    Created on : 24/04/2017, 05:43:17 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Puesto</title>
    </head>
    <body>
        <h1>Modificar Puesto:</h1>
        <h2>
            <c:forEach var="puesto" items="${puestos}">
                <B>Nombre Puesto: </B>${puesto.idNombre}<br>
                <br>
            </c:forEach>
        </h2>
                <form method="POST" action="/PrimerProyecto/editPuesto">
                    <p class="login_title">Nombre de puesto a modificar</p>
                    <input class="login_input1" id="nombre2" name ="puesto" type="text" placeholder="Nombre Puesto"><br>
                    <button class="login_button">Aceptar</button>
                </form>
    </body>
</html>
