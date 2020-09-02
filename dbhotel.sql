--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.2

-- Started on 2020-08-07 22:02:18 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3438 (class 1262 OID 3796782)
-- Name: tmp; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE tmp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_ES.UTF-8' LC_CTYPE = 'es_ES.UTF-8';


\connect tmp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 3797335)
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    dni character(9) NOT NULL,
    nombre character varying(10),
    apellidos character varying(30),
    domicilio character(30),
    telefono character varying(9)
);


--
-- TOC entry 208 (class 1259 OID 3797400)
-- Name: empleado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empleado (
    numreg integer NOT NULL,
    nombre character varying(32),
    incorporacion date,
    sueldo integer,
    cods integer
);


--
-- TOC entry 207 (class 1259 OID 3797380)
-- Name: factura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factura (
    codigof integer NOT NULL,
    entrada date,
    salida date,
    dni character(9),
    numero integer NOT NULL,
    supletoria integer,
    forma character varying(8) NOT NULL,
    total real
);


--
-- TOC entry 213 (class 1259 OID 3797461)
-- Name: factura_prov; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factura_prov (
    codfp integer NOT NULL,
    fecha date,
    importe integer,
    nif character varying(10) NOT NULL,
    numreg integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3797374)
-- Name: formapago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.formapago (
    forma character varying(8) NOT NULL,
    comision integer,
    CONSTRAINT formapago_forma_check CHECK (((forma)::text = ANY ((ARRAY['efectivo'::character varying, 'tarjeta'::character varying, 'talon'::character varying])::text[])))
);


--
-- TOC entry 204 (class 1259 OID 3797346)
-- Name: habitacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habitacion (
    numero integer NOT NULL,
    superficie integer,
    bar character(2),
    terraza character(2),
    puedesupletoria character(2),
    tipo character varying(10) NOT NULL,
    CONSTRAINT habitacion_bar_check CHECK ((bar = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar]))),
    CONSTRAINT habitacion_puedesupletoria_check CHECK ((puedesupletoria = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar]))),
    CONSTRAINT habitacion_terraza_check CHECK ((terraza = ANY (ARRAY['SI'::bpchar, 'NO'::bpchar])))
);


--
-- TOC entry 211 (class 1259 OID 3797436)
-- Name: incluye; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incluye (
    codigof integer NOT NULL,
    cods integer NOT NULL,
    coste integer,
    fecha date NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 3797476)
-- Name: limpieza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.limpieza (
    numreg integer NOT NULL,
    numero integer NOT NULL,
    fecha date NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 3797340)
-- Name: precio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.precio (
    tipo character varying(10) NOT NULL,
    precio integer,
    CONSTRAINT precio_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['individual'::character varying, 'doble'::character varying])::text[])))
);


--
-- TOC entry 212 (class 1259 OID 3797451)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedor (
    nif character varying(10) NOT NULL,
    nombre character varying(16),
    direccion character(30),
    numreg integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 3797359)
-- Name: reserva; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reserva (
    dni character(9) NOT NULL,
    numero integer NOT NULL,
    entrada date,
    salida date
);


--
-- TOC entry 209 (class 1259 OID 3797405)
-- Name: servicio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.servicio (
    cods integer NOT NULL,
    descripcion character(15),
    costeinterno integer,
    numreg integer NOT NULL,
    CONSTRAINT servicio_descripcion_check CHECK ((descripcion = ANY (ARRAY['tintoreria'::bpchar, 'plancha'::bpchar, 'lavanderia'::bpchar, 'bar'::bpchar, 'restaurante'::bpchar, 'floristeria'::bpchar])))
);


--
-- TOC entry 210 (class 1259 OID 3797421)
-- Name: usa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usa (
    cods integer NOT NULL,
    servicio_cods integer NOT NULL,
    fecha date NOT NULL
);


