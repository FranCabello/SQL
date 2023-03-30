#crear la base de datos
CREATE DATABASE PRACTICA1_UD3;

#seleccionar la base de datos
USE PRACTICA1_UD3;

#E1 Creamos las tablas SIN relacion

#Ejemplo tipo tabla 
CREATE TABLE Vendedores (
    NIF VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(45),
    apellido1 VARCHAR(45),
    apellido2 VARCHAR(45),
    dirección VARCHAR(60),
    teléfono INTEGER(10),
    email VARCHAR(45),
    sueldo INT(15)
);

CREATE TABLE Clientes (
	NIF VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(45),
	apellido1 VARCHAR(45),
	apellido2 VARCHAR(45),
	dirección VARCHAR(60),
	teléfono INTEGER(10),
	email VARCHAR(45)
);

CREATE TABLE Coches (
	marca VARCHAR(20),
	modelo VARCHAR(45),
	tipovehículo VARCHAR(20),
	matrícula VARCHAR(10) PRIMARY KEY,
	importe INT(15)
);

#E2

ALTER TABLE Coches
ADD COLUMN NIF VARCHAR(10),
ADD CONSTRAINT vendedor_fk FOREIGN KEY (NIF) REFERENCES Vendedores(NIF);


#E3

ALTER TABLE Coches
ADD CONSTRAINT CH_importe CHECK (0<=importe AND importe <=25000000);

#E4

INSERT INTO Vendedores VALUES 
	('12345678', 'Pedro', 'García', 'García', 'C/ Gran Vía 64', '654123789', 'pedrogg@hotmail.com', '1500'),
	('23456789', 'Laura', 'González', 'Fernández', 'C/ Serrano 5', '632145798', 'lauragf@hotmail.com', '1200');

INSERT INTO Clientes VALUES 
	('34567891', 'Daniel', 'Sánchez', 'Jiménez', 'Avda Concha Espino 15', '698741235', 'danisj@hotmail.com'),
	('45678912','Elena', 'García', 'Fernández', 'C/ Cuba 98', '612345678', 'elenagf@hotmail.com');

INSERT INTO Coches VALUES 
	('FIAT', '500', 'Urbano', '2021FTQ', '15000', NULL),
	('Nissan', 'Qasqhai', 'SUV', '2021NSS', '24000', NULL);