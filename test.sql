CREATE DATABASE concesionariotest;
USE concesionariotest;

CREATE TABLE empleados (
	NIF INT(9),
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    direccion VARCHAR(100),
    telefono INT(9),
    email VARCHAR(60),
    sueldo INT(5),
    PRIMARY KEY (NIF)
);

CREATE TABLE clientes (
	NIF INT(9),
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    direccion VARCHAR(100),
    telefono INT(9),
    email VARCHAR(60),
    acesor int(30), 
    PRIMARY KEY (NIF),
    FOREIGN KEY (acesor) REFERENCES empleados (NIF)
    );
    
    drop table clientes