--
-- TOC entry 3420 (class 0 OID 3797335)
-- Dependencies: 202
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cliente VALUES ('111111   ', 'Antonio', 'Aguirre', 'Pez 20, 1º A                  ', '999418768');
INSERT INTO public.cliente VALUES ('222222   ', 'Jorge', 'Anguiano López', 'Churruca 2, 6º D              ', '999876737');
INSERT INTO public.cliente VALUES ('333333   ', 'Pilar', 'Méndez Alonso', 'Gran Via 167                  ', '999343543');
INSERT INTO public.cliente VALUES ('444444   ', 'Azucena', 'Rubio del Val', 'Brasil 63, 2º A               ', '999456765');
INSERT INTO public.cliente VALUES ('555555   ', 'Raúl', 'Gutiérrez González', 'Literatos 3, 5º               ', '999876234');
INSERT INTO public.cliente VALUES ('666666   ', 'Santiago', 'Rivera Romero', 'Avda. de la Paz 30            ', '999111232');
INSERT INTO public.cliente VALUES ('777777   ', 'Pedro', 'González Hernando', 'Castellana 290, 9º B          ', '999232221');
INSERT INTO public.cliente VALUES ('888888   ', 'Antonio', 'Díaz Martín', 'Cuba 1                        ', '999444554');
INSERT INTO public.cliente VALUES ('999999   ', 'Virginia', 'Fernández Fernández', 'Brasil 65, 3º                 ', '999009009');
INSERT INTO public.cliente VALUES ('000000   ', 'Francisco', 'Vilansó Rodríguez', 'General Rodrigos 24           ', '999666565');


--
-- TOC entry 3426 (class 0 OID 3797400)
-- Dependencies: 208
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empleado VALUES (10, 'Antonio Sancho Sancho', '2010-01-01', 1000, NULL);
INSERT INTO public.empleado VALUES (11, 'María Gonzalo Fuentes', '2010-01-01', 1000, NULL);
INSERT INTO public.empleado VALUES (12, 'Juana Peláez Trasto', '2010-01-01', 900, NULL);
INSERT INTO public.empleado VALUES (13, 'Gonzalo Cabezas Muiño', '2010-01-01', 1500, NULL);
INSERT INTO public.empleado VALUES (1, 'Luisa Blanco Baroja', '1996-10-23', 1000, 1);
INSERT INTO public.empleado VALUES (2, 'Fernando Serrano Vázquez', '1996-10-23', 1000, 2);
INSERT INTO public.empleado VALUES (3, 'Manuel Pérez Calo', '2000-01-01', 900, 3);
INSERT INTO public.empleado VALUES (4, 'Ana Troncoso Calvo', '2000-01-01', 900, 4);
INSERT INTO public.empleado VALUES (5, 'Alba Troncoso Calvo', '2002-09-13', NULL, 1);
INSERT INTO public.empleado VALUES (6, 'Jorge Alonso Alonso', '2002-09-13', NULL, 5);
INSERT INTO public.empleado VALUES (7, 'Fernando Soaje Alvarez', '2010-01-01', NULL, 5);
INSERT INTO public.empleado VALUES (8, 'Rosa Luigi Paz', '2010-01-01', 1000, 5);
INSERT INTO public.empleado VALUES (9, 'Rafael Fuertes Cabrera', '2010-01-01', 1100, 6);


--
-- TOC entry 3425 (class 0 OID 3797380)
-- Dependencies: 207
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.factura VALUES (1, '2010-01-01', '2010-01-03', '111111   ', 100, 30, 'efectivo', 360);
INSERT INTO public.factura VALUES (0, '2010-01-01', '2010-01-05', '999999   ', 300, 0, 'tarjeta', 220);
INSERT INTO public.factura VALUES (2, '2010-06-01', '2010-06-03', '111111   ', 100, 30, 'efectivo', 180);
INSERT INTO public.factura VALUES (3, '2010-09-01', '2010-09-03', '111111   ', 100, 30, 'efectivo', 338);
INSERT INTO public.factura VALUES (4, '2010-11-02', NULL, '111111   ', 100, 0, 'efectivo', NULL);
INSERT INTO public.factura VALUES (5, '2010-11-01', NULL, '333333   ', 200, 0, 'tarjeta', NULL);
INSERT INTO public.factura VALUES (6, '2010-10-29', NULL, '999999   ', 204, 30, 'talon', NULL);
INSERT INTO public.factura VALUES (7, '2010-11-01', NULL, '555555   ', 300, 0, 'efectivo', NULL);
INSERT INTO public.factura VALUES (8, '2010-10-30', NULL, '777777   ', 301, 30, 'tarjeta', NULL);
INSERT INTO public.factura VALUES (9, '2010-05-15', '2010-05-17', '999999   ', 301, 0, 'tarjeta', 218);
INSERT INTO public.factura VALUES (10, '2010-08-10', '2010-08-13', '333333   ', 300, 0, 'tarjeta', 270);
INSERT INTO public.factura VALUES (11, '2010-08-15', '2010-08-22', '888888   ', 102, 0, 'tarjeta', 525);
INSERT INTO public.factura VALUES (12, '2010-12-23', '2010-12-24', '444444   ', 201, 0, 'talon', 90);
INSERT INTO public.factura VALUES (13, '2010-05-01', '2010-05-05', '999999   ', 300, 0, 'efectivo', 380);
INSERT INTO public.factura VALUES (14, '2010-06-06', '2010-06-11', '555555   ', 203, 0, 'tarjeta', 375);
INSERT INTO public.factura VALUES (15, '2010-08-15', '2010-08-19', '555555   ', 203, 0, 'tarjeta', 363);
INSERT INTO public.factura VALUES (16, '2010-08-19', '2010-08-21', '666666   ', 204, 0, 'efectivo', 212);
INSERT INTO public.factura VALUES (17, '2010-08-22', '2010-08-24', '666666   ', 203, 0, 'tarjeta', 190);


