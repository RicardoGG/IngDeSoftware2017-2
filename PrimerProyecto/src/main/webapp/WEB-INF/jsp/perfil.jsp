<%-- 
    Document   : perfil
    Created on : 5/04/2017, 09:29:10 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Usuario</title>
    </head>
    <body>
        <h1>Bienvenido</h1> 
        <form method ="POST" action="/PrimerProyecto/cerrarSesion">
        <button> Cerrar Sesión</button>
        </form>
            <h2> 
                <br> ${nombre}
                <br> ${apellidoPat}
                <br> ${apellidoMat}
                <br> ${correo}
                </form>
            </h2>
    </body>
</html>
