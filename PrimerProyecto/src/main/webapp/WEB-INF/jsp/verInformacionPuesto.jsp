<%-- 
    Document   : verinformacionpuesto
    Created on : 5/04/2017, 08:58:16 PM
    Author     : Manuel & Servando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Informacion</title>

        <style type="text/css">
            html, body{ height: 100%; margin: 0; padding: 0;}
            #map {height: 100%; top: 0%; margin-left: 25%; margin-right: 25%; margin-top: 2%; margin-bottom: 2% }
        </style>

    </head>
    <body>
        <h1>Puestos:</h1>

        <form action="." oninput="range_control_value.value = range_control.valueAsNumber">
            <h2>
                <c:forEach var="puesto" items="${puestos}">
                    <B>Nombre: </B>${puesto.idNombre}<br>
                        <%--${puesto.horario}<br>
                        ${puesto.alimentos}<br>--%>
                    <B>Ubicacion: </B>${puesto.ubicacion}<br>
                    <br>
                </c:forEach>
            </h2>
        </form>

        <!-- MAPA -->
        <div id = "map"></div>

        <script type="text/javascript">
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 19.323909, lng: -99.179915},
                    zoom: 19,
                    mapTypeId: 'hybrid',
                    heading: 270,
                    tilt: 45,
                    streetViewControl: false,
                    scrollwheel: false,
                    rotateControl: false,
                    labels: true
                });

                // Marcador para la cafeteria.
                var marker1 = new google.maps.Marker({
                    position: {lat: 19.324494, lng: -99.179411},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                    title: 'Cafeteria_Ciencias'
                });

                var cafeteriaCiencias = new google.maps.InfoWindow({
                    content: 'Cafeteria Ciencias'
                });

                marker1.addListener('mouseover', function () {
                    cafeteriaCiencias.open(map, marker1);
                });
                
                marker1.addListener('mouseout', function () {
                    cafeteriaCiencias.close();
                });
                
                // Marcador para el puesto de doña Ali.
                var marker2 = new google.maps.Marker({
                    position: {lat: 19.324315, lng: -99.179227},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Doña Ali'
                });

                var donaAli = new google.maps.InfoWindow({
                    content: 'Doña Ali'
                });

                marker2.addListener('mouseover', function () {
                    donaAli.open(map, marker2);
                });
                
                marker2.addListener('mouseout', function () {
                    donaAli.close();
                });
                
                // Marcador para el puesto de Harry el sucio.
                var marker3 = new google.maps.Marker({
                    position: {lat: 19.32438, lng: -99.179114},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Harry el sucio'
                });

                var harry = new google.maps.InfoWindow({
                    content: 'Harry el sucio'
                });

                marker3.addListener('mouseover', function () {
                    harry.open(map, marker3);
                    this.document.window.alert("ola k ase :V ");
                    console.log("aqui toy")
                });
                
                marker3.addListener('mouseout', function () {
                    harry.close();
                });
                
                // Marcador para el anexo de Harry el sucio.
                var marker4 = new google.maps.Marker({
                    position: {lat: 19.324324, lng: -99.179125},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Harry el sucio 2'
                });

                var harry2 = new google.maps.InfoWindow({
                    content: 'Harry el sucio anexo'
                });

                marker4.addListener('mouseover', function () {
                    harry2.open(map, marker4);
                });
                
                marker4.addListener('mouseout', function () {
                    harry2.close();
                });
                
                // Marcador para el pusto de los hot dogs y helados.
                var marker5 = new google.maps.Marker({
                    position: {lat: 19.324335, lng: -99.179144},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Salchichas'
                });

                var salchichas = new google.maps.InfoWindow({
                    content: 'Salchichas'
                });

                marker5.addListener('mouseover', function () {
                    salchichas.open(map, marker5);
                });
                
                marker5.addListener('mouseout', function () {
                    salchichas.close();
                });

                // Marcador para el pusto de sushi.
                var marker6 = new google.maps.Marker({
                    position: {lat: 19.324392, lng: -99.179159},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Sushi'
                });

                var sushi = new google.maps.InfoWindow({
                    content: 'Sushi'
                });

                marker6.addListener('mouseover', function () {
                    sushi.open(map, marker6);
                });
                
                marker6.addListener('mouseout', function () {
                    sushi.close();
                });
                
                // Marcador para el puesto de garnachas.
                var marker7 = new google.maps.Marker({
                    position: {lat: 19.324388, lng: -99.179224},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Garnachas'
                });

                var garnachas = new google.maps.InfoWindow({
                    content: 'Garnachas'
                });

                marker7.addListener('mouseover', function () {
                    garnachas.open(map, marker7);
                });
                
                marker7.addListener('mouseout', function () {
                    garnachas.close();
                });
                
                // Marcador para el puesto 1.
                var marker8 = new google.maps.Marker({
                    position: {lat: 19.323244, lng: -99.180625},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 1'
                });

                var puesto1 = new google.maps.InfoWindow({
                    content: 'Puesto 1'
                });

                marker8.addListener('mouseover', function () {
                    puesto1.open(map, marker8);
                });
                
                marker8.addListener('mouseout', function () {
                    puesto1.close();
                });
                
                // Marcador para el puesto 2.
                var marker9 = new google.maps.Marker({
                    position: {lat: 19.323275, lng: -99.180684},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 2'
                });

                var puesto2 = new google.maps.InfoWindow({
                    content: 'Puesto 2'
                });

                marker9.addListener('mouseover', function () {
                    puesto2.open(map, marker9);
                });
                
                marker9.addListener('mouseout', function () {
                    puesto2.close();
                });
                
                // Marcador para el puesto 3.
                var marker10 = new google.maps.Marker({
                    position: {lat: 19.323313, lng:  -99.180737},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 3'
                });

                var puesto3 = new google.maps.InfoWindow({
                    content: 'Puesto 3'
                });

                marker10.addListener('mouseover', function () {
                    puesto3.open(map, marker10);
                });
                
                marker10.addListener('mouseout', function () {
                    puesto3.close();
                });
                
                // Marcador para el puesto 4.
                var marker11 = new google.maps.Marker({
                    position: {lat: 19.323367, lng:  -99.180766},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 4'
                });

                var puesto4 = new google.maps.InfoWindow({
                    content: 'Puesto 4'
                });

                marker11.addListener('mouseover', function () {
                    puesto4.open(map, marker11);
                });
                
                marker11.addListener('mouseout', function () {
                    puesto4.close();
                });
                
                // Marcador para el puesto 5.
                var marker12 = new google.maps.Marker({
                    position: {lat: 19.323401, lng:   -99.180771},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 5'
                });

                var puesto5 = new google.maps.InfoWindow({
                    content: 'Puesto 5'
                });

                marker12.addListener('mouseover', function () {
                    puesto5.open(map, marker12);
                });
                
                marker12.addListener('mouseout', function () {
                    puesto5.close();
                });
                
                // Marcador para el puesto 6.
                var marker13 = new google.maps.Marker({
                    position: {lat: 19.323428, lng: -99.180775},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 6'
                });

                var puesto6 = new google.maps.InfoWindow({
                    content: 'Puesto 6'
                });

                marker13.addListener('mouseover', function () {
                    puesto6.open(map, marker13);
                });
                
                marker13.addListener('mouseout', function () {
                    puesto6.close();
                });
                
                // Marcador para el puesto 7.
                var marker14 = new google.maps.Marker({
                    position: {lat: 19.323453, lng: -99.180769},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 7'
                });

                var puesto7 = new google.maps.InfoWindow({
                    content: 'Puesto 7'
                });

                marker14.addListener('mouseover', function () {
                    puesto7.open(map, marker14);
                });
                
                marker14.addListener('mouseout', function () {
                    puesto7.close();
                });
                
                // Marcador para el puesto 8.
                var marker15 = new google.maps.Marker({
                    position: {lat: 19.323485, lng: -99.180771},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 8'
                });

                var puesto8 = new google.maps.InfoWindow({
                    content: 'Puesto 8'
                });

                marker15.addListener('mouseover', function () {
                    puesto8.open(map, marker15);
                });
                
                marker15.addListener('mouseout', function () {
                    puesto8.close();
                });
                
                // Marcador para el puesto 9.
                var marker16 = new google.maps.Marker({
                    position: {lat: 19.323525, lng: -99.180743},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'Puesto 9'
                });

                var puesto9 = new google.maps.InfoWindow({
                    content: 'Puesto 9'
                });

                marker16.addListener('mouseover', function () {
                    puesto9.open(map, marker16);
                });
                
                marker16.addListener('mouseout', function () {
                    puesto9.close();
                });
                
                // Marcador para el puesto 10.
                var marker17 = new google.maps.Marker({
                    position: {lat: 19.323734, lng: -99.180331},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/purple-dot.png',
                    title: 'Puesto 10'
                });

                var puesto10 = new google.maps.InfoWindow({
                    content: 'Puesto 10'
                });

                marker17.addListener('mouseover', function () {
                    puesto10.open(map, marker17);
                });
                
                marker17.addListener('mouseout', function () {
                    puesto10.close();
                });
                
                // Marcador para el puesto 11.
                var marker18 = new google.maps.Marker({
                    position: {lat: 19.323757, lng: -99.180238},
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'Puesto 11'
                });

                var puesto11 = new google.maps.InfoWindow({
                    content: 'Puesto 11'
                });

                marker18.addListener('mouseover', function () {
                    puesto11.open(map, marker18);
                });
                
                marker18.addListener('mouseout', function () {
                    puesto11.close();
                });
            }
        </script>

        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvfkQSaSfeL20ShaYbhIFZd9n63xAxqSg&sensor=false&callback=initMap">
        </script>

    </body>
</html>