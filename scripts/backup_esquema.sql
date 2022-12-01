--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: categoria_prod; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.categoria_prod (
    id uuid NOT NULL,
    nombre character varying(150)
);


ALTER TABLE public.categoria_prod OWNER TO evaluaciones;

--
-- Name: epic; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.epic (
    id uuid NOT NULL,
    nombre character varying(50),
    descripcion character varying(300)
);


ALTER TABLE public.epic OWNER TO evaluaciones;

--
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
-- Name: orden_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_producto (
    id uuid NOT NULL,
    orden_id uuid,
    producto_id uuid
);


ALTER TABLE public.orden_producto OWNER TO postgres;

--
-- Name: pc_armado; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pc_armado (
    id uuid NOT NULL,
    nombre character varying(100),
    descripcion character varying(100)
);


ALTER TABLE public.pc_armado OWNER TO evaluaciones;

--
-- Name: pc_armado_producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pc_armado_producto (
    id uuid NOT NULL,
    pc_armado_id uuid,
    producto_id uuid,
    nombre character varying(150)
);


ALTER TABLE public.pc_armado_producto OWNER TO evaluaciones;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.producto (
    id uuid NOT NULL,
    nombre character varying,
    precio character varying,
    descripcion character varying,
    categoria character varying,
    categoria_prod_id uuid,
    pc_armado_id uuid,
    u_vendidas character varying,
    fk_tipo uuid,
    fk_descripcion uuid
);


ALTER TABLE public.producto OWNER TO evaluaciones;

--
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
-- Name: steam; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.steam (
    id uuid NOT NULL,
    nombre character varying(50),
    descripcion character varying(300)
);


ALTER TABLE public.steam OWNER TO evaluaciones;

--
-- Name: tipo; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.tipo (
    id uuid NOT NULL,
    nombre character varying
);


ALTER TABLE public.tipo OWNER TO evaluaciones;

--
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
-- Name: categoria_prod categorías_prod_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.categoria_prod
    ADD CONSTRAINT "categorías_prod_pkey" PRIMARY KEY (id);


--
-- Name: epic epic_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.epic
    ADD CONSTRAINT epic_pkey PRIMARY KEY (id);


--
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- Name: orden_producto orden_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT orden_producto_pkey PRIMARY KEY (id);


--
-- Name: pc_armado pc_armado_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado
    ADD CONSTRAINT pc_armado_pkey PRIMARY KEY (id);


--
-- Name: pc_armado_producto pc_armado_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT pc_armado_producto_pkey PRIMARY KEY (id);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id);


--
-- Name: resena resena_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (id);


--
-- Name: steam steam_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.steam
    ADD CONSTRAINT steam_pkey PRIMARY KEY (id);


--
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- Name: usuario usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: producto fk_categoria_prod; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_categoria_prod FOREIGN KEY (categoria_prod_id) REFERENCES public.categoria_prod(id) NOT VALID;


--
-- Name: orden fk_orden_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


--
-- Name: orden_producto fk_ordenproducto_orden; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT fk_ordenproducto_orden FOREIGN KEY (orden_id) REFERENCES public.orden(id) NOT VALID;


--
-- Name: orden_producto fk_ordenproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT fk_ordenproducto_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id) NOT VALID;


--
-- Name: pc_armado_producto fk_pcarmadoproducto_pcarmado; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT fk_pcarmadoproducto_pcarmado FOREIGN KEY (pc_armado_id) REFERENCES public.pc_armado(id) NOT VALID;


--
-- Name: pc_armado_producto fk_pcarmadoproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pc_armado_producto
    ADD CONSTRAINT fk_pcarmadoproducto_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id) NOT VALID;


--
-- Name: reporte fk_reporte_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fk_reporte_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


--
-- Name: resena fk_resena_usuario; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.resena
    ADD CONSTRAINT fk_resena_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

