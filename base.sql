CREATE DATABASE proyecto;
USE proyecto;

CREATE TABLE persona(
	Nombres varchar(50),
	apPaterno varchar(30),
	apMaterno varchar(30),
	Contrasena varchar(50),
	Correo varchar(50) NOT NULL, 
	PRIMARY KEY (Correo)
)ENGINE=InnoDB;


CREATE TABLE usuario(
	Correo_us varchar(50) NOT NULL,
	administrador varchar(1),
	PRIMARY KEY (Correo_us),
	CONSTRAINT usuario_fk_1 FOREIGN KEY (Correo_us) REFERENCES persona (Correo)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;


CREATE TABLE puesto(
	idNombre varchar(50) NOT NULL,
	Ubicacion varchar(100),
	Calificacion int,
	PRIMARY KEY (idNombre)
)ENGINE=InnoDB;

CREATE TABLE calificar(
	Correo_fk varchar(50) NOT NULL,
	idNombre_fk varchar(50) NOT NULL,
	Comentario varchar(300),
	PRIMARY KEY (Correo_fk,idNombre_fk),
	CONSTRAINT calificar_fk_2 FOREIGN KEY (Correo_fk) REFERENCES persona (Correo),
	CONSTRAINT calificar_fk_1 FOREIGN KEY (idNombre_fk) REFERENCES puesto (idNombre)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;


CREATE TABLE alimentos(
	idAlimento int,
	nombreAlim varchar(100),
	PRIMARY KEY (idAlimento)
)ENGINE=InnoDB;

CREATE TABLE vender(
	id int(100) NOT NULL AUTO_INCREMENT,
	idNombre_fk varchar(50) NOT NULL,
	idAlimento_fk int NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT vender_fk_1 FOREIGN KEY (idNombre_fk) REFERENCES puesto (idNombre),
	CONSTRAINT vender_fk_2 FOREIGN KEY (idAlimento_fk) REFERENCES alimentos (idAlimento)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;



