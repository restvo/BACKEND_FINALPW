--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-10 12:17:47

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
-- TOC entry 209 (class 1259 OID 24578)
-- Name: carrera; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.carrera (
    id uuid NOT NULL,
    nombre character varying(200)
);


ALTER TABLE public.carrera OWNER TO evaluaciones;

--
-- TOC entry 210 (class 1259 OID 24581)
-- Name: ciclo; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.ciclo (
    id uuid NOT NULL,
    nombre character varying(6) NOT NULL
);


ALTER TABLE public.ciclo OWNER TO evaluaciones;

--
-- TOC entry 211 (class 1259 OID 24584)
-- Name: curso; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.curso (
    id uuid NOT NULL,
    nombre character varying(150) NOT NULL,
    carrera_id uuid
);


ALTER TABLE public.curso OWNER TO evaluaciones;

--
-- TOC entry 214 (class 1259 OID 32780)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.estudiante (
    id uuid NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.estudiante OWNER TO evaluaciones;

--
-- TOC entry 212 (class 1259 OID 24587)
-- Name: evaluacion; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.evaluacion (
    id uuid NOT NULL,
    nombre character varying(200) NOT NULL,
    fecha_registro timestamp without time zone,
    curso_id uuid NOT NULL,
    ciclo_id uuid NOT NULL
);


ALTER TABLE public.evaluacion OWNER TO evaluaciones;

--
-- TOC entry 213 (class 1259 OID 32768)
-- Name: resolucion; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.resolucion (
    id uuid NOT NULL,
    estudiante_id uuid NOT NULL,
    evaluacion_id uuid NOT NULL,
    fecha_envio timestamp without time zone NOT NULL,
    upvote integer,
    url character varying
);


ALTER TABLE public.resolucion OWNER TO evaluaciones;

--
-- TOC entry 3184 (class 2606 OID 24591)
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 24593)
-- Name: ciclo ciclo_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.ciclo
    ADD CONSTRAINT ciclo_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 24595)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 32786)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 24597)
-- Name: evaluacion evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 32774)
-- Name: resolucion resolucion_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resolucion
    ADD CONSTRAINT resolucion_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 24598)
-- Name: curso fk_curso_carrera; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk_curso_carrera FOREIGN KEY (carrera_id) REFERENCES public.carrera(id);


--
-- TOC entry 3196 (class 2606 OID 24603)
-- Name: evaluacion fk_evaluacion_ciclo; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT fk_evaluacion_ciclo FOREIGN KEY (ciclo_id) REFERENCES public.ciclo(id) NOT VALID;


--
-- TOC entry 3197 (class 2606 OID 24608)
-- Name: evaluacion fk_evaluacion_curso; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT fk_evaluacion_curso FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 3199 (class 2606 OID 32787)
-- Name: resolucion fk_resolucion_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resolucion
    ADD CONSTRAINT fk_resolucion_estudiante FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id) NOT VALID;


--
-- TOC entry 3198 (class 2606 OID 32775)
-- Name: resolucion fk_resolucion_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resolucion
    ADD CONSTRAINT fk_resolucion_evaluacion FOREIGN KEY (evaluacion_id) REFERENCES public.evaluacion(id) NOT VALID;


-- Completed on 2022-11-10 12:17:47

--
-- PostgreSQL database dump complete
--