--
-- TOC entry 3431 (class 0 OID 3797461)
-- Dependencies: 213
-- Data for Name: factura_prov; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.factura_prov VALUES (1, '2010-03-21', 1500, '121212T', 8);
INSERT INTO public.factura_prov VALUES (2, '2010-04-21', 1000, '121212T', 8);
INSERT INTO public.factura_prov VALUES (3, '2010-05-21', 500, '121212T', 8);
INSERT INTO public.factura_prov VALUES (4, '2010-06-21', 976, '121212T', 8);
INSERT INTO public.factura_prov VALUES (5, '2010-03-21', 345, '343434L', 1);
INSERT INTO public.factura_prov VALUES (6, '2010-05-21', 235, '343434L', 1);
INSERT INTO public.factura_prov VALUES (7, '2010-07-21', 1000, '343434L', 1);
INSERT INTO public.factura_prov VALUES (8, '2010-08-21', 765, '343434L', 1);
INSERT INTO public.factura_prov VALUES (9, '2010-03-21', 1235, '545454Q', 12);
INSERT INTO public.factura_prov VALUES (10, '2010-04-11', 2342, '545454Q', 12);
INSERT INTO public.factura_prov VALUES (11, '2010-06-15', 2567, '545454Q', 12);


--
-- TOC entry 3424 (class 0 OID 3797374)
-- Dependencies: 206
-- Data for Name: formapago; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.formapago VALUES ('efectivo', 0);
INSERT INTO public.formapago VALUES ('tarjeta', 1);
INSERT INTO public.formapago VALUES ('talon', 2);


