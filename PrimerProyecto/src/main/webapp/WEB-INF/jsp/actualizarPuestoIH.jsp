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
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <title>JSP Page</title>
    </head>
    <body class="bgimage">
        <div class="header">
            <p class="title_page">Modificando puesto</p>
        </div>
        <div style="height: 90%;width: 100%; position: relative">
        <div class="sidemenu">
                <img class="logo" src="css/logo.png">

                <form method="submit" action="/PrimerProyecto/crearPuesto">
                    <button>Crear Puesto</button>
                </form>

                <form method="submit" action="/PrimerProyecto/leerPuesto">
                    <button>Ver Puestos</button>
                </form>

                <form method="submit" action="/PrimerProyecto/modificarPuesto">
                    <button>Modificar Puesto</button>
                </form>
                
                <form method="POST" action="/PrimerProyecto/elimPuest">
                    <button>Eliminar Puesto</button>
                </form>

                <form method ="POST" action="/PrimerProyecto/cerrarSesion">
                    <button> Cerrar Sesión</button>
                </form>
        </div>     
        <div class="content">
            <form method="POST" action="/PrimerProyecto/actualizar">
                <div class="titles">
                    <input type="hidden" name="nombreViejo" value="${nombre}">
                    <h2>Nombre nuevo:  </h2>
                    <input id="nombre_puesto" name ="nombre" type="text" placeholder = ${nombre}><br>
                    <br>
                    <h2>Ubicacion:  </h2>
                    <input id="ubicacion_puesto" name ="ubicacion" type="text" placeholder = ${ubicacion} >         
                </div>
           

                <button class="login_button" style="color: white;">Modificar</button>

            </form>

            <form method="POST" action="/PrimerProyecto/cancelar">
                <button class="login_button"style="color: white;">Cancelar</button>
            </form>
        </div>
        </div>

        
    </body>
</html>
