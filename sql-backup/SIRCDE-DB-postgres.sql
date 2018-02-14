--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2018-02-11 19:03:30 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2482 (class 1262 OID 16393)
-- Name: DIEP; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DIEP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';


ALTER DATABASE "DIEP" OWNER TO postgres;

\connect "DIEP"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12433)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16394)
-- Name: banda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE banda (
    id_banda integer NOT NULL,
    nombre_banda character varying(40),
    descripcion character varying(200)
);


ALTER TABLE banda OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16397)
-- Name: banda_id_banda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE banda_id_banda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banda_id_banda_seq OWNER TO postgres;

--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 182
-- Name: banda_id_banda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE banda_id_banda_seq OWNED BY banda.id_banda;


--
-- TOC entry 183 (class 1259 OID 16399)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bitacora (
    id_bitacora integer NOT NULL,
    id_usuario integer,
    fecha date,
    hora character varying(20),
    accion character varying(200),
    descripcion character varying(200)
);


ALTER TABLE bitacora OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16402)
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bitacora_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bitacora_id_bitacora_seq OWNER TO postgres;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 184
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bitacora_id_bitacora_seq OWNED BY bitacora.id_bitacora;


--
-- TOC entry 185 (class 1259 OID 16404)
-- Name: citacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE citacion (
    id_citacion integer NOT NULL,
    fecha_citacion date,
    hora_citacion character varying(20),
    remitido character varying(200),
    nota character varying(400),
    asistente character varying(10),
    direccion_cita character varying(200),
    id_usuario integer,
    id_persona integer,
    id_sector integer
);


ALTER TABLE citacion OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16410)
-- Name: citacion_id_citacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE citacion_id_citacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE citacion_id_citacion_seq OWNER TO postgres;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 186
-- Name: citacion_id_citacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE citacion_id_citacion_seq OWNED BY citacion.id_citacion;


--
-- TOC entry 187 (class 1259 OID 16412)
-- Name: ciudadano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudadano (
    id_ciudadano integer NOT NULL,
    id_banda integer,
    lugar_nacimiento character varying(30),
    apodo character varying(20),
    nombre_padre character varying(80),
    nombre_madre character varying(80),
    estatura character varying(20),
    "seña_natural" character varying(100),
    fecha_registro date,
    rol_banda character varying(20),
    estatus character varying(13),
    foto_frente bytea,
    foto_perfil_derecho bytea,
    foto_perfil_izquierdo bytea,
    registro_policial character varying,
    raza character varying(30),
    id_persona integer
);


ALTER TABLE ciudadano OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16418)
-- Name: ciudadano_id_ciudadano_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudadano_id_ciudadano_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudadano_id_ciudadano_seq1 OWNER TO postgres;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 188
-- Name: ciudadano_id_ciudadano_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudadano_id_ciudadano_seq1 OWNED BY ciudadano.id_ciudadano;


--
-- TOC entry 189 (class 1259 OID 16420)
-- Name: ciudadano_tatuaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudadano_tatuaje (
    id_ciudadano_tatuaje integer NOT NULL,
    descripcion_tatuaje character varying(100),
    id_ciudadano integer,
    id_tatuaje integer
);


ALTER TABLE ciudadano_tatuaje OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16423)
-- Name: ciudadano_tatuaje_id_ciudadano_tatuaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudadano_tatuaje_id_ciudadano_tatuaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudadano_tatuaje_id_ciudadano_tatuaje_seq OWNER TO postgres;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 190
-- Name: ciudadano_tatuaje_id_ciudadano_tatuaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudadano_tatuaje_id_ciudadano_tatuaje_seq OWNED BY ciudadano_tatuaje.id_ciudadano_tatuaje;


--
-- TOC entry 191 (class 1259 OID 16425)
-- Name: delito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE delito (
    id_delito integer NOT NULL,
    nombre_delito character varying(50)
);


ALTER TABLE delito OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16428)
-- Name: delito_expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE delito_expediente (
    id_delito_expediente integer NOT NULL,
    id_delito integer,
    id_expediente integer
);


