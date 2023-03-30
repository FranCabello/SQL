CREATE TABLE presidente (
	DNI VARCHAR(9),
    nombre VARCHAR(30),
    apellidos VARCHAR(40),
    fechanamiciento DATE,
    fechaeleccion date,
    PRIMARY KEY (DNI)
);

CREATE TABLE equipo (
	codigo VARCHAR(10),
    nombre VARCHAR(30),
    estadio VARCHAR(30),
    aforo INT(6) DEFAULT 0,
    ciudad VARCHAR (30),
    presidente VARCHAR(9),
    PRIMARY KEY (codigo),
    FOREIGN KEY (presidente) REFERENCES presidente (DNI)
);

CREATE TABLE partido (
	codigo VARCHAR(10),
    fecha date NOT NULL,
    codigo_local VARCHAR(10),
	codigo_visitante VARCHAR(10),
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_local) REFERENCES equipo (codigo),
    FOREIGN KEY (codigo_visitante) REFERENCES equipo(codigo),
    CONSTRAINT CH_equipo CHECK ( codigo_local != codigo_visitante)
);
    
CREATE TABLE jugador (
	codigo VARCHAR(10),
    nombre VARCHAR(20),
    posicion VARCHAR(15),
    fechanacimiento date,
    PRIMARY KEY (codigo),
    CONSTRAINT CH_pos CHECK (posicion IN("Portero","Defensa","Centrocampista","Delantero"))
);

CREATE TABLE gol (
	id VARCHAR(10),
    minuto INT(3),
    descripcion VARCHAR(100),
    codigo_partido VARCHAR(10),
    codigo_jugador VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_partido) REFERENCES partido(codigo),
    FOREIGN KEY (codigo_jugador) REFERENCES jugador(codigo)
);

#e

ALTER TABLE equipo
ADD COLUMN numtitulos INT(3);

#f

INSERT INTO equipo VALUES
("123456","Sevilla","Sánchez Pizjuán",40000,"Sevilla",NULL);

#g

UPDATE equipo SET ciudad = "Málaga" WHERE ciudad = "Sevilla";

#h

DELETE FROM equipo WHERE nombre = "Sevilla";