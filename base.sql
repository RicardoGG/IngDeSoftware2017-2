CREATE DATABASE proyecto;
USE proyecto;

CREATE TABLE persona(
	Nombres varchar(50),
	apPaterno varchar(30),
	apMaterno varchar(30),
	Contrasena varchar(50),
	Correo varchar(50) NOT NULL, 
	PRIMARY KEY (Correo)
);


CREATE TABLE usuario(
	Correo_us varchar(50) NOT NULL,
	administrador varchar(1),
	PRIMARY KEY (Correo_us),
	FOREIGN KEY (Correo_us) REFERENCES persona (Correo) ON DELETE CASCADE
);


CREATE TABLE puesto(
	idNombre varchar(50) NOT NULL,
	Ubicacion varchar(100),
	Calificacion int,
	PRIMARY KEY (idNombre)
);

CREATE TABLE calificar(
	Correo_fk varchar(50) NOT NULL,
	idNombre_fk varchar(50) NOT NULL,
	Comentario varchar(300),
	PRIMARY KEY (Correo_fk,idNombre_fk),
	FOREIGN KEY (Correo_fk) REFERENCES persona (Correo),
	FOREIGN KEY (idNombre_fk) REFERENCES puesto (idNombre)
);


CREATE TABLE alimentos(
	idAlimento int,
	nombreAlim varchar(100),
	PRIMARY KEY (idAlimento)
);

CREATE TABLE vender(
	idNombre_fk varchar(50) NOT NULL,
	idAlimento_fk int NOT NULL,
	PRIMARY KEY(idNombre_fk, idAlimento_fk),
	FOREIGN KEY (idNombre_fk) REFERENCES puesto (idNombre),
	FOREIGN KEY (idAlimento_fk) REFERENCES alimentos (idAlimento)
);


ALTER TABLE usuario ADD CHECK (Correo_us like '%@ciencias.unam.mx');