--
-- TOC entry 3422 (class 0 OID 3797346)
-- Dependencies: 204
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.habitacion VALUES (100, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion VALUES (101, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion VALUES (102, 17, 'SI', 'SI', 'SI', 'individual');
INSERT INTO public.habitacion VALUES (200, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion VALUES (201, 17, 'SI', 'SI', 'NO', 'doble');
INSERT INTO public.habitacion VALUES (202, 15, 'SI', 'SI', 'NO', 'individual');
INSERT INTO public.habitacion VALUES (203, 15, 'NO', 'SI', 'SI', 'individual');
INSERT INTO public.habitacion VALUES (204, 17, 'SI', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion VALUES (300, 17, 'NO', 'SI', 'SI', 'doble');
INSERT INTO public.habitacion VALUES (301, 17, 'SI', 'SI', 'SI', 'doble');


--
-- TOC entry 3429 (class 0 OID 3797436)
-- Dependencies: 211
-- Data for Name: incluye; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.incluye VALUES (1, 1, 25, '2010-01-01');
INSERT INTO public.incluye VALUES (1, 2, 15, '2010-01-01');
INSERT INTO public.incluye VALUES (3, 3, 25, '2010-09-01');
INSERT INTO public.incluye VALUES (3, 3, 25, '2010-09-02');
INSERT INTO public.incluye VALUES (3, 3, 25, '2010-09-03');
INSERT INTO public.incluye VALUES (3, 2, 10, '2010-09-01');
INSERT INTO public.incluye VALUES (3, 2, 20, '2010-09-03');
INSERT INTO public.incluye VALUES (3, 1, 10, '2010-09-01');
INSERT INTO public.incluye VALUES (3, 5, 43, '2010-09-02');
INSERT INTO public.incluye VALUES (5, 5, 25, '2010-11-01');
INSERT INTO public.incluye VALUES (5, 5, 28, '2010-11-02');
INSERT INTO public.incluye VALUES (5, 5, 33, '2010-11-03');
INSERT INTO public.incluye VALUES (5, 5, 24, '2010-11-04');
INSERT INTO public.incluye VALUES (5, 3, 13, '2010-11-02');
INSERT INTO public.incluye VALUES (7, 6, 20, '2010-11-02');
INSERT INTO public.incluye VALUES (9, 4, 6, '2010-05-15');
INSERT INTO public.incluye VALUES (9, 4, 8, '2010-05-16');
INSERT INTO public.incluye VALUES (9, 5, 24, '2010-05-16');
INSERT INTO public.incluye VALUES (13, 2, 10, '2010-05-03');
INSERT INTO public.incluye VALUES (13, 2, 10, '2010-05-04');
INSERT INTO public.incluye VALUES (15, 5, 45, '2010-08-15');
INSERT INTO public.incluye VALUES (15, 4, 5, '2010-08-15');
INSERT INTO public.incluye VALUES (15, 2, 13, '2010-08-15');
INSERT INTO public.incluye VALUES (16, 5, 32, '2010-08-19');
INSERT INTO public.incluye VALUES (17, 1, 10, '2010-08-20');
INSERT INTO public.incluye VALUES (17, 5, 30, '2010-08-23');


--
-- TOC entry 3432 (class 0 OID 3797476)
-- Dependencies: 214
-- Data for Name: limpieza; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.limpieza VALUES (10, 101, '2010-08-20');
INSERT INTO public.limpieza VALUES (10, 101, '2010-08-21');
INSERT INTO public.limpieza VALUES (10, 101, '2010-08-22');
INSERT INTO public.limpieza VALUES (10, 101, '2010-08-23');
INSERT INTO public.limpieza VALUES (10, 102, '2010-08-24');
INSERT INTO public.limpieza VALUES (10, 202, '2010-09-23');
INSERT INTO public.limpieza VALUES (10, 203, '2010-09-23');
INSERT INTO public.limpieza VALUES (10, 204, '2010-09-30');
INSERT INTO public.limpieza VALUES (10, 301, '2010-10-01');
INSERT INTO public.limpieza VALUES (10, 300, '2010-10-01');
INSERT INTO public.limpieza VALUES (12, 100, '2010-09-10');
INSERT INTO public.limpieza VALUES (12, 101, '2010-09-10');
INSERT INTO public.limpieza VALUES (12, 102, '2010-09-10');
INSERT INTO public.limpieza VALUES (12, 200, '2010-09-10');
INSERT INTO public.limpieza VALUES (12, 201, '2010-09-11');
INSERT INTO public.limpieza VALUES (12, 202, '2010-09-11');
INSERT INTO public.limpieza VALUES (12, 203, '2010-09-11');
INSERT INTO public.limpieza VALUES (12, 204, '2010-09-11');
INSERT INTO public.limpieza VALUES (12, 300, '2010-09-12');
INSERT INTO public.limpieza VALUES (12, 301, '2010-09-12');
INSERT INTO public.limpieza VALUES (11, 100, '2010-08-01');
INSERT INTO public.limpieza VALUES (11, 100, '2010-09-01');
INSERT INTO public.limpieza VALUES (11, 100, '2010-10-01');
INSERT INTO public.limpieza VALUES (11, 100, '2010-10-02');
INSERT INTO public.limpieza VALUES (11, 101, '2010-08-10');
INSERT INTO public.limpieza VALUES (11, 101, '2010-09-10');
INSERT INTO public.limpieza VALUES (11, 101, '2010-08-14');
INSERT INTO public.limpieza VALUES (11, 102, '2010-08-15');
INSERT INTO public.limpieza VALUES (11, 200, '2010-08-10');
INSERT INTO public.limpieza VALUES (11, 201, '2010-09-10');
INSERT INTO public.limpieza VALUES (11, 202, '2010-09-10');
INSERT INTO public.limpieza VALUES (11, 203, '2010-01-10');
INSERT INTO public.limpieza VALUES (11, 204, '2010-01-10');
INSERT INTO public.limpieza VALUES (11, 301, '2010-01-10');
INSERT INTO public.limpieza VALUES (11, 301, '2010-01-01');
INSERT INTO public.limpieza VALUES (11, 301, '2010-01-07');


--
-- TOC entry 3421 (class 0 OID 3797340)
-- Dependencies: 203
-- Data for Name: precio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.precio VALUES ('individual', 75);
INSERT INTO public.precio VALUES ('doble', 90);


--
-- TOC entry 3430 (class 0 OID 3797451)
-- Dependencies: 212
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.proveedor VALUES ('121212T', 'Carnes SA', 'Plaza de los de Acá 20        ', 8);
INSERT INTO public.proveedor VALUES ('343434L', 'Logística Pérez', 'Calle del Pueblo 30, 1º       ', 1);
INSERT INTO public.proveedor VALUES ('545454Q', 'Prd. Quimicos SA', 'Colombiana 34                 ', 12);


--
-- TOC entry 3423 (class 0 OID 3797359)
-- Dependencies: 205
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reserva VALUES ('111111   ', 101, '2011-02-01', '2011-02-04');
INSERT INTO public.reserva VALUES ('111111   ', 102, '2011-02-03', '2011-02-04');
INSERT INTO public.reserva VALUES ('222222   ', 300, '2011-02-02', '2011-02-06');
INSERT INTO public.reserva VALUES ('777777   ', 203, '2011-02-17', '2011-02-19');
INSERT INTO public.reserva VALUES ('777777   ', 204, '2011-03-25', '2011-03-27');
INSERT INTO public.reserva VALUES ('999999   ', 200, '2011-02-11', '2011-02-15');


--
-- TOC entry 3427 (class 0 OID 3797405)
-- Dependencies: 209
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.servicio VALUES (1, 'tintoreria     ', 50, 1);
INSERT INTO public.servicio VALUES (2, 'plancha        ', 30, 2);
INSERT INTO public.servicio VALUES (3, 'lavanderia     ', 60, 3);
INSERT INTO public.servicio VALUES (4, 'bar            ', 15, 4);
INSERT INTO public.servicio VALUES (5, 'restaurante    ', 50, 8);
INSERT INTO public.servicio VALUES (6, 'floristeria    ', 25, 9);


--
-- TOC entry 3428 (class 0 OID 3797421)
-- Dependencies: 210
-- Data for Name: usa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usa VALUES (5, 1, '2010-08-25');
INSERT INTO public.usa VALUES (5, 1, '2010-08-30');
INSERT INTO public.usa VALUES (5, 1, '2010-09-24');
INSERT INTO public.usa VALUES (5, 2, '2010-08-18');
INSERT INTO public.usa VALUES (5, 2, '2010-09-01');
INSERT INTO public.usa VALUES (5, 3, '2010-09-05');
INSERT INTO public.usa VALUES (5, 4, '2010-09-20');
INSERT INTO public.usa VALUES (5, 4, '2010-09-29');
INSERT INTO public.usa VALUES (5, 6, '2010-09-25');
INSERT INTO public.usa VALUES (4, 2, '2010-09-17');
INSERT INTO public.usa VALUES (4, 2, '2010-08-29');
INSERT INTO public.usa VALUES (4, 3, '2010-09-01');
INSERT INTO public.usa VALUES (4, 3, '2010-09-05');
INSERT INTO public.usa VALUES (4, 3, '2010-09-19');


--
-- TOC entry 3252 (class 2606 OID 3797339)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dni);


--
-- TOC entry 3264 (class 2606 OID 3797404)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (numreg);


--
-- TOC entry 3262 (class 2606 OID 3797384)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (codigof);


--
-- TOC entry 3274 (class 2606 OID 3797465)
-- Name: factura_prov factura_prov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_pkey PRIMARY KEY (codfp);


--
-- TOC entry 3260 (class 2606 OID 3797379)
-- Name: formapago formapago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formapago
    ADD CONSTRAINT formapago_pkey PRIMARY KEY (forma);


--
-- TOC entry 3256 (class 2606 OID 3797353)
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (numero);


--
-- TOC entry 3270 (class 2606 OID 3797440)
-- Name: incluye incluye_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_pkey PRIMARY KEY (codigof, cods, fecha);


--
-- TOC entry 3276 (class 2606 OID 3797480)
-- Name: limpieza limpieza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_pkey PRIMARY KEY (numreg, numero, fecha);


--
-- TOC entry 3254 (class 2606 OID 3797345)
-- Name: precio precio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (tipo);


--
-- TOC entry 3272 (class 2606 OID 3797455)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (nif);


--
-- TOC entry 3258 (class 2606 OID 3797363)
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (dni, numero);


--
-- TOC entry 3266 (class 2606 OID 3797410)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (cods);


--
-- TOC entry 3268 (class 2606 OID 3797425)
-- Name: usa usa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_pkey PRIMARY KEY (cods, servicio_cods, fecha);


--
-- TOC entry 3283 (class 2606 OID 3797416)
-- Name: empleado empleado_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods);


--
-- TOC entry 3280 (class 2606 OID 3797385)
-- Name: factura factura_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_dni_fkey FOREIGN KEY (dni) REFERENCES public.cliente(dni) ON UPDATE CASCADE;


--
-- TOC entry 3281 (class 2606 OID 3797395)
-- Name: factura factura_forma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_forma_fkey FOREIGN KEY (forma) REFERENCES public.formapago(forma) ON UPDATE CASCADE;


--
-- TOC entry 3282 (class 2606 OID 3797390)
-- Name: factura factura_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 3797466)
-- Name: factura_prov factura_prov_nif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_nif_fkey FOREIGN KEY (nif) REFERENCES public.proveedor(nif) ON UPDATE CASCADE;


--
-- TOC entry 3291 (class 2606 OID 3797471)
-- Name: factura_prov factura_prov_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura_prov
    ADD CONSTRAINT factura_prov_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg);


