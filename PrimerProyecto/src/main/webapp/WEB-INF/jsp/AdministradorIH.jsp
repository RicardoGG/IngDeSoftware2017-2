<%-- 
    Document   : AdministradorIH
    Created on : 20/04/2017, 09:03:48 AM
    Author     : jchav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>

    
    <body class="bgimage">
        <div class="header">
            <p class="title_page">Home de Administración</p>
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
            <p class="welcome">¡Bienvenido!</p>
        </div>
        </div>
        
        
        

</body>
</html>