ALTER TABLE delito_expediente OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16431)
-- Name: delito_expepiente_id_delito_expediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE delito_expepiente_id_delito_expediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delito_expepiente_id_delito_expediente_seq OWNER TO postgres;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 193
-- Name: delito_expepiente_id_delito_expediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE delito_expepiente_id_delito_expediente_seq OWNED BY delito_expediente.id_delito_expediente;


--
-- TOC entry 194 (class 1259 OID 16433)
-- Name: delito_id_delito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE delito_id_delito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delito_id_delito_seq OWNER TO postgres;

--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 194
-- Name: delito_id_delito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE delito_id_delito_seq OWNED BY delito.id_delito;


--
-- TOC entry 195 (class 1259 OID 16435)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE documento (
    id_documento integer NOT NULL,
    documento bytea,
    id_expediente integer,
    nombre_documento character varying(400)
);


ALTER TABLE documento OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16441)
-- Name: documento_id_documento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documento_id_documento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documento_id_documento_seq OWNER TO postgres;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 196
-- Name: documento_id_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documento_id_documento_seq OWNED BY documento.id_documento;


--
-- TOC entry 197 (class 1259 OID 16443)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id_estado integer NOT NULL,
    nombre_estado character varying(40)
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16446)
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_estado_seq OWNER TO postgres;

--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 198
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;


--
-- TOC entry 199 (class 1259 OID 16448)
-- Name: expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE expediente (
    id_expediente integer NOT NULL,
    fecha date,
    direccion_hecho character varying(200),
    procedimiento character varying(50),
    pieza character varying(20),
    dependencia_preventiva character varying(1000),
    abreviatura_dep character varying(20),
    id_sector integer,
    arma character varying(300),
    nro_identificacion character varying(10),
    nro_fiscalia character(3),
    nombre_fiscalia character(100),
    id_persona integer
);


ALTER TABLE expediente OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16454)
-- Name: expediente_id_expediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expediente_id_expediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expediente_id_expediente_seq OWNER TO postgres;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 200
-- Name: expediente_id_expediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expediente_id_expediente_seq OWNED BY expediente.id_expediente;


--
-- TOC entry 201 (class 1259 OID 16456)
-- Name: foto_arma_id_foto_arma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE foto_arma_id_foto_arma_seq
    START WITH 154
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE foto_arma_id_foto_arma_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16458)
-- Name: foto_arma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE foto_arma (
    id_foto_arma integer DEFAULT nextval('foto_arma_id_foto_arma_seq'::regclass) NOT NULL,
    foto character varying,
    id_expediente integer
);


ALTER TABLE foto_arma OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16465)
-- Name: foto_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE foto_vehiculo (
    id_foto_vehiculo integer NOT NULL,
    foto character varying,
    id_vehiculo integer
);


ALTER TABLE foto_vehiculo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16471)
-- Name: foto_vehiculo_id_foto_vehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE foto_vehiculo_id_foto_vehiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE foto_vehiculo_id_foto_vehiculo_seq OWNER TO postgres;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 204
-- Name: foto_vehiculo_id_foto_vehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE foto_vehiculo_id_foto_vehiculo_seq OWNED BY foto_vehiculo.id_foto_vehiculo;


--
-- TOC entry 205 (class 1259 OID 16473)
-- Name: ivestigado_expediente_id_investigado_expediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ivestigado_expediente_id_investigado_expediente_seq
    START WITH 70
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ivestigado_expediente_id_investigado_expediente_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16475)
-- Name: investigado_expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE investigado_expediente (
    id_investigado_expediente integer DEFAULT nextval('ivestigado_expediente_id_investigado_expediente_seq'::regclass) NOT NULL,
    id_expediente integer,
    id_persona integer
);


ALTER TABLE investigado_expediente OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16479)
-- Name: marca_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marca_vehiculo (
    id_marca_vehiculo integer NOT NULL,
    nombre_marca character varying(30)
);


ALTER TABLE marca_vehiculo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16482)
-- Name: marca_id_marca_vehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marca_id_marca_vehiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marca_id_marca_vehiculo_seq OWNER TO postgres;

