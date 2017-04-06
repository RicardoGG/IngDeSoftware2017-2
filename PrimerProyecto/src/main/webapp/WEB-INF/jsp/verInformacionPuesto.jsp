<%-- 
    Document   : verinformacionpuesto
    Created on : 5/04/2017, 08:58:16 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Informacion</title>
    </head>
    <body>
        <h1>Puestos:</h1>
        <form action="." oninput="range_control_value.value = range_control.valueAsNumber">
            <h2> <br> ${nombre}<br>
                ${horario}<br>
                ${alimentos}<br>
                ${ubicacion}<br>
                </form<
            </h2>
    </body>
</html>