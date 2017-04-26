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
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <title>Calificar Puesto</title>
    </head>
    <body class="bgimage">
        <div class="header">
            <p class="title_page">Crear Puesto</p>
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
                <form method="POST" action="/PrimerProyecto/formularioPuesto">
                    <form action="." oniput="range_control_value.value = range_control.valueAsNumber"/>
                    <div class="titles">
                    Nombre: <br> <input id="name" name="nombre" type="text" placeholder="Nombre"/><br>
                    Ubicacion: <br> <input id="ubicacion" name="ubicacion" type="text" placeholder="Ubicacion" /><br>
                    </div>
                    <button style="color: white">Aceptar</button>
                </form>
            </div>
        </div>
 
    </body>
