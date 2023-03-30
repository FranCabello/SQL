CREATE DATABASE UD4T2;
USE UD4T2;

CREATE TABLE cliente (
	dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30),
    apellidos VARCHAR(45),
    fecha_nac DATE,
    tfno INTEGER(10)
    );
    
CREATE TABLE producto (
	codigo_producto VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(45),
    precio INT(10)
    );
    
CREATE TABLE proveedor (
	nif VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(30),
	direccion VARCHAR(45)
    );

ALTER TABLE producto
ADD COLUMN nif VARCHAR(10),
ADD CONSTRAINT proveedor_fk FOREIGN KEY (nif) REFERENCES proveedor(nif);

CREATE TABLE compra (
	codigo_compra VARCHAR(10) PRIMARY KEY,
    dni_cliente VARCHAR(10),
    codigo_producto VARCHAR(10) 
    ); 

ALTER TABLE compra
ADD CONSTRAINT dnicliente_fk FOREIGN KEY (dni_cliente) REFERENCES cliente(dni);

ALTER TABLE compra
ADD CONSTRAINT codigoproducto_fk FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto);

DROP TABLE producto;


#E1

SELECT nombre, tfno FROM cliente
JOIN compra
	ON compra.dni_cliente = cliente.dni
WHERE codigo_producto = "C124";

#E2

SELECT nombre FROM producto
WHERE nif = "27275621X";

#E3

SELECT DISTINCT proveedor.nombre FROM proveedor
JOIN producto
	ON producto.nif = proveedor.nif
JOIN compra
	ON compra.codigo_producto = producto.codigo_producto
WHERE dni_cliente = "12563465F";

Select distinct proveedor.nombre
From cliente
Join compra on compra.dni_cliente = cliente.dni
Join producto on producto.codigo_producto = compra.codigo_producto
Join proveedor on proveedor.nif = producto.nif
Where dni = "1234";

#E4

SELECT COUNT(dni) FROM cliente
JOIN compra
	ON compra.dni_cliente = cliente.dni
WHERE codigo_producto = "C125";

#E5

SELECT MAX(precio) FROM producto;

#E6

SELECT AVG(precio) FROM producto
WHERE nif = "75268547G";