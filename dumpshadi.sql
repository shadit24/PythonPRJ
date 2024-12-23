--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: samsung_phone_finall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samsung_phone_finall (
    id integer NOT NULL,
    title character varying(255),
    weight character varying(255),
    sizee character varying(255),
    pixel character varying(255),
    cpu character varying(255),
    memory character varying(255),
    ram character varying(255),
    network5g character varying(255),
    cammera character varying(255),
    battry character varying(255),
    pricee character varying(255)
);


ALTER TABLE public.samsung_phone_finall OWNER TO postgres;

--
-- Name: samsung_phone_finall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.samsung_phone_finall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.samsung_phone_finall_id_seq OWNER TO postgres;

--
-- Name: samsung_phone_finall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.samsung_phone_finall_id_seq OWNED BY public.samsung_phone_finall.id;


--
-- Name: samsung_phone_finall id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samsung_phone_finall ALTER COLUMN id SET DEFAULT nextval('public.samsung_phone_finall_id_seq'::regclass);


--
-- Data for Name: samsung_phone_finall; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samsung_phone_finall (id, title, weight, sizee, pixel, cpu, memory, ram, network5g, cammera, battry, pricee) FROM stdin;
13714776	Galaxy S24 Ultra 	233	6.8	505	3.39	256	12	TRUE	200	5000	699900000
14851833	Galaxy A55 	213	6.6	390	2.75	256	8	TRUE	50	5000	256800000
13969461	Galaxy A15 	200	6.5	396	2.2	128	6	FALSE	50	5000	112990000
12924184	Galaxy S23 FE 	209	6.4	403	2.8	256	8	TRUE	50	4500	307600000
14851175	█î╪º┘ü╪¬ ┘å╪┤╪»	209	6.6	390	2.4	128	8	TRUE	50	5000	172890000
11103764	Galaxy S23 Ultra 	234	6.8	501	3.36	256	12	TRUE	200	5000	609990000
13968309	Galaxy A15 	200	6.5	396	2.2	128	4	FALSE	50	5000	105690000
14851182	█î╪º┘ü╪¬ ┘å╪┤╪»	209	6.6	390	2.4	256	8	TRUE	50	5000	198500000
13969596	Galaxy A15 	200	6.5	396	2.2	256	8	FALSE	50	5000	136900000
14175877	Galaxy S24 Ultra 	233	6.8	505	3.39	512	12	TRUE	200	5000	897390000
13804646	Galaxy A05s 	194	6.7	393	2.4	128	4	FALSE	50	5000	89800000
13804607	Galaxy A05s 	194	6.7	393	2.4	64	4	FALSE	50	5000	74900000
13586950	Galaxy A05 	195	6.7	262	2.0	64	4	FALSE	50	5000	69550000
14129480	Galaxy S24 		6.2	416	3.2	256	8	TRUE	50	4000	551000000
13980975	Galaxy A25 	197	6.5	396	2.4	128	6	TRUE	50	5000	137500000
14663276	Galaxy S24 Ultra 	233	6.8	505	3.39	1	12	TRUE	200	5000	1049400000
11103849	Galaxy S23 Ultra 	234	6.8	501	3.36	512	12	TRUE	200	5000	738300000
13257100	Galaxy S21 FE 5G 	177	6.4	403	2.84	256	8	TRUE	12		259000000
12224131	Galaxy Z Flip5 	187	6.7	426	\N	512	8	TRUE	12		529900000
14127306	Galaxy S24 Plus 	196	6.7	513	3.2	256	12	TRUE	50	4900	663400000
12223768	Galaxy Z Fold5 	253	7.6	373	3.36	256	12	TRUE	50	4400	800000000
13804793	Galaxy A05s 	194	6.7	393	2.4	128	6	FALSE	50	5000	96830000
13980612	Galaxy A25 	197	6.5	396	2.4	128	6	TRUE	50	5000	136400000
12924162	Galaxy S23 FE 	209	6.4	403	2.8	256	8	TRUE	50	4500	313580000
13968049	Galaxy A15 	200	6.5	396	2.2	128	4	FALSE	50	5000	112800000
13981087	Galaxy A25 	197	6.5	396	2.4	256	8	TRUE	50	5000	160900000
13969402	Galaxy A15 	200	6.5	396	2.2	128	6	FALSE	50	5000	122600000
12224035	Galaxy Z Fold5 	253	7.6	373	3.36	512	12	TRUE	50	4400	780000000
17465958	Galaxy A16 4G 	200	6.7	385	2.2	128	4	FALSE	50	5000	119900000
14181093	Galaxy A15 	200	6.5	396	2.2	128	6	FALSE	50	5000	127900000
17464490	Galaxy A16 4G 	200	6.7	385	2.2	128	6	FALSE	50	5000	128500000
16151809	Galaxy A15 	200	6.5	396	2.2	128	6	FALSE	50	5000	124990000
16132483	Galaxy S23 FE 	209	6.4	403	2.8	256	8	TRUE	50	4500	369000000
16150843	Galaxy S24 Ultra 	233	6.8	505	3.39	512	12	TRUE	200	5000	999900000
16151741	Galaxy A15 	200	6.5	396	2.2	128	4	FALSE	50	5000	121950000
15814585	Z Flip 6 	187	6.7	426	3.3	512	12	TRUE	50	4000	749000000
15315429	Galaxy A55 	213	6.6	390	2.75	256	8	TRUE	50	5000	263200000
16410948	Galaxy A54 5G 	202	6.4	403	2.4	256	8	TRUE	50	5000	258500000
16552106	Galaxy A06 	189	6.7		2.0	128	6	FALSE	50	5000	81400000
15315291	█î╪º┘ü╪¬ ┘å╪┤╪»	209	6.6	390	2.4	256	8	TRUE	50	5000	202000000
16130991	Galaxy A34 5G 	199	6.6	390	2.6	256	8	TRUE	48	5000	214000000
15315183	█î╪º┘ü╪¬ ┘å╪┤╪»	209	6.6	390	2.4	128	8	TRUE	50	5000	183000000
14167562	Galaxy A15 	200	6.5	396	2.2	128	4	FALSE	50	5000	118800000
17414592	S24 FE 	213	6.7	385	3.11	256	8	TRUE	50	4700	364990000
16317589	Galaxy A55 	213	6.6	390	2.75	128	8	TRUE	50	5000	238800000
14181343	Galaxy A05s 	194	6.7	393	2.4	128	4	FALSE	50	5000	93900000
16132015	█î╪º┘ü╪¬ ┘å╪┤╪»	209	6.6	390	2.4	256	8	TRUE	50	5000	199990000
17466103	Galaxy A16 4G 	200	6.7	385	2.2	256	8	FALSE	50	5000	149900000
16798177	Galaxy A06 	189	6.7		2.0	128	6	FALSE	50	5000	88700000
16018645	Z Flip 6 	187	6.7	426	3.3	256	12	TRUE	50	4000	695500000
16061979	Galaxy A55 	213	6.6	390	2.75	256	8	TRUE	50	5000	258500000
16736269	S24 FE 	213	6.7	385	3.11	256	8	TRUE	50	4700	362000000
14167306	Galaxy A25 	197	6.5	396	2.4	256	8	TRUE	50	5000	170000000
17466053	Galaxy A16 4G 	200	6.7	385	2.2	128	6	FALSE	50	5000	130900000
16166965	Galaxy M14 4G 	194	6.7	394	2.4	64	4	FALSE	50	5000	77990000
16736268	S24 FE 	213	6.7	385	3.11	256	8	TRUE	50	4700	362000000
16129439	Galaxy A15 	200	6.5	396	2.2	256	8	FALSE	50	5000	149000000
16798200	Galaxy A06 	189	6.7		2.0	64	4	FALSE	50	5000	72900000
14167482	Galaxy A25 	197	6.5	396	2.4	128	6	TRUE	50	5000	137400000
\.


--
-- Name: samsung_phone_finall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.samsung_phone_finall_id_seq', 1, false);


--
-- Name: samsung_phone_finall samsung_phone_finall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samsung_phone_finall
    ADD CONSTRAINT samsung_phone_finall_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

