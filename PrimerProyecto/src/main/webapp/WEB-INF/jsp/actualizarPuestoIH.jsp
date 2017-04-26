<%-- 
    Document   : actualizarPuestoIH
    Created on : 24/04/2017, 05:45:44 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="/PrimerProyecto/actualizar">
            <input type="hidden" name="nombreViejo" value="${nombre}">
           <!-- <h2>Nombre nuevo:  </h2>
            <input id="nombre_puesto" name ="nombre" type="text" placeholder = ${nombre}><br>
            <br>-->
            <h2>Ubicacion:  </h2>
            <input id="ubicacion_puesto" name ="ubicacion" type="text" placeholder = ${ubicacion} >

            <button class="login_button">Modificar</button>

        </form>

        <form method="POST" action="/PrimerProyecto/cancelar">
            <button class="login_button">Cancelar</button>
        </form>
    </body>
</html>
