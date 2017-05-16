--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bands (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bands_concerts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bands_concerts (
    band_id integer NOT NULL,
    concert_id integer NOT NULL
);


--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bands_id_seq OWNED BY bands.id;


--
-- Name: concerts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE concerts (
    id integer NOT NULL,
    date date,
    "time" character varying,
    venue_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: concerts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE concerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: concerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE concerts_id_seq OWNED BY concerts.id;


--
-- Name: lineups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lineups (
    id integer NOT NULL,
    concert_id integer,
    band_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lineups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lineups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lineups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lineups_id_seq OWNED BY lineups.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: venues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venues (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venues_id_seq OWNED BY venues.id;


--
-- Name: bands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bands ALTER COLUMN id SET DEFAULT nextval('bands_id_seq'::regclass);


--
-- Name: concerts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY concerts ALTER COLUMN id SET DEFAULT nextval('concerts_id_seq'::regclass);


--
-- Name: lineups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lineups ALTER COLUMN id SET DEFAULT nextval('lineups_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: venues id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venues ALTER COLUMN id SET DEFAULT nextval('venues_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-05-02 19:23:48.413595	2017-05-02 19:23:48.413595
\.


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bands (id, name, created_at, updated_at) FROM stdin;
1	Thursday	2017-05-02 19:25:30.777832	2017-05-02 19:25:30.777832
2	Pup	2017-05-02 19:25:30.794343	2017-05-02 19:25:30.794343
3	The Hotelier	2017-05-02 19:25:30.799787	2017-05-02 19:25:30.799787
4	Jeff Rosenstock	2017-05-02 19:25:30.805261	2017-05-02 19:25:30.805261
5	Tony Molina	2017-05-02 19:25:30.810264	2017-05-02 19:25:30.810264
6	Signals Midwest	2017-05-02 19:26:36.178113	2017-05-02 19:26:36.178113
7	Great Cynics	2017-05-02 19:26:36.183617	2017-05-02 19:26:36.183617
8	Thin Lips	2017-05-02 19:26:36.190056	2017-05-02 19:26:36.190056
9	Thick	2017-05-02 19:26:36.195319	2017-05-02 19:26:36.195319
10	Iron Chic	2017-05-02 19:27:16.156423	2017-05-02 19:27:16.156423
11	Dead Heavens	2017-05-02 19:27:16.161929	2017-05-02 19:27:16.161929
12	MakeWar	2017-05-02 19:27:16.167464	2017-05-02 19:27:16.167464
13	Earworms	2017-05-02 19:27:16.17497	2017-05-02 19:27:16.17497
14	Downtown Boys	2017-05-02 19:27:54.136977	2017-05-02 19:27:54.136977
15	Flesh World	2017-05-02 19:27:54.141981	2017-05-02 19:27:54.141981
16	Field Agent	2017-05-02 19:27:54.147985	2017-05-02 19:27:54.147985
17	Mutoid Man	2017-05-02 19:28:34.246666	2017-05-02 19:28:34.246666
18	Helms Alee	2017-05-02 19:28:34.25267	2017-05-02 19:28:34.25267
19	Ache	2017-05-02 19:28:34.257639	2017-05-02 19:28:34.257639
20	Laura Stevenson	2017-05-02 19:31:17.553186	2017-05-02 19:31:17.553186
21	Test Concert	2017-05-05 18:52:44.399833	2017-05-05 18:52:44.399833
22	Against Me!	2017-05-08 22:29:39.711202	2017-05-08 22:29:39.711202
23	Bleached	2017-05-08 22:29:39.723211	2017-05-08 22:29:39.723211
24	The Dirty Nil	2017-05-08 22:29:39.729214	2017-05-08 22:29:39.729214
25	Japandroids	2017-05-08 22:30:04.694823	2017-05-08 22:30:04.694823
26	The Specials	2017-05-08 22:30:53.449212	2017-05-08 22:30:53.449212
27	The Far East	2017-05-08 22:30:53.456217	2017-05-08 22:30:53.456217
28	Piebald	2017-05-08 22:33:32.202928	2017-05-08 22:33:32.202928
29	Sorority Noise	2017-05-08 22:34:15.217269	2017-05-08 22:34:15.217269
30	Forth Wanderers	2017-05-08 22:34:15.222277	2017-05-08 22:34:15.222277
31	The Obsessives	2017-05-08 22:34:15.227276	2017-05-08 22:34:15.227276
32	Shannen Moser	2017-05-08 22:34:15.232279	2017-05-08 22:34:15.232279
33	Chuck Ragan	2017-05-08 22:35:51.065872	2017-05-08 22:35:51.065872
34	Pissed Jeans	2017-05-08 22:38:08.016741	2017-05-08 22:38:08.016741
35	Feral Ohms	2017-05-08 22:38:08.023746	2017-05-08 22:38:08.023746
36	Pinkwash	2017-05-08 22:38:08.029752	2017-05-08 22:38:08.029752
37	Big Business	2017-05-08 22:39:37.046537	2017-05-08 22:39:37.046537
38	The Flatliners	2017-05-16 16:30:39.334617	2017-05-16 16:30:39.334617
39	Pkew Pkew Pkew	2017-05-16 16:30:39.356634	2017-05-16 16:30:39.356634
40	Garrett Dale	2017-05-16 16:30:39.362637	2017-05-16 16:30:39.362637
41	Red City Radio	2017-05-16 16:31:43.69809	2017-05-16 16:31:43.69809
42	Russian Girlfriends	2017-05-16 16:31:43.730098	2017-05-16 16:31:43.730098
43	The Bombpops	2017-05-16 16:31:43.742109	2017-05-16 16:31:43.742109
44	Planes Mistaken For Stars	2017-05-16 16:33:59.297993	2017-05-16 16:33:59.297993
45	Crushed	2017-05-16 16:33:59.320008	2017-05-16 16:33:59.320008
46	Husbandry	2017-05-16 16:33:59.330015	2017-05-16 16:33:59.330015
47	Free Throw	2017-05-16 16:35:35.829994	2017-05-16 16:35:35.829994
48	Homesafe	2017-05-16 16:35:35.849005	2017-05-16 16:35:35.849005
49	Heart Attack Man	2017-05-16 16:35:35.858012	2017-05-16 16:35:35.858012
50	Tim Kasher	2017-05-16 16:36:07.471021	2017-05-16 16:36:07.471021
51	John Bradley	2017-05-16 16:36:07.479027	2017-05-16 16:36:07.479027
52	Campdogzz	2017-05-16 16:36:07.487032	2017-05-16 16:36:07.487032
\.


--
-- Data for Name: bands_concerts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bands_concerts (band_id, concert_id) FROM stdin;
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bands_id_seq', 52, true);


--
-- Data for Name: concerts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY concerts (id, date, "time", venue_id, created_at, updated_at) FROM stdin;
1	2017-06-11	2:00 PM	3	2017-05-02 19:25:30.757316	2017-05-02 19:25:30.757316
2	2017-05-19	08:00 PM	2	2017-05-02 19:26:36.163961	2017-05-02 19:26:36.163961
3	2017-05-12	8:00 PM	1	2017-05-02 19:27:16.15092	2017-05-02 19:27:16.15092
4	2017-06-09	8:00 PM	1	2017-05-02 19:27:54.132475	2017-05-02 19:27:54.132475
5	2017-06-05	07:30 PM	1	2017-05-02 19:28:34.240671	2017-05-02 19:28:34.240671
6	2017-08-09		4	2017-05-02 19:31:17.544679	2017-05-02 19:31:17.544679
8	2017-10-14	8:00 PM	5	2017-05-08 22:29:39.704198	2017-05-08 22:29:39.704198
9	2017-10-26	8:00 PM	5	2017-05-08 22:30:04.689821	2017-05-08 22:30:04.689821
10	2017-06-09	8:00 PM	5	2017-05-08 22:30:53.444209	2017-05-08 22:30:53.444209
11	2017-05-25	9:00 PM	6	2017-05-08 22:33:32.196927	2017-05-08 22:33:32.196927
12	2017-06-15	7:30 PM	6	2017-05-08 22:34:15.211282	2017-05-08 22:34:15.211282
13	2017-06-11	8:00 PM	7	2017-05-08 22:35:51.061869	2017-05-08 22:35:51.061869
14	2017-06-10	7:00 PM	8	2017-05-08 22:37:14.913012	2017-05-08 22:37:14.913012
15	2017-06-23	9:30 PM	8	2017-05-08 22:38:08.013739	2017-05-08 22:38:08.013739
16	2017-06-30	10:00 PM	8	2017-05-08 22:39:37.041533	2017-05-08 22:39:37.041533
17	2017-07-14	8:00 PM	9	2017-05-16 16:30:39.323611	2017-05-16 16:30:39.323611
18	2017-05-20	8:00 PM	9	2017-05-16 16:31:43.673057	2017-05-16 16:31:43.673057
19	2017-06-23	11:30 PM	9	2017-05-16 16:33:59.282981	2017-05-16 16:33:59.282981
20	2017-06-23	7:00 PM	9	2017-05-16 16:35:35.816983	2017-05-16 16:35:35.816983
21	2017-06-03	7:30 PM	9	2017-05-16 16:36:07.461017	2017-05-16 16:36:07.461017
\.


--
-- Name: concerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('concerts_id_seq', 21, true);


--
-- Data for Name: lineups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lineups (id, concert_id, band_id, "position", created_at, updated_at) FROM stdin;
1	1	1	\N	2017-05-02 19:25:30.790339	2017-05-02 19:25:30.790339
2	1	2	\N	2017-05-02 19:25:30.797285	2017-05-02 19:25:30.797285
3	1	3	\N	2017-05-02 19:25:30.801789	2017-05-02 19:25:30.801789
4	1	4	\N	2017-05-02 19:25:30.807262	2017-05-02 19:25:30.807262
5	1	5	\N	2017-05-02 19:25:30.812545	2017-05-02 19:25:30.812545
6	2	6	\N	2017-05-02 19:26:36.181114	2017-05-02 19:26:36.181114
7	2	7	\N	2017-05-02 19:26:36.187119	2017-05-02 19:26:36.187119
8	2	8	\N	2017-05-02 19:26:36.192302	2017-05-02 19:26:36.192302
9	2	9	\N	2017-05-02 19:26:36.197319	2017-05-02 19:26:36.197319
10	3	10	\N	2017-05-02 19:27:16.159426	2017-05-02 19:27:16.159426
11	3	11	\N	2017-05-02 19:27:16.165474	2017-05-02 19:27:16.165474
12	3	12	\N	2017-05-02 19:27:16.170467	2017-05-02 19:27:16.170467
13	3	13	\N	2017-05-02 19:27:16.182445	2017-05-02 19:27:16.182445
14	4	14	\N	2017-05-02 19:27:54.139479	2017-05-02 19:27:54.139479
15	4	15	\N	2017-05-02 19:27:54.144482	2017-05-02 19:27:54.144482
16	4	16	\N	2017-05-02 19:27:54.149986	2017-05-02 19:27:54.149986
17	5	17	\N	2017-05-02 19:28:34.249667	2017-05-02 19:28:34.249667
18	5	18	\N	2017-05-02 19:28:34.255671	2017-05-02 19:28:34.255671
19	5	19	\N	2017-05-02 19:28:34.259391	2017-05-02 19:28:34.259391
20	6	4	\N	2017-05-02 19:31:17.549682	2017-05-02 19:31:17.549682
21	6	20	\N	2017-05-02 19:31:17.555687	2017-05-02 19:31:17.555687
22	7	21	\N	2017-05-05 18:52:44.409853	2017-05-05 18:52:44.409853
23	8	22	\N	2017-05-08 22:29:39.719209	2017-05-08 22:29:39.719209
24	8	23	\N	2017-05-08 22:29:39.725213	2017-05-08 22:29:39.725213
25	8	24	\N	2017-05-08 22:29:39.731217	2017-05-08 22:29:39.731217
26	9	25	\N	2017-05-08 22:30:04.697825	2017-05-08 22:30:04.697825
27	10	26	\N	2017-05-08 22:30:53.453215	2017-05-08 22:30:53.453215
28	10	27	\N	2017-05-08 22:30:53.458217	2017-05-08 22:30:53.458217
29	11	28	\N	2017-05-08 22:33:32.205932	2017-05-08 22:33:32.205932
30	12	29	\N	2017-05-08 22:34:15.220271	2017-05-08 22:34:15.220271
31	12	30	\N	2017-05-08 22:34:15.224274	2017-05-08 22:34:15.224274
32	12	31	\N	2017-05-08 22:34:15.229277	2017-05-08 22:34:15.229277
33	12	32	\N	2017-05-08 22:34:15.23428	2017-05-08 22:34:15.23428
34	13	33	\N	2017-05-08 22:35:51.067873	2017-05-08 22:35:51.067873
35	14	33	\N	2017-05-08 22:37:14.918015	2017-05-08 22:37:14.918015
36	15	34	\N	2017-05-08 22:38:08.020744	2017-05-08 22:38:08.020744
37	15	35	\N	2017-05-08 22:38:08.026749	2017-05-08 22:38:08.026749
38	15	36	\N	2017-05-08 22:38:08.031753	2017-05-08 22:38:08.031753
39	16	37	\N	2017-05-08 22:39:37.048538	2017-05-08 22:39:37.048538
40	17	38	\N	2017-05-16 16:30:39.348637	2017-05-16 16:30:39.348637
41	17	39	\N	2017-05-16 16:30:39.359636	2017-05-16 16:30:39.359636
42	17	40	\N	2017-05-16 16:30:39.365639	2017-05-16 16:30:39.365639
43	18	41	\N	2017-05-16 16:31:43.723091	2017-05-16 16:31:43.723091
44	18	42	\N	2017-05-16 16:31:43.734099	2017-05-16 16:31:43.734099
45	18	43	\N	2017-05-16 16:31:43.74911	2017-05-16 16:31:43.74911
46	19	44	\N	2017-05-16 16:33:59.31302	2017-05-16 16:33:59.31302
47	19	45	\N	2017-05-16 16:33:59.324011	2017-05-16 16:33:59.324011
48	19	46	\N	2017-05-16 16:33:59.333017	2017-05-16 16:33:59.333017
49	20	47	\N	2017-05-16 16:35:35.843003	2017-05-16 16:35:35.843003
50	20	48	\N	2017-05-16 16:35:35.853008	2017-05-16 16:35:35.853008
51	20	49	\N	2017-05-16 16:35:35.862015	2017-05-16 16:35:35.862015
52	21	50	\N	2017-05-16 16:36:07.476025	2017-05-16 16:36:07.476025
53	21	51	\N	2017-05-16 16:36:07.483032	2017-05-16 16:36:07.483032
54	21	52	\N	2017-05-16 16:36:07.490034	2017-05-16 16:36:07.490034
\.


--
-- Name: lineups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lineups_id_seq', 54, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20170501153226
20170501153248
20170501153259
20170502181126
20170501154842
20170516160422
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, password_digest, created_at, updated_at) FROM stdin;
1	michael.alexander.benson@gmail.com	$2a$10$3QMxm.cUMlzO706cRvLpKOs8cZHm41Wu9a0NKSR2yxT4A26t7jIIC	2017-05-16 16:19:34.873931	2017-05-16 16:19:34.873931
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY venues (id, name, created_at, updated_at) FROM stdin;
1	Saint Vitus	2017-05-02 19:24:16.708887	2017-05-02 19:24:16.708887
2	Suburbia	2017-05-02 19:24:27.583658	2017-05-02 19:24:27.583658
3	McCarren Park	2017-05-02 19:24:34.469269	2017-05-02 19:24:34.469269
4	Monty Hall	2017-05-02 19:30:52.058294	2017-05-02 19:30:52.058294
5	Brooklyn Steel	2017-05-08 22:29:00.213345	2017-05-08 22:29:00.213345
6	Music Hall of Williamsburg	2017-05-08 22:33:06.012458	2017-05-08 22:33:06.012458
7	Rough Trade NYC	2017-05-08 22:35:26.007198	2017-05-08 22:35:26.007198
8	Mercury Lounge	2017-05-08 22:36:46.848217	2017-05-08 22:36:46.848217
9	Knitting Factory	2017-05-16 16:30:16.593355	2017-05-16 16:30:16.593355
\.


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('venues_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bands bands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT bands_pkey PRIMARY KEY (id);


--
-- Name: concerts concerts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY concerts
    ADD CONSTRAINT concerts_pkey PRIMARY KEY (id);


--
-- Name: lineups lineups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lineups
    ADD CONSTRAINT lineups_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: index_bands_concerts_on_band_id_and_concert_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bands_concerts_on_band_id_and_concert_id ON bands_concerts USING btree (band_id, concert_id);


--
-- Name: index_concerts_on_venue_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_concerts_on_venue_id ON concerts USING btree (venue_id);


--
-- PostgreSQL database dump complete
--

