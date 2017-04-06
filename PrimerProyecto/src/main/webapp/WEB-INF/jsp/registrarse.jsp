<%-- 
    Document   : registrarse
    Created on : 5/04/2017, 08:51:21 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro</h1>
        <form method="submit" action="/PrimerProyecto/formulario?">
            <form action="." oniput="range_control_value.value = range_control.valueAsNumber"/>
            Nombre: <br> <input id="name" name="nombre" type="text" placeholder="Nombre"/><br>
            Telefono: <br> <input id="telefono" name="telefono" type="number" placeholder="Telefono"><br>
            Email: <br> <input id="email" name="email" type="text" placeholder="Correo"/><br>
            Contraseña <br> <input id="password" name="password" type="text" placeholder="Contrasena" /><br>
            <button>Aceptar</button>
        </form>
    </body>
</html>