--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 208
-- Name: marca_id_marca_vehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marca_id_marca_vehiculo_seq OWNED BY marca_vehiculo.id_marca_vehiculo;


--
-- TOC entry 209 (class 1259 OID 16484)
-- Name: modelo_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE modelo_vehiculo (
    id_modelo_vehiculo integer NOT NULL,
    id_marca_vehiculo integer,
    nombre_modelo character varying(40)
);


ALTER TABLE modelo_vehiculo OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16487)
-- Name: modelo_vehiculo_id_modelo_vehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modelo_vehiculo_id_modelo_vehiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelo_vehiculo_id_modelo_vehiculo_seq OWNER TO postgres;

--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 210
-- Name: modelo_vehiculo_id_modelo_vehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modelo_vehiculo_id_modelo_vehiculo_seq OWNED BY modelo_vehiculo.id_modelo_vehiculo;


--
-- TOC entry 211 (class 1259 OID 16489)
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE municipio (
    id_municipio integer NOT NULL,
    nombre_municipio character varying(60),
    id_estado integer
);


ALTER TABLE municipio OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16492)
-- Name: municipio_id_municipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE municipio_id_municipio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE municipio_id_municipio_seq OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 212
-- Name: municipio_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE municipio_id_municipio_seq OWNED BY municipio.id_municipio;


--
-- TOC entry 213 (class 1259 OID 16494)
-- Name: ocupacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ocupacion (
    id_ocupacion integer NOT NULL,
    nombre_ocupacion character varying(30)
);


ALTER TABLE ocupacion OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16497)
-- Name: ocupacion_id_ocupacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ocupacion_id_ocupacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ocupacion_id_ocupacion_seq OWNER TO postgres;

--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 214
-- Name: ocupacion_id_ocupacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ocupacion_id_ocupacion_seq OWNED BY ocupacion.id_ocupacion;


--
-- TOC entry 215 (class 1259 OID 16499)
-- Name: parroquia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE parroquia (
    id_parroquia integer NOT NULL,
    nombre_parroquia character varying(80),
    id_municipio integer
);


ALTER TABLE parroquia OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16502)
-- Name: parroquia_id_parroquia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parroquia_id_parroquia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parroquia_id_parroquia_seq OWNER TO postgres;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 216
-- Name: parroquia_id_parroquia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parroquia_id_parroquia_seq OWNED BY parroquia.id_parroquia;


--
-- TOC entry 217 (class 1259 OID 16504)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persona (
    id_persona integer NOT NULL,
    cedula character varying(15) NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nac date,
    sexo character varying(15),
    nacionalidad character varying(15),
    estado_civil character varying(15),
    direccion character varying(200),
    id_ocupacion integer,
    id_sector integer,
    edad character varying(3),
    tipo_persona character varying(20)
);


ALTER TABLE persona OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16507)
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_id_persona_seq OWNER TO postgres;

--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 218
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_id_persona_seq OWNED BY persona.id_persona;


--
-- TOC entry 219 (class 1259 OID 16509)
-- Name: remision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE remision (
    id_remision integer NOT NULL,
    fecha_remision date,
    estatus_caso character varying(15),
    fecha_recibido date,
    id_expediente integer
);


ALTER TABLE remision OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16512)
-- Name: remision_id_remision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE remision_id_remision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE remision_id_remision_seq OWNER TO postgres;

--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 220
-- Name: remision_id_remision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE remision_id_remision_seq OWNED BY remision.id_remision;


--
-- TOC entry 221 (class 1259 OID 16514)
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sector (
    id_sector integer NOT NULL,
    nombre_sector character varying(100),
    id_parroquia integer
);


ALTER TABLE sector OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16517)
-- Name: sector_id_sector_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sector_id_sector_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sector_id_sector_seq OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 222
-- Name: sector_id_sector_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sector_id_sector_seq OWNED BY sector.id_sector;


--
-- TOC entry 223 (class 1259 OID 16519)
-- Name: tatuaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tatuaje (
    id_tatuaje integer NOT NULL,
    nombre_tatuaje character varying(40)
);


