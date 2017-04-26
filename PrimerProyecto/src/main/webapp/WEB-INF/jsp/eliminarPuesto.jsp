<%-- 
    Document   : eliminarPuesto
    Created on : 23-abr-2017, 22:31:40
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <title>Eliminar Puesto</title>
    </head>
    <body class="bgimage">
        <div class="header">
            <p class="title_page">Eliminar Puesto</p>
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
        <h2>
            <div class="titles">
               <c:forEach var="puesto" items="${puestos}">
                  <B >Nombre Puesto: </B>${puesto.idNombre}<br>
                  <br>
              </c:forEach>  
            </div>

        </h2>
                <form method="POST" action="/PrimerProyecto/eliminarPuesto">
                    <p class="title_page">Nombre de puesto a eliminar</p>
                    <input class="login_input1" id="nombre2" name ="puesto" type="text" placeholder="Nombre Puesto"><br>
                    <button class="login_button" style="color: white">Aceptar</button>
                </form>        </div>
        </div>
        
        

    </body>
</html>
