CREATE DATABASE concesionario;
USE concesionario;

CREATE TABLE empleados (
	NIF VARCHAR(9),
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
	NIF VARCHAR(9),
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    direccion VARCHAR(100),
    telefono INT(9),
    email VARCHAR(60),
    PRIMARY KEY (NIF)
);

CREATE TABLE coches (
	marca varchar(20),
    modelo VARCHAR(20),
    tipo_de_vehiculo VARCHAR(20),
    matricula VARCHAR(7),
    nif_empleado VARCHAR(9),
    nif_cliente VARCHAR(9),
    PRIMARY KEY (matricula),
    FOREIGN KEY (nif_empleado) REFERENCES empleados (NIF),
    FOREIGN KEY (nif_cliente) REFERENCES clientes (NIF)
);

DELIMITER $$
CREATE PROCEDURE obtenerClientePorMatricula (IN matricula_coche VARCHAR(7))
BEGIN
	SELECT nombre
    FROM clientes
    JOIN coches
		ON clientes.NIF = coches.nif_cliente
	WHERE matricula = matricula_coche;
END$$

DELIMITER;

CALL obtenerClientePorMatricula("");
# En  "" poner la matrícula del coche a buscar


DELIMITER $$
CREATE PROCEDURE obtenerEmpleadoPorCliente (IN nombre_cliente VARCHAR(20))
BEGIN
	SELECT empleados.NIF
    FROM empleados
    JOIN coches
		ON coches.nif_empleado = empleados.NIF
	JOIN clientes
		ON clientes.NIF = coches.nif_cliente
	WHERE clientes.nombre = nombre_cliente;
END$$

DELIMITER;

CALL obtnerEmpleadoPorCliente("");
# En "" poner el nombre del cliente a buscar
