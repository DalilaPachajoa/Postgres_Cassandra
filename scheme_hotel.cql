CREATE KEYSPACE IF NOT EXISTS hotel WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;
USE hotel;

CREATE TABLE cliente (
    dni text PRIMARY KEY,
    nombre text,
    apellidos text,
    domicilio text,
    telefono text
);

CREATE TABLE empleado (
    numreg int PRIMARY KEY,
    nombre text,
    incorporacion date,
    sueldo int,
    cods int
);

CREATE TABLE factura (
    codigof int PRIMARY KEY,
    entrada date,
    salida date,
    dni text,
    numero int,
    supletoria int,
    forma text,
    total float
);


CREATE TABLE factura_prov (
    codfp int PRIMARY KEY,
    fecha date,
    importe int,
    nif text,
    numreg int
);



CREATE TABLE formapago (
    forma text PRIMARY KEY,
    comision int    
);




CREATE TABLE habitacion (
    numero int PRIMARY KEY,
    superficie int,
    bar text,
    terraza text,
    puedesupletoria text,
    tipo text    
);


CREATE TABLE incluye (
    codigof int,
    cods int,
    coste int,
    fecha date,
	PRIMARY KEY (codigof, cods, fecha) 
);

CREATE TABLE limpieza (
    numreg int,
    numero int,
    fecha date,
	PRIMARY KEY (numreg, numero, fecha)
);


CREATE TABLE precio (
    tipo text PRIMARY KEY,
    precio int    
);


CREATE TABLE proveedor (
    nif text PRIMARY KEY,
    nombre text,
    direccion text,
    numreg int
);

CREATE TABLE reserva (
    dni text,
    numero int,
    entrada date,
    salida date,
	PRIMARY KEY (dni, numero)
);


CREATE TABLE servicio (
    cods int PRIMARY KEY,
    descripcion text,
    costeinterno int,
    numreg int    
);

CREATE TABLE usa (
    cods int,
    servicio_cods int,
    fecha date,
	PRIMARY KEY (cods, servicio_cods, fecha)
);
