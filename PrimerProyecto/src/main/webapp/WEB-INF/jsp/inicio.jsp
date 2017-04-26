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
        <link rel="stylesheet" type="text/css" href="css/Inicio.css">
        <link rel="stylesheet" type="text/css" href="css/general_style.css">
    </head>
    <div class="blur">
    <body class="bgimage" style="display: table">
        <div class="box1">
        <form method="POST" action="/PrimerProyecto/login">
            <p class="login_title">Iniciar Sesion</p>
            <input class="login_input1" id="nombre2" name ="correo" type="text" placeholder="Correo"><br>
            <input class="login_input2" id="nombre2" name ="password" type="password" placeholder="Contrasena"><br>
            <button class="login_button">Entrar</button>
        </form>
        </div>
                
        <div class="box2"> 
            <div class="first_half" >
               <img class="image1" src="css/foto1.jpg"/> 
               <form method="submit" style="z-index: 3; position: relative; width: 100%; height: 100%; display: block;"  action="/PrimerProyecto/registrarse"> 
                    <button class="button_image">Registrarse</button>
                </form>    
            </div>  
            <div class="second_half">
                <img class="image2" src="css/foto2.jpg"/> 
                <form method="submit" style="z-index: 3; position: relative; width: 100%; height: 100%; display: block;" action="/PrimerProyecto/verInformacion">
                    <button class="button_image">Visitante</button>
                </form>    
            </div>    
        </div>
        
        <div class="footer">Aquí ira la información del equipo y el logo.</div>
        
    </body>
    </div>
</html>
