USE proyecto;

INSERT INTO persona VALUES ("Pedro", "Pica", "Papas", "asdf123", "abc@gmail.com");
INSERT INTO persona VALUES ("Raul", "Guantesillo", "Marquez", "123fds", "123@gmail.com");
INSERT INTO persona VALUES ("Memo", "Morales", "Monte", "qrst", "memo@gmail.com");
INSERT INTO persona VALUES ("Antonio", "Alvarez", "Garcia", "contrasena", "antonio@ciencias.unam.mx");
INSERT INTO persona VALUES ("Ricardo", "Garcia", "Garcia", "apiubvpia", "ricardo@ciencias.unam.mx");
INSERT INTO persona VALUES ("Diego", "Magallanes", "Ramirez", "ap65465", "diego@ciencias.unam.mx");
INSERT INTO persona VALUES ("Manuel","Chavez","Pavon","anvpo","manuel@ciencias.unam.mx");
INSERT INTO persona VALUES ("Servando", "Ramirez","Ramirez","anvanvpon", "servando@ciencias.unam.mx");
INSERT INTO persona VALUES ("Adriana", "Martinez","Rosas","Ihate", "adriana@ciecas.unam.mx");
INSERT INTO persona VALUES ("Jesus", "Martir","De Jerusalen", "Yisus", "yisus@ciencias.unam.mx");


INSERT INTO usuario VALUES ("ricardo@ciencias.unam.mx","0");
INSERT INTO usuario VALUES ("diego@ciencias.unam.mx","1");
INSERT INTO usuario VALUES ("antonio@ciencias.unam.mx","1");
INSERT INTO usuario VALUES ("manuel@ciencias.unam.mx","0");
INSERT INTO usuario VALUES ("adriana@ciecas.unam.mx","0");
INSERT INTO usuario VALUES ("servando@ciencias.unam.mx","0");
INSERT INTO usuario VALUES ("yisus@ciencias.unam.mx","0");


INSERT INTO puesto VALUES ("Sucio Larry","Desconocido", 10);
INSERT INTO puesto VALUES ("Quesadillas","Estacionamiento", 8);
INSERT INTO puesto VALUES ("Rico y Saludable","Desconocido", 9);
INSERT INTO puesto VALUES ("No 1","Esacionamiento", 7);


INSERT INTO calificar VALUES ("ricardo@ciencias.unam.mx","Sucio Larry", "Buen lugar");
INSERT INTO calificar VALUES ("manuel@ciencias.unam.mx","Quesadillas", "Mas o menos");
INSERT INTO calificar VALUES ("servando@ciencias.unam.mx","No 1", "Mal lugar");


INSERT INTO alimentos VALUES (0,"Quesadillas");
INSERT INTO alimentos VALUES (1,"Pambazos");
INSERT INTO alimentos VALUES (2,"Sopa");
INSERT INTO alimentos VALUES (3,"Bollos");
INSERT INTO alimentos VALUES (4,"Hamburguesas");
INSERT INTO alimentos VALUES (5,"Ensalada");


INSERT INTO vender (idNombre_fk,idAlimento_fk) VALUES ("Sucio Larry",0);
INSERT INTO vender (idNombre_fk,idAlimento_fk) VALUES ("Quesadillas",0);
INSERT INTO vender (idNombre_fk,idAlimento_fk) VALUES ("Rico y Saludable",5);
INSERT INTO vender (idNombre_fk,idAlimento_fk) VALUES ("No 1",3);
