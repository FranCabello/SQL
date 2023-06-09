# 1, 2, 3

CREATE DATABASE PRACTICA2_UD3;
USE PRACTICA2_UD3;

CREATE TABLE PROFESORES (
	NIF VARCHAR(10) PRIMARY KEY,
    NOMBRE VARCHAR(30),
    APELLIDO1 VARCHAR(30),
    APELLIDO2 VARCHAR(30),
    DIRECCIÓN VARCHAR(60),
    TITULACIÓN VARCHAR(45),
    SALARIO INT(15)
);

CREATE TABLE CURSOS (
	CODIGO VARCHAR(20) PRIMARY KEY,
    NOMBRE VARCHAR(45),
    TOTAL_PLAZAS INT(5),
    FECHA_INICIO DATE,
    FECHA_FINAL DATE,
    TOTAL_HORAS INT(5),
    PROFESOR VARCHAR(10)
);

CREATE TABLE ALUMNOS (
	NIF VARCHAR(10) PRIMARY KEY,
    NOMBRE VARCHAR(30),
    APELLIDO1 VARCHAR(30),
    APELLIDO2 VARCHAR(30),
    DIRECCIÓN VARCHAR(60),
    SEXO VARCHAR(10),
    CURSO VARCHAR(10)
);

#4

ALTER TABLE CURSOS 
ADD CONSTRAINT profesor_fk FOREIGN KEY (PROFESOR) REFERENCES PROFESORES(NIF)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE ALUMNOS
ADD CONSTRAINT curso_fk FOREIGN KEY (CURSO) REFERENCES CURSOS(CODIGO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#5

ALTER TABLE ALUMNOS
CHANGE COLUMN CURSO CURSO VARCHAR(10) NULL;

ALTER TABLE CURSOS
CHANGE COLUMN PROFESOR PROFESOR VARCHAR (10) NOT NULL;

#6

ALTER TABLE ALUMNOS
ADD CONSTRAINT CH_sex CHECK (sexo='M' or sexo='H');

#7

ALTER TABLE CURSOS
ADD CONSTRAINT cur_nom_uk UNIQUE(NOMBRE);

#8

ALTER TABLE CURSOS
ADD CONSTRAINT CH_fecha CHECK (FECHA_INICIO < FECHA_FINAL);

#E2 1

ALTER TABLE ALUMNOS
ADD COLUMN EDAD INT,
ADD CONSTRAINT CH_edad CHECK (EDAD >= 14 AND EDAD<=65);

#2 

ALTER TABLE CURSOS
ADD CONSTRAINT CH_horas CHECK (TOTAL_HORAS='30' OR TOTAL_HORAS='40' OR TOTAL_HORAS='60');

#3

ALTER TABLE ALUMNOS
DROP CONSTRAINT CH_sex;

#4

ALTER TABLE PROFESORES
DROP COLUMN DIRECCIÓN;

#5

ALTER TABLE PROFESORES
RENAME TO TUTORES;

#6

DROP TABLE ALUMNOS;

#7

ALTER TABLE CURSOS
DROP PRIMARY KEY;

#8

ALTER TABLE CURSOS
ADD PRIMARY KEY (CODIGO,FECHA_INICIO);

#9

ALTER TABLE CURSOS
DROP CONSTRAINT profesor_fk;

ALTER TABLE TUTORES
DROP PRIMARY KEY;

ALTER TABLE TUTORES
ADD PRIMARY KEY (NOMBRE, APELLIDO1, APELLIDO2);


###
DROP TABLE CURSOS;
DROP TABLE TUTORES;