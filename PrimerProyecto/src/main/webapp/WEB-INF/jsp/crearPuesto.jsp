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
        <title>Crear Puesto</title>
    </head>
    <body>
        <h1>Puesto Nuevo</h1>
        <form method="POST" action="/PrimerProyecto/formularioPuesto">
            <form action="." oniput="range_control_value.value = range_control.valueAsNumber"/>
            Nombre: <br> <input id="name" name="nombre" type="text" placeholder="Nombre"/><br>
            Ubicacion: <br> <input id="ubicacion" name="ubicacion" type="text" placeholder="Ubicacion" /><br>
            <button>Aceptar</button>
        </form>
    </body>
