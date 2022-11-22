--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-10-31 13:30:51

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
-- TOC entry 3325 (class 0 OID 16396)
-- Dependencies: 209
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: evaluaciones
--

INSERT INTO public.carrera VALUES ('8938e2b8-f987-419f-876e-c09597ed2d21', 'Ingeniería de Sistemas');
INSERT INTO public.carrera VALUES ('c8060d3e-4466-41ad-822c-1d9faaacf861', 'Ingeniería Industrial');


--
-- TOC entry 3328 (class 0 OID 16419)
-- Dependencies: 212
-- Data for Name: ciclo; Type: TABLE DATA; Schema: public; Owner: evaluaciones
--

INSERT INTO public.ciclo VALUES ('37956e56-f7e2-45fd-b0fd-394b7edad297', '2022-1');
INSERT INTO public.ciclo VALUES ('ebb08451-58ef-4093-8f08-1e9a9cbad6d2', '2022-2');


--
-- TOC entry 3326 (class 0 OID 16401)
-- Dependencies: 210
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: evaluaciones
--

INSERT INTO public.curso VALUES ('fec8d371-3719-4c1e-8e4d-88facfe3b28a', 'Lenguajes de Programación', '8938e2b8-f987-419f-876e-c09597ed2d21');
INSERT INTO public.curso VALUES ('348b5502-15db-4d02-a456-b3722cf7d881', 'Dibujo de Ingeniería', 'c8060d3e-4466-41ad-822c-1d9faaacf861');
INSERT INTO public.curso VALUES ('f6849b3f-1698-4e16-9cc6-dae5b15272d1', 'Programación Web', '8938e2b8-f987-419f-876e-c09597ed2d21');


--
-- TOC entry 3327 (class 0 OID 16411)
-- Dependencies: 211
-- Data for Name: evaluacion; Type: TABLE DATA; Schema: public; Owner: evaluaciones
--

INSERT INTO public.evaluacion VALUES ('bc712356-c641-4e11-ab05-a9a46f8174d1', 'PC1', '2022-10-31 13:27:00', 'f6849b3f-1698-4e16-9cc6-dae5b15272d1', 'ebb08451-58ef-4093-8f08-1e9a9cbad6d2');


-- Completed on 2022-10-31 13:30:52

--
-- PostgreSQL database dump complete
--

