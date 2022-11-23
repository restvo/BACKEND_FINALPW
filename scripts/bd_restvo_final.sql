--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-23 01:01:37

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
-- TOC entry 211 (class 1259 OID 49167)
-- Name: orden; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.orden (
    id uuid NOT NULL,
    monto character varying NOT NULL,
    direccion character varying NOT NULL,
    fecha date,
    usuario_id uuid
);


ALTER TABLE public.orden OWNER TO evaluaciones;

--
-- TOC entry 215 (class 1259 OID 49208)
-- Name: orden_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_producto (
    id uuid NOT NULL,
    orden_id uuid,
    producto_id uuid
);


ALTER TABLE public.orden_producto OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49181)
-- Name: pc_armado; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pc_armado (
    id uuid NOT NULL,
    nombre character varying(100),
    descripcion character varying(100)
);


ALTER TABLE public.pc_armado OWNER TO evaluaciones;

--
-- TOC entry 216 (class 1259 OID 49223)
-- Name: pc_armado_producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pc_armado_producto (
    id uuid NOT NULL,
    pc_armado_id uuid,
    producto_id uuid
);


ALTER TABLE public.pc_armado_producto OWNER TO evaluaciones;

--
-- TOC entry 212 (class 1259 OID 49174)
-- Name: producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.producto (
    id uuid NOT NULL,
    nombre character varying,
    precio character varying,
    descripcion character varying,
    categoria character varying
);


ALTER TABLE public.producto OWNER TO evaluaciones;

--
-- TOC entry 210 (class 1259 OID 49160)
-- Name: reporte; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.reporte (
    id uuid NOT NULL,
    correo character varying(100) NOT NULL,
    nombre character varying(150) NOT NULL,
    telefono character varying(100) NOT NULL,
    asunto character varying(100) NOT NULL,
    descripcion character varying(100) NOT NULL,
    usuario_id uuid
);


ALTER TABLE public.reporte OWNER TO evaluaciones;

--
-- TOC entry 214 (class 1259 OID 49186)
-- Name: resena; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.resena (
    id uuid NOT NULL,
    puntaje character varying(100),
    comentario character varying(1000),
    video character varying(200),
    link character varying(200),
    tipo_resena character varying(100),
    usuario_id uuid
);


ALTER TABLE public.resena OWNER TO evaluaciones;

--
-- TOC entry 209 (class 1259 OID 49153)
-- Name: usuario; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.usuario (
    id uuid NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100),
    correo character varying(100) NOT NULL,
    contrasena character varying(100) NOT NULL,
    direccion character varying(250),
    departamento character varying(100),
    ciudad character varying(100),
    cod_post character varying(100),
    telefono character varying(100)
);


ALTER TABLE public.usuario OWNER TO evaluaciones;

--
-- TOC entry 3196 (class 2606 OID 49173)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 49212)
-- Name: orden_producto orden_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT orden_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 49185)
-- Name: pc_armado pc_armado_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado
    ADD CONSTRAINT pc_armado_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 49227)
-- Name: pc_armado_producto pc_armado_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT pc_armado_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 49180)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 49166)
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 49192)
-- Name: resena resena_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 49159)
-- Name: usuario usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 49203)
-- Name: orden fk_orden_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 3210 (class 2606 OID 49213)
-- Name: orden_producto fk_ordenproducto_orden; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT fk_ordenproducto_orden FOREIGN KEY (orden_id) REFERENCES public.orden(id) NOT VALID;


--
-- TOC entry 3211 (class 2606 OID 49218)
-- Name: orden_producto fk_ordenproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT fk_ordenproducto_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id) NOT VALID;


--
-- TOC entry 3212 (class 2606 OID 49228)
-- Name: pc_armado_producto fk_pcarmadoproducto_pcarmado; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT fk_pcarmadoproducto_pcarmado FOREIGN KEY (pc_armado_id) REFERENCES public.pc_armado(id) NOT VALID;


--
-- TOC entry 3213 (class 2606 OID 49233)
-- Name: pc_armado_producto fk_pcarmadoproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT fk_pcarmadoproducto_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id) NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 49193)
-- Name: reporte fk_reporte_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fk_reporte_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 3209 (class 2606 OID 49198)
-- Name: resena fk_resena_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT fk_resena_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


-- Completed on 2022-11-23 01:01:37

--
-- PostgreSQL database dump complete
--

