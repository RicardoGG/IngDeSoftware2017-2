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
        <form method="POST" action="/PrimerProyecto/datosPuesto">
            
            <h2>Nombre:</h2> <br>
            <textarea name="nombre"></textarea>
            <br>
            <h2>Ubicacion: </h2> <br>
            <textarea name="ubicacion"></textarea>


        </form>
        
        <form method="POST" action="/PrimerProyecto/cancelar">
            <button class="login_button">Cancelar</button>
        </form>
    </body>
</html>