--
-- TOC entry 3277 (class 2606 OID 3797354)
-- Name: habitacion habitacion_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_tipo_fkey FOREIGN KEY (tipo) REFERENCES public.precio(tipo) ON UPDATE CASCADE;


--
-- TOC entry 3287 (class 2606 OID 3797441)
-- Name: incluye incluye_codigof_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_codigof_fkey FOREIGN KEY (codigof) REFERENCES public.factura(codigof) ON UPDATE CASCADE;


--
-- TOC entry 3288 (class 2606 OID 3797446)
-- Name: incluye incluye_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incluye
    ADD CONSTRAINT incluye_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods) ON UPDATE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 3797486)
-- Name: limpieza limpieza_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 3797481)
-- Name: limpieza limpieza_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.limpieza
    ADD CONSTRAINT limpieza_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 3289 (class 2606 OID 3797456)
-- Name: proveedor proveedor_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 3278 (class 2606 OID 3797364)
-- Name: reserva reserva_dni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_dni_fkey FOREIGN KEY (dni) REFERENCES public.cliente(dni) ON UPDATE CASCADE;


--
-- TOC entry 3279 (class 2606 OID 3797369)
-- Name: reserva reserva_numero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_numero_fkey FOREIGN KEY (numero) REFERENCES public.habitacion(numero) ON UPDATE CASCADE;


--
-- TOC entry 3284 (class 2606 OID 3797411)
-- Name: servicio servicio_numreg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_numreg_fkey FOREIGN KEY (numreg) REFERENCES public.empleado(numreg) ON UPDATE CASCADE;


--
-- TOC entry 3285 (class 2606 OID 3797426)
-- Name: usa usa_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_cods_fkey FOREIGN KEY (cods) REFERENCES public.servicio(cods);


--
-- TOC entry 3286 (class 2606 OID 3797431)
-- Name: usa usa_servicio_cods_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usa
    ADD CONSTRAINT usa_servicio_cods_fkey FOREIGN KEY (servicio_cods) REFERENCES public.servicio(cods);


-- Completed on 2020-08-07 22:02:24 -05

--
-- PostgreSQL database dump complete
--

