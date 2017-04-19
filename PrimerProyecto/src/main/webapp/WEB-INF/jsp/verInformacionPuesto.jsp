<%-- 
    Document   : verinformacionpuesto
    Created on : 5/04/2017, 08:58:16 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Informacion</title>
    </head>
    <body>
        <h1>Puestos:</h1>
        <form action="." oninput="range_control_value.value = range_control.valueAsNumber">
            <h2>
                <c:forEach var="puesto" items="${puestos}">
                    <B>Nombre: </B>${puesto.idNombre}<br>
                    <%--${puesto.horario}<br>
                    ${puesto.alimentos}<br>--%>
                    <B>Ubicacion: </B>${puesto.ubicacion}<br>
                    <br>
                </c:forEach>
            </h2>
        </form>
    </body>
</html>