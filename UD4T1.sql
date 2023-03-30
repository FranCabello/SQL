CREATE DATABASE UD4T1;
USE UD4T1;

CREATE TABLE empleados (
    NIF VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(45),
    apellido1 VARCHAR(45),
    apellido2 VARCHAR(45),
    direccion VARCHAR(60),
    telefono INTEGER(10),
    email VARCHAR(45),
    sueldo INT(15)
);

CREATE TABLE clientes (
	NIF VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(45),
	apellido1 VARCHAR(45),
	apellido2 VARCHAR(45),
	direccion VARCHAR(60),
	telefono INTEGER(10),
	email VARCHAR(45)
);

CREATE TABLE coches (
	marca VARCHAR(20),
	modelo VARCHAR(45),
	tipo_vehiculo VARCHAR(20),
	matricula VARCHAR(10) PRIMARY KEY
);

ALTER TABLE coches
ADD COLUMN NIF VARCHAR(10),
ADD CONSTRAINT clientes_fk FOREIGN KEY (NIF) REFERENCES clientes(NIF);


#E1

INSERT INTO empleados VALUES 
	('12345678', 'Pedro', 'García', 'García', 'Madrid', '654123789', 'pedrogg@hotmail.com', '1500');
    
INSERT INTO clientes VALUES 
	('34567891', 'Daniel', 'Sánchez', 'Jiménez', 'Almería', '698741235', 'danisj@hotmail.com');
    
INSERT INTO coches VALUES 
	('FIAT', '500', 'Urbano', '2021FTQ', NULL);

#E2

SELECT nombre, apellido1, apellido2 FROM clientes
WHERE direccion = "Almería";

#E3

SELECT nombre, apellido1, apellido2 FROM empleados
WHERE sueldo > 1025;

#E4

SELECT SUM(sueldo) FROM empleados
WHERE direccion = "Madrid";

#E5

SELECT nombre FROM clientes
JOIN coches
	ON coches.NIF = clientes.NIF
WHERE marca = "nombreMarca" AND modelo = "nombreModelo";