ALTER TABLE tatuaje OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16522)
-- Name: tatuaje_id_tatuaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tatuaje_id_tatuaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tatuaje_id_tatuaje_seq OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 224
-- Name: tatuaje_id_tatuaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tatuaje_id_tatuaje_seq OWNED BY tatuaje.id_tatuaje;


--
-- TOC entry 225 (class 1259 OID 16524)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    denominacion character varying(30),
    consultar boolean,
    incluir boolean,
    modificar boolean,
    formulario character varying(100)
);


ALTER TABLE tipo_usuario OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16527)
-- Name: tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_usuario_id_tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_usuario_id_tipo_usuario_seq OWNER TO postgres;

--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 226
-- Name: tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_usuario_id_tipo_usuario_seq OWNED BY tipo_usuario.id_tipo_usuario;


--
-- TOC entry 227 (class 1259 OID 16529)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(30),
    clave character varying(200),
    estatus boolean,
    id_tipo_usuario integer,
    id_persona integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16532)
-- Name: usuario_expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario_expediente (
    id_usuario_expediente integer NOT NULL,
    id_expediente integer,
    id_usuario integer
);


ALTER TABLE usuario_expediente OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16535)
-- Name: usuario_expediente_id_usuario_expediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_expediente_id_usuario_expediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_expediente_id_usuario_expediente_seq OWNER TO postgres;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuario_expediente_id_usuario_expediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_expediente_id_usuario_expediente_seq OWNED BY usuario_expediente.id_usuario_expediente;


--
-- TOC entry 230 (class 1259 OID 16537)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 230
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 231 (class 1259 OID 16539)
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vehiculo (
    id_vehiculo integer NOT NULL,
    placa character varying(30),
    tipo_vehiculo character varying(30),
    clase character varying(20),
    uso character varying(20),
    color character varying(20),
    serial_carroceria character varying(50),
    serial_motor character varying(50),
    fecha_detencion date,
    direccion_detencion character varying(200),
    observacion character varying(200),
    id_modelo_vehiculo integer,
    id_sector integer,
    id_persona integer
);


ALTER TABLE vehiculo OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16545)
-- Name: vehiculo_id_vehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehiculo_id_vehiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculo_id_vehiculo_seq OWNER TO postgres;

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 232
-- Name: vehiculo_id_vehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehiculo_id_vehiculo_seq OWNED BY vehiculo.id_vehiculo;


--
-- TOC entry 233 (class 1259 OID 16547)
-- Name: victima_expediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE victima_expediente (
    id_victima_expediente integer NOT NULL,
    id_expediente integer,
    id_persona integer
);


ALTER TABLE victima_expediente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16550)
-- Name: victima_expediente_id_victima_expediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE victima_expediente_id_victima_expediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE victima_expediente_id_victima_expediente_seq OWNER TO postgres;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 234
-- Name: victima_expediente_id_victima_expediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE victima_expediente_id_victima_expediente_seq OWNED BY victima_expediente.id_victima_expediente;


