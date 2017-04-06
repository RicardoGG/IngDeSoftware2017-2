<%-- 
    Document   : inicio
    Created on : 5/04/2017, 02:12:14 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Inicio</title>
    </head>
    <body>
        <form method="POST" action="/PrimerProyecto/login">
            <h1>Iniciar Sesion</h1>
            <input id="nombre2" name ="correo" type="text" placeholder="Correo"><br>
            <input id="nombre2" name ="passwd" type="text" placeholder="Contrasena"><br>
            <button>Aceptar</button>
        </form>
        <form method="submit" action="/PrimerProyecto/registrarse">
            <button>Registrarse</button>
        </form>
        <form method="Post" action="\PrimerProyecto\verInformacionPuesto">
            <h1>Iniciar como Visitante</h1>
            <button>Aceptar</button>
        </form>
    </body>
</html>
