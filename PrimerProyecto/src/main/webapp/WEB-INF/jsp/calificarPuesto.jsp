<%-- 
    Document   : crearPuesto
    Created on : 5/04/2017, 09:05:38 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calificar Puesto</title>
    </head>
    <body>
        <h1>Calificar</h1>
        <form method="POST" action="/PrimerProyecto/calificacionPuesto">
            <form action="." oniput="range_control_value.value = range_control.valueAsNumber"/>
            Nombre: <br> <input id="name" name="nombre" type="text" placeholder="Nombre"/><br>
            Calificacion: <br> <input id="calificacion" name="calificacion" type="text" placeholder="calificacion" /><br>
        </form>
            <form method="POST" action="/PrimerProyecto/calificarPuesto"> <button>Aceptar</button></form>
    </body>