--
-- TOC entry 2222 (class 2604 OID 16552)
-- Name: id_banda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banda ALTER COLUMN id_banda SET DEFAULT nextval('banda_id_banda_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 16553)
-- Name: id_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('bitacora_id_bitacora_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 16554)
-- Name: id_citacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citacion ALTER COLUMN id_citacion SET DEFAULT nextval('citacion_id_citacion_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 16555)
-- Name: id_ciudadano; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano ALTER COLUMN id_ciudadano SET DEFAULT nextval('ciudadano_id_ciudadano_seq1'::regclass);


--
-- TOC entry 2226 (class 2604 OID 16556)
-- Name: id_ciudadano_tatuaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano_tatuaje ALTER COLUMN id_ciudadano_tatuaje SET DEFAULT nextval('ciudadano_tatuaje_id_ciudadano_tatuaje_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 16557)
-- Name: id_delito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito ALTER COLUMN id_delito SET DEFAULT nextval('delito_id_delito_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 16558)
-- Name: id_delito_expediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito_expediente ALTER COLUMN id_delito_expediente SET DEFAULT nextval('delito_expepiente_id_delito_expediente_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 16559)
-- Name: id_documento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documento ALTER COLUMN id_documento SET DEFAULT nextval('documento_id_documento_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 16560)
-- Name: id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 16561)
-- Name: id_expediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expediente ALTER COLUMN id_expediente SET DEFAULT nextval('expediente_id_expediente_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 16562)
-- Name: id_foto_vehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_vehiculo ALTER COLUMN id_foto_vehiculo SET DEFAULT nextval('foto_vehiculo_id_foto_vehiculo_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 16563)
-- Name: id_marca_vehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca_vehiculo ALTER COLUMN id_marca_vehiculo SET DEFAULT nextval('marca_id_marca_vehiculo_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 16564)
-- Name: id_modelo_vehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo ALTER COLUMN id_modelo_vehiculo SET DEFAULT nextval('modelo_vehiculo_id_modelo_vehiculo_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 16565)
-- Name: id_municipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio ALTER COLUMN id_municipio SET DEFAULT nextval('municipio_id_municipio_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 16566)
-- Name: id_ocupacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ocupacion ALTER COLUMN id_ocupacion SET DEFAULT nextval('ocupacion_id_ocupacion_seq'::regclass);


--
-- TOC entry 2239 (class 2604 OID 16567)
-- Name: id_parroquia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parroquia ALTER COLUMN id_parroquia SET DEFAULT nextval('parroquia_id_parroquia_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 16568)
-- Name: id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN id_persona SET DEFAULT nextval('persona_id_persona_seq'::regclass);


--
-- TOC entry 2241 (class 2604 OID 16569)
-- Name: id_remision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remision ALTER COLUMN id_remision SET DEFAULT nextval('remision_id_remision_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 16570)
-- Name: id_sector; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sector ALTER COLUMN id_sector SET DEFAULT nextval('sector_id_sector_seq'::regclass);


--
-- TOC entry 2243 (class 2604 OID 16571)
-- Name: id_tatuaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tatuaje ALTER COLUMN id_tatuaje SET DEFAULT nextval('tatuaje_id_tatuaje_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 16572)
-- Name: id_tipo_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario ALTER COLUMN id_tipo_usuario SET DEFAULT nextval('tipo_usuario_id_tipo_usuario_seq'::regclass);


--
-- TOC entry 2245 (class 2604 OID 16573)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2246 (class 2604 OID 16574)
-- Name: id_usuario_expediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_expediente ALTER COLUMN id_usuario_expediente SET DEFAULT nextval('usuario_expediente_id_usuario_expediente_seq'::regclass);


--
-- TOC entry 2247 (class 2604 OID 16575)
-- Name: id_vehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo ALTER COLUMN id_vehiculo SET DEFAULT nextval('vehiculo_id_vehiculo_seq'::regclass);


--
-- TOC entry 2248 (class 2604 OID 16576)
-- Name: id_victima_expediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY victima_expediente ALTER COLUMN id_victima_expediente SET DEFAULT nextval('victima_expediente_id_victima_expediente_seq'::regclass);


--
-- TOC entry 2250 (class 2606 OID 17534)
-- Name: banda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banda
    ADD CONSTRAINT banda_pkey PRIMARY KEY (id_banda);


--
-- TOC entry 2252 (class 2606 OID 17536)
-- Name: bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id_bitacora);


--
-- TOC entry 2255 (class 2606 OID 17538)
-- Name: citacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citacion
    ADD CONSTRAINT citacion_pkey PRIMARY KEY (id_citacion);


--
-- TOC entry 2260 (class 2606 OID 17540)
-- Name: ciudadano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano
    ADD CONSTRAINT ciudadano_pkey PRIMARY KEY (id_ciudadano);


--
-- TOC entry 2264 (class 2606 OID 17542)
-- Name: ciudadano_tatuaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano_tatuaje
    ADD CONSTRAINT ciudadano_tatuaje_pkey PRIMARY KEY (id_ciudadano_tatuaje);


--
-- TOC entry 2270 (class 2606 OID 17544)
-- Name: delito_expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito_expediente
    ADD CONSTRAINT delito_expediente_pkey PRIMARY KEY (id_delito_expediente);


--
-- TOC entry 2268 (class 2606 OID 17546)
-- Name: delitos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito
    ADD CONSTRAINT delitos_pkey PRIMARY KEY (id_delito);


--
-- TOC entry 2274 (class 2606 OID 17548)
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id_documento);


--
-- TOC entry 2277 (class 2606 OID 17550)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 2279 (class 2606 OID 17552)
-- Name: expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expediente
    ADD CONSTRAINT expediente_pkey PRIMARY KEY (id_expediente);


--
-- TOC entry 2284 (class 2606 OID 17554)
-- Name: foto_arma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_arma
    ADD CONSTRAINT foto_arma_pkey PRIMARY KEY (id_foto_arma);


--
-- TOC entry 2287 (class 2606 OID 17556)
-- Name: foto_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_vehiculo
    ADD CONSTRAINT foto_vehiculo_pkey PRIMARY KEY (id_foto_vehiculo);


--
-- TOC entry 2290 (class 2606 OID 17558)
-- Name: investigado_expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY investigado_expediente
    ADD CONSTRAINT investigado_expediente_pkey PRIMARY KEY (id_investigado_expediente);


--
-- TOC entry 2292 (class 2606 OID 17560)
-- Name: marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca_vehiculo
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id_marca_vehiculo);


--
-- TOC entry 2294 (class 2606 OID 17562)
-- Name: modelo_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo
    ADD CONSTRAINT modelo_vehiculo_pkey PRIMARY KEY (id_modelo_vehiculo);


--
-- TOC entry 2297 (class 2606 OID 17564)
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 2299 (class 2606 OID 17566)
-- Name: ocupacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ocupacion
    ADD CONSTRAINT ocupacion_pkey PRIMARY KEY (id_ocupacion);


--
-- TOC entry 2301 (class 2606 OID 17568)
-- Name: parroquia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT parroquia_pkey PRIMARY KEY (id_parroquia);


--
-- TOC entry 2305 (class 2606 OID 17570)
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 2308 (class 2606 OID 17572)
-- Name: remision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remision
    ADD CONSTRAINT remision_pkey PRIMARY KEY (id_remision);


--
-- TOC entry 2310 (class 2606 OID 17574)
-- Name: sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id_sector);


--
-- TOC entry 2312 (class 2606 OID 17576)
-- Name: tatuaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tatuaje
    ADD CONSTRAINT tatuaje_pkey PRIMARY KEY (id_tatuaje);


--
-- TOC entry 2314 (class 2606 OID 17578)
-- Name: tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);


--
-- TOC entry 2322 (class 2606 OID 17580)
-- Name: usuario_expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_expediente
    ADD CONSTRAINT usuario_expediente_pkey PRIMARY KEY (id_usuario_expediente);


--
-- TOC entry 2318 (class 2606 OID 17582)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2327 (class 2606 OID 17584)
-- Name: vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);


--
-- TOC entry 2331 (class 2606 OID 17586)
-- Name: victima_expediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY victima_expediente
    ADD CONSTRAINT victima_expediente_pkey PRIMARY KEY (id_victima_expediente);


--
-- TOC entry 2261 (class 1259 OID 17587)
-- Name: fki_banda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_banda ON ciudadano USING btree (id_banda);


--
-- TOC entry 2265 (class 1259 OID 17588)
-- Name: fki_ciudadano; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ciudadano ON ciudadano_tatuaje USING btree (id_ciudadano);


--
-- TOC entry 2271 (class 1259 OID 17589)
-- Name: fki_delito; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_delito ON delito_expediente USING btree (id_delito);


--
-- TOC entry 2315 (class 1259 OID 17590)
-- Name: fki_ersona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ersona ON usuario USING btree (id_persona);


--
-- TOC entry 2319 (class 1259 OID 17591)
-- Name: fki_exp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_exp ON usuario_expediente USING btree (id_expediente);


--
-- TOC entry 2328 (class 1259 OID 17592)
-- Name: fki_expa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_expa ON victima_expediente USING btree (id_expediente);


--
-- TOC entry 2306 (class 1259 OID 17593)
-- Name: fki_expe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_expe ON remision USING btree (id_expediente);


--
-- TOC entry 2272 (class 1259 OID 17594)
-- Name: fki_expediente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_expediente ON delito_expediente USING btree (id_expediente);


--
-- TOC entry 2295 (class 1259 OID 17595)
-- Name: fki_id_estado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_estado ON municipio USING btree (id_estado);


--
-- TOC entry 2282 (class 1259 OID 17596)
-- Name: fki_id_expediente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_expediente ON foto_arma USING btree (id_expediente);


--
-- TOC entry 2275 (class 1259 OID 17597)
-- Name: fki_id_expee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_expee ON documento USING btree (id_expediente);


--
-- TOC entry 2302 (class 1259 OID 17598)
-- Name: fki_id_ocupacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_ocupacion ON persona USING btree (id_ocupacion);


--
-- TOC entry 2288 (class 1259 OID 17599)
-- Name: fki_id_persona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_persona ON investigado_expediente USING btree (id_persona);


--
-- TOC entry 2256 (class 1259 OID 17600)
-- Name: fki_id_personaaaaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_personaaaaa ON citacion USING btree (id_persona);


--
-- TOC entry 2303 (class 1259 OID 17601)
-- Name: fki_id_sector; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_sector ON persona USING btree (id_sector);


--
-- TOC entry 2257 (class 1259 OID 17602)
-- Name: fki_id_sectorrrrrrr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_sectorrrrrrr ON citacion USING btree (id_sector);


--
-- TOC entry 2316 (class 1259 OID 17603)
-- Name: fki_id_tipo_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_tipo_usuario ON usuario USING btree (id_tipo_usuario);


--
-- TOC entry 2280 (class 1259 OID 17604)
-- Name: fki_id_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuario ON expediente USING btree (id_persona);


--
-- TOC entry 2253 (class 1259 OID 17605)
-- Name: fki_id_usuariooooo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_usuariooooo ON bitacora USING btree (id_usuario);


--
-- TOC entry 2285 (class 1259 OID 17606)
-- Name: fki_id_vehiculo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_vehiculo ON foto_vehiculo USING btree (id_vehiculo);


--
-- TOC entry 2323 (class 1259 OID 17607)
-- Name: fki_mode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mode ON vehiculo USING btree (id_modelo_vehiculo);


--
-- TOC entry 2324 (class 1259 OID 17608)
-- Name: fki_per; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_per ON vehiculo USING btree (id_persona);


--
-- TOC entry 2262 (class 1259 OID 17609)
-- Name: fki_persona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_persona ON ciudadano USING btree (id_persona);


--
-- TOC entry 2329 (class 1259 OID 17610)
-- Name: fki_rsona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_rsona ON victima_expediente USING btree (id_persona);


--
-- TOC entry 2325 (class 1259 OID 17611)
-- Name: fki_sect; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sect ON vehiculo USING btree (id_sector);


--
-- TOC entry 2281 (class 1259 OID 17612)
-- Name: fki_sector; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sector ON expediente USING btree (id_sector);


--
-- TOC entry 2266 (class 1259 OID 17613)
-- Name: fki_tatuaje; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tatuaje ON ciudadano_tatuaje USING btree (id_tatuaje);


--
-- TOC entry 2320 (class 1259 OID 17614)
-- Name: fki_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_user ON usuario_expediente USING btree (id_usuario);


--
-- TOC entry 2258 (class 1259 OID 17615)
-- Name: fki_userasd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_userasd ON citacion USING btree (id_usuario);


--
-- TOC entry 2336 (class 2606 OID 17616)
-- Name: banda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano
    ADD CONSTRAINT banda FOREIGN KEY (id_banda) REFERENCES banda(id_banda);


--
-- TOC entry 2338 (class 2606 OID 17621)
-- Name: ciudadano; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano_tatuaje
    ADD CONSTRAINT ciudadano FOREIGN KEY (id_ciudadano) REFERENCES ciudadano(id_ciudadano);


--
-- TOC entry 2340 (class 2606 OID 17626)
-- Name: delito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito_expediente
    ADD CONSTRAINT delito FOREIGN KEY (id_delito) REFERENCES delito(id_delito);


--
-- TOC entry 2341 (class 2606 OID 17631)
-- Name: expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delito_expediente
    ADD CONSTRAINT expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2349 (class 2606 OID 17636)
-- Name: id_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT id_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado);


--
-- TOC entry 2345 (class 2606 OID 17641)
-- Name: id_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_arma
    ADD CONSTRAINT id_expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2353 (class 2606 OID 17646)
-- Name: id_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remision
    ADD CONSTRAINT id_expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2357 (class 2606 OID 17651)
-- Name: id_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_expediente
    ADD CONSTRAINT id_expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2362 (class 2606 OID 17656)
-- Name: id_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY victima_expediente
    ADD CONSTRAINT id_expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2342 (class 2606 OID 17661)
-- Name: id_expediente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT id_expediente FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente);


--
-- TOC entry 2359 (class 2606 OID 17666)
-- Name: id_modelo_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT id_modelo_vehiculo FOREIGN KEY (id_modelo_vehiculo) REFERENCES modelo_vehiculo(id_modelo_vehiculo);


--
-- TOC entry 2350 (class 2606 OID 17671)
-- Name: id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio);


--
-- TOC entry 2351 (class 2606 OID 17676)
-- Name: id_ocupacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT id_ocupacion FOREIGN KEY (id_ocupacion) REFERENCES ocupacion(id_ocupacion);


--
-- TOC entry 2354 (class 2606 OID 17681)
-- Name: id_parroquia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT id_parroquia FOREIGN KEY (id_parroquia) REFERENCES parroquia(id_parroquia);


--
-- TOC entry 2343 (class 2606 OID 17686)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expediente
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2347 (class 2606 OID 17691)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY investigado_expediente
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2355 (class 2606 OID 17696)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2360 (class 2606 OID 17701)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2363 (class 2606 OID 17706)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY victima_expediente
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2333 (class 2606 OID 17711)
-- Name: id_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citacion
    ADD CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2352 (class 2606 OID 17716)
-- Name: id_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT id_sector FOREIGN KEY (id_sector) REFERENCES sector(id_sector);


--
-- TOC entry 2361 (class 2606 OID 17721)
-- Name: id_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT id_sector FOREIGN KEY (id_sector) REFERENCES sector(id_sector);


--
-- TOC entry 2334 (class 2606 OID 17726)
-- Name: id_sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citacion
    ADD CONSTRAINT id_sector FOREIGN KEY (id_sector) REFERENCES sector(id_sector);


--
-- TOC entry 2356 (class 2606 OID 17731)
-- Name: id_tipo_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario);


--
-- TOC entry 2358 (class 2606 OID 17736)
-- Name: id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_expediente
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2335 (class 2606 OID 17741)
-- Name: id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citacion
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2332 (class 2606 OID 17746)
-- Name: id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2346 (class 2606 OID 17751)
-- Name: id_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_vehiculo
    ADD CONSTRAINT id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo);


--
-- TOC entry 2348 (class 2606 OID 17756)
-- Name: modelo_vehiculo_id_marca_vehiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo
    ADD CONSTRAINT modelo_vehiculo_id_marca_vehiculo_fkey FOREIGN KEY (id_marca_vehiculo) REFERENCES marca_vehiculo(id_marca_vehiculo);


--
-- TOC entry 2337 (class 2606 OID 17761)
-- Name: persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano
    ADD CONSTRAINT persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- TOC entry 2344 (class 2606 OID 17766)
-- Name: sector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expediente
    ADD CONSTRAINT sector FOREIGN KEY (id_sector) REFERENCES sector(id_sector);


--
-- TOC entry 2339 (class 2606 OID 17771)
-- Name: tatuaje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudadano_tatuaje
    ADD CONSTRAINT tatuaje FOREIGN KEY (id_tatuaje) REFERENCES tatuaje(id_tatuaje);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-02-11 19:03:30 -04

--
-- PostgreSQL database dump complete
--

