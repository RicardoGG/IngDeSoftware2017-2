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
        <link rel="stylesheet" type="text/css" href="css/general_style.css">
        <link rel="stylesheet" type="text/css" href="css/registro.css">
        <title>Registro</title>
    </head>
    <body class="bgimage">
        <div class="box">
            <p class="register_title">Iniciar Sesion</p>
            <form method="POST" action="/PrimerProyecto/formulario">
                <form action="." oniput="range_control_value.value = range_control.valueAsNumber"/>
                <p class="texts">Nombre:</p> <br><input class="register_input" id="name" name="nombre" type="text" placeholder="Nombre"/><br>
                <p class="texts">Apellido Paterno: </p><br> <input id="paterno" class="register_input" name="paterno" type="text" placeholder="apPaterno"><br>
                <p class="texts">Apellido Materno: </p><br> <input id="materno" class="register_input" name="materno" type="text" placeholder="apMaterno"><br>
                <p class="texts">Email: </p><br> <input id="email" name="email" class="register_input" type="text" placeholder="Correo"/><br>
                <p class="texts">Contraseña </p><br> <input id="password" class="register_input" name="password" type="password" placeholder="Contrasena" /><br>
                <button class="register_button">Aceptar</button>
            </form>    
        </div>
        
    </body>
</html>
