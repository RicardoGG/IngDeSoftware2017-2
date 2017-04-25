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
        <link rel="stylesheet" type="text/css" href="css/administrador.css">
    </head>

    <body>
        <div class="box">
            <p class="titles" <h1>Lista de Puestos:</h1> </p>
        <div class="blur">
        <div class="zoom">    <body class="bgcolor" style="display: table">

                <form method="submit" action="/PrimerProyecto/ActualizarPuestoIH">
                    <c:forEach var="puesto" items="${puestos}">
                        ${puesto.idNombre}
                        <%-- <button>Actualizar</button> Para asociar cada voton a un solo puesto--%>
                        <br>
                    </c:forEach>
                </form>
                
                
        </div>
    </div>
        </div> 
              <form method ="POST" action="/PrimerProyecto/cerrarSesion">
                <button> Cerrar Sesión</button>
              </form>
        
        <br>
        <form method="POST" action="/PrimerProyecto/elimPuest">
            <button>Eliminar Puesto</button>
        </form>
  
        <form method="submit" action="/PrimerProyecto/crearPuesto">
            <button>Crear Puesto</button>
        </form>
        
        <form method="submit" action="/PrimerProyecto/leerPuesto">
            <button>Ver Puestos</button>
        </form>
        
        <form method="submit" action="/PrimerProyecto/modificarPuesto">
            <button>Modificar Puesto</button>
        </form>
        

</body>
</html>
