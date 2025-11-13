--
-- PostgreSQL database dump
--

\restrict 4hMNAoU1yL5nDLJG3DRDUEljzfECYxnh754eCJmKbQcWxDO0pxtmAnpl30izJzZ

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-13 13:13:16 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    birth_date date NOT NULL,
    nationality character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 220 (class 1259 OID 16394)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 221 (class 1259 OID 16395)
-- Name: entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entries (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    entered_at timestamp without time zone NOT NULL,
    exited_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 222 (class 1259 OID 16403)
-- Name: entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 222
-- Name: entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entries_id_seq OWNED BY public.entries.id;


--
-- TOC entry 223 (class 1259 OID 16404)
-- Name: memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.memberships (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    offer_id integer NOT NULL,
    valid_from date NOT NULL,
    valid_to date NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 224 (class 1259 OID 16413)
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 224
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- TOC entry 225 (class 1259 OID 16414)
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    price numeric(10,2) NOT NULL,
    days_valid integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 226 (class 1259 OID 16422)
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 226
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- TOC entry 3301 (class 2604 OID 16536)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 16537)
-- Name: entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entries ALTER COLUMN id SET DEFAULT nextval('public.entries_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 16538)
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 16539)
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- TOC entry 3471 (class 0 OID 16385)
-- Dependencies: 219
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers (id, first_name, last_name, birth_date, nationality, created_at) FROM stdin;
1	Robert	Michałek	1965-06-01	Polska	2025-06-10 22:28:47.777
2	Hilarion	Piotrowicz	1972-01-24	Polska	2024-12-21 21:09:44.225
3	Cecyliusz	Dziuba	1994-03-19	Polska	2025-08-24 06:02:28.363
4	Prokop	Klimczak	1983-01-08	Polska	2025-07-13 10:12:30.499
5	Ernest	Sobieraj	2005-01-04	Polska	2024-12-06 13:35:43.729
6	Lidia	Gawron	1996-06-01	Polska	2025-03-15 00:40:14.582
7	Ginewra	Krzemiński	1975-04-21	Polska	2025-07-13 22:28:06.086
8	Włodzimierz	Szulc	1971-02-27	Białoruś	2025-02-18 11:22:57.845
9	Konstanty	Krakowiak	1974-12-24	Polska	2025-06-14 22:12:35.912
10	Ksawera	Strzelczyk	2000-03-16	Polska	2025-05-24 03:59:22.64
11	Izaak	Niedźwiecki	2000-05-18	Polska	2024-11-18 20:24:45.96
12	Cecylia	Niedziela	1971-03-22	Polska	2025-02-23 04:52:12.553
13	Laurentyna	Pasternak	1994-05-08	Ukraina	2025-03-29 07:09:21.656
14	Harald	Michalak	1978-04-30	Niemcy	2025-03-12 19:29:45.01
15	Koralia	Kozioł	1999-10-22	Polska	2025-02-19 03:21:00.434
16	Klemens	Lasota	1968-08-13	Niemcy	2025-05-23 11:48:25.154
17	Julia	Lipka	1969-02-13	Polska	2025-08-11 00:54:00.543
18	Joachim	Klimek	2001-11-26	Polska	2025-02-02 02:16:36.861
19	Ludwika	Dobosz	2009-08-27	Ukraina	2024-11-17 04:10:55.618
20	Amanda	Graczyk	1967-11-11	Ukraina	2024-12-31 13:01:06.452
21	Natan	Sitek	1973-08-26	Polska	2025-10-15 08:20:08.693
22	Cyryl	Wasiak	1965-10-14	Polska	2025-01-16 04:42:58.596
23	Cyryl	Noga	1971-09-01	Polska	2025-04-19 12:38:42.155
24	Ireneusz	Kasprzyk	2002-08-31	Polska	2025-09-18 21:57:28.755
25	Salomon	Rudzki	1973-04-17	Polska	2025-07-29 22:39:47.799
26	Mikołaj	Zaręba	1963-12-24	Polska	2025-08-22 03:50:09.519
27	Cecyliusz	Owczarek	1963-11-16	Białoruś	2025-05-26 03:46:05.664
28	Anatol	Mazurkiewicz	2001-11-18	Polska	2025-08-17 02:51:07.015
29	Roksana	Bednarski	1990-04-01	Polska	2025-03-03 13:07:39.898
30	Platon	Witczak	1995-05-22	Polska	2025-10-20 13:15:19.016
31	Hieronim	Chmura	1988-05-20	Polska	2024-11-26 09:20:39.828
32	Gerazym	Zieliński	1985-06-08	Ukraina	2024-11-07 11:44:03.155
33	Miron	Radomski	2002-07-30	Polska	2025-04-24 12:52:52.997
34	Maksym	Palacz	1965-09-18	Polska	2025-04-19 05:19:26.763
35	Barbara	Stefaniak	1980-07-28	Niemcy	2025-06-17 23:26:06.176
36	Jakub	Czarnecki	1976-01-10	Polska	2025-06-12 18:49:47.784
37	Franciszka	Serafin	1992-12-05	Polska	2025-08-19 16:08:28.603
38	Roger	Zagórski	2003-07-21	Polska	2024-12-27 01:01:01.879
39	Adrian	Górecki	2002-08-13	Polska	2025-03-26 06:57:46.955
40	Randolf	Staszewski	2003-07-04	Polska	2025-09-28 19:48:50.432
41	Ada	Tokarski	1993-02-17	Polska	2024-11-11 08:04:00.262
42	Ariadna	Jurek	1990-06-28	Polska	2025-07-05 23:42:00.893
43	Ada	Wojtczak	1976-04-25	Polska	2025-03-10 06:52:24.796
44	Jeremi	Pawłowski	1973-03-31	Ukraina	2025-01-28 22:12:00.076
45	Pantaleon	Szymczak	1991-09-01	Niemcy	2025-09-05 15:17:23.615
46	Wawrzyniec	Janicki	1999-03-21	Polska	2025-02-06 12:31:35.781
47	Roksana	Wesołowski	1983-02-03	Polska	2025-04-05 02:08:48.352
48	Leila	Grudzień	1992-10-24	Polska	2024-11-14 03:07:56.861
49	Kornelia	Motyka	2007-03-18	Polska	2025-02-24 08:19:23.178
50	Dominik	Wojtczak	1987-08-09	Polska	2025-04-14 02:52:44.287
51	Gloria	Żurawski	1990-04-28	Ukraina	2025-02-16 12:52:15.368
52	Gracja	Kędziora	1973-03-16	Polska	2024-12-10 18:53:21.112
53	Lilia	Mazurek	1970-02-19	Polska	2025-01-22 13:31:02.6
54	Spirydion	Wieczorek	1963-11-01	Polska	2025-06-07 14:20:09.116
55	Noemi	Królikowski	1987-04-16	Polska	2025-07-18 11:50:54.942
56	Roksana	Sołtysiak	2003-05-09	Polska	2025-03-06 13:40:02.085
57	Irma	Michalik	1997-06-06	Polska	2025-10-23 04:50:04.993
58	Rajmund	Rojek	1999-10-23	Polska	2025-05-03 20:39:21.67
59	Olimpia	Bartczak	1967-12-23	Polska	2025-02-15 05:38:05.561
60	Józefina	Leśniak	1981-04-10	Polska	2024-12-16 22:41:21.799
61	Olga	Pawelec	1983-04-10	Polska	2025-10-03 23:33:02.04
62	Erwin	Malinowski	1991-04-17	Polska	2024-11-16 07:24:55.664
63	Salwator	Mikołajczak	1997-10-17	Białoruś	2025-05-15 21:16:14.039
64	Aleksander	Wiącek	1998-07-08	Polska	2025-01-25 12:17:34.149
65	Wilhelmina	Bielawski	2001-09-29	Białoruś	2025-06-11 22:37:20.039
66	Joanna	Witczak	1997-01-20	Polska	2025-01-27 05:46:43.159
67	Nikodem	Dąbkowski	1966-12-07	Polska	2025-05-23 05:30:01.399
68	Platon	Szczepaniak	1988-08-30	Polska	2025-06-06 09:04:48.762
69	Sylwester	Andrzejewski	2004-09-15	Polska	2024-12-03 01:37:09.212
70	Donald	Frąckowiak	1986-12-09	Białoruś	2025-09-05 09:11:05.905
71	Wilhelmina	Robak	1988-06-11	Ukraina	2025-11-03 14:50:34.103
72	Porfiry	Głąb	2004-06-08	Ukraina	2025-10-18 15:04:10.132
73	Patryk	Wojtczak	1984-10-22	Polska	2025-06-26 08:38:40.649
74	Sybilla	Świerczyński	1976-01-19	Ukraina	2025-10-18 07:01:35.589
75	Ilona	Dróżdż	2007-03-06	Białoruś	2025-04-07 16:54:26.518
76	Eliasz	Sowa	1968-08-24	Ukraina	2025-10-17 22:44:33.965
77	Franciszka	Wysocki	1984-03-30	Polska	2025-09-30 17:19:31.596
78	Rufina	Siwek	1989-02-14	Ukraina	2025-01-02 18:06:26.206
79	Dina	Włodarczyk	1995-03-15	Polska	2025-05-16 22:41:11.927
80	Lucja	Sołtys	2003-05-03	Polska	2025-02-26 21:02:01.503
81	Walenty	Sikorski	1998-10-25	Polska	2025-03-24 20:32:45.024
82	Brygida	Urbaniak	1986-01-26	Białoruś	2025-06-14 13:10:35.76
83	Feliks	Muszyński	1985-09-16	Niemcy	2025-08-31 17:23:43.433
84	Angelina	Jurkowski	1999-12-19	Ukraina	2025-08-16 10:46:04.084
85	Katarzyna	Sieradzki	1990-12-12	Białoruś	2025-02-21 02:55:41.894
86	Sylwia	Kaszuba	1964-12-19	Polska	2025-03-11 15:49:00.962
87	Benedykt	Murawski	1980-10-28	Polska	2025-11-03 14:19:30.916
88	Janina	Polak	1984-01-23	Polska	2025-08-17 19:25:00.707
89	Ireneusz	Jędrzejczak	1965-01-15	Białoruś	2025-07-29 03:28:23.488
90	Hipolit	Rutkowski	2009-01-06	Niemcy	2025-04-04 09:14:56.098
91	Aurora	Chmiel	1974-01-28	Białoruś	2025-07-18 19:45:29.665
92	Martyna	Jóźwiak	1972-08-03	Polska	2025-05-07 11:58:18.808
93	Olga	Piekarski	1981-03-14	Polska	2025-01-31 16:45:25.818
94	Bertram	Rakowski	1993-09-21	Polska	2025-10-27 16:03:37.217
95	Waleria	Mazur	1987-08-15	Polska	2025-10-01 07:05:56.835
96	Bertrand	Krawiec	1973-04-01	Polska	2024-12-15 16:11:58.561
97	Bruno	Bąk	1999-09-06	Polska	2025-08-19 17:01:28.834
98	Józefina	Marcinkowski	1983-09-29	Polska	2025-03-27 10:49:50.976
99	Konrad	Bednarski	1983-07-31	Polska	2025-06-28 14:01:18.94
100	Samuel	Gałązka	1985-05-10	Polska	2025-07-10 20:59:11.127
101	Renata	Mackiewicz	1963-09-28	Polska	2025-02-11 11:26:13.378
102	Pantaleon	Olszewski	2002-01-11	Białoruś	2025-06-17 03:27:50.205
103	Gerald	Lesiak	2004-01-16	Polska	2025-05-12 19:48:07.97
104	Ksawery	Tkaczyk	1990-10-27	Niemcy	2025-01-26 01:16:44.031
105	Sergiusz	Kubik	1998-04-23	Ukraina	2025-04-04 13:42:57.36
106	Oskar	Jędrzejczyk	2008-02-29	Polska	2025-04-10 19:09:03.461
107	Adam	Adamski	1968-06-16	Polska	2025-02-21 05:05:29.736
108	Malwina	Rak	1978-10-19	Polska	2024-12-05 23:37:37.641
109	Eudokia	Szwarc	1983-10-20	Białoruś	2025-05-07 11:56:07.59
110	Franciszka	Pawlikowski	1993-04-08	Polska	2025-10-26 19:17:25.222
111	Gonsalwy	Makowski	1980-09-26	Ukraina	2025-07-22 23:43:49.993
112	Oskar	Koper	1969-06-19	Białoruś	2024-12-25 21:51:14.543
113	Baldwin	Cybulski	1975-05-07	Polska	2025-09-12 00:12:54.331
114	Donald	Michalczyk	1980-01-18	Białoruś	2025-03-29 00:03:18.236
115	Leila	Warchoł	1972-05-25	Polska	2025-04-18 16:33:41.247
116	Modest	Trzeciak	1970-02-16	Ukraina	2025-01-30 05:00:17.368
117	Magnus	Serafin	1974-03-06	Polska	2024-12-19 07:25:42.51
118	Prokles	Rybicki	2003-06-25	Polska	2025-05-20 02:43:35.575
119	Walentyn	Murawski	1986-12-15	Polska	2025-09-20 01:08:22.348
120	Samson	Kula	1979-07-16	Polska	2025-05-01 14:25:04.589
121	Angelina	Wąsowski	1979-08-28	Polska	2025-06-15 05:59:21.343
122	Ryszard	Głąb	2000-02-16	Ukraina	2025-06-14 00:27:31.572
123	Efraim	Jabłoński	1989-10-28	Białoruś	2025-07-08 21:59:03.1
124	Jan	Marciniak	1991-02-11	Polska	2025-10-11 20:00:54.307
125	Serafina	Krakowiak	1971-08-07	Polska	2025-11-05 14:43:15.659
126	Ansgary	Baranowski	1984-06-04	Polska	2025-09-17 20:31:20.286
127	Reginald	Sołtys	1995-06-16	Polska	2025-07-01 08:01:19.558
128	Rudolf	Kawecki	2003-05-04	Polska	2025-02-10 15:44:37.313
129	Cezary	Maciąg	1997-12-03	Polska	2024-11-22 06:01:00.459
130	Marta	Trzciński	1969-07-06	Polska	2025-06-27 11:48:07.73
131	Walenty	Stec	2007-02-05	Polska	2025-03-23 20:16:33.401
132	Weronika	Tomys	1965-09-20	Polska	2025-09-17 01:52:59.543
133	Tacjana	Stępień	1988-12-29	Polska	2025-04-14 20:00:16.314
134	Wanda	Mielczarek	1984-11-08	Polska	2025-06-01 14:44:19.122
135	Rebeka	Janik	1985-08-27	Polska	2024-12-31 11:05:35.677
136	Chloe	Wąsowski	1973-09-06	Ukraina	2024-12-10 01:08:12.244
137	Irma	Majchrzak	1983-09-13	Polska	2025-09-10 16:26:35.687
138	Eudokia	Dudek	1991-11-05	Polska	2025-08-31 05:02:21.41
139	Gwido	Gawroński	1972-06-25	Białoruś	2024-11-30 12:22:19.682
140	Natan	Kulik	1995-03-20	Polska	2025-10-02 21:23:20.552
141	Anna	Kałuża	2001-10-18	Polska	2025-08-20 04:00:25.536
142	Aurora	Bożek	1986-06-01	Polska	2025-04-03 03:40:38.54
143	Magdalena	Czech	2008-04-16	Ukraina	2024-12-29 15:56:18.515
144	Zachary	Przybyła	1999-11-26	Polska	2025-01-01 23:56:50.401
145	Kalistrat	Mazur	1991-05-11	Ukraina	2025-02-21 05:40:49.94
146	Cyryl	Zarzycki	1992-05-07	Białoruś	2025-07-25 09:48:06.47
147	Malwina	Przybył	1990-11-05	Polska	2025-05-16 04:34:10.835
148	Jerzy	Wróbel	1994-10-07	Polska	2024-12-13 02:51:35.5
149	Nazariusz	Skrzypczak	1972-04-19	Polska	2025-03-07 13:13:20.123
150	Feliks	Siwek	2002-03-16	Polska	2025-05-18 04:33:27.053
151	Julia	Szewczyk	1999-11-04	Ukraina	2025-03-05 07:09:35.31
152	Porfiriusz	Dec	1994-11-17	Polska	2025-01-14 04:52:14.824
153	Paweł	Kaczmarek	1997-01-06	Polska	2024-11-07 03:02:51.752
154	Waleria	Maćkowiak	1964-08-20	Polska	2025-05-25 02:37:49.357
155	Walerian	Brzozowski	1976-04-15	Polska	2025-04-04 17:04:28.766
156	Marianna	Pawłowski	1971-12-07	Ukraina	2025-06-13 02:57:21.552
157	Tekla	Leszczyński	1964-01-12	Ukraina	2024-11-07 05:32:12.634
158	Irena	Staszewski	1965-07-26	Polska	2025-09-29 19:52:16.725
159	Ruta	Miklaś	1973-11-13	Polska	2025-04-09 10:18:08.182
160	Laura	Różycki	1991-02-14	Białoruś	2025-09-22 23:17:39.573
161	Witalis	Kaczyński	1965-11-10	Polska	2025-11-06 00:10:22.895
162	Juliusz	Rojek	2008-06-25	Polska	2025-08-16 16:02:17.241
163	Franciszek	Marczak	2008-03-29	Polska	2025-05-21 08:58:01.875
164	Nazary	Janas	1986-03-06	Polska	2024-11-17 02:52:08.142
165	Cezary	Matuszak	1967-12-29	Polska	2025-08-15 08:23:22.966
166	Samuel	Zabłocki	2007-03-23	Polska	2025-11-06 00:31:30.654
167	Sergiusz	Kisiel	2009-10-10	Polska	2025-09-16 17:20:01.862
168	Agaton	Żyła	1992-03-22	Białoruś	2025-06-11 12:52:45.952
169	Rudolf	Królikowski	1992-06-15	Niemcy	2025-06-05 19:22:24.354
170	Joanna	Sowa	1964-09-03	Polska	2025-09-14 20:00:18.414
171	Stefan	Kacprzak	1965-03-01	Polska	2024-11-22 01:31:57.445
172	Ferdynanda	Ossowski	1995-09-28	Polska	2025-10-29 11:50:12.807
173	Beatrycze	Wrona	2006-09-17	Polska	2025-08-19 17:03:17.968
174	Leila	Dąbkowski	2001-07-30	Polska	2024-11-27 00:08:38.027
175	Florencja	Węgrzyn	1983-10-22	Polska	2024-12-20 17:51:14.78
176	Pankracy	Woś	2002-11-01	Ukraina	2025-08-10 20:33:18.973
177	Monika	Piasecki	1985-12-15	Polska	2025-05-01 02:30:12.738
178	Bazyli	Chrzanowski	1963-03-25	Białoruś	2024-11-07 18:37:14.221
179	Laurenty	Pawlik	1986-09-28	Polska	2024-12-01 20:34:58.265
180	Polikarp	Janas	1975-05-05	Polska	2024-11-09 17:32:50.959
181	Wiara	Konieczny	2008-01-03	Polska	2025-10-12 18:50:32.139
182	Wiktor	Flak	1990-06-25	Polska	2025-09-15 05:31:24.513
183	Fabian	Michalczyk	1967-07-27	Ukraina	2025-02-27 06:47:42.172
184	Edmund	Antczak	1990-12-19	Białoruś	2025-10-14 23:40:53.634
185	Szymon	Kulig	2009-08-06	Ukraina	2024-11-22 12:10:19.049
186	Ksenia	Bieniek	1983-01-04	Ukraina	2025-03-20 15:39:18.697
187	Nikola	Jarosz	1997-05-04	Polska	2025-07-14 09:47:33.535
188	Szymon	Góra	1999-02-18	Polska	2025-02-26 23:36:22.909
189	Oleg	Grzesiak	1998-09-12	Polska	2025-07-07 02:08:21.251
190	Walentyn	Grochowski	1983-12-25	Niemcy	2025-07-24 19:33:57.177
191	Lucja	Koper	1978-02-11	Polska	2025-05-11 00:53:29.656
192	Nazariusz	Kubacki	1982-03-28	Niemcy	2025-07-14 23:04:19.49
193	Eustracjusz	Kmiecik	1966-10-22	Polska	2025-07-28 15:14:50.712
194	Maja	Woliński	1972-07-07	Polska	2025-04-09 07:02:48.067
195	Stella	Kula	2009-06-14	Polska	2025-01-07 21:06:24.802
196	Samson	Chojnowski	1983-07-14	Białoruś	2025-01-14 23:31:24.391
197	Janina	Ziętek	1981-02-01	Polska	2025-03-01 15:35:13.881
198	Juliusz	Domagała	2008-06-16	Niemcy	2025-04-22 03:09:51.489
199	Daniel	Kuchta	1970-06-02	Polska	2025-09-17 18:46:48.847
200	Łucja	Gwoździk	1963-10-22	Ukraina	2025-04-22 12:12:02.857
201	Ludwika	Skowroński	2000-09-19	Niemcy	2024-12-30 18:12:46.457
202	Ksenofont	Płonka	1982-12-16	Polska	2025-10-02 17:58:17.111
203	Andżelika	Mazurkiewicz	1982-04-16	Polska	2025-05-20 02:54:15.888
204	Krystyna	Iwański	2004-06-23	Polska	2024-12-05 22:25:48.354
205	Izydor	Piechota	1969-07-20	Polska	2025-04-18 20:49:32.728
206	Edgar	Mróz	1973-07-27	Białoruś	2025-03-25 03:16:12.064
207	Horacy	Białkowski	2009-03-13	Polska	2025-08-23 03:37:24.808
208	Rajnold	Jakubiak	1963-06-14	Polska	2025-10-04 17:47:47.495
209	Hanna	Kałuża	1970-09-29	Polska	2025-07-07 20:54:51.222
210	Konstanty	Juszczak	1967-11-20	Polska	2025-08-27 16:49:28.764
211	Adrian	Kubicki	1969-04-12	Polska	2025-03-22 21:18:16.526
212	Samuel	Grześkowiak	1980-06-21	Polska	2025-09-12 15:07:23.09
213	Irena	Mróz	2002-04-12	Polska	2025-01-06 02:40:53.592
214	Józefina	Bujak	1988-09-09	Niemcy	2025-10-31 01:37:49.222
215	Dorota	Rakowski	1979-11-15	Ukraina	2025-07-24 12:49:51.656
216	Matylda	Sobieraj	1967-08-21	Polska	2025-08-06 19:20:49.295
217	Galfryd	Jezierski	1980-08-28	Polska	2025-06-13 10:54:10.093
218	Korneli	Leśniak	1964-06-02	Niemcy	2025-03-19 08:33:57.203
219	Prokles	Rybarczyk	1998-01-25	Polska	2024-12-01 07:07:40.017
220	Lea	Mazurkiewicz	1997-05-24	Polska	2025-02-27 01:25:00.685
221	Rufina	Kołodziej	1965-06-22	Polska	2024-12-08 13:39:02.079
222	Rebeka	Szewczyk	1981-02-11	Ukraina	2024-12-24 05:28:28.357
223	Emilia	Grochowski	2005-04-02	Ukraina	2025-09-15 09:18:36.179
224	Lilia	Cebula	1973-11-07	Ukraina	2025-04-04 01:07:37.089
225	August	Olejnik	1968-07-01	Polska	2025-02-28 16:59:35.635
226	Herman	Wójcik	1965-06-05	Polska	2025-01-04 02:11:44.608
227	Eustracjusz	Świderski	1991-08-18	Ukraina	2025-08-02 22:13:22.768
228	Julita	Bogusz	1979-06-29	Polska	2025-01-05 17:44:32.752
229	Igor	Sławiński	2002-12-22	Polska	2025-08-03 04:02:30.395
230	Edyta	Jabłoński	1968-03-19	Polska	2025-06-16 10:14:15.593
231	Sabina	Szulc	1977-10-08	Polska	2025-09-29 16:29:11.231
232	Elwira	Mrozek	2007-10-02	Polska	2025-07-14 09:46:24.278
233	Cecylia	Zaremba	1972-02-29	Ukraina	2025-09-13 03:17:10.225
234	Abraham	Ruciński	1996-11-09	Ukraina	2025-09-03 04:34:31.185
235	Ferdynanda	Banaś	1979-05-18	Polska	2025-04-20 12:10:54.157
236	Joanna	Lisowski	1974-07-02	Polska	2025-01-13 09:25:13.174
237	Klarencjusz	Rak	1970-12-24	Polska	2025-05-13 08:22:40.475
238	Rebeka	Wróblewski	1971-02-21	Polska	2024-12-21 07:49:29.621
239	Gerazym	Drozd	1986-05-15	Polska	2024-11-19 11:45:22.571
240	Rufina	Olejniczak	1980-01-20	Polska	2025-05-20 00:56:40.597
241	Tamara	Nawrocki	1969-05-29	Polska	2025-09-04 06:00:13.021
242	Anastazja	Partyka	2005-04-27	Polska	2025-10-09 15:25:14.026
243	Joachim	Frączek	1983-12-14	Polska	2025-04-21 21:26:00.6
244	Melania	Jasiński	1979-05-22	Ukraina	2025-01-23 11:38:07.418
245	Filemon	Zając	1981-01-22	Białoruś	2025-05-09 12:53:55.061
246	Koralia	Pawlak	1971-08-10	Polska	2025-07-03 12:58:59.483
247	Władysław	Sobieraj	1991-03-10	Polska	2025-07-04 19:07:03.967
248	Artur	Wesołowski	1980-03-09	Ukraina	2025-02-16 16:45:05.46
249	Monika	Brzozowski	2007-12-02	Polska	2024-12-28 09:53:31.283
250	Józef	Kuciński	1981-09-21	Ukraina	2025-07-08 12:33:22.226
251	Emanuel	Przybylski	2002-07-29	Polska	2025-09-23 15:43:46.358
252	Cecylia	Sadowski	1975-02-18	Niemcy	2025-02-23 18:43:04.427
253	Bibiana	Kwieciński	2009-06-27	Ukraina	2025-04-08 09:30:11.078
254	Szymon	Wąsik	1969-12-10	Polska	2025-03-30 15:51:33.145
255	Zachary	Misiak	1982-01-09	Polska	2025-03-05 16:43:07.169
256	Emil	Rudnicki	1966-06-05	Polska	2025-05-17 03:14:49.123
257	Edward	Witek	1982-02-18	Ukraina	2025-02-07 05:23:41.932
258	Nazariusz	Popławski	1998-07-14	Ukraina	2024-11-29 22:53:04.468
259	Barbara	Ziółkowski	1991-04-12	Ukraina	2025-05-26 18:12:04.439
260	Aaron	Witek	1983-07-19	Polska	2025-02-10 02:46:35.999
261	Natan	Dubiel	1988-10-16	Ukraina	2025-10-24 07:08:52.012
262	Ireneusz	Kasprzak	1979-03-12	Polska	2025-07-03 10:23:48.286
263	Kornel	Dziedzic	2000-06-08	Polska	2025-09-19 02:59:50.436
264	Emil	Prokop	1988-10-19	Polska	2025-02-05 01:27:22.455
265	Tamara	Wojtas	1994-09-09	Polska	2025-10-06 07:35:31.027
266	Lucja	Ptak	2008-08-28	Polska	2025-01-08 05:13:31.553
267	Bertram	Gąsiorowski	1967-03-07	Polska	2025-07-14 04:56:37.809
268	Konstanty	Mikołajczak	2004-12-01	Polska	2025-07-18 12:06:45.555
269	Izolda	Bober	1980-09-24	Polska	2024-12-04 16:26:18.819
270	Mikołaj	Jędrzejczak	1990-05-20	Polska	2024-11-13 11:18:52.534
271	Henryk	Jarosz	1993-10-05	Niemcy	2025-07-26 11:28:49.108
272	Cezary	Szczerba	1967-05-15	Polska	2024-12-09 19:44:49.471
273	Fryderyk	Przybysz	1999-03-31	Polska	2025-01-16 11:29:10.664
274	Eustracjusz	Mackiewicz	2007-09-25	Ukraina	2025-04-08 02:00:38.048
275	Hipolit	Markowski	1970-11-08	Polska	2025-09-20 14:06:19.756
276	Ignacy	Biedrzyński	1981-12-19	Polska	2025-06-11 04:29:17.656
277	Lidia	Przybył	2004-07-08	Polska	2025-04-29 19:19:44.344
278	Wilhelm	Więckowski	1985-05-13	Polska	2025-07-24 12:11:08.863
279	Tomasz	Lipski	1976-09-25	Polska	2025-10-17 21:05:56.412
280	Kwintyn	Tkaczyk	2006-08-06	Ukraina	2025-02-01 06:45:44.82
281	Anna	Wrona	1976-02-26	Polska	2025-08-11 01:39:10.428
282	Sara	Kaczorowski	2006-12-12	Polska	2025-07-14 04:44:44.915
283	Elżbieta	Tkaczyk	1976-03-09	Polska	2025-03-20 06:09:01.311
284	Ignacy	Żyła	1989-03-13	Polska	2025-03-17 05:30:32.7
285	Wirginia	Nowicki	1977-11-12	Niemcy	2025-10-03 07:39:41.679
286	Walenty	Janicki	1970-01-11	Polska	2025-05-12 22:21:00.999
287	Lilia	Górny	1986-07-14	Polska	2025-04-25 16:42:15.592
288	Stanisław	Kmiecik	1987-12-20	Polska	2025-08-31 14:39:11.713
289	Irma	Tracz	2009-06-09	Polska	2025-08-27 04:56:39.969
290	Cyra	Janicki	1975-04-20	Polska	2025-04-18 21:16:57.83
291	Eliasz	Kuchta	1965-04-09	Białoruś	2025-03-05 22:57:22.598
292	Łazarz	Żyła	2004-07-01	Polska	2025-05-05 01:00:24.822
293	Lucjan	Michalski	2009-04-20	Niemcy	2025-01-28 22:41:58.034
294	Porfiry	Smoliński	1968-01-12	Polska	2025-06-16 11:20:06.664
295	Herbert	Kulig	1989-05-03	Polska	2025-06-04 00:17:13.524
296	Józefina	Wroński	1986-08-12	Polska	2025-03-13 23:28:37.123
297	Pantaleon	Bednarz	1971-12-04	Białoruś	2025-04-11 05:03:39.421
298	Eliza	Banach	1976-01-18	Polska	2025-06-01 09:52:50.86
299	Makary	Guzik	1998-03-02	Polska	2024-12-21 07:33:57.788
300	Serafina	Godlewski	1968-10-23	Polska	2025-07-04 19:17:44.404
301	Szymon	Karaś	2007-08-08	Białoruś	2025-08-30 10:59:25.698
302	Arystarch	Musiał	1979-03-08	Polska	2025-10-13 03:03:01.447
303	Cyryl	Ostrowski	1970-02-25	Polska	2025-02-06 10:04:32.321
304	Ginewra	Borowski	2009-03-24	Polska	2025-08-25 01:07:50.976
305	Waleria	Stachura	1974-10-10	Białoruś	2025-11-05 11:07:13.908
306	Melania	Bochenek	1968-11-11	Polska	2025-09-02 19:57:29.83
307	Orestes	Łukasiewicz	2008-11-22	Polska	2025-02-21 18:45:47.645
308	Hugo	Szymański	1967-09-07	Polska	2025-10-01 04:09:43.13
309	Justyna	Gąsior	1998-08-22	Polska	2025-10-11 10:52:46.588
310	Maksymilian	Maciejewski	1977-04-17	Ukraina	2025-04-17 06:28:55.995
311	Jadwiga	Czech	1997-08-13	Polska	2025-05-31 10:46:55.7
312	Henryk	Wilczek	1988-11-06	Polska	2025-06-08 22:27:47.262
313	Józef	Olejnik	2004-08-19	Niemcy	2025-06-13 01:38:48.368
314	Eliasz	Rudzki	1976-07-23	Polska	2025-10-01 10:21:50.167
315	Dominik	Brzozowski	1980-03-25	Polska	2025-05-18 17:09:24.588
316	Jakubina	Matuszak	2003-01-07	Polska	2025-03-10 19:48:45.134
317	Eliza	Gruszczyński	1969-04-21	Polska	2025-10-02 06:09:34.526
318	Antoni	Dziuba	1976-07-31	Polska	2024-11-10 00:52:36.712
319	Rajnold	Jasiński	1976-08-12	Polska	2024-12-29 12:07:18.182
320	Arseniusz	Szafrański	2009-02-04	Polska	2025-08-08 17:36:03.136
321	Andżelika	Staszewski	1974-08-15	Polska	2025-05-28 03:48:31.107
322	Aleksandra	Bielawski	2003-01-26	Ukraina	2025-11-04 11:45:54.969
323	Kleopatra	Rudzki	1974-02-23	Polska	2025-02-13 08:31:11.495
324	Ada	Janusz	1993-02-14	Niemcy	2025-07-06 14:04:21.897
325	Sebastian	Szczepański	1990-06-07	Polska	2024-12-09 12:09:23.092
326	Maurycy	Dróżdż	1989-07-17	Polska	2025-01-26 12:36:03.008
327	Izajasz	Niedźwiecki	1966-07-20	Polska	2025-05-16 06:07:17.495
328	Izolda	Kozak	2006-05-03	Polska	2025-06-02 00:57:51.695
329	Stefan	Gawron	1989-01-10	Polska	2025-02-26 20:47:14.778
330	Nikola	Wojciechowski	1986-02-15	Polska	2025-04-01 15:31:42.922
331	Henryk	Mucha	1977-12-08	Polska	2025-03-04 13:45:37.851
332	Nikodem	Szostak	1964-06-15	Polska	2025-09-04 03:06:36.155
333	Tobiasz	Masłowski	1968-10-12	Polska	2025-11-04 11:28:26.509
334	Hilary	Zagórski	2007-06-27	Polska	2025-08-31 02:19:35.619
335	Stefan	Lesiak	2006-01-31	Polska	2025-05-30 03:10:19.975
336	Justyna	Stefański	1970-06-28	Polska	2025-02-12 15:45:13.785
337	Kleopatra	Bielawski	2005-05-13	Polska	2025-05-12 20:21:32.432
338	Alan	Bielawski	2000-09-22	Polska	2025-08-27 05:32:02.518
339	Zofia	Zagórski	2002-09-10	Ukraina	2024-11-07 11:44:13.029
340	Chloe	Stachowiak	2003-03-16	Polska	2025-07-15 14:17:10.668
341	Ksenia	Tomczak	1977-08-05	Polska	2025-10-11 11:23:47.468
342	Julita	Szczygieł	1973-10-19	Polska	2025-06-30 02:23:18.789
343	Kwintyn	Przybylski	1999-08-10	Polska	2025-03-29 21:30:32.503
344	Hubert	Gadomski	2007-06-01	Polska	2025-06-06 18:48:53.897
345	Wincenty	Czarnecki	1986-07-03	Białoruś	2025-02-05 05:16:51.895
346	Emil	Kępa	2007-09-22	Niemcy	2025-03-31 18:06:16.724
347	Orestes	Grudzień	2006-04-05	Białoruś	2025-04-14 04:49:52.364
348	Filemon	Mikołajczak	1969-07-12	Polska	2025-02-14 14:28:49.048
349	Justyna	Szczerba	1972-04-20	Białoruś	2024-12-04 23:40:01.788
350	Zachary	Tomala	1972-07-20	Polska	2025-08-27 01:14:26.722
351	Patrycjusz	Murawski	1964-02-23	Polska	2025-04-23 01:07:16.831
352	Włodzimierz	Gruszczyński	1963-05-19	Niemcy	2025-03-26 19:13:31.866
353	Ada	Korzeniowski	2000-07-31	Polska	2025-06-08 11:36:17.87
354	Franciszka	Szczepanik	1982-07-20	Polska	2025-07-22 03:59:45.449
355	Łucja	Olejniczak	1979-06-14	Polska	2025-09-13 15:05:39.172
356	Witalis	Bielawski	1985-05-23	Polska	2025-09-05 21:44:11.127
357	Gonsalwy	Dobrowolski	1964-05-19	Polska	2025-04-13 07:06:51.984
358	Hilary	Banasiak	1994-12-20	Polska	2025-03-09 19:46:31.987
359	Paweł	Ślusarczyk	1981-05-26	Ukraina	2025-08-04 21:27:53.803
360	Zofia	Grzyb	1964-11-12	Polska	2025-04-24 15:37:53.674
361	Walgierz	Stolarczyk	1992-12-25	Ukraina	2025-10-02 11:17:10.989
362	Emilia	Grzelak	1996-05-17	Polska	2025-05-29 01:39:01.974
363	Bernard	Adamiec	1990-08-03	Polska	2025-01-01 18:05:51.132
364	Romeo	Kubiak	1964-10-05	Polska	2025-05-15 11:03:34.021
365	Hilarion	Lewicki	1978-09-16	Polska	2024-11-19 17:47:31.436
366	Nikodem	Sikorski	1966-01-26	Polska	2025-07-04 12:39:40.773
367	Nina	Stefański	1984-11-28	Polska	2025-03-19 16:57:49.542
368	Aleksandra	Kmiecik	1984-12-15	Polska	2025-02-14 09:42:24.076
369	Brajan	Zaremba	2001-10-29	Polska	2025-05-12 03:48:57.049
370	Żaneta	Rudzki	1983-05-21	Polska	2025-05-05 17:10:58.865
371	Amabela	Stachura	1980-11-28	Polska	2025-03-15 11:55:57.188
372	Arseniusz	Czarnecki	1972-05-31	Polska	2025-07-16 12:54:09.699
373	Melania	Krawczyk	1965-01-12	Ukraina	2025-10-23 03:30:13.264
374	Patrycja	Tomys	1995-11-20	Polska	2024-12-02 08:10:52.175
375	Szczepan	Makowski	2000-12-31	Białoruś	2025-05-10 23:59:51.614
376	Korneliusz	Stachura	1973-12-16	Białoruś	2025-06-28 17:39:26.299
377	Samson	Zawada	1997-01-20	Polska	2025-06-08 14:21:33.329
378	Grzegorz	Mróz	1990-04-23	Polska	2025-11-01 17:52:11.659
379	Korneliusz	Radomski	1985-03-08	Polska	2025-03-14 23:03:33.467
380	Julita	Kędziora	1998-03-07	Polska	2025-06-26 09:41:40.966
381	Rufina	Rudziński	2001-12-18	Polska	2025-02-04 18:16:24.783
382	Roger	Górniak	1986-09-15	Polska	2025-06-18 08:35:56.86
383	Harald	Król	1968-09-01	Polska	2025-07-22 17:16:58.519
384	Liliana	Kucharski	1975-09-04	Białoruś	2025-08-21 11:32:27.465
385	Tekla	Muszyński	1999-01-25	Polska	2025-11-03 22:32:27.992
386	Igor	Ptak	2005-05-22	Niemcy	2025-02-17 08:58:35.008
387	Reginald	Nawrot	1969-04-04	Polska	2025-01-27 01:01:08.86
388	Hieronim	Cygan	1998-02-01	Polska	2025-09-26 21:51:00.33
389	Klaudiusz	Kacprzak	1977-03-31	Polska	2025-10-30 04:19:37.248
390	Arseniusz	Kisiel	1963-12-31	Polska	2024-11-18 23:23:29.447
391	Oliwia	Grzelak	1969-03-31	Polska	2025-02-03 17:20:56.987
392	Leila	Jóźwik	2009-01-19	Ukraina	2025-05-26 12:29:48.999
393	Estera	Marciniak	1990-03-05	Polska	2025-06-21 06:28:03.474
394	Hubert	Żak	1997-04-02	Polska	2025-05-27 13:20:17.055
395	Tobiasz	Kołodziej	1963-08-18	Polska	2025-06-21 06:16:11.738
396	Marcin	Niemiec	1988-07-02	Ukraina	2025-04-07 17:25:15.761
397	Weronika	Krawiec	1999-09-21	Polska	2024-12-13 07:00:00.059
398	Teresa	Czerwiński	1970-02-27	Białoruś	2025-01-25 15:04:24.911
399	Roger	Knapik	1997-10-10	Ukraina	2024-11-18 16:55:26.86
400	Katarzyna	Radomski	1978-09-05	Polska	2024-11-18 17:08:10.774
401	Jeremiasz	Dudziński	1970-11-04	Polska	2024-12-05 12:12:06.423
402	Wilhelmina	Kaszuba	1999-11-05	Polska	2024-12-12 21:29:41.686
403	Ksenia	Adamczak	1964-08-07	Polska	2025-04-18 02:56:20.649
404	Bibiana	Czajka	1976-12-05	Białoruś	2025-01-09 12:56:55.115
405	Piotr	Mackiewicz	1979-07-27	Polska	2025-07-19 05:50:44.111
406	Witalis	Białek	1999-07-04	Polska	2024-12-26 21:29:31.394
407	Maria	Lesiak	1975-12-26	Polska	2025-03-31 05:05:21.322
408	Klarencjusz	Krakowiak	2004-12-20	Polska	2025-07-15 21:25:48.951
409	Estera	Skibiński	1967-01-22	Polska	2025-04-04 18:42:04.314
410	Izydor	Skibiński	1977-03-05	Polska	2025-11-04 21:13:23.754
411	Hilary	Grudzień	1989-07-18	Niemcy	2024-11-08 00:56:24.029
412	Gwido	Włodarczyk	1988-08-30	Ukraina	2025-02-25 12:22:22.029
413	Paweł	Pluta	1998-11-17	Ukraina	2025-05-08 04:53:13.708
414	Wilhelmina	Góral	1995-09-10	Białoruś	2025-09-05 05:33:05.357
415	Józef	Trojanowski	1972-04-13	Niemcy	2025-09-11 04:25:22.819
416	Bertram	Dudziak	1989-01-25	Białoruś	2025-03-28 08:18:53.71
417	Innocenty	Flak	1970-05-26	Polska	2025-07-31 19:06:22.521
418	Irena	Guzik	1968-08-31	Polska	2025-03-26 09:48:40.296
419	Bruno	Borowski	1967-12-23	Polska	2025-07-25 23:48:39.714
420	Mikołaj	Nowiński	1976-10-07	Polska	2024-12-18 00:24:59.125
421	Władysław	Baranowski	1979-06-27	Niemcy	2024-12-08 06:01:58.312
422	Herbert	Noga	2000-12-13	Polska	2024-11-17 22:34:25.958
423	Józef	Iwanowski	1994-05-29	Białoruś	2025-06-18 06:36:36.904
424	Laurenty	Szczepanik	1986-11-13	Polska	2025-05-04 02:22:07.832
425	Sergiusz	Miller	1992-07-16	Polska	2024-12-25 17:26:36.457
426	Efraim	Buczyński	1977-10-06	Polska	2025-04-15 10:14:41.684
427	Archibald	Sowa	2002-04-28	Polska	2025-11-06 16:57:39.997
428	Stanisław	Michałek	1965-12-23	Polska	2025-04-04 04:34:11.601
429	Oliwier	Wieczorek	1995-10-25	Białoruś	2025-08-02 16:25:39.971
430	Konrad	Domagała	1997-02-18	Polska	2025-06-10 06:58:24.213
431	Gertruda	Mierzejewski	2004-04-26	Polska	2025-07-16 18:04:20.373
432	Tobiasz	Laskowski	1986-07-22	Polska	2025-03-25 05:27:11
433	Irma	Gawron	1983-05-24	Polska	2025-01-22 11:39:53.629
434	Dominik	Kacprzak	2000-06-29	Polska	2025-09-25 23:11:37.413
435	Patryk	Mroczkowski	2007-09-12	Polska	2025-05-29 16:51:08.69
436	Wiktoria	Brzozowski	1969-11-23	Białoruś	2024-12-30 05:32:38.783
437	Edyta	Stasiak	1999-12-08	Niemcy	2025-04-09 04:02:44.784
438	Klementyna	Zajączkowski	1982-01-27	Ukraina	2025-06-21 10:33:43.668
439	Szczepan	Kania	1993-01-09	Polska	2025-05-15 16:16:58.269
440	Dionizy	Więcek	1998-09-18	Polska	2025-09-24 08:36:23.79
441	Hanna	Wolny	1989-01-24	Polska	2024-12-09 18:55:52.817
442	Julita	Baranowski	1985-12-05	Białoruś	2025-02-22 04:14:19.024
443	Wincenty	Majewski	1970-04-22	Ukraina	2025-07-20 03:36:02.874
444	Baldwin	Januszewski	1983-08-11	Polska	2025-09-29 07:10:44.498
445	Leonard	Zięba	2008-04-27	Niemcy	2025-08-02 20:06:34.988
446	Patrycja	Urbański	1985-10-13	Ukraina	2025-07-08 18:49:41.447
447	Aida	Jarząbek	1980-08-10	Niemcy	2025-02-04 03:59:00.084
448	Bernard	Wasiak	1971-09-12	Polska	2024-11-18 16:07:50.755
449	Tamara	Pawelec	1994-05-02	Ukraina	2024-12-19 00:51:55.101
450	Ambroży	Zaborowski	1973-08-17	Ukraina	2024-12-06 02:39:59.438
451	Oliwier	Jarząbek	1969-01-10	Polska	2025-06-26 02:29:32.423
452	Archibald	Adamski	1971-05-04	Polska	2025-07-23 16:09:15.124
453	Olga	Czyż	1973-01-17	Polska	2024-12-22 09:13:51.893
454	Nazary	Stanek	1995-05-14	Polska	2025-04-28 17:45:28.148
455	Stanisław	Jagiełło	1999-04-16	Ukraina	2025-05-30 11:05:27.776
456	Klarencjusz	Mackiewicz	1965-04-10	Polska	2025-08-02 12:32:47.185
457	Romeo	Czech	1968-10-21	Polska	2025-02-10 21:57:09.858
458	Liza	Marczak	2004-10-29	Polska	2025-01-05 06:54:56.473
459	Edmund	Dziedzic	1983-07-15	Białoruś	2025-10-22 14:18:45.479
460	Maria	Urban	1977-10-17	Polska	2025-09-14 12:44:21.626
461	Agata	Strzelczyk	2005-07-30	Polska	2025-04-02 16:36:58.726
462	Elwira	Maciejewski	2004-02-07	Polska	2025-02-03 16:34:04.101
463	Łucja	Kędzierski	1994-09-13	Polska	2025-09-26 18:16:16.592
464	Liza	Budzyński	1986-11-09	Polska	2025-07-08 10:13:30.378
465	Gloria	Lipiński	2003-08-30	Niemcy	2025-09-27 05:45:10.73
466	Hipolit	Adamiec	2007-12-28	Polska	2024-12-13 03:43:11.378
467	Daria	Furman	1978-02-06	Polska	2025-03-05 05:42:07.28
468	Alwar	Niedziela	1974-03-15	Polska	2025-09-03 16:42:18.475
469	Michalina	Staszewski	1984-06-28	Niemcy	2025-03-15 09:25:23.701
470	Brygida	Zaręba	1979-08-24	Polska	2025-06-27 17:32:46.614
471	Anastazja	Grzyb	1994-07-16	Polska	2025-01-25 23:26:21.628
472	Nestor	Motyka	2000-07-12	Polska	2025-08-28 02:11:00.276
473	Justyn	Pająk	1972-06-02	Polska	2024-11-29 19:18:28.625
474	Berta	Malec	1994-07-15	Polska	2025-09-06 23:05:01.425
475	Walgierz	Stolarczyk	1993-09-03	Polska	2025-05-27 01:31:38.976
476	Roger	Kapusta	1980-05-01	Polska	2025-08-08 02:31:26.434
477	Ida	Gajewski	1997-11-07	Polska	2024-12-30 19:17:34.732
478	Cyryl	Flis	2002-11-16	Białoruś	2025-04-03 14:09:16.443
479	Ludwika	Suski	1967-12-01	Polska	2025-10-06 14:39:03.788
480	Luiza	Niemiec	1977-11-26	Niemcy	2025-02-06 23:19:53.454
481	Artur	Żurawski	1962-11-30	Białoruś	2025-09-07 21:42:00.694
482	Leonid	Kogut	1966-03-13	Polska	2025-10-12 15:00:11.569
483	Łucja	Pawlicki	1983-02-13	Polska	2025-09-02 17:48:25.71
484	Stefan	Baranowski	2007-07-17	Ukraina	2025-07-15 16:16:30.223
485	Krystian	Śliwa	1967-08-01	Polska	2025-06-08 18:46:20.51
486	Zachary	Stefaniak	2000-03-08	Polska	2025-02-22 04:50:44.809
487	Wawrzyniec	Jankowski	2005-10-18	Polska	2024-11-07 20:51:33.341
488	Beatrycze	Kubica	1976-10-22	Ukraina	2025-01-17 13:44:54.521
489	Brajan	Niedźwiecki	1994-01-28	Polska	2025-05-07 02:07:50.931
490	Maurycy	Kowalewski	1986-06-21	Ukraina	2025-05-22 19:54:58.548
491	Salwator	Kosiński	1976-08-10	Polska	2025-10-10 03:02:31.819
492	Kazimierz	Podgórski	1968-07-05	Polska	2025-06-23 05:56:00.321
493	Laura	Karwowski	1968-10-11	Polska	2025-02-23 06:00:46.189
494	Adelajda	Sienkiewicz	1993-08-23	Polska	2025-03-01 19:00:35.704
495	Michalina	Baranowski	1972-04-09	Białoruś	2025-02-15 19:03:46.466
496	Aida	Rybak	1975-05-28	Niemcy	2025-01-16 19:59:53.266
497	Beniamin	Augustyn	1976-05-20	Polska	2025-08-30 12:05:12.96
498	Ksenia	Głąb	1997-02-19	Polska	2025-10-19 14:03:06.74
499	Weronika	Siwek	2006-09-27	Polska	2025-03-31 16:16:41.384
500	Renata	Łuczak	2000-11-18	Polska	2024-12-04 07:09:30.627
501	August	Żyła	1995-01-02	Polska	2025-10-22 14:17:18.548
502	Cyryl	Jakubiak	1988-10-26	Ukraina	2025-05-22 01:08:03.861
503	Tobiasz	Jaros	1963-03-30	Polska	2025-05-02 15:16:12.135
504	Konstanty	Kubicki	1988-01-25	Polska	2025-04-18 15:54:45.709
505	Angelina	Piotrowski	2003-01-24	Polska	2025-11-05 19:11:56.709
506	Maksymilian	Tomaszewski	1998-05-27	Polska	2025-10-06 22:55:55.439
507	Adrian	Szczerba	1976-09-26	Polska	2025-05-13 01:57:48.484
508	Izabela	Łukasik	1991-07-20	Polska	2025-07-19 11:11:29.283
509	Ginewra	Kubicki	1999-12-21	Polska	2024-12-02 12:38:12.372
510	Fryderyk	Krajewski	2008-05-31	Białoruś	2025-04-18 10:19:19.697
511	Alicja	Ziętek	1995-02-14	Białoruś	2025-03-29 08:35:14.95
512	Kwintyn	Gajewski	1973-08-29	Polska	2025-02-15 15:58:25.111
513	Liza	Rudzki	2006-02-02	Polska	2024-12-11 03:10:11.457
514	Artur	Marek	2006-10-02	Ukraina	2025-09-02 07:47:51.77
515	Filip	Makowski	1981-04-15	Niemcy	2025-02-20 01:56:00.835
516	Wirginia	Majka	1991-10-08	Polska	2025-02-27 07:35:21.354
517	Kleopatra	Szczepański	1991-12-02	Polska	2025-10-06 05:58:51.62
518	Magnus	Furman	1991-05-13	Ukraina	2025-10-17 17:14:08.79
519	Weronika	Niemczyk	2006-03-04	Polska	2025-10-22 06:52:28.644
520	Magdalena	Rosa	1998-01-04	Polska	2025-07-06 22:04:07.223
521	Florian	Wilczyński	1965-11-01	Polska	2024-11-25 09:29:44.543
522	Franciszek	Wierzbicki	1989-08-04	Polska	2025-06-16 03:26:30.568
523	Róża	Krupiński	2000-09-04	Polska	2024-12-29 15:07:07.158
524	Roderyk	Biedrzyński	1991-01-03	Polska	2025-09-08 22:51:46.25
525	Daniel	Michałowski	2004-11-14	Polska	2025-02-16 10:15:10.89
526	Gerazym	Florek	1990-08-13	Białoruś	2025-03-20 00:24:59.372
527	Michalina	Płonka	1987-06-13	Polska	2025-09-21 09:00:59.241
528	Roland	Kolasa	1983-08-21	Polska	2025-05-30 02:26:57.252
529	Ada	Wójtowicz	1968-11-05	Polska	2024-11-22 14:17:08.987
530	Olimpia	Jakubowski	1992-08-29	Polska	2025-01-06 18:47:27.927
531	Eliasz	Walkowiak	1990-03-10	Białoruś	2025-10-21 18:51:51.112
532	Wilhelmina	Szewczyk	2008-09-21	Polska	2025-07-22 11:58:50.766
533	Hugo	Piórkowski	1989-08-03	Polska	2025-01-09 14:35:16.216
534	Aida	Czechowski	1970-07-25	Polska	2025-07-04 15:43:15.823
535	Janina	Szafrański	1969-12-12	Polska	2025-02-17 00:17:28.701
536	Stefan	Buczyński	1971-07-19	Ukraina	2025-09-10 10:12:48.642
537	Rudolf	Skoczylas	1979-04-29	Polska	2025-06-25 16:39:03.188
538	Laurencja	Gałka	1963-02-27	Ukraina	2025-09-13 04:00:19.261
539	Romeo	Stankiewicz	1999-07-15	Polska	2025-06-30 17:39:09.216
540	Ewa	Jędrzejczyk	1966-03-17	Białoruś	2025-04-24 03:22:59.367
541	Wilhelm	Bielak	1973-06-12	Polska	2025-05-23 17:07:28.716
542	Krzysztof	Krajewski	1994-01-02	Niemcy	2025-04-27 19:49:06.714
543	Walter	Sowa	1970-09-20	Białoruś	2025-04-16 07:39:13.39
544	Roland	Palacz	1995-02-03	Polska	2025-11-03 23:21:49.59
545	Larysa	Wasilewski	1983-02-27	Polska	2025-10-06 06:42:38.544
546	Ludwik	Rogowski	2001-05-11	Polska	2025-09-18 03:12:45.654
547	Ferdynanda	Domański	1977-09-04	Polska	2025-04-18 02:30:06.168
548	Korneli	Grzesik	1994-08-26	Polska	2025-01-24 02:03:50.353
549	Teodora	Siedlecki	1999-04-02	Polska	2025-09-21 21:13:21.734
550	Wincenty	Stępień	1992-07-16	Niemcy	2025-05-05 04:57:37.494
551	Marianna	Michalak	2000-03-18	Polska	2025-08-16 12:05:09.984
552	Krystyna	Czechowski	1990-12-11	Polska	2025-08-24 07:57:06.638
553	Sylwia	Frąckowiak	1973-02-09	Polska	2025-08-17 15:46:04.464
554	Łazarz	Białek	1986-05-29	Białoruś	2025-04-21 21:01:23.575
555	Rajnold	Pluta	2004-09-24	Polska	2025-09-30 15:45:03.36
556	Elwira	Białkowski	1969-08-08	Polska	2025-09-19 05:26:10.601
557	Irena	Jankowski	1987-10-22	Polska	2025-11-04 12:20:48.569
558	Beatrycze	Krzyżanowski	2007-01-31	Polska	2025-06-26 14:09:18.992
559	Stefan	Bartkowiak	1992-06-09	Polska	2024-11-29 02:40:45.78
560	Walentyna	Piłat	1971-09-13	Polska	2025-04-15 14:06:03.686
561	Antoni	Wróblewski	2001-03-20	Polska	2025-03-06 10:29:51.893
562	Hipolit	Nawrocki	1988-10-12	Polska	2024-11-22 08:30:44.429
563	Adrian	Tomaszewski	2000-07-28	Niemcy	2025-06-13 10:50:10.557
564	Wiktoria	Janas	1976-02-14	Polska	2025-03-19 14:53:41.606
565	Patrycja	Stefaniak	1988-05-31	Polska	2025-01-10 12:48:24.426
566	Walter	Frankowski	1983-08-03	Polska	2024-11-27 15:11:20.802
567	Jozue	Michałowski	1988-08-01	Polska	2025-05-24 08:20:30.457
568	Franciszek	Kiełbasa	1967-02-06	Polska	2025-01-18 15:39:49.347
569	Julia	Molenda	2000-01-11	Białoruś	2025-05-26 00:58:42.414
570	Laura	Stępień	1995-04-19	Polska	2024-11-20 16:40:28.466
571	Janusz	Florek	1981-03-17	Polska	2025-04-30 18:42:38.657
572	Ryszard	Muszyński	1963-07-19	Polska	2025-09-23 16:55:54.873
573	Archibald	Twardowski	1986-04-01	Polska	2025-07-03 17:24:31.862
574	Platon	Tkaczyk	1998-11-30	Białoruś	2025-06-29 16:46:35.971
575	Orestes	Stefaniak	1982-10-18	Polska	2025-02-13 01:34:50.443
576	Florencja	Skoczylas	1975-07-22	Ukraina	2025-07-09 00:53:41.26
577	Gwido	Gadomski	1964-08-05	Polska	2025-08-25 03:41:08.725
578	Walentyn	Szczepanik	1970-07-05	Polska	2025-08-20 02:01:06.66
579	Tobiasz	Gwoździk	1996-04-04	Polska	2025-01-28 12:13:13.519
580	Arystarch	Stefaniak	1986-09-16	Polska	2024-11-17 15:08:51.49
581	Izajasz	Miklaś	2000-03-11	Białoruś	2024-11-15 09:39:54.112
582	Archibald	Górski	1963-08-07	Polska	2025-07-07 07:28:16.173
583	Weronika	Czerwiński	1980-10-14	Polska	2025-04-07 22:32:39.945
584	Leon	Dąbkowski	1994-05-01	Polska	2025-10-17 03:22:46.426
585	Randolf	Zdunek	1966-11-16	Ukraina	2025-06-10 22:11:42.045
586	Stefan	Janusz	1987-04-20	Polska	2025-01-13 22:50:38.987
587	Józefina	Kołakowski	1974-02-11	Polska	2025-03-07 21:54:37.596
588	Irena	Różański	1991-03-11	Ukraina	2025-07-13 17:37:53.535
589	Martyna	Kuliński	1985-10-24	Polska	2024-11-09 10:57:04.005
590	Wawrzyniec	Rogalski	1975-02-19	Polska	2025-04-06 05:42:57.837
591	Konstancja	Mazurkiewicz	1993-08-21	Polska	2024-12-24 08:04:19.053
592	Irma	Janus	1989-04-28	Polska	2025-09-04 06:38:41.469
593	Abraham	Bielak	2000-11-15	Polska	2025-09-07 05:38:03.963
594	Maksym	Rudnicki	1969-09-09	Polska	2025-06-10 20:45:22.494
595	Gloria	Białkowski	1964-08-14	Polska	2024-11-23 04:48:53.909
596	Hanna	Mierzejewski	1987-07-28	Polska	2025-10-05 09:18:03.158
597	Malwina	Malec	2002-11-11	Niemcy	2025-04-18 00:25:39.347
598	Ewa	Świątek	1990-09-03	Polska	2025-02-22 10:21:02.273
599	Patrycy	Długosz	1992-09-13	Polska	2024-11-08 04:41:35.237
600	Adelajda	Małek	1997-03-11	Polska	2025-03-22 05:42:36.649
601	Patrycy	Długosz	1980-11-07	Polska	2025-02-05 21:29:59.714
602	Jakub	Muszyński	1967-07-01	Ukraina	2025-02-27 02:56:00.377
603	Lilla	Zalewski	2006-05-23	Polska	2025-04-24 05:11:52.107
604	Ginewra	Kos	1974-08-27	Polska	2025-04-24 04:52:07.799
605	Jakub	Kurowski	1989-08-30	Polska	2025-05-01 21:03:39.699
606	Magnus	Kubica	2006-02-26	Polska	2025-01-27 14:04:06.987
607	Melania	Kowalski	1999-07-14	Polska	2025-06-04 20:45:16.933
608	Karolina	Kotowski	1986-09-19	Polska	2025-06-09 04:44:07.091
609	Dariusz	Augustyn	1981-11-28	Niemcy	2025-02-07 15:49:56.781
610	Ksenia	Krupa	1965-01-09	Polska	2024-11-28 16:56:28.933
611	Józef	Kwiatkowski	1995-02-12	Polska	2025-02-11 04:04:30.187
612	Angela	Konieczna	1965-10-15	Polska	2025-10-22 23:19:57.038
613	Efraim	Kałuża	1966-07-20	Polska	2025-11-01 07:28:14.862
614	Ofelia	Majka	1981-04-07	Ukraina	2025-04-15 21:17:29.946
615	Sara	Dąbkowski	1989-02-04	Polska	2025-09-16 15:42:51.287
616	Paulina	Kołodziejski	2002-07-16	Ukraina	2025-07-16 12:29:28.513
617	Dariusz	Malinowski	2000-01-27	Polska	2025-01-31 19:25:26.758
618	Wiara	Czajkowski	1973-07-09	Polska	2024-12-31 00:41:59.558
619	Onufry	Augustyn	1974-03-24	Polska	2025-10-07 20:30:57.094
620	Walery	Kostrzewa	1972-04-28	Polska	2025-02-14 22:35:42.092
621	Harald	Pilarski	1989-05-13	Polska	2025-11-06 03:58:16.402
622	Klaudia	Krupiński	1972-08-09	Polska	2025-08-07 23:23:57.512
623	Walter	Miklaś	1977-12-18	Polska	2025-06-30 06:14:01.485
624	Paweł	Marciniak	1985-02-24	Niemcy	2025-03-09 12:17:45.86
625	Jeremi	Fijałkowski	2006-09-27	Polska	2025-04-06 16:30:07.514
626	Jan	Jurek	2002-02-20	Białoruś	2025-07-11 01:06:00.846
627	Monika	Paszkowski	1983-05-16	Polska	2025-09-30 15:14:38.669
628	Leonid	Borowski	1965-12-16	Polska	2025-05-06 18:27:32.537
629	Ofelia	Krupiński	1979-04-08	Polska	2025-06-16 18:43:24.245
630	Kazimierz	Twardowski	1983-07-21	Polska	2025-02-14 20:09:24.507
631	Samuel	Musiał	1985-11-20	Niemcy	2025-08-04 08:20:38.368
632	Pantaleon	Leśniak	1963-04-16	Polska	2025-02-26 20:43:17.626
633	Witalis	Maciejewski	2004-03-13	Polska	2025-04-11 07:03:34.443
634	Patryk	Murawski	1991-04-12	Polska	2024-12-22 10:35:34.751
635	Aida	Jakubiak	1977-03-25	Polska	2025-03-07 15:13:24.495
636	Grzegorz	Kędziora	1997-12-19	Polska	2025-04-26 17:33:44.417
637	Gilbert	Strzelczyk	1969-05-03	Polska	2024-12-12 12:51:32.935
638	Helena	Siedlecki	2009-05-23	Ukraina	2025-08-05 21:49:24.564
639	Paweł	Kulik	1995-02-09	Ukraina	2025-02-26 00:13:00.588
640	Błażej	Kowalczyk	1966-03-22	Polska	2025-08-23 05:37:33.262
641	Hilary	Adamiec	1975-07-02	Ukraina	2025-10-29 14:44:07.226
642	Henryka	Tkaczyk	1963-05-17	Polska	2025-02-19 07:00:27.048
643	Nadzieja	Jezierski	1975-01-16	Ukraina	2025-10-03 09:07:41.381
644	Penelopa	Młynarczyk	1969-03-18	Polska	2025-06-16 14:49:15.331
645	Leonid	Radomski	1978-02-02	Ukraina	2025-01-25 13:29:57.353
646	Terencjusz	Kot	2002-05-17	Polska	2025-10-11 01:09:42.093
647	Walentyna	Dębowski	1977-10-02	Polska	2024-12-25 04:34:59.366
648	Penelopa	Iwański	1973-02-27	Polska	2025-08-04 11:33:56.897
649	Lilianna	Prus	1970-01-07	Polska	2025-07-18 19:10:18.236
650	Cecylia	Grabowski	1998-06-30	Polska	2025-06-27 03:10:22.987
651	Gracja	Mazur	1974-05-24	Polska	2025-08-23 08:52:55.001
652	Walentyna	Michałek	2001-08-15	Polska	2025-10-17 11:16:59.731
653	Ewelina	Tomala	2000-08-26	Ukraina	2025-03-22 08:40:40.081
654	Gerazym	Ostrowski	1979-12-04	Polska	2024-12-11 14:57:21.183
655	Krystian	Rogala	1989-05-19	Polska	2025-05-16 13:28:09.802
656	Judyta	Wojtkowiak	1978-09-15	Polska	2025-10-23 20:28:54.358
657	Salwator	Mazurkiewicz	1983-07-07	Polska	2025-09-23 18:22:55.584
658	Bazyli	Dudek	1998-03-11	Polska	2025-08-23 01:32:59.632
659	Olaf	Żmuda	1976-08-08	Białoruś	2024-12-24 20:05:20.4
660	Kwintyn	Kołodziejczyk	2008-12-10	Polska	2025-08-13 00:51:28.913
661	Mateusz	Wolak	1995-03-16	Polska	2025-01-21 14:33:46.948
662	Cyrus	Krukowski	1977-03-09	Polska	2025-10-30 11:12:38.299
663	Aleksy	Gajda	1972-03-02	Polska	2025-01-20 22:02:39.828
664	Natalia	Majchrzak	1999-01-17	Polska	2025-02-14 08:17:44.435
665	Hilary	Błaszczyk	1978-06-10	Polska	2025-06-24 03:19:10.019
666	Ida	Czajka	1968-04-08	Polska	2024-11-21 17:04:24.865
667	Lidia	Antczak	1999-09-24	Polska	2025-01-31 00:14:34.464
668	Elżbieta	Mazurek	1974-09-05	Polska	2025-04-01 04:17:53.567
669	Pelagia	Cygan	2009-02-17	Polska	2025-07-08 23:42:31.256
670	Cecylia	Matuszak	2006-12-04	Polska	2025-04-10 20:43:20.144
671	Edwin	Wojtas	1995-12-26	Polska	2025-09-04 21:09:14.969
672	Filip	Jakubiak	2008-09-17	Polska	2025-07-16 23:36:06.653
673	Fryderyk	Janiszewski	2000-05-24	Polska	2025-03-28 18:48:34.064
674	Berta	Szymczyk	1983-03-22	Polska	2025-08-18 01:21:51.885
675	Stefania	Duszyński	2005-04-30	Polska	2025-10-13 11:24:03.06
676	Donald	Karczewski	1997-01-28	Polska	2025-03-12 23:21:28.477
677	Efrem	Bujak	1982-11-18	Polska	2024-11-13 00:42:14.968
678	Patrycja	Buczyński	1999-04-30	Polska	2025-09-27 22:15:29.811
679	Dorota	Szatkowski	1970-11-01	Polska	2025-10-11 18:31:34.983
680	August	Zawada	1970-01-17	Polska	2024-12-01 12:59:35.326
681	Bibiana	Musiał	1999-01-18	Polska	2025-01-27 01:31:10.688
682	Klemens	Wyszyński	2000-09-25	Polska	2025-01-02 06:16:56.565
683	Franciszek	Przybylski	1996-09-26	Polska	2025-03-26 07:08:44.766
684	Damian	Paluch	1976-06-22	Ukraina	2025-02-07 11:19:22.573
685	Ruta	Bożek	1968-01-11	Polska	2025-03-23 09:29:05.425
686	Gertruda	Wieczorek	1994-04-19	Polska	2025-05-18 05:10:11.168
687	Abraham	Stec	1989-05-17	Polska	2025-03-09 06:57:07.868
688	Walter	Kwieciński	1983-03-08	Ukraina	2025-09-06 04:18:50.615
689	Emilia	Wąsowski	1987-04-16	Polska	2025-09-16 08:52:08.424
690	Aleksandra	Woźniak	1975-07-03	Polska	2025-07-02 13:17:44.885
691	Koralia	Przybysz	1989-02-15	Polska	2025-05-30 11:23:08.057
692	Atanazy	Wójtowicz	1986-07-30	Polska	2025-07-22 17:13:31.063
693	Tekla	Stefański	1984-07-04	Polska	2025-04-29 19:53:05.835
694	Spirydion	Fijałkowski	1970-05-22	Niemcy	2025-09-24 01:01:01.869
695	Józefina	Gawroński	1984-04-01	Polska	2025-01-03 20:32:24.399
696	Estera	Słowik	1999-08-10	Polska	2025-04-03 08:44:29.961
697	Hilary	Domagała	1981-10-01	Polska	2025-07-10 10:24:13.236
698	Irena	Długosz	1973-01-30	Polska	2024-12-18 02:01:31.707
699	Nadzieja	Budzyński	1994-11-14	Polska	2025-07-04 07:25:38.496
700	Alfred	Fijałkowski	2008-11-25	Ukraina	2025-08-03 20:28:53.243
701	Cecylia	Szymański	2008-03-18	Białoruś	2024-11-21 02:20:01.944
702	Aleksander	Cholewa	1981-03-31	Polska	2025-01-23 10:49:42.737
703	Witalis	Bujak	1980-01-05	Polska	2025-06-20 23:41:43.888
704	Elwira	Filipek	1977-10-31	Polska	2024-11-26 05:12:11.958
705	Anastazja	Wiącek	2003-03-14	Polska	2024-12-23 08:37:32.722
706	Judyta	Pająk	1979-02-13	Ukraina	2025-09-05 19:40:52.089
707	Anatol	Sienkiewicz	1974-02-24	Ukraina	2025-05-30 08:46:47.032
708	Ksenofont	Kubacki	1992-09-25	Białoruś	2024-11-20 11:05:35.735
709	Porfiry	Adamiec	1993-09-06	Polska	2025-06-18 09:39:15.459
710	Oliwia	Winiarski	1983-07-24	Polska	2025-10-02 13:43:56.16
711	Prokul	Grzelak	1992-08-16	Polska	2025-03-14 14:29:10.703
712	Lilianna	Maćkowiak	1980-10-21	Białoruś	2024-11-07 15:41:47.635
713	Pelagia	Kowal	1993-12-12	Niemcy	2025-03-23 14:39:04.059
714	Roger	Morawski	2002-03-13	Polska	2025-10-26 17:37:03.204
715	Aida	Nawrot	1976-12-28	Polska	2025-10-22 03:08:46.017
716	Franciszek	Bartczak	2003-06-11	Polska	2024-12-15 19:20:23.075
717	Emilia	Pilarski	1994-02-28	Polska	2025-09-10 08:36:42.93
718	Nikola	Adamczak	2001-12-22	Białoruś	2024-11-09 13:06:22.912
719	Gracja	Czerwiński	1972-08-21	Ukraina	2025-10-25 15:29:45.273
720	Żaneta	Strzelczyk	2007-10-16	Ukraina	2024-11-25 11:30:50.028
721	Lilia	Rusin	1998-10-26	Polska	2025-07-05 14:46:03.494
722	Henryka	Słowik	1984-11-09	Polska	2025-07-06 19:07:01.061
723	Izajasz	Matuszak	1963-10-31	Polska	2024-11-29 17:53:13.717
724	Tamara	Jurkiewicz	1974-12-21	Polska	2024-11-30 04:12:42.42
725	Gilbert	Kotowski	1993-02-07	Polska	2025-05-20 05:51:11.614
726	Eliza	Robak	1979-03-02	Polska	2025-04-05 11:05:21.238
727	Klementyna	Kruszewski	1965-12-18	Polska	2025-04-19 16:25:42.402
728	Ireneusz	Szwed	2009-07-14	Polska	2025-03-02 06:29:17.355
729	Leonid	Szczęsna	1983-02-04	Polska	2025-01-21 16:48:06.359
730	Eugeniusz	Ptak	2004-01-30	Polska	2025-10-27 14:29:18.902
731	Nina	Stachura	1965-02-27	Polska	2024-12-19 00:02:01.232
732	Kamila	Kalisz	1968-07-17	Ukraina	2025-05-09 21:45:41.364
733	Lilianna	Kubica	1996-12-10	Ukraina	2025-01-06 15:24:25.244
734	Szczepan	Kwiatkowski	1971-04-30	Białoruś	2025-01-24 19:55:58.847
735	Jozue	Puchalski	1980-11-16	Niemcy	2024-12-11 17:28:09.849
736	Patrycjusz	Kowalik	2008-07-12	Polska	2025-02-12 05:30:03.115
737	Jadwiga	Konieczny	1997-02-01	Niemcy	2025-04-21 15:17:22.126
738	Gloria	Golec	1976-08-25	Niemcy	2025-02-25 22:16:07.574
739	Polikarp	Tkaczyk	1984-05-19	Polska	2025-02-13 12:00:19.664
740	Kornel	Bielski	2000-06-25	Polska	2025-08-24 22:34:26.61
741	Nikola	Prus	1975-05-06	Polska	2025-01-21 22:50:26.643
742	Amabela	Kogut	1991-01-17	Polska	2025-04-12 18:29:10.777
743	Archibald	Mazurek	1970-05-16	Białoruś	2025-02-14 02:10:10.117
744	Lucjan	Szulc	1989-04-02	Polska	2025-04-25 06:52:23.635
745	Waleria	Gałązka	1992-11-06	Polska	2024-11-24 21:41:47.036
746	Sergiusz	Wójcik	1996-05-16	Polska	2025-03-07 16:25:35.729
747	Cecyliusz	Kania	1994-07-22	Polska	2025-10-27 21:02:09.887
748	Olga	Kujawski	1991-11-07	Ukraina	2025-06-04 20:04:29.707
749	Ida	Drabik	1968-03-05	Polska	2025-04-29 23:13:21.73
750	Beniamin	Dudzik	1991-09-23	Polska	2025-10-15 20:23:01.473
751	Julia	Wojciechowski	1995-09-23	Polska	2025-03-19 09:33:32.789
752	Beniamin	Kalinowski	1990-07-05	Ukraina	2025-05-03 22:23:55.212
753	Julita	Jędrzejczak	1985-09-27	Polska	2025-04-03 19:33:49.107
754	Demetriusz	Sadowski	2003-06-15	Polska	2025-10-03 11:30:21.698
755	Lucjan	Iwanowski	1975-04-05	Ukraina	2025-01-21 08:31:38.134
756	Henryk	Bąkowski	1966-06-18	Polska	2025-01-29 07:55:02.523
757	Herman	Bieniek	2004-09-19	Polska	2025-04-04 16:54:11.965
758	Donald	Piotrowski	1990-11-12	Ukraina	2025-07-20 11:29:47.954
759	Adrian	Kołodziejczyk	1965-09-14	Polska	2025-02-14 20:35:58.863
760	Wincenty	Jurkowski	1992-12-08	Niemcy	2025-11-04 06:44:09.369
761	Roksana	Głąb	1998-05-02	Niemcy	2025-08-28 10:58:00.386
762	Hieronim	Biernacki	1964-07-05	Niemcy	2025-07-28 19:21:38.601
763	Anatol	Piekarski	2002-12-17	Polska	2025-04-14 23:50:38.826
764	Dina	Grzesik	2000-03-09	Polska	2024-11-18 12:21:17.982
765	Anna	Szafrański	1970-02-19	Ukraina	2025-02-21 00:28:04.401
766	Emanuel	Niedzielski	1978-05-29	Polska	2025-06-27 20:07:26.529
767	Juliusz	Wilczyński	1968-12-12	Białoruś	2025-09-11 10:23:22.039
768	Irma	Nowaczyk	1987-06-08	Białoruś	2025-07-30 21:01:26.61
769	Ruta	Misiak	1977-11-10	Niemcy	2025-06-01 14:42:47.49
770	Hubert	Przybysz	1979-12-18	Polska	2024-12-28 04:16:08.705
771	Sara	Wyszyński	1974-05-07	Ukraina	2025-10-01 19:25:43.529
772	Dina	Modzelewski	1976-10-06	Polska	2025-06-25 01:58:58.378
773	Mikołaj	Jakubowski	2009-04-08	Ukraina	2025-02-04 23:57:59.703
774	Rufina	Gąsior	1968-12-19	Polska	2025-03-24 03:30:46.412
775	Arkady	Madej	1988-02-08	Polska	2025-07-30 18:16:09.453
776	Włodzimierz	Karczewski	1993-12-27	Polska	2025-07-22 01:22:14.645
777	Herbert	Szulc	1978-05-13	Polska	2024-11-09 08:32:15.853
778	Alina	Koper	1966-09-02	Polska	2025-05-12 17:18:54.182
779	Ignacy	Kosiński	1995-02-07	Polska	2024-11-08 15:24:43.455
780	Wilhelmina	Dominiak	1979-03-24	Ukraina	2025-09-26 04:50:01.94
781	Makary	Lipski	1972-03-23	Białoruś	2025-08-19 04:37:32.3
782	Konstantyn	Chrzanowski	2004-02-27	Białoruś	2025-02-06 12:47:04.049
783	Tymoteusz	Lisiecki	1967-09-09	Polska	2024-11-20 16:41:43.978
784	Izydor	Grochowski	2006-09-04	Polska	2025-02-18 09:45:01.061
785	Oleg	Jastrzębski	1979-02-02	Ukraina	2025-03-29 08:36:57.725
786	Antonina	Janicki	1980-05-09	Polska	2025-04-07 19:33:12.394
787	Roksana	Kostecki	2007-10-28	Polska	2025-06-19 21:31:17.157
788	Łucja	Grudzień	1982-02-06	Polska	2025-07-05 20:32:21.538
789	Zygmunt	Zaremba	1980-09-03	Polska	2025-08-07 21:26:52.764
790	Albert	Nawrocki	1991-12-12	Polska	2025-03-11 09:50:01.753
791	Klara	Cichy	1988-02-11	Ukraina	2025-05-19 21:50:38.335
792	Innocenty	Nowiński	1982-04-08	Polska	2024-11-10 17:49:40.187
793	Gonsalwy	Madej	1987-04-15	Białoruś	2025-07-26 01:09:54.459
794	Damian	Skiba	1990-05-08	Polska	2025-07-26 23:38:37.269
795	Ernest	Janiszewski	1987-07-07	Polska	2025-05-14 16:03:03.381
796	Albert	Woś	2009-08-08	Polska	2025-07-22 22:07:14.383
797	Krzysztof	Stefański	1974-06-18	Polska	2025-10-12 03:42:24.387
798	Baldwin	Tracz	1966-10-03	Ukraina	2025-08-11 09:01:17.345
799	Justyn	Głogowski	1974-12-23	Polska	2025-10-23 04:36:23.923
800	Luiza	Trzeciak	1991-04-05	Polska	2025-10-07 14:46:47.181
801	Nadzieja	Marchewka	1974-01-08	Polska	2024-11-17 11:16:29.256
802	Horacy	Wiśniewski	1996-09-30	Białoruś	2025-06-27 16:20:15.618
803	Borys	Czechowski	2002-11-28	Polska	2024-12-06 19:00:55.523
804	Luiza	Duszyński	1992-05-25	Ukraina	2025-10-08 09:25:04.895
805	Eustracjusz	Majcher	1967-07-10	Ukraina	2025-07-15 05:30:33.034
806	Gracja	Słowiński	1979-11-20	Polska	2025-11-05 14:19:23.693
807	Liliana	Wójcicki	2001-01-06	Białoruś	2025-04-07 22:44:27.605
808	Bertram	Głowacki	1978-03-21	Polska	2024-12-12 02:56:38.684
809	Ewa	Bieńkowski	1979-11-28	Polska	2025-04-09 20:20:04.927
810	Julia	Olejnik	1970-07-01	Polska	2025-02-10 09:29:58.069
811	Marta	Jaworski	1993-05-04	Polska	2025-08-01 17:36:28.862
812	Marek	Łuczak	1999-10-12	Białoruś	2025-06-16 17:59:43.713
813	Maria	Kogut	1989-01-04	Polska	2025-03-19 09:41:57.023
814	Tamara	Górka	1984-03-09	Polska	2025-08-26 01:20:40.353
815	Samuel	Kisiel	1969-09-09	Polska	2025-02-13 17:42:55.467
816	Arnold	Mikołajczak	1995-02-26	Polska	2025-03-20 17:58:19.115
817	Wiktoria	Hajduk	1991-08-14	Polska	2025-02-18 05:33:36.304
818	Kazimierz	Kalinowski	2006-10-06	Polska	2025-01-21 12:46:56.047
819	Władysław	Sobolewski	1963-12-27	Białoruś	2025-03-03 01:57:30.503
820	Samson	Urban	1982-10-10	Polska	2025-06-09 09:35:15.33
821	Franciszka	Gałka	2003-05-17	Polska	2025-05-12 07:19:53.013
822	Marek	Żurawski	1976-06-20	Polska	2025-10-06 08:16:55.892
823	Ferdynanda	Lipka	1973-07-10	Polska	2025-01-30 13:38:16.137
824	Gertruda	Kamiński	1989-01-22	Polska	2025-09-08 00:43:38.171
825	Krystian	Trzeciak	2007-02-03	Ukraina	2025-07-31 16:12:52.683
826	Dionizy	Kłos	1965-05-25	Polska	2025-03-21 21:54:50.619
827	Władysław	Sikora	1983-07-01	Białoruś	2025-06-26 04:11:08.128
828	Adrian	Jackowski	2005-07-23	Polska	2025-09-22 06:43:50.433
829	Walentyna	Skrzypek	1980-05-05	Polska	2025-10-08 01:56:49.446
830	Korneliusz	Flis	1964-12-23	Polska	2025-09-07 03:10:09.199
831	Gabriela	Czechowski	1974-03-02	Polska	2025-02-28 17:27:09.85
832	Adrian	Kmieć	1997-07-14	Polska	2024-11-27 16:23:16.859
833	Walenty	Urban	1965-08-13	Polska	2025-02-25 19:16:10.063
834	Julia	Bednarek	1981-08-13	Polska	2025-05-18 12:04:37.581
835	Juliusz	Stępień	1995-10-29	Polska	2025-01-23 02:40:36.369
836	Igor	Bielski	1980-05-30	Polska	2025-07-26 04:02:57.532
837	Izydor	Zarzycki	1971-01-21	Polska	2025-02-02 23:34:30.14
838	Łazarz	Cybulski	1984-06-08	Polska	2025-09-26 03:59:01.596
839	Marcin	Kmieć	1969-10-01	Niemcy	2025-02-22 10:28:24.798
840	Izajasz	Cebula	1994-08-07	Polska	2024-12-12 19:44:19.74
841	Edyta	Kania	1977-11-05	Polska	2025-04-19 23:42:45.587
842	Edyta	Stelmach	1980-11-15	Niemcy	2025-09-12 04:27:05.604
843	Gwido	Urbanowicz	1967-08-13	Polska	2025-06-18 21:03:18.979
844	Olga	Tomaszewski	1969-07-22	Ukraina	2025-04-12 17:51:17.856
845	Arnold	Piasecki	1977-06-13	Polska	2025-01-17 06:21:15.921
846	Hieronim	Burzyński	1993-05-29	Ukraina	2025-10-21 15:14:05.146
847	Daniel	Gwoździk	2003-10-25	Polska	2025-03-17 08:54:36.644
848	Maryna	Cichoń	1970-02-17	Polska	2024-11-25 16:32:26.317
849	Seweryn	Bąk	1992-02-19	Ukraina	2025-06-05 21:49:57.855
850	Juliusz	Radomski	1978-03-11	Ukraina	2025-02-16 21:19:22.975
851	Cecyliusz	Marciniak	1989-01-29	Ukraina	2025-06-02 12:44:56.245
852	Alina	Bogusz	1976-02-23	Polska	2025-04-16 02:34:37.882
853	Greta	Wroński	1970-05-22	Białoruś	2025-09-28 00:09:18.023
854	Eustracjusz	Napierała	1966-05-20	Polska	2025-05-31 18:57:54.624
855	Marceli	Sroka	1981-12-24	Niemcy	2024-11-16 00:51:10.326
856	Arnold	Zagórski	1993-12-18	Polska	2025-05-22 02:55:17.555
857	Aleksy	Jarząbek	2001-09-16	Polska	2025-04-05 22:31:33.957
858	Paulina	Kuczyński	1994-12-27	Polska	2025-08-13 19:35:19.779
859	Oliwier	Fijałkowski	1998-06-07	Polska	2025-10-23 14:39:37.609
860	Malwina	Nowakowski	1993-12-16	Polska	2025-01-13 02:16:58.014
861	Ksenia	Skoczylas	2000-09-21	Polska	2024-11-21 02:45:15.942
862	Róża	Wilk	1979-03-17	Białoruś	2025-07-24 20:32:40.51
863	Kira	Bogucki	1979-06-26	Ukraina	2025-03-05 17:25:00.638
864	Zachariasz	Piotrowicz	1977-04-26	Polska	2025-01-27 05:38:19.628
865	Maryna	Wypych	2009-04-17	Ukraina	2025-10-20 00:43:06.434
866	Polikarp	Górka	1965-11-11	Polska	2024-11-08 10:47:18.954
867	Liliana	Niemczyk	1984-02-13	Polska	2025-09-26 18:57:30.965
868	Paweł	Czechowski	1995-07-19	Polska	2025-08-02 07:52:05.74
869	Henryka	Wasiak	1969-08-05	Ukraina	2025-07-26 15:16:26.937
870	Cezary	Maślanka	1990-12-17	Białoruś	2025-10-16 15:48:23.232
871	Alicja	Jagodziński	1999-04-24	Niemcy	2025-10-05 20:04:20.84
872	Natanael	Kmiecik	2001-12-01	Polska	2025-10-25 12:12:21.248
873	Seweryn	Niedziela	1992-06-26	Ukraina	2025-06-30 16:04:04.321
874	Rudolf	Gołębiewski	1983-08-25	Polska	2025-08-31 19:44:34.363
875	Harald	Krupa	1966-04-29	Ukraina	2025-06-05 04:55:16.189
876	Klemens	Krawiec	2000-11-30	Polska	2025-02-23 02:49:17.616
877	Luiza	Leśniewski	1968-07-03	Polska	2024-11-16 17:52:05.623
878	Aleksandra	Żmuda	1984-01-11	Polska	2025-01-16 12:26:17.889
879	Matylda	Jankowski	1990-10-04	Ukraina	2025-09-27 01:31:48.87
880	Agnieszka	Strzelecki	1981-05-03	Białoruś	2025-04-26 11:49:44.171
881	Romeo	Kula	2005-08-27	Polska	2025-05-21 17:39:28.413
882	Ginewra	Misiak	1968-09-17	Polska	2025-02-26 16:29:41.4
883	Jakub	Bartosik	2001-02-04	Polska	2025-05-29 00:29:12.111
884	Wilhelm	Iwanowski	1996-08-20	Polska	2025-08-21 03:01:13.001
885	Magnus	Kowalczyk	1973-02-22	Polska	2025-04-28 04:18:59.442
886	Michał	Olejniczak	1979-10-12	Ukraina	2025-02-06 10:16:04.431
887	Ryszard	Rosiński	1966-09-11	Polska	2025-07-18 06:52:50.758
888	Józef	Graczyk	1994-03-23	Niemcy	2025-08-09 19:21:37.298
889	Gonsalwy	Wiącek	1980-10-17	Polska	2025-03-24 19:54:42.537
890	Wilfryd	Świątek	1968-07-31	Polska	2025-09-26 20:55:04.643
891	Greta	Bielski	1964-01-17	Polska	2025-03-31 04:55:31.178
892	Oskar	Baranowski	1994-06-06	Białoruś	2025-09-15 10:12:32.286
893	Oliwia	Borowiec	1970-02-13	Polska	2025-07-26 11:04:09.299
894	Makary	Lach	1969-11-10	Polska	2025-01-29 22:37:15.737
895	Waleria	Chmura	2002-08-08	Polska	2025-02-16 15:03:45.339
896	Seweryn	Wójtowicz	1993-11-20	Polska	2024-12-03 09:05:29.581
897	Patrycy	Wojciechowski	1973-02-22	Polska	2025-10-29 11:29:24.103
898	Jerzy	Marzec	1994-06-29	Polska	2025-03-14 23:00:54.591
899	Ksawera	Piórkowski	1985-10-05	Ukraina	2024-11-25 14:07:41.054
900	Gabriela	Golec	2003-05-29	Ukraina	2025-01-04 15:14:34.979
901	Estera	Kulesza	1982-07-26	Niemcy	2025-08-11 16:51:23.644
902	Konstancja	Rybarczyk	2004-12-17	Polska	2025-08-24 17:30:02.434
903	Emilia	Pietras	1964-11-14	Niemcy	2025-01-26 21:42:41.928
904	Archibald	Szostak	1971-09-27	Polska	2025-08-13 00:59:08.931
905	Olimpia	Czyżewski	1970-11-28	Polska	2025-02-24 04:00:15.605
906	Grzegorz	Górka	2004-08-23	Polska	2025-05-11 01:02:36.221
907	Terencjusz	Kuchta	1988-06-29	Polska	2025-07-28 01:15:41.909
908	Helena	Stanek	1978-01-15	Polska	2025-08-18 03:00:34.702
909	Robert	Pakuła	2002-08-29	Ukraina	2025-08-05 10:57:45.547
910	Ludwik	Janiszewski	1987-07-06	Polska	2024-11-27 07:48:50.324
911	Mikołaj	Kania	1978-12-13	Polska	2024-12-31 09:04:04.889
912	Luiza	Wasiak	1998-12-02	Polska	2025-01-24 01:56:05.15
913	Ambroży	Michalik	1976-10-09	Polska	2025-10-25 03:34:56.087
914	Samson	Tarnowski	1997-10-06	Polska	2025-03-21 06:05:40.785
915	Eugenia	Szulc	1985-10-02	Ukraina	2025-06-02 18:12:33.023
916	Serafin	Michalski	2005-12-15	Białoruś	2025-08-22 01:26:24.433
917	Diana	Tomaszewski	1988-12-09	Polska	2025-01-27 13:26:45.62
918	Nadzieja	Lewicki	1977-04-10	Ukraina	2025-03-09 12:21:32.712
919	Karolina	Marchewka	1982-02-09	Polska	2025-01-19 04:23:36.001
920	Igor	Frączek	2005-01-06	Polska	2025-08-15 00:33:53.355
921	Pelagia	Adamowicz	1988-12-29	Polska	2025-04-14 19:57:56.027
922	Kamila	Kaźmierczak	1968-05-20	Polska	2025-08-27 03:59:02.967
923	Eliza	Grześkowiak	2002-02-08	Białoruś	2025-11-02 08:06:09.202
924	Daniel	Januszewski	2003-03-18	Polska	2025-06-13 09:51:43.952
925	Seweryn	Świderski	2000-06-15	Polska	2025-08-12 08:10:43.584
926	Ariadna	Czech	1968-07-30	Ukraina	2025-03-23 05:45:10.58
927	Żaneta	Szwarc	2005-04-03	Polska	2024-12-11 15:25:49.641
928	Rachela	Sołtysiak	1992-10-20	Niemcy	2025-09-14 03:34:47.351
929	Cecylia	Dziuba	1980-08-26	Polska	2025-01-31 14:58:38.326
930	Matylda	Sobczak	1981-11-28	Polska	2025-01-09 16:37:15.877
931	Spirydion	Gwóźdź	1996-04-26	Ukraina	2025-07-17 17:45:02.531
932	Liliana	Jóźwiak	2002-03-03	Niemcy	2024-12-16 13:03:43.213
933	Prokul	Pilarski	1966-04-09	Niemcy	2025-01-22 01:22:04.384
934	Mikołaj	Szeląg	1985-03-09	Ukraina	2025-04-07 20:56:31.048
935	Nikola	Dubiel	1974-11-27	Polska	2025-09-10 09:44:09.457
936	Paula	Białkowski	1977-12-12	Polska	2025-06-17 00:41:56.348
937	Sylwia	Borek	1980-06-29	Polska	2025-07-22 02:04:12.644
938	Malwina	Kasperek	1972-02-24	Polska	2025-10-18 09:14:06.655
939	Lilla	Burzyński	1971-10-16	Polska	2025-06-15 04:08:03.417
940	Aida	Pawlicki	2004-02-27	Polska	2025-05-18 00:37:02.751
941	Konstancja	Szwed	1984-08-03	Ukraina	2025-10-10 08:25:53.883
942	Aurora	Gąsiorowski	1972-05-18	Ukraina	2025-05-22 19:02:51.148
943	Rajmund	Radecki	1991-02-14	Polska	2025-06-11 04:24:12.595
944	Weronika	Duda	1979-05-09	Polska	2024-11-07 15:23:15.706
945	Kleopatra	Rosiński	1995-03-01	Polska	2025-10-10 05:33:34.008
946	Abraham	Kasperek	1986-12-01	Polska	2025-04-09 02:44:49.842
947	Demetriusz	Godlewski	1990-12-21	Polska	2025-05-25 01:56:56.206
948	Penelopa	Gąsiorowski	1964-10-20	Niemcy	2025-09-27 21:16:20.747
949	Walenty	Cebula	1970-02-06	Polska	2025-05-28 21:54:33.684
950	Rachela	Grzesiak	2002-01-13	Białoruś	2025-07-17 19:01:48.059
951	August	Piechota	2003-08-14	Polska	2025-03-13 14:10:58.267
952	Spirydion	Wawrzyniak	1996-03-02	Polska	2025-11-01 04:30:32.835
953	Roland	Piasecki	1982-04-28	Ukraina	2025-04-10 16:16:47.467
954	Luiza	Sokołowski	1991-08-20	Polska	2025-05-26 05:56:34.969
955	Rufina	Gil	2004-10-13	Polska	2025-07-20 05:56:31.232
956	Paula	Lipka	2006-12-31	Polska	2025-10-29 10:28:00.239
957	Alina	Skoczylas	1973-04-13	Polska	2025-06-05 08:39:43.334
958	Walenty	Dziuba	2008-01-12	Polska	2024-12-01 15:44:02.324
959	Łazarz	Wesołowski	1989-11-07	Polska	2025-06-24 04:49:14.886
960	Osmund	Rak	1991-08-03	Niemcy	2025-01-08 15:09:02.116
961	Korneliusz	Niedźwiecki	1963-11-07	Polska	2025-03-27 19:59:08.387
962	Irma	Żmuda	1985-08-12	Polska	2025-01-31 15:25:23.15
963	Damian	Suski	1992-09-29	Ukraina	2025-04-09 14:17:02.762
964	Włodzimierz	Adamczyk	1986-04-07	Polska	2025-06-25 14:51:19.016
965	Konstantyn	Szatkowski	1988-12-30	Niemcy	2025-05-13 16:12:28.686
966	Dawid	Raczyński	2002-02-17	Białoruś	2025-01-23 12:39:25.15
967	Maryna	Pieczek	2006-03-03	Polska	2025-09-22 04:47:00.213
968	Edgar	Majka	1998-12-12	Polska	2025-05-21 08:19:55.504
969	Seweryn	Rak	1990-02-07	Polska	2025-03-14 12:45:44.927
970	Paula	Pluta	1963-12-23	Ukraina	2024-11-12 13:37:53.927
971	Stella	Kucharczyk	2000-10-10	Polska	2025-09-19 10:12:08.182
972	Paulina	Murawski	1977-06-09	Niemcy	2025-01-20 21:44:23.961
973	Izajasz	Król	1981-03-02	Polska	2025-01-08 13:46:22.348
974	Lucja	Grzelak	1993-01-05	Ukraina	2025-01-03 10:38:28.847
975	Lea	Rusin	2006-02-05	Niemcy	2025-09-22 00:40:07.502
976	Walerian	Trojanowski	2002-03-07	Polska	2025-01-16 20:26:34.383
977	Nazariusz	Suski	1964-02-17	Polska	2025-02-12 16:28:28.509
978	Cyra	Szymański	1983-11-19	Polska	2024-12-31 17:47:23.588
979	Eugeniusz	Świderski	1966-09-26	Niemcy	2025-02-05 23:15:38.204
980	Klemens	Banaś	1988-11-17	Polska	2025-08-29 06:58:29.57
981	Jonatan	Buczyński	1995-02-10	Polska	2025-10-04 20:05:03.888
982	Wincenty	Adamowicz	2006-08-15	Białoruś	2025-10-28 20:39:45.795
983	Leila	Górny	1996-08-13	Polska	2025-11-02 16:28:12.184
984	Konstancja	Wypych	1999-01-12	Polska	2025-02-26 11:03:56.242
985	Karolina	Malinowski	1985-11-08	Ukraina	2025-08-13 23:07:32.986
986	Laura	Flis	1999-10-16	Polska	2025-07-15 00:58:07.811
987	Beatrycze	Komorowski	1964-06-23	Niemcy	2025-07-02 05:58:57.895
988	Leon	Kędziora	1998-05-09	Polska	2025-07-20 23:18:59.285
989	Ariadna	Burzyński	1969-03-12	Polska	2025-09-07 11:37:41.927
990	Irena	Kuchta	2003-06-17	Niemcy	2025-03-04 13:52:10.426
991	Beatrycze	Koper	1972-12-29	Polska	2025-07-10 18:53:55.809
992	Sabina	Gawron	1967-01-29	Polska	2025-10-08 09:44:54.971
993	Tacjana	Głąb	1964-11-13	Niemcy	2025-10-27 15:28:03.834
994	Juliusz	Głowacki	2004-05-12	Ukraina	2025-06-22 21:30:55.064
995	Tomasz	Kaczorowski	1976-11-26	Polska	2024-11-12 10:08:53.373
996	Laurencjusz	Świątek	1970-08-27	Polska	2025-03-25 18:47:37.488
997	Sabina	Pluta	1972-02-20	Polska	2025-03-22 11:02:00.09
998	Nestor	Żukowski	1985-02-03	Polska	2025-08-05 10:32:35.468
999	Wacław	Gąsiorowski	2002-03-24	Polska	2025-05-17 03:08:18.379
1000	Henryka	Kubicki	1992-06-12	Polska	2025-06-23 04:31:05.756
\.


--
-- TOC entry 3473 (class 0 OID 16395)
-- Dependencies: 221
-- Data for Name: entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.entries (id, customer_id, entered_at, exited_at, created_at) FROM stdin;
1	485	2025-09-16 18:50:47	2025-09-16 22:52:47	2025-09-16 18:50:47
2	780	2025-10-19 15:42:18	2025-10-19 17:15:18	2025-10-19 15:42:18
3	46	2025-04-05 14:25:31	2025-04-05 16:40:31	2025-04-05 14:25:31
4	903	2025-02-01 19:11:02	2025-02-01 21:13:02	2025-02-01 19:11:02
5	964	2025-10-18 15:33:23	2025-10-18 19:56:23	2025-10-18 15:33:23
6	791	2024-11-24 16:00:20	2024-11-24 21:46:20	2024-11-24 16:00:20
7	429	2024-12-01 15:01:36	2024-12-01 20:06:36	2024-12-01 15:01:36
8	205	2025-10-04 17:54:18	2025-10-04 22:28:18	2025-10-04 17:54:18
9	703	2025-02-15 17:52:56	2025-02-15 22:32:56	2025-02-15 17:52:56
10	148	2025-03-11 22:42:19	2025-03-12 02:23:19	2025-03-11 22:42:19
11	992	2025-10-11 16:27:19	2025-10-11 20:35:19	2025-10-11 16:27:19
12	828	2025-07-29 14:31:15	2025-07-29 19:48:15	2025-07-29 14:31:15
13	309	2025-04-19 12:15:56	2025-04-19 14:34:56	2025-04-19 12:15:56
14	820	2025-02-08 14:00:24	2025-02-08 19:43:24	2025-02-08 14:00:24
15	370	2025-09-23 03:12:36	2025-09-23 04:26:36	2025-09-23 03:12:36
16	524	2025-07-23 15:57:34	2025-07-23 21:46:34	2025-07-23 15:57:34
17	853	2025-05-24 11:33:48	2025-05-24 17:20:48	2025-05-24 11:33:48
18	346	2025-04-11 14:32:00	2025-04-11 18:25:00	2025-04-11 14:32:00
19	431	2025-10-28 06:06:25	2025-10-28 09:51:25	2025-10-28 06:06:25
20	800	2025-06-28 15:23:25	2025-06-28 17:10:25	2025-06-28 15:23:25
21	597	2024-12-24 13:59:19	2024-12-24 16:53:19	2024-12-24 13:59:19
22	686	2025-06-30 22:52:04	2025-07-01 02:57:04	2025-06-30 22:52:04
23	34	2024-11-23 18:21:00	2024-11-23 21:10:00	2024-11-23 18:21:00
24	299	2025-04-15 15:15:33	2025-04-15 17:02:33	2025-04-15 15:15:33
25	40	2025-10-12 16:46:35	2025-10-12 19:32:35	2025-10-12 16:46:35
26	841	2025-10-28 17:04:18	2025-10-28 20:58:18	2025-10-28 17:04:18
27	75	2024-11-26 18:14:11	2024-11-26 21:34:11	2024-11-26 18:14:11
28	632	2025-03-11 19:49:28	2025-03-11 21:14:28	2025-03-11 19:49:28
29	185	2025-01-07 16:38:32	2025-01-07 18:04:32	2025-01-07 16:38:32
30	210	2025-02-09 16:53:21	2025-02-09 20:25:21	2025-02-09 16:53:21
31	706	2024-12-02 19:19:05	2024-12-02 21:53:05	2024-12-02 19:19:05
32	537	2025-09-19 14:57:50	2025-09-19 17:14:50	2025-09-19 14:57:50
33	899	2025-05-18 16:32:23	2025-05-18 19:10:23	2025-05-18 16:32:23
34	449	2025-06-15 15:37:21	2025-06-15 17:46:21	2025-06-15 15:37:21
35	635	2025-08-05 14:16:18	2025-08-05 15:28:18	2025-08-05 14:16:18
36	799	2025-02-02 14:28:19	2025-02-02 19:07:19	2025-02-02 14:28:19
37	115	2025-08-26 06:08:23	2025-08-26 08:13:23	2025-08-26 06:08:23
38	756	2024-12-01 03:40:06	2024-12-01 08:43:06	2024-12-01 03:40:06
39	961	2025-01-12 17:44:11	2025-01-12 21:12:11	2025-01-12 17:44:11
40	93	2025-02-09 10:46:51	2025-02-09 16:06:51	2025-02-09 10:46:51
41	970	2025-09-20 16:45:35	2025-09-20 18:01:35	2025-09-20 16:45:35
42	743	2025-06-12 15:22:42	2025-06-12 18:33:42	2025-06-12 15:22:42
43	871	2025-08-01 15:00:10	2025-08-01 20:50:10	2025-08-01 15:00:10
44	547	2025-01-19 17:29:44	2025-01-19 18:36:44	2025-01-19 17:29:44
45	938	2025-08-19 15:26:26	2025-08-19 19:12:26	2025-08-19 15:26:26
46	952	2025-02-22 16:56:03	2025-02-22 18:11:03	2025-02-22 16:56:03
47	181	2024-12-28 17:24:42	2024-12-28 20:44:42	2024-12-28 17:24:42
48	517	2025-01-14 18:30:07	2025-01-14 23:29:07	2025-01-14 18:30:07
49	302	2025-04-13 15:55:43	2025-04-13 18:41:43	2025-04-13 15:55:43
50	519	2024-12-21 17:46:45	2024-12-21 23:23:45	2024-12-21 17:46:45
51	450	2024-12-07 17:45:02	2024-12-07 20:56:02	2024-12-07 17:45:02
52	256	2025-01-12 15:10:32	2025-01-12 19:15:32	2025-01-12 15:10:32
53	953	2025-06-29 12:06:35	2025-06-29 14:48:35	2025-06-29 12:06:35
54	485	2024-12-03 16:32:32	2024-12-03 21:51:32	2024-12-03 16:32:32
55	664	2025-08-10 17:20:59	2025-08-10 20:20:59	2025-08-10 17:20:59
56	546	2024-12-03 17:10:54	2024-12-03 19:42:54	2024-12-03 17:10:54
57	838	2025-03-29 13:23:55	2025-03-29 18:04:55	2025-03-29 13:23:55
58	661	2025-10-28 15:42:22	2025-10-28 19:02:22	2025-10-28 15:42:22
59	936	2025-05-31 15:26:36	2025-05-31 21:18:36	2025-05-31 15:26:36
60	972	2025-02-18 17:33:34	2025-02-18 19:17:34	2025-02-18 17:33:34
61	22	2025-07-22 14:45:55	2025-07-22 16:15:55	2025-07-22 14:45:55
62	394	2025-10-26 06:15:04	2025-10-26 09:14:04	2025-10-26 06:15:04
63	457	2024-12-14 16:31:24	2024-12-14 21:36:24	2024-12-14 16:31:24
64	323	2025-08-07 15:30:34	2025-08-07 21:14:34	2025-08-07 15:30:34
65	555	2024-11-24 17:36:34	2024-11-24 19:03:34	2024-11-24 17:36:34
66	206	2025-09-27 07:16:24	2025-09-27 12:11:24	2025-09-27 07:16:24
67	413	2025-09-06 06:43:24	2025-09-06 10:05:24	2025-09-06 06:43:24
68	216	2024-12-08 17:55:02	2024-12-08 20:15:02	2024-12-08 17:55:02
69	444	2024-12-24 21:54:44	2024-12-25 00:37:44	2024-12-24 21:54:44
70	38	2025-07-06 14:50:30	2025-07-06 16:28:30	2025-07-06 14:50:30
71	498	2025-05-10 17:53:50	2025-05-10 20:27:50	2025-05-10 17:53:50
72	366	2025-02-15 15:32:27	2025-02-15 20:43:27	2025-02-15 15:32:27
73	319	2025-01-26 16:33:48	2025-01-26 18:56:48	2025-01-26 16:33:48
74	904	2025-03-18 19:43:21	2025-03-19 00:06:21	2025-03-18 19:43:21
75	678	2025-09-30 05:13:30	2025-09-30 10:55:30	2025-09-30 05:13:30
76	483	2024-12-24 18:00:37	2024-12-24 20:05:37	2024-12-24 18:00:37
77	524	2025-01-05 22:09:27	2025-01-05 23:54:27	2025-01-05 22:09:27
78	837	2025-07-20 15:42:29	2025-07-20 17:16:29	2025-07-20 15:42:29
79	782	2025-07-27 14:31:06	2025-07-27 19:37:06	2025-07-27 14:31:06
80	851	2025-06-07 02:07:17	2025-06-07 05:03:17	2025-06-07 02:07:17
81	906	2025-01-05 13:20:33	2025-01-05 16:41:33	2025-01-05 13:20:33
82	865	2025-03-01 17:11:35	2025-03-01 20:00:35	2025-03-01 17:11:35
83	229	2025-02-09 03:32:51	2025-02-09 09:10:51	2025-02-09 03:32:51
84	628	2025-07-20 14:06:13	2025-07-20 19:00:13	2025-07-20 14:06:13
85	903	2024-12-24 15:21:57	2024-12-24 18:58:57	2024-12-24 15:21:57
86	369	2025-05-02 06:09:43	2025-05-02 07:53:43	2025-05-02 06:09:43
87	233	2025-02-01 08:44:37	2025-02-01 12:08:37	2025-02-01 08:44:37
88	407	2025-03-25 15:29:06	2025-03-25 21:07:06	2025-03-25 15:29:06
89	398	2025-06-21 16:17:01	2025-06-21 20:54:01	2025-06-21 16:17:01
90	721	2025-06-15 15:41:15	2025-06-15 18:57:15	2025-06-15 15:41:15
91	12	2025-03-15 16:10:41	2025-03-15 21:19:41	2025-03-15 16:10:41
92	453	2025-03-08 19:02:14	2025-03-09 00:20:14	2025-03-08 19:02:14
93	411	2025-08-29 15:32:01	2025-08-29 21:05:01	2025-08-29 15:32:01
94	417	2025-09-16 16:49:47	2025-09-16 19:55:47	2025-09-16 16:49:47
95	689	2025-01-25 22:45:48	2025-01-26 01:17:48	2025-01-25 22:45:48
96	851	2025-04-01 14:14:03	2025-04-01 20:05:03	2025-04-01 14:14:03
97	754	2024-12-15 05:33:27	2024-12-15 09:15:27	2024-12-15 05:33:27
98	183	2024-11-20 16:38:03	2024-11-20 21:34:03	2024-11-20 16:38:03
99	125	2024-12-22 10:31:06	2024-12-22 16:25:06	2024-12-22 10:31:06
100	706	2025-06-24 17:26:01	2025-06-24 22:24:01	2025-06-24 17:26:01
101	326	2024-11-23 16:37:11	2024-11-23 18:32:11	2024-11-23 16:37:11
102	92	2025-07-12 16:25:22	2025-07-12 18:34:22	2025-07-12 16:25:22
103	169	2025-01-25 17:55:03	2025-01-25 23:52:03	2025-01-25 17:55:03
104	57	2025-08-17 14:21:09	2025-08-17 16:23:09	2025-08-17 14:21:09
105	886	2025-03-22 17:29:34	2025-03-22 21:22:34	2025-03-22 17:29:34
106	107	2025-10-07 16:40:42	2025-10-07 17:41:42	2025-10-07 16:40:42
107	471	2025-06-01 15:21:40	2025-06-01 20:46:40	2025-06-01 15:21:40
108	138	2025-08-26 18:48:53	2025-08-26 20:03:53	2025-08-26 18:48:53
109	406	2024-11-17 19:43:28	2024-11-18 01:01:28	2024-11-17 19:43:28
110	981	2025-01-18 07:51:02	2025-01-18 13:10:02	2025-01-18 07:51:02
111	515	2025-03-23 17:57:44	2025-03-23 21:24:44	2025-03-23 17:57:44
112	17	2025-08-09 16:37:15	2025-08-09 18:31:15	2025-08-09 16:37:15
113	934	2025-05-24 15:59:20	2025-05-24 18:12:20	2025-05-24 15:59:20
114	797	2024-12-10 09:54:14	2024-12-10 13:54:14	2024-12-10 09:54:14
115	227	2025-04-05 16:07:07	2025-04-05 19:46:07	2025-04-05 16:07:07
116	977	2025-08-26 15:47:43	2025-08-26 19:47:43	2025-08-26 15:47:43
117	535	2024-12-08 17:45:08	2024-12-08 19:51:08	2024-12-08 17:45:08
118	560	2025-06-17 17:07:32	2025-06-17 18:19:32	2025-06-17 17:07:32
119	482	2025-04-27 12:31:58	2025-04-27 13:45:58	2025-04-27 12:31:58
120	529	2025-04-06 16:50:33	2025-04-06 22:11:33	2025-04-06 16:50:33
121	665	2025-04-01 14:13:13	2025-04-01 19:38:13	2025-04-01 14:13:13
122	759	2024-12-17 11:03:00	2024-12-17 14:46:00	2024-12-17 11:03:00
123	105	2025-08-24 16:04:19	2025-08-24 21:22:19	2025-08-24 16:04:19
124	51	2025-05-23 18:56:29	2025-05-24 00:44:29	2025-05-23 18:56:29
125	663	2025-08-26 13:37:46	2025-08-26 15:28:46	2025-08-26 13:37:46
126	652	2025-02-25 19:29:59	2025-02-25 21:26:59	2025-02-25 19:29:59
127	495	2025-09-28 16:07:51	2025-09-28 17:26:51	2025-09-28 16:07:51
128	971	2025-06-03 00:59:12	2025-06-03 04:26:12	2025-06-03 00:59:12
129	360	2025-02-22 17:15:51	2025-02-22 21:57:51	2025-02-22 17:15:51
130	434	2025-08-16 06:30:05	2025-08-16 08:48:05	2025-08-16 06:30:05
131	714	2025-01-26 15:52:29	2025-01-26 19:23:29	2025-01-26 15:52:29
132	719	2025-10-14 15:38:28	2025-10-14 19:34:28	2025-10-14 15:38:28
133	444	2025-06-08 07:24:28	2025-06-08 09:28:28	2025-06-08 07:24:28
134	986	2025-03-25 06:37:54	2025-03-25 09:35:54	2025-03-25 06:37:54
135	629	2025-07-19 18:58:35	2025-07-19 23:03:35	2025-07-19 18:58:35
136	505	2025-01-25 15:23:26	2025-01-25 17:13:26	2025-01-25 15:23:26
137	744	2024-12-01 08:22:41	2024-12-01 09:24:41	2024-12-01 08:22:41
138	299	2025-05-18 16:55:57	2025-05-18 17:56:57	2025-05-18 16:55:57
139	7	2025-05-31 16:37:50	2025-05-31 20:12:50	2025-05-31 16:37:50
140	888	2025-09-30 11:21:13	2025-09-30 14:09:13	2025-09-30 11:21:13
141	589	2025-03-11 19:23:43	2025-03-12 00:38:43	2025-03-11 19:23:43
142	276	2025-06-10 13:07:33	2025-06-10 17:29:33	2025-06-10 13:07:33
143	607	2025-03-30 16:51:49	2025-03-30 20:16:49	2025-03-30 16:51:49
144	692	2025-04-05 14:10:07	2025-04-05 19:14:07	2025-04-05 14:10:07
145	712	2024-12-14 15:09:15	2024-12-14 18:21:15	2024-12-14 15:09:15
146	708	2024-11-16 19:35:46	2024-11-16 22:08:46	2024-11-16 19:35:46
147	9	2025-02-04 15:23:23	2025-02-04 20:15:23	2025-02-04 15:23:23
148	202	2025-06-29 14:00:43	2025-06-29 17:05:43	2025-06-29 14:00:43
149	284	2025-09-12 06:45:25	2025-09-12 08:42:25	2025-09-12 06:45:25
150	205	2025-05-19 15:18:05	2025-05-19 19:25:05	2025-05-19 15:18:05
151	821	2025-07-22 15:39:23	2025-07-22 17:35:23	2025-07-22 15:39:23
152	667	2025-02-25 21:11:54	2025-02-25 22:53:54	2025-02-25 21:11:54
153	69	2025-01-28 20:25:19	2025-01-28 21:25:19	2025-01-28 20:25:19
154	869	2025-10-07 14:03:11	2025-10-07 19:30:11	2025-10-07 14:03:11
155	913	2025-09-27 16:33:29	2025-09-27 20:57:29	2025-09-27 16:33:29
156	879	2025-03-22 07:36:48	2025-03-22 11:31:48	2025-03-22 07:36:48
157	169	2025-03-24 16:30:35	2025-03-24 19:34:35	2025-03-24 16:30:35
158	106	2025-05-03 16:54:13	2025-05-03 20:03:13	2025-05-03 16:54:13
159	326	2025-03-12 15:44:56	2025-03-12 21:26:56	2025-03-12 15:44:56
160	3	2025-09-19 23:57:15	2025-09-20 02:31:15	2025-09-19 23:57:15
161	300	2025-09-23 16:21:42	2025-09-23 19:53:42	2025-09-23 16:21:42
162	402	2025-08-02 15:58:07	2025-08-02 19:13:07	2025-08-02 15:58:07
163	437	2025-05-07 15:01:42	2025-05-07 20:13:42	2025-05-07 15:01:42
164	912	2025-08-20 14:28:26	2025-08-20 18:02:26	2025-08-20 14:28:26
165	551	2025-02-08 15:26:28	2025-02-08 17:44:28	2025-02-08 15:26:28
166	212	2025-05-06 14:46:18	2025-05-06 16:28:18	2025-05-06 14:46:18
167	375	2025-07-06 16:28:58	2025-07-06 19:25:58	2025-07-06 16:28:58
168	727	2025-10-21 17:21:01	2025-10-21 21:09:01	2025-10-21 17:21:01
169	6	2025-02-15 09:57:38	2025-02-15 11:57:38	2025-02-15 09:57:38
170	804	2025-04-07 02:26:21	2025-04-07 06:29:21	2025-04-07 02:26:21
171	499	2025-09-13 14:10:58	2025-09-13 19:10:58	2025-09-13 14:10:58
172	604	2025-08-24 15:05:08	2025-08-24 18:33:08	2025-08-24 15:05:08
173	874	2025-05-11 14:30:21	2025-05-11 19:33:21	2025-05-11 14:30:21
174	621	2025-08-03 14:25:08	2025-08-03 17:40:08	2025-08-03 14:25:08
175	379	2024-12-17 19:16:08	2024-12-18 00:53:08	2024-12-17 19:16:08
176	489	2025-08-19 08:52:55	2025-08-19 14:13:55	2025-08-19 08:52:55
177	590	2025-04-05 08:20:36	2025-04-05 11:50:36	2025-04-05 08:20:36
178	581	2025-04-22 01:57:27	2025-04-22 05:36:27	2025-04-22 01:57:27
179	313	2025-01-05 07:37:23	2025-01-05 10:13:23	2025-01-05 07:37:23
180	238	2025-05-25 00:19:08	2025-05-25 02:23:08	2025-05-25 00:19:08
181	728	2025-10-04 14:13:01	2025-10-04 18:30:01	2025-10-04 14:13:01
182	692	2025-08-23 09:38:59	2025-08-23 15:18:59	2025-08-23 09:38:59
183	323	2025-01-07 17:34:11	2025-01-07 19:52:11	2025-01-07 17:34:11
184	619	2025-04-22 16:47:33	2025-04-22 19:02:33	2025-04-22 16:47:33
185	442	2025-09-20 15:52:00	2025-09-20 17:53:00	2025-09-20 15:52:00
186	632	2025-08-31 14:12:10	2025-08-31 16:43:10	2025-08-31 14:12:10
187	544	2025-03-09 17:57:47	2025-03-09 22:29:47	2025-03-09 17:57:47
188	407	2025-01-14 10:06:03	2025-01-14 11:57:03	2025-01-14 10:06:03
189	922	2025-04-05 23:57:34	2025-04-06 05:06:34	2025-04-05 23:57:34
190	555	2025-10-18 15:06:40	2025-10-18 20:26:40	2025-10-18 15:06:40
191	729	2025-10-14 15:23:16	2025-10-14 18:54:16	2025-10-14 15:23:16
192	830	2025-04-27 12:44:40	2025-04-27 15:52:40	2025-04-27 12:44:40
193	442	2025-04-15 15:02:18	2025-04-15 20:54:18	2025-04-15 15:02:18
194	435	2025-06-23 23:09:51	2025-06-24 00:45:51	2025-06-23 23:09:51
195	481	2024-12-01 16:38:39	2024-12-01 20:05:39	2024-12-01 16:38:39
196	49	2025-01-26 13:18:34	2025-01-26 14:45:34	2025-01-26 13:18:34
197	347	2025-01-26 15:52:17	2025-01-26 18:03:17	2025-01-26 15:52:17
198	28	2024-12-28 15:35:20	2024-12-28 19:18:20	2024-12-28 15:35:20
199	678	2025-08-19 15:19:11	2025-08-19 20:26:11	2025-08-19 15:19:11
200	642	2024-12-28 19:42:15	2024-12-28 21:45:15	2024-12-28 19:42:15
201	641	2025-04-22 14:25:04	2025-04-22 16:42:04	2025-04-22 14:25:04
202	684	2025-08-18 14:24:05	2025-08-18 16:47:05	2025-08-18 14:24:05
203	357	2025-02-18 16:51:11	2025-02-18 20:43:11	2025-02-18 16:51:11
204	896	2025-05-20 14:20:28	2025-05-20 15:22:28	2025-05-20 14:20:28
205	899	2025-08-11 15:39:40	2025-08-11 19:50:40	2025-08-11 15:39:40
206	875	2025-08-30 14:55:42	2025-08-30 15:58:42	2025-08-30 14:55:42
207	492	2025-04-28 14:00:02	2025-04-28 16:06:02	2025-04-28 14:00:02
208	798	2025-08-30 17:46:57	2025-08-30 22:50:57	2025-08-30 17:46:57
209	931	2024-12-28 16:19:33	2024-12-28 18:06:33	2024-12-28 16:19:33
210	141	2025-04-22 15:10:53	2025-04-22 18:29:53	2025-04-22 15:10:53
211	346	2025-04-15 18:26:08	2025-04-16 00:02:08	2025-04-15 18:26:08
212	261	2025-01-11 16:43:28	2025-01-11 19:09:28	2025-01-11 16:43:28
213	807	2025-02-11 18:59:35	2025-02-11 22:25:35	2025-02-11 18:59:35
214	582	2025-02-22 16:15:22	2025-02-22 17:23:22	2025-02-22 16:15:22
215	316	2024-11-16 18:02:07	2024-11-16 22:14:07	2024-11-16 18:02:07
216	860	2025-07-09 13:18:05	2025-07-09 19:06:05	2025-07-09 13:18:05
217	227	2025-01-04 15:50:47	2025-01-04 20:22:47	2025-01-04 15:50:47
218	528	2025-01-18 17:24:18	2025-01-18 19:55:18	2025-01-18 17:24:18
219	918	2025-07-08 08:38:27	2025-07-08 13:04:27	2025-07-08 08:38:27
220	690	2025-04-08 16:28:59	2025-04-08 19:21:59	2025-04-08 16:28:59
221	645	2025-04-19 16:45:18	2025-04-19 19:29:18	2025-04-19 16:45:18
222	239	2024-12-01 15:54:02	2024-12-01 18:31:02	2024-12-01 15:54:02
223	727	2025-06-17 14:54:12	2025-06-17 18:55:12	2025-06-17 14:54:12
224	556	2025-06-22 10:56:24	2025-06-22 12:33:24	2025-06-22 10:56:24
225	790	2025-07-06 15:30:23	2025-07-06 20:31:23	2025-07-06 15:30:23
226	453	2025-07-12 12:45:31	2025-07-12 14:30:31	2025-07-12 12:45:31
227	516	2024-12-14 16:31:43	2024-12-14 17:52:43	2024-12-14 16:31:43
228	769	2025-01-14 05:52:30	2025-01-14 08:38:30	2025-01-14 05:52:30
229	974	2025-06-07 16:50:40	2025-06-07 21:42:40	2025-06-07 16:50:40
230	228	2025-08-16 15:39:18	2025-08-16 19:07:18	2025-08-16 15:39:18
231	752	2025-01-21 15:05:22	2025-01-21 18:57:22	2025-01-21 15:05:22
232	605	2025-09-21 14:29:04	2025-09-21 18:59:04	2025-09-21 14:29:04
233	269	2024-11-19 17:32:24	2024-11-19 23:28:24	2024-11-19 17:32:24
234	32	2025-07-18 22:56:45	2025-07-19 02:33:45	2025-07-18 22:56:45
235	880	2025-09-05 14:15:29	2025-09-05 16:18:29	2025-09-05 14:15:29
236	179	2025-01-11 18:47:59	2025-01-11 20:48:59	2025-01-11 18:47:59
237	151	2025-05-24 21:05:47	2025-05-25 00:00:47	2025-05-24 21:05:47
238	17	2024-11-24 16:56:55	2024-11-24 18:51:55	2024-11-24 16:56:55
239	577	2025-04-05 13:54:40	2025-04-05 19:34:40	2025-04-05 13:54:40
240	278	2025-06-10 08:25:09	2025-06-10 12:43:09	2025-06-10 08:25:09
241	7	2025-02-23 18:36:08	2025-02-24 00:29:08	2025-02-23 18:36:08
242	769	2025-06-28 18:49:10	2025-06-28 19:58:10	2025-06-28 18:49:10
243	24	2025-09-02 16:19:47	2025-09-02 21:53:47	2025-09-02 16:19:47
244	222	2025-06-22 15:06:36	2025-06-22 18:32:36	2025-06-22 15:06:36
245	951	2025-03-16 16:37:30	2025-03-16 21:10:30	2025-03-16 16:37:30
246	335	2024-11-19 18:38:52	2024-11-19 21:30:52	2024-11-19 18:38:52
247	55	2024-11-13 15:16:29	2024-11-13 18:34:29	2024-11-13 15:16:29
248	196	2025-06-24 05:37:21	2025-06-24 08:05:21	2025-06-24 05:37:21
249	253	2025-04-29 15:16:32	2025-04-29 17:11:32	2025-04-29 15:16:32
250	239	2025-07-29 16:52:05	2025-07-29 22:26:05	2025-07-29 16:52:05
251	533	2025-05-03 14:52:59	2025-05-03 16:42:59	2025-05-03 14:52:59
252	526	2025-08-16 16:46:44	2025-08-16 22:39:44	2025-08-16 16:46:44
253	756	2025-02-18 15:51:07	2025-02-18 17:50:07	2025-02-18 15:51:07
254	419	2025-05-24 14:46:05	2025-05-24 17:26:05	2025-05-24 14:46:05
255	75	2025-09-09 07:09:59	2025-09-09 11:18:59	2025-09-09 07:09:59
256	73	2025-02-04 16:15:26	2025-02-04 22:08:26	2025-02-04 16:15:26
257	43	2025-06-17 14:38:52	2025-06-17 15:59:52	2025-06-17 14:38:52
258	680	2025-03-30 14:23:08	2025-03-30 15:51:08	2025-03-30 14:23:08
259	121	2025-08-23 16:18:48	2025-08-23 19:05:48	2025-08-23 16:18:48
260	207	2025-02-01 19:18:30	2025-02-01 22:18:30	2025-02-01 19:18:30
261	463	2025-07-29 17:05:33	2025-07-29 21:18:33	2025-07-29 17:05:33
262	623	2025-01-28 15:30:57	2025-01-28 18:35:57	2025-01-28 15:30:57
263	827	2025-02-18 01:17:13	2025-02-18 05:02:13	2025-02-18 01:17:13
264	199	2025-04-11 14:28:41	2025-04-11 18:40:41	2025-04-11 14:28:41
265	750	2025-08-23 15:53:06	2025-08-23 19:44:06	2025-08-23 15:53:06
266	267	2024-12-10 17:22:52	2024-12-10 19:18:52	2024-12-10 17:22:52
267	113	2024-12-14 16:09:56	2024-12-14 19:14:56	2024-12-14 16:09:56
268	929	2025-06-17 08:08:27	2025-06-17 13:28:27	2025-06-17 08:08:27
269	311	2025-04-10 16:34:33	2025-04-10 21:28:33	2025-04-10 16:34:33
270	218	2024-12-10 17:32:15	2024-12-10 22:02:15	2024-12-10 17:32:15
271	603	2025-11-01 19:50:40	2025-11-01 21:49:40	2025-11-01 19:50:40
272	64	2025-09-21 05:08:17	2025-09-21 08:44:17	2025-09-21 05:08:17
273	864	2025-02-15 15:06:32	2025-02-15 17:33:32	2025-02-15 15:06:32
274	900	2025-10-25 16:22:29	2025-10-25 19:53:29	2025-10-25 16:22:29
275	543	2025-11-04 16:02:47	2025-11-04 19:13:47	2025-11-04 16:02:47
276	760	2024-11-26 16:28:12	2024-11-26 21:37:12	2024-11-26 16:28:12
277	734	2025-05-28 16:56:04	2025-05-28 18:07:04	2025-05-28 16:56:04
278	881	2025-07-22 16:26:25	2025-07-22 21:13:25	2025-07-22 16:26:25
279	943	2025-04-06 15:54:47	2025-04-06 19:16:47	2025-04-06 15:54:47
280	357	2025-02-16 16:38:31	2025-02-16 20:42:31	2025-02-16 16:38:31
281	116	2025-03-23 16:36:47	2025-03-23 18:58:47	2025-03-23 16:36:47
282	513	2025-03-02 09:07:22	2025-03-02 13:45:22	2025-03-02 09:07:22
283	845	2025-01-25 19:08:23	2025-01-26 00:30:23	2025-01-25 19:08:23
284	371	2025-09-07 15:40:06	2025-09-07 20:31:06	2025-09-07 15:40:06
285	236	2025-10-11 18:27:10	2025-10-11 22:15:10	2025-10-11 18:27:10
286	638	2025-01-11 16:46:30	2025-01-11 20:24:30	2025-01-11 16:46:30
287	507	2025-10-28 15:48:09	2025-10-28 17:16:09	2025-10-28 15:48:09
288	421	2025-09-20 16:43:54	2025-09-20 19:06:54	2025-09-20 16:43:54
289	931	2025-07-08 15:04:31	2025-07-08 16:38:31	2025-07-08 15:04:31
290	575	2025-05-27 08:17:54	2025-05-27 12:41:54	2025-05-27 08:17:54
291	771	2025-06-02 14:07:14	2025-06-02 18:54:14	2025-06-02 14:07:14
292	347	2024-11-24 18:03:11	2024-11-24 19:41:11	2024-11-24 18:03:11
293	837	2025-03-29 09:19:59	2025-03-29 11:09:59	2025-03-29 09:19:59
294	108	2025-05-06 15:01:57	2025-05-06 18:47:57	2025-05-06 15:01:57
295	652	2025-10-05 15:06:23	2025-10-05 18:22:23	2025-10-05 15:06:23
296	477	2025-09-01 15:43:38	2025-09-01 19:21:38	2025-09-01 15:43:38
297	5	2025-01-26 16:19:42	2025-01-26 19:08:42	2025-01-26 16:19:42
298	197	2025-06-13 14:51:39	2025-06-13 20:32:39	2025-06-13 14:51:39
299	83	2025-09-09 15:31:47	2025-09-09 18:12:47	2025-09-09 15:31:47
300	836	2025-06-21 16:02:20	2025-06-21 17:51:20	2025-06-21 16:02:20
301	300	2024-11-24 17:32:59	2024-11-24 20:42:59	2024-11-24 17:32:59
302	235	2025-10-14 18:13:29	2025-10-14 19:19:29	2025-10-14 18:13:29
303	817	2025-09-09 16:11:43	2025-09-09 19:06:43	2025-09-09 16:11:43
304	510	2025-06-29 15:24:16	2025-06-29 17:26:16	2025-06-29 15:24:16
305	969	2025-04-22 14:00:00	2025-04-22 15:49:00	2025-04-22 14:00:00
306	11	2024-12-08 17:26:27	2024-12-08 22:16:27	2024-12-08 17:26:27
307	401	2025-03-09 10:28:47	2025-03-09 15:11:47	2025-03-09 10:28:47
308	921	2025-07-21 14:26:12	2025-07-21 19:50:12	2025-07-21 14:26:12
309	568	2024-12-28 17:02:42	2024-12-28 20:31:42	2024-12-28 17:02:42
310	267	2025-01-14 17:51:17	2025-01-14 19:45:17	2025-01-14 17:51:17
311	850	2025-01-15 19:28:58	2025-01-16 01:11:58	2025-01-15 19:28:58
312	655	2025-11-01 16:26:18	2025-11-01 18:16:18	2025-11-01 16:26:18
313	213	2024-12-29 15:08:35	2024-12-29 18:24:35	2024-12-29 15:08:35
314	407	2024-12-15 16:45:10	2024-12-15 17:52:10	2024-12-15 16:45:10
315	75	2025-09-14 16:08:00	2025-09-14 21:14:00	2025-09-14 16:08:00
316	110	2025-08-05 14:58:37	2025-08-05 19:11:37	2025-08-05 14:58:37
317	851	2025-02-23 17:21:14	2025-02-23 19:51:14	2025-02-23 17:21:14
318	917	2025-11-01 19:14:04	2025-11-01 23:45:04	2025-11-01 19:14:04
319	269	2025-11-01 17:09:40	2025-11-01 20:09:40	2025-11-01 17:09:40
320	530	2025-01-26 19:50:27	2025-01-26 21:42:27	2025-01-26 19:50:27
321	659	2025-06-03 09:31:39	2025-06-03 14:59:39	2025-06-03 09:31:39
322	776	2025-08-05 15:02:39	2025-08-05 18:24:39	2025-08-05 15:02:39
323	963	2025-09-13 07:46:49	2025-09-13 10:10:49	2025-09-13 07:46:49
324	648	2025-04-18 14:54:56	2025-04-18 19:10:56	2025-04-18 14:54:56
325	91	2025-01-25 07:59:37	2025-01-25 13:31:37	2025-01-25 07:59:37
326	512	2025-05-06 09:24:35	2025-05-06 15:05:35	2025-05-06 09:24:35
327	950	2025-06-17 16:09:43	2025-06-17 17:24:43	2025-06-17 16:09:43
328	995	2025-08-09 14:00:08	2025-08-09 16:12:08	2025-08-09 14:00:08
329	135	2025-05-19 18:00:22	2025-05-19 20:13:22	2025-05-19 18:00:22
330	33	2025-01-21 18:09:23	2025-01-21 22:18:23	2025-01-21 18:09:23
331	525	2025-10-21 07:34:48	2025-10-21 13:32:48	2025-10-21 07:34:48
332	370	2024-12-14 19:18:46	2024-12-14 20:41:46	2024-12-14 19:18:46
333	914	2025-03-18 16:39:37	2025-03-18 19:23:37	2025-03-18 16:39:37
334	939	2024-12-08 17:41:56	2024-12-08 18:54:56	2024-12-08 17:41:56
335	116	2025-02-09 09:16:21	2025-02-09 14:53:21	2025-02-09 09:16:21
336	478	2024-12-07 17:51:50	2024-12-07 19:00:50	2024-12-07 17:51:50
337	382	2025-05-14 14:43:04	2025-05-14 19:24:04	2025-05-14 14:43:04
338	208	2025-10-28 01:27:22	2025-10-28 05:19:22	2025-10-28 01:27:22
339	843	2025-10-14 15:24:11	2025-10-14 19:02:11	2025-10-14 15:24:11
340	326	2024-11-10 15:24:35	2024-11-10 17:45:35	2024-11-10 15:24:35
341	286	2025-10-28 17:46:40	2025-10-28 19:49:40	2025-10-28 17:46:40
342	580	2025-05-04 16:39:36	2025-05-04 22:17:36	2025-05-04 16:39:36
343	487	2025-05-31 17:50:56	2025-05-31 21:27:56	2025-05-31 17:50:56
344	98	2024-12-14 16:42:29	2024-12-14 22:19:29	2024-12-14 16:42:29
345	201	2024-12-10 13:18:28	2024-12-10 17:06:28	2024-12-10 13:18:28
346	687	2025-08-02 15:48:30	2025-08-02 17:25:30	2025-08-02 15:48:30
347	22	2025-09-07 09:04:45	2025-09-07 12:29:45	2025-09-07 09:04:45
348	21	2025-08-16 14:02:31	2025-08-16 17:03:31	2025-08-16 14:02:31
349	864	2025-03-11 10:58:59	2025-03-11 12:00:59	2025-03-11 10:58:59
350	41	2025-02-01 12:15:54	2025-02-01 14:04:54	2025-02-01 12:15:54
351	573	2024-11-26 07:51:03	2024-11-26 09:07:03	2024-11-26 07:51:03
352	505	2025-07-27 18:28:14	2025-07-27 23:04:14	2025-07-27 18:28:14
353	695	2025-06-22 14:52:35	2025-06-22 16:12:35	2025-06-22 14:52:35
354	314	2025-03-22 16:54:35	2025-03-22 19:48:35	2025-03-22 16:54:35
355	199	2024-11-09 20:58:43	2024-11-09 23:54:43	2024-11-09 20:58:43
356	786	2025-03-08 17:45:40	2025-03-08 20:41:40	2025-03-08 17:45:40
357	307	2025-10-05 14:42:52	2025-10-05 18:46:52	2025-10-05 14:42:52
358	500	2025-01-21 18:38:36	2025-01-21 23:50:36	2025-01-21 18:38:36
359	926	2025-10-21 16:54:48	2025-10-21 18:05:48	2025-10-21 16:54:48
360	299	2025-02-18 16:23:57	2025-02-18 19:36:57	2025-02-18 16:23:57
361	424	2024-11-19 16:59:00	2024-11-19 20:36:00	2024-11-19 16:59:00
362	988	2025-06-10 15:35:18	2025-06-10 17:47:18	2025-06-10 15:35:18
363	60	2025-03-18 17:32:02	2025-03-18 21:57:02	2025-03-18 17:32:02
364	850	2025-07-13 15:43:45	2025-07-13 21:13:45	2025-07-13 15:43:45
365	863	2025-06-24 04:24:59	2025-06-24 08:27:59	2025-06-24 04:24:59
366	786	2025-07-08 18:05:32	2025-07-08 20:53:32	2025-07-08 18:05:32
367	788	2024-12-24 16:17:23	2024-12-24 21:31:23	2024-12-24 16:17:23
368	921	2025-06-10 18:12:16	2025-06-10 19:58:16	2025-06-10 18:12:16
369	874	2025-11-02 12:24:56	2025-11-02 16:53:56	2025-11-02 12:24:56
370	293	2024-12-15 15:52:36	2024-12-15 20:37:36	2024-12-15 15:52:36
371	290	2024-12-24 18:33:00	2024-12-24 21:53:00	2024-12-24 18:33:00
372	268	2025-09-15 16:39:19	2025-09-15 18:45:19	2025-09-15 16:39:19
373	360	2025-08-19 18:08:45	2025-08-19 22:34:45	2025-08-19 18:08:45
374	672	2025-10-05 08:21:58	2025-10-05 09:44:58	2025-10-05 08:21:58
375	878	2025-08-08 15:25:15	2025-08-08 20:27:15	2025-08-08 15:25:15
376	19	2025-08-30 17:10:59	2025-08-30 20:06:59	2025-08-30 17:10:59
377	323	2025-04-08 15:36:44	2025-04-08 17:21:44	2025-04-08 15:36:44
378	212	2025-05-21 16:36:43	2025-05-21 22:34:43	2025-05-21 16:36:43
379	576	2025-08-01 18:38:12	2025-08-01 20:24:12	2025-08-01 18:38:12
380	792	2025-08-16 15:57:30	2025-08-16 21:56:30	2025-08-16 15:57:30
381	497	2025-02-18 16:37:29	2025-02-18 19:36:29	2025-02-18 16:37:29
382	941	2025-02-11 13:56:46	2025-02-11 18:58:46	2025-02-11 13:56:46
383	592	2025-07-26 16:09:48	2025-07-26 20:52:48	2025-07-26 16:09:48
384	311	2025-07-05 20:32:43	2025-07-05 23:55:43	2025-07-05 20:32:43
385	441	2025-10-14 18:45:21	2025-10-14 23:12:21	2025-10-14 18:45:21
386	328	2025-03-22 11:38:57	2025-03-22 17:15:57	2025-03-22 11:38:57
387	189	2025-04-12 16:32:25	2025-04-12 18:39:25	2025-04-12 16:32:25
388	173	2025-05-13 11:54:05	2025-05-13 15:18:05	2025-05-13 11:54:05
389	948	2025-10-18 10:02:07	2025-10-18 11:30:07	2025-10-18 10:02:07
390	684	2025-07-01 17:50:37	2025-07-01 19:10:37	2025-07-01 17:50:37
391	958	2025-02-25 17:24:58	2025-02-25 19:37:58	2025-02-25 17:24:58
392	890	2025-10-26 15:08:30	2025-10-26 17:00:30	2025-10-26 15:08:30
393	588	2025-06-22 14:38:58	2025-06-22 17:30:58	2025-06-22 14:38:58
394	938	2025-05-20 14:18:23	2025-05-20 15:48:23	2025-05-20 14:18:23
395	453	2025-01-28 14:05:10	2025-01-28 18:29:10	2025-01-28 14:05:10
396	568	2025-06-22 14:23:58	2025-06-22 16:23:58	2025-06-22 14:23:58
397	351	2025-02-18 16:45:20	2025-02-18 18:38:20	2025-02-18 16:45:20
398	851	2025-08-10 17:34:00	2025-08-10 22:18:00	2025-08-10 17:34:00
399	838	2025-08-30 17:03:06	2025-08-30 22:14:06	2025-08-30 17:03:06
400	708	2025-10-28 11:40:18	2025-10-28 13:07:18	2025-10-28 11:40:18
401	629	2025-04-22 15:39:33	2025-04-22 19:00:33	2025-04-22 15:39:33
402	314	2025-04-27 15:24:12	2025-04-27 17:50:12	2025-04-27 15:24:12
403	852	2024-12-23 17:57:34	2024-12-23 22:45:34	2024-12-23 17:57:34
404	874	2025-11-02 15:56:33	2025-11-02 21:26:33	2025-11-02 15:56:33
405	629	2025-07-26 15:46:20	2025-07-26 19:40:20	2025-07-26 15:46:20
406	899	2025-07-15 16:00:06	2025-07-15 18:39:06	2025-07-15 16:00:06
407	988	2025-08-09 15:00:51	2025-08-09 17:13:51	2025-08-09 15:00:51
408	231	2025-08-15 05:12:58	2025-08-15 06:48:58	2025-08-15 05:12:58
409	196	2025-03-25 15:24:04	2025-03-25 18:27:04	2025-03-25 15:24:04
410	981	2025-05-10 04:49:52	2025-05-10 06:07:52	2025-05-10 04:49:52
411	307	2025-05-25 05:40:00	2025-05-25 10:41:00	2025-05-25 05:40:00
412	763	2025-07-15 14:52:22	2025-07-15 19:22:22	2025-07-15 14:52:22
413	202	2025-02-04 15:06:57	2025-02-04 21:02:57	2025-02-04 15:06:57
414	635	2025-02-11 15:52:58	2025-02-11 17:18:58	2025-02-11 15:52:58
415	863	2025-04-01 07:21:58	2025-04-01 08:35:58	2025-04-01 07:21:58
416	968	2025-04-26 16:38:39	2025-04-26 21:36:39	2025-04-26 16:38:39
417	160	2025-10-18 14:21:04	2025-10-18 18:00:04	2025-10-18 14:21:04
418	559	2025-05-03 14:18:41	2025-05-03 18:19:41	2025-05-03 14:18:41
419	693	2024-12-21 16:38:57	2024-12-21 19:19:57	2024-12-21 16:38:57
420	180	2024-11-24 18:26:34	2024-11-24 22:40:34	2024-11-24 18:26:34
421	346	2025-05-17 04:33:56	2025-05-17 09:43:56	2025-05-17 04:33:56
422	986	2024-12-23 02:26:57	2024-12-23 06:24:57	2024-12-23 02:26:57
423	929	2025-02-23 17:27:44	2025-02-23 22:03:44	2025-02-23 17:27:44
424	815	2025-03-09 05:19:51	2025-03-09 07:40:51	2025-03-09 05:19:51
425	415	2025-08-05 14:19:10	2025-08-05 16:03:10	2025-08-05 14:19:10
426	605	2025-06-04 16:17:05	2025-06-04 21:44:05	2025-06-04 16:17:05
427	392	2025-03-25 18:09:52	2025-03-25 21:12:52	2025-03-25 18:09:52
428	553	2025-01-21 17:22:01	2025-01-21 19:41:01	2025-01-21 17:22:01
429	835	2025-06-15 18:58:44	2025-06-15 23:36:44	2025-06-15 18:58:44
430	842	2025-02-22 18:52:03	2025-02-22 20:11:03	2025-02-22 18:52:03
431	586	2025-05-20 14:50:36	2025-05-20 18:44:36	2025-05-20 14:50:36
432	996	2025-03-30 16:50:15	2025-03-30 18:14:15	2025-03-30 16:50:15
433	726	2025-09-23 14:54:56	2025-09-23 19:22:56	2025-09-23 14:54:56
434	810	2025-03-18 16:14:27	2025-03-18 18:41:27	2025-03-18 16:14:27
435	547	2025-06-03 14:19:55	2025-06-03 16:27:55	2025-06-03 14:19:55
436	133	2024-11-23 08:00:56	2024-11-23 11:57:56	2024-11-23 08:00:56
437	969	2025-04-06 07:59:23	2025-04-06 12:04:23	2025-04-06 07:59:23
438	847	2025-04-15 18:15:39	2025-04-15 23:52:39	2025-04-15 18:15:39
439	139	2025-03-17 11:51:28	2025-03-17 14:17:28	2025-03-17 11:51:28
440	554	2025-10-12 14:11:06	2025-10-12 18:41:06	2025-10-12 14:11:06
441	252	2025-06-24 17:51:32	2025-06-24 20:04:32	2025-06-24 17:51:32
442	328	2025-08-26 15:03:31	2025-08-26 20:23:31	2025-08-26 15:03:31
443	72	2025-04-27 13:54:09	2025-04-27 16:46:09	2025-04-27 13:54:09
444	624	2025-10-21 14:38:28	2025-10-21 19:52:28	2025-10-21 14:38:28
445	664	2025-06-14 16:32:05	2025-06-14 20:07:05	2025-06-14 16:32:05
446	832	2025-07-01 15:50:18	2025-07-01 19:02:18	2025-07-01 15:50:18
447	696	2024-12-18 17:27:56	2024-12-18 19:27:56	2024-12-18 17:27:56
448	631	2025-11-04 15:51:39	2025-11-04 20:49:39	2025-11-04 15:51:39
449	426	2024-12-07 16:47:49	2024-12-07 19:44:49	2024-12-07 16:47:49
450	96	2024-12-10 15:43:22	2024-12-10 18:15:22	2024-12-10 15:43:22
451	738	2025-07-20 16:34:44	2025-07-20 19:24:44	2025-07-20 16:34:44
452	669	2025-01-25 15:55:10	2025-01-25 21:45:10	2025-01-25 15:55:10
453	740	2025-04-01 16:52:24	2025-04-01 20:33:24	2025-04-01 16:52:24
454	403	2025-06-01 10:26:30	2025-06-01 16:17:30	2025-06-01 10:26:30
455	450	2025-04-29 05:48:35	2025-04-29 09:38:35	2025-04-29 05:48:35
456	756	2025-03-08 18:59:43	2025-03-08 20:03:43	2025-03-08 18:59:43
457	521	2025-03-29 15:02:54	2025-03-29 18:43:54	2025-03-29 15:02:54
458	843	2025-01-23 14:17:28	2025-01-23 19:39:28	2025-01-23 14:17:28
459	810	2024-11-16 16:34:35	2024-11-16 20:52:35	2024-11-16 16:34:35
460	344	2025-04-06 15:52:15	2025-04-06 19:36:15	2025-04-06 15:52:15
461	639	2025-11-02 16:25:19	2025-11-02 18:21:19	2025-11-02 16:25:19
462	123	2025-04-08 16:51:25	2025-04-08 22:16:25	2025-04-08 16:51:25
463	820	2025-09-23 14:56:51	2025-09-23 20:50:51	2025-09-23 14:56:51
464	979	2025-04-15 14:38:07	2025-04-15 17:12:07	2025-04-15 14:38:07
465	942	2024-12-07 04:10:12	2024-12-07 09:06:12	2024-12-07 04:10:12
466	204	2025-03-30 14:54:06	2025-03-30 18:19:06	2025-03-30 14:54:06
467	199	2025-06-17 16:37:42	2025-06-17 19:41:42	2025-06-17 16:37:42
468	591	2025-03-29 17:34:06	2025-03-29 19:09:06	2025-03-29 17:34:06
469	506	2025-05-24 16:40:03	2025-05-24 20:21:03	2025-05-24 16:40:03
470	368	2025-09-13 15:50:28	2025-09-13 18:10:28	2025-09-13 15:50:28
471	215	2025-08-09 15:50:32	2025-08-09 19:56:32	2025-08-09 15:50:32
472	200	2025-09-28 16:06:30	2025-09-28 18:06:30	2025-09-28 16:06:30
473	715	2024-11-30 07:40:48	2024-11-30 12:12:48	2024-11-30 07:40:48
474	720	2024-11-24 17:06:54	2024-11-24 22:39:54	2024-11-24 17:06:54
475	360	2025-07-01 14:55:54	2025-07-01 17:20:54	2025-07-01 14:55:54
476	829	2024-12-15 16:35:16	2024-12-15 22:21:16	2024-12-15 16:35:16
477	971	2025-07-15 05:09:37	2025-07-15 09:27:37	2025-07-15 05:09:37
478	187	2025-01-11 16:52:36	2025-01-11 18:37:36	2025-01-11 16:52:36
479	936	2025-04-01 18:38:39	2025-04-01 22:14:39	2025-04-01 18:38:39
480	791	2025-04-08 17:11:17	2025-04-08 18:45:17	2025-04-08 17:11:17
481	302	2025-08-10 09:58:20	2025-08-10 15:12:20	2025-08-10 09:58:20
482	77	2025-08-10 14:13:24	2025-08-10 16:20:24	2025-08-10 14:13:24
483	307	2025-09-05 22:25:01	2025-09-06 03:47:01	2025-09-05 22:25:01
484	901	2025-01-25 17:53:10	2025-01-25 20:47:10	2025-01-25 17:53:10
485	448	2025-01-03 15:13:23	2025-01-03 18:12:23	2025-01-03 15:13:23
486	180	2024-11-19 15:31:13	2024-11-19 20:50:13	2024-11-19 15:31:13
487	77	2025-09-07 17:05:21	2025-09-07 21:09:21	2025-09-07 17:05:21
488	144	2025-09-16 20:46:10	2025-09-17 02:09:10	2025-09-16 20:46:10
489	222	2024-12-28 16:01:39	2024-12-28 21:28:39	2024-12-28 16:01:39
490	850	2025-02-22 17:24:52	2025-02-22 22:10:52	2025-02-22 17:24:52
491	685	2025-04-15 16:19:56	2025-04-15 17:34:56	2025-04-15 16:19:56
492	41	2024-12-03 15:34:55	2024-12-03 19:59:55	2024-12-03 15:34:55
493	396	2025-03-15 16:49:12	2025-03-15 22:27:12	2025-03-15 16:49:12
494	132	2025-01-21 15:45:22	2025-01-21 17:19:22	2025-01-21 15:45:22
495	291	2025-06-07 19:52:11	2025-06-07 22:36:11	2025-06-07 19:52:11
496	786	2025-03-30 16:59:05	2025-03-30 18:36:05	2025-03-30 16:59:05
497	494	2024-11-16 17:50:16	2024-11-16 21:21:16	2024-11-16 17:50:16
498	502	2025-01-04 16:40:39	2025-01-04 19:02:39	2025-01-04 16:40:39
499	746	2025-03-18 15:20:39	2025-03-18 17:48:39	2025-03-18 15:20:39
500	692	2025-10-12 12:59:05	2025-10-12 14:11:05	2025-10-12 12:59:05
501	420	2025-04-22 16:32:28	2025-04-22 22:11:28	2025-04-22 16:32:28
502	217	2025-10-04 14:13:44	2025-10-04 18:23:44	2025-10-04 14:13:44
503	735	2025-10-26 17:38:22	2025-10-26 21:40:22	2025-10-26 17:38:22
504	855	2025-04-13 09:08:37	2025-04-13 13:23:37	2025-04-13 09:08:37
505	56	2025-04-01 15:30:28	2025-04-01 18:05:28	2025-04-01 15:30:28
506	457	2025-03-07 15:09:18	2025-03-07 18:02:18	2025-03-07 15:09:18
507	108	2024-12-03 16:42:04	2024-12-03 19:38:04	2024-12-03 16:42:04
508	707	2024-11-19 12:13:58	2024-11-19 17:34:58	2024-11-19 12:13:58
509	304	2025-04-12 16:44:26	2025-04-12 18:15:26	2025-04-12 16:44:26
510	288	2025-07-29 07:32:48	2025-07-29 09:00:48	2025-07-29 07:32:48
511	971	2025-02-04 15:18:53	2025-02-04 18:37:53	2025-02-04 15:18:53
512	420	2025-09-20 08:36:17	2025-09-20 11:41:17	2025-09-20 08:36:17
513	445	2025-09-30 15:32:56	2025-09-30 20:57:56	2025-09-30 15:32:56
514	160	2025-01-14 16:50:56	2025-01-14 22:41:56	2025-01-14 16:50:56
515	920	2025-09-16 18:25:29	2025-09-16 19:44:29	2025-09-16 18:25:29
516	330	2025-05-18 15:44:23	2025-05-18 18:39:23	2025-05-18 15:44:23
517	745	2025-01-14 17:19:03	2025-01-14 21:38:03	2025-01-14 17:19:03
518	381	2025-05-20 15:26:02	2025-05-20 17:51:02	2025-05-20 15:26:02
519	508	2025-09-27 15:37:49	2025-09-27 17:52:49	2025-09-27 15:37:49
520	402	2024-12-28 19:34:37	2024-12-28 21:58:37	2024-12-28 19:34:37
521	915	2025-09-13 16:11:29	2025-09-13 19:16:29	2025-09-13 16:11:29
522	343	2025-05-24 16:50:11	2025-05-24 19:18:11	2025-05-24 16:50:11
523	890	2025-06-10 12:55:57	2025-06-10 17:00:57	2025-06-10 12:55:57
524	576	2025-08-31 14:25:54	2025-08-31 17:24:54	2025-08-31 14:25:54
525	731	2025-01-28 16:59:30	2025-01-28 19:02:30	2025-01-28 16:59:30
526	795	2025-10-28 17:36:36	2025-10-28 21:02:36	2025-10-28 17:36:36
527	116	2025-10-07 18:12:22	2025-10-07 22:39:22	2025-10-07 18:12:22
528	433	2025-06-24 13:54:56	2025-06-24 19:45:56	2025-06-24 13:54:56
529	933	2024-12-31 17:57:42	2024-12-31 19:57:42	2024-12-31 17:57:42
530	937	2025-08-24 13:44:29	2025-08-24 17:37:29	2025-08-24 13:44:29
531	872	2025-07-27 16:56:46	2025-07-27 22:33:46	2025-07-27 16:56:46
532	777	2025-09-28 16:04:57	2025-09-28 20:09:57	2025-09-28 16:04:57
533	409	2025-02-15 17:04:52	2025-02-15 18:28:52	2025-02-15 17:04:52
534	116	2025-01-05 15:45:37	2025-01-05 20:24:37	2025-01-05 15:45:37
535	637	2024-12-17 14:21:55	2024-12-17 18:25:55	2024-12-17 14:21:55
536	278	2025-08-16 16:50:56	2025-08-16 21:18:56	2025-08-16 16:50:56
537	861	2025-03-02 14:57:20	2025-03-02 17:39:20	2025-03-02 14:57:20
538	771	2025-03-15 18:52:22	2025-03-15 21:35:22	2025-03-15 18:52:22
539	111	2025-02-01 14:37:03	2025-02-01 17:22:03	2025-02-01 14:37:03
540	804	2025-07-05 18:38:39	2025-07-06 00:36:39	2025-07-05 18:38:39
541	367	2025-09-09 15:59:44	2025-09-09 18:07:44	2025-09-09 15:59:44
542	318	2025-02-15 16:39:34	2025-02-15 18:00:34	2025-02-15 16:39:34
543	997	2024-12-14 17:01:41	2024-12-14 22:30:41	2024-12-14 17:01:41
544	359	2024-12-24 16:38:44	2024-12-24 21:20:44	2024-12-24 16:38:44
545	18	2025-02-15 06:56:51	2025-02-15 11:52:51	2025-02-15 06:56:51
546	331	2025-05-06 16:24:23	2025-05-06 21:44:23	2025-05-06 16:24:23
547	994	2025-02-15 05:45:20	2025-02-15 07:59:20	2025-02-15 05:45:20
548	315	2025-10-07 17:21:52	2025-10-07 21:32:52	2025-10-07 17:21:52
549	164	2024-11-19 15:06:29	2024-11-19 17:31:29	2024-11-19 15:06:29
550	157	2025-02-09 17:17:15	2025-02-09 20:42:15	2025-02-09 17:17:15
551	656	2025-05-17 18:55:51	2025-05-17 20:10:51	2025-05-17 18:55:51
552	856	2025-08-27 12:35:50	2025-08-27 13:57:50	2025-08-27 12:35:50
553	686	2025-10-21 05:26:47	2025-10-21 09:51:47	2025-10-21 05:26:47
554	252	2025-07-01 16:03:51	2025-07-01 20:49:51	2025-07-01 16:03:51
555	833	2024-12-14 15:02:48	2024-12-14 16:33:48	2024-12-14 15:02:48
556	211	2025-06-10 16:02:31	2025-06-10 19:50:31	2025-06-10 16:02:31
557	345	2025-01-11 15:04:55	2025-01-11 20:06:55	2025-01-11 15:04:55
558	269	2025-08-12 15:25:43	2025-08-12 18:55:43	2025-08-12 15:25:43
559	487	2025-05-18 06:53:18	2025-05-18 11:07:18	2025-05-18 06:53:18
560	583	2025-09-23 15:10:46	2025-09-23 19:54:46	2025-09-23 15:10:46
561	524	2025-08-23 06:20:58	2025-08-23 11:12:58	2025-08-23 06:20:58
562	542	2025-02-11 15:16:36	2025-02-11 20:47:36	2025-02-11 15:16:36
563	449	2025-01-11 19:00:04	2025-01-11 22:15:04	2025-01-11 19:00:04
564	83	2025-04-05 15:51:11	2025-04-05 20:48:11	2025-04-05 15:51:11
565	807	2025-01-08 10:52:54	2025-01-08 12:40:54	2025-01-08 10:52:54
566	629	2024-11-16 15:44:25	2024-11-16 18:47:25	2024-11-16 15:44:25
567	240	2025-06-23 14:05:53	2025-06-23 16:56:53	2025-06-23 14:05:53
568	988	2025-03-18 16:45:37	2025-03-18 21:08:37	2025-03-18 16:45:37
569	970	2025-07-08 16:37:06	2025-07-08 20:45:06	2025-07-08 16:37:06
570	921	2025-11-02 16:33:11	2025-11-02 20:53:11	2025-11-02 16:33:11
571	279	2024-12-31 17:35:23	2024-12-31 20:28:23	2024-12-31 17:35:23
572	949	2025-03-18 16:58:18	2025-03-18 20:27:18	2025-03-18 16:58:18
573	405	2025-05-10 18:05:25	2025-05-10 20:04:25	2025-05-10 18:05:25
574	126	2025-06-14 04:26:11	2025-06-14 08:34:11	2025-06-14 04:26:11
575	715	2025-10-25 00:05:33	2025-10-25 02:41:33	2025-10-25 00:05:33
576	792	2025-03-16 19:23:31	2025-03-16 22:47:31	2025-03-16 19:23:31
577	676	2025-08-30 06:24:13	2025-08-30 11:04:13	2025-08-30 06:24:13
578	430	2025-09-16 14:42:40	2025-09-16 17:40:40	2025-09-16 14:42:40
579	775	2025-05-11 15:22:44	2025-05-11 20:07:44	2025-05-11 15:22:44
580	401	2025-02-22 15:08:19	2025-02-22 16:48:19	2025-02-22 15:08:19
581	432	2025-02-11 16:24:42	2025-02-11 19:02:42	2025-02-11 16:24:42
582	575	2025-03-01 18:35:53	2025-03-01 23:31:53	2025-03-01 18:35:53
583	786	2025-11-04 15:40:58	2025-11-04 16:41:58	2025-11-04 15:40:58
584	26	2025-02-25 17:21:08	2025-02-25 18:40:08	2025-02-25 17:21:08
585	74	2025-06-21 09:36:21	2025-06-21 14:09:21	2025-06-21 09:36:21
586	332	2025-01-14 15:59:17	2025-01-14 18:09:17	2025-01-14 15:59:17
587	270	2024-12-03 15:18:37	2024-12-03 17:00:37	2024-12-03 15:18:37
588	629	2025-03-08 15:39:37	2025-03-08 19:24:37	2025-03-08 15:39:37
589	159	2025-07-20 11:07:01	2025-07-20 13:51:01	2025-07-20 11:07:01
590	889	2025-09-29 15:38:30	2025-09-29 18:41:30	2025-09-29 15:38:30
591	347	2025-02-25 05:06:46	2025-02-25 10:04:46	2025-02-25 05:06:46
592	746	2025-04-19 16:55:25	2025-04-19 20:14:25	2025-04-19 16:55:25
593	545	2025-10-04 16:36:30	2025-10-04 18:47:30	2025-10-04 16:36:30
594	495	2024-11-23 19:25:14	2024-11-23 22:53:14	2024-11-23 19:25:14
595	310	2025-01-26 03:24:59	2025-01-26 09:00:59	2025-01-26 03:24:59
596	55	2025-10-07 01:28:52	2025-10-07 03:29:52	2025-10-07 01:28:52
597	908	2025-11-04 17:57:01	2025-11-04 23:08:01	2025-11-04 17:57:01
598	478	2025-08-10 13:10:28	2025-08-10 15:33:28	2025-08-10 13:10:28
599	483	2025-04-26 13:01:04	2025-04-26 16:43:04	2025-04-26 13:01:04
600	962	2025-03-15 18:23:59	2025-03-15 20:02:59	2025-03-15 18:23:59
601	746	2025-08-08 14:37:09	2025-08-08 15:57:09	2025-08-08 14:37:09
602	705	2025-03-22 17:31:39	2025-03-22 20:33:39	2025-03-22 17:31:39
603	865	2025-04-21 04:07:50	2025-04-21 05:23:50	2025-04-21 04:07:50
604	205	2025-08-26 14:10:30	2025-08-26 19:21:30	2025-08-26 14:10:30
605	298	2025-04-06 14:50:46	2025-04-06 19:01:46	2025-04-06 14:50:46
606	676	2025-04-12 20:53:02	2025-04-13 02:27:02	2025-04-12 20:53:02
607	657	2025-02-25 17:13:44	2025-02-25 22:39:44	2025-02-25 17:13:44
608	235	2024-12-15 17:45:51	2024-12-15 18:52:51	2024-12-15 17:45:51
609	248	2025-10-14 15:19:32	2025-10-14 17:40:32	2025-10-14 15:19:32
610	617	2025-04-26 14:55:15	2025-04-26 18:10:15	2025-04-26 14:55:15
611	710	2025-08-16 00:45:10	2025-08-16 03:47:10	2025-08-16 00:45:10
612	555	2025-07-22 16:45:45	2025-07-22 18:40:45	2025-07-22 16:45:45
613	714	2025-01-14 15:27:46	2025-01-14 18:14:46	2025-01-14 15:27:46
614	862	2024-12-27 12:53:07	2024-12-27 18:32:07	2024-12-27 12:53:07
615	130	2025-07-05 14:20:33	2025-07-05 16:33:33	2025-07-05 14:20:33
616	931	2025-08-23 16:57:19	2025-08-23 22:45:19	2025-08-23 16:57:19
617	503	2025-09-30 05:37:10	2025-09-30 08:41:10	2025-09-30 05:37:10
618	903	2025-09-02 19:01:47	2025-09-02 23:03:47	2025-09-02 19:01:47
619	252	2025-04-27 14:43:37	2025-04-27 16:32:37	2025-04-27 14:43:37
620	718	2025-04-01 14:46:43	2025-04-01 18:19:43	2025-04-01 14:46:43
621	975	2025-07-26 14:45:26	2025-07-26 20:07:26	2025-07-26 14:45:26
622	835	2025-10-12 15:39:57	2025-10-12 19:48:57	2025-10-12 15:39:57
623	573	2025-03-02 13:16:53	2025-03-02 15:47:53	2025-03-02 13:16:53
624	134	2025-04-13 15:50:31	2025-04-13 20:33:31	2025-04-13 15:50:31
625	82	2025-02-15 16:04:28	2025-02-15 21:51:28	2025-02-15 16:04:28
626	375	2025-09-23 11:20:43	2025-09-23 16:32:43	2025-09-23 11:20:43
627	441	2024-12-28 15:11:23	2024-12-28 21:00:23	2024-12-28 15:11:23
628	220	2025-01-18 09:05:54	2025-01-18 13:14:54	2025-01-18 09:05:54
629	119	2025-09-27 05:49:53	2025-09-27 08:40:53	2025-09-27 05:49:53
630	40	2025-05-25 16:23:10	2025-05-25 19:45:10	2025-05-25 16:23:10
631	507	2025-10-07 15:47:29	2025-10-07 21:45:29	2025-10-07 15:47:29
632	180	2025-04-26 15:03:20	2025-04-26 21:02:20	2025-04-26 15:03:20
633	686	2025-09-02 10:35:54	2025-09-02 13:03:54	2025-09-02 10:35:54
634	502	2025-05-17 16:39:21	2025-05-17 17:41:21	2025-05-17 16:39:21
635	785	2025-09-23 06:01:28	2025-09-23 07:53:28	2025-09-23 06:01:28
636	921	2025-10-21 14:50:48	2025-10-21 18:34:48	2025-10-21 14:50:48
637	96	2025-01-15 14:09:00	2025-01-15 15:52:00	2025-01-15 14:09:00
638	931	2025-11-02 12:21:37	2025-11-02 15:20:37	2025-11-02 12:21:37
639	37	2025-09-29 15:57:11	2025-09-29 19:14:11	2025-09-29 15:57:11
640	842	2025-06-10 09:25:30	2025-06-10 12:24:30	2025-06-10 09:25:30
641	230	2025-09-07 16:48:18	2025-09-07 21:40:18	2025-09-07 16:48:18
642	319	2025-09-16 15:47:40	2025-09-16 19:34:40	2025-09-16 15:47:40
643	640	2024-11-16 11:38:06	2024-11-16 12:53:06	2024-11-16 11:38:06
644	223	2025-11-04 17:40:10	2025-11-04 23:03:10	2025-11-04 17:40:10
645	408	2025-09-02 12:21:26	2025-09-02 17:10:26	2025-09-02 12:21:26
646	685	2024-12-17 11:48:16	2024-12-17 17:33:16	2024-12-17 11:48:16
647	176	2025-01-28 19:41:14	2025-01-29 00:34:14	2025-01-28 19:41:14
648	79	2025-04-06 16:10:48	2025-04-06 19:41:48	2025-04-06 16:10:48
649	353	2025-02-04 16:31:04	2025-02-04 21:28:04	2025-02-04 16:31:04
650	838	2025-06-24 02:09:28	2025-06-24 03:29:28	2025-06-24 02:09:28
651	778	2025-03-28 17:12:20	2025-03-28 22:22:20	2025-03-28 17:12:20
652	185	2024-12-03 02:29:10	2024-12-03 03:49:10	2024-12-03 02:29:10
653	306	2025-10-18 15:47:52	2025-10-18 16:49:52	2025-10-18 15:47:52
654	611	2025-08-12 14:05:45	2025-08-12 19:06:45	2025-08-12 14:05:45
655	679	2024-12-22 15:08:50	2024-12-22 19:04:50	2024-12-22 15:08:50
656	152	2025-10-18 14:43:40	2025-10-18 20:29:40	2025-10-18 14:43:40
657	627	2025-07-27 16:35:39	2025-07-27 20:29:39	2025-07-27 16:35:39
658	53	2025-07-01 15:29:28	2025-07-01 18:29:28	2025-07-01 15:29:28
659	741	2025-07-22 14:14:17	2025-07-22 18:40:17	2025-07-22 14:14:17
660	160	2025-08-24 16:44:33	2025-08-24 22:39:33	2025-08-24 16:44:33
661	111	2025-02-08 18:31:40	2025-02-08 21:57:40	2025-02-08 18:31:40
662	470	2025-04-03 05:18:03	2025-04-03 09:29:03	2025-04-03 05:18:03
663	610	2025-05-20 17:20:23	2025-05-20 21:17:23	2025-05-20 17:20:23
664	320	2025-01-12 08:45:01	2025-01-12 12:00:01	2025-01-12 08:45:01
665	925	2025-04-15 14:48:28	2025-04-15 20:10:28	2025-04-15 14:48:28
666	262	2024-12-07 17:42:37	2024-12-07 19:20:37	2024-12-07 17:42:37
667	554	2025-07-08 15:09:50	2025-07-08 20:18:50	2025-07-08 15:09:50
668	107	2025-01-04 17:19:28	2025-01-04 22:49:28	2025-01-04 17:19:28
669	112	2025-10-19 15:04:33	2025-10-19 18:25:33	2025-10-19 15:04:33
670	423	2025-10-04 16:43:55	2025-10-04 18:14:55	2025-10-04 16:43:55
671	321	2025-04-01 14:26:09	2025-04-01 15:45:09	2025-04-01 14:26:09
672	517	2025-10-11 15:49:35	2025-10-11 19:23:35	2025-10-11 15:49:35
673	197	2024-11-19 18:17:24	2024-11-20 00:06:24	2024-11-19 18:17:24
674	766	2025-09-21 18:46:28	2025-09-21 20:50:28	2025-09-21 18:46:28
675	884	2024-11-12 17:54:35	2024-11-12 19:40:35	2024-11-12 17:54:35
676	423	2025-04-27 15:49:39	2025-04-27 21:04:39	2025-04-27 15:49:39
677	948	2025-05-27 15:25:01	2025-05-27 18:35:01	2025-05-27 15:25:01
678	331	2024-11-16 21:40:37	2024-11-17 03:18:37	2024-11-16 21:40:37
679	685	2025-08-19 15:06:50	2025-08-19 16:30:50	2025-08-19 15:06:50
680	985	2025-03-29 17:04:14	2025-03-29 19:49:14	2025-03-29 17:04:14
681	210	2025-10-12 16:29:17	2025-10-12 17:32:17	2025-10-12 16:29:17
682	803	2025-08-24 15:07:40	2025-08-24 20:24:40	2025-08-24 15:07:40
683	426	2025-04-20 13:01:33	2025-04-20 17:44:33	2025-04-20 13:01:33
684	964	2024-11-30 16:15:22	2024-11-30 20:54:22	2024-11-30 16:15:22
685	425	2025-03-22 15:55:33	2025-03-22 19:12:33	2025-03-22 15:55:33
686	141	2025-03-09 15:23:42	2025-03-09 19:39:42	2025-03-09 15:23:42
687	46	2025-05-03 14:07:21	2025-05-03 17:10:21	2025-05-03 14:07:21
688	579	2025-10-04 06:35:45	2025-10-04 10:48:45	2025-10-04 06:35:45
689	57	2025-07-13 09:39:39	2025-07-13 13:31:39	2025-07-13 09:39:39
690	577	2025-09-06 15:37:35	2025-09-06 19:30:35	2025-09-06 15:37:35
691	90	2025-06-10 16:27:01	2025-06-10 20:35:01	2025-06-10 16:27:01
692	620	2025-09-21 14:10:14	2025-09-21 18:57:14	2025-09-21 14:10:14
693	770	2025-07-26 12:24:01	2025-07-26 14:11:01	2025-07-26 12:24:01
694	286	2025-10-04 12:33:59	2025-10-04 14:49:59	2025-10-04 12:33:59
695	76	2025-05-20 17:13:13	2025-05-20 22:12:13	2025-05-20 17:13:13
696	976	2025-02-25 17:42:17	2025-02-25 19:24:17	2025-02-25 17:42:17
697	240	2025-07-26 14:53:49	2025-07-26 16:10:49	2025-07-26 14:53:49
698	942	2025-08-30 16:53:37	2025-08-30 18:36:37	2025-08-30 16:53:37
699	218	2025-06-22 11:56:23	2025-06-22 13:21:23	2025-06-22 11:56:23
700	581	2025-06-28 17:25:47	2025-06-28 20:53:47	2025-06-28 17:25:47
701	865	2024-12-15 16:43:35	2024-12-15 18:34:35	2024-12-15 16:43:35
702	604	2025-06-03 16:39:11	2025-06-03 20:37:11	2025-06-03 16:39:11
703	412	2025-08-23 15:53:22	2025-08-23 17:48:22	2025-08-23 15:53:22
704	249	2024-11-17 19:36:47	2024-11-17 23:42:47	2024-11-17 19:36:47
705	1000	2024-12-28 18:18:49	2024-12-28 19:23:49	2024-12-28 18:18:49
706	55	2025-05-20 15:29:50	2025-05-20 17:56:50	2025-05-20 15:29:50
707	36	2025-09-28 16:24:59	2025-09-28 21:27:59	2025-09-28 16:24:59
708	677	2024-11-24 13:00:01	2024-11-24 14:22:01	2024-11-24 13:00:01
709	351	2024-11-16 17:02:52	2024-11-16 22:02:52	2024-11-16 17:02:52
710	470	2025-03-25 19:23:51	2025-03-25 22:51:51	2025-03-25 19:23:51
711	888	2025-09-06 14:19:56	2025-09-06 20:12:56	2025-09-06 14:19:56
712	167	2025-05-27 16:49:45	2025-05-27 17:49:45	2025-05-27 16:49:45
713	764	2025-02-09 15:25:21	2025-02-09 21:00:21	2025-02-09 15:25:21
714	520	2025-10-18 14:02:14	2025-10-18 16:47:14	2025-10-18 14:02:14
715	304	2025-02-15 16:39:56	2025-02-15 21:17:56	2025-02-15 16:39:56
716	930	2025-05-06 15:06:35	2025-05-06 17:42:35	2025-05-06 15:06:35
717	590	2025-11-01 15:29:16	2025-11-01 16:47:16	2025-11-01 15:29:16
718	564	2024-11-18 16:33:45	2024-11-18 21:14:45	2024-11-18 16:33:45
719	625	2025-01-12 17:04:00	2025-01-12 20:47:00	2025-01-12 17:04:00
720	528	2024-11-20 10:11:05	2024-11-20 11:11:05	2024-11-20 10:11:05
721	901	2024-12-03 15:25:49	2024-12-03 18:35:49	2024-12-03 15:25:49
722	247	2025-04-05 14:11:59	2025-04-05 17:21:59	2025-04-05 14:11:59
723	203	2025-04-08 16:20:04	2025-04-08 22:08:04	2025-04-08 16:20:04
724	996	2025-03-09 15:59:51	2025-03-09 19:21:51	2025-03-09 15:59:51
725	191	2025-06-10 16:56:05	2025-06-10 20:17:05	2025-06-10 16:56:05
726	936	2024-12-03 16:06:06	2024-12-03 18:37:06	2024-12-03 16:06:06
727	605	2025-05-10 15:15:01	2025-05-10 18:50:01	2025-05-10 15:15:01
728	2	2025-03-01 12:46:51	2025-03-01 18:09:51	2025-03-01 12:46:51
729	912	2025-03-08 15:45:51	2025-03-08 16:46:51	2025-03-08 15:45:51
730	986	2025-08-14 19:31:33	2025-08-14 20:47:33	2025-08-14 19:31:33
731	200	2024-12-01 19:55:32	2024-12-02 01:02:32	2024-12-01 19:55:32
732	485	2025-04-26 16:19:46	2025-04-26 19:19:46	2025-04-26 16:19:46
733	980	2025-06-10 10:00:44	2025-06-10 12:14:44	2025-06-10 10:00:44
734	582	2025-06-17 14:39:06	2025-06-17 16:41:06	2025-06-17 14:39:06
735	599	2025-07-08 18:31:52	2025-07-08 22:17:52	2025-07-08 18:31:52
736	387	2024-12-10 16:55:20	2024-12-10 22:37:20	2024-12-10 16:55:20
737	6	2025-09-20 16:24:26	2025-09-20 17:34:26	2025-09-20 16:24:26
738	170	2024-11-10 17:18:08	2024-11-10 19:29:08	2024-11-10 17:18:08
739	785	2025-02-02 16:53:10	2025-02-02 22:10:10	2025-02-02 16:53:10
740	54	2025-07-27 06:50:22	2025-07-27 11:30:22	2025-07-27 06:50:22
741	898	2025-03-23 07:24:41	2025-03-23 12:50:41	2025-03-23 07:24:41
742	746	2025-11-03 17:26:32	2025-11-03 21:54:32	2025-11-03 17:26:32
743	592	2025-07-01 17:32:30	2025-07-01 23:07:30	2025-07-01 17:32:30
744	424	2025-02-01 15:13:42	2025-02-01 17:21:42	2025-02-01 15:13:42
745	196	2024-11-30 15:15:57	2024-11-30 17:19:57	2024-11-30 15:15:57
746	308	2025-08-05 16:50:15	2025-08-05 18:54:15	2025-08-05 16:50:15
747	528	2025-10-14 09:18:49	2025-10-14 12:14:49	2025-10-14 09:18:49
748	839	2025-01-05 16:08:41	2025-01-05 21:04:41	2025-01-05 16:08:41
749	340	2025-05-18 14:35:03	2025-05-18 18:03:03	2025-05-18 14:35:03
750	66	2025-09-07 16:48:47	2025-09-07 18:28:47	2025-09-07 16:48:47
751	405	2025-08-26 16:06:05	2025-08-26 20:31:05	2025-08-26 16:06:05
752	174	2025-03-23 19:21:14	2025-03-24 00:55:14	2025-03-23 19:21:14
753	720	2025-06-04 14:29:44	2025-06-04 15:58:44	2025-06-04 14:29:44
754	507	2025-05-01 16:34:51	2025-05-01 21:14:51	2025-05-01 16:34:51
755	148	2025-10-04 02:39:45	2025-10-04 07:51:45	2025-10-04 02:39:45
756	475	2025-06-08 15:58:36	2025-06-08 20:35:36	2025-06-08 15:58:36
757	444	2025-07-15 18:12:38	2025-07-15 19:51:38	2025-07-15 18:12:38
758	64	2025-02-01 07:55:33	2025-02-01 12:34:33	2025-02-01 07:55:33
759	645	2025-08-09 17:36:23	2025-08-09 20:58:23	2025-08-09 17:36:23
760	682	2024-11-12 15:41:53	2024-11-12 18:12:53	2024-11-12 15:41:53
761	316	2024-12-27 17:16:59	2024-12-27 20:09:59	2024-12-27 17:16:59
762	955	2025-07-31 15:07:43	2025-07-31 18:09:43	2025-07-31 15:07:43
763	12	2025-03-30 16:05:17	2025-03-30 20:56:17	2025-03-30 16:05:17
764	105	2025-04-08 15:34:37	2025-04-08 20:33:37	2025-04-08 15:34:37
765	70	2024-12-22 14:12:08	2024-12-22 19:36:08	2024-12-22 14:12:08
766	694	2025-06-03 17:22:51	2025-06-03 18:22:51	2025-06-03 17:22:51
767	178	2025-08-10 15:13:45	2025-08-10 19:02:45	2025-08-10 15:13:45
768	127	2025-04-22 15:31:09	2025-04-22 21:30:09	2025-04-22 15:31:09
769	561	2025-05-11 04:52:25	2025-05-11 10:09:25	2025-05-11 04:52:25
770	458	2025-05-16 16:32:29	2025-05-16 19:32:29	2025-05-16 16:32:29
771	739	2025-05-24 10:02:22	2025-05-24 11:18:22	2025-05-24 10:02:22
772	600	2025-02-04 14:22:49	2025-02-04 19:45:49	2025-02-04 14:22:49
773	183	2025-09-15 05:46:28	2025-09-15 06:51:28	2025-09-15 05:46:28
774	758	2025-01-18 16:02:25	2025-01-18 21:08:25	2025-01-18 16:02:25
775	512	2025-01-14 17:53:34	2025-01-14 20:55:34	2025-01-14 17:53:34
776	439	2025-06-22 16:47:31	2025-06-22 18:54:31	2025-06-22 16:47:31
777	995	2024-11-24 15:24:00	2024-11-24 17:44:00	2024-11-24 15:24:00
778	828	2025-05-27 17:44:35	2025-05-27 21:35:35	2025-05-27 17:44:35
779	196	2024-11-16 09:05:54	2024-11-16 14:14:54	2024-11-16 09:05:54
780	265	2025-03-04 17:37:20	2025-03-04 23:17:20	2025-03-04 17:37:20
781	76	2025-09-15 15:53:27	2025-09-15 20:52:27	2025-09-15 15:53:27
782	1000	2025-05-03 14:25:07	2025-05-03 20:03:07	2025-05-03 14:25:07
783	785	2025-03-15 17:58:47	2025-03-15 18:58:47	2025-03-15 17:58:47
784	706	2025-07-22 18:14:08	2025-07-22 21:33:08	2025-07-22 18:14:08
785	378	2025-01-25 16:38:53	2025-01-25 20:03:53	2025-01-25 16:38:53
786	19	2025-05-13 14:42:47	2025-05-13 19:06:47	2025-05-13 14:42:47
787	902	2025-10-21 16:12:48	2025-10-21 18:48:48	2025-10-21 16:12:48
788	659	2025-04-01 14:45:10	2025-04-01 18:51:10	2025-04-01 14:45:10
789	222	2024-12-07 16:59:52	2024-12-07 20:50:52	2024-12-07 16:59:52
790	369	2025-09-09 14:43:31	2025-09-09 16:03:31	2025-09-09 14:43:31
791	858	2025-11-01 19:45:29	2025-11-01 23:37:29	2025-11-01 19:45:29
792	82	2024-12-22 16:27:22	2024-12-22 17:46:22	2024-12-22 16:27:22
793	709	2025-07-19 15:02:18	2025-07-19 18:47:18	2025-07-19 15:02:18
794	984	2025-01-12 17:43:47	2025-01-12 21:04:47	2025-01-12 17:43:47
795	653	2025-05-27 16:25:57	2025-05-27 18:11:57	2025-05-27 16:25:57
796	360	2025-09-06 12:06:38	2025-09-06 14:23:38	2025-09-06 12:06:38
797	720	2025-05-31 14:35:45	2025-05-31 17:46:45	2025-05-31 14:35:45
798	28	2025-09-06 15:31:50	2025-09-06 21:04:50	2025-09-06 15:31:50
799	990	2025-06-07 17:32:33	2025-06-07 20:23:33	2025-06-07 17:32:33
800	633	2025-03-04 15:27:28	2025-03-04 20:46:28	2025-03-04 15:27:28
801	288	2025-03-11 17:04:58	2025-03-11 21:52:58	2025-03-11 17:04:58
802	816	2025-02-16 17:34:52	2025-02-16 20:38:52	2025-02-16 17:34:52
803	521	2025-01-26 18:38:05	2025-01-26 21:45:05	2025-01-26 18:38:05
804	143	2024-12-28 15:01:09	2024-12-28 20:06:09	2024-12-28 15:01:09
805	913	2025-02-16 15:35:17	2025-02-16 20:48:17	2025-02-16 15:35:17
806	863	2025-07-27 16:40:51	2025-07-27 20:00:51	2025-07-27 16:40:51
807	312	2025-07-27 14:27:46	2025-07-27 15:31:46	2025-07-27 14:27:46
808	20	2025-09-02 12:14:02	2025-09-02 14:33:02	2025-09-02 12:14:02
809	115	2024-12-29 21:51:00	2024-12-30 01:00:00	2024-12-29 21:51:00
810	50	2025-04-01 09:45:39	2025-04-01 14:51:39	2025-04-01 09:45:39
811	910	2025-03-02 16:57:08	2025-03-02 20:07:08	2025-03-02 16:57:08
812	293	2024-12-08 15:15:21	2024-12-08 17:37:21	2024-12-08 15:15:21
813	164	2025-02-01 17:35:03	2025-02-01 19:34:03	2025-02-01 17:35:03
814	755	2025-08-09 16:25:01	2025-08-09 21:59:01	2025-08-09 16:25:01
815	837	2025-04-12 18:59:49	2025-04-12 21:55:49	2025-04-12 18:59:49
816	811	2025-05-03 18:01:14	2025-05-03 23:26:14	2025-05-03 18:01:14
817	117	2025-01-05 17:10:10	2025-01-05 21:49:10	2025-01-05 17:10:10
818	453	2025-10-04 15:30:16	2025-10-04 18:59:16	2025-10-04 15:30:16
819	221	2024-12-08 17:41:59	2024-12-08 21:35:59	2024-12-08 17:41:59
820	712	2025-05-18 15:32:49	2025-05-18 19:28:49	2025-05-18 15:32:49
821	476	2025-10-05 15:40:43	2025-10-05 19:35:43	2025-10-05 15:40:43
822	705	2024-12-24 17:28:25	2024-12-24 18:31:25	2024-12-24 17:28:25
823	415	2025-07-29 16:59:47	2025-07-29 19:47:47	2025-07-29 16:59:47
824	343	2025-01-30 19:22:47	2025-01-30 23:21:47	2025-01-30 19:22:47
825	789	2025-03-29 17:12:19	2025-03-29 19:27:19	2025-03-29 17:12:19
826	168	2025-08-12 14:48:34	2025-08-12 17:45:34	2025-08-12 14:48:34
827	613	2025-04-26 06:55:34	2025-04-26 09:26:34	2025-04-26 06:55:34
828	947	2025-08-29 14:39:33	2025-08-29 16:27:33	2025-08-29 14:39:33
829	468	2024-11-26 15:00:50	2024-11-26 16:30:50	2024-11-26 15:00:50
830	486	2025-11-02 16:46:48	2025-11-02 21:53:48	2025-11-02 16:46:48
831	516	2025-03-11 17:11:08	2025-03-11 19:50:08	2025-03-11 17:11:08
832	684	2025-03-22 18:12:17	2025-03-22 20:18:17	2025-03-22 18:12:17
833	499	2024-12-29 19:14:37	2024-12-30 00:13:37	2024-12-29 19:14:37
834	421	2025-07-05 16:09:27	2025-07-05 21:24:27	2025-07-05 16:09:27
835	466	2025-10-07 15:02:11	2025-10-07 16:11:11	2025-10-07 15:02:11
836	560	2025-03-23 15:47:25	2025-03-23 17:42:25	2025-03-23 15:47:25
837	341	2025-05-29 16:36:08	2025-05-29 21:36:08	2025-05-29 16:36:08
838	35	2024-12-17 16:40:43	2024-12-17 21:52:43	2024-12-17 16:40:43
839	565	2025-06-02 14:42:54	2025-06-02 16:05:54	2025-06-02 14:42:54
840	519	2025-06-15 06:42:09	2025-06-15 07:55:09	2025-06-15 06:42:09
841	713	2025-08-30 18:42:56	2025-08-30 23:43:56	2025-08-30 18:42:56
842	341	2025-10-11 16:43:14	2025-10-11 19:58:14	2025-10-11 16:43:14
843	647	2025-11-04 16:04:31	2025-11-04 19:00:31	2025-11-04 16:04:31
844	26	2025-10-11 18:19:42	2025-10-11 21:07:42	2025-10-11 18:19:42
845	883	2025-09-26 14:13:12	2025-09-26 15:50:12	2025-09-26 14:13:12
846	805	2025-04-19 16:06:53	2025-04-19 21:02:53	2025-04-19 16:06:53
847	66	2025-04-06 15:46:21	2025-04-06 16:46:21	2025-04-06 15:46:21
848	702	2025-06-17 11:34:03	2025-06-17 14:20:03	2025-06-17 11:34:03
849	155	2025-02-15 16:16:46	2025-02-15 18:42:46	2025-02-15 16:16:46
850	277	2025-06-22 16:17:54	2025-06-22 20:49:54	2025-06-22 16:17:54
851	354	2024-12-21 15:48:00	2024-12-21 19:17:00	2024-12-21 15:48:00
852	804	2024-11-19 15:34:48	2024-11-19 18:24:48	2024-11-19 15:34:48
853	950	2025-09-27 18:11:45	2025-09-27 23:36:45	2025-09-27 18:11:45
854	712	2025-09-14 14:12:41	2025-09-14 19:00:41	2025-09-14 14:12:41
855	167	2025-09-16 05:25:06	2025-09-16 07:23:06	2025-09-16 05:25:06
856	37	2025-07-13 14:17:07	2025-07-13 19:14:07	2025-07-13 14:17:07
857	763	2025-05-13 16:53:37	2025-05-13 19:33:37	2025-05-13 16:53:37
858	506	2025-01-11 17:56:40	2025-01-11 22:24:40	2025-01-11 17:56:40
859	159	2025-04-01 16:39:13	2025-04-01 17:55:13	2025-04-01 16:39:13
860	203	2025-02-16 16:24:40	2025-02-16 20:04:40	2025-02-16 16:24:40
861	887	2025-08-04 14:47:14	2025-08-04 19:49:14	2025-08-04 14:47:14
862	765	2025-09-13 18:13:45	2025-09-13 21:07:45	2025-09-13 18:13:45
863	286	2025-02-01 15:19:49	2025-02-01 17:06:49	2025-02-01 15:19:49
864	194	2025-03-11 19:04:29	2025-03-12 00:49:29	2025-03-11 19:04:29
865	814	2025-06-03 14:34:03	2025-06-03 20:09:03	2025-06-03 14:34:03
866	746	2025-06-08 14:15:09	2025-06-08 16:54:09	2025-06-08 14:15:09
867	267	2025-09-09 18:40:15	2025-09-09 21:11:15	2025-09-09 18:40:15
868	314	2024-11-12 11:55:35	2024-11-12 16:23:35	2024-11-12 11:55:35
869	811	2025-01-18 16:04:51	2025-01-18 19:22:51	2025-01-18 16:04:51
870	206	2025-01-14 19:38:38	2025-01-14 22:12:38	2025-01-14 19:38:38
871	155	2025-03-11 16:15:28	2025-03-11 20:15:28	2025-03-11 16:15:28
872	140	2024-12-15 17:51:54	2024-12-15 21:13:54	2024-12-15 17:51:54
873	970	2025-04-06 16:50:41	2025-04-06 19:26:41	2025-04-06 16:50:41
874	543	2025-04-27 03:34:42	2025-04-27 04:48:42	2025-04-27 03:34:42
875	311	2025-06-14 14:24:41	2025-06-14 18:58:41	2025-06-14 14:24:41
876	298	2024-12-31 19:12:07	2024-12-31 21:47:07	2024-12-31 19:12:07
877	586	2025-01-18 08:59:17	2025-01-18 14:05:17	2025-01-18 08:59:17
878	825	2025-07-15 17:39:15	2025-07-15 20:04:15	2025-07-15 17:39:15
879	315	2025-07-13 14:19:27	2025-07-13 15:20:27	2025-07-13 14:19:27
880	707	2024-11-17 16:41:41	2024-11-17 18:16:41	2024-11-17 16:41:41
881	776	2025-11-02 17:00:52	2025-11-02 21:22:52	2025-11-02 17:00:52
882	88	2025-03-08 19:37:51	2025-03-09 01:01:51	2025-03-08 19:37:51
883	78	2025-03-18 17:59:23	2025-03-18 21:05:23	2025-03-18 17:59:23
884	321	2025-06-24 03:17:19	2025-06-24 06:20:19	2025-06-24 03:17:19
885	771	2025-08-11 12:40:07	2025-08-11 14:05:07	2025-08-11 12:40:07
886	650	2025-09-30 17:21:29	2025-09-30 21:29:29	2025-09-30 17:21:29
887	548	2025-01-12 16:07:30	2025-01-12 19:32:30	2025-01-12 16:07:30
888	468	2025-01-05 18:00:38	2025-01-05 23:19:38	2025-01-05 18:00:38
889	386	2025-05-27 14:47:47	2025-05-27 16:03:47	2025-05-27 14:47:47
890	765	2025-02-04 18:56:27	2025-02-04 20:57:27	2025-02-04 18:56:27
891	380	2025-07-05 15:38:12	2025-07-05 21:33:12	2025-07-05 15:38:12
892	720	2025-02-11 17:13:58	2025-02-11 18:38:58	2025-02-11 17:13:58
893	352	2025-06-14 14:30:49	2025-06-14 18:41:49	2025-06-14 14:30:49
894	638	2025-09-23 16:51:07	2025-09-23 19:25:07	2025-09-23 16:51:07
895	596	2025-03-04 15:06:42	2025-03-04 16:57:42	2025-03-04 15:06:42
896	159	2024-12-14 05:44:22	2024-12-14 09:05:22	2024-12-14 05:44:22
897	867	2024-11-12 19:51:21	2024-11-12 23:17:21	2024-11-12 19:51:21
898	936	2025-06-03 14:36:13	2025-06-03 16:10:13	2025-06-03 14:36:13
899	360	2025-04-19 15:07:37	2025-04-19 20:01:37	2025-04-19 15:07:37
900	375	2025-08-05 14:12:25	2025-08-05 18:10:25	2025-08-05 14:12:25
901	147	2025-02-16 15:58:57	2025-02-16 19:13:57	2025-02-16 15:58:57
902	389	2025-06-07 14:05:24	2025-06-07 17:32:24	2025-06-07 14:05:24
903	188	2025-07-05 16:41:22	2025-07-05 19:16:22	2025-07-05 16:41:22
904	576	2024-12-10 16:24:21	2024-12-10 20:50:21	2024-12-10 16:24:21
905	649	2025-04-27 14:27:51	2025-04-27 18:01:51	2025-04-27 14:27:51
906	493	2025-03-22 18:21:29	2025-03-22 20:11:29	2025-03-22 18:21:29
907	927	2025-10-05 07:42:58	2025-10-05 09:56:58	2025-10-05 07:42:58
908	536	2025-06-21 10:10:57	2025-06-21 15:42:57	2025-06-21 10:10:57
909	669	2025-09-20 14:03:31	2025-09-20 16:58:31	2025-09-20 14:03:31
910	464	2025-07-13 15:21:26	2025-07-13 16:46:26	2025-07-13 15:21:26
911	332	2025-03-01 18:06:15	2025-03-01 21:01:15	2025-03-01 18:06:15
912	566	2025-03-30 15:46:04	2025-03-30 17:20:04	2025-03-30 15:46:04
913	537	2024-12-01 16:15:52	2024-12-01 20:47:52	2024-12-01 16:15:52
914	157	2025-02-02 19:28:24	2025-02-02 22:19:24	2025-02-02 19:28:24
915	369	2025-02-16 19:18:33	2025-02-16 23:33:33	2025-02-16 19:18:33
916	40	2025-05-18 15:24:37	2025-05-18 16:54:37	2025-05-18 15:24:37
917	733	2025-01-07 12:17:31	2025-01-07 15:44:31	2025-01-07 12:17:31
918	240	2025-09-23 14:35:03	2025-09-23 18:07:03	2025-09-23 14:35:03
919	423	2025-07-20 16:15:30	2025-07-20 17:48:30	2025-07-20 16:15:30
920	277	2025-03-08 19:52:22	2025-03-09 01:50:22	2025-03-08 19:52:22
921	201	2024-12-20 05:14:10	2024-12-20 07:24:10	2024-12-20 05:14:10
922	769	2025-10-16 14:01:13	2025-10-16 16:57:13	2025-10-16 14:01:13
923	965	2025-08-02 17:57:57	2025-08-02 22:13:57	2025-08-02 17:57:57
924	935	2025-04-05 16:36:34	2025-04-05 19:10:34	2025-04-05 16:36:34
925	626	2025-04-12 17:47:09	2025-04-12 19:16:09	2025-04-12 17:47:09
926	514	2025-08-10 16:46:14	2025-08-10 19:35:14	2025-08-10 16:46:14
927	785	2025-08-30 13:01:32	2025-08-30 15:32:32	2025-08-30 13:01:32
928	649	2025-07-29 09:14:38	2025-07-29 14:19:38	2025-07-29 09:14:38
929	2	2025-02-23 18:39:40	2025-02-23 23:21:40	2025-02-23 18:39:40
930	144	2025-02-25 03:53:51	2025-02-25 07:57:51	2025-02-25 03:53:51
931	453	2025-09-23 14:08:31	2025-09-23 15:29:31	2025-09-23 14:08:31
932	870	2025-06-10 15:32:39	2025-06-10 20:16:39	2025-06-10 15:32:39
933	799	2025-04-19 14:20:18	2025-04-19 18:05:18	2025-04-19 14:20:18
934	761	2024-11-12 19:45:06	2024-11-12 23:17:06	2024-11-12 19:45:06
935	285	2025-03-23 17:23:13	2025-03-23 19:13:13	2025-03-23 17:23:13
936	207	2025-02-22 19:24:25	2025-02-22 21:23:25	2025-02-22 19:24:25
937	587	2025-06-10 14:04:36	2025-06-10 17:21:36	2025-06-10 14:04:36
938	710	2025-06-08 15:02:11	2025-06-08 19:58:11	2025-06-08 15:02:11
939	670	2025-07-19 16:41:23	2025-07-19 20:42:23	2025-07-19 16:41:23
940	77	2025-07-29 14:08:04	2025-07-29 17:51:04	2025-07-29 14:08:04
941	805	2025-01-12 17:47:40	2025-01-12 20:56:40	2025-01-12 17:47:40
942	335	2025-05-13 16:47:02	2025-05-13 17:49:02	2025-05-13 16:47:02
943	136	2025-02-12 16:58:22	2025-02-12 20:17:22	2025-02-12 16:58:22
944	440	2025-04-23 05:31:24	2025-04-23 06:31:24	2025-04-23 05:31:24
945	255	2025-01-26 11:16:48	2025-01-26 12:57:48	2025-01-26 11:16:48
946	869	2025-08-26 15:47:09	2025-08-26 21:04:09	2025-08-26 15:47:09
947	66	2025-09-07 15:13:08	2025-09-07 17:32:08	2025-09-07 15:13:08
948	843	2025-03-15 17:42:44	2025-03-15 23:39:44	2025-03-15 17:42:44
949	705	2025-05-18 15:46:51	2025-05-18 19:24:51	2025-05-18 15:46:51
950	551	2025-02-25 16:46:01	2025-02-25 18:00:01	2025-02-25 16:46:01
951	145	2025-09-21 15:31:58	2025-09-21 18:22:58	2025-09-21 15:31:58
952	668	2025-04-26 14:42:13	2025-04-26 17:31:13	2025-04-26 14:42:13
953	214	2025-08-02 16:24:23	2025-08-02 18:44:23	2025-08-02 16:24:23
954	761	2024-11-26 16:27:02	2024-11-26 21:36:02	2024-11-26 16:27:02
955	647	2025-06-22 16:21:49	2025-06-22 21:55:49	2025-06-22 16:21:49
956	627	2025-09-27 09:36:30	2025-09-27 14:14:30	2025-09-27 09:36:30
957	752	2025-07-29 15:59:45	2025-07-29 21:07:45	2025-07-29 15:59:45
958	591	2025-07-12 12:21:49	2025-07-12 14:22:49	2025-07-12 12:21:49
959	902	2025-04-19 15:35:10	2025-04-19 18:35:10	2025-04-19 15:35:10
960	366	2025-11-04 17:44:52	2025-11-04 20:06:52	2025-11-04 17:44:52
961	182	2025-08-19 16:26:07	2025-08-19 19:13:07	2025-08-19 16:26:07
962	461	2024-12-07 18:40:58	2024-12-07 23:28:58	2024-12-07 18:40:58
963	496	2025-03-08 23:26:48	2025-03-09 05:08:48	2025-03-08 23:26:48
964	47	2025-02-09 05:35:01	2025-02-09 09:45:01	2025-02-09 05:35:01
965	979	2024-12-03 17:50:02	2024-12-03 20:41:02	2024-12-03 17:50:02
966	448	2025-01-07 17:13:15	2025-01-07 22:57:15	2025-01-07 17:13:15
967	337	2025-05-04 15:05:55	2025-05-04 19:12:55	2025-05-04 15:05:55
968	489	2025-03-11 15:43:58	2025-03-11 19:22:58	2025-03-11 15:43:58
969	802	2025-01-07 06:28:09	2025-01-07 10:28:09	2025-01-07 06:28:09
970	73	2025-10-12 08:44:39	2025-10-12 14:24:39	2025-10-12 08:44:39
971	793	2025-08-30 17:29:31	2025-08-30 21:41:31	2025-08-30 17:29:31
972	934	2025-11-02 16:50:23	2025-11-02 21:26:23	2025-11-02 16:50:23
973	104	2025-03-02 07:43:09	2025-03-02 12:38:09	2025-03-02 07:43:09
974	751	2025-01-28 15:27:50	2025-01-28 17:03:50	2025-01-28 15:27:50
975	638	2025-02-18 16:12:26	2025-02-18 18:08:26	2025-02-18 16:12:26
976	234	2025-08-09 15:09:46	2025-08-09 20:06:46	2025-08-09 15:09:46
977	7	2025-08-30 16:04:17	2025-08-30 18:18:17	2025-08-30 16:04:17
978	752	2024-12-17 16:09:54	2024-12-17 21:11:54	2024-12-17 16:09:54
979	351	2025-04-12 14:59:22	2025-04-12 15:59:22	2025-04-12 14:59:22
980	795	2025-02-01 15:13:23	2025-02-01 17:00:23	2025-02-01 15:13:23
981	297	2025-06-22 08:52:34	2025-06-22 11:10:34	2025-06-22 08:52:34
982	968	2024-12-21 17:44:13	2024-12-21 19:56:13	2024-12-21 17:44:13
983	832	2025-10-14 15:43:19	2025-10-14 18:20:19	2025-10-14 15:43:19
984	84	2025-06-17 11:59:34	2025-06-17 13:20:34	2025-06-17 11:59:34
985	947	2025-02-22 15:02:10	2025-02-22 16:08:10	2025-02-22 15:02:10
986	834	2025-02-08 00:53:29	2025-02-08 02:57:29	2025-02-08 00:53:29
987	624	2025-08-05 16:59:16	2025-08-05 21:10:16	2025-08-05 16:59:16
988	573	2025-04-22 15:24:05	2025-04-22 18:16:05	2025-04-22 15:24:05
989	207	2025-04-20 07:56:02	2025-04-20 12:13:02	2025-04-20 07:56:02
990	307	2025-05-17 16:06:07	2025-05-17 20:54:07	2025-05-17 16:06:07
991	679	2025-01-07 19:58:45	2025-01-07 21:18:45	2025-01-07 19:58:45
992	762	2025-10-30 17:40:41	2025-10-30 20:44:41	2025-10-30 17:40:41
993	931	2025-05-27 16:56:48	2025-05-27 22:34:48	2025-05-27 16:56:48
994	239	2025-03-22 17:25:08	2025-03-22 21:35:08	2025-03-22 17:25:08
995	536	2025-10-04 15:53:40	2025-10-04 19:38:40	2025-10-04 15:53:40
996	174	2024-11-26 15:31:24	2024-11-26 19:20:24	2024-11-26 15:31:24
997	896	2025-01-19 17:23:44	2025-01-19 20:21:44	2025-01-19 17:23:44
998	542	2025-01-12 15:05:15	2025-01-12 20:45:15	2025-01-12 15:05:15
999	659	2025-07-03 17:09:34	2025-07-03 22:58:34	2025-07-03 17:09:34
1000	657	2024-11-12 17:12:58	2024-11-12 21:45:58	2024-11-12 17:12:58
1001	979	2025-09-28 16:58:52	2025-09-28 22:21:52	2025-09-28 16:58:52
1002	657	2025-07-26 14:18:38	2025-07-26 18:13:38	2025-07-26 14:18:38
1003	767	2025-10-28 16:21:23	2025-10-28 21:27:23	2025-10-28 16:21:23
1004	775	2025-09-23 15:24:21	2025-09-23 19:20:21	2025-09-23 15:24:21
1005	370	2025-07-22 16:58:55	2025-07-22 21:37:55	2025-07-22 16:58:55
1006	744	2025-08-26 17:26:18	2025-08-26 21:52:18	2025-08-26 17:26:18
1007	442	2025-05-20 15:34:58	2025-05-20 20:46:58	2025-05-20 15:34:58
1008	310	2025-04-06 18:53:51	2025-04-07 00:10:51	2025-04-06 18:53:51
1009	167	2025-06-03 14:36:31	2025-06-03 17:51:31	2025-06-03 14:36:31
1010	974	2025-10-05 16:45:08	2025-10-05 21:27:08	2025-10-05 16:45:08
1011	306	2025-01-04 17:56:24	2025-01-04 21:18:24	2025-01-04 17:56:24
1012	624	2025-01-18 19:31:11	2025-01-18 20:52:11	2025-01-18 19:31:11
1013	131	2025-03-24 13:18:58	2025-03-24 16:58:58	2025-03-24 13:18:58
1014	160	2025-09-20 14:22:39	2025-09-20 16:44:39	2025-09-20 14:22:39
1015	851	2024-11-23 17:09:38	2024-11-23 19:37:38	2024-11-23 17:09:38
1016	151	2025-07-18 17:01:48	2025-07-18 21:56:48	2025-07-18 17:01:48
1017	116	2025-04-06 17:54:38	2025-04-06 23:19:38	2025-04-06 17:54:38
1018	672	2025-04-27 14:44:15	2025-04-27 18:48:15	2025-04-27 14:44:15
1019	660	2025-10-28 15:30:16	2025-10-28 21:24:16	2025-10-28 15:30:16
1020	814	2025-06-24 04:04:28	2025-06-24 05:53:28	2025-06-24 04:04:28
1021	867	2025-09-23 18:31:55	2025-09-23 23:02:55	2025-09-23 18:31:55
1022	124	2025-04-16 02:02:08	2025-04-16 06:20:08	2025-04-16 02:02:08
1023	62	2025-03-22 15:08:34	2025-03-22 20:19:34	2025-03-22 15:08:34
1024	311	2025-03-09 17:14:07	2025-03-09 19:45:07	2025-03-09 17:14:07
1025	826	2025-06-14 13:26:31	2025-06-14 16:43:31	2025-06-14 13:26:31
1026	244	2025-03-26 17:36:24	2025-03-26 19:00:24	2025-03-26 17:36:24
1027	320	2025-03-30 14:13:54	2025-03-30 19:32:54	2025-03-30 14:13:54
1028	873	2025-04-19 16:57:50	2025-04-19 22:44:50	2025-04-19 16:57:50
1029	726	2025-03-22 15:36:05	2025-03-22 20:06:05	2025-03-22 15:36:05
1030	560	2025-10-05 16:59:13	2025-10-05 18:12:13	2025-10-05 16:59:13
1031	410	2025-01-07 14:00:32	2025-01-07 16:35:32	2025-01-07 14:00:32
1032	291	2025-10-07 15:14:06	2025-10-07 20:12:06	2025-10-07 15:14:06
1033	863	2025-05-18 17:39:07	2025-05-18 21:20:07	2025-05-18 17:39:07
1034	993	2025-03-22 12:45:13	2025-03-22 14:50:13	2025-03-22 12:45:13
1035	404	2024-12-08 12:01:41	2024-12-08 15:15:41	2024-12-08 12:01:41
1036	581	2025-07-08 16:56:10	2025-07-08 18:35:10	2025-07-08 16:56:10
1037	626	2025-04-24 06:46:44	2025-04-24 09:39:44	2025-04-24 06:46:44
1038	549	2025-08-26 10:11:01	2025-08-26 14:31:01	2025-08-26 10:11:01
1039	153	2025-04-20 15:02:30	2025-04-20 18:29:30	2025-04-20 15:02:30
1040	341	2025-07-26 16:34:49	2025-07-26 21:13:49	2025-07-26 16:34:49
1041	18	2025-05-23 17:00:38	2025-05-23 18:29:38	2025-05-23 17:00:38
1042	497	2025-02-01 17:40:59	2025-02-01 21:47:59	2025-02-01 17:40:59
1043	239	2025-05-13 14:57:50	2025-05-13 20:09:50	2025-05-13 14:57:50
1044	438	2025-06-07 15:16:21	2025-06-07 18:29:21	2025-06-07 15:16:21
1045	738	2025-06-10 06:32:16	2025-06-10 08:14:16	2025-06-10 06:32:16
1046	587	2024-12-24 18:47:00	2024-12-24 23:02:00	2024-12-24 18:47:00
1047	108	2025-05-31 15:46:37	2025-05-31 20:57:37	2025-05-31 15:46:37
1048	820	2025-08-26 16:59:20	2025-08-26 20:11:20	2025-08-26 16:59:20
1049	143	2025-02-15 18:18:13	2025-02-15 22:37:13	2025-02-15 18:18:13
1050	373	2025-10-26 17:50:37	2025-10-26 21:39:37	2025-10-26 17:50:37
1051	361	2025-04-05 14:21:51	2025-04-05 17:36:51	2025-04-05 14:21:51
1052	870	2025-07-15 15:32:38	2025-07-15 16:49:38	2025-07-15 15:32:38
1053	346	2025-07-14 05:34:53	2025-07-14 07:03:53	2025-07-14 05:34:53
1054	528	2024-12-10 17:43:46	2024-12-10 19:17:46	2024-12-10 17:43:46
1055	754	2025-05-16 16:56:31	2025-05-16 22:16:31	2025-05-16 16:56:31
1056	36	2024-11-12 16:18:48	2024-11-12 18:25:48	2024-11-12 16:18:48
1057	483	2025-06-17 15:00:38	2025-06-17 19:44:38	2025-06-17 15:00:38
1058	194	2024-11-15 16:34:16	2024-11-15 21:36:16	2024-11-15 16:34:16
1059	622	2025-07-05 16:48:48	2025-07-05 18:29:48	2025-07-05 16:48:48
1060	441	2024-12-17 15:02:05	2024-12-17 19:08:05	2024-12-17 15:02:05
1061	686	2024-12-10 15:28:09	2024-12-10 19:41:09	2024-12-10 15:28:09
1062	268	2025-06-14 14:32:29	2025-06-14 16:52:29	2025-06-14 14:32:29
1063	361	2025-05-27 16:31:35	2025-05-27 22:24:35	2025-05-27 16:31:35
1064	506	2025-07-29 17:11:44	2025-07-29 21:58:44	2025-07-29 17:11:44
1065	715	2025-06-22 04:46:02	2025-06-22 06:15:02	2025-06-22 04:46:02
1066	329	2025-08-23 14:01:19	2025-08-23 16:09:19	2025-08-23 14:01:19
1067	164	2025-06-28 03:19:35	2025-06-28 06:28:35	2025-06-28 03:19:35
1068	954	2025-09-13 15:33:22	2025-09-13 19:24:22	2025-09-13 15:33:22
1069	553	2025-01-26 19:11:15	2025-01-26 22:10:15	2025-01-26 19:11:15
1070	29	2024-12-21 18:45:54	2024-12-22 00:31:54	2024-12-21 18:45:54
1071	590	2025-07-05 16:46:54	2025-07-05 18:00:54	2025-07-05 16:46:54
1072	388	2025-02-02 19:47:31	2025-02-02 23:33:31	2025-02-02 19:47:31
1073	997	2025-07-20 17:31:01	2025-07-20 23:25:01	2025-07-20 17:31:01
1074	743	2025-04-15 16:25:04	2025-04-15 19:20:04	2025-04-15 16:25:04
1075	132	2025-04-01 16:31:48	2025-04-01 20:37:48	2025-04-01 16:31:48
1076	665	2025-08-10 15:47:01	2025-08-10 19:18:01	2025-08-10 15:47:01
1077	741	2025-08-09 15:18:45	2025-08-09 16:44:45	2025-08-09 15:18:45
1078	509	2025-04-16 16:17:46	2025-04-16 19:15:46	2025-04-16 16:17:46
1079	793	2025-04-19 21:27:47	2025-04-20 02:26:47	2025-04-19 21:27:47
1080	351	2025-01-13 18:57:58	2025-01-13 23:55:58	2025-01-13 18:57:58
1081	967	2025-05-06 09:28:23	2025-05-06 13:15:23	2025-05-06 09:28:23
1082	278	2025-09-06 15:57:12	2025-09-06 20:21:12	2025-09-06 15:57:12
1083	332	2024-12-29 11:41:39	2024-12-29 15:50:39	2024-12-29 11:41:39
1084	435	2025-01-05 15:41:44	2025-01-05 16:45:44	2025-01-05 15:41:44
1085	10	2025-04-17 14:16:49	2025-04-17 19:14:49	2025-04-17 14:16:49
1086	184	2025-04-06 14:24:05	2025-04-06 19:15:05	2025-04-06 14:24:05
1087	133	2025-02-23 16:53:25	2025-02-23 22:01:25	2025-02-23 16:53:25
1088	59	2025-02-10 23:56:20	2025-02-11 04:41:20	2025-02-10 23:56:20
1089	781	2025-02-03 18:47:03	2025-02-03 21:29:03	2025-02-03 18:47:03
1090	496	2025-03-25 18:10:41	2025-03-25 20:14:41	2025-03-25 18:10:41
1091	806	2025-09-14 16:54:11	2025-09-14 19:22:11	2025-09-14 16:54:11
1092	576	2025-01-19 19:13:37	2025-01-19 21:21:37	2025-01-19 19:13:37
1093	399	2025-03-30 09:02:36	2025-03-30 12:57:36	2025-03-30 09:02:36
1094	332	2025-01-26 16:46:25	2025-01-26 18:25:25	2025-01-26 16:46:25
1095	32	2025-10-28 05:09:27	2025-10-28 10:30:27	2025-10-28 05:09:27
1096	774	2025-04-19 08:22:36	2025-04-19 13:42:36	2025-04-19 08:22:36
1097	354	2025-09-28 15:20:18	2025-09-28 17:02:18	2025-09-28 15:20:18
1098	420	2025-01-07 17:22:47	2025-01-07 18:46:47	2025-01-07 17:22:47
1099	11	2025-05-31 15:12:41	2025-05-31 19:48:41	2025-05-31 15:12:41
1100	386	2025-09-02 14:58:23	2025-09-02 19:51:23	2025-09-02 14:58:23
1101	34	2025-02-04 20:49:38	2025-02-05 01:47:38	2025-02-04 20:49:38
1102	892	2024-12-01 13:22:05	2024-12-01 19:01:05	2024-12-01 13:22:05
1103	881	2024-11-24 18:24:52	2024-11-24 20:25:52	2024-11-24 18:24:52
1104	231	2025-05-31 16:47:02	2025-05-31 18:36:02	2025-05-31 16:47:02
1105	858	2025-05-13 14:08:56	2025-05-13 15:10:56	2025-05-13 14:08:56
1106	57	2025-09-16 07:37:06	2025-09-16 10:14:06	2025-09-16 07:37:06
1107	615	2025-09-23 14:46:58	2025-09-23 19:50:58	2025-09-23 14:46:58
1108	107	2025-09-13 21:05:11	2025-09-13 22:56:11	2025-09-13 21:05:11
1109	116	2025-06-21 15:34:44	2025-06-21 18:11:44	2025-06-21 15:34:44
1110	857	2025-10-07 16:53:19	2025-10-07 20:23:19	2025-10-07 16:53:19
1111	814	2025-05-18 14:17:43	2025-05-18 15:49:43	2025-05-18 14:17:43
1112	937	2025-03-11 15:25:07	2025-03-11 20:39:07	2025-03-11 15:25:07
1113	856	2025-03-16 16:56:25	2025-03-16 22:46:25	2025-03-16 16:56:25
1114	959	2025-02-02 17:40:34	2025-02-02 19:54:34	2025-02-02 17:40:34
1115	733	2025-10-21 07:37:26	2025-10-21 12:20:26	2025-10-21 07:37:26
1116	368	2025-04-08 15:01:13	2025-04-08 19:17:13	2025-04-08 15:01:13
1117	482	2025-06-01 14:22:37	2025-06-01 16:33:37	2025-06-01 14:22:37
1118	960	2025-02-15 16:08:05	2025-02-15 20:27:05	2025-02-15 16:08:05
1119	991	2025-09-30 17:35:42	2025-09-30 19:24:42	2025-09-30 17:35:42
1120	894	2024-11-25 16:49:17	2024-11-25 22:39:17	2024-11-25 16:49:17
1121	141	2025-08-23 15:16:58	2025-08-23 16:33:58	2025-08-23 15:16:58
1122	228	2025-05-17 04:12:42	2025-05-17 07:22:42	2025-05-17 04:12:42
1123	189	2025-11-01 19:50:08	2025-11-01 21:00:08	2025-11-01 19:50:08
1124	759	2024-12-17 01:55:50	2024-12-17 05:01:50	2024-12-17 01:55:50
1125	218	2025-09-26 17:36:38	2025-09-26 23:18:38	2025-09-26 17:36:38
1126	493	2025-09-02 08:01:52	2025-09-02 13:37:52	2025-09-02 08:01:52
1127	276	2025-06-07 12:28:31	2025-06-07 15:02:31	2025-06-07 12:28:31
1128	647	2025-10-25 15:29:27	2025-10-25 16:47:27	2025-10-25 15:29:27
1129	578	2025-05-13 15:51:45	2025-05-13 17:53:45	2025-05-13 15:51:45
1130	852	2025-05-18 15:36:19	2025-05-18 19:06:19	2025-05-18 15:36:19
1131	808	2025-06-07 15:36:10	2025-06-07 18:14:10	2025-06-07 15:36:10
1132	599	2025-09-20 14:34:17	2025-09-20 20:03:17	2025-09-20 14:34:17
1133	306	2025-03-18 15:39:58	2025-03-18 19:55:58	2025-03-18 15:39:58
1134	981	2025-03-08 16:53:30	2025-03-08 19:10:30	2025-03-08 16:53:30
1135	144	2025-09-16 14:04:18	2025-09-16 18:24:18	2025-09-16 14:04:18
1136	854	2024-12-08 17:10:31	2024-12-08 22:11:31	2024-12-08 17:10:31
1137	50	2024-11-19 15:58:28	2024-11-19 19:16:28	2024-11-19 15:58:28
1138	139	2024-12-07 17:38:50	2024-12-07 20:02:50	2024-12-07 17:38:50
1139	286	2024-11-23 16:34:01	2024-11-23 17:47:01	2024-11-23 16:34:01
1140	597	2025-03-23 17:17:25	2025-03-23 20:22:25	2025-03-23 17:17:25
1141	861	2025-07-08 15:33:04	2025-07-08 18:05:04	2025-07-08 15:33:04
1142	550	2025-07-05 14:58:05	2025-07-05 20:30:05	2025-07-05 14:58:05
1143	608	2025-02-15 17:20:22	2025-02-15 18:57:22	2025-02-15 17:20:22
1144	78	2025-07-13 14:35:42	2025-07-13 18:28:42	2025-07-13 14:35:42
1145	601	2025-10-07 14:36:23	2025-10-07 19:32:23	2025-10-07 14:36:23
1146	187	2025-10-28 16:35:59	2025-10-28 18:37:59	2025-10-28 16:35:59
1147	54	2025-06-07 14:11:26	2025-06-07 19:56:26	2025-06-07 14:11:26
1148	355	2025-06-15 18:21:09	2025-06-15 23:05:09	2025-06-15 18:21:09
1149	673	2025-10-05 17:50:05	2025-10-05 19:06:05	2025-10-05 17:50:05
1150	225	2025-06-07 16:27:39	2025-06-07 17:42:39	2025-06-07 16:27:39
1151	749	2025-08-17 21:10:38	2025-08-18 03:06:38	2025-08-17 21:10:38
1152	685	2025-06-29 17:32:55	2025-06-29 21:01:55	2025-06-29 17:32:55
1153	888	2024-12-22 15:04:23	2024-12-22 18:10:23	2024-12-22 15:04:23
1154	240	2025-03-11 06:38:47	2025-03-11 11:10:47	2025-03-11 06:38:47
1155	398	2025-09-14 16:48:41	2025-09-14 21:10:41	2025-09-14 16:48:41
1156	383	2025-08-26 16:32:03	2025-08-26 18:06:03	2025-08-26 16:32:03
1157	45	2025-03-25 16:56:50	2025-03-25 22:13:50	2025-03-25 16:56:50
1158	932	2025-07-30 14:02:53	2025-07-30 15:32:53	2025-07-30 14:02:53
1159	993	2025-09-07 14:47:07	2025-09-07 19:45:07	2025-09-07 14:47:07
1160	785	2025-10-18 17:34:10	2025-10-18 21:29:10	2025-10-18 17:34:10
1161	102	2025-04-20 16:32:49	2025-04-20 18:09:49	2025-04-20 16:32:49
1162	183	2025-10-04 18:29:28	2025-10-04 22:13:28	2025-10-04 18:29:28
1163	387	2025-07-22 14:06:03	2025-07-22 19:58:03	2025-07-22 14:06:03
1164	217	2025-03-04 15:54:18	2025-03-04 19:07:18	2025-03-04 15:54:18
1165	134	2025-01-11 14:03:20	2025-01-11 18:59:20	2025-01-11 14:03:20
1166	489	2025-04-29 16:09:17	2025-04-29 18:27:17	2025-04-29 16:09:17
1167	681	2025-06-30 18:43:10	2025-06-30 23:49:10	2025-06-30 18:43:10
1168	469	2025-09-30 17:17:01	2025-09-30 23:10:01	2025-09-30 17:17:01
1169	441	2025-05-13 12:28:07	2025-05-13 14:35:07	2025-05-13 12:28:07
1170	183	2025-05-13 14:01:43	2025-05-13 15:55:43	2025-05-13 14:01:43
1171	856	2025-04-13 18:29:46	2025-04-13 22:38:46	2025-04-13 18:29:46
1172	822	2025-01-04 17:20:44	2025-01-04 18:20:44	2025-01-04 17:20:44
1173	308	2025-07-06 17:52:13	2025-07-06 20:39:13	2025-07-06 17:52:13
1174	988	2025-03-22 15:38:25	2025-03-22 20:50:25	2025-03-22 15:38:25
1175	560	2025-07-29 18:37:33	2025-07-29 20:35:33	2025-07-29 18:37:33
1176	417	2025-10-07 15:16:03	2025-10-07 20:36:03	2025-10-07 15:16:03
1177	162	2025-10-21 04:14:24	2025-10-21 09:03:24	2025-10-21 04:14:24
1178	754	2025-06-10 18:24:16	2025-06-10 23:19:16	2025-06-10 18:24:16
1179	257	2025-05-12 09:40:29	2025-05-12 11:46:29	2025-05-12 09:40:29
1180	36	2025-03-02 15:20:12	2025-03-02 17:16:12	2025-03-02 15:20:12
1181	313	2025-09-30 15:44:37	2025-09-30 18:04:37	2025-09-30 15:44:37
1182	795	2025-05-31 18:33:31	2025-05-31 22:18:31	2025-05-31 18:33:31
1183	938	2024-12-15 17:49:14	2024-12-15 22:08:14	2024-12-15 17:49:14
1184	580	2025-08-26 14:06:08	2025-08-26 16:51:08	2025-08-26 14:06:08
1185	880	2025-05-14 17:04:52	2025-05-14 20:25:52	2025-05-14 17:04:52
1186	222	2024-12-15 15:25:40	2024-12-15 19:42:40	2024-12-15 15:25:40
1187	65	2025-09-09 15:23:33	2025-09-09 17:02:33	2025-09-09 15:23:33
1188	130	2025-02-18 19:05:03	2025-02-18 21:43:03	2025-02-18 19:05:03
1189	118	2025-04-26 06:35:11	2025-04-26 09:34:11	2025-04-26 06:35:11
1190	791	2025-01-07 16:01:59	2025-01-07 19:50:59	2025-01-07 16:01:59
1191	812	2025-09-09 16:23:16	2025-09-09 20:23:16	2025-09-09 16:23:16
1192	718	2024-11-19 16:41:54	2024-11-19 19:48:54	2024-11-19 16:41:54
1193	494	2024-11-23 07:48:24	2024-11-23 10:13:24	2024-11-23 07:48:24
1194	189	2025-03-04 11:45:54	2025-03-04 17:15:54	2025-03-04 11:45:54
1195	533	2025-01-28 16:19:27	2025-01-28 18:40:27	2025-01-28 16:19:27
1196	366	2025-02-22 17:00:29	2025-02-22 18:24:29	2025-02-22 17:00:29
1197	884	2025-02-01 17:24:04	2025-02-01 21:27:04	2025-02-01 17:24:04
1198	657	2025-06-14 18:49:59	2025-06-14 21:48:59	2025-06-14 18:49:59
1199	182	2025-01-14 16:16:31	2025-01-14 18:38:31	2025-01-14 16:16:31
1200	601	2024-12-17 15:45:21	2024-12-17 18:10:21	2024-12-17 15:45:21
1201	651	2024-11-19 11:06:54	2024-11-19 12:54:54	2024-11-19 11:06:54
1202	54	2025-01-05 18:52:19	2025-01-06 00:42:19	2025-01-05 18:52:19
1203	338	2025-02-11 16:47:21	2025-02-11 22:03:21	2025-02-11 16:47:21
1204	21	2024-12-17 17:13:40	2024-12-17 20:34:40	2024-12-17 17:13:40
1205	825	2025-03-01 16:24:11	2025-03-01 18:59:11	2025-03-01 16:24:11
1206	303	2025-10-04 15:24:52	2025-10-04 20:48:52	2025-10-04 15:24:52
1207	400	2025-10-14 14:38:05	2025-10-14 19:53:05	2025-10-14 14:38:05
1208	758	2025-07-15 15:20:41	2025-07-15 20:28:41	2025-07-15 15:20:41
1209	753	2025-05-11 10:18:49	2025-05-11 12:10:49	2025-05-11 10:18:49
1210	916	2025-03-22 19:01:19	2025-03-22 23:55:19	2025-03-22 19:01:19
1211	921	2025-07-19 18:31:30	2025-07-20 00:06:30	2025-07-19 18:31:30
1212	129	2025-03-22 07:14:49	2025-03-22 09:09:49	2025-03-22 07:14:49
1213	757	2025-06-05 11:46:52	2025-06-05 14:16:52	2025-06-05 11:46:52
1214	955	2025-09-27 14:45:40	2025-09-27 20:04:40	2025-09-27 14:45:40
1215	872	2025-07-15 08:29:09	2025-07-15 13:59:09	2025-07-15 08:29:09
1216	390	2025-05-06 14:17:17	2025-05-06 19:00:17	2025-05-06 14:17:17
1217	227	2024-12-08 17:30:45	2024-12-08 22:54:45	2024-12-08 17:30:45
1218	83	2025-08-12 16:22:34	2025-08-12 19:06:34	2025-08-12 16:22:34
1219	668	2024-11-23 08:35:18	2024-11-23 11:15:18	2024-11-23 08:35:18
1220	903	2025-06-01 16:32:34	2025-06-01 20:58:34	2025-06-01 16:32:34
1221	435	2024-11-24 04:30:44	2024-11-24 08:30:44	2024-11-24 04:30:44
1222	974	2025-09-14 16:36:31	2025-09-14 21:09:31	2025-09-14 16:36:31
1223	842	2025-08-05 04:56:18	2025-08-05 09:44:18	2025-08-05 04:56:18
1224	171	2025-05-18 15:43:20	2025-05-18 18:26:20	2025-05-18 15:43:20
1225	743	2025-03-25 17:26:15	2025-03-25 18:57:15	2025-03-25 17:26:15
1226	93	2025-01-18 18:07:34	2025-01-18 19:09:34	2025-01-18 18:07:34
1227	988	2025-06-03 15:37:58	2025-06-03 21:26:58	2025-06-03 15:37:58
1228	511	2025-02-04 14:01:28	2025-02-04 18:56:28	2025-02-04 14:01:28
1229	561	2025-02-11 01:18:06	2025-02-11 06:57:06	2025-02-11 01:18:06
1230	810	2025-10-12 16:26:00	2025-10-12 17:44:00	2025-10-12 16:26:00
1231	935	2025-09-16 06:06:13	2025-09-16 10:30:13	2025-09-16 06:06:13
1232	278	2025-07-15 14:30:31	2025-07-15 17:43:31	2025-07-15 14:30:31
1233	518	2025-06-29 15:29:09	2025-06-29 19:13:09	2025-06-29 15:29:09
1234	783	2024-11-23 17:49:33	2024-11-23 22:11:33	2024-11-23 17:49:33
1235	995	2025-03-29 15:39:29	2025-03-29 17:17:29	2025-03-29 15:39:29
1236	700	2025-11-01 08:28:50	2025-11-01 12:37:50	2025-11-01 08:28:50
1237	154	2025-05-17 15:09:51	2025-05-17 18:40:51	2025-05-17 15:09:51
1238	598	2025-05-24 17:04:32	2025-05-24 19:50:32	2025-05-24 17:04:32
1239	722	2025-02-23 05:05:48	2025-02-23 07:34:48	2025-02-23 05:05:48
1240	366	2025-01-19 18:11:30	2025-01-19 21:22:30	2025-01-19 18:11:30
1241	728	2025-02-16 11:01:54	2025-02-16 16:39:54	2025-02-16 11:01:54
1242	609	2025-08-12 15:06:27	2025-08-12 18:27:27	2025-08-12 15:06:27
1243	244	2024-11-30 18:54:17	2024-12-01 00:09:17	2024-11-30 18:54:17
1244	679	2025-10-14 09:31:04	2025-10-14 14:47:04	2025-10-14 09:31:04
1245	750	2024-12-10 15:39:29	2024-12-10 17:18:29	2024-12-10 15:39:29
1246	792	2025-01-14 06:32:12	2025-01-14 08:42:12	2025-01-14 06:32:12
1247	640	2025-10-18 16:30:10	2025-10-18 22:00:10	2025-10-18 16:30:10
1248	670	2025-05-11 16:15:03	2025-05-11 17:55:03	2025-05-11 16:15:03
1249	283	2025-07-01 14:27:14	2025-07-01 18:15:14	2025-07-01 14:27:14
1250	161	2025-09-30 14:37:05	2025-09-30 20:29:05	2025-09-30 14:37:05
1251	297	2025-09-20 14:25:28	2025-09-20 18:32:28	2025-09-20 14:25:28
1252	292	2025-07-27 14:17:20	2025-07-27 16:31:20	2025-07-27 14:17:20
1253	429	2025-04-05 18:29:44	2025-04-05 19:31:44	2025-04-05 18:29:44
1254	990	2024-11-17 17:32:04	2024-11-17 22:21:04	2024-11-17 17:32:04
1255	68	2025-04-29 17:39:22	2025-04-29 22:28:22	2025-04-29 17:39:22
1256	524	2025-07-20 14:41:14	2025-07-20 18:47:14	2025-07-20 14:41:14
1257	538	2025-07-29 15:38:03	2025-07-29 18:44:03	2025-07-29 15:38:03
1258	113	2025-09-28 05:23:10	2025-09-28 07:24:10	2025-09-28 05:23:10
1259	574	2025-05-16 16:59:06	2025-05-16 20:10:06	2025-05-16 16:59:06
1260	298	2025-06-21 07:51:18	2025-06-21 10:31:18	2025-06-21 07:51:18
1261	195	2025-10-19 14:05:44	2025-10-19 19:13:44	2025-10-19 14:05:44
1262	261	2025-04-15 11:53:38	2025-04-15 16:59:38	2025-04-15 11:53:38
1263	341	2024-12-07 15:12:32	2024-12-07 17:13:32	2024-12-07 15:12:32
1264	831	2025-04-19 16:09:36	2025-04-19 19:42:36	2025-04-19 16:09:36
1265	496	2025-03-04 17:44:12	2025-03-04 19:57:12	2025-03-04 17:44:12
1266	270	2025-09-14 14:49:17	2025-09-14 19:58:17	2025-09-14 14:49:17
1267	944	2025-10-28 15:02:16	2025-10-28 19:24:16	2025-10-28 15:02:16
1268	611	2025-07-05 14:14:32	2025-07-05 17:01:32	2025-07-05 14:14:32
1269	689	2025-03-18 17:20:45	2025-03-18 21:16:45	2025-03-18 17:20:45
1270	485	2025-07-15 15:21:06	2025-07-15 20:00:06	2025-07-15 15:21:06
1271	767	2025-10-18 14:38:29	2025-10-18 16:30:29	2025-10-18 14:38:29
1272	890	2025-01-11 17:49:46	2025-01-11 20:35:46	2025-01-11 17:49:46
1273	429	2025-06-07 15:59:25	2025-06-07 17:44:25	2025-06-07 15:59:25
1274	19	2025-10-14 14:40:51	2025-10-14 18:40:51	2025-10-14 14:40:51
1275	637	2025-05-07 15:08:36	2025-05-07 18:48:36	2025-05-07 15:08:36
1276	8	2025-07-19 17:32:44	2025-07-19 20:45:44	2025-07-19 17:32:44
1277	879	2025-05-06 16:28:36	2025-05-06 18:32:36	2025-05-06 16:28:36
1278	971	2025-08-26 16:16:29	2025-08-26 18:52:29	2025-08-26 16:16:29
1279	663	2025-11-02 22:17:12	2025-11-02 23:28:12	2025-11-02 22:17:12
1280	112	2025-01-05 18:33:37	2025-01-05 20:47:37	2025-01-05 18:33:37
1281	676	2024-11-24 16:06:53	2024-11-24 17:48:53	2024-11-24 16:06:53
1282	453	2025-08-09 18:09:32	2025-08-09 23:56:32	2025-08-09 18:09:32
1283	792	2025-09-14 04:03:45	2025-09-14 07:16:45	2025-09-14 04:03:45
1284	385	2025-03-04 16:18:59	2025-03-04 19:03:59	2025-03-04 16:18:59
1285	891	2025-10-25 14:43:07	2025-10-25 15:57:07	2025-10-25 14:43:07
1286	540	2025-02-16 17:54:12	2025-02-16 21:01:12	2025-02-16 17:54:12
1287	26	2025-05-06 14:19:45	2025-05-06 15:19:45	2025-05-06 14:19:45
1288	918	2025-04-29 06:43:33	2025-04-29 12:42:33	2025-04-29 06:43:33
1289	658	2025-08-23 16:48:28	2025-08-23 19:57:28	2025-08-23 16:48:28
1290	936	2025-02-04 17:58:02	2025-02-04 23:13:02	2025-02-04 17:58:02
1291	108	2025-08-05 14:09:05	2025-08-05 19:33:05	2025-08-05 14:09:05
1292	588	2025-08-12 10:56:25	2025-08-12 14:02:25	2025-08-12 10:56:25
1293	916	2025-01-04 17:29:07	2025-01-04 19:51:07	2025-01-04 17:29:07
1294	910	2024-12-10 19:23:39	2024-12-10 23:45:39	2024-12-10 19:23:39
1295	271	2025-05-10 16:35:12	2025-05-10 21:00:12	2025-05-10 16:35:12
1296	187	2025-07-15 18:54:03	2025-07-15 19:54:03	2025-07-15 18:54:03
1297	291	2025-03-01 15:16:06	2025-03-01 18:40:06	2025-03-01 15:16:06
1298	291	2025-08-05 16:38:44	2025-08-05 20:54:44	2025-08-05 16:38:44
1299	620	2025-04-22 17:17:06	2025-04-22 20:06:06	2025-04-22 17:17:06
1300	140	2025-07-15 16:58:22	2025-07-15 20:08:22	2025-07-15 16:58:22
1301	508	2024-12-07 15:36:25	2024-12-07 19:45:25	2024-12-07 15:36:25
1302	368	2025-02-11 16:49:56	2025-02-11 20:01:56	2025-02-11 16:49:56
1303	411	2024-11-17 15:30:46	2024-11-17 18:43:46	2024-11-17 15:30:46
1304	90	2025-01-25 13:49:17	2025-01-25 17:28:17	2025-01-25 13:49:17
1305	691	2025-05-18 15:23:52	2025-05-18 20:23:52	2025-05-18 15:23:52
1306	78	2025-07-19 22:20:13	2025-07-19 23:32:13	2025-07-19 22:20:13
1307	639	2025-02-04 20:21:39	2025-02-04 22:17:39	2025-02-04 20:21:39
1308	295	2025-08-19 00:25:29	2025-08-19 05:48:29	2025-08-19 00:25:29
1309	508	2025-03-08 03:25:33	2025-03-08 07:32:33	2025-03-08 03:25:33
1310	376	2024-11-17 07:24:12	2024-11-17 08:44:12	2024-11-17 07:24:12
1311	145	2025-04-22 16:22:05	2025-04-22 20:06:05	2025-04-22 16:22:05
1312	570	2025-09-14 16:36:19	2025-09-14 18:54:19	2025-09-14 16:36:19
1313	547	2025-01-28 01:26:40	2025-01-28 05:51:40	2025-01-28 01:26:40
1314	335	2025-06-14 16:28:33	2025-06-14 21:53:33	2025-06-14 16:28:33
1315	26	2024-12-07 15:43:21	2024-12-07 20:52:21	2024-12-07 15:43:21
1316	95	2024-12-01 13:24:31	2024-12-01 15:42:31	2024-12-01 13:24:31
1317	63	2025-02-08 16:04:00	2025-02-08 19:35:00	2025-02-08 16:04:00
1318	265	2025-03-15 19:24:41	2025-03-15 22:42:41	2025-03-15 19:24:41
1319	760	2025-08-17 10:51:09	2025-08-17 11:51:09	2025-08-17 10:51:09
1320	703	2025-02-15 15:07:39	2025-02-15 16:07:39	2025-02-15 15:07:39
1321	997	2025-09-13 14:09:57	2025-09-13 16:37:57	2025-09-13 14:09:57
1322	912	2025-04-20 17:01:23	2025-04-20 22:52:23	2025-04-20 17:01:23
1323	545	2024-12-29 18:02:03	2024-12-29 21:50:03	2024-12-29 18:02:03
1324	508	2025-05-29 14:05:07	2025-05-29 15:59:07	2025-05-29 14:05:07
1325	704	2024-12-14 19:30:32	2024-12-14 21:44:32	2024-12-14 19:30:32
1326	945	2025-09-14 11:14:12	2025-09-14 14:00:12	2025-09-14 11:14:12
1327	192	2024-12-16 16:08:54	2024-12-16 21:26:54	2024-12-16 16:08:54
1328	1000	2025-03-18 15:21:15	2025-03-18 19:30:15	2025-03-18 15:21:15
1329	148	2025-01-12 17:08:56	2025-01-12 21:08:56	2025-01-12 17:08:56
1330	481	2025-03-16 01:44:38	2025-03-16 04:23:38	2025-03-16 01:44:38
1331	60	2025-01-26 15:33:28	2025-01-26 20:48:28	2025-01-26 15:33:28
1332	71	2025-03-21 16:49:47	2025-03-21 20:17:47	2025-03-21 16:49:47
1333	519	2025-01-26 16:44:29	2025-01-26 19:29:29	2025-01-26 16:44:29
1334	499	2025-04-30 15:21:10	2025-04-30 18:31:10	2025-04-30 15:21:10
1335	237	2025-04-13 16:18:53	2025-04-13 22:00:53	2025-04-13 16:18:53
1336	388	2025-09-30 17:43:33	2025-09-30 23:13:33	2025-09-30 17:43:33
1337	584	2025-04-05 05:59:06	2025-04-05 11:34:06	2025-04-05 05:59:06
1338	996	2024-12-12 17:00:24	2024-12-12 18:46:24	2024-12-12 17:00:24
1339	572	2025-06-10 16:27:34	2025-06-10 18:30:34	2025-06-10 16:27:34
1340	582	2024-12-31 17:59:40	2024-12-31 20:33:40	2024-12-31 17:59:40
1341	621	2025-03-14 05:44:24	2025-03-14 08:58:24	2025-03-14 05:44:24
1342	857	2024-12-24 15:52:05	2024-12-24 16:58:05	2024-12-24 15:52:05
1343	104	2025-03-18 14:02:54	2025-03-18 17:42:54	2025-03-18 14:02:54
1344	612	2025-05-12 14:45:25	2025-05-12 16:00:25	2025-05-12 14:45:25
1345	701	2025-06-24 04:43:59	2025-06-24 09:21:59	2025-06-24 04:43:59
1346	344	2025-01-21 16:15:01	2025-01-21 17:15:01	2025-01-21 16:15:01
1347	919	2025-03-23 15:35:20	2025-03-23 21:08:20	2025-03-23 15:35:20
1348	209	2025-09-09 17:34:10	2025-09-09 19:01:10	2025-09-09 17:34:10
1349	27	2025-04-29 14:07:33	2025-04-29 15:23:33	2025-04-29 14:07:33
1350	561	2025-08-17 18:06:27	2025-08-17 22:35:27	2025-08-17 18:06:27
1351	561	2025-09-23 10:05:14	2025-09-23 13:13:14	2025-09-23 10:05:14
1352	716	2025-07-15 15:36:30	2025-07-15 20:29:30	2025-07-15 15:36:30
1353	179	2025-06-10 18:38:57	2025-06-10 22:21:57	2025-06-10 18:38:57
1354	40	2025-10-14 16:58:48	2025-10-14 22:44:48	2025-10-14 16:58:48
1355	34	2025-02-01 17:53:07	2025-02-01 22:11:07	2025-02-01 17:53:07
1356	520	2025-01-28 16:41:05	2025-01-28 21:48:05	2025-01-28 16:41:05
1357	284	2024-11-16 15:14:56	2024-11-16 21:03:56	2024-11-16 15:14:56
1358	835	2025-03-11 16:02:24	2025-03-11 19:42:24	2025-03-11 16:02:24
1359	862	2025-05-18 18:53:04	2025-05-18 23:41:04	2025-05-18 18:53:04
1360	191	2025-02-28 16:44:09	2025-02-28 22:27:09	2025-02-28 16:44:09
1361	236	2025-05-11 14:30:40	2025-05-11 18:41:40	2025-05-11 14:30:40
1362	120	2025-07-27 13:21:44	2025-07-27 18:15:44	2025-07-27 13:21:44
1363	124	2025-06-07 13:07:50	2025-06-07 15:04:50	2025-06-07 13:07:50
1364	847	2024-11-26 15:11:45	2024-11-26 19:07:45	2024-11-26 15:11:45
1365	554	2025-08-26 14:43:22	2025-08-26 15:51:22	2025-08-26 14:43:22
1366	623	2025-08-09 05:46:23	2025-08-09 09:01:23	2025-08-09 05:46:23
1367	333	2025-01-12 16:51:18	2025-01-12 19:56:18	2025-01-12 16:51:18
1368	811	2025-08-12 17:48:52	2025-08-12 18:59:52	2025-08-12 17:48:52
1369	246	2024-11-26 15:51:19	2024-11-26 17:21:19	2024-11-26 15:51:19
1370	469	2025-11-01 16:40:56	2025-11-01 21:19:56	2025-11-01 16:40:56
1371	797	2025-09-09 15:20:27	2025-09-09 19:33:27	2025-09-09 15:20:27
1372	861	2025-01-10 16:21:11	2025-01-10 17:24:11	2025-01-10 16:21:11
1373	613	2025-02-18 13:52:51	2025-02-18 18:31:51	2025-02-18 13:52:51
1374	938	2025-07-27 16:00:18	2025-07-27 20:57:18	2025-07-27 16:00:18
1375	51	2025-08-03 13:33:54	2025-08-03 14:48:54	2025-08-03 13:33:54
1376	1000	2025-06-08 17:14:52	2025-06-08 19:01:52	2025-06-08 17:14:52
1377	44	2025-01-04 04:09:17	2025-01-04 06:02:17	2025-01-04 04:09:17
1378	105	2025-03-02 16:57:16	2025-03-02 22:22:16	2025-03-02 16:57:16
1379	106	2025-05-20 08:13:31	2025-05-20 12:00:31	2025-05-20 08:13:31
1380	70	2024-11-12 16:17:56	2024-11-12 18:03:56	2024-11-12 16:17:56
1381	301	2025-03-30 10:34:12	2025-03-30 15:37:12	2025-03-30 10:34:12
1382	810	2025-09-02 15:39:46	2025-09-02 17:37:46	2025-09-02 15:39:46
1383	35	2025-09-14 16:23:16	2025-09-14 18:40:16	2025-09-14 16:23:16
1384	473	2024-12-28 14:30:52	2024-12-28 16:40:52	2024-12-28 14:30:52
1385	930	2025-06-14 15:10:31	2025-06-14 17:09:31	2025-06-14 15:10:31
1386	138	2025-06-07 17:33:58	2025-06-07 19:36:58	2025-06-07 17:33:58
1387	38	2024-12-24 15:58:14	2024-12-24 21:51:14	2024-12-24 15:58:14
1388	963	2025-08-24 15:25:55	2025-08-24 20:16:55	2025-08-24 15:25:55
1389	412	2025-02-18 15:18:42	2025-02-18 16:19:42	2025-02-18 15:18:42
1390	767	2025-01-26 17:38:52	2025-01-26 20:41:52	2025-01-26 17:38:52
1391	234	2025-06-10 15:03:04	2025-06-10 20:31:04	2025-06-10 15:03:04
1392	691	2025-07-13 15:40:00	2025-07-13 20:04:00	2025-07-13 15:40:00
1393	788	2025-07-13 06:18:16	2025-07-13 12:09:16	2025-07-13 06:18:16
1394	177	2025-09-19 16:22:40	2025-09-19 20:43:40	2025-09-19 16:22:40
1395	787	2025-02-25 17:55:26	2025-02-25 22:10:26	2025-02-25 17:55:26
1396	833	2024-11-19 16:12:56	2024-11-19 20:21:56	2024-11-19 16:12:56
1397	131	2025-07-27 15:45:12	2025-07-27 18:38:12	2025-07-27 15:45:12
1398	955	2025-05-04 15:55:15	2025-05-04 21:30:15	2025-05-04 15:55:15
1399	536	2025-08-12 17:11:41	2025-08-12 18:21:41	2025-08-12 17:11:41
1400	946	2024-12-07 17:32:17	2024-12-07 21:50:17	2024-12-07 17:32:17
1401	362	2025-07-01 14:56:42	2025-07-01 17:22:42	2025-07-01 14:56:42
1402	513	2025-04-29 17:46:24	2025-04-29 18:58:24	2025-04-29 17:46:24
1403	449	2024-12-24 16:58:30	2024-12-24 20:15:30	2024-12-24 16:58:30
1404	5	2025-10-14 15:58:06	2025-10-14 20:18:06	2025-10-14 15:58:06
1405	998	2025-09-14 18:50:01	2025-09-14 21:14:01	2025-09-14 18:50:01
1406	957	2025-02-04 15:47:12	2025-02-04 18:43:12	2025-02-04 15:47:12
1407	255	2024-12-10 15:36:06	2024-12-10 17:06:06	2024-12-10 15:36:06
1408	92	2025-06-29 15:38:13	2025-06-29 18:02:13	2025-06-29 15:38:13
1409	911	2025-08-12 14:41:32	2025-08-12 19:14:32	2025-08-12 14:41:32
1410	496	2025-05-06 15:07:45	2025-05-06 20:21:45	2025-05-06 15:07:45
1411	703	2025-02-04 09:10:28	2025-02-04 13:00:28	2025-02-04 09:10:28
1412	623	2024-11-23 06:06:34	2024-11-23 10:00:34	2024-11-23 06:06:34
1413	546	2025-09-24 14:17:32	2025-09-24 16:36:32	2025-09-24 14:17:32
1414	979	2025-01-18 16:52:29	2025-01-18 18:03:29	2025-01-18 16:52:29
1415	666	2025-04-26 07:01:24	2025-04-26 09:17:24	2025-04-26 07:01:24
1416	730	2025-07-19 16:22:22	2025-07-19 19:53:22	2025-07-19 16:22:22
1417	311	2025-08-26 14:13:48	2025-08-26 19:58:48	2025-08-26 14:13:48
1418	987	2025-07-21 09:17:38	2025-07-21 11:58:38	2025-07-21 09:17:38
1419	225	2025-09-30 07:01:27	2025-09-30 10:27:27	2025-09-30 07:01:27
1420	914	2024-11-24 15:03:48	2024-11-24 18:18:48	2024-11-24 15:03:48
1421	258	2024-11-12 17:05:49	2024-11-12 21:07:49	2024-11-12 17:05:49
1422	525	2025-02-04 17:34:28	2025-02-04 23:09:28	2025-02-04 17:34:28
1423	788	2025-07-22 14:30:29	2025-07-22 18:13:29	2025-07-22 14:30:29
1424	825	2024-12-31 19:48:50	2024-12-31 22:28:50	2024-12-31 19:48:50
1425	73	2025-09-18 15:11:27	2025-09-18 18:14:27	2025-09-18 15:11:27
1426	529	2025-05-17 16:38:35	2025-05-17 18:07:35	2025-05-17 16:38:35
1427	526	2024-11-24 10:54:20	2024-11-24 14:54:20	2024-11-24 10:54:20
1428	909	2025-06-21 13:32:43	2025-06-21 15:51:43	2025-06-21 13:32:43
1429	470	2025-05-03 15:18:21	2025-05-03 19:39:21	2025-05-03 15:18:21
1430	522	2025-05-17 16:50:21	2025-05-17 22:41:21	2025-05-17 16:50:21
1431	939	2025-08-10 18:54:03	2025-08-10 19:59:03	2025-08-10 18:54:03
1432	96	2025-04-15 04:47:09	2025-04-15 09:10:09	2025-04-15 04:47:09
1433	141	2025-07-26 14:30:01	2025-07-26 15:51:01	2025-07-26 14:30:01
1434	162	2025-08-12 16:24:09	2025-08-12 21:18:09	2025-08-12 16:24:09
1435	965	2025-03-16 08:50:47	2025-03-16 12:06:47	2025-03-16 08:50:47
1436	22	2025-05-31 05:23:15	2025-05-31 10:12:15	2025-05-31 05:23:15
1437	479	2024-11-19 17:13:01	2024-11-19 21:07:01	2024-11-19 17:13:01
1438	440	2025-04-15 14:38:07	2025-04-15 17:54:07	2025-04-15 14:38:07
1439	773	2024-11-24 16:34:44	2024-11-24 18:24:44	2024-11-24 16:34:44
1440	748	2025-06-03 17:02:05	2025-06-03 18:03:05	2025-06-03 17:02:05
1441	12	2024-11-19 16:59:25	2024-11-19 20:41:25	2024-11-19 16:59:25
1442	551	2025-07-22 14:28:18	2025-07-22 20:20:18	2025-07-22 14:28:18
1443	265	2025-10-28 17:47:10	2025-10-28 23:19:10	2025-10-28 17:47:10
1444	944	2025-08-26 17:21:33	2025-08-26 22:22:33	2025-08-26 17:21:33
1445	802	2024-12-07 13:24:04	2024-12-07 18:40:04	2024-12-07 13:24:04
1446	246	2025-05-06 15:24:20	2025-05-06 19:22:20	2025-05-06 15:24:20
1447	368	2025-06-15 17:13:43	2025-06-15 22:42:43	2025-06-15 17:13:43
1448	697	2025-02-04 13:15:07	2025-02-04 14:26:07	2025-02-04 13:15:07
1449	899	2025-08-24 05:49:06	2025-08-24 09:44:06	2025-08-24 05:49:06
1450	929	2025-11-04 15:32:56	2025-11-04 20:55:56	2025-11-04 15:32:56
1451	131	2025-02-22 12:59:38	2025-02-22 14:50:38	2025-02-22 12:59:38
1452	65	2025-04-26 14:10:32	2025-04-26 16:11:32	2025-04-26 14:10:32
1453	893	2025-06-21 14:15:26	2025-06-21 16:29:26	2025-06-21 14:15:26
1454	679	2024-11-26 17:25:23	2024-11-26 21:45:23	2024-11-26 17:25:23
1455	409	2025-09-30 07:45:30	2025-09-30 10:58:30	2025-09-30 07:45:30
1456	144	2025-07-08 17:31:51	2025-07-08 19:35:51	2025-07-08 17:31:51
1457	981	2025-02-25 07:17:31	2025-02-25 10:27:31	2025-02-25 07:17:31
1458	786	2025-01-05 15:42:54	2025-01-05 19:42:54	2025-01-05 15:42:54
1459	870	2025-10-31 15:54:27	2025-10-31 19:40:27	2025-10-31 15:54:27
1460	596	2025-05-04 15:34:18	2025-05-04 19:17:18	2025-05-04 15:34:18
1461	920	2025-01-07 09:50:29	2025-01-07 15:35:29	2025-01-07 09:50:29
1462	337	2025-08-30 14:13:09	2025-08-30 19:29:09	2025-08-30 14:13:09
1463	564	2024-12-10 18:12:10	2024-12-10 22:39:10	2024-12-10 18:12:10
1464	139	2025-09-02 14:46:44	2025-09-02 19:07:44	2025-09-02 14:46:44
1465	27	2025-09-28 11:11:56	2025-09-28 14:19:56	2025-09-28 11:11:56
1466	998	2024-12-31 18:49:39	2024-12-31 22:04:39	2024-12-31 18:49:39
1467	573	2025-08-17 16:57:58	2025-08-17 20:01:58	2025-08-17 16:57:58
1468	356	2024-12-08 08:42:03	2024-12-08 10:15:03	2024-12-08 08:42:03
1469	106	2024-12-01 15:26:13	2024-12-01 18:16:13	2024-12-01 15:26:13
1470	244	2025-02-04 17:30:47	2025-02-04 22:49:47	2025-02-04 17:30:47
1471	33	2025-01-13 15:02:40	2025-01-13 18:31:40	2025-01-13 15:02:40
1472	701	2025-03-25 16:09:41	2025-03-25 18:32:41	2025-03-25 16:09:41
1473	621	2025-01-01 15:07:46	2025-01-01 20:50:46	2025-01-01 15:07:46
1474	37	2025-01-07 17:45:08	2025-01-07 19:58:08	2025-01-07 17:45:08
1475	796	2025-08-03 17:03:18	2025-08-03 20:05:18	2025-08-03 17:03:18
1476	895	2025-01-04 03:49:18	2025-01-04 09:03:18	2025-01-04 03:49:18
1477	824	2025-01-18 17:00:24	2025-01-18 18:58:24	2025-01-18 17:00:24
1478	437	2025-02-18 19:23:53	2025-02-19 01:21:53	2025-02-18 19:23:53
1479	92	2024-12-10 17:20:18	2024-12-10 21:19:18	2024-12-10 17:20:18
1480	810	2025-06-10 06:26:06	2025-06-10 07:53:06	2025-06-10 06:26:06
1481	741	2025-04-27 15:15:24	2025-04-27 19:48:24	2025-04-27 15:15:24
1482	792	2025-07-05 14:01:59	2025-07-05 17:52:59	2025-07-05 14:01:59
1483	539	2025-02-02 16:22:08	2025-02-02 19:35:08	2025-02-02 16:22:08
1484	25	2025-07-13 15:33:27	2025-07-13 17:42:27	2025-07-13 15:33:27
1485	425	2025-05-13 15:31:35	2025-05-13 20:08:35	2025-05-13 15:31:35
1486	190	2024-11-30 15:19:31	2024-11-30 20:20:31	2024-11-30 15:19:31
1487	361	2025-10-07 14:07:40	2025-10-07 15:56:40	2025-10-07 14:07:40
1488	933	2025-06-01 18:02:40	2025-06-01 20:05:40	2025-06-01 18:02:40
1489	685	2025-09-06 16:31:55	2025-09-06 21:13:55	2025-09-06 16:31:55
1490	976	2025-02-11 17:14:59	2025-02-11 22:34:59	2025-02-11 17:14:59
1491	592	2025-02-04 17:07:49	2025-02-04 22:38:49	2025-02-04 17:07:49
1492	229	2025-01-07 15:31:48	2025-01-07 20:13:48	2025-01-07 15:31:48
1493	878	2025-04-19 16:05:47	2025-04-19 20:54:47	2025-04-19 16:05:47
1494	529	2025-05-31 14:08:28	2025-05-31 17:07:28	2025-05-31 14:08:28
1495	363	2025-11-04 16:34:40	2025-11-04 22:25:40	2025-11-04 16:34:40
1496	442	2025-06-14 15:57:09	2025-06-14 21:31:09	2025-06-14 15:57:09
1497	247	2024-11-24 19:57:49	2024-11-24 22:33:49	2024-11-24 19:57:49
1498	319	2024-12-17 18:03:24	2024-12-17 23:08:24	2024-12-17 18:03:24
1499	144	2024-12-07 17:45:03	2024-12-07 22:55:03	2024-12-07 17:45:03
1500	525	2025-07-22 13:50:30	2025-07-22 17:31:30	2025-07-22 13:50:30
1501	643	2025-07-01 14:36:24	2025-07-01 19:17:24	2025-07-01 14:36:24
1502	441	2024-12-31 19:37:35	2025-01-01 00:10:35	2024-12-31 19:37:35
1503	299	2025-01-25 17:55:55	2025-01-25 20:21:55	2025-01-25 17:55:55
1504	547	2025-10-04 15:54:15	2025-10-04 20:04:15	2025-10-04 15:54:15
1505	340	2025-02-23 17:44:16	2025-02-23 23:15:16	2025-02-23 17:44:16
1506	159	2025-08-05 19:14:36	2025-08-05 22:15:36	2025-08-05 19:14:36
1507	469	2025-04-26 16:58:36	2025-04-26 18:53:36	2025-04-26 16:58:36
1508	524	2025-03-23 17:36:42	2025-03-23 19:24:42	2025-03-23 17:36:42
1509	439	2025-05-10 15:12:13	2025-05-10 17:33:13	2025-05-10 15:12:13
1510	19	2025-04-22 14:10:05	2025-04-22 19:37:05	2025-04-22 14:10:05
1511	898	2025-02-25 17:45:16	2025-02-25 21:06:16	2025-02-25 17:45:16
1512	705	2025-04-12 20:01:32	2025-04-12 21:53:32	2025-04-12 20:01:32
1513	495	2024-12-07 15:58:12	2024-12-07 18:51:12	2024-12-07 15:58:12
1514	318	2025-01-12 16:53:21	2025-01-12 22:33:21	2025-01-12 16:53:21
1515	53	2025-09-09 10:21:24	2025-09-09 11:44:24	2025-09-09 10:21:24
1516	51	2025-08-16 07:18:08	2025-08-16 10:51:08	2025-08-16 07:18:08
1517	239	2025-02-15 16:41:55	2025-02-15 22:22:55	2025-02-15 16:41:55
1518	601	2025-05-11 18:29:10	2025-05-11 22:32:10	2025-05-11 18:29:10
1519	67	2025-02-26 19:07:45	2025-02-26 20:09:45	2025-02-26 19:07:45
1520	75	2024-11-10 15:39:13	2024-11-10 21:36:13	2024-11-10 15:39:13
1521	389	2024-12-17 17:44:08	2024-12-17 19:52:08	2024-12-17 17:44:08
1522	846	2025-09-23 16:22:43	2025-09-23 21:26:43	2025-09-23 16:22:43
1523	682	2025-06-18 18:59:30	2025-06-18 21:03:30	2025-06-18 18:59:30
1524	34	2025-06-07 08:42:06	2025-06-07 14:00:06	2025-06-07 08:42:06
1525	825	2025-06-28 20:20:17	2025-06-28 23:43:17	2025-06-28 20:20:17
1526	235	2025-01-18 19:27:09	2025-01-18 22:03:09	2025-01-18 19:27:09
1527	69	2025-06-24 07:32:45	2025-06-24 10:41:45	2025-06-24 07:32:45
1528	350	2025-01-19 16:58:51	2025-01-19 20:56:51	2025-01-19 16:58:51
1529	777	2025-03-18 08:42:51	2025-03-18 12:04:51	2025-03-18 08:42:51
1530	106	2025-11-01 16:31:05	2025-11-01 18:18:05	2025-11-01 16:31:05
1531	794	2025-06-24 14:14:13	2025-06-24 16:52:13	2025-06-24 14:14:13
1532	443	2025-07-22 17:44:16	2025-07-22 20:20:16	2025-07-22 17:44:16
1533	252	2025-07-13 08:00:20	2025-07-13 13:01:20	2025-07-13 08:00:20
1534	617	2025-05-10 15:35:27	2025-05-10 17:52:27	2025-05-10 15:35:27
1535	909	2025-05-03 16:52:22	2025-05-03 20:13:22	2025-05-03 16:52:22
1536	643	2025-03-09 18:47:23	2025-03-10 00:04:23	2025-03-09 18:47:23
1537	569	2025-04-22 14:10:32	2025-04-22 16:25:32	2025-04-22 14:10:32
1538	181	2025-05-24 16:16:12	2025-05-24 18:00:12	2025-05-24 16:16:12
1539	420	2025-10-28 16:28:38	2025-10-28 21:06:38	2025-10-28 16:28:38
1540	227	2025-08-12 16:34:03	2025-08-12 21:13:03	2025-08-12 16:34:03
1541	381	2025-06-03 17:15:26	2025-06-03 21:27:26	2025-06-03 17:15:26
1542	832	2025-09-16 16:31:24	2025-09-16 21:08:24	2025-09-16 16:31:24
1543	727	2025-09-28 14:53:22	2025-09-28 18:35:22	2025-09-28 14:53:22
1544	537	2025-06-08 16:52:25	2025-06-08 22:16:25	2025-06-08 16:52:25
1545	305	2025-02-25 19:24:24	2025-02-25 21:37:24	2025-02-25 19:24:24
1546	353	2025-06-24 12:59:52	2025-06-24 18:51:52	2025-06-24 12:59:52
1547	307	2025-03-18 08:47:28	2025-03-18 11:18:28	2025-03-18 08:47:28
1548	857	2025-10-28 15:09:51	2025-10-28 20:24:51	2025-10-28 15:09:51
1549	240	2025-04-05 14:07:27	2025-04-05 17:39:27	2025-04-05 14:07:27
1550	613	2025-02-04 17:09:33	2025-02-04 20:11:33	2025-02-04 17:09:33
1551	23	2025-07-01 15:45:52	2025-07-01 16:58:52	2025-07-01 15:45:52
1552	951	2025-07-05 16:55:21	2025-07-05 21:39:21	2025-07-05 16:55:21
1553	326	2025-06-24 14:28:07	2025-06-24 15:46:07	2025-06-24 14:28:07
1554	665	2025-04-08 07:31:05	2025-04-08 13:10:05	2025-04-08 07:31:05
1555	790	2025-10-14 16:02:16	2025-10-14 19:47:16	2025-10-14 16:02:16
1556	789	2024-12-24 15:29:45	2024-12-24 21:03:45	2024-12-24 15:29:45
1557	17	2025-02-25 15:07:54	2025-02-25 18:52:54	2025-02-25 15:07:54
1558	202	2024-12-14 17:43:59	2024-12-14 22:22:59	2024-12-14 17:43:59
1559	943	2024-12-29 15:06:07	2024-12-29 16:47:07	2024-12-29 15:06:07
1560	58	2025-04-19 15:29:50	2025-04-19 17:01:50	2025-04-19 15:29:50
1561	932	2025-04-21 22:21:22	2025-04-22 00:30:22	2025-04-21 22:21:22
1562	267	2025-03-25 16:22:05	2025-03-25 21:28:05	2025-03-25 16:22:05
1563	320	2024-11-23 17:37:46	2024-11-23 18:51:46	2024-11-23 17:37:46
1564	583	2025-10-26 16:43:36	2025-10-26 21:18:36	2025-10-26 16:43:36
1565	277	2025-04-05 15:45:57	2025-04-05 18:32:57	2025-04-05 15:45:57
1566	171	2025-09-09 16:57:21	2025-09-09 18:02:21	2025-09-09 16:57:21
1567	104	2025-11-01 21:17:11	2025-11-02 00:08:11	2025-11-01 21:17:11
1568	539	2025-11-01 15:37:08	2025-11-01 19:19:08	2025-11-01 15:37:08
1569	154	2025-05-13 16:42:07	2025-05-13 19:10:07	2025-05-13 16:42:07
1570	592	2025-10-21 16:40:30	2025-10-21 21:13:30	2025-10-21 16:40:30
1571	681	2024-12-22 15:51:30	2024-12-22 21:22:30	2024-12-22 15:51:30
1572	380	2025-05-24 16:07:57	2025-05-24 22:04:57	2025-05-24 16:07:57
1573	408	2025-06-21 07:27:09	2025-06-21 10:46:09	2025-06-21 07:27:09
1574	96	2025-07-13 06:16:47	2025-07-13 11:18:47	2025-07-13 06:16:47
1575	876	2025-08-02 14:34:23	2025-08-02 18:51:23	2025-08-02 14:34:23
1576	578	2025-05-13 15:29:26	2025-05-13 19:55:26	2025-05-13 15:29:26
1577	264	2025-01-21 15:29:51	2025-01-21 20:09:51	2025-01-21 15:29:51
1578	792	2024-11-26 17:32:44	2024-11-26 19:42:44	2024-11-26 17:32:44
1579	293	2024-12-03 18:39:33	2024-12-03 20:04:33	2024-12-03 18:39:33
1580	113	2025-01-25 08:28:06	2025-01-25 13:58:06	2025-01-25 08:28:06
1581	12	2025-07-05 15:17:40	2025-07-05 19:32:40	2025-07-05 15:17:40
1582	965	2024-11-23 19:21:01	2024-11-23 23:38:01	2024-11-23 19:21:01
1583	960	2025-03-25 10:59:06	2025-03-25 14:12:06	2025-03-25 10:59:06
1584	546	2025-04-19 23:25:58	2025-04-20 03:45:58	2025-04-19 23:25:58
1585	111	2025-05-06 02:19:05	2025-05-06 07:21:05	2025-05-06 02:19:05
1586	500	2025-02-15 08:09:09	2025-02-15 09:49:09	2025-02-15 08:09:09
1587	917	2025-03-22 15:07:44	2025-03-22 19:51:44	2025-03-22 15:07:44
1588	428	2025-10-12 14:42:00	2025-10-12 20:16:00	2025-10-12 14:42:00
1589	356	2024-11-12 16:53:38	2024-11-12 19:14:38	2024-11-12 16:53:38
1590	652	2025-07-13 15:31:46	2025-07-13 20:33:46	2025-07-13 15:31:46
1591	761	2025-09-16 14:26:22	2025-09-16 16:16:22	2025-09-16 14:26:22
1592	760	2025-01-18 09:30:44	2025-01-18 14:14:44	2025-01-18 09:30:44
1593	539	2025-04-08 16:19:39	2025-04-08 22:08:39	2025-04-08 16:19:39
1594	939	2025-06-07 15:34:23	2025-06-07 18:47:23	2025-06-07 15:34:23
1595	480	2025-04-12 14:15:41	2025-04-12 16:27:41	2025-04-12 14:15:41
1596	163	2025-04-29 15:52:19	2025-04-29 17:52:19	2025-04-29 15:52:19
1597	150	2025-04-08 15:42:05	2025-04-08 18:55:05	2025-04-08 15:42:05
1598	211	2025-05-31 17:31:32	2025-05-31 23:07:32	2025-05-31 17:31:32
1599	970	2025-05-10 05:45:19	2025-05-10 07:44:19	2025-05-10 05:45:19
1600	379	2025-04-30 16:01:32	2025-04-30 19:54:32	2025-04-30 16:01:32
1601	687	2025-10-04 16:34:57	2025-10-04 18:05:57	2025-10-04 16:34:57
1602	812	2025-06-28 16:45:42	2025-06-28 18:05:42	2025-06-28 16:45:42
1603	200	2025-05-06 16:33:10	2025-05-06 17:48:10	2025-05-06 16:33:10
1604	224	2024-11-24 16:36:49	2024-11-24 19:39:49	2024-11-24 16:36:49
1605	767	2025-07-29 17:50:07	2025-07-29 22:24:07	2025-07-29 17:50:07
1606	211	2025-01-25 12:23:54	2025-01-25 14:38:54	2025-01-25 12:23:54
1607	146	2024-11-26 15:42:51	2024-11-26 19:58:51	2024-11-26 15:42:51
1608	446	2025-07-27 16:44:06	2025-07-27 17:58:06	2025-07-27 16:44:06
1609	541	2025-09-23 10:44:48	2025-09-23 14:05:48	2025-09-23 10:44:48
1610	952	2025-02-18 15:36:19	2025-02-18 17:11:19	2025-02-18 15:36:19
1611	423	2025-02-25 17:10:00	2025-02-25 23:05:00	2025-02-25 17:10:00
1612	577	2025-01-18 18:00:54	2025-01-18 23:17:54	2025-01-18 18:00:54
1613	85	2025-05-09 15:15:51	2025-05-09 18:54:51	2025-05-09 15:15:51
1614	476	2024-11-18 16:47:26	2024-11-18 19:13:26	2024-11-18 16:47:26
1615	451	2025-01-25 15:07:26	2025-01-25 21:04:26	2025-01-25 15:07:26
1616	317	2025-06-08 10:40:49	2025-06-08 14:32:49	2025-06-08 10:40:49
1617	343	2025-01-24 06:43:31	2025-01-24 09:39:31	2025-01-24 06:43:31
1618	13	2025-07-19 13:35:35	2025-07-19 15:33:35	2025-07-19 13:35:35
1619	675	2025-07-29 14:23:19	2025-07-29 19:19:19	2025-07-29 14:23:19
1620	66	2025-06-14 18:22:57	2025-06-14 22:36:57	2025-06-14 18:22:57
1621	908	2025-04-02 14:27:40	2025-04-02 16:37:40	2025-04-02 14:27:40
1622	842	2024-12-25 17:59:33	2024-12-25 23:46:33	2024-12-25 17:59:33
1623	800	2025-05-20 16:43:22	2025-05-20 18:15:22	2025-05-20 16:43:22
1624	843	2025-03-01 00:21:46	2025-03-01 06:14:46	2025-03-01 00:21:46
1625	294	2025-07-06 14:18:07	2025-07-06 19:24:07	2025-07-06 14:18:07
1626	609	2024-12-15 17:09:46	2024-12-15 18:58:46	2024-12-15 17:09:46
1627	704	2024-12-21 17:52:29	2024-12-21 21:51:29	2024-12-21 17:52:29
1628	946	2025-05-03 13:30:06	2025-05-03 19:05:06	2025-05-03 13:30:06
1629	818	2025-04-08 14:30:03	2025-04-08 19:22:03	2025-04-08 14:30:03
1630	271	2025-01-28 03:05:27	2025-01-28 07:20:27	2025-01-28 03:05:27
1631	745	2025-05-21 18:33:47	2025-05-21 23:53:47	2025-05-21 18:33:47
1632	363	2025-03-25 16:00:42	2025-03-25 21:35:42	2025-03-25 16:00:42
1633	965	2025-06-17 14:28:45	2025-06-17 20:07:45	2025-06-17 14:28:45
1634	879	2025-10-05 14:19:10	2025-10-05 16:48:10	2025-10-05 14:19:10
1635	950	2025-07-27 16:11:56	2025-07-27 20:44:56	2025-07-27 16:11:56
1636	440	2025-06-14 06:26:24	2025-06-14 08:12:24	2025-06-14 06:26:24
1637	196	2024-11-30 19:13:14	2024-12-01 00:09:14	2024-11-30 19:13:14
1638	431	2025-08-02 16:43:11	2025-08-02 20:18:11	2025-08-02 16:43:11
1639	378	2025-01-04 17:59:16	2025-01-04 22:10:16	2025-01-04 17:59:16
1640	404	2025-05-24 04:06:18	2025-05-24 07:37:18	2025-05-24 04:06:18
1641	713	2025-09-03 17:47:38	2025-09-03 21:57:38	2025-09-03 17:47:38
1642	525	2024-12-17 17:10:23	2024-12-17 22:38:23	2024-12-17 17:10:23
1643	720	2025-04-29 15:34:44	2025-04-29 18:07:44	2025-04-29 15:34:44
1644	504	2025-08-31 14:27:47	2025-08-31 15:53:47	2025-08-31 14:27:47
1645	987	2025-04-08 14:29:08	2025-04-08 18:04:08	2025-04-08 14:29:08
1646	910	2025-02-18 16:53:46	2025-02-18 19:02:46	2025-02-18 16:53:46
1647	784	2025-07-22 14:41:52	2025-07-22 16:17:52	2025-07-22 14:41:52
1648	793	2025-07-12 16:35:19	2025-07-12 19:46:19	2025-07-12 16:35:19
1649	917	2024-11-24 18:06:41	2024-11-24 22:17:41	2024-11-24 18:06:41
1650	862	2025-10-26 19:39:38	2025-10-26 21:09:38	2025-10-26 19:39:38
1651	519	2025-03-11 17:46:45	2025-03-11 22:45:45	2025-03-11 17:46:45
1652	846	2025-06-15 04:32:33	2025-06-15 05:44:33	2025-06-15 04:32:33
1653	817	2025-08-12 15:52:33	2025-08-12 20:01:33	2025-08-12 15:52:33
1654	321	2025-02-25 17:07:00	2025-02-25 20:15:00	2025-02-25 17:07:00
1655	399	2025-04-29 17:50:00	2025-04-29 21:53:00	2025-04-29 17:50:00
1656	236	2024-12-22 15:55:44	2024-12-22 17:21:44	2024-12-22 15:55:44
1657	201	2025-08-17 06:19:11	2025-08-17 12:00:11	2025-08-17 06:19:11
1658	318	2025-07-13 18:40:11	2025-07-13 20:02:11	2025-07-13 18:40:11
1659	495	2025-09-13 09:54:22	2025-09-13 12:28:22	2025-09-13 09:54:22
1660	640	2025-09-14 16:25:47	2025-09-14 21:41:47	2025-09-14 16:25:47
1661	260	2025-01-04 11:27:11	2025-01-04 16:42:11	2025-01-04 11:27:11
1662	883	2025-06-17 15:23:40	2025-06-17 17:13:40	2025-06-17 15:23:40
1663	755	2024-11-19 17:54:57	2024-11-19 21:35:57	2024-11-19 17:54:57
1664	217	2025-08-26 15:44:32	2025-08-26 17:05:32	2025-08-26 15:44:32
1665	512	2024-11-19 18:24:19	2024-11-19 20:55:19	2024-11-19 18:24:19
1666	995	2024-12-31 15:24:51	2024-12-31 19:00:51	2024-12-31 15:24:51
1667	962	2025-05-31 16:48:01	2025-05-31 20:29:01	2025-05-31 16:48:01
1668	841	2024-12-29 17:07:30	2024-12-29 18:47:30	2024-12-29 17:07:30
1669	873	2025-02-11 17:03:19	2025-02-11 21:26:19	2025-02-11 17:03:19
1670	945	2024-12-16 21:41:05	2024-12-17 00:08:05	2024-12-16 21:41:05
1671	838	2025-09-06 16:39:16	2025-09-06 18:08:16	2025-09-06 16:39:16
1672	624	2025-05-21 17:34:11	2025-05-21 20:29:11	2025-05-21 17:34:11
1673	185	2025-03-02 15:06:18	2025-03-02 17:31:18	2025-03-02 15:06:18
1674	953	2025-06-17 17:50:49	2025-06-17 23:34:49	2025-06-17 17:50:49
1675	192	2025-03-17 15:49:35	2025-03-17 19:51:35	2025-03-17 15:49:35
1676	17	2025-09-16 10:00:09	2025-09-16 14:45:09	2025-09-16 10:00:09
1677	878	2025-06-15 21:36:17	2025-06-16 00:18:17	2025-06-15 21:36:17
1678	694	2025-09-14 15:51:57	2025-09-14 18:58:57	2025-09-14 15:51:57
1679	199	2025-01-26 16:52:14	2025-01-26 21:03:14	2025-01-26 16:52:14
1680	925	2025-04-12 15:18:27	2025-04-12 20:37:27	2025-04-12 15:18:27
1681	470	2025-01-07 19:11:19	2025-01-08 00:47:19	2025-01-07 19:11:19
1682	703	2024-11-17 14:20:44	2024-11-17 15:24:44	2024-11-17 14:20:44
1683	400	2025-04-15 14:18:53	2025-04-15 19:32:53	2025-04-15 14:18:53
1684	667	2025-01-07 16:02:39	2025-01-07 18:19:39	2025-01-07 16:02:39
1685	529	2025-09-06 17:18:34	2025-09-06 22:18:34	2025-09-06 17:18:34
1686	40	2025-07-13 16:08:29	2025-07-13 20:45:29	2025-07-13 16:08:29
1687	311	2025-02-15 15:27:45	2025-02-15 20:30:45	2025-02-15 15:27:45
1688	858	2025-08-31 11:55:51	2025-08-31 17:41:51	2025-08-31 11:55:51
1689	265	2025-06-01 16:02:17	2025-06-01 17:57:17	2025-06-01 16:02:17
1690	154	2025-02-11 17:56:53	2025-02-11 20:31:53	2025-02-11 17:56:53
1691	886	2025-10-11 14:48:36	2025-10-11 17:45:36	2025-10-11 14:48:36
1692	750	2025-02-11 16:09:41	2025-02-11 21:00:41	2025-02-11 16:09:41
1693	414	2025-03-04 16:22:37	2025-03-04 20:20:37	2025-03-04 16:22:37
1694	615	2025-04-15 15:42:51	2025-04-15 17:18:51	2025-04-15 15:42:51
1695	473	2025-06-07 17:19:18	2025-06-07 21:29:18	2025-06-07 17:19:18
1696	254	2025-08-05 15:27:19	2025-08-05 21:00:19	2025-08-05 15:27:19
1697	30	2025-08-02 15:51:06	2025-08-02 20:35:06	2025-08-02 15:51:06
1698	573	2024-11-16 21:09:47	2024-11-17 01:09:47	2024-11-16 21:09:47
1699	52	2025-07-06 16:26:54	2025-07-06 21:58:54	2025-07-06 16:26:54
1700	84	2025-03-09 15:37:00	2025-03-09 18:04:00	2025-03-09 15:37:00
1701	678	2025-08-06 20:50:36	2025-08-06 23:11:36	2025-08-06 20:50:36
1702	104	2025-04-05 18:43:00	2025-04-05 21:00:00	2025-04-05 18:43:00
1703	757	2025-04-30 15:54:41	2025-04-30 19:55:41	2025-04-30 15:54:41
1704	244	2025-09-13 15:37:09	2025-09-13 18:39:09	2025-09-13 15:37:09
1705	371	2025-09-11 13:44:41	2025-09-11 18:04:41	2025-09-11 13:44:41
1706	379	2025-03-22 15:48:10	2025-03-22 17:42:10	2025-03-22 15:48:10
1707	264	2025-03-04 16:50:51	2025-03-04 21:06:51	2025-03-04 16:50:51
1708	811	2025-01-19 16:17:50	2025-01-19 22:16:50	2025-01-19 16:17:50
1709	610	2025-07-29 15:58:47	2025-07-29 18:43:47	2025-07-29 15:58:47
1710	730	2025-01-10 23:27:35	2025-01-11 02:17:35	2025-01-10 23:27:35
1711	368	2025-02-11 05:09:47	2025-02-11 08:39:47	2025-02-11 05:09:47
1712	513	2024-12-22 15:47:10	2024-12-22 20:06:10	2024-12-22 15:47:10
1713	614	2025-10-07 07:15:28	2025-10-07 09:32:28	2025-10-07 07:15:28
1714	258	2025-02-15 16:22:12	2025-02-15 19:59:12	2025-02-15 16:22:12
1715	270	2025-07-29 15:59:11	2025-07-29 18:11:11	2025-07-29 15:59:11
1716	581	2024-12-29 07:04:52	2024-12-29 12:44:52	2024-12-29 07:04:52
1717	138	2025-07-12 16:20:21	2025-07-12 19:01:21	2025-07-12 16:20:21
1718	259	2025-06-16 14:24:56	2025-06-16 18:19:56	2025-06-16 14:24:56
1719	518	2025-09-16 18:01:18	2025-09-16 23:37:18	2025-09-16 18:01:18
1720	442	2025-02-01 16:06:06	2025-02-01 18:39:06	2025-02-01 16:06:06
1721	720	2024-12-17 16:08:30	2024-12-17 18:14:30	2024-12-17 16:08:30
1722	127	2025-05-27 17:23:15	2025-05-27 20:14:15	2025-05-27 17:23:15
1723	986	2024-11-29 07:25:15	2024-11-29 08:52:15	2024-11-29 07:25:15
1724	800	2024-11-23 17:47:21	2024-11-23 22:56:21	2024-11-23 17:47:21
1725	838	2025-04-12 15:22:56	2025-04-12 20:40:56	2025-04-12 15:22:56
1726	524	2025-10-26 15:38:12	2025-10-26 19:41:12	2025-10-26 15:38:12
1727	776	2025-03-02 16:59:39	2025-03-02 20:38:39	2025-03-02 16:59:39
1728	333	2025-07-01 15:58:18	2025-07-01 17:26:18	2025-07-01 15:58:18
1729	107	2025-08-02 06:33:25	2025-08-02 08:48:25	2025-08-02 06:33:25
1730	784	2025-05-03 15:51:15	2025-05-03 20:51:15	2025-05-03 15:51:15
1731	452	2024-12-29 17:16:25	2024-12-29 20:10:25	2024-12-29 17:16:25
1732	226	2025-03-09 16:32:11	2025-03-09 19:01:11	2025-03-09 16:32:11
1733	810	2025-05-24 15:50:37	2025-05-24 17:46:37	2025-05-24 15:50:37
1734	691	2025-04-26 14:55:43	2025-04-26 20:48:43	2025-04-26 14:55:43
1735	573	2025-03-08 18:12:54	2025-03-09 00:04:54	2025-03-08 18:12:54
1736	648	2025-08-03 05:30:11	2025-08-03 10:39:11	2025-08-03 05:30:11
1737	148	2025-01-04 04:40:37	2025-01-04 06:31:37	2025-01-04 04:40:37
1738	466	2025-01-06 23:09:17	2025-01-07 04:57:17	2025-01-06 23:09:17
1739	763	2024-11-11 16:59:24	2024-11-11 22:04:24	2024-11-11 16:59:24
1740	509	2025-07-01 14:11:59	2025-07-01 18:56:59	2025-07-01 14:11:59
1741	674	2025-03-22 18:40:24	2025-03-22 19:45:24	2025-03-22 18:40:24
1742	372	2025-02-27 15:37:01	2025-02-27 18:33:01	2025-02-27 15:37:01
1743	979	2025-06-21 14:52:00	2025-06-21 18:23:00	2025-06-21 14:52:00
1744	838	2025-08-23 18:36:24	2025-08-23 20:55:24	2025-08-23 18:36:24
1745	900	2025-10-12 16:58:07	2025-10-12 19:31:07	2025-10-12 16:58:07
1746	861	2025-07-29 17:21:03	2025-07-29 20:18:03	2025-07-29 17:21:03
1747	821	2025-02-23 09:20:58	2025-02-23 10:28:58	2025-02-23 09:20:58
1748	832	2025-04-27 15:14:42	2025-04-27 19:24:42	2025-04-27 15:14:42
1749	536	2024-11-17 11:30:13	2024-11-17 16:26:13	2024-11-17 11:30:13
1750	569	2025-07-22 15:27:51	2025-07-22 21:24:51	2025-07-22 15:27:51
1751	832	2025-10-28 17:50:25	2025-10-28 20:05:25	2025-10-28 17:50:25
1752	915	2025-10-12 16:55:14	2025-10-12 21:39:14	2025-10-12 16:55:14
1753	804	2025-10-24 14:10:42	2025-10-24 17:06:42	2025-10-24 14:10:42
1754	433	2025-07-06 18:22:28	2025-07-06 21:12:28	2025-07-06 18:22:28
1755	936	2025-03-12 17:25:20	2025-03-12 21:17:20	2025-03-12 17:25:20
1756	861	2025-07-05 09:40:30	2025-07-05 13:29:30	2025-07-05 09:40:30
1757	901	2025-06-14 14:20:18	2025-06-14 15:55:18	2025-06-14 14:20:18
1758	220	2025-03-23 07:58:23	2025-03-23 10:41:23	2025-03-23 07:58:23
1759	788	2025-01-18 16:52:12	2025-01-18 19:25:12	2025-01-18 16:52:12
1760	491	2025-09-02 14:15:40	2025-09-02 18:27:40	2025-09-02 14:15:40
1761	347	2025-02-23 18:38:37	2025-02-23 20:00:37	2025-02-23 18:38:37
1762	645	2024-12-22 16:31:29	2024-12-22 22:24:29	2024-12-22 16:31:29
1763	678	2025-10-12 13:13:19	2025-10-12 16:37:19	2025-10-12 13:13:19
1764	809	2025-09-13 14:09:38	2025-09-13 16:54:38	2025-09-13 14:09:38
1765	698	2025-01-05 14:32:39	2025-01-05 15:34:39	2025-01-05 14:32:39
1766	941	2025-02-11 16:59:24	2025-02-11 20:38:24	2025-02-11 16:59:24
1767	334	2025-07-06 17:39:29	2025-07-06 19:58:29	2025-07-06 17:39:29
1768	819	2025-05-31 16:16:56	2025-05-31 18:21:56	2025-05-31 16:16:56
1769	59	2025-07-05 00:15:20	2025-07-05 06:04:20	2025-07-05 00:15:20
1770	50	2025-03-01 16:18:46	2025-03-01 21:34:46	2025-03-01 16:18:46
1771	713	2025-06-03 17:04:09	2025-06-03 21:51:09	2025-06-03 17:04:09
1772	59	2025-10-17 15:13:09	2025-10-17 18:28:09	2025-10-17 15:13:09
1773	173	2025-05-17 09:56:09	2025-05-17 11:15:09	2025-05-17 09:56:09
1774	459	2025-08-09 18:24:27	2025-08-09 19:30:27	2025-08-09 18:24:27
1775	875	2024-11-17 16:36:43	2024-11-17 18:20:43	2024-11-17 16:36:43
1776	674	2024-12-10 16:23:46	2024-12-10 18:29:46	2024-12-10 16:23:46
1777	608	2025-09-14 14:48:21	2025-09-14 18:42:21	2025-09-14 14:48:21
1778	556	2025-04-15 14:46:14	2025-04-15 19:46:14	2025-04-15 14:46:14
1779	158	2024-11-09 06:06:14	2024-11-09 07:29:14	2024-11-09 06:06:14
1780	455	2024-12-22 15:37:33	2024-12-22 20:13:33	2024-12-22 15:37:33
1781	66	2024-12-03 14:31:36	2024-12-03 17:44:36	2024-12-03 14:31:36
1782	364	2025-01-11 15:46:37	2025-01-11 18:54:37	2025-01-11 15:46:37
1783	21	2024-11-23 15:27:20	2024-11-23 17:05:20	2024-11-23 15:27:20
1784	934	2025-10-11 17:12:11	2025-10-11 20:29:11	2025-10-11 17:12:11
1785	488	2025-02-16 09:19:39	2025-02-16 10:58:39	2025-02-16 09:19:39
1786	426	2025-05-24 16:42:43	2025-05-24 20:17:43	2025-05-24 16:42:43
1787	799	2025-01-04 17:20:38	2025-01-04 21:21:38	2025-01-04 17:20:38
1788	170	2025-04-01 05:59:56	2025-04-01 08:48:56	2025-04-01 05:59:56
1789	858	2025-06-08 11:34:23	2025-06-08 16:52:23	2025-06-08 11:34:23
1790	926	2025-09-06 15:19:19	2025-09-06 18:22:19	2025-09-06 15:19:19
1791	901	2025-11-01 05:04:07	2025-11-01 09:36:07	2025-11-01 05:04:07
1792	565	2024-12-02 19:42:09	2024-12-02 23:21:09	2024-12-02 19:42:09
1793	216	2025-06-14 16:50:31	2025-06-14 20:43:31	2025-06-14 16:50:31
1794	599	2025-08-19 14:43:26	2025-08-19 17:45:26	2025-08-19 14:43:26
1795	436	2025-03-04 16:43:56	2025-03-04 18:04:56	2025-03-04 16:43:56
1796	180	2025-04-06 14:25:02	2025-04-06 16:09:02	2025-04-06 14:25:02
1797	550	2025-11-04 17:57:53	2025-11-04 19:37:53	2025-11-04 17:57:53
1798	384	2024-12-08 16:37:04	2024-12-08 18:30:04	2024-12-08 16:37:04
1799	601	2025-09-11 06:38:28	2025-09-11 08:40:28	2025-09-11 06:38:28
1800	692	2025-04-15 16:40:03	2025-04-15 21:35:03	2025-04-15 16:40:03
1801	39	2024-12-14 07:24:33	2024-12-14 11:53:33	2024-12-14 07:24:33
1802	888	2025-01-21 16:51:48	2025-01-21 19:19:48	2025-01-21 16:51:48
1803	135	2025-03-08 18:26:22	2025-03-08 21:18:22	2025-03-08 18:26:22
1804	752	2025-09-06 15:15:59	2025-09-06 18:48:59	2025-09-06 15:15:59
1805	715	2025-05-11 09:59:11	2025-05-11 15:29:11	2025-05-11 09:59:11
1806	643	2025-07-13 14:33:28	2025-07-13 19:05:28	2025-07-13 14:33:28
1807	431	2025-02-25 17:46:24	2025-02-25 22:48:24	2025-02-25 17:46:24
1808	186	2024-11-26 11:45:42	2024-11-26 15:20:42	2024-11-26 11:45:42
1809	160	2025-02-04 16:59:18	2025-02-04 21:27:18	2025-02-04 16:59:18
1810	143	2025-02-18 17:22:00	2025-02-18 22:26:00	2025-02-18 17:22:00
1811	638	2025-03-18 17:58:08	2025-03-18 22:15:08	2025-03-18 17:58:08
1812	289	2025-09-27 17:25:08	2025-09-27 18:55:08	2025-09-27 17:25:08
1813	633	2025-01-21 18:52:50	2025-01-22 00:20:50	2025-01-21 18:52:50
1814	596	2025-11-04 15:15:22	2025-11-04 17:52:22	2025-11-04 15:15:22
1815	227	2025-05-03 15:10:22	2025-05-03 16:24:22	2025-05-03 15:10:22
1816	950	2025-04-08 12:02:49	2025-04-08 15:40:49	2025-04-08 12:02:49
1817	576	2024-12-31 17:20:57	2024-12-31 21:52:57	2024-12-31 17:20:57
1818	143	2025-08-05 17:04:04	2025-08-05 20:06:04	2025-08-05 17:04:04
1819	494	2024-12-31 15:43:53	2024-12-31 20:22:53	2024-12-31 15:43:53
1820	696	2025-08-03 15:27:12	2025-08-03 18:51:12	2025-08-03 15:27:12
1821	398	2025-08-12 14:52:18	2025-08-12 19:16:18	2025-08-12 14:52:18
1822	703	2024-11-17 15:32:16	2024-11-17 21:26:16	2024-11-17 15:32:16
1823	737	2025-03-08 17:32:26	2025-03-08 21:29:26	2025-03-08 17:32:26
1824	73	2025-06-10 16:07:38	2025-06-10 18:04:38	2025-06-10 16:07:38
1825	911	2025-09-30 14:34:12	2025-09-30 17:52:12	2025-09-30 14:34:12
1826	685	2025-02-18 13:51:11	2025-02-18 14:57:11	2025-02-18 13:51:11
1827	331	2025-02-18 17:39:49	2025-02-18 19:35:49	2025-02-18 17:39:49
1828	98	2025-01-12 19:57:07	2025-01-12 21:34:07	2025-01-12 19:57:07
1829	457	2025-02-18 13:41:25	2025-02-18 19:25:25	2025-02-18 13:41:25
1830	18	2025-05-13 17:25:45	2025-05-13 21:28:45	2025-05-13 17:25:45
1831	45	2025-05-27 14:58:25	2025-05-27 19:56:25	2025-05-27 14:58:25
1832	179	2025-08-12 14:09:00	2025-08-12 20:07:00	2025-08-12 14:09:00
1833	889	2025-06-10 13:33:56	2025-06-10 16:49:56	2025-06-10 13:33:56
1834	233	2024-11-20 17:56:09	2024-11-20 20:54:09	2024-11-20 17:56:09
1835	210	2025-02-25 18:46:30	2025-02-25 20:58:30	2025-02-25 18:46:30
1836	198	2024-12-07 15:08:44	2024-12-07 19:15:44	2024-12-07 15:08:44
1837	483	2025-06-14 10:37:41	2025-06-14 15:01:41	2025-06-14 10:37:41
1838	832	2025-10-11 14:03:51	2025-10-11 18:33:51	2025-10-11 14:03:51
1839	343	2024-11-17 16:12:31	2024-11-17 18:01:31	2024-11-17 16:12:31
1840	614	2025-03-16 06:19:39	2025-03-16 11:18:39	2025-03-16 06:19:39
1841	323	2025-01-28 18:54:48	2025-01-28 21:48:48	2025-01-28 18:54:48
1842	628	2025-08-31 14:51:05	2025-08-31 20:23:05	2025-08-31 14:51:05
1843	653	2025-09-30 17:59:47	2025-09-30 19:11:47	2025-09-30 17:59:47
1844	293	2025-06-13 16:07:37	2025-06-13 18:08:37	2025-06-13 16:07:37
1845	276	2024-12-21 17:25:22	2024-12-21 18:50:22	2024-12-21 17:25:22
1846	840	2024-12-05 15:42:24	2024-12-05 19:26:24	2024-12-05 15:42:24
1847	906	2024-12-07 17:24:10	2024-12-07 21:19:10	2024-12-07 17:24:10
1848	16	2024-11-16 19:07:33	2024-11-17 00:11:33	2024-11-16 19:07:33
1849	617	2024-11-26 16:44:10	2024-11-26 22:23:10	2024-11-26 16:44:10
1850	31	2025-07-12 17:16:53	2025-07-12 19:03:53	2025-07-12 17:16:53
1851	876	2025-07-22 16:01:39	2025-07-22 17:12:39	2025-07-22 16:01:39
1852	335	2025-05-18 14:37:40	2025-05-18 16:07:40	2025-05-18 14:37:40
1853	343	2025-07-01 14:47:15	2025-07-01 17:49:15	2025-07-01 14:47:15
1854	314	2025-09-02 12:26:10	2025-09-02 17:28:10	2025-09-02 12:26:10
1855	696	2025-04-12 14:29:56	2025-04-12 18:03:56	2025-04-12 14:29:56
1856	327	2025-05-24 07:33:36	2025-05-24 12:10:36	2025-05-24 07:33:36
1857	952	2025-09-20 15:52:42	2025-09-20 19:34:42	2025-09-20 15:52:42
1858	329	2025-01-22 21:46:42	2025-01-23 02:19:42	2025-01-22 21:46:42
1859	595	2024-12-21 15:55:25	2024-12-21 18:10:25	2024-12-21 15:55:25
1860	24	2025-08-31 12:01:10	2025-08-31 15:39:10	2025-08-31 12:01:10
1861	683	2025-09-02 15:36:40	2025-09-02 20:17:40	2025-09-02 15:36:40
1862	96	2025-07-10 16:18:14	2025-07-10 19:11:14	2025-07-10 16:18:14
1863	794	2025-04-01 14:02:04	2025-04-01 16:40:04	2025-04-01 14:02:04
1864	518	2025-08-23 14:58:44	2025-08-23 16:01:44	2025-08-23 14:58:44
1865	863	2025-08-16 18:44:35	2025-08-16 21:14:35	2025-08-16 18:44:35
1866	863	2025-10-19 14:51:45	2025-10-19 20:46:45	2025-10-19 14:51:45
1867	164	2024-11-09 15:44:58	2024-11-09 20:01:58	2024-11-09 15:44:58
1868	540	2025-08-23 15:17:11	2025-08-23 19:56:11	2025-08-23 15:17:11
1869	946	2024-11-12 10:54:14	2024-11-12 14:13:14	2024-11-12 10:54:14
1870	124	2025-02-08 15:22:58	2025-02-08 18:55:58	2025-02-08 15:22:58
1871	749	2025-03-04 08:44:10	2025-03-04 11:22:10	2025-03-04 08:44:10
1872	185	2025-03-09 18:02:07	2025-03-09 21:54:07	2025-03-09 18:02:07
1873	965	2025-07-13 16:18:00	2025-07-13 17:36:00	2025-07-13 16:18:00
1874	237	2025-01-11 14:48:44	2025-01-11 19:18:44	2025-01-11 14:48:44
1875	944	2025-06-29 16:21:31	2025-06-29 22:03:31	2025-06-29 16:21:31
1876	443	2025-10-18 15:41:13	2025-10-18 18:24:13	2025-10-18 15:41:13
1877	1000	2025-09-16 17:27:14	2025-09-16 18:31:14	2025-09-16 17:27:14
1878	80	2025-06-15 09:17:29	2025-06-15 12:02:29	2025-06-15 09:17:29
1879	842	2025-07-02 18:18:30	2025-07-02 21:57:30	2025-07-02 18:18:30
1880	244	2025-02-08 07:27:01	2025-02-08 10:01:01	2025-02-08 07:27:01
1881	521	2025-03-15 17:06:31	2025-03-15 21:43:31	2025-03-15 17:06:31
1882	848	2024-11-23 16:47:53	2024-11-23 22:28:53	2024-11-23 16:47:53
1883	681	2025-09-29 05:44:55	2025-09-29 07:28:55	2025-09-29 05:44:55
1884	162	2025-11-02 15:30:15	2025-11-02 20:10:15	2025-11-02 15:30:15
1885	568	2025-05-24 18:03:46	2025-05-24 22:48:46	2025-05-24 18:03:46
1886	552	2025-04-01 16:33:39	2025-04-01 21:40:39	2025-04-01 16:33:39
1887	286	2025-05-20 14:28:57	2025-05-20 16:59:57	2025-05-20 14:28:57
1888	34	2025-06-15 18:18:04	2025-06-15 22:19:04	2025-06-15 18:18:04
1889	736	2024-11-24 13:27:04	2024-11-24 15:28:04	2024-11-24 13:27:04
1890	574	2024-12-05 17:03:45	2024-12-05 20:26:45	2024-12-05 17:03:45
1891	574	2025-09-28 21:11:07	2025-09-29 01:55:07	2025-09-28 21:11:07
1892	193	2025-08-04 11:49:48	2025-08-04 17:42:48	2025-08-04 11:49:48
1893	982	2025-01-05 15:25:48	2025-01-05 18:32:48	2025-01-05 15:25:48
1894	745	2025-07-19 15:03:13	2025-07-19 19:03:13	2025-07-19 15:03:13
1895	320	2025-09-06 16:05:11	2025-09-06 19:27:11	2025-09-06 16:05:11
1896	334	2025-04-19 17:23:57	2025-04-19 23:11:57	2025-04-19 17:23:57
1897	668	2025-05-06 15:29:34	2025-05-06 21:21:34	2025-05-06 15:29:34
1898	781	2024-11-26 16:16:03	2024-11-26 21:16:03	2024-11-26 16:16:03
1899	515	2025-08-12 16:14:08	2025-08-12 19:39:08	2025-08-12 16:14:08
1900	129	2025-04-15 15:01:00	2025-04-15 20:36:00	2025-04-15 15:01:00
1901	731	2024-12-24 16:39:37	2024-12-24 18:23:37	2024-12-24 16:39:37
1902	441	2025-01-21 16:22:20	2025-01-21 17:24:20	2025-01-21 16:22:20
1903	687	2025-07-06 14:34:05	2025-07-06 19:47:05	2025-07-06 14:34:05
1904	656	2025-03-15 12:02:55	2025-03-15 14:07:55	2025-03-15 12:02:55
1905	826	2025-04-06 13:31:30	2025-04-06 18:48:30	2025-04-06 13:31:30
1906	79	2025-04-29 21:13:19	2025-04-30 01:53:19	2025-04-29 21:13:19
1907	109	2025-06-15 13:15:47	2025-06-15 18:44:47	2025-06-15 13:15:47
1908	842	2025-06-07 14:27:39	2025-06-07 15:54:39	2025-06-07 14:27:39
1909	597	2025-06-24 10:07:13	2025-06-24 14:43:13	2025-06-24 10:07:13
1910	478	2025-04-22 14:30:03	2025-04-22 15:56:03	2025-04-22 14:30:03
1911	212	2025-07-25 22:18:43	2025-07-26 02:08:43	2025-07-25 22:18:43
1912	347	2025-07-19 17:53:20	2025-07-19 19:14:20	2025-07-19 17:53:20
1913	285	2024-11-10 15:37:57	2024-11-10 18:37:57	2024-11-10 15:37:57
1914	192	2025-05-31 06:38:12	2025-05-31 09:40:12	2025-05-31 06:38:12
1915	583	2025-01-19 16:59:52	2025-01-19 22:58:52	2025-01-19 16:59:52
1916	583	2025-01-18 17:35:40	2025-01-18 19:39:40	2025-01-18 17:35:40
1917	319	2024-11-26 17:27:03	2024-11-26 21:05:03	2024-11-26 17:27:03
1918	190	2025-08-16 12:59:11	2025-08-16 14:57:11	2025-08-16 12:59:11
1919	779	2025-09-07 16:51:16	2025-09-07 18:14:16	2025-09-07 16:51:16
1920	128	2025-01-14 14:28:51	2025-01-14 16:24:51	2025-01-14 14:28:51
1921	34	2025-05-13 17:57:08	2025-05-13 19:19:08	2025-05-13 17:57:08
1922	813	2025-10-11 14:30:56	2025-10-11 19:49:56	2025-10-11 14:30:56
1923	120	2025-02-08 15:37:01	2025-02-08 19:11:01	2025-02-08 15:37:01
1924	133	2024-12-14 16:04:35	2024-12-14 21:09:35	2024-12-14 16:04:35
1925	960	2025-09-09 14:47:07	2025-09-09 17:33:07	2025-09-09 14:47:07
1926	16	2025-07-06 17:17:28	2025-07-06 21:38:28	2025-07-06 17:17:28
1927	418	2025-02-25 09:52:15	2025-02-25 12:41:15	2025-02-25 09:52:15
1928	165	2025-01-31 17:04:40	2025-01-31 21:45:40	2025-01-31 17:04:40
1929	46	2025-01-21 07:30:14	2025-01-21 12:30:14	2025-01-21 07:30:14
1930	865	2025-05-20 16:06:30	2025-05-20 18:26:30	2025-05-20 16:06:30
1931	135	2025-02-13 12:04:16	2025-02-13 17:52:16	2025-02-13 12:04:16
1932	248	2024-12-08 18:37:16	2024-12-09 00:35:16	2024-12-08 18:37:16
1933	711	2025-07-22 18:03:17	2025-07-22 19:27:17	2025-07-22 18:03:17
1934	856	2025-07-15 15:42:47	2025-07-15 21:38:47	2025-07-15 15:42:47
1935	988	2025-01-19 15:04:04	2025-01-19 20:55:04	2025-01-19 15:04:04
1936	276	2025-09-06 15:13:41	2025-09-06 16:37:41	2025-09-06 15:13:41
1937	604	2025-01-30 15:02:21	2025-01-30 16:15:21	2025-01-30 15:02:21
1938	856	2025-09-09 11:42:10	2025-09-09 12:44:10	2025-09-09 11:42:10
1939	910	2025-03-21 17:32:35	2025-03-21 22:07:35	2025-03-21 17:32:35
1940	730	2024-12-04 16:03:55	2024-12-04 20:44:55	2024-12-04 16:03:55
1941	757	2025-03-15 19:30:17	2025-03-15 23:53:17	2025-03-15 19:30:17
1942	153	2025-03-29 16:10:07	2025-03-29 21:20:07	2025-03-29 16:10:07
1943	141	2024-12-10 19:37:27	2024-12-11 00:54:27	2024-12-10 19:37:27
1944	878	2025-03-02 16:29:24	2025-03-02 22:02:24	2025-03-02 16:29:24
1945	90	2025-07-20 04:13:38	2025-07-20 06:27:38	2025-07-20 04:13:38
1946	740	2025-06-14 11:49:44	2025-06-14 14:37:44	2025-06-14 11:49:44
1947	428	2025-10-21 07:38:47	2025-10-21 12:48:47	2025-10-21 07:38:47
1948	315	2025-07-15 15:30:13	2025-07-15 18:10:13	2025-07-15 15:30:13
1949	647	2025-03-04 15:30:31	2025-03-04 18:54:31	2025-03-04 15:30:31
1950	775	2024-12-31 12:46:38	2024-12-31 14:59:38	2024-12-31 12:46:38
1951	950	2024-12-03 05:13:30	2024-12-03 09:50:30	2024-12-03 05:13:30
1952	320	2024-12-28 17:49:50	2024-12-28 21:19:50	2024-12-28 17:49:50
1953	218	2025-07-12 16:30:43	2025-07-12 20:20:43	2025-07-12 16:30:43
1954	396	2025-06-14 15:24:30	2025-06-14 20:47:30	2025-06-14 15:24:30
1955	122	2025-06-10 15:12:44	2025-06-10 18:13:44	2025-06-10 15:12:44
1956	346	2025-02-25 06:39:28	2025-02-25 08:34:28	2025-02-25 06:39:28
1957	690	2025-01-28 12:33:07	2025-01-28 14:13:07	2025-01-28 12:33:07
1958	744	2025-05-11 16:15:16	2025-05-11 21:09:16	2025-05-11 16:15:16
1959	411	2025-05-14 14:36:41	2025-05-14 20:01:41	2025-05-14 14:36:41
1960	212	2025-09-01 14:10:39	2025-09-01 19:14:39	2025-09-01 14:10:39
1961	794	2025-09-07 14:44:47	2025-09-07 16:58:47	2025-09-07 14:44:47
1962	409	2025-08-30 16:10:42	2025-08-30 18:44:42	2025-08-30 16:10:42
1963	110	2025-07-01 21:30:18	2025-07-01 23:18:18	2025-07-01 21:30:18
1964	466	2025-11-06 16:50:41	2025-11-06 22:22:41	2025-11-06 16:50:41
1965	423	2025-04-12 07:37:01	2025-04-12 12:53:01	2025-04-12 07:37:01
1966	766	2025-09-16 15:06:43	2025-09-16 20:16:43	2025-09-16 15:06:43
1967	417	2025-05-18 16:16:09	2025-05-18 17:51:09	2025-05-18 16:16:09
1968	445	2025-05-20 16:32:26	2025-05-20 19:30:26	2025-05-20 16:32:26
1969	405	2025-08-05 17:25:43	2025-08-05 20:42:43	2025-08-05 17:25:43
1970	64	2025-07-06 18:30:41	2025-07-06 22:42:41	2025-07-06 18:30:41
1971	52	2025-08-14 12:05:40	2025-08-14 15:03:40	2025-08-14 12:05:40
1972	962	2024-12-24 18:00:53	2024-12-24 23:21:53	2024-12-24 18:00:53
1973	708	2025-01-12 05:23:02	2025-01-12 07:47:02	2025-01-12 05:23:02
1974	783	2025-07-08 09:16:08	2025-07-08 11:57:08	2025-07-08 09:16:08
1975	81	2025-03-02 17:46:58	2025-03-02 22:56:58	2025-03-02 17:46:58
1976	367	2025-01-02 16:21:19	2025-01-02 21:02:19	2025-01-02 16:21:19
1977	524	2025-05-25 16:38:37	2025-05-25 19:50:37	2025-05-25 16:38:37
1978	909	2025-07-26 14:35:26	2025-07-26 19:48:26	2025-07-26 14:35:26
1979	41	2025-07-11 14:49:53	2025-07-11 19:40:53	2025-07-11 14:49:53
1980	489	2025-10-19 17:52:53	2025-10-19 23:43:53	2025-10-19 17:52:53
1981	39	2025-02-01 15:39:47	2025-02-01 19:22:47	2025-02-01 15:39:47
1982	184	2025-08-26 18:37:00	2025-08-26 19:39:00	2025-08-26 18:37:00
1983	663	2025-08-23 14:52:41	2025-08-23 19:13:41	2025-08-23 14:52:41
1984	675	2025-07-26 17:23:25	2025-07-26 19:47:25	2025-07-26 17:23:25
1985	25	2025-11-04 17:11:57	2025-11-04 22:54:57	2025-11-04 17:11:57
1986	685	2025-03-22 19:03:29	2025-03-22 21:04:29	2025-03-22 19:03:29
1987	719	2025-09-30 18:58:33	2025-10-01 00:14:33	2025-09-30 18:58:33
1988	252	2025-04-26 15:58:28	2025-04-26 19:13:28	2025-04-26 15:58:28
1989	279	2025-01-28 19:20:57	2025-01-28 22:51:57	2025-01-28 19:20:57
1990	737	2025-04-22 14:23:58	2025-04-22 16:01:58	2025-04-22 14:23:58
1991	233	2025-03-01 09:14:20	2025-03-01 10:37:20	2025-03-01 09:14:20
1992	45	2025-06-17 15:20:46	2025-06-17 19:09:46	2025-06-17 15:20:46
1993	518	2025-03-23 16:47:58	2025-03-23 18:56:58	2025-03-23 16:47:58
1994	46	2025-05-17 17:04:53	2025-05-17 19:25:53	2025-05-17 17:04:53
1995	254	2025-05-04 15:05:33	2025-05-04 21:01:33	2025-05-04 15:05:33
1996	390	2025-03-22 10:47:01	2025-03-22 13:03:01	2025-03-22 10:47:01
1997	973	2025-05-13 15:49:37	2025-05-13 19:21:37	2025-05-13 15:49:37
1998	107	2025-06-17 16:24:07	2025-06-17 18:04:07	2025-06-17 16:24:07
1999	546	2025-04-20 14:12:59	2025-04-20 16:54:59	2025-04-20 14:12:59
2000	243	2024-12-03 16:49:15	2024-12-03 21:03:15	2024-12-03 16:49:15
2001	50	2025-04-12 09:10:42	2025-04-12 13:29:42	2025-04-12 09:10:42
2002	690	2025-09-09 15:07:45	2025-09-09 16:37:45	2025-09-09 15:07:45
2003	71	2025-07-11 14:53:31	2025-07-11 17:48:31	2025-07-11 14:53:31
2004	76	2025-07-19 15:23:13	2025-07-19 19:19:13	2025-07-19 15:23:13
2005	618	2025-07-01 15:15:16	2025-07-01 20:15:16	2025-07-01 15:15:16
2006	754	2025-03-11 12:56:06	2025-03-11 15:16:06	2025-03-11 12:56:06
2007	447	2025-04-29 18:27:35	2025-04-29 23:26:35	2025-04-29 18:27:35
2008	716	2025-04-01 16:37:34	2025-04-01 21:14:34	2025-04-01 16:37:34
2009	203	2025-09-07 09:58:26	2025-09-07 12:44:26	2025-09-07 09:58:26
2010	69	2025-05-18 16:33:10	2025-05-18 18:44:10	2025-05-18 16:33:10
2011	186	2025-01-11 15:50:51	2025-01-11 17:08:51	2025-01-11 15:50:51
2012	693	2025-09-06 16:09:13	2025-09-06 17:20:13	2025-09-06 16:09:13
2013	435	2025-06-24 17:39:36	2025-06-24 19:09:36	2025-06-24 17:39:36
2014	147	2025-08-24 15:10:37	2025-08-24 20:11:37	2025-08-24 15:10:37
2015	40	2025-04-12 15:44:49	2025-04-12 19:40:49	2025-04-12 15:44:49
2016	205	2025-04-12 15:34:20	2025-04-12 20:20:20	2025-04-12 15:34:20
2017	335	2025-03-25 11:57:41	2025-03-25 15:43:41	2025-03-25 11:57:41
2018	411	2025-05-04 18:24:27	2025-05-04 21:06:27	2025-05-04 18:24:27
2019	474	2025-03-08 17:59:15	2025-03-08 21:10:15	2025-03-08 17:59:15
2020	895	2025-08-23 16:34:04	2025-08-23 21:55:04	2025-08-23 16:34:04
2021	669	2025-10-21 15:58:43	2025-10-21 21:14:43	2025-10-21 15:58:43
2022	374	2025-04-12 16:15:27	2025-04-12 19:26:27	2025-04-12 16:15:27
2023	341	2025-07-29 16:20:39	2025-07-29 21:21:39	2025-07-29 16:20:39
2024	3	2025-01-25 16:21:02	2025-01-25 18:56:02	2025-01-25 16:21:02
2025	543	2025-04-29 14:44:34	2025-04-29 19:53:34	2025-04-29 14:44:34
2026	55	2024-11-19 15:41:10	2024-11-19 19:07:10	2024-11-19 15:41:10
2027	84	2025-09-02 16:11:12	2025-09-02 17:47:12	2025-09-02 16:11:12
2028	674	2025-09-28 17:10:45	2025-09-28 18:14:45	2025-09-28 17:10:45
2029	35	2025-08-24 16:29:20	2025-08-24 21:50:20	2025-08-24 16:29:20
2030	84	2025-10-15 19:31:31	2025-10-15 23:20:31	2025-10-15 19:31:31
2031	22	2025-06-28 16:19:27	2025-06-28 18:29:27	2025-06-28 16:19:27
2032	743	2024-11-26 15:16:57	2024-11-26 18:16:57	2024-11-26 15:16:57
2033	883	2025-11-01 14:36:23	2025-11-01 17:24:23	2025-11-01 14:36:23
2034	922	2025-03-08 17:11:06	2025-03-08 19:39:06	2025-03-08 17:11:06
2035	640	2025-05-04 15:43:10	2025-05-04 19:24:10	2025-05-04 15:43:10
2036	859	2025-08-05 15:36:28	2025-08-05 18:35:28	2025-08-05 15:36:28
2037	604	2025-01-05 18:52:19	2025-01-05 20:59:19	2025-01-05 18:52:19
2038	434	2025-08-23 16:23:35	2025-08-23 21:04:35	2025-08-23 16:23:35
2039	898	2025-10-28 16:19:57	2025-10-28 19:32:57	2025-10-28 16:19:57
2040	895	2025-10-12 14:17:21	2025-10-12 18:23:21	2025-10-12 14:17:21
2041	51	2024-11-24 17:24:28	2024-11-24 22:10:28	2024-11-24 17:24:28
2042	833	2025-08-30 14:20:51	2025-08-30 17:49:51	2025-08-30 14:20:51
2043	699	2024-12-24 17:35:03	2024-12-24 20:36:03	2024-12-24 17:35:03
2044	936	2025-08-30 15:51:02	2025-08-30 21:23:02	2025-08-30 15:51:02
2045	958	2024-12-21 18:10:52	2024-12-21 23:20:52	2024-12-21 18:10:52
2046	402	2025-01-11 15:27:28	2025-01-11 18:35:28	2025-01-11 15:27:28
2047	664	2024-12-14 15:44:11	2024-12-14 17:06:11	2024-12-14 15:44:11
2048	968	2024-12-07 17:09:59	2024-12-07 21:31:59	2024-12-07 17:09:59
2049	426	2025-03-22 19:57:05	2025-03-22 22:56:05	2025-03-22 19:57:05
2050	508	2025-05-20 17:23:16	2025-05-20 20:16:16	2025-05-20 17:23:16
2051	507	2025-01-11 11:22:38	2025-01-11 15:23:38	2025-01-11 11:22:38
2052	815	2025-01-19 17:10:35	2025-01-19 21:23:35	2025-01-19 17:10:35
2053	908	2025-06-03 15:39:50	2025-06-03 21:07:50	2025-06-03 15:39:50
2054	462	2025-04-13 11:32:40	2025-04-13 13:37:40	2025-04-13 11:32:40
2055	739	2025-10-05 17:28:57	2025-10-05 18:41:57	2025-10-05 17:28:57
2056	513	2025-01-14 16:42:19	2025-01-14 21:07:19	2025-01-14 16:42:19
2057	336	2024-11-19 19:59:47	2024-11-19 22:48:47	2024-11-19 19:59:47
2058	821	2025-06-15 15:29:33	2025-06-15 17:52:33	2025-06-15 15:29:33
2059	784	2025-04-08 04:39:17	2025-04-08 08:34:17	2025-04-08 04:39:17
2060	82	2025-09-20 18:18:52	2025-09-20 23:34:52	2025-09-20 18:18:52
2061	194	2024-11-26 15:41:26	2024-11-26 21:11:26	2024-11-26 15:41:26
2062	545	2024-11-17 15:39:17	2024-11-17 19:18:17	2024-11-17 15:39:17
2063	196	2025-03-09 16:43:36	2025-03-09 21:43:36	2025-03-09 16:43:36
2064	890	2025-10-07 09:27:55	2025-10-07 14:52:55	2025-10-07 09:27:55
2065	801	2025-02-10 16:38:51	2025-02-10 20:12:51	2025-02-10 16:38:51
2066	454	2025-04-26 08:44:07	2025-04-26 12:03:07	2025-04-26 08:44:07
2067	478	2025-01-07 15:40:36	2025-01-07 20:49:36	2025-01-07 15:40:36
2068	124	2025-04-19 16:40:46	2025-04-19 20:16:46	2025-04-19 16:40:46
2069	865	2025-08-10 14:10:40	2025-08-10 18:29:40	2025-08-10 14:10:40
2070	643	2025-03-25 07:40:23	2025-03-25 11:08:23	2025-03-25 07:40:23
2071	68	2025-06-17 16:39:24	2025-06-17 18:20:24	2025-06-17 16:39:24
2072	579	2025-02-15 17:25:50	2025-02-15 23:22:50	2025-02-15 17:25:50
2073	94	2025-04-29 05:24:52	2025-04-29 09:43:52	2025-04-29 05:24:52
2074	330	2024-12-15 17:32:43	2024-12-15 18:50:43	2024-12-15 17:32:43
2075	614	2025-04-06 16:29:26	2025-04-06 21:17:26	2025-04-06 16:29:26
2076	5	2025-09-20 15:18:34	2025-09-20 19:20:34	2025-09-20 15:18:34
2077	815	2025-10-14 09:26:15	2025-10-14 11:38:15	2025-10-14 09:26:15
2078	415	2024-11-26 16:28:40	2024-11-26 17:37:40	2024-11-26 16:28:40
2079	679	2025-09-13 16:15:54	2025-09-13 19:08:54	2025-09-13 16:15:54
2080	114	2024-11-17 07:55:11	2024-11-17 13:49:11	2024-11-17 07:55:11
2081	757	2025-07-27 15:21:53	2025-07-27 21:18:53	2025-07-27 15:21:53
2082	215	2024-12-14 16:23:45	2024-12-14 22:16:45	2024-12-14 16:23:45
2083	653	2025-07-19 07:53:07	2025-07-19 09:57:07	2025-07-19 07:53:07
2084	838	2025-04-20 14:50:05	2025-04-20 20:48:05	2025-04-20 14:50:05
2085	392	2025-09-02 15:45:00	2025-09-02 18:10:00	2025-09-02 15:45:00
2086	526	2025-02-23 18:41:00	2025-02-23 20:28:00	2025-02-23 18:41:00
2087	198	2025-07-12 17:27:24	2025-07-12 19:47:24	2025-07-12 17:27:24
2088	245	2024-12-29 17:27:46	2024-12-29 21:34:46	2024-12-29 17:27:46
2089	211	2025-03-02 05:55:02	2025-03-02 08:28:02	2025-03-02 05:55:02
2090	7	2025-05-31 20:49:21	2025-06-01 02:03:21	2025-05-31 20:49:21
2091	273	2025-07-27 16:05:58	2025-07-27 20:36:58	2025-07-27 16:05:58
2092	276	2025-01-19 14:52:42	2025-01-19 20:15:42	2025-01-19 14:52:42
2093	340	2025-08-13 16:24:55	2025-08-13 21:19:55	2025-08-13 16:24:55
2094	638	2025-03-29 17:20:10	2025-03-29 21:42:10	2025-03-29 17:20:10
2095	240	2025-08-05 15:27:09	2025-08-05 20:20:09	2025-08-05 15:27:09
2096	307	2025-03-16 19:11:14	2025-03-16 20:40:14	2025-03-16 19:11:14
2097	50	2024-11-23 15:40:41	2024-11-23 18:13:41	2024-11-23 15:40:41
2098	81	2024-12-01 18:42:09	2024-12-01 21:33:09	2024-12-01 18:42:09
2099	435	2025-03-17 13:53:30	2025-03-17 19:35:30	2025-03-17 13:53:30
2100	284	2025-02-23 16:34:39	2025-02-23 20:29:39	2025-02-23 16:34:39
2101	374	2025-02-08 15:50:18	2025-02-08 18:32:18	2025-02-08 15:50:18
2102	861	2024-11-23 16:57:48	2024-11-23 18:45:48	2024-11-23 16:57:48
2103	560	2025-10-11 08:16:46	2025-10-11 12:25:46	2025-10-11 08:16:46
2104	189	2025-05-31 16:13:05	2025-05-31 21:18:05	2025-05-31 16:13:05
2105	253	2025-10-07 17:44:15	2025-10-07 21:32:15	2025-10-07 17:44:15
2106	198	2025-10-28 07:24:44	2025-10-28 12:00:44	2025-10-28 07:24:44
2107	75	2025-05-17 15:08:16	2025-05-17 19:05:16	2025-05-17 15:08:16
2108	834	2025-01-17 17:29:59	2025-01-17 19:27:59	2025-01-17 17:29:59
2109	234	2025-04-26 06:48:00	2025-04-26 12:00:00	2025-04-26 06:48:00
2110	440	2025-02-22 15:49:26	2025-02-22 19:51:26	2025-02-22 15:49:26
2111	108	2025-08-26 16:00:58	2025-08-26 17:53:58	2025-08-26 16:00:58
2112	400	2025-01-28 17:21:24	2025-01-28 18:31:24	2025-01-28 17:21:24
2113	84	2025-03-23 18:30:23	2025-03-23 23:49:23	2025-03-23 18:30:23
2114	802	2025-10-20 06:05:45	2025-10-20 11:52:45	2025-10-20 06:05:45
2115	663	2025-01-19 16:42:19	2025-01-19 21:05:19	2025-01-19 16:42:19
2116	201	2025-09-05 15:27:31	2025-09-05 20:49:31	2025-09-05 15:27:31
2117	106	2025-06-22 03:50:24	2025-06-22 07:08:24	2025-06-22 03:50:24
2118	988	2025-07-15 14:17:42	2025-07-15 15:22:42	2025-07-15 14:17:42
2119	997	2024-11-16 17:43:19	2024-11-16 21:28:19	2024-11-16 17:43:19
2120	233	2025-09-23 15:27:26	2025-09-23 19:41:26	2025-09-23 15:27:26
2121	80	2025-04-12 15:17:25	2025-04-12 16:38:25	2025-04-12 15:17:25
2122	254	2025-01-27 17:00:24	2025-01-27 22:08:24	2025-01-27 17:00:24
2123	212	2025-08-26 16:27:47	2025-08-26 20:38:47	2025-08-26 16:27:47
2124	661	2024-12-01 15:28:02	2024-12-01 18:11:02	2024-12-01 15:28:02
2125	174	2024-12-29 15:27:45	2024-12-29 17:13:45	2024-12-29 15:27:45
2126	366	2025-09-07 14:05:38	2025-09-07 18:44:38	2025-09-07 14:05:38
2127	357	2024-12-24 16:48:22	2024-12-24 19:21:22	2024-12-24 16:48:22
2128	310	2025-11-04 05:59:43	2025-11-04 08:59:43	2025-11-04 05:59:43
2129	784	2025-01-04 17:56:58	2025-01-04 21:41:58	2025-01-04 17:56:58
2130	889	2024-12-17 15:16:05	2024-12-17 16:40:05	2024-12-17 15:16:05
2131	909	2025-04-26 18:49:25	2025-04-26 22:55:25	2025-04-26 18:49:25
2132	495	2025-03-04 15:49:19	2025-03-04 19:54:19	2025-03-04 15:49:19
2133	225	2025-09-02 16:38:38	2025-09-02 18:45:38	2025-09-02 16:38:38
2134	887	2025-06-01 05:11:56	2025-06-01 06:30:56	2025-06-01 05:11:56
2135	16	2025-06-21 18:35:24	2025-06-21 19:56:24	2025-06-21 18:35:24
2136	48	2025-06-07 17:24:08	2025-06-07 22:00:08	2025-06-07 17:24:08
2137	289	2025-02-25 14:56:12	2025-02-25 18:51:12	2025-02-25 14:56:12
2138	526	2025-06-24 15:16:28	2025-06-24 16:17:28	2025-06-24 15:16:28
2139	941	2025-08-02 14:29:57	2025-08-02 18:37:57	2025-08-02 14:29:57
2140	947	2025-03-18 22:06:31	2025-03-19 00:02:31	2025-03-18 22:06:31
2141	69	2025-04-13 13:36:26	2025-04-13 16:31:26	2025-04-13 13:36:26
2142	785	2025-10-07 14:47:40	2025-10-07 18:48:40	2025-10-07 14:47:40
2143	832	2024-12-03 09:32:57	2024-12-03 13:28:57	2024-12-03 09:32:57
2144	499	2025-02-04 16:38:28	2025-02-04 18:56:28	2025-02-04 16:38:28
2145	766	2025-01-26 17:50:25	2025-01-26 19:08:25	2025-01-26 17:50:25
2146	289	2024-12-28 10:19:45	2024-12-28 12:24:45	2024-12-28 10:19:45
2147	573	2025-03-02 06:15:22	2025-03-02 11:51:22	2025-03-02 06:15:22
2148	185	2025-03-30 01:49:34	2025-03-30 07:44:34	2025-03-30 01:49:34
2149	10	2025-06-17 14:29:38	2025-06-17 16:33:38	2025-06-17 14:29:38
2150	17	2024-12-31 18:12:11	2024-12-31 19:38:11	2024-12-31 18:12:11
2151	41	2025-01-21 13:11:35	2025-01-21 14:34:35	2025-01-21 13:11:35
2152	727	2025-03-11 17:59:35	2025-03-11 20:34:35	2025-03-11 17:59:35
2153	741	2025-05-25 15:14:52	2025-05-25 19:24:52	2025-05-25 15:14:52
2154	713	2025-08-19 15:10:49	2025-08-19 17:00:49	2025-08-19 15:10:49
2155	763	2025-02-04 15:18:27	2025-02-04 20:49:27	2025-02-04 15:18:27
2156	44	2025-06-18 16:05:03	2025-06-18 17:47:03	2025-06-18 16:05:03
2157	841	2025-10-26 15:56:06	2025-10-26 21:29:06	2025-10-26 15:56:06
2158	94	2025-08-05 15:19:20	2025-08-05 18:46:20	2025-08-05 15:19:20
2159	628	2025-07-06 14:35:07	2025-07-06 15:55:07	2025-07-06 14:35:07
2160	17	2025-05-31 15:27:34	2025-05-31 16:36:34	2025-05-31 15:27:34
2161	333	2024-12-17 07:55:42	2024-12-17 12:25:42	2024-12-17 07:55:42
2162	770	2025-07-17 18:28:08	2025-07-17 23:28:08	2025-07-17 18:28:08
2163	490	2025-07-27 15:45:35	2025-07-27 20:46:35	2025-07-27 15:45:35
2164	819	2025-07-28 04:36:40	2025-07-28 09:31:40	2025-07-28 04:36:40
2165	674	2025-05-10 15:43:48	2025-05-10 16:57:48	2025-05-10 15:43:48
2166	310	2025-03-25 19:52:13	2025-03-25 23:41:13	2025-03-25 19:52:13
2167	295	2024-12-10 15:02:23	2024-12-10 20:00:23	2024-12-10 15:02:23
2168	912	2024-12-03 13:10:45	2024-12-03 16:59:45	2024-12-03 13:10:45
2169	324	2025-08-26 07:57:21	2025-08-26 10:16:21	2025-08-26 07:57:21
2170	799	2025-05-13 15:46:47	2025-05-13 20:48:47	2025-05-13 15:46:47
2171	414	2025-03-04 15:10:39	2025-03-04 20:19:39	2025-03-04 15:10:39
2172	376	2025-05-27 16:54:50	2025-05-27 18:01:50	2025-05-27 16:54:50
2173	80	2025-06-03 10:10:40	2025-06-03 13:09:40	2025-06-03 10:10:40
2174	762	2025-06-01 16:16:05	2025-06-01 18:25:05	2025-06-01 16:16:05
2175	878	2025-11-02 17:35:42	2025-11-02 22:36:42	2025-11-02 17:35:42
2176	310	2025-03-25 19:46:43	2025-03-25 21:12:43	2025-03-25 19:46:43
2177	333	2025-03-30 13:53:48	2025-03-30 16:24:48	2025-03-30 13:53:48
2178	869	2025-02-15 16:23:13	2025-02-15 17:37:13	2025-02-15 16:23:13
2179	815	2024-12-17 18:54:19	2024-12-17 21:19:19	2024-12-17 18:54:19
2180	564	2025-08-10 13:48:53	2025-08-10 16:53:53	2025-08-10 13:48:53
2181	117	2025-06-17 16:57:03	2025-06-17 20:42:03	2025-06-17 16:57:03
2182	530	2025-04-15 15:33:22	2025-04-15 19:47:22	2025-04-15 15:33:22
2183	66	2025-06-17 14:04:36	2025-06-17 15:42:36	2025-06-17 14:04:36
2184	944	2025-02-08 17:22:05	2025-02-08 18:50:05	2025-02-08 17:22:05
2185	879	2025-07-06 14:35:15	2025-07-06 19:14:15	2025-07-06 14:35:15
2186	322	2025-06-24 13:13:50	2025-06-24 17:48:50	2025-06-24 13:13:50
2187	966	2025-11-02 15:30:08	2025-11-02 18:11:08	2025-11-02 15:30:08
2188	681	2025-02-14 19:29:54	2025-02-14 23:10:54	2025-02-14 19:29:54
2189	816	2024-12-21 17:01:09	2024-12-21 20:47:09	2024-12-21 17:01:09
2190	251	2025-01-26 17:16:24	2025-01-26 19:14:24	2025-01-26 17:16:24
2191	276	2025-05-17 18:28:04	2025-05-17 21:32:04	2025-05-17 18:28:04
2192	456	2025-05-06 18:35:32	2025-05-06 19:35:32	2025-05-06 18:35:32
2193	470	2025-04-29 15:22:24	2025-04-29 19:29:24	2025-04-29 15:22:24
2194	42	2025-09-09 06:57:00	2025-09-09 11:22:00	2025-09-09 06:57:00
2195	425	2025-03-16 17:11:51	2025-03-16 18:32:51	2025-03-16 17:11:51
2196	583	2025-08-12 16:47:11	2025-08-12 21:31:11	2025-08-12 16:47:11
2197	501	2025-04-19 00:14:02	2025-04-19 02:27:02	2025-04-19 00:14:02
2198	170	2025-06-15 16:45:41	2025-06-15 18:29:41	2025-06-15 16:45:41
2199	710	2025-06-29 17:22:58	2025-06-29 23:06:58	2025-06-29 17:22:58
2200	430	2025-03-18 15:23:07	2025-03-18 17:14:07	2025-03-18 15:23:07
2201	886	2024-12-07 15:55:17	2024-12-07 17:30:17	2024-12-07 15:55:17
2202	83	2025-10-26 17:20:38	2025-10-26 20:48:38	2025-10-26 17:20:38
2203	826	2025-04-22 16:55:51	2025-04-22 20:51:51	2025-04-22 16:55:51
2204	165	2025-10-11 08:25:30	2025-10-11 12:13:30	2025-10-11 08:25:30
2205	734	2025-09-16 14:44:36	2025-09-16 20:08:36	2025-09-16 14:44:36
2206	209	2025-05-09 15:16:27	2025-05-09 21:02:27	2025-05-09 15:16:27
2207	864	2024-11-19 15:21:08	2024-11-19 18:27:08	2024-11-19 15:21:08
2208	669	2025-06-28 17:48:27	2025-06-28 19:50:27	2025-06-28 17:48:27
2209	43	2025-06-29 11:42:00	2025-06-29 17:24:00	2025-06-29 11:42:00
2210	867	2025-02-26 15:20:55	2025-02-26 18:45:55	2025-02-26 15:20:55
2211	618	2025-03-18 19:30:55	2025-03-18 23:22:55	2025-03-18 19:30:55
2212	257	2025-09-07 16:57:53	2025-09-07 19:44:53	2025-09-07 16:57:53
2213	652	2025-09-02 16:13:59	2025-09-02 17:17:59	2025-09-02 16:13:59
2214	100	2025-03-01 17:35:04	2025-03-01 19:43:04	2025-03-01 17:35:04
2215	456	2025-09-12 14:20:02	2025-09-12 16:25:02	2025-09-12 14:20:02
2216	539	2025-09-04 07:07:53	2025-09-04 09:26:53	2025-09-04 07:07:53
2217	324	2025-01-07 16:45:48	2025-01-07 22:32:48	2025-01-07 16:45:48
2218	119	2025-04-15 15:11:18	2025-04-15 20:15:18	2025-04-15 15:11:18
2219	916	2025-06-29 18:58:31	2025-06-29 21:02:31	2025-06-29 18:58:31
2220	295	2025-05-17 15:42:28	2025-05-17 20:12:28	2025-05-17 15:42:28
2221	830	2025-05-31 08:46:39	2025-05-31 13:06:39	2025-05-31 08:46:39
2222	840	2024-11-16 07:37:22	2024-11-16 12:54:22	2024-11-16 07:37:22
2223	789	2024-11-19 17:22:44	2024-11-19 20:02:44	2024-11-19 17:22:44
2224	14	2025-03-31 17:27:14	2025-03-31 20:17:14	2025-03-31 17:27:14
2225	218	2024-11-16 14:05:41	2024-11-16 19:59:41	2024-11-16 14:05:41
2226	521	2024-11-16 07:33:00	2024-11-16 13:26:00	2024-11-16 07:33:00
2227	814	2025-08-10 14:39:32	2025-08-10 19:53:32	2025-08-10 14:39:32
2228	362	2025-03-30 18:38:59	2025-03-30 20:35:59	2025-03-30 18:38:59
2229	750	2025-05-11 15:58:46	2025-05-11 18:08:46	2025-05-11 15:58:46
2230	334	2025-10-14 07:40:29	2025-10-14 10:51:29	2025-10-14 07:40:29
2231	468	2025-07-19 15:00:12	2025-07-19 16:22:12	2025-07-19 15:00:12
2232	294	2024-12-29 16:05:13	2024-12-29 20:38:13	2024-12-29 16:05:13
2233	151	2024-11-23 17:09:25	2024-11-23 22:22:25	2024-11-23 17:09:25
2234	249	2025-10-11 14:19:51	2025-10-11 16:26:51	2025-10-11 14:19:51
2235	499	2025-03-02 17:37:31	2025-03-02 19:29:31	2025-03-02 17:37:31
2236	767	2024-12-13 19:17:31	2024-12-13 20:26:31	2024-12-13 19:17:31
2237	118	2025-03-10 23:24:09	2025-03-11 02:20:09	2025-03-10 23:24:09
2238	67	2025-03-15 17:10:21	2025-03-15 22:53:21	2025-03-15 17:10:21
2239	544	2025-11-06 15:18:48	2025-11-06 17:50:48	2025-11-06 15:18:48
2240	116	2025-05-06 18:00:14	2025-05-06 23:59:14	2025-05-06 18:00:14
2241	498	2025-04-08 18:48:43	2025-04-08 20:37:43	2025-04-08 18:48:43
2242	992	2025-04-26 09:59:13	2025-04-26 14:55:13	2025-04-26 09:59:13
2243	924	2025-01-21 15:28:08	2025-01-21 18:51:08	2025-01-21 15:28:08
2244	188	2025-05-20 16:08:33	2025-05-20 17:40:33	2025-05-20 16:08:33
2245	73	2025-02-04 15:14:41	2025-02-04 17:39:41	2025-02-04 15:14:41
2246	897	2025-07-13 15:18:33	2025-07-13 18:13:33	2025-07-13 15:18:33
2247	751	2025-02-02 16:45:31	2025-02-02 22:10:31	2025-02-02 16:45:31
2248	129	2025-07-12 18:43:29	2025-07-12 21:38:29	2025-07-12 18:43:29
2249	931	2025-01-26 17:19:17	2025-01-26 22:48:17	2025-01-26 17:19:17
2250	17	2025-07-20 04:45:08	2025-07-20 09:53:08	2025-07-20 04:45:08
2251	53	2025-07-08 05:21:52	2025-07-08 07:12:52	2025-07-08 05:21:52
2252	965	2025-09-30 15:39:31	2025-09-30 21:11:31	2025-09-30 15:39:31
2253	623	2025-06-10 15:31:00	2025-06-10 21:19:00	2025-06-10 15:31:00
2254	375	2024-11-26 14:32:31	2024-11-26 17:15:31	2024-11-26 14:32:31
2255	739	2025-06-17 07:01:01	2025-06-17 09:06:01	2025-06-17 07:01:01
2256	7	2024-12-28 16:12:35	2024-12-28 20:55:35	2024-12-28 16:12:35
2257	554	2025-05-04 15:09:19	2025-05-04 16:45:19	2025-05-04 15:09:19
2258	466	2025-10-21 14:35:06	2025-10-21 19:43:06	2025-10-21 14:35:06
2259	268	2024-12-22 17:11:09	2024-12-22 19:06:09	2024-12-22 17:11:09
2260	33	2025-01-18 16:23:32	2025-01-18 17:40:32	2025-01-18 16:23:32
2261	248	2025-03-25 15:12:29	2025-03-25 19:41:29	2025-03-25 15:12:29
2262	698	2024-12-01 16:29:41	2024-12-01 19:29:41	2024-12-01 16:29:41
2263	70	2025-05-06 16:20:57	2025-05-06 18:26:57	2025-05-06 16:20:57
2264	929	2025-09-30 11:48:47	2025-09-30 14:50:47	2025-09-30 11:48:47
2265	118	2024-12-24 16:31:04	2024-12-24 21:21:04	2024-12-24 16:31:04
2266	670	2025-06-09 23:35:37	2025-06-10 05:05:37	2025-06-09 23:35:37
2267	851	2025-06-03 18:43:11	2025-06-03 21:10:11	2025-06-03 18:43:11
2268	895	2025-04-19 15:20:20	2025-04-19 18:42:20	2025-04-19 15:20:20
2269	908	2025-05-06 05:37:31	2025-05-06 07:06:31	2025-05-06 05:37:31
2270	739	2025-05-31 15:38:49	2025-05-31 20:07:49	2025-05-31 15:38:49
2271	283	2025-05-11 17:35:29	2025-05-11 19:31:29	2025-05-11 17:35:29
2272	418	2025-09-16 16:05:55	2025-09-16 17:11:55	2025-09-16 16:05:55
2273	661	2025-02-09 16:43:03	2025-02-09 19:32:03	2025-02-09 16:43:03
2274	430	2025-08-03 15:19:57	2025-08-03 18:49:57	2025-08-03 15:19:57
2275	552	2025-03-04 17:27:12	2025-03-04 20:20:12	2025-03-04 17:27:12
2276	871	2024-12-03 16:58:12	2024-12-03 22:42:12	2024-12-03 16:58:12
2277	415	2025-10-28 17:28:38	2025-10-28 22:40:38	2025-10-28 17:28:38
2278	749	2025-05-04 15:38:04	2025-05-04 18:19:04	2025-05-04 15:38:04
2279	521	2025-08-17 02:27:12	2025-08-17 04:38:12	2025-08-17 02:27:12
2280	914	2025-05-25 14:51:00	2025-05-25 19:29:00	2025-05-25 14:51:00
2281	452	2025-10-04 15:02:27	2025-10-04 18:25:27	2025-10-04 15:02:27
2282	279	2025-10-31 16:52:58	2025-10-31 20:48:58	2025-10-31 16:52:58
2283	872	2025-05-06 16:33:37	2025-05-06 19:32:37	2025-05-06 16:33:37
2284	401	2025-07-13 14:50:04	2025-07-13 20:45:04	2025-07-13 14:50:04
2285	512	2025-02-15 16:56:42	2025-02-15 20:52:42	2025-02-15 16:56:42
2286	323	2025-04-29 15:01:40	2025-04-29 18:25:40	2025-04-29 15:01:40
2287	718	2025-05-06 14:21:12	2025-05-06 18:39:12	2025-05-06 14:21:12
2288	415	2024-12-07 17:23:54	2024-12-07 21:01:54	2024-12-07 17:23:54
2289	391	2025-08-26 16:58:03	2025-08-26 18:56:03	2025-08-26 16:58:03
2290	617	2025-08-09 18:21:46	2025-08-09 23:43:46	2025-08-09 18:21:46
2291	418	2025-05-20 17:06:32	2025-05-20 20:24:32	2025-05-20 17:06:32
2292	577	2025-01-23 16:02:35	2025-01-23 20:30:35	2025-01-23 16:02:35
2293	328	2025-01-04 06:12:07	2025-01-04 10:54:07	2025-01-04 06:12:07
2294	900	2025-04-20 18:18:54	2025-04-20 21:22:54	2025-04-20 18:18:54
2295	909	2025-08-09 16:19:12	2025-08-09 21:38:12	2025-08-09 16:19:12
2296	59	2024-11-17 16:31:30	2024-11-17 19:56:30	2024-11-17 16:31:30
2297	996	2025-01-14 16:45:41	2025-01-14 21:57:41	2025-01-14 16:45:41
2298	65	2025-01-14 17:34:58	2025-01-14 19:18:58	2025-01-14 17:34:58
2299	957	2025-05-08 10:42:39	2025-05-08 12:12:39	2025-05-08 10:42:39
2300	439	2025-03-18 15:48:35	2025-03-18 17:44:35	2025-03-18 15:48:35
2301	242	2025-07-12 15:34:51	2025-07-12 21:20:51	2025-07-12 15:34:51
2302	607	2025-03-09 16:54:43	2025-03-09 20:44:43	2025-03-09 16:54:43
2303	255	2025-10-28 13:50:49	2025-10-28 16:50:49	2025-10-28 13:50:49
2304	102	2024-12-07 17:05:35	2024-12-07 22:17:35	2024-12-07 17:05:35
2305	797	2025-02-25 14:36:54	2025-02-25 16:21:54	2025-02-25 14:36:54
2306	507	2025-04-08 15:10:38	2025-04-08 17:22:38	2025-04-08 15:10:38
2307	414	2025-03-04 23:08:55	2025-03-05 01:56:55	2025-03-04 23:08:55
2308	751	2025-01-21 16:10:38	2025-01-21 20:04:38	2025-01-21 16:10:38
2309	642	2025-10-11 15:12:50	2025-10-11 16:57:50	2025-10-11 15:12:50
2310	584	2025-09-23 16:57:41	2025-09-23 22:07:41	2025-09-23 16:57:41
2311	485	2025-01-04 19:35:08	2025-01-04 22:02:08	2025-01-04 19:35:08
2312	447	2024-12-29 05:07:58	2024-12-29 10:34:58	2024-12-29 05:07:58
2313	912	2025-03-11 22:54:19	2025-03-12 03:37:19	2025-03-11 22:54:19
2314	767	2025-01-26 16:52:43	2025-01-26 21:21:43	2025-01-26 16:52:43
2315	796	2025-07-01 15:46:12	2025-07-01 19:25:12	2025-07-01 15:46:12
2316	903	2025-08-09 09:36:53	2025-08-09 13:28:53	2025-08-09 09:36:53
2317	197	2025-07-27 16:52:06	2025-07-27 19:20:06	2025-07-27 16:52:06
2318	885	2025-08-12 09:20:03	2025-08-12 13:46:03	2025-08-12 09:20:03
2319	710	2025-05-20 13:25:00	2025-05-20 19:13:00	2025-05-20 13:25:00
2320	37	2025-08-30 16:31:22	2025-08-30 19:46:22	2025-08-30 16:31:22
2321	459	2024-12-22 18:59:19	2024-12-23 00:11:19	2024-12-22 18:59:19
2322	462	2025-03-30 14:30:38	2025-03-30 19:12:38	2025-03-30 14:30:38
2323	960	2025-05-20 17:26:42	2025-05-20 22:53:42	2025-05-20 17:26:42
2324	646	2025-06-07 18:30:14	2025-06-07 21:08:14	2025-06-07 18:30:14
2325	53	2025-07-06 14:08:19	2025-07-06 19:21:19	2025-07-06 14:08:19
2326	330	2025-04-13 18:57:51	2025-04-13 22:35:51	2025-04-13 18:57:51
2327	296	2025-09-27 15:46:30	2025-09-27 17:09:30	2025-09-27 15:46:30
2328	496	2025-09-21 13:45:05	2025-09-21 17:37:05	2025-09-21 13:45:05
2329	14	2025-08-16 14:41:11	2025-08-16 19:53:11	2025-08-16 14:41:11
2330	494	2025-07-13 14:08:31	2025-07-13 17:18:31	2025-07-13 14:08:31
2331	990	2025-10-28 15:11:09	2025-10-28 16:23:09	2025-10-28 15:11:09
2332	142	2025-09-20 16:07:21	2025-09-20 21:39:21	2025-09-20 16:07:21
2333	901	2025-03-30 17:51:11	2025-03-30 21:11:11	2025-03-30 17:51:11
2334	621	2025-07-01 15:46:53	2025-07-01 20:55:53	2025-07-01 15:46:53
2335	69	2025-03-02 17:37:47	2025-03-02 21:57:47	2025-03-02 17:37:47
2336	929	2025-09-16 16:25:41	2025-09-16 18:07:41	2025-09-16 16:25:41
2337	58	2025-09-13 05:10:10	2025-09-13 06:55:10	2025-09-13 05:10:10
2338	878	2024-12-10 18:07:04	2024-12-10 21:47:04	2024-12-10 18:07:04
2339	888	2025-07-15 15:19:50	2025-07-15 18:24:50	2025-07-15 15:19:50
2340	948	2025-10-18 15:34:10	2025-10-18 17:18:10	2025-10-18 15:34:10
2341	569	2025-04-22 06:27:52	2025-04-22 09:27:52	2025-04-22 06:27:52
2342	37	2025-04-22 16:39:00	2025-04-22 18:55:00	2025-04-22 16:39:00
2343	149	2025-10-19 17:04:07	2025-10-19 22:07:07	2025-10-19 17:04:07
2344	645	2025-04-04 17:09:52	2025-04-04 21:19:52	2025-04-04 17:09:52
2345	527	2024-12-08 19:39:26	2024-12-08 22:27:26	2024-12-08 19:39:26
2346	73	2024-11-24 07:11:35	2024-11-24 13:05:35	2024-11-24 07:11:35
2347	919	2024-12-14 16:40:23	2024-12-14 18:46:23	2024-12-14 16:40:23
2348	747	2025-06-10 16:55:26	2025-06-10 22:30:26	2025-06-10 16:55:26
2349	622	2025-01-12 15:25:40	2025-01-12 20:54:40	2025-01-12 15:25:40
2350	771	2025-09-09 15:15:46	2025-09-09 19:11:46	2025-09-09 15:15:46
2351	496	2025-09-14 02:46:35	2025-09-14 06:24:35	2025-09-14 02:46:35
2352	749	2025-05-31 17:42:26	2025-05-31 23:27:26	2025-05-31 17:42:26
2353	161	2025-08-17 16:52:54	2025-08-17 21:48:54	2025-08-17 16:52:54
2354	602	2025-10-28 17:56:30	2025-10-28 23:03:30	2025-10-28 17:56:30
2355	949	2025-03-02 19:01:06	2025-03-03 00:32:06	2025-03-02 19:01:06
2356	151	2025-01-19 16:18:40	2025-01-19 18:53:40	2025-01-19 16:18:40
2357	154	2025-08-31 18:59:14	2025-08-31 23:09:14	2025-08-31 18:59:14
2358	512	2025-09-21 16:28:33	2025-09-21 19:51:33	2025-09-21 16:28:33
2359	342	2025-04-15 05:50:16	2025-04-15 08:36:16	2025-04-15 05:50:16
2360	45	2025-05-18 18:19:50	2025-05-18 22:29:50	2025-05-18 18:19:50
2361	910	2025-10-21 15:47:56	2025-10-21 21:06:56	2025-10-21 15:47:56
2362	338	2025-09-27 18:30:56	2025-09-28 00:08:56	2025-09-27 18:30:56
2363	996	2025-08-05 10:08:09	2025-08-05 13:20:09	2025-08-05 10:08:09
2364	25	2025-01-18 14:57:14	2025-01-18 16:43:14	2025-01-18 14:57:14
2365	839	2025-11-01 15:51:49	2025-11-01 19:26:49	2025-11-01 15:51:49
2366	772	2025-09-13 14:25:10	2025-09-13 15:48:10	2025-09-13 14:25:10
2367	595	2025-06-22 15:10:16	2025-06-22 20:34:16	2025-06-22 15:10:16
2368	743	2025-03-16 16:41:32	2025-03-16 19:04:32	2025-03-16 16:41:32
2369	168	2024-11-16 17:45:15	2024-11-16 22:09:15	2024-11-16 17:45:15
2370	991	2025-01-25 15:11:31	2025-01-25 19:45:31	2025-01-25 15:11:31
2371	478	2025-05-13 18:51:24	2025-05-13 21:27:24	2025-05-13 18:51:24
2372	211	2025-03-01 08:01:16	2025-03-01 10:26:16	2025-03-01 08:01:16
2373	100	2025-08-24 14:23:39	2025-08-24 17:31:39	2025-08-24 14:23:39
2374	487	2025-01-19 08:51:38	2025-01-19 13:01:38	2025-01-19 08:51:38
2375	883	2025-02-08 19:47:30	2025-02-09 00:22:30	2025-02-08 19:47:30
2376	301	2024-11-19 15:54:10	2024-11-19 19:49:10	2024-11-19 15:54:10
2377	854	2025-06-24 15:16:18	2025-06-24 16:47:18	2025-06-24 15:16:18
2378	792	2024-11-19 08:59:12	2024-11-19 11:27:12	2024-11-19 08:59:12
2379	507	2025-09-20 09:22:19	2025-09-20 14:24:19	2025-09-20 09:22:19
2380	157	2025-09-03 11:26:59	2025-09-03 13:14:59	2025-09-03 11:26:59
2381	679	2025-10-21 16:37:26	2025-10-21 18:31:26	2025-10-21 16:37:26
2382	707	2025-11-01 07:29:51	2025-11-01 11:11:51	2025-11-01 07:29:51
2383	853	2025-09-01 15:16:38	2025-09-01 20:05:38	2025-09-01 15:16:38
2384	998	2025-06-03 15:46:59	2025-06-03 18:40:59	2025-06-03 15:46:59
2385	364	2024-11-12 17:22:36	2024-11-12 19:25:36	2024-11-12 17:22:36
2386	59	2024-12-08 19:01:17	2024-12-08 20:07:17	2024-12-08 19:01:17
2387	825	2025-08-23 15:20:38	2025-08-23 17:50:38	2025-08-23 15:20:38
2388	540	2025-05-11 16:51:13	2025-05-11 22:12:13	2025-05-11 16:51:13
2389	81	2024-11-16 11:00:31	2024-11-16 16:28:31	2024-11-16 11:00:31
2390	506	2025-07-01 14:31:38	2025-07-01 19:07:38	2025-07-01 14:31:38
2391	913	2025-03-29 06:55:16	2025-03-29 07:58:16	2025-03-29 06:55:16
2392	895	2025-03-18 17:33:58	2025-03-18 23:06:58	2025-03-18 17:33:58
2393	328	2025-08-30 15:24:48	2025-08-30 20:26:48	2025-08-30 15:24:48
2394	55	2025-04-08 15:52:13	2025-04-08 19:35:13	2025-04-08 15:52:13
2395	862	2025-08-05 14:01:09	2025-08-05 18:21:09	2025-08-05 14:01:09
2396	552	2024-12-24 17:15:29	2024-12-24 18:42:29	2024-12-24 17:15:29
2397	751	2025-04-06 18:27:04	2025-04-06 23:36:04	2025-04-06 18:27:04
2398	118	2025-07-06 07:43:34	2025-07-06 13:01:34	2025-07-06 07:43:34
2399	366	2025-09-30 14:56:32	2025-09-30 16:55:32	2025-09-30 14:56:32
2400	409	2025-10-14 14:46:31	2025-10-14 17:15:31	2025-10-14 14:46:31
2401	271	2025-03-11 05:11:08	2025-03-11 07:44:08	2025-03-11 05:11:08
2402	30	2024-11-26 17:14:31	2024-11-26 22:53:31	2024-11-26 17:14:31
2403	718	2025-09-13 10:19:05	2025-09-13 13:34:05	2025-09-13 10:19:05
2404	460	2025-08-16 08:22:37	2025-08-16 13:42:37	2025-08-16 08:22:37
2405	142	2025-02-02 17:39:41	2025-02-02 19:45:41	2025-02-02 17:39:41
2406	489	2025-09-07 06:57:24	2025-09-07 08:20:24	2025-09-07 06:57:24
2407	671	2024-11-26 17:45:18	2024-11-26 21:21:18	2024-11-26 17:45:18
2408	888	2025-01-28 12:35:32	2025-01-28 16:12:32	2025-01-28 12:35:32
2409	812	2025-07-07 16:01:32	2025-07-07 21:10:32	2025-07-07 16:01:32
2410	272	2025-01-26 16:26:13	2025-01-26 18:08:13	2025-01-26 16:26:13
2411	868	2025-09-14 18:06:49	2025-09-14 19:22:49	2025-09-14 18:06:49
2412	938	2025-02-24 17:32:32	2025-02-24 21:28:32	2025-02-24 17:32:32
2413	888	2025-04-27 16:42:51	2025-04-27 20:20:51	2025-04-27 16:42:51
2414	443	2025-10-28 19:37:11	2025-10-28 21:22:11	2025-10-28 19:37:11
2415	167	2025-04-01 17:43:14	2025-04-01 23:17:14	2025-04-01 17:43:14
2416	167	2024-11-09 17:30:23	2024-11-09 20:14:23	2024-11-09 17:30:23
2417	126	2025-05-25 16:29:06	2025-05-25 19:15:06	2025-05-25 16:29:06
2418	65	2025-05-25 16:30:26	2025-05-25 17:32:26	2025-05-25 16:30:26
2419	173	2025-06-21 15:57:04	2025-06-21 17:44:04	2025-06-21 15:57:04
2420	689	2025-05-31 18:20:08	2025-05-31 21:11:08	2025-05-31 18:20:08
2421	404	2025-08-03 16:10:05	2025-08-03 20:08:05	2025-08-03 16:10:05
2422	652	2025-05-04 14:13:20	2025-05-04 18:04:20	2025-05-04 14:13:20
2423	921	2025-03-02 17:18:48	2025-03-02 21:37:48	2025-03-02 17:18:48
2424	455	2025-01-11 17:42:09	2025-01-11 22:44:09	2025-01-11 17:42:09
2425	287	2024-11-23 17:14:11	2024-11-23 19:48:11	2024-11-23 17:14:11
2426	233	2025-01-14 15:53:32	2025-01-14 21:32:32	2025-01-14 15:53:32
2427	513	2025-07-01 15:41:13	2025-07-01 20:39:13	2025-07-01 15:41:13
2428	876	2025-01-12 19:43:05	2025-01-13 00:10:05	2025-01-12 19:43:05
2429	7	2024-12-31 16:18:33	2024-12-31 17:22:33	2024-12-31 16:18:33
2430	52	2024-12-03 19:12:38	2024-12-04 00:28:38	2024-12-03 19:12:38
2431	441	2025-10-11 15:34:44	2025-10-11 21:30:44	2025-10-11 15:34:44
2432	292	2025-02-24 06:59:42	2025-02-24 12:02:42	2025-02-24 06:59:42
2433	99	2025-06-21 14:15:27	2025-06-21 17:34:27	2025-06-21 14:15:27
2434	451	2025-06-08 16:32:26	2025-06-08 20:29:26	2025-06-08 16:32:26
2435	755	2025-09-16 11:12:37	2025-09-16 15:08:37	2025-09-16 11:12:37
2436	286	2025-08-11 14:53:53	2025-08-11 16:26:53	2025-08-11 14:53:53
2437	359	2025-01-25 09:44:59	2025-01-25 12:08:59	2025-01-25 09:44:59
2438	214	2025-05-20 18:29:18	2025-05-20 23:16:18	2025-05-20 18:29:18
2439	993	2025-02-01 16:31:02	2025-02-01 22:02:02	2025-02-01 16:31:02
2440	925	2024-12-29 03:11:14	2024-12-29 09:08:14	2024-12-29 03:11:14
2441	307	2025-11-02 21:40:58	2025-11-03 02:32:58	2025-11-02 21:40:58
2442	172	2025-03-01 12:24:36	2025-03-01 16:01:36	2025-03-01 12:24:36
2443	315	2025-09-27 05:12:06	2025-09-27 10:53:06	2025-09-27 05:12:06
2444	694	2024-12-18 10:30:51	2024-12-18 13:13:51	2024-12-18 10:30:51
2445	985	2025-07-29 14:52:44	2025-07-29 16:50:44	2025-07-29 14:52:44
2446	847	2025-01-04 15:39:20	2025-01-04 20:03:20	2025-01-04 15:39:20
2447	552	2025-01-19 16:59:27	2025-01-19 18:43:27	2025-01-19 16:59:27
2448	647	2025-05-17 17:38:13	2025-05-17 21:24:13	2025-05-17 17:38:13
2449	627	2024-12-07 17:03:05	2024-12-07 18:15:05	2024-12-07 17:03:05
2450	852	2025-10-25 18:16:36	2025-10-25 21:36:36	2025-10-25 18:16:36
2451	518	2025-04-12 15:15:43	2025-04-12 20:53:43	2025-04-12 15:15:43
2452	481	2025-11-01 17:47:25	2025-11-01 20:17:25	2025-11-01 17:47:25
2453	351	2025-02-22 16:17:35	2025-02-22 22:16:35	2025-02-22 16:17:35
2454	619	2024-11-30 16:43:41	2024-11-30 18:46:41	2024-11-30 16:43:41
2455	392	2025-04-26 14:29:43	2025-04-26 16:52:43	2025-04-26 14:29:43
2456	889	2025-08-03 14:57:59	2025-08-03 20:56:59	2025-08-03 14:57:59
2457	98	2025-02-23 16:38:33	2025-02-23 17:52:33	2025-02-23 16:38:33
2458	513	2025-08-05 16:55:29	2025-08-05 18:33:29	2025-08-05 16:55:29
2459	769	2025-03-04 17:58:09	2025-03-04 22:13:09	2025-03-04 17:58:09
2460	942	2025-03-30 16:58:12	2025-03-30 18:44:12	2025-03-30 16:58:12
2461	145	2025-09-23 16:56:35	2025-09-23 22:04:35	2025-09-23 16:56:35
2462	138	2024-12-31 16:25:13	2024-12-31 18:03:13	2024-12-31 16:25:13
2463	497	2025-05-13 16:58:09	2025-05-13 21:13:09	2025-05-13 16:58:09
2464	912	2025-04-05 16:40:26	2025-04-05 21:43:26	2025-04-05 16:40:26
2465	980	2025-10-21 17:22:50	2025-10-21 19:42:50	2025-10-21 17:22:50
2466	56	2025-09-09 16:11:57	2025-09-09 17:15:57	2025-09-09 16:11:57
2467	798	2025-07-27 15:37:09	2025-07-27 21:09:09	2025-07-27 15:37:09
2468	499	2024-12-24 13:28:37	2024-12-24 19:09:37	2024-12-24 13:28:37
2469	525	2025-09-02 15:40:33	2025-09-02 18:28:33	2025-09-02 15:40:33
2470	156	2025-03-18 18:56:35	2025-03-19 00:14:35	2025-03-18 18:56:35
2471	426	2024-12-10 14:32:12	2024-12-10 19:05:12	2024-12-10 14:32:12
2472	783	2025-07-05 05:02:37	2025-07-05 08:42:37	2025-07-05 05:02:37
2473	191	2025-09-20 14:19:39	2025-09-20 19:47:39	2025-09-20 14:19:39
2474	851	2025-04-29 15:43:14	2025-04-29 16:45:14	2025-04-29 15:43:14
2475	875	2025-09-28 16:37:40	2025-09-28 22:16:40	2025-09-28 16:37:40
2476	834	2024-11-26 10:59:48	2024-11-26 12:25:48	2024-11-26 10:59:48
2477	762	2025-05-24 17:26:20	2025-05-24 18:33:20	2025-05-24 17:26:20
2478	509	2025-01-01 18:15:48	2025-01-01 20:45:48	2025-01-01 18:15:48
2479	777	2025-06-24 14:42:10	2025-06-24 17:58:10	2025-06-24 14:42:10
2480	443	2024-12-29 13:22:16	2024-12-29 19:14:16	2024-12-29 13:22:16
2481	339	2025-07-06 16:56:16	2025-07-06 20:43:16	2025-07-06 16:56:16
2482	626	2025-06-21 04:03:07	2025-06-21 10:02:07	2025-06-21 04:03:07
2483	840	2025-02-22 16:44:20	2025-02-22 19:12:20	2025-02-22 16:44:20
2484	897	2025-04-19 16:51:25	2025-04-19 20:11:25	2025-04-19 16:51:25
2485	8	2025-05-25 14:30:47	2025-05-25 17:39:47	2025-05-25 14:30:47
2486	477	2025-07-06 07:09:29	2025-07-06 12:08:29	2025-07-06 07:09:29
2487	28	2025-04-01 15:41:37	2025-04-01 21:08:37	2025-04-01 15:41:37
2488	758	2025-03-04 18:46:04	2025-03-04 20:00:04	2025-03-04 18:46:04
2489	769	2025-03-11 15:35:34	2025-03-11 21:24:34	2025-03-11 15:35:34
2490	342	2024-11-21 15:47:18	2024-11-21 21:07:18	2024-11-21 15:47:18
2491	629	2025-10-04 15:21:01	2025-10-04 20:20:01	2025-10-04 15:21:01
2492	477	2025-07-01 14:40:09	2025-07-01 16:40:09	2025-07-01 14:40:09
2493	263	2025-08-19 15:55:49	2025-08-19 19:54:49	2025-08-19 15:55:49
2494	645	2024-11-24 15:46:56	2024-11-24 19:27:56	2024-11-24 15:46:56
2495	323	2024-11-19 07:25:12	2024-11-19 09:04:12	2024-11-19 07:25:12
2496	199	2025-08-12 18:24:14	2025-08-12 23:06:14	2025-08-12 18:24:14
2497	945	2025-04-12 15:12:25	2025-04-12 19:11:25	2025-04-12 15:12:25
2498	544	2024-12-10 08:32:09	2024-12-10 10:22:09	2024-12-10 08:32:09
2499	301	2025-02-22 15:08:18	2025-02-22 20:28:18	2025-02-22 15:08:18
2500	963	2025-08-16 14:49:39	2025-08-16 15:57:39	2025-08-16 14:49:39
2501	541	2025-09-20 16:47:21	2025-09-20 22:04:21	2025-09-20 16:47:21
2502	167	2025-10-28 15:19:08	2025-10-28 16:44:08	2025-10-28 15:19:08
2503	855	2025-01-12 15:18:11	2025-01-12 19:06:11	2025-01-12 15:18:11
2504	716	2025-01-12 19:14:37	2025-01-12 21:15:37	2025-01-12 19:14:37
2505	941	2025-05-25 17:49:25	2025-05-25 20:44:25	2025-05-25 17:49:25
2506	105	2025-09-06 11:05:26	2025-09-06 12:27:26	2025-09-06 11:05:26
2507	922	2025-10-19 16:39:22	2025-10-19 21:42:22	2025-10-19 16:39:22
2508	721	2024-11-26 17:53:25	2024-11-26 21:50:25	2024-11-26 17:53:25
2509	375	2025-01-18 15:14:55	2025-01-18 17:28:55	2025-01-18 15:14:55
2510	880	2025-03-04 02:51:08	2025-03-04 07:41:08	2025-03-04 02:51:08
2511	541	2025-06-22 16:25:56	2025-06-22 18:19:56	2025-06-22 16:25:56
2512	645	2025-06-22 15:30:29	2025-06-22 18:26:29	2025-06-22 15:30:29
2513	433	2025-02-25 03:31:48	2025-02-25 05:01:48	2025-02-25 03:31:48
2514	773	2025-09-08 16:26:40	2025-09-08 21:07:40	2025-09-08 16:26:40
2515	11	2025-03-25 17:07:46	2025-03-25 19:06:46	2025-03-25 17:07:46
2516	250	2025-07-19 10:42:47	2025-07-19 16:32:47	2025-07-19 10:42:47
2517	63	2025-09-16 13:45:52	2025-09-16 15:40:52	2025-09-16 13:45:52
2518	448	2025-06-29 15:37:18	2025-06-29 20:52:18	2025-06-29 15:37:18
2519	294	2025-09-23 15:24:19	2025-09-23 16:50:19	2025-09-23 15:24:19
2520	68	2024-12-24 18:56:06	2024-12-24 21:56:06	2024-12-24 18:56:06
2521	173	2025-04-28 12:39:26	2025-04-28 16:25:26	2025-04-28 12:39:26
2522	168	2025-02-25 14:16:23	2025-02-25 17:23:23	2025-02-25 14:16:23
2523	387	2024-11-09 15:23:28	2024-11-09 19:58:28	2024-11-09 15:23:28
2524	348	2025-07-06 14:23:49	2025-07-06 19:08:49	2025-07-06 14:23:49
2525	534	2025-08-12 15:51:43	2025-08-12 19:25:43	2025-08-12 15:51:43
2526	528	2025-01-19 04:56:03	2025-01-19 09:48:03	2025-01-19 04:56:03
2527	217	2025-06-22 15:52:17	2025-06-22 18:42:17	2025-06-22 15:52:17
2528	335	2024-12-15 16:25:02	2024-12-15 17:46:02	2024-12-15 16:25:02
2529	513	2025-02-16 15:54:50	2025-02-16 18:42:50	2025-02-16 15:54:50
2530	766	2025-04-01 15:25:27	2025-04-01 16:39:27	2025-04-01 15:25:27
2531	536	2025-10-26 19:56:52	2025-10-26 23:38:52	2025-10-26 19:56:52
2532	249	2025-03-03 23:07:56	2025-03-04 01:16:56	2025-03-03 23:07:56
2533	46	2025-05-31 13:00:11	2025-05-31 17:42:11	2025-05-31 13:00:11
2534	623	2025-08-02 15:56:45	2025-08-02 20:42:45	2025-08-02 15:56:45
2535	134	2025-08-02 15:17:07	2025-08-02 20:58:07	2025-08-02 15:17:07
2536	121	2025-06-10 15:14:23	2025-06-10 17:26:23	2025-06-10 15:14:23
2537	646	2025-05-24 13:31:37	2025-05-24 15:57:37	2025-05-24 13:31:37
2538	240	2025-10-15 16:44:06	2025-10-15 22:13:06	2025-10-15 16:44:06
2539	768	2024-12-03 15:44:51	2024-12-03 18:23:51	2024-12-03 15:44:51
2540	872	2025-06-08 06:31:16	2025-06-08 12:03:16	2025-06-08 06:31:16
2541	367	2025-10-28 15:28:11	2025-10-28 21:00:11	2025-10-28 15:28:11
2542	367	2025-02-22 17:55:55	2025-02-22 20:31:55	2025-02-22 17:55:55
2543	341	2025-02-25 15:17:58	2025-02-25 19:45:58	2025-02-25 15:17:58
2544	412	2025-09-20 14:48:00	2025-09-20 16:46:00	2025-09-20 14:48:00
2545	314	2025-03-18 17:27:06	2025-03-18 21:07:06	2025-03-18 17:27:06
2546	55	2025-01-31 16:18:26	2025-01-31 21:36:26	2025-01-31 16:18:26
2547	274	2025-01-11 15:11:39	2025-01-11 19:17:39	2025-01-11 15:11:39
2548	263	2025-05-20 04:46:55	2025-05-20 09:49:55	2025-05-20 04:46:55
2549	591	2025-06-28 14:08:34	2025-06-28 17:35:34	2025-06-28 14:08:34
2550	524	2025-09-07 18:20:58	2025-09-07 23:47:58	2025-09-07 18:20:58
2551	88	2025-06-15 14:08:29	2025-06-15 15:42:29	2025-06-15 14:08:29
2552	83	2025-08-12 07:52:19	2025-08-12 10:06:19	2025-08-12 07:52:19
2553	369	2025-05-27 18:16:28	2025-05-27 22:13:28	2025-05-27 18:16:28
2554	663	2025-01-28 16:19:16	2025-01-28 18:13:16	2025-01-28 16:19:16
2555	254	2025-02-22 16:27:44	2025-02-22 21:56:44	2025-02-22 16:27:44
2556	949	2025-01-12 21:48:09	2025-01-13 02:35:09	2025-01-12 21:48:09
2557	280	2025-11-02 16:40:27	2025-11-02 17:55:27	2025-11-02 16:40:27
2558	433	2025-03-29 09:00:35	2025-03-29 12:36:35	2025-03-29 09:00:35
2559	707	2025-01-30 15:04:57	2025-01-30 21:00:57	2025-01-30 15:04:57
2560	870	2025-02-18 11:34:28	2025-02-18 14:05:28	2025-02-18 11:34:28
2561	816	2025-01-28 18:17:41	2025-01-28 23:39:41	2025-01-28 18:17:41
2562	962	2025-01-12 05:26:32	2025-01-12 10:12:32	2025-01-12 05:26:32
2563	965	2025-02-08 15:22:07	2025-02-08 16:44:07	2025-02-08 15:22:07
2564	76	2025-04-19 04:35:24	2025-04-19 08:10:24	2025-04-19 04:35:24
2565	415	2025-03-25 17:51:04	2025-03-25 21:45:04	2025-03-25 17:51:04
2566	432	2025-04-06 14:09:26	2025-04-06 16:57:26	2025-04-06 14:09:26
2567	617	2025-05-20 14:10:16	2025-05-20 19:17:16	2025-05-20 14:10:16
2568	642	2025-07-13 17:42:40	2025-07-13 22:40:40	2025-07-13 17:42:40
2569	829	2025-09-09 18:06:54	2025-09-09 23:01:54	2025-09-09 18:06:54
2570	152	2025-10-05 17:24:46	2025-10-05 21:41:46	2025-10-05 17:24:46
2571	150	2025-01-04 18:17:30	2025-01-04 23:12:30	2025-01-04 18:17:30
2572	991	2025-10-09 16:11:44	2025-10-09 20:39:44	2025-10-09 16:11:44
2573	938	2025-08-02 16:48:21	2025-08-02 20:46:21	2025-08-02 16:48:21
2574	732	2025-04-26 14:17:02	2025-04-26 16:11:02	2025-04-26 14:17:02
2575	225	2025-05-04 14:34:13	2025-05-04 17:02:13	2025-05-04 14:34:13
2576	893	2025-10-14 15:17:54	2025-10-14 16:48:54	2025-10-14 15:17:54
2577	610	2025-07-18 09:21:37	2025-07-18 11:27:37	2025-07-18 09:21:37
2578	63	2025-04-19 18:30:40	2025-04-20 00:26:40	2025-04-19 18:30:40
2579	830	2025-05-20 14:46:15	2025-05-20 19:54:15	2025-05-20 14:46:15
2580	139	2025-01-28 17:55:00	2025-01-28 23:07:00	2025-01-28 17:55:00
2581	111	2025-03-29 11:05:41	2025-03-29 13:39:41	2025-03-29 11:05:41
2582	976	2025-08-12 15:50:37	2025-08-12 18:36:37	2025-08-12 15:50:37
2583	222	2025-09-02 17:34:49	2025-09-02 19:42:49	2025-09-02 17:34:49
2584	429	2025-10-14 16:49:01	2025-10-14 19:37:01	2025-10-14 16:49:01
2585	739	2025-08-02 16:34:26	2025-08-02 21:45:26	2025-08-02 16:34:26
2586	658	2025-10-25 16:32:57	2025-10-25 19:44:57	2025-10-25 16:32:57
2587	647	2024-12-19 15:29:36	2024-12-19 21:28:36	2024-12-19 15:29:36
2588	268	2025-05-17 15:37:48	2025-05-17 17:55:48	2025-05-17 15:37:48
2589	860	2025-01-26 18:33:36	2025-01-27 00:11:36	2025-01-26 18:33:36
2590	811	2025-03-25 17:15:57	2025-03-25 20:52:57	2025-03-25 17:15:57
2591	95	2025-03-04 17:14:26	2025-03-04 19:59:26	2025-03-04 17:14:26
2592	75	2025-07-13 12:20:00	2025-07-13 16:46:00	2025-07-13 12:20:00
2593	292	2024-12-07 02:16:28	2024-12-07 03:26:28	2024-12-07 02:16:28
2594	240	2025-09-16 16:10:14	2025-09-16 21:48:14	2025-09-16 16:10:14
2595	170	2025-07-13 18:30:39	2025-07-13 22:24:39	2025-07-13 18:30:39
2596	198	2025-02-09 06:03:52	2025-02-09 07:26:52	2025-02-09 06:03:52
2597	802	2025-09-07 16:53:58	2025-09-07 19:15:58	2025-09-07 16:53:58
2598	27	2025-04-25 16:46:39	2025-04-25 22:33:39	2025-04-25 16:46:39
2599	416	2025-04-08 14:02:25	2025-04-08 18:52:25	2025-04-08 14:02:25
2600	479	2025-06-22 16:53:30	2025-06-22 22:50:30	2025-06-22 16:53:30
2601	315	2025-06-15 15:35:19	2025-06-15 20:27:19	2025-06-15 15:35:19
2602	143	2024-12-01 18:44:42	2024-12-01 21:12:42	2024-12-01 18:44:42
2603	94	2025-01-05 19:43:17	2025-01-05 23:13:17	2025-01-05 19:43:17
2604	878	2025-05-31 19:58:34	2025-05-31 22:17:34	2025-05-31 19:58:34
2605	813	2025-06-20 22:31:04	2025-06-21 00:43:04	2025-06-20 22:31:04
2606	11	2025-06-24 09:17:45	2025-06-24 12:36:45	2025-06-24 09:17:45
2607	878	2025-08-31 16:25:23	2025-08-31 19:12:23	2025-08-31 16:25:23
2608	580	2024-12-07 15:41:59	2024-12-07 19:25:59	2024-12-07 15:41:59
2609	234	2025-03-22 18:43:44	2025-03-23 00:32:44	2025-03-22 18:43:44
2610	947	2024-12-17 15:23:01	2024-12-17 19:08:01	2024-12-17 15:23:01
2611	366	2025-06-21 17:17:41	2025-06-21 19:46:41	2025-06-21 17:17:41
2612	199	2024-12-28 15:01:51	2024-12-28 20:56:51	2024-12-28 15:01:51
2613	779	2025-01-04 16:02:27	2025-01-04 21:49:27	2025-01-04 16:02:27
2614	557	2025-03-02 12:23:30	2025-03-02 18:05:30	2025-03-02 12:23:30
2615	879	2025-04-15 18:16:50	2025-04-15 21:28:50	2025-04-15 18:16:50
2616	38	2025-05-13 17:47:55	2025-05-13 20:53:55	2025-05-13 17:47:55
2617	995	2025-11-02 16:01:01	2025-11-02 17:52:01	2025-11-02 16:01:01
2618	371	2025-02-09 10:15:47	2025-02-09 16:11:47	2025-02-09 10:15:47
2619	922	2025-10-04 14:42:51	2025-10-04 20:20:51	2025-10-04 14:42:51
2620	435	2025-03-14 18:13:24	2025-03-14 21:53:24	2025-03-14 18:13:24
2621	754	2025-04-12 03:09:44	2025-04-12 04:15:44	2025-04-12 03:09:44
2622	903	2025-09-16 04:40:50	2025-09-16 09:05:50	2025-09-16 04:40:50
2623	357	2025-05-31 10:51:29	2025-05-31 15:00:29	2025-05-31 10:51:29
2624	328	2025-06-29 16:41:22	2025-06-29 18:14:22	2025-06-29 16:41:22
2625	432	2025-06-29 10:33:14	2025-06-29 13:46:14	2025-06-29 10:33:14
2626	924	2025-01-07 15:35:41	2025-01-07 17:56:41	2025-01-07 15:35:41
2627	807	2025-07-22 08:40:52	2025-07-22 10:38:52	2025-07-22 08:40:52
2628	980	2025-09-28 16:09:40	2025-09-28 20:16:40	2025-09-28 16:09:40
2629	424	2025-02-02 15:45:25	2025-02-02 16:50:25	2025-02-02 15:45:25
2630	597	2025-05-11 09:39:40	2025-05-11 11:26:40	2025-05-11 09:39:40
2631	433	2025-01-28 06:36:21	2025-01-28 08:09:21	2025-01-28 06:36:21
2632	374	2025-02-25 17:40:45	2025-02-25 21:28:45	2025-02-25 17:40:45
2633	404	2025-03-18 00:22:56	2025-03-18 04:33:56	2025-03-18 00:22:56
2634	70	2025-05-03 15:28:30	2025-05-03 20:15:30	2025-05-03 15:28:30
2635	481	2024-11-30 13:18:03	2024-11-30 15:29:03	2024-11-30 13:18:03
2636	969	2025-01-05 15:30:41	2025-01-05 16:56:41	2025-01-05 15:30:41
2637	961	2025-01-05 07:03:18	2025-01-05 10:18:18	2025-01-05 07:03:18
2638	675	2025-09-22 04:07:19	2025-09-22 05:27:19	2025-09-22 04:07:19
2639	744	2025-05-04 14:01:38	2025-05-04 17:46:38	2025-05-04 14:01:38
2640	39	2025-07-19 15:38:37	2025-07-19 20:55:37	2025-07-19 15:38:37
2641	292	2025-01-11 04:27:44	2025-01-11 06:38:44	2025-01-11 04:27:44
2642	554	2025-03-25 15:12:28	2025-03-25 16:47:28	2025-03-25 15:12:28
2643	604	2025-04-01 19:48:31	2025-04-02 00:18:31	2025-04-01 19:48:31
2644	823	2025-09-16 15:55:45	2025-09-16 21:48:45	2025-09-16 15:55:45
2645	550	2025-03-01 18:33:31	2025-03-01 23:15:31	2025-03-01 18:33:31
2646	151	2025-03-29 06:32:41	2025-03-29 08:16:41	2025-03-29 06:32:41
2647	477	2025-10-21 16:30:43	2025-10-21 22:08:43	2025-10-21 16:30:43
2648	422	2025-02-12 16:41:25	2025-02-12 20:12:25	2025-02-12 16:41:25
2649	181	2025-06-21 15:27:16	2025-06-21 18:16:16	2025-06-21 15:27:16
2650	226	2025-05-27 17:21:38	2025-05-27 18:32:38	2025-05-27 17:21:38
2651	175	2024-12-06 16:41:16	2024-12-06 19:25:16	2024-12-06 16:41:16
2652	589	2025-02-09 15:57:39	2025-02-09 21:36:39	2025-02-09 15:57:39
2653	795	2025-03-23 15:12:04	2025-03-23 16:41:04	2025-03-23 15:12:04
2654	635	2025-06-03 15:42:01	2025-06-03 19:49:01	2025-06-03 15:42:01
2655	742	2025-10-05 14:57:57	2025-10-05 17:24:57	2025-10-05 14:57:57
2656	116	2025-07-15 18:33:37	2025-07-15 22:44:37	2025-07-15 18:33:37
2657	54	2024-11-23 17:46:53	2024-11-23 23:43:53	2024-11-23 17:46:53
2658	337	2025-02-08 10:13:20	2025-02-08 15:38:20	2025-02-08 10:13:20
2659	553	2025-07-22 10:06:00	2025-07-22 15:56:00	2025-07-22 10:06:00
2660	854	2025-04-08 15:37:36	2025-04-08 17:47:36	2025-04-08 15:37:36
2661	206	2025-03-23 17:40:04	2025-03-23 21:40:04	2025-03-23 17:40:04
2662	75	2025-10-27 15:34:05	2025-10-27 16:58:05	2025-10-27 15:34:05
2663	280	2025-07-22 18:55:56	2025-07-22 22:20:56	2025-07-22 18:55:56
2664	46	2025-05-02 14:42:07	2025-05-02 19:33:07	2025-05-02 14:42:07
2665	930	2024-11-19 15:27:34	2024-11-19 18:13:34	2024-11-19 15:27:34
2666	842	2025-04-29 14:53:50	2025-04-29 16:18:50	2025-04-29 14:53:50
2667	163	2025-04-20 14:42:14	2025-04-20 20:19:14	2025-04-20 14:42:14
2668	63	2025-10-11 15:32:56	2025-10-11 16:53:56	2025-10-11 15:32:56
2669	888	2025-07-27 14:39:30	2025-07-27 18:50:30	2025-07-27 14:39:30
2670	901	2025-10-02 15:26:31	2025-10-02 20:13:31	2025-10-02 15:26:31
2671	302	2025-03-16 15:59:43	2025-03-16 20:52:43	2025-03-16 15:59:43
2672	154	2025-03-29 16:55:58	2025-03-29 19:31:58	2025-03-29 16:55:58
2673	817	2025-11-01 22:20:35	2025-11-02 02:53:35	2025-11-01 22:20:35
2674	935	2025-06-22 17:42:44	2025-06-22 22:03:44	2025-06-22 17:42:44
2675	764	2024-12-14 12:07:46	2024-12-14 14:55:46	2024-12-14 12:07:46
2676	963	2025-10-19 05:02:41	2025-10-19 09:56:41	2025-10-19 05:02:41
2677	162	2024-12-22 14:44:34	2024-12-22 19:57:34	2024-12-22 14:44:34
2678	252	2025-04-08 11:20:57	2025-04-08 13:58:57	2025-04-08 11:20:57
2679	649	2025-04-22 09:44:42	2025-04-22 13:42:42	2025-04-22 09:44:42
2680	611	2025-10-19 15:40:19	2025-10-19 20:49:19	2025-10-19 15:40:19
2681	976	2025-09-23 14:56:11	2025-09-23 18:22:11	2025-09-23 14:56:11
2682	332	2024-12-29 13:26:15	2024-12-29 18:52:15	2024-12-29 13:26:15
2683	88	2025-01-19 00:18:25	2025-01-19 05:59:25	2025-01-19 00:18:25
2684	512	2024-12-02 16:17:33	2024-12-02 20:36:33	2024-12-02 16:17:33
2685	13	2025-02-01 01:03:49	2025-02-01 06:29:49	2025-02-01 01:03:49
2686	897	2025-08-02 04:14:34	2025-08-02 06:20:34	2025-08-02 04:14:34
2687	980	2025-06-10 09:02:32	2025-06-10 10:46:32	2025-06-10 09:02:32
2688	542	2025-09-27 18:29:26	2025-09-27 22:22:26	2025-09-27 18:29:26
2689	238	2025-07-06 13:07:37	2025-07-06 16:39:37	2025-07-06 13:07:37
2690	620	2025-03-30 15:14:51	2025-03-30 20:28:51	2025-03-30 15:14:51
2691	764	2025-01-26 15:09:55	2025-01-26 20:49:55	2025-01-26 15:09:55
2692	232	2025-05-11 16:42:36	2025-05-11 18:35:36	2025-05-11 16:42:36
2693	467	2025-08-23 16:33:36	2025-08-23 19:18:36	2025-08-23 16:33:36
2694	186	2025-05-31 14:13:34	2025-05-31 18:18:34	2025-05-31 14:13:34
2695	492	2025-10-21 17:18:47	2025-10-21 20:47:47	2025-10-21 17:18:47
2696	643	2025-06-07 18:36:15	2025-06-07 20:33:15	2025-06-07 18:36:15
2697	495	2025-06-03 15:17:55	2025-06-03 21:00:55	2025-06-03 15:17:55
2698	40	2025-08-03 14:22:53	2025-08-03 16:13:53	2025-08-03 14:22:53
2699	366	2025-02-22 05:05:45	2025-02-22 07:26:45	2025-02-22 05:05:45
2700	704	2025-07-26 14:26:52	2025-07-26 16:38:52	2025-07-26 14:26:52
2701	819	2025-05-17 08:26:38	2025-05-17 11:19:38	2025-05-17 08:26:38
2702	124	2025-09-02 17:57:55	2025-09-02 21:44:55	2025-09-02 17:57:55
2703	545	2024-12-31 19:30:55	2024-12-31 21:07:55	2024-12-31 19:30:55
2704	668	2025-02-01 17:53:43	2025-02-01 21:15:43	2025-02-01 17:53:43
2705	797	2025-05-03 14:52:16	2025-05-03 19:23:16	2025-05-03 14:52:16
2706	761	2025-01-30 16:24:03	2025-01-30 17:37:03	2025-01-30 16:24:03
2707	365	2025-07-02 16:42:20	2025-07-02 22:09:20	2025-07-02 16:42:20
2708	176	2025-05-28 07:05:03	2025-05-28 11:26:03	2025-05-28 07:05:03
2709	491	2024-11-17 15:27:50	2024-11-17 16:54:50	2024-11-17 15:27:50
2710	395	2025-10-19 16:28:17	2025-10-19 20:32:17	2025-10-19 16:28:17
2711	467	2025-05-10 15:07:29	2025-05-10 16:17:29	2025-05-10 15:07:29
2712	819	2025-09-06 09:27:19	2025-09-06 13:40:19	2025-09-06 09:27:19
2713	11	2025-10-12 18:04:20	2025-10-12 19:48:20	2025-10-12 18:04:20
2714	674	2025-08-27 10:41:28	2025-08-27 13:31:28	2025-08-27 10:41:28
2715	419	2025-09-21 07:14:10	2025-09-21 11:30:10	2025-09-21 07:14:10
2716	203	2025-02-23 04:16:00	2025-02-23 09:48:00	2025-02-23 04:16:00
2717	955	2025-02-22 19:23:55	2025-02-22 21:56:55	2025-02-22 19:23:55
2718	493	2025-09-26 17:10:11	2025-09-26 18:14:11	2025-09-26 17:10:11
2719	266	2025-05-18 06:08:52	2025-05-18 08:09:52	2025-05-18 06:08:52
2720	295	2025-06-14 14:49:19	2025-06-14 18:12:19	2025-06-14 14:49:19
2721	893	2025-05-03 09:55:42	2025-05-03 15:47:42	2025-05-03 09:55:42
2722	102	2025-02-22 16:15:34	2025-02-22 21:36:34	2025-02-22 16:15:34
2723	870	2025-08-13 14:52:10	2025-08-13 19:40:10	2025-08-13 14:52:10
2724	256	2025-10-07 14:51:19	2025-10-07 18:59:19	2025-10-07 14:51:19
2725	81	2025-10-14 15:39:30	2025-10-14 18:14:30	2025-10-14 15:39:30
2726	155	2025-06-24 06:38:36	2025-06-24 11:59:36	2025-06-24 06:38:36
2727	38	2025-09-23 16:37:31	2025-09-23 18:29:31	2025-09-23 16:37:31
2728	621	2025-01-14 15:08:21	2025-01-14 19:14:21	2025-01-14 15:08:21
2729	188	2025-06-10 15:55:26	2025-06-10 18:32:26	2025-06-10 15:55:26
2730	756	2025-04-08 13:52:58	2025-04-08 16:04:58	2025-04-08 13:52:58
2731	36	2025-10-25 16:26:02	2025-10-25 18:36:02	2025-10-25 16:26:02
2732	3	2024-11-24 22:20:53	2024-11-25 03:48:53	2024-11-24 22:20:53
2733	748	2025-02-01 13:00:41	2025-02-01 18:01:41	2025-02-01 13:00:41
2734	625	2025-04-13 16:21:38	2025-04-13 21:24:38	2025-04-13 16:21:38
2735	338	2025-02-08 17:46:13	2025-02-08 23:44:13	2025-02-08 17:46:13
2736	52	2025-09-23 17:53:58	2025-09-23 22:21:58	2025-09-23 17:53:58
2737	171	2025-02-11 18:50:43	2025-02-11 23:01:43	2025-02-11 18:50:43
2738	719	2025-04-26 17:16:31	2025-04-26 19:22:31	2025-04-26 17:16:31
2739	962	2025-05-11 18:54:29	2025-05-11 23:21:29	2025-05-11 18:54:29
2740	54	2025-06-15 15:33:27	2025-06-15 18:57:27	2025-06-15 15:33:27
2741	215	2025-10-11 18:02:05	2025-10-11 20:23:05	2025-10-11 18:02:05
2742	926	2025-05-14 16:45:46	2025-05-14 18:26:46	2025-05-14 16:45:46
2743	251	2025-04-15 16:21:31	2025-04-15 17:59:31	2025-04-15 16:21:31
2744	924	2024-11-19 19:05:04	2024-11-19 22:56:04	2024-11-19 19:05:04
2745	749	2025-01-22 17:06:14	2025-01-22 23:04:14	2025-01-22 17:06:14
2746	752	2025-08-30 01:03:26	2025-08-30 04:53:26	2025-08-30 01:03:26
2747	22	2025-10-21 18:57:48	2025-10-22 00:44:48	2025-10-21 18:57:48
2748	761	2025-07-06 18:55:43	2025-07-06 22:38:43	2025-07-06 18:55:43
2749	443	2025-09-06 16:18:16	2025-09-06 21:12:16	2025-09-06 16:18:16
2750	149	2025-04-26 15:26:39	2025-04-26 17:03:39	2025-04-26 15:26:39
2751	806	2024-12-10 20:18:04	2024-12-11 01:01:04	2024-12-10 20:18:04
2752	253	2025-07-13 14:56:51	2025-07-13 16:39:51	2025-07-13 14:56:51
2753	212	2025-05-20 14:33:28	2025-05-20 18:12:28	2025-05-20 14:33:28
2754	974	2025-09-30 15:06:19	2025-09-30 20:04:19	2025-09-30 15:06:19
2755	919	2025-07-19 19:19:59	2025-07-19 23:43:59	2025-07-19 19:19:59
2756	403	2025-05-19 22:42:34	2025-05-20 04:03:34	2025-05-19 22:42:34
2757	429	2025-09-23 15:52:07	2025-09-23 19:12:07	2025-09-23 15:52:07
2758	85	2025-09-02 11:11:15	2025-09-02 15:47:15	2025-09-02 11:11:15
2759	697	2024-11-19 15:13:16	2024-11-19 17:55:16	2024-11-19 15:13:16
2760	670	2025-01-18 17:04:04	2025-01-18 21:44:04	2025-01-18 17:04:04
2761	270	2024-12-23 18:06:26	2024-12-23 19:06:26	2024-12-23 18:06:26
2762	240	2024-12-22 10:01:24	2024-12-22 15:22:24	2024-12-22 10:01:24
2763	116	2025-01-23 15:54:48	2025-01-23 20:49:48	2025-01-23 15:54:48
2764	615	2025-03-22 16:47:49	2025-03-22 19:47:49	2025-03-22 16:47:49
2765	8	2024-12-15 19:58:53	2024-12-15 21:35:53	2024-12-15 19:58:53
2766	431	2025-03-27 16:01:02	2025-03-27 18:18:02	2025-03-27 16:01:02
2767	7	2025-05-04 15:41:41	2025-05-04 20:34:41	2025-05-04 15:41:41
2768	304	2025-08-19 15:24:01	2025-08-19 20:18:01	2025-08-19 15:24:01
2769	690	2025-05-03 16:01:52	2025-05-03 18:30:52	2025-05-03 16:01:52
2770	967	2025-03-08 15:20:30	2025-03-08 19:49:30	2025-03-08 15:20:30
2771	371	2025-05-03 15:35:02	2025-05-03 21:20:02	2025-05-03 15:35:02
2772	206	2025-07-08 15:20:46	2025-07-08 19:59:46	2025-07-08 15:20:46
2773	329	2025-04-15 15:12:35	2025-04-15 20:11:35	2025-04-15 15:12:35
2774	907	2024-12-24 16:04:50	2024-12-24 19:18:50	2024-12-24 16:04:50
2775	732	2025-06-29 04:59:52	2025-06-29 07:01:52	2025-06-29 04:59:52
2776	364	2024-11-19 11:35:52	2024-11-19 16:53:52	2024-11-19 11:35:52
2777	599	2025-08-30 15:05:01	2025-08-30 20:41:01	2025-08-30 15:05:01
2778	655	2025-06-15 16:41:40	2025-06-15 21:10:40	2025-06-15 16:41:40
2779	950	2025-03-29 17:09:13	2025-03-29 19:02:13	2025-03-29 17:09:13
2780	202	2025-02-25 18:45:33	2025-02-25 23:38:33	2025-02-25 18:45:33
2781	766	2025-02-15 17:57:36	2025-02-15 22:27:36	2025-02-15 17:57:36
2782	653	2025-09-28 15:51:04	2025-09-28 20:12:04	2025-09-28 15:51:04
2783	357	2025-08-05 18:35:44	2025-08-05 23:15:44	2025-08-05 18:35:44
2784	531	2024-12-28 16:51:55	2024-12-28 18:35:55	2024-12-28 16:51:55
2785	319	2025-03-11 16:39:32	2025-03-11 21:32:32	2025-03-11 16:39:32
2786	637	2025-05-31 13:36:20	2025-05-31 15:47:20	2025-05-31 13:36:20
2787	833	2025-04-22 15:33:37	2025-04-22 17:22:37	2025-04-22 15:33:37
2788	625	2024-11-24 15:15:40	2024-11-24 16:19:40	2024-11-24 15:15:40
2789	394	2025-07-24 05:23:43	2025-07-24 08:18:43	2025-07-24 05:23:43
2790	957	2025-02-11 13:16:30	2025-02-11 14:17:30	2025-02-11 13:16:30
2791	992	2025-02-07 22:32:48	2025-02-08 04:10:48	2025-02-07 22:32:48
2792	966	2024-11-19 16:37:06	2024-11-19 19:04:06	2024-11-19 16:37:06
2793	92	2025-07-01 17:01:14	2025-07-01 20:25:14	2025-07-01 17:01:14
2794	494	2025-01-05 16:28:28	2025-01-05 20:40:28	2025-01-05 16:28:28
2795	511	2024-11-17 13:07:42	2024-11-17 16:24:42	2024-11-17 13:07:42
2796	691	2025-06-14 16:47:21	2025-06-14 22:01:21	2025-06-14 16:47:21
2797	694	2025-04-08 16:15:07	2025-04-08 22:09:07	2025-04-08 16:15:07
2798	423	2025-04-19 00:06:53	2025-04-19 02:09:53	2025-04-19 00:06:53
2799	825	2025-11-04 16:51:50	2025-11-04 19:53:50	2025-11-04 16:51:50
2800	435	2025-11-04 19:07:05	2025-11-04 22:07:05	2025-11-04 19:07:05
2801	388	2025-09-06 14:36:21	2025-09-06 19:55:21	2025-09-06 14:36:21
2802	646	2025-03-23 16:35:42	2025-03-23 18:27:42	2025-03-23 16:35:42
2803	445	2025-10-14 14:57:33	2025-10-14 20:20:33	2025-10-14 14:57:33
2804	224	2024-12-29 18:44:38	2024-12-29 22:29:38	2024-12-29 18:44:38
2805	821	2025-01-07 17:14:55	2025-01-07 18:58:55	2025-01-07 17:14:55
2806	653	2025-04-01 09:56:20	2025-04-01 15:45:20	2025-04-01 09:56:20
2807	229	2024-11-19 07:08:47	2024-11-19 10:33:47	2024-11-19 07:08:47
2808	730	2024-12-10 16:01:08	2024-12-10 21:30:08	2024-12-10 16:01:08
2809	60	2025-10-14 14:11:28	2025-10-14 18:39:28	2025-10-14 14:11:28
2810	39	2025-02-25 16:41:52	2025-02-25 20:25:52	2025-02-25 16:41:52
2811	657	2025-08-23 15:20:57	2025-08-23 17:48:57	2025-08-23 15:20:57
2812	725	2025-07-06 15:02:11	2025-07-06 20:44:11	2025-07-06 15:02:11
2813	504	2025-08-23 05:13:34	2025-08-23 09:19:34	2025-08-23 05:13:34
2814	896	2025-08-23 16:27:54	2025-08-23 17:44:54	2025-08-23 16:27:54
2815	645	2025-09-09 18:16:22	2025-09-09 23:58:22	2025-09-09 18:16:22
2816	992	2025-03-18 17:28:54	2025-03-18 23:20:54	2025-03-18 17:28:54
2817	403	2025-03-25 16:45:58	2025-03-25 19:55:58	2025-03-25 16:45:58
2818	996	2025-01-25 00:41:00	2025-01-25 03:25:00	2025-01-25 00:41:00
2819	49	2025-07-22 12:30:15	2025-07-22 14:10:15	2025-07-22 12:30:15
2820	803	2025-04-13 18:19:52	2025-04-13 22:38:52	2025-04-13 18:19:52
2821	343	2025-10-14 15:00:00	2025-10-14 16:56:00	2025-10-14 15:00:00
2822	757	2024-12-11 17:37:26	2024-12-11 19:08:26	2024-12-11 17:37:26
2823	272	2025-04-22 19:44:40	2025-04-22 22:04:40	2025-04-22 19:44:40
2824	55	2024-11-10 15:06:49	2024-11-10 16:30:49	2024-11-10 15:06:49
2825	29	2025-08-16 04:54:59	2025-08-16 08:50:59	2025-08-16 04:54:59
2826	537	2025-06-10 14:10:43	2025-06-10 15:51:43	2025-06-10 14:10:43
2827	674	2025-03-25 09:36:57	2025-03-25 13:19:57	2025-03-25 09:36:57
2828	741	2024-12-22 15:18:33	2024-12-22 20:45:33	2024-12-22 15:18:33
2829	84	2025-03-11 16:21:20	2025-03-11 20:39:20	2025-03-11 16:21:20
2830	739	2025-03-29 18:33:24	2025-03-29 20:46:24	2025-03-29 18:33:24
2831	926	2025-05-06 16:33:04	2025-05-06 17:48:04	2025-05-06 16:33:04
2832	731	2025-07-05 17:13:14	2025-07-05 19:00:14	2025-07-05 17:13:14
2833	849	2025-01-11 18:09:32	2025-01-11 20:35:32	2025-01-11 18:09:32
2834	701	2025-02-22 17:47:37	2025-02-22 22:25:37	2025-02-22 17:47:37
2835	275	2025-03-11 16:45:38	2025-03-11 21:03:38	2025-03-11 16:45:38
2836	278	2025-04-29 16:34:47	2025-04-29 18:21:47	2025-04-29 16:34:47
2837	549	2025-09-30 15:05:56	2025-09-30 20:24:56	2025-09-30 15:05:56
2838	403	2024-12-27 19:08:33	2024-12-27 21:20:33	2024-12-27 19:08:33
2839	882	2025-08-19 14:36:22	2025-08-19 16:20:22	2025-08-19 14:36:22
2840	550	2025-10-25 18:27:31	2025-10-26 00:10:31	2025-10-25 18:27:31
2841	688	2025-03-25 06:55:15	2025-03-25 09:49:15	2025-03-25 06:55:15
2842	898	2025-10-11 17:23:57	2025-10-11 19:58:57	2025-10-11 17:23:57
2843	319	2025-02-18 15:52:54	2025-02-18 20:38:54	2025-02-18 15:52:54
2844	748	2025-08-05 15:06:29	2025-08-05 20:50:29	2025-08-05 15:06:29
2845	290	2025-06-15 08:11:10	2025-06-15 10:28:10	2025-06-15 08:11:10
2846	112	2025-04-22 10:27:15	2025-04-22 16:23:15	2025-04-22 10:27:15
2847	136	2025-02-22 19:33:09	2025-02-22 23:32:09	2025-02-22 19:33:09
2848	170	2025-01-19 17:31:34	2025-01-19 20:19:34	2025-01-19 17:31:34
2849	428	2025-07-29 17:37:59	2025-07-29 22:59:59	2025-07-29 17:37:59
2850	960	2024-12-24 16:11:30	2024-12-24 17:57:30	2024-12-24 16:11:30
2851	113	2025-01-19 16:30:15	2025-01-19 19:34:15	2025-01-19 16:30:15
2852	587	2025-08-17 15:47:41	2025-08-17 17:02:41	2025-08-17 15:47:41
2853	325	2025-09-09 15:12:17	2025-09-09 18:08:17	2025-09-09 15:12:17
2854	368	2025-10-11 18:01:49	2025-10-11 20:29:49	2025-10-11 18:01:49
2855	686	2025-03-22 17:17:25	2025-03-22 19:41:25	2025-03-22 17:17:25
2856	485	2025-02-18 15:03:10	2025-02-18 18:32:10	2025-02-18 15:03:10
2857	623	2025-04-15 15:08:24	2025-04-15 20:42:24	2025-04-15 15:08:24
2858	725	2024-12-22 16:40:55	2024-12-22 18:18:55	2024-12-22 16:40:55
2859	562	2025-06-01 15:46:25	2025-06-01 18:11:25	2025-06-01 15:46:25
2860	289	2025-09-02 16:44:04	2025-09-02 18:26:04	2025-09-02 16:44:04
2861	432	2024-11-21 19:30:43	2024-11-21 21:07:43	2024-11-21 19:30:43
2862	516	2025-02-16 16:28:33	2025-02-16 20:05:33	2025-02-16 16:28:33
2863	505	2025-05-18 06:22:42	2025-05-18 08:00:42	2025-05-18 06:22:42
2864	393	2024-12-24 16:35:17	2024-12-24 18:34:17	2024-12-24 16:35:17
2865	733	2025-07-29 16:31:01	2025-07-29 18:38:01	2025-07-29 16:31:01
2866	770	2025-02-16 16:12:10	2025-02-16 17:47:10	2025-02-16 16:12:10
2867	212	2024-11-10 16:46:52	2024-11-10 21:16:52	2024-11-10 16:46:52
2868	213	2025-07-15 15:38:47	2025-07-15 16:52:47	2025-07-15 15:38:47
2869	884	2025-04-15 09:22:57	2025-04-15 10:29:57	2025-04-15 09:22:57
2870	211	2025-04-19 16:33:16	2025-04-19 21:06:16	2025-04-19 16:33:16
2871	833	2025-08-02 00:12:31	2025-08-02 01:19:31	2025-08-02 00:12:31
2872	939	2025-06-21 16:52:13	2025-06-21 21:56:13	2025-06-21 16:52:13
2873	649	2025-09-02 14:48:08	2025-09-02 20:39:08	2025-09-02 14:48:08
2874	368	2025-08-19 16:48:50	2025-08-19 21:11:50	2025-08-19 16:48:50
2875	600	2025-01-11 18:59:34	2025-01-12 00:20:34	2025-01-11 18:59:34
2876	948	2025-08-12 03:47:11	2025-08-12 07:57:11	2025-08-12 03:47:11
2877	888	2024-12-14 15:04:45	2024-12-14 16:19:45	2024-12-14 15:04:45
2878	630	2025-06-21 12:08:06	2025-06-21 14:00:06	2025-06-21 12:08:06
2879	723	2025-05-31 15:32:10	2025-05-31 18:49:10	2025-05-31 15:32:10
2880	10	2024-12-10 16:11:45	2024-12-10 22:01:45	2024-12-10 16:11:45
2881	795	2025-06-03 14:59:11	2025-06-03 17:47:11	2025-06-03 14:59:11
2882	346	2025-03-23 05:43:32	2025-03-23 09:52:32	2025-03-23 05:43:32
2883	395	2025-06-17 14:11:31	2025-06-17 15:32:31	2025-06-17 14:11:31
2884	317	2024-11-10 16:21:12	2024-11-10 21:52:12	2024-11-10 16:21:12
2885	669	2025-02-04 17:01:25	2025-02-04 22:47:25	2025-02-04 17:01:25
2886	6	2025-03-15 19:13:45	2025-03-15 22:47:45	2025-03-15 19:13:45
2887	612	2025-03-01 17:00:37	2025-03-01 21:53:37	2025-03-01 17:00:37
2888	685	2025-02-04 07:12:17	2025-02-04 10:04:17	2025-02-04 07:12:17
2889	767	2025-08-19 16:20:13	2025-08-19 20:24:13	2025-08-19 16:20:13
2890	460	2025-03-25 16:20:21	2025-03-25 20:25:21	2025-03-25 16:20:21
2891	541	2025-06-17 16:24:26	2025-06-17 21:19:26	2025-06-17 16:24:26
2892	300	2025-08-05 15:21:34	2025-08-05 19:23:34	2025-08-05 15:21:34
2893	934	2025-03-08 15:36:39	2025-03-08 16:57:39	2025-03-08 15:36:39
2894	876	2025-01-14 19:05:57	2025-01-15 00:33:57	2025-01-14 19:05:57
2895	265	2025-05-11 14:42:14	2025-05-11 18:39:14	2025-05-11 14:42:14
2896	428	2025-09-20 15:54:37	2025-09-20 21:50:37	2025-09-20 15:54:37
2897	759	2025-06-01 10:57:48	2025-06-01 14:49:48	2025-06-01 10:57:48
2898	357	2025-03-11 09:51:44	2025-03-11 15:16:44	2025-03-11 09:51:44
2899	157	2025-09-23 15:07:03	2025-09-23 16:09:03	2025-09-23 15:07:03
2900	799	2025-06-10 16:35:52	2025-06-10 21:10:52	2025-06-10 16:35:52
2901	276	2024-11-24 16:43:49	2024-11-24 18:45:49	2024-11-24 16:43:49
2902	978	2025-06-29 05:36:00	2025-06-29 10:14:00	2025-06-29 05:36:00
2903	851	2025-02-22 17:59:36	2025-02-22 19:55:36	2025-02-22 17:59:36
2904	233	2025-08-10 15:05:11	2025-08-10 19:30:11	2025-08-10 15:05:11
2905	530	2025-06-24 05:01:20	2025-06-24 07:15:20	2025-06-24 05:01:20
2906	183	2025-05-06 05:07:37	2025-05-06 07:24:37	2025-05-06 05:07:37
2907	351	2024-12-24 16:08:08	2024-12-24 19:21:08	2024-12-24 16:08:08
2908	510	2025-10-12 15:18:49	2025-10-12 16:18:49	2025-10-12 15:18:49
2909	842	2025-02-16 16:47:58	2025-02-16 19:05:58	2025-02-16 16:47:58
2910	176	2025-06-17 14:48:36	2025-06-17 19:12:36	2025-06-17 14:48:36
2911	589	2025-05-25 15:52:35	2025-05-25 20:43:35	2025-05-25 15:52:35
2912	321	2025-05-17 22:33:46	2025-05-18 01:14:46	2025-05-17 22:33:46
2913	552	2024-12-21 16:05:20	2024-12-21 19:11:20	2024-12-21 16:05:20
2914	11	2025-10-21 18:02:50	2025-10-21 23:25:50	2025-10-21 18:02:50
2915	184	2025-10-14 14:57:47	2025-10-14 20:13:47	2025-10-14 14:57:47
2916	924	2025-10-11 12:39:49	2025-10-11 14:58:49	2025-10-11 12:39:49
2917	665	2025-06-01 14:32:55	2025-06-01 20:22:55	2025-06-01 14:32:55
2918	265	2025-06-21 14:08:29	2025-06-21 19:22:29	2025-06-21 14:08:29
2919	305	2025-03-08 10:09:37	2025-03-08 11:53:37	2025-03-08 10:09:37
2920	359	2025-06-10 14:30:29	2025-06-10 15:34:29	2025-06-10 14:30:29
2921	238	2025-01-21 17:04:55	2025-01-21 18:12:55	2025-01-21 17:04:55
2922	299	2025-02-13 16:12:27	2025-02-13 18:29:27	2025-02-13 16:12:27
2923	347	2025-07-15 13:28:56	2025-07-15 14:44:56	2025-07-15 13:28:56
2924	387	2025-01-07 16:52:00	2025-01-07 19:17:00	2025-01-07 16:52:00
2925	164	2025-09-06 15:27:01	2025-09-06 21:14:01	2025-09-06 15:27:01
2926	802	2025-04-15 12:16:46	2025-04-15 15:16:46	2025-04-15 12:16:46
2927	624	2024-12-28 08:26:29	2024-12-28 10:12:29	2024-12-28 08:26:29
2928	621	2024-12-19 17:29:47	2024-12-19 22:56:47	2024-12-19 17:29:47
2929	841	2024-12-03 16:09:21	2024-12-03 18:03:21	2024-12-03 16:09:21
2930	378	2024-12-31 12:18:32	2024-12-31 13:36:32	2024-12-31 12:18:32
2931	533	2024-12-22 05:56:17	2024-12-22 11:23:17	2024-12-22 05:56:17
2932	251	2025-10-23 14:37:20	2025-10-23 20:21:20	2025-10-23 14:37:20
2933	623	2025-06-24 14:54:25	2025-06-24 20:30:25	2025-06-24 14:54:25
2934	639	2024-12-31 13:35:36	2024-12-31 17:35:36	2024-12-31 13:35:36
2935	394	2025-05-31 15:37:25	2025-05-31 18:24:25	2025-05-31 15:37:25
2936	63	2025-02-11 15:15:09	2025-02-11 20:14:09	2025-02-11 15:15:09
2937	719	2025-01-25 04:52:00	2025-01-25 06:41:00	2025-01-25 04:52:00
2938	927	2025-08-23 15:33:07	2025-08-23 20:16:07	2025-08-23 15:33:07
2939	322	2025-06-20 14:59:14	2025-06-20 20:10:14	2025-06-20 14:59:14
2940	458	2025-08-05 15:04:54	2025-08-05 16:40:54	2025-08-05 15:04:54
2941	987	2024-12-01 17:14:40	2024-12-01 19:31:40	2024-12-01 17:14:40
2942	118	2024-11-26 15:45:44	2024-11-26 20:11:44	2024-11-26 15:45:44
2943	781	2024-12-08 15:02:59	2024-12-08 19:18:59	2024-12-08 15:02:59
2944	461	2025-01-21 17:37:04	2025-01-21 19:08:04	2025-01-21 17:37:04
2945	168	2025-10-05 04:32:58	2025-10-05 08:11:58	2025-10-05 04:32:58
2946	420	2025-09-12 11:50:40	2025-09-12 16:36:40	2025-09-12 11:50:40
2947	448	2025-08-19 14:44:01	2025-08-19 19:48:01	2025-08-19 14:44:01
2948	483	2025-05-27 14:46:32	2025-05-27 16:01:32	2025-05-27 14:46:32
2949	175	2024-11-26 17:35:56	2024-11-26 22:17:56	2024-11-26 17:35:56
2950	804	2024-12-17 19:19:54	2024-12-17 20:48:54	2024-12-17 19:19:54
2951	838	2025-04-19 02:14:13	2025-04-19 03:24:13	2025-04-19 02:14:13
2952	467	2025-01-19 16:55:09	2025-01-19 19:06:09	2025-01-19 16:55:09
2953	451	2025-08-09 10:18:50	2025-08-09 14:31:50	2025-08-09 10:18:50
2954	879	2025-03-04 05:49:57	2025-03-04 08:04:57	2025-03-04 05:49:57
2955	279	2025-10-26 15:21:45	2025-10-26 20:25:45	2025-10-26 15:21:45
2956	477	2025-04-06 14:56:45	2025-04-06 16:13:45	2025-04-06 14:56:45
2957	385	2025-03-01 18:42:55	2025-03-01 23:21:55	2025-03-01 18:42:55
2958	245	2025-03-15 15:44:11	2025-03-15 21:27:11	2025-03-15 15:44:11
2959	854	2024-12-31 17:28:26	2024-12-31 23:06:26	2024-12-31 17:28:26
2960	496	2025-05-04 14:31:28	2025-05-04 20:10:28	2025-05-04 14:31:28
2961	219	2025-06-08 14:42:23	2025-06-08 16:00:23	2025-06-08 14:42:23
2962	69	2025-07-21 15:28:18	2025-07-21 19:05:18	2025-07-21 15:28:18
2963	371	2025-05-10 21:16:26	2025-05-11 01:41:26	2025-05-10 21:16:26
2964	20	2025-01-07 12:41:35	2025-01-07 17:39:35	2025-01-07 12:41:35
2965	915	2025-05-13 16:03:19	2025-05-13 21:17:19	2025-05-13 16:03:19
2966	879	2025-10-12 18:00:19	2025-10-12 22:48:19	2025-10-12 18:00:19
2967	99	2025-01-07 19:21:17	2025-01-07 22:45:17	2025-01-07 19:21:17
2968	166	2025-03-04 00:42:40	2025-03-04 06:38:40	2025-03-04 00:42:40
2969	443	2025-08-12 04:02:11	2025-08-12 06:44:11	2025-08-12 04:02:11
2970	737	2024-12-08 17:07:43	2024-12-08 20:47:43	2024-12-08 17:07:43
2971	824	2025-06-24 14:01:03	2025-06-24 17:50:03	2025-06-24 14:01:03
2972	896	2024-11-26 18:13:31	2024-11-26 21:01:31	2024-11-26 18:13:31
2973	452	2025-07-26 15:32:44	2025-07-26 20:36:44	2025-07-26 15:32:44
2974	245	2025-06-24 15:10:40	2025-06-24 20:36:40	2025-06-24 15:10:40
2975	519	2025-05-11 15:32:22	2025-05-11 16:41:22	2025-05-11 15:32:22
2976	84	2025-07-05 16:29:12	2025-07-05 19:24:12	2025-07-05 16:29:12
2977	752	2024-12-14 17:23:59	2024-12-14 18:30:59	2024-12-14 17:23:59
2978	89	2025-06-24 18:41:43	2025-06-24 20:57:43	2025-06-24 18:41:43
2979	47	2025-09-16 16:16:22	2025-09-16 22:12:22	2025-09-16 16:16:22
2980	590	2025-07-12 16:54:28	2025-07-12 19:10:28	2025-07-12 16:54:28
2981	121	2025-09-16 14:42:46	2025-09-16 18:53:46	2025-09-16 14:42:46
2982	710	2025-04-22 08:20:13	2025-04-22 09:34:13	2025-04-22 08:20:13
2983	96	2025-07-20 14:56:34	2025-07-20 18:13:34	2025-07-20 14:56:34
2984	269	2025-02-23 15:37:52	2025-02-23 21:08:52	2025-02-23 15:37:52
2985	519	2025-04-22 01:21:18	2025-04-22 06:30:18	2025-04-22 01:21:18
2986	616	2025-04-04 16:38:20	2025-04-04 22:37:20	2025-04-04 16:38:20
2987	1000	2025-05-31 16:06:27	2025-05-31 20:46:27	2025-05-31 16:06:27
2988	109	2025-01-05 15:50:54	2025-01-05 18:38:54	2025-01-05 15:50:54
2989	567	2025-03-04 16:03:20	2025-03-04 18:39:20	2025-03-04 16:03:20
2990	847	2025-05-17 15:22:39	2025-05-17 18:43:39	2025-05-17 15:22:39
2991	142	2025-08-16 15:17:38	2025-08-16 17:19:38	2025-08-16 15:17:38
2992	457	2025-08-12 03:10:05	2025-08-12 05:45:05	2025-08-12 03:10:05
2993	111	2025-06-24 06:36:16	2025-06-24 11:09:16	2025-06-24 06:36:16
2994	599	2025-05-10 14:27:26	2025-05-10 17:11:26	2025-05-10 14:27:26
2995	78	2025-02-02 07:10:26	2025-02-02 11:58:26	2025-02-02 07:10:26
2996	498	2025-04-15 16:47:37	2025-04-15 19:15:37	2025-04-15 16:47:37
2997	577	2025-07-29 14:42:37	2025-07-29 16:31:37	2025-07-29 14:42:37
2998	498	2024-11-19 15:13:13	2024-11-19 16:29:13	2024-11-19 15:13:13
2999	116	2025-06-21 08:11:46	2025-06-21 11:36:46	2025-06-21 08:11:46
3000	793	2024-12-31 17:48:14	2024-12-31 22:45:14	2024-12-31 17:48:14
3001	695	2024-12-03 17:37:19	2024-12-03 23:02:19	2024-12-03 17:37:19
3002	994	2025-04-20 14:24:24	2025-04-20 19:27:24	2025-04-20 14:24:24
3003	470	2025-09-22 16:29:38	2025-09-22 21:53:38	2025-09-22 16:29:38
3004	562	2025-09-27 14:16:45	2025-09-27 20:01:45	2025-09-27 14:16:45
3005	658	2025-05-27 17:20:30	2025-05-27 20:12:30	2025-05-27 17:20:30
3006	146	2025-06-10 16:15:35	2025-06-10 19:35:35	2025-06-10 16:15:35
3007	339	2024-11-17 05:55:51	2024-11-17 06:55:51	2024-11-17 05:55:51
3008	648	2025-06-01 15:45:49	2025-06-01 19:43:49	2025-06-01 15:45:49
3009	512	2025-05-18 18:21:40	2025-05-18 20:16:40	2025-05-18 18:21:40
3010	458	2025-07-27 16:53:14	2025-07-27 22:16:14	2025-07-27 16:53:14
3011	810	2025-02-11 15:52:50	2025-02-11 19:20:50	2025-02-11 15:52:50
3012	622	2025-02-01 15:15:10	2025-02-01 17:10:10	2025-02-01 15:15:10
3013	364	2025-04-19 15:06:44	2025-04-19 19:09:44	2025-04-19 15:06:44
3014	989	2025-07-15 15:03:49	2025-07-15 16:40:49	2025-07-15 15:03:49
3015	591	2025-06-17 12:00:14	2025-06-17 13:35:14	2025-06-17 12:00:14
3016	395	2025-06-09 15:55:41	2025-06-09 21:26:41	2025-06-09 15:55:41
3017	894	2025-06-15 17:26:53	2025-06-15 19:53:53	2025-06-15 17:26:53
3018	82	2025-08-12 09:12:39	2025-08-12 11:50:39	2025-08-12 09:12:39
3019	574	2025-09-27 14:45:25	2025-09-27 19:32:25	2025-09-27 14:45:25
3020	618	2025-09-16 18:03:30	2025-09-16 19:50:30	2025-09-16 18:03:30
3021	767	2025-07-15 18:49:28	2025-07-15 23:21:28	2025-07-15 18:49:28
3022	648	2025-04-13 17:54:18	2025-04-13 21:30:18	2025-04-13 17:54:18
3023	726	2024-12-22 18:37:49	2024-12-22 19:42:49	2024-12-22 18:37:49
3024	332	2025-03-08 18:07:15	2025-03-08 19:46:15	2025-03-08 18:07:15
3025	758	2025-06-28 10:54:15	2025-06-28 14:24:15	2025-06-28 10:54:15
3026	211	2025-05-06 12:12:01	2025-05-06 14:45:01	2025-05-06 12:12:01
3027	976	2025-05-03 14:02:32	2025-05-03 15:44:32	2025-05-03 14:02:32
3028	753	2025-02-25 15:46:42	2025-02-25 18:21:42	2025-02-25 15:46:42
3029	969	2025-01-05 15:00:32	2025-01-05 19:50:32	2025-01-05 15:00:32
3030	292	2025-06-23 15:18:25	2025-06-23 17:43:25	2025-06-23 15:18:25
3031	753	2025-05-17 18:56:29	2025-05-17 23:58:29	2025-05-17 18:56:29
3032	740	2025-02-11 18:12:02	2025-02-11 23:47:02	2025-02-11 18:12:02
3033	532	2025-08-03 06:43:04	2025-08-03 09:24:04	2025-08-03 06:43:04
3034	814	2025-10-28 16:31:10	2025-10-28 18:36:10	2025-10-28 16:31:10
3035	690	2025-07-19 13:44:26	2025-07-19 14:48:26	2025-07-19 13:44:26
3036	736	2025-06-29 16:41:40	2025-06-29 21:39:40	2025-06-29 16:41:40
3037	484	2024-12-08 17:58:10	2024-12-08 20:56:10	2024-12-08 17:58:10
3038	287	2024-12-08 15:14:34	2024-12-08 20:18:34	2024-12-08 15:14:34
3039	110	2025-10-06 16:14:37	2025-10-06 18:37:37	2025-10-06 16:14:37
3040	759	2025-01-11 17:42:03	2025-01-11 19:47:03	2025-01-11 17:42:03
3041	931	2025-02-23 15:35:59	2025-02-23 17:37:59	2025-02-23 15:35:59
3042	497	2025-09-07 16:48:16	2025-09-07 22:03:16	2025-09-07 16:48:16
3043	104	2025-10-25 16:00:55	2025-10-25 18:39:55	2025-10-25 16:00:55
3044	813	2025-08-30 16:57:47	2025-08-30 21:43:47	2025-08-30 16:57:47
3045	899	2025-01-21 10:57:01	2025-01-21 16:22:01	2025-01-21 10:57:01
3046	25	2025-06-07 09:17:17	2025-06-07 13:03:17	2025-06-07 09:17:17
3047	803	2025-01-26 16:36:42	2025-01-26 20:34:42	2025-01-26 16:36:42
3048	538	2025-08-04 07:13:53	2025-08-04 08:52:53	2025-08-04 07:13:53
3049	576	2025-03-22 15:56:03	2025-03-22 19:57:03	2025-03-22 15:56:03
3050	802	2025-02-05 17:50:59	2025-02-05 19:00:59	2025-02-05 17:50:59
3051	155	2025-02-15 17:15:53	2025-02-15 20:15:53	2025-02-15 17:15:53
3052	618	2025-07-05 15:54:12	2025-07-05 19:29:12	2025-07-05 15:54:12
3053	402	2025-04-23 17:12:11	2025-04-23 22:04:11	2025-04-23 17:12:11
3054	221	2025-08-05 16:55:40	2025-08-05 20:04:40	2025-08-05 16:55:40
3055	808	2025-10-28 16:43:22	2025-10-28 22:34:22	2025-10-28 16:43:22
3056	508	2025-04-13 16:46:39	2025-04-13 20:09:39	2025-04-13 16:46:39
3057	736	2024-12-17 16:03:30	2024-12-17 18:53:30	2024-12-17 16:03:30
3058	275	2025-01-12 19:01:32	2025-01-12 22:01:32	2025-01-12 19:01:32
3059	204	2025-05-20 16:06:36	2025-05-20 19:35:36	2025-05-20 16:06:36
3060	843	2025-05-04 16:41:33	2025-05-04 21:54:33	2025-05-04 16:41:33
3061	166	2025-02-22 17:03:21	2025-02-22 18:51:21	2025-02-22 17:03:21
3062	281	2025-04-22 08:52:31	2025-04-22 11:01:31	2025-04-22 08:52:31
3063	827	2025-06-29 14:17:20	2025-06-29 19:28:20	2025-06-29 14:17:20
3064	661	2025-03-22 13:08:05	2025-03-22 18:01:05	2025-03-22 13:08:05
3065	336	2024-12-08 17:58:49	2024-12-08 21:54:49	2024-12-08 17:58:49
3066	596	2025-01-19 06:35:02	2025-01-19 07:52:02	2025-01-19 06:35:02
3067	248	2024-12-28 17:52:26	2024-12-28 23:12:26	2024-12-28 17:52:26
3068	193	2024-11-23 13:42:26	2024-11-23 18:18:26	2024-11-23 13:42:26
3069	563	2025-10-05 05:05:56	2025-10-05 09:46:56	2025-10-05 05:05:56
3070	491	2025-08-09 17:50:16	2025-08-09 23:16:16	2025-08-09 17:50:16
3071	943	2025-05-27 14:14:02	2025-05-27 18:13:02	2025-05-27 14:14:02
3072	796	2025-01-11 19:55:05	2025-01-11 22:33:05	2025-01-11 19:55:05
3073	25	2025-05-10 05:02:22	2025-05-10 07:36:22	2025-05-10 05:02:22
3074	766	2024-12-21 19:18:25	2024-12-21 20:25:25	2024-12-21 19:18:25
3075	995	2025-08-30 15:24:09	2025-08-30 18:42:09	2025-08-30 15:24:09
3076	523	2025-10-26 15:16:17	2025-10-26 18:05:17	2025-10-26 15:16:17
3077	109	2025-04-13 10:27:36	2025-04-13 12:23:36	2025-04-13 10:27:36
3078	964	2025-09-27 16:56:35	2025-09-27 21:29:35	2025-09-27 16:56:35
3079	872	2025-02-14 17:35:19	2025-02-14 21:04:19	2025-02-14 17:35:19
3080	815	2024-11-17 17:34:10	2024-11-17 22:33:10	2024-11-17 17:34:10
3081	613	2025-03-25 19:02:12	2025-03-25 22:59:12	2025-03-25 19:02:12
3082	540	2025-07-22 14:19:46	2025-07-22 17:55:46	2025-07-22 14:19:46
3083	412	2024-11-26 19:00:30	2024-11-27 00:18:30	2024-11-26 19:00:30
3084	150	2025-03-30 17:47:24	2025-03-30 20:20:24	2025-03-30 17:47:24
3085	83	2025-01-05 17:32:21	2025-01-05 22:52:21	2025-01-05 17:32:21
3086	658	2025-07-12 08:48:41	2025-07-12 13:26:41	2025-07-12 08:48:41
3087	360	2025-01-21 13:06:13	2025-01-21 15:18:13	2025-01-21 13:06:13
3088	78	2024-11-12 15:42:23	2024-11-12 18:49:23	2024-11-12 15:42:23
3089	112	2025-06-15 15:01:05	2025-06-15 19:10:05	2025-06-15 15:01:05
3090	42	2025-08-08 16:16:42	2025-08-08 20:17:42	2025-08-08 16:16:42
3091	22	2025-03-08 15:40:03	2025-03-08 17:50:03	2025-03-08 15:40:03
3092	379	2025-08-12 15:03:52	2025-08-12 18:51:52	2025-08-12 15:03:52
3093	765	2025-04-13 16:00:50	2025-04-13 19:17:50	2025-04-13 16:00:50
3094	711	2025-10-07 15:35:52	2025-10-07 18:29:52	2025-10-07 15:35:52
3095	980	2025-11-01 05:58:47	2025-11-01 09:09:47	2025-11-01 05:58:47
3096	198	2025-10-07 16:55:38	2025-10-07 19:56:38	2025-10-07 16:55:38
3097	727	2025-09-07 15:11:35	2025-09-07 17:39:35	2025-09-07 15:11:35
3098	597	2025-03-25 10:04:20	2025-03-25 12:05:20	2025-03-25 10:04:20
3099	512	2025-09-16 15:23:56	2025-09-16 20:12:56	2025-09-16 15:23:56
3100	564	2025-08-09 13:35:44	2025-08-09 15:29:44	2025-08-09 13:35:44
3101	295	2025-07-05 16:46:07	2025-07-05 19:39:07	2025-07-05 16:46:07
3102	146	2025-05-20 14:04:40	2025-05-20 18:30:40	2025-05-20 14:04:40
3103	832	2025-02-01 16:27:42	2025-02-01 20:22:42	2025-02-01 16:27:42
3104	201	2025-03-02 20:40:44	2025-03-03 02:35:44	2025-03-02 20:40:44
3105	311	2025-01-30 21:05:25	2025-01-30 23:39:25	2025-01-30 21:05:25
3106	130	2025-08-11 18:32:29	2025-08-11 19:46:29	2025-08-11 18:32:29
3107	726	2024-11-17 15:18:26	2024-11-17 18:47:26	2024-11-17 15:18:26
3108	915	2025-09-08 11:44:59	2025-09-08 15:04:59	2025-09-08 11:44:59
3109	376	2025-05-03 15:50:47	2025-05-03 19:36:47	2025-05-03 15:50:47
3110	506	2025-01-04 15:15:15	2025-01-04 21:07:15	2025-01-04 15:15:15
3111	350	2025-10-14 04:02:31	2025-10-14 07:51:31	2025-10-14 04:02:31
3112	155	2025-06-27 14:02:27	2025-06-27 17:31:27	2025-06-27 14:02:27
3113	636	2025-02-04 01:52:12	2025-02-04 04:00:12	2025-02-04 01:52:12
3114	166	2025-04-26 14:55:49	2025-04-26 16:39:49	2025-04-26 14:55:49
3115	771	2025-03-08 18:12:17	2025-03-08 23:36:17	2025-03-08 18:12:17
3116	904	2025-04-29 16:38:05	2025-04-29 19:26:05	2025-04-29 16:38:05
3117	106	2024-12-15 16:15:31	2024-12-15 17:43:31	2024-12-15 16:15:31
3118	465	2025-02-11 15:44:12	2025-02-11 17:14:12	2025-02-11 15:44:12
3119	406	2025-05-20 18:15:32	2025-05-20 20:56:32	2025-05-20 18:15:32
3120	684	2025-02-20 15:05:34	2025-02-20 21:01:34	2025-02-20 15:05:34
3121	475	2025-08-23 16:51:28	2025-08-23 22:44:28	2025-08-23 16:51:28
3122	863	2025-05-17 16:54:35	2025-05-17 22:45:35	2025-05-17 16:54:35
3123	470	2025-08-17 15:31:13	2025-08-17 17:24:13	2025-08-17 15:31:13
3124	820	2025-10-28 10:19:36	2025-10-28 12:10:36	2025-10-28 10:19:36
3125	982	2025-08-30 14:09:57	2025-08-30 19:37:57	2025-08-30 14:09:57
3126	621	2025-02-02 10:27:53	2025-02-02 12:02:53	2025-02-02 10:27:53
3127	32	2025-08-17 14:34:11	2025-08-17 16:13:11	2025-08-17 14:34:11
3128	787	2025-05-03 14:34:32	2025-05-03 16:30:32	2025-05-03 14:34:32
3129	530	2025-02-08 15:00:57	2025-02-08 16:06:57	2025-02-08 15:00:57
3130	241	2025-04-06 13:02:04	2025-04-06 15:56:04	2025-04-06 13:02:04
3131	885	2025-07-29 15:49:53	2025-07-29 21:05:53	2025-07-29 15:49:53
3132	538	2025-04-22 16:37:34	2025-04-22 20:03:34	2025-04-22 16:37:34
3133	697	2025-08-03 14:57:25	2025-08-03 19:10:25	2025-08-03 14:57:25
3134	551	2025-06-21 14:15:26	2025-06-21 20:00:26	2025-06-21 14:15:26
3135	301	2025-05-03 06:08:29	2025-05-03 08:33:29	2025-05-03 06:08:29
3136	483	2025-04-19 18:22:43	2025-04-19 21:59:43	2025-04-19 18:22:43
3137	831	2025-10-18 17:17:26	2025-10-18 22:56:26	2025-10-18 17:17:26
3138	68	2024-12-14 08:06:15	2024-12-14 13:56:15	2024-12-14 08:06:15
3139	168	2025-06-17 18:09:10	2025-06-17 23:33:10	2025-06-17 18:09:10
3140	115	2025-02-02 07:25:46	2025-02-02 10:48:46	2025-02-02 07:25:46
3141	975	2025-06-21 23:58:59	2025-06-22 05:26:59	2025-06-21 23:58:59
3142	687	2025-03-18 15:31:40	2025-03-18 18:47:40	2025-03-18 15:31:40
3143	685	2024-12-21 16:05:16	2024-12-21 17:49:16	2024-12-21 16:05:16
3144	48	2025-02-01 15:25:13	2025-02-01 19:34:13	2025-02-01 15:25:13
3145	843	2025-05-17 14:54:42	2025-05-17 20:46:42	2025-05-17 14:54:42
3146	535	2025-03-04 16:11:39	2025-03-04 17:34:39	2025-03-04 16:11:39
3147	695	2024-11-30 15:19:19	2024-11-30 18:20:19	2024-11-30 15:19:19
3148	489	2025-09-21 14:40:38	2025-09-21 16:56:38	2025-09-21 14:40:38
3149	112	2025-03-22 15:47:14	2025-03-22 16:49:14	2025-03-22 15:47:14
3150	164	2025-02-18 01:41:17	2025-02-18 03:52:17	2025-02-18 01:41:17
3151	755	2025-07-27 07:45:15	2025-07-27 12:07:15	2025-07-27 07:45:15
3152	523	2025-09-17 15:44:10	2025-09-17 21:05:10	2025-09-17 15:44:10
3153	902	2025-03-04 15:40:39	2025-03-04 17:36:39	2025-03-04 15:40:39
3154	729	2025-07-11 16:44:34	2025-07-11 20:36:34	2025-07-11 16:44:34
3155	642	2025-01-09 13:23:00	2025-01-09 18:34:00	2025-01-09 13:23:00
3156	118	2025-05-20 17:22:24	2025-05-20 19:31:24	2025-05-20 17:22:24
3157	847	2025-02-23 15:54:57	2025-02-23 17:24:57	2025-02-23 15:54:57
3158	117	2025-08-30 04:51:17	2025-08-30 06:16:17	2025-08-30 04:51:17
3159	944	2025-06-17 16:45:51	2025-06-17 18:38:51	2025-06-17 16:45:51
3160	23	2025-01-11 17:05:42	2025-01-11 18:51:42	2025-01-11 17:05:42
3161	562	2024-12-03 07:09:01	2024-12-03 13:06:01	2024-12-03 07:09:01
3162	740	2025-03-18 10:44:20	2025-03-18 14:27:20	2025-03-18 10:44:20
3163	241	2024-11-30 18:46:00	2024-11-30 21:23:00	2024-11-30 18:46:00
3164	597	2025-11-04 18:37:27	2025-11-04 20:14:27	2025-11-04 18:37:27
3165	449	2025-09-09 15:34:33	2025-09-09 20:27:33	2025-09-09 15:34:33
3166	181	2024-11-19 16:06:40	2024-11-19 17:32:40	2024-11-19 16:06:40
3167	378	2025-05-06 15:53:57	2025-05-06 20:17:57	2025-05-06 15:53:57
3168	25	2025-08-12 01:59:24	2025-08-12 06:32:24	2025-08-12 01:59:24
3169	772	2024-12-08 10:00:00	2024-12-08 15:04:00	2024-12-08 10:00:00
3170	965	2025-03-09 17:32:01	2025-03-09 18:44:01	2025-03-09 17:32:01
3171	411	2024-11-24 15:24:39	2024-11-24 20:21:39	2024-11-24 15:24:39
3172	627	2025-07-22 15:49:56	2025-07-22 18:37:56	2025-07-22 15:49:56
3173	988	2025-06-10 15:10:42	2025-06-10 17:51:42	2025-06-10 15:10:42
3174	155	2025-10-21 11:52:14	2025-10-21 17:38:14	2025-10-21 11:52:14
3175	678	2024-12-17 17:45:30	2024-12-17 18:49:30	2024-12-17 17:45:30
3176	132	2025-03-21 19:21:31	2025-03-22 01:02:31	2025-03-21 19:21:31
3177	258	2025-08-19 09:51:58	2025-08-19 11:58:58	2025-08-19 09:51:58
3178	857	2025-08-19 18:20:13	2025-08-19 22:28:13	2025-08-19 18:20:13
3179	247	2025-05-30 10:44:05	2025-05-30 15:35:05	2025-05-30 10:44:05
3180	570	2025-06-08 16:37:11	2025-06-08 19:47:11	2025-06-08 16:37:11
3181	550	2025-04-08 14:35:24	2025-04-08 19:35:24	2025-04-08 14:35:24
3182	655	2025-06-10 14:29:01	2025-06-10 17:19:01	2025-06-10 14:29:01
3183	405	2025-10-12 18:58:32	2025-10-12 21:03:32	2025-10-12 18:58:32
3184	431	2025-01-05 15:29:36	2025-01-05 19:04:36	2025-01-05 15:29:36
3185	900	2025-07-03 07:53:24	2025-07-03 12:06:24	2025-07-03 07:53:24
3186	80	2025-04-26 18:49:24	2025-04-27 00:05:24	2025-04-26 18:49:24
3187	778	2025-09-30 14:24:36	2025-09-30 16:05:36	2025-09-30 14:24:36
3188	98	2025-01-18 16:42:08	2025-01-18 22:16:08	2025-01-18 16:42:08
3189	741	2025-08-03 18:48:46	2025-08-04 00:04:46	2025-08-03 18:48:46
3190	743	2025-09-27 13:21:14	2025-09-27 18:23:14	2025-09-27 13:21:14
3191	544	2024-12-28 08:41:53	2024-12-28 12:13:53	2024-12-28 08:41:53
3192	752	2025-02-08 17:08:34	2025-02-08 20:14:34	2025-02-08 17:08:34
3193	683	2025-04-05 16:57:48	2025-04-05 22:25:48	2025-04-05 16:57:48
3194	820	2025-04-15 04:03:20	2025-04-15 08:57:20	2025-04-15 04:03:20
3195	957	2025-05-04 17:54:36	2025-05-04 23:45:36	2025-05-04 17:54:36
3196	26	2025-10-04 14:34:33	2025-10-04 16:40:33	2025-10-04 14:34:33
3197	268	2025-11-02 17:58:34	2025-11-02 21:12:34	2025-11-02 17:58:34
3198	848	2025-03-25 06:44:01	2025-03-25 10:56:01	2025-03-25 06:44:01
3199	442	2025-03-11 19:19:30	2025-03-11 22:01:30	2025-03-11 19:19:30
3200	133	2024-11-30 16:46:46	2024-11-30 20:08:46	2024-11-30 16:46:46
3201	469	2025-11-02 16:31:50	2025-11-02 17:47:50	2025-11-02 16:31:50
3202	615	2025-05-04 15:02:52	2025-05-04 17:49:52	2025-05-04 15:02:52
3203	799	2025-10-21 08:10:24	2025-10-21 12:40:24	2025-10-21 08:10:24
3204	443	2025-04-21 15:36:35	2025-04-21 21:16:35	2025-04-21 15:36:35
3205	728	2025-09-23 15:56:35	2025-09-23 18:53:35	2025-09-23 15:56:35
3206	582	2025-09-06 14:58:09	2025-09-06 16:03:09	2025-09-06 14:58:09
3207	216	2025-03-15 16:29:20	2025-03-15 18:06:20	2025-03-15 16:29:20
3208	139	2025-06-08 18:08:24	2025-06-08 20:23:24	2025-06-08 18:08:24
3209	420	2025-04-06 17:21:53	2025-04-06 22:59:53	2025-04-06 17:21:53
3210	692	2025-04-27 14:50:06	2025-04-27 19:03:06	2025-04-27 14:50:06
3211	735	2025-04-05 14:42:05	2025-04-05 16:54:05	2025-04-05 14:42:05
3212	737	2025-09-23 17:38:07	2025-09-23 23:20:07	2025-09-23 17:38:07
3213	430	2025-07-27 15:01:27	2025-07-27 19:18:27	2025-07-27 15:01:27
3214	346	2024-12-28 16:27:41	2024-12-28 18:15:41	2024-12-28 16:27:41
3215	606	2025-09-13 08:01:08	2025-09-13 12:40:08	2025-09-13 08:01:08
3216	525	2024-11-24 16:59:18	2024-11-24 20:28:18	2024-11-24 16:59:18
3217	225	2025-07-06 07:27:42	2025-07-06 11:59:42	2025-07-06 07:27:42
3218	810	2025-09-28 14:54:03	2025-09-28 16:56:03	2025-09-28 14:54:03
3219	729	2025-08-12 14:03:49	2025-08-12 17:49:49	2025-08-12 14:03:49
3220	519	2025-05-11 15:14:14	2025-05-11 18:35:14	2025-05-11 15:14:14
3221	680	2025-10-11 14:38:12	2025-10-11 17:48:12	2025-10-11 14:38:12
3222	190	2025-09-09 08:00:06	2025-09-09 13:52:06	2025-09-09 08:00:06
3223	13	2025-05-24 14:33:25	2025-05-24 16:45:25	2025-05-24 14:33:25
3224	307	2025-05-17 15:33:31	2025-05-17 19:35:31	2025-05-17 15:33:31
3225	461	2025-10-12 14:55:34	2025-10-12 16:11:34	2025-10-12 14:55:34
3226	740	2025-06-22 09:17:54	2025-06-22 10:48:54	2025-06-22 09:17:54
3227	98	2025-02-09 13:25:11	2025-02-09 16:53:11	2025-02-09 13:25:11
3228	932	2024-11-26 16:07:07	2024-11-26 19:59:07	2024-11-26 16:07:07
3229	781	2025-06-06 15:20:35	2025-06-06 19:16:35	2025-06-06 15:20:35
3230	494	2025-01-05 16:41:33	2025-01-05 22:24:33	2025-01-05 16:41:33
3231	555	2025-02-11 19:24:26	2025-02-11 21:37:26	2025-02-11 19:24:26
3232	779	2025-04-12 14:47:59	2025-04-12 17:24:59	2025-04-12 14:47:59
3233	610	2024-12-01 13:44:07	2024-12-01 17:20:07	2024-12-01 13:44:07
3234	645	2025-05-05 12:19:00	2025-05-05 15:34:00	2025-05-05 12:19:00
3235	989	2025-04-24 18:10:49	2025-04-24 21:25:49	2025-04-24 18:10:49
3236	698	2025-10-28 16:43:56	2025-10-28 19:58:56	2025-10-28 16:43:56
3237	864	2025-07-26 14:06:53	2025-07-26 19:49:53	2025-07-26 14:06:53
3238	619	2025-08-19 14:39:48	2025-08-19 17:46:48	2025-08-19 14:39:48
3239	137	2025-03-01 17:20:09	2025-03-01 19:10:09	2025-03-01 17:20:09
3240	859	2025-09-13 15:11:02	2025-09-13 18:13:02	2025-09-13 15:11:02
3241	571	2024-11-19 07:03:34	2024-11-19 10:45:34	2024-11-19 07:03:34
3242	316	2024-12-21 17:30:33	2024-12-21 19:23:33	2024-12-21 17:30:33
3243	934	2025-04-08 14:33:42	2025-04-08 17:20:42	2025-04-08 14:33:42
3244	676	2025-07-22 11:14:35	2025-07-22 15:29:35	2025-07-22 11:14:35
3245	986	2024-12-21 15:33:06	2024-12-21 17:11:06	2024-12-21 15:33:06
3246	510	2025-08-22 15:09:56	2025-08-22 18:38:56	2025-08-22 15:09:56
3247	556	2025-08-31 04:35:21	2025-08-31 07:40:21	2025-08-31 04:35:21
3248	837	2025-09-14 15:06:55	2025-09-14 16:24:55	2025-09-14 15:06:55
3249	808	2025-08-13 16:09:37	2025-08-13 20:02:37	2025-08-13 16:09:37
3250	935	2025-07-20 00:55:06	2025-07-20 04:46:06	2025-07-20 00:55:06
3251	555	2025-01-04 15:45:48	2025-01-04 21:25:48	2025-01-04 15:45:48
3252	688	2025-09-02 15:34:57	2025-09-02 20:35:57	2025-09-02 15:34:57
3253	673	2025-05-20 14:59:21	2025-05-20 17:36:21	2025-05-20 14:59:21
3254	782	2025-05-13 15:24:31	2025-05-13 17:20:31	2025-05-13 15:24:31
3255	870	2025-01-18 15:05:35	2025-01-18 17:58:35	2025-01-18 15:05:35
3256	535	2025-07-08 15:01:39	2025-07-08 18:24:39	2025-07-08 15:01:39
3257	988	2025-04-27 12:08:56	2025-04-27 14:33:56	2025-04-27 12:08:56
3258	875	2025-02-01 15:00:26	2025-02-01 16:06:26	2025-02-01 15:00:26
3259	281	2025-10-04 15:01:46	2025-10-04 16:36:46	2025-10-04 15:01:46
3260	515	2025-10-26 15:23:00	2025-10-26 18:00:00	2025-10-26 15:23:00
3261	295	2025-06-01 16:32:58	2025-06-01 19:32:58	2025-06-01 16:32:58
3262	259	2025-04-08 18:01:03	2025-04-08 23:22:03	2025-04-08 18:01:03
3263	804	2024-11-24 17:29:02	2024-11-24 20:42:02	2024-11-24 17:29:02
3264	42	2025-04-12 18:09:13	2025-04-12 19:43:13	2025-04-12 18:09:13
3265	243	2025-08-05 21:58:22	2025-08-06 01:54:22	2025-08-05 21:58:22
3266	952	2025-10-10 13:35:03	2025-10-10 16:47:03	2025-10-10 13:35:03
3267	768	2025-08-10 14:56:34	2025-08-10 17:57:34	2025-08-10 14:56:34
3268	678	2025-10-05 18:55:38	2025-10-06 00:24:38	2025-10-05 18:55:38
3269	845	2025-10-11 14:43:50	2025-10-11 17:27:50	2025-10-11 14:43:50
3270	756	2025-04-08 14:18:23	2025-04-08 20:11:23	2025-04-08 14:18:23
3271	65	2025-11-02 13:21:29	2025-11-02 18:36:29	2025-11-02 13:21:29
3272	20	2025-09-09 14:04:51	2025-09-09 19:25:51	2025-09-09 14:04:51
3273	259	2025-04-27 14:41:53	2025-04-27 16:28:53	2025-04-27 14:41:53
3274	435	2025-10-21 12:12:49	2025-10-21 15:08:49	2025-10-21 12:12:49
3275	531	2025-08-30 17:31:58	2025-08-30 22:54:58	2025-08-30 17:31:58
3276	561	2025-06-14 17:11:11	2025-06-14 21:16:11	2025-06-14 17:11:11
3277	193	2025-07-12 16:48:47	2025-07-12 20:06:47	2025-07-12 16:48:47
3278	670	2025-03-29 10:36:37	2025-03-29 13:24:37	2025-03-29 10:36:37
3279	13	2025-10-04 15:11:12	2025-10-04 18:37:12	2025-10-04 15:11:12
3280	714	2025-03-04 16:21:40	2025-03-04 21:21:40	2025-03-04 16:21:40
3281	575	2025-06-10 06:28:51	2025-06-10 08:16:51	2025-06-10 06:28:51
3282	895	2025-06-16 22:14:33	2025-06-17 00:51:33	2025-06-16 22:14:33
3283	40	2025-01-25 05:58:40	2025-01-25 09:41:40	2025-01-25 05:58:40
3284	175	2025-07-19 16:12:32	2025-07-19 19:05:32	2025-07-19 16:12:32
3285	962	2025-05-27 14:12:38	2025-05-27 18:27:38	2025-05-27 14:12:38
3286	54	2025-07-22 14:30:47	2025-07-22 17:45:47	2025-07-22 14:30:47
3287	32	2025-09-30 16:30:00	2025-09-30 18:17:00	2025-09-30 16:30:00
3288	937	2025-10-05 15:09:22	2025-10-05 16:09:22	2025-10-05 15:09:22
3289	22	2025-04-12 18:56:02	2025-04-12 20:24:02	2025-04-12 18:56:02
3290	302	2024-12-21 19:12:07	2024-12-21 23:07:07	2024-12-21 19:12:07
3291	706	2025-01-05 17:03:37	2025-01-05 22:35:37	2025-01-05 17:03:37
3292	301	2025-03-02 15:51:29	2025-03-02 18:15:29	2025-03-02 15:51:29
3293	404	2024-12-21 06:55:14	2024-12-21 09:38:14	2024-12-21 06:55:14
3294	88	2025-10-05 15:59:51	2025-10-05 17:10:51	2025-10-05 15:59:51
3295	658	2024-12-14 15:39:45	2024-12-14 18:01:45	2024-12-14 15:39:45
3296	952	2025-03-01 12:32:33	2025-03-01 17:40:33	2025-03-01 12:32:33
3297	792	2025-07-27 15:34:27	2025-07-27 21:30:27	2025-07-27 15:34:27
3298	701	2025-02-25 17:38:29	2025-02-25 23:11:29	2025-02-25 17:38:29
3299	972	2025-07-01 03:05:00	2025-07-01 07:35:00	2025-07-01 03:05:00
3300	334	2025-08-12 15:53:05	2025-08-12 19:20:05	2025-08-12 15:53:05
3301	660	2025-07-06 14:23:42	2025-07-06 19:57:42	2025-07-06 14:23:42
3302	319	2024-11-16 17:33:30	2024-11-16 21:46:30	2024-11-16 17:33:30
3303	614	2024-11-12 15:42:30	2024-11-12 18:38:30	2024-11-12 15:42:30
3304	127	2024-11-23 16:18:33	2024-11-23 19:42:33	2024-11-23 16:18:33
3305	959	2025-03-25 19:59:34	2025-03-26 01:06:34	2025-03-25 19:59:34
3306	63	2024-12-10 15:55:55	2024-12-10 18:05:55	2024-12-10 15:55:55
3307	267	2025-07-05 14:20:56	2025-07-05 19:10:56	2025-07-05 14:20:56
3308	554	2025-01-07 17:59:40	2025-01-07 20:42:40	2025-01-07 17:59:40
3309	850	2024-12-28 06:22:21	2024-12-28 11:21:21	2024-12-28 06:22:21
3310	179	2025-08-19 14:29:25	2025-08-19 17:39:25	2025-08-19 14:29:25
3311	876	2024-12-31 16:05:18	2024-12-31 18:49:18	2024-12-31 16:05:18
3312	72	2025-10-28 15:52:32	2025-10-28 17:23:32	2025-10-28 15:52:32
3313	601	2025-06-24 15:07:33	2025-06-24 18:03:33	2025-06-24 15:07:33
3314	931	2025-02-25 18:16:20	2025-02-25 19:36:20	2025-02-25 18:16:20
3315	822	2024-11-16 18:30:32	2024-11-16 21:16:32	2024-11-16 18:30:32
3316	584	2025-08-02 16:14:16	2025-08-02 19:09:16	2025-08-02 16:14:16
3317	689	2024-11-30 16:34:19	2024-11-30 20:40:19	2024-11-30 16:34:19
3318	43	2025-01-11 17:26:32	2025-01-11 21:09:32	2025-01-11 17:26:32
3319	784	2025-09-09 14:10:55	2025-09-09 18:45:55	2025-09-09 14:10:55
3320	966	2024-12-14 16:30:50	2024-12-14 18:33:50	2024-12-14 16:30:50
3321	328	2025-01-04 16:46:35	2025-01-04 18:30:35	2025-01-04 16:46:35
3322	217	2024-12-31 09:28:38	2024-12-31 14:02:38	2024-12-31 09:28:38
3323	965	2025-09-30 16:02:03	2025-09-30 18:35:03	2025-09-30 16:02:03
3324	231	2025-03-25 15:16:34	2025-03-25 19:26:34	2025-03-25 15:16:34
3325	260	2025-07-22 12:52:20	2025-07-22 16:08:20	2025-07-22 12:52:20
3326	916	2025-05-06 18:13:09	2025-05-06 22:49:09	2025-05-06 18:13:09
3327	321	2025-01-21 11:45:54	2025-01-21 13:58:54	2025-01-21 11:45:54
3328	845	2025-05-31 17:52:57	2025-05-31 23:24:57	2025-05-31 17:52:57
3329	790	2025-08-31 15:27:09	2025-08-31 19:32:09	2025-08-31 15:27:09
3330	15	2025-10-26 07:58:14	2025-10-26 09:29:14	2025-10-26 07:58:14
3331	121	2025-04-06 17:11:49	2025-04-06 21:20:49	2025-04-06 17:11:49
3332	589	2025-01-28 17:03:34	2025-01-28 18:22:34	2025-01-28 17:03:34
3333	490	2025-02-11 16:01:18	2025-02-11 21:57:18	2025-02-11 16:01:18
3334	985	2025-10-21 07:00:04	2025-10-21 08:19:04	2025-10-21 07:00:04
3335	457	2025-09-27 15:39:35	2025-09-27 21:10:35	2025-09-27 15:39:35
3336	244	2025-09-27 13:58:02	2025-09-27 19:21:02	2025-09-27 13:58:02
3337	778	2025-06-28 16:00:29	2025-06-28 18:16:29	2025-06-28 16:00:29
3338	788	2025-02-18 15:41:51	2025-02-18 20:32:51	2025-02-18 15:41:51
3339	826	2024-12-29 16:14:46	2024-12-29 18:11:46	2024-12-29 16:14:46
3340	627	2025-05-06 13:29:56	2025-05-06 19:05:56	2025-05-06 13:29:56
3341	963	2025-03-11 16:30:10	2025-03-11 22:12:10	2025-03-11 16:30:10
3342	922	2025-05-20 14:44:44	2025-05-20 20:34:44	2025-05-20 14:44:44
3343	594	2025-03-29 15:03:31	2025-03-29 19:22:31	2025-03-29 15:03:31
3344	143	2024-11-10 16:32:12	2024-11-10 20:22:12	2024-11-10 16:32:12
3345	349	2024-12-03 08:50:04	2024-12-03 12:58:04	2024-12-03 08:50:04
3346	689	2025-09-23 16:04:23	2025-09-23 21:39:23	2025-09-23 16:04:23
3347	541	2025-03-16 17:42:53	2025-03-16 21:27:53	2025-03-16 17:42:53
3348	243	2025-04-26 14:58:18	2025-04-26 18:49:18	2025-04-26 14:58:18
3349	115	2024-12-08 16:20:09	2024-12-08 17:55:09	2024-12-08 16:20:09
3350	599	2025-06-28 14:12:54	2025-06-28 18:27:54	2025-06-28 14:12:54
3351	389	2025-06-21 12:09:57	2025-06-21 15:51:57	2025-06-21 12:09:57
3352	594	2024-11-30 17:32:09	2024-11-30 21:29:09	2024-11-30 17:32:09
3353	773	2024-11-19 15:59:19	2024-11-19 20:29:19	2024-11-19 15:59:19
3354	419	2024-12-10 17:12:42	2024-12-10 22:51:42	2024-12-10 17:12:42
3355	607	2025-10-21 15:08:10	2025-10-21 18:18:10	2025-10-21 15:08:10
3356	469	2025-09-23 09:30:56	2025-09-23 14:14:56	2025-09-23 09:30:56
3357	936	2025-03-29 05:49:39	2025-03-29 07:22:39	2025-03-29 05:49:39
3358	615	2025-01-07 19:25:16	2025-01-07 22:00:16	2025-01-07 19:25:16
3359	623	2025-02-23 11:07:12	2025-02-23 17:01:12	2025-02-23 11:07:12
3360	702	2025-10-14 07:07:25	2025-10-14 08:31:25	2025-10-14 07:07:25
3361	516	2025-07-01 16:11:59	2025-07-01 17:29:59	2025-07-01 16:11:59
3362	318	2025-08-10 15:53:39	2025-08-10 21:07:39	2025-08-10 15:53:39
3363	680	2025-10-24 09:16:34	2025-10-24 11:46:34	2025-10-24 09:16:34
3364	683	2025-10-12 14:07:47	2025-10-12 18:32:47	2025-10-12 14:07:47
3365	569	2025-08-09 14:34:38	2025-08-09 17:34:38	2025-08-09 14:34:38
3366	59	2025-04-07 23:03:51	2025-04-08 00:08:51	2025-04-07 23:03:51
3367	100	2024-12-21 05:26:39	2024-12-21 07:32:39	2024-12-21 05:26:39
3368	35	2025-03-25 15:02:59	2025-03-25 17:56:59	2025-03-25 15:02:59
3369	89	2025-09-09 14:57:44	2025-09-09 16:00:44	2025-09-09 14:57:44
3370	779	2025-05-27 18:10:23	2025-05-27 21:50:23	2025-05-27 18:10:23
3371	429	2025-02-11 17:32:33	2025-02-11 21:08:33	2025-02-11 17:32:33
3372	180	2025-02-23 18:15:34	2025-02-23 23:25:34	2025-02-23 18:15:34
3373	849	2024-12-03 19:18:19	2024-12-04 00:17:19	2024-12-03 19:18:19
3374	738	2025-02-23 15:37:17	2025-02-23 20:35:17	2025-02-23 15:37:17
3375	852	2025-08-30 16:09:22	2025-08-30 19:22:22	2025-08-30 16:09:22
3376	664	2025-05-06 14:28:29	2025-05-06 16:16:29	2025-05-06 14:28:29
3377	836	2024-12-07 18:24:24	2024-12-07 23:13:24	2024-12-07 18:24:24
3378	387	2025-02-08 16:21:23	2025-02-08 19:57:23	2025-02-08 16:21:23
3379	73	2025-07-27 14:36:47	2025-07-27 18:50:47	2025-07-27 14:36:47
3380	840	2025-08-31 15:17:03	2025-08-31 17:04:03	2025-08-31 15:17:03
3381	766	2025-01-05 17:57:07	2025-01-05 20:09:07	2025-01-05 17:57:07
3382	541	2025-09-10 15:24:33	2025-09-10 18:33:33	2025-09-10 15:24:33
3383	307	2025-01-15 20:04:53	2025-01-15 23:47:53	2025-01-15 20:04:53
3384	793	2025-08-19 14:26:14	2025-08-19 16:29:14	2025-08-19 14:26:14
3385	317	2025-07-22 15:36:24	2025-07-22 20:57:24	2025-07-22 15:36:24
3386	507	2025-10-19 12:26:01	2025-10-19 16:36:01	2025-10-19 12:26:01
3387	733	2025-10-26 17:02:09	2025-10-26 19:03:09	2025-10-26 17:02:09
3388	584	2025-07-05 08:54:43	2025-07-05 13:53:43	2025-07-05 08:54:43
3389	841	2025-05-27 14:12:35	2025-05-27 18:15:35	2025-05-27 14:12:35
3390	916	2024-12-08 16:07:31	2024-12-08 17:12:31	2024-12-08 16:07:31
3391	937	2025-01-28 18:22:26	2025-01-28 21:09:26	2025-01-28 18:22:26
3392	574	2025-09-30 16:16:44	2025-09-30 21:47:44	2025-09-30 16:16:44
3393	273	2025-01-07 19:04:53	2025-01-07 20:04:53	2025-01-07 19:04:53
3394	179	2025-06-29 11:16:28	2025-06-29 12:35:28	2025-06-29 11:16:28
3395	939	2025-10-14 16:56:56	2025-10-14 19:08:56	2025-10-14 16:56:56
3396	527	2025-05-10 15:34:17	2025-05-10 21:05:17	2025-05-10 15:34:17
3397	901	2025-07-08 16:42:15	2025-07-08 17:49:15	2025-07-08 16:42:15
3398	149	2025-06-26 06:42:35	2025-06-26 11:21:35	2025-06-26 06:42:35
3399	176	2025-06-28 18:34:16	2025-06-29 00:24:16	2025-06-28 18:34:16
3400	501	2025-03-11 16:50:12	2025-03-11 20:40:12	2025-03-11 16:50:12
3401	205	2025-04-29 11:13:27	2025-04-29 15:48:27	2025-04-29 11:13:27
3402	61	2025-09-28 17:47:39	2025-09-28 20:14:39	2025-09-28 17:47:39
3403	992	2025-04-05 14:39:02	2025-04-05 16:06:02	2025-04-05 14:39:02
3404	211	2025-06-22 16:03:01	2025-06-22 19:53:01	2025-06-22 16:03:01
3405	458	2025-04-05 14:26:10	2025-04-05 15:56:10	2025-04-05 14:26:10
3406	790	2025-09-21 10:35:02	2025-09-21 12:15:02	2025-09-21 10:35:02
3407	46	2025-07-04 18:25:35	2025-07-04 20:38:35	2025-07-04 18:25:35
3408	135	2025-10-04 16:14:50	2025-10-04 20:04:50	2025-10-04 16:14:50
3409	153	2025-03-11 16:51:55	2025-03-11 19:45:55	2025-03-11 16:51:55
3410	534	2025-05-27 18:07:45	2025-05-28 00:04:45	2025-05-27 18:07:45
3411	657	2025-07-15 16:25:17	2025-07-15 20:06:17	2025-07-15 16:25:17
3412	625	2024-12-28 16:24:57	2024-12-28 22:02:57	2024-12-28 16:24:57
3413	739	2025-07-29 14:57:09	2025-07-29 17:18:09	2025-07-29 14:57:09
3414	387	2025-04-05 14:17:45	2025-04-05 16:45:45	2025-04-05 14:17:45
3415	730	2025-03-11 16:59:40	2025-03-11 18:02:40	2025-03-11 16:59:40
3416	706	2025-08-30 15:45:01	2025-08-30 20:43:01	2025-08-30 15:45:01
3417	909	2025-07-29 14:50:21	2025-07-29 16:59:21	2025-07-29 14:50:21
3418	854	2025-02-25 13:20:02	2025-02-25 15:57:02	2025-02-25 13:20:02
3419	967	2025-03-30 14:03:25	2025-03-30 18:33:25	2025-03-30 14:03:25
3420	858	2025-07-26 15:49:45	2025-07-26 20:31:45	2025-07-26 15:49:45
3421	682	2025-03-08 19:24:04	2025-03-08 21:42:04	2025-03-08 19:24:04
3422	413	2025-06-28 14:45:52	2025-06-28 17:36:52	2025-06-28 14:45:52
3423	362	2025-08-03 14:38:08	2025-08-03 18:49:08	2025-08-03 14:38:08
3424	777	2025-01-05 05:39:39	2025-01-05 08:07:39	2025-01-05 05:39:39
3425	720	2024-11-17 16:15:43	2024-11-17 22:10:43	2024-11-17 16:15:43
3426	775	2025-01-12 17:32:37	2025-01-12 21:47:37	2025-01-12 17:32:37
3427	387	2024-12-17 17:20:13	2024-12-17 18:53:13	2024-12-17 17:20:13
3428	993	2024-12-24 19:42:41	2024-12-24 23:26:41	2024-12-24 19:42:41
3429	406	2025-05-27 16:09:41	2025-05-27 18:39:41	2025-05-27 16:09:41
3430	839	2025-03-11 18:15:23	2025-03-11 20:47:23	2025-03-11 18:15:23
3431	305	2025-06-25 16:05:53	2025-06-25 17:59:53	2025-06-25 16:05:53
3432	667	2025-09-14 15:26:46	2025-09-14 19:02:46	2025-09-14 15:26:46
3433	535	2025-07-27 11:50:07	2025-07-27 13:15:07	2025-07-27 11:50:07
3434	191	2025-01-04 05:40:17	2025-01-04 07:38:17	2025-01-04 05:40:17
3435	902	2025-10-14 16:55:34	2025-10-14 21:21:34	2025-10-14 16:55:34
3436	38	2025-04-26 07:19:47	2025-04-26 08:35:47	2025-04-26 07:19:47
3437	872	2025-02-18 14:42:10	2025-02-18 19:31:10	2025-02-18 14:42:10
3438	981	2024-11-16 12:00:29	2024-11-16 17:42:29	2024-11-16 12:00:29
3439	424	2025-02-15 09:32:24	2025-02-15 12:15:24	2025-02-15 09:32:24
3440	840	2025-01-12 16:11:40	2025-01-12 18:13:40	2025-01-12 16:11:40
3441	984	2025-03-07 17:52:25	2025-03-07 23:00:25	2025-03-07 17:52:25
3442	664	2024-11-30 17:46:15	2024-11-30 21:07:15	2024-11-30 17:46:15
3443	799	2024-11-10 22:47:26	2024-11-11 03:44:26	2024-11-10 22:47:26
3444	908	2025-07-19 23:55:11	2025-07-20 04:47:11	2025-07-19 23:55:11
3445	687	2025-04-05 08:49:14	2025-04-05 11:03:14	2025-04-05 08:49:14
3446	989	2025-06-29 19:33:04	2025-06-29 23:18:04	2025-06-29 19:33:04
3447	936	2025-01-12 16:26:10	2025-01-12 19:17:10	2025-01-12 16:26:10
3448	248	2025-10-25 14:13:44	2025-10-25 15:36:44	2025-10-25 14:13:44
3449	357	2025-07-08 12:43:58	2025-07-08 15:41:58	2025-07-08 12:43:58
3450	620	2025-03-15 17:53:11	2025-03-15 22:02:11	2025-03-15 17:53:11
3451	719	2025-02-08 15:06:34	2025-02-08 16:06:34	2025-02-08 15:06:34
3452	680	2025-04-29 16:38:47	2025-04-29 21:43:47	2025-04-29 16:38:47
3453	311	2025-02-15 18:21:16	2025-02-15 23:09:16	2025-02-15 18:21:16
3454	297	2025-04-19 14:40:34	2025-04-19 19:17:34	2025-04-19 14:40:34
3455	62	2025-02-04 18:43:36	2025-02-04 23:49:36	2025-02-04 18:43:36
3456	200	2025-10-28 15:02:23	2025-10-28 20:06:23	2025-10-28 15:02:23
3457	895	2025-05-06 14:16:57	2025-05-06 17:54:57	2025-05-06 14:16:57
3458	491	2025-06-28 16:19:24	2025-06-28 17:34:24	2025-06-28 16:19:24
3459	818	2025-08-19 16:14:19	2025-08-19 17:51:19	2025-08-19 16:14:19
3460	759	2025-01-18 18:15:35	2025-01-18 22:56:35	2025-01-18 18:15:35
3461	937	2024-12-08 15:19:55	2024-12-08 17:31:55	2024-12-08 15:19:55
3462	395	2025-04-08 18:42:38	2025-04-08 22:42:38	2025-04-08 18:42:38
3463	645	2025-09-30 12:23:29	2025-09-30 14:27:29	2025-09-30 12:23:29
3464	579	2025-01-11 15:32:18	2025-01-11 18:02:18	2025-01-11 15:32:18
3465	231	2024-12-22 17:59:08	2024-12-22 19:57:08	2024-12-22 17:59:08
3466	67	2024-12-21 07:22:16	2024-12-21 09:19:16	2024-12-21 07:22:16
3467	571	2025-05-07 15:37:34	2025-05-07 17:30:34	2025-05-07 15:37:34
3468	496	2025-02-18 17:36:47	2025-02-18 21:36:47	2025-02-18 17:36:47
3469	562	2025-02-04 16:54:49	2025-02-04 22:44:49	2025-02-04 16:54:49
3470	980	2025-02-15 04:09:29	2025-02-15 10:07:29	2025-02-15 04:09:29
3471	32	2025-10-25 15:10:25	2025-10-25 18:05:25	2025-10-25 15:10:25
3472	54	2025-08-09 15:43:31	2025-08-09 17:47:31	2025-08-09 15:43:31
3473	118	2025-05-21 17:00:40	2025-05-21 20:35:40	2025-05-21 17:00:40
3474	172	2025-08-24 18:42:21	2025-08-24 22:59:21	2025-08-24 18:42:21
3475	489	2025-05-25 17:34:18	2025-05-25 20:47:18	2025-05-25 17:34:18
3476	876	2025-09-16 04:55:27	2025-09-16 07:38:27	2025-09-16 04:55:27
3477	863	2024-11-15 17:42:26	2024-11-15 21:43:26	2024-11-15 17:42:26
3478	808	2025-03-15 15:15:46	2025-03-15 19:00:46	2025-03-15 15:15:46
3479	371	2024-12-31 15:38:54	2024-12-31 17:12:54	2024-12-31 15:38:54
3480	421	2025-05-03 15:34:46	2025-05-03 20:19:46	2025-05-03 15:34:46
3481	845	2025-06-03 15:20:49	2025-06-03 18:27:49	2025-06-03 15:20:49
3482	573	2024-12-24 18:56:39	2024-12-24 22:24:39	2024-12-24 18:56:39
3483	321	2025-10-07 12:26:52	2025-10-07 16:39:52	2025-10-07 12:26:52
3484	531	2025-09-13 07:30:04	2025-09-13 10:56:04	2025-09-13 07:30:04
3485	983	2025-04-20 15:31:46	2025-04-20 20:28:46	2025-04-20 15:31:46
3486	791	2025-10-25 14:02:27	2025-10-25 18:35:27	2025-10-25 14:02:27
3487	809	2025-04-08 14:45:26	2025-04-08 16:36:26	2025-04-08 14:45:26
3488	68	2025-03-09 08:25:24	2025-03-09 10:26:24	2025-03-09 08:25:24
3489	53	2024-12-17 18:28:25	2024-12-17 21:58:25	2024-12-17 18:28:25
3490	767	2025-03-09 17:01:59	2025-03-09 19:14:59	2025-03-09 17:01:59
3491	574	2025-08-24 16:56:30	2025-08-24 18:32:30	2025-08-24 16:56:30
3492	521	2025-06-24 14:08:31	2025-06-24 20:03:31	2025-06-24 14:08:31
3493	956	2025-08-19 17:34:37	2025-08-19 23:11:37	2025-08-19 17:34:37
3494	416	2025-08-02 13:01:22	2025-08-02 15:04:22	2025-08-02 13:01:22
3495	774	2025-10-19 04:31:12	2025-10-19 08:28:12	2025-10-19 04:31:12
3496	713	2025-05-06 15:26:52	2025-05-06 19:47:52	2025-05-06 15:26:52
3497	207	2025-07-12 06:14:32	2025-07-12 08:46:32	2025-07-12 06:14:32
3498	931	2025-06-24 14:43:04	2025-06-24 18:06:04	2025-06-24 14:43:04
3499	672	2025-02-18 16:44:41	2025-02-18 20:02:41	2025-02-18 16:44:41
3500	942	2024-12-22 15:45:17	2024-12-22 17:26:17	2024-12-22 15:45:17
3501	363	2024-11-23 16:22:19	2024-11-23 17:26:19	2024-11-23 16:22:19
3502	937	2025-06-28 17:54:58	2025-06-28 21:22:58	2025-06-28 17:54:58
3503	234	2025-06-08 15:58:31	2025-06-08 20:50:31	2025-06-08 15:58:31
3504	448	2025-05-20 14:37:18	2025-05-20 16:30:18	2025-05-20 14:37:18
3505	950	2025-05-13 14:21:32	2025-05-13 20:07:32	2025-05-13 14:21:32
3506	635	2025-06-14 16:28:25	2025-06-14 19:01:25	2025-06-14 16:28:25
3507	45	2024-12-24 17:49:47	2024-12-24 20:13:47	2024-12-24 17:49:47
3508	565	2025-01-07 15:52:56	2025-01-07 19:18:56	2025-01-07 15:52:56
3509	989	2025-04-26 17:27:28	2025-04-26 20:36:28	2025-04-26 17:27:28
3510	424	2025-03-15 18:53:27	2025-03-15 20:20:27	2025-03-15 18:53:27
3511	963	2024-12-14 16:24:07	2024-12-14 18:12:07	2024-12-14 16:24:07
3512	116	2025-08-09 18:24:42	2025-08-09 21:47:42	2025-08-09 18:24:42
3513	241	2025-07-06 15:47:37	2025-07-06 21:23:37	2025-07-06 15:47:37
3514	393	2025-03-11 15:17:58	2025-03-11 18:31:58	2025-03-11 15:17:58
3515	25	2025-05-06 16:10:36	2025-05-06 18:11:36	2025-05-06 16:10:36
3516	375	2025-04-06 14:48:17	2025-04-06 17:30:17	2025-04-06 14:48:17
3517	472	2025-07-29 18:03:25	2025-07-29 19:17:25	2025-07-29 18:03:25
3518	565	2025-02-18 16:20:22	2025-02-18 18:05:22	2025-02-18 16:20:22
3519	695	2025-05-13 09:41:57	2025-05-13 12:41:57	2025-05-13 09:41:57
3520	901	2025-03-01 19:53:41	2025-03-01 23:51:41	2025-03-01 19:53:41
3521	861	2025-07-04 16:18:15	2025-07-04 19:51:15	2025-07-04 16:18:15
3522	214	2025-08-24 17:38:15	2025-08-24 18:48:15	2025-08-24 17:38:15
3523	831	2025-10-28 17:02:18	2025-10-28 19:13:18	2025-10-28 17:02:18
3524	55	2025-08-16 09:53:12	2025-08-16 12:33:12	2025-08-16 09:53:12
3525	711	2025-03-09 17:52:52	2025-03-09 21:15:52	2025-03-09 17:52:52
3526	538	2025-01-20 23:11:25	2025-01-21 02:18:25	2025-01-20 23:11:25
3527	582	2025-07-15 17:04:38	2025-07-15 20:44:38	2025-07-15 17:04:38
3528	379	2025-09-02 16:48:30	2025-09-02 19:36:30	2025-09-02 16:48:30
3529	314	2025-09-26 18:32:26	2025-09-26 22:45:26	2025-09-26 18:32:26
3530	577	2025-10-07 15:43:17	2025-10-07 19:58:17	2025-10-07 15:43:17
3531	968	2025-01-25 16:42:33	2025-01-25 19:06:33	2025-01-25 16:42:33
3532	605	2024-12-14 15:57:42	2024-12-14 18:33:42	2024-12-14 15:57:42
3533	458	2025-01-19 12:51:36	2025-01-19 15:30:36	2025-01-19 12:51:36
3534	707	2025-03-16 15:01:02	2025-03-16 19:22:02	2025-03-16 15:01:02
3535	96	2025-08-13 15:56:19	2025-08-13 18:43:19	2025-08-13 15:56:19
3536	982	2025-09-23 14:12:23	2025-09-23 20:07:23	2025-09-23 14:12:23
3537	663	2024-12-11 15:44:31	2024-12-11 17:58:31	2024-12-11 15:44:31
3538	736	2025-06-03 16:47:32	2025-06-03 18:29:32	2025-06-03 16:47:32
3539	896	2024-12-29 18:10:42	2024-12-29 22:59:42	2024-12-29 18:10:42
3540	180	2025-05-27 16:39:26	2025-05-27 18:10:26	2025-05-27 16:39:26
3541	830	2025-02-08 16:18:48	2025-02-08 17:51:48	2025-02-08 16:18:48
3542	672	2025-09-02 17:43:04	2025-09-02 20:52:04	2025-09-02 17:43:04
3543	806	2025-03-11 16:42:48	2025-03-11 22:26:48	2025-03-11 16:42:48
3544	825	2025-07-11 06:36:44	2025-07-11 09:44:44	2025-07-11 06:36:44
3545	274	2024-12-03 17:23:28	2024-12-03 20:26:28	2024-12-03 17:23:28
3546	653	2025-01-07 17:19:04	2025-01-07 22:49:04	2025-01-07 17:19:04
3547	866	2025-04-22 14:36:08	2025-04-22 16:26:08	2025-04-22 14:36:08
3548	10	2025-03-25 15:42:26	2025-03-25 16:52:26	2025-03-25 15:42:26
3549	778	2024-12-31 15:46:33	2024-12-31 18:58:33	2024-12-31 15:46:33
3550	337	2025-08-30 15:58:22	2025-08-30 21:44:22	2025-08-30 15:58:22
3551	626	2025-02-04 17:40:35	2025-02-04 22:56:35	2025-02-04 17:40:35
3552	437	2025-06-03 14:29:21	2025-06-03 20:22:21	2025-06-03 14:29:21
3553	923	2024-12-14 15:05:10	2024-12-14 19:32:10	2024-12-14 15:05:10
3554	347	2025-06-10 07:21:54	2025-06-10 08:52:54	2025-06-10 07:21:54
3555	220	2025-10-25 10:11:11	2025-10-25 14:15:11	2025-10-25 10:11:11
3556	927	2025-06-24 16:59:37	2025-06-24 18:57:37	2025-06-24 16:59:37
3557	882	2025-07-20 15:32:25	2025-07-20 17:33:25	2025-07-20 15:32:25
3558	747	2025-07-19 15:00:39	2025-07-19 20:36:39	2025-07-19 15:00:39
3559	336	2025-06-21 16:38:25	2025-06-21 21:40:25	2025-06-21 16:38:25
3560	648	2025-09-23 15:15:20	2025-09-23 17:15:20	2025-09-23 15:15:20
3561	370	2025-07-01 17:40:49	2025-07-01 21:45:49	2025-07-01 17:40:49
3562	308	2025-03-04 17:48:27	2025-03-04 22:02:27	2025-03-04 17:48:27
3563	689	2025-06-03 15:49:59	2025-06-03 17:38:59	2025-06-03 15:49:59
3564	308	2024-11-30 06:20:27	2024-11-30 11:23:27	2024-11-30 06:20:27
3565	258	2025-06-28 17:04:44	2025-06-28 20:42:44	2025-06-28 17:04:44
3566	145	2025-09-02 14:07:41	2025-09-02 19:33:41	2025-09-02 14:07:41
3567	975	2025-10-28 17:23:51	2025-10-28 19:52:51	2025-10-28 17:23:51
3568	65	2024-12-17 07:51:50	2024-12-17 12:36:50	2024-12-17 07:51:50
3569	520	2025-03-11 19:33:45	2025-03-11 22:56:45	2025-03-11 19:33:45
3570	488	2025-03-04 15:27:27	2025-03-04 18:47:27	2025-03-04 15:27:27
3571	250	2025-05-17 10:44:55	2025-05-17 13:05:55	2025-05-17 10:44:55
3572	304	2025-01-28 11:17:00	2025-01-28 14:45:00	2025-01-28 11:17:00
3573	754	2025-07-22 08:19:33	2025-07-22 12:58:33	2025-07-22 08:19:33
3574	455	2025-07-01 04:03:58	2025-07-01 06:25:58	2025-07-01 04:03:58
3575	537	2024-12-22 16:32:37	2024-12-22 17:36:37	2024-12-22 16:32:37
3576	934	2025-04-12 10:09:30	2025-04-12 12:46:30	2025-04-12 10:09:30
3577	958	2024-11-29 17:57:29	2024-11-29 23:39:29	2024-11-29 17:57:29
3578	243	2025-03-02 19:18:31	2025-03-02 23:05:31	2025-03-02 19:18:31
3579	980	2025-02-03 12:41:42	2025-02-03 16:42:42	2025-02-03 12:41:42
3580	994	2025-05-18 15:02:43	2025-05-18 16:32:43	2025-05-18 15:02:43
3581	488	2025-03-15 16:58:24	2025-03-15 20:53:24	2025-03-15 16:58:24
3582	584	2025-07-01 16:33:49	2025-07-01 19:32:49	2025-07-01 16:33:49
3583	479	2025-03-02 16:34:55	2025-03-02 18:27:55	2025-03-02 16:34:55
3584	951	2025-07-27 16:24:59	2025-07-27 18:55:59	2025-07-27 16:24:59
3585	194	2025-07-15 16:57:28	2025-07-15 21:32:28	2025-07-15 16:57:28
3586	234	2025-03-23 22:12:24	2025-03-24 02:54:24	2025-03-23 22:12:24
3587	995	2025-10-12 14:25:57	2025-10-12 17:57:57	2025-10-12 14:25:57
3588	288	2025-07-13 14:21:06	2025-07-13 20:11:06	2025-07-13 14:21:06
3589	484	2025-06-07 16:54:27	2025-06-07 21:30:27	2025-06-07 16:54:27
3590	997	2025-05-13 15:31:15	2025-05-13 18:37:15	2025-05-13 15:31:15
3591	195	2024-12-10 18:08:38	2024-12-10 19:36:38	2024-12-10 18:08:38
3592	369	2024-12-07 19:51:23	2024-12-07 21:09:23	2024-12-07 19:51:23
3593	658	2025-09-28 06:46:20	2025-09-28 12:04:20	2025-09-28 06:46:20
3594	482	2025-10-21 17:30:05	2025-10-21 22:10:05	2025-10-21 17:30:05
3595	303	2025-04-01 15:57:04	2025-04-01 21:07:04	2025-04-01 15:57:04
3596	140	2025-05-17 14:52:14	2025-05-17 19:14:14	2025-05-17 14:52:14
3597	968	2025-04-27 08:22:57	2025-04-27 11:36:57	2025-04-27 08:22:57
3598	34	2025-11-02 15:07:11	2025-11-02 21:04:11	2025-11-02 15:07:11
3599	378	2025-10-07 15:01:59	2025-10-07 20:29:59	2025-10-07 15:01:59
3600	660	2025-04-23 17:53:20	2025-04-23 18:59:20	2025-04-23 17:53:20
3601	256	2025-03-03 15:58:28	2025-03-03 19:18:28	2025-03-03 15:58:28
3602	173	2024-11-19 17:42:29	2024-11-19 21:26:29	2024-11-19 17:42:29
3603	950	2025-08-23 14:37:46	2025-08-23 20:21:46	2025-08-23 14:37:46
3604	867	2025-10-05 17:19:59	2025-10-05 21:09:59	2025-10-05 17:19:59
3605	767	2025-01-12 15:02:15	2025-01-12 17:33:15	2025-01-12 15:02:15
3606	295	2025-03-16 05:33:06	2025-03-16 10:30:06	2025-03-16 05:33:06
3607	152	2025-10-19 15:08:11	2025-10-19 19:42:11	2025-10-19 15:08:11
3608	29	2025-08-23 17:24:59	2025-08-23 22:00:59	2025-08-23 17:24:59
3609	182	2025-06-15 14:45:36	2025-06-15 18:06:36	2025-06-15 14:45:36
3610	693	2025-09-16 16:20:10	2025-09-16 18:47:10	2025-09-16 16:20:10
3611	526	2024-12-03 15:14:43	2024-12-03 18:48:43	2024-12-03 15:14:43
3612	99	2025-07-27 14:28:50	2025-07-27 17:18:50	2025-07-27 14:28:50
3613	271	2024-11-19 16:15:54	2024-11-19 18:27:54	2024-11-19 16:15:54
3614	903	2025-11-02 10:02:27	2025-11-02 12:50:27	2025-11-02 10:02:27
3615	733	2025-10-14 06:32:50	2025-10-14 10:28:50	2025-10-14 06:32:50
3616	534	2024-12-24 15:31:07	2024-12-24 17:42:07	2024-12-24 15:31:07
3617	755	2025-08-24 14:29:28	2025-08-24 17:27:28	2025-08-24 14:29:28
3618	418	2025-04-26 19:01:56	2025-04-26 20:15:56	2025-04-26 19:01:56
3619	752	2025-11-02 17:48:44	2025-11-02 22:52:44	2025-11-02 17:48:44
3620	25	2025-06-07 23:43:54	2025-06-08 05:25:54	2025-06-07 23:43:54
3621	508	2024-11-16 15:53:06	2024-11-16 17:36:06	2024-11-16 15:53:06
3622	877	2025-04-26 17:41:02	2025-04-26 21:10:02	2025-04-26 17:41:02
3623	74	2025-08-03 14:42:36	2025-08-03 16:20:36	2025-08-03 14:42:36
3624	308	2025-07-19 07:41:51	2025-07-19 13:11:51	2025-07-19 07:41:51
3625	850	2025-02-02 16:30:49	2025-02-02 20:54:49	2025-02-02 16:30:49
3626	765	2024-12-05 17:53:48	2024-12-05 19:44:48	2024-12-05 17:53:48
3627	898	2025-05-18 14:14:33	2025-05-18 18:22:33	2025-05-18 14:14:33
3628	487	2025-07-13 16:29:11	2025-07-13 20:05:11	2025-07-13 16:29:11
3629	703	2025-03-22 17:42:36	2025-03-22 21:50:36	2025-03-22 17:42:36
3630	747	2024-12-07 05:05:46	2024-12-07 10:30:46	2024-12-07 05:05:46
3631	839	2025-10-07 15:10:45	2025-10-07 18:04:45	2025-10-07 15:10:45
3632	51	2025-03-22 15:57:39	2025-03-22 20:33:39	2025-03-22 15:57:39
3633	618	2025-11-02 13:14:20	2025-11-02 19:10:20	2025-11-02 13:14:20
3634	403	2025-05-20 10:02:57	2025-05-20 11:57:57	2025-05-20 10:02:57
3635	61	2025-02-15 15:30:13	2025-02-15 18:27:13	2025-02-15 15:30:13
3636	87	2025-06-28 15:56:25	2025-06-28 20:01:25	2025-06-28 15:56:25
3637	955	2024-12-31 09:05:23	2024-12-31 13:30:23	2024-12-31 09:05:23
3638	865	2025-09-13 14:34:47	2025-09-13 15:44:47	2025-09-13 14:34:47
3639	106	2025-09-14 08:45:43	2025-09-14 11:11:43	2025-09-14 08:45:43
3640	549	2025-04-15 16:36:39	2025-04-15 19:58:39	2025-04-15 16:36:39
3641	838	2025-08-12 15:18:48	2025-08-12 21:17:48	2025-08-12 15:18:48
3642	288	2025-06-28 18:30:39	2025-06-28 19:34:39	2025-06-28 18:30:39
3643	398	2025-05-18 12:47:22	2025-05-18 18:23:22	2025-05-18 12:47:22
3644	83	2024-11-16 15:05:50	2024-11-16 18:23:50	2024-11-16 15:05:50
3645	55	2025-04-12 15:34:40	2025-04-12 20:38:40	2025-04-12 15:34:40
3646	504	2025-09-27 18:04:55	2025-09-27 22:23:55	2025-09-27 18:04:55
3647	639	2024-11-12 16:27:50	2024-11-12 18:28:50	2024-11-12 16:27:50
3648	345	2025-02-15 16:04:47	2025-02-15 19:10:47	2025-02-15 16:04:47
3649	57	2024-12-17 19:57:52	2024-12-18 01:05:52	2024-12-17 19:57:52
3650	755	2025-07-15 15:29:35	2025-07-15 21:24:35	2025-07-15 15:29:35
3651	339	2025-01-28 19:42:20	2025-01-28 22:06:20	2025-01-28 19:42:20
3652	639	2025-04-27 15:48:45	2025-04-27 19:28:45	2025-04-27 15:48:45
3653	204	2025-09-21 20:52:05	2025-09-21 22:53:05	2025-09-21 20:52:05
3654	19	2024-11-22 05:09:44	2024-11-22 11:01:44	2024-11-22 05:09:44
3655	516	2025-04-10 17:26:34	2025-04-10 21:37:34	2025-04-10 17:26:34
3656	372	2024-12-07 15:12:33	2024-12-07 17:52:33	2024-12-07 15:12:33
3657	644	2025-03-13 19:38:22	2025-03-14 00:30:22	2025-03-13 19:38:22
3658	272	2025-08-30 05:12:03	2025-08-30 07:02:03	2025-08-30 05:12:03
3659	120	2025-04-22 07:25:49	2025-04-22 09:34:49	2025-04-22 07:25:49
3660	749	2025-08-09 15:43:10	2025-08-09 21:02:10	2025-08-09 15:43:10
3661	729	2025-01-11 17:26:34	2025-01-11 22:41:34	2025-01-11 17:26:34
3662	467	2025-04-29 04:14:25	2025-04-29 07:29:25	2025-04-29 04:14:25
3663	580	2025-01-04 09:01:34	2025-01-04 13:06:34	2025-01-04 09:01:34
3664	156	2025-04-13 14:38:14	2025-04-13 16:32:14	2025-04-13 14:38:14
3665	767	2025-02-25 12:51:09	2025-02-25 14:09:09	2025-02-25 12:51:09
3666	106	2024-11-23 12:42:35	2024-11-23 17:03:35	2024-11-23 12:42:35
3667	805	2025-07-13 16:18:11	2025-07-13 19:43:11	2025-07-13 16:18:11
3668	647	2025-07-22 16:04:36	2025-07-22 20:07:36	2025-07-22 16:04:36
3669	913	2025-04-13 15:19:23	2025-04-13 18:10:23	2025-04-13 15:19:23
3670	256	2025-02-23 16:50:39	2025-02-23 18:00:39	2025-02-23 16:50:39
3671	812	2024-12-07 17:14:52	2024-12-07 21:11:52	2024-12-07 17:14:52
3672	368	2025-11-02 17:18:28	2025-11-02 22:56:28	2025-11-02 17:18:28
3673	698	2025-07-15 17:10:46	2025-07-15 19:01:46	2025-07-15 17:10:46
3674	636	2025-07-22 14:20:38	2025-07-22 19:43:38	2025-07-22 14:20:38
3675	630	2025-04-29 16:18:24	2025-04-29 17:21:24	2025-04-29 16:18:24
3676	114	2025-03-18 15:38:39	2025-03-18 17:39:39	2025-03-18 15:38:39
3677	708	2025-03-02 16:11:31	2025-03-02 20:41:31	2025-03-02 16:11:31
3678	896	2025-06-17 17:33:28	2025-06-17 20:48:28	2025-06-17 17:33:28
3679	737	2025-03-29 15:49:07	2025-03-29 18:43:07	2025-03-29 15:49:07
3680	494	2025-07-08 15:49:31	2025-07-08 21:43:31	2025-07-08 15:49:31
3681	867	2024-12-31 06:15:46	2024-12-31 08:43:46	2024-12-31 06:15:46
3682	340	2025-07-26 15:30:31	2025-07-26 21:29:31	2025-07-26 15:30:31
3683	616	2024-12-29 16:10:43	2024-12-29 21:57:43	2024-12-29 16:10:43
3684	939	2025-03-30 18:21:31	2025-03-30 21:49:31	2025-03-30 18:21:31
3685	644	2025-01-11 18:46:06	2025-01-11 21:45:06	2025-01-11 18:46:06
3686	22	2024-12-22 07:23:34	2024-12-22 11:37:34	2024-12-22 07:23:34
3687	982	2025-03-04 15:51:45	2025-03-04 19:35:45	2025-03-04 15:51:45
3688	293	2025-04-27 16:48:36	2025-04-27 18:12:36	2025-04-27 16:48:36
3689	920	2025-01-11 15:54:04	2025-01-11 18:22:04	2025-01-11 15:54:04
3690	135	2025-02-24 17:48:05	2025-02-24 23:04:05	2025-02-24 17:48:05
3691	573	2025-05-27 16:53:10	2025-05-27 22:22:10	2025-05-27 16:53:10
3692	410	2025-08-31 09:42:00	2025-08-31 10:46:00	2025-08-31 09:42:00
3693	749	2024-12-14 16:36:54	2024-12-14 20:17:54	2024-12-14 16:36:54
3694	392	2025-07-27 10:05:06	2025-07-27 13:55:06	2025-07-27 10:05:06
3695	208	2025-05-18 15:46:05	2025-05-18 17:41:05	2025-05-18 15:46:05
3696	365	2025-03-18 10:21:42	2025-03-18 15:26:42	2025-03-18 10:21:42
3697	527	2025-08-16 16:44:54	2025-08-16 21:51:54	2025-08-16 16:44:54
3698	401	2024-11-24 15:20:44	2024-11-24 17:59:44	2024-11-24 15:20:44
3699	369	2025-04-06 15:10:20	2025-04-06 20:43:20	2025-04-06 15:10:20
3700	491	2025-01-21 12:32:15	2025-01-21 17:52:15	2025-01-21 12:32:15
3701	24	2025-06-28 09:15:48	2025-06-28 10:31:48	2025-06-28 09:15:48
3702	67	2025-09-30 18:13:26	2025-09-30 22:35:26	2025-09-30 18:13:26
3703	919	2025-08-03 16:38:49	2025-08-03 19:19:49	2025-08-03 16:38:49
3704	597	2025-08-10 08:00:55	2025-08-10 11:21:55	2025-08-10 08:00:55
3705	399	2025-08-19 10:34:24	2025-08-19 11:45:24	2025-08-19 10:34:24
3706	148	2025-10-05 14:21:21	2025-10-05 17:27:21	2025-10-05 14:21:21
3707	909	2025-09-16 15:57:56	2025-09-16 19:45:56	2025-09-16 15:57:56
3708	598	2025-10-12 16:54:27	2025-10-12 20:23:27	2025-10-12 16:54:27
3709	128	2025-10-05 15:07:26	2025-10-05 20:48:26	2025-10-05 15:07:26
3710	347	2025-02-09 17:11:29	2025-02-09 20:10:29	2025-02-09 17:11:29
3711	34	2025-01-28 15:34:40	2025-01-28 20:32:40	2025-01-28 15:34:40
3712	116	2025-06-24 18:58:59	2025-06-24 22:46:59	2025-06-24 18:58:59
3713	870	2025-09-21 13:08:09	2025-09-21 15:37:09	2025-09-21 13:08:09
3714	195	2025-04-27 15:51:50	2025-04-27 19:21:50	2025-04-27 15:51:50
3715	32	2025-08-12 05:54:45	2025-08-12 09:16:45	2025-08-12 05:54:45
3716	457	2025-10-24 15:50:32	2025-10-24 21:13:32	2025-10-24 15:50:32
3717	612	2025-06-22 15:24:34	2025-06-22 20:48:34	2025-06-22 15:24:34
3718	232	2025-06-07 14:03:23	2025-06-07 17:45:23	2025-06-07 14:03:23
3719	586	2025-09-20 14:14:27	2025-09-20 16:55:27	2025-09-20 14:14:27
3720	960	2025-08-30 16:25:10	2025-08-30 18:17:10	2025-08-30 16:25:10
3721	559	2025-04-27 11:20:24	2025-04-27 17:00:24	2025-04-27 11:20:24
3722	563	2025-09-27 17:54:02	2025-09-27 21:45:02	2025-09-27 17:54:02
3723	629	2025-08-05 15:18:15	2025-08-05 17:41:15	2025-08-05 15:18:15
3724	516	2025-08-22 17:46:26	2025-08-22 22:08:26	2025-08-22 17:46:26
3725	721	2025-02-12 18:18:00	2025-02-12 23:57:00	2025-02-12 18:18:00
3726	780	2024-11-19 19:31:33	2024-11-19 23:31:33	2024-11-19 19:31:33
3727	338	2024-11-10 16:26:36	2024-11-10 21:52:36	2024-11-10 16:26:36
3728	842	2025-08-16 14:04:43	2025-08-16 17:59:43	2025-08-16 14:04:43
3729	346	2025-03-03 17:13:29	2025-03-03 19:17:29	2025-03-03 17:13:29
3730	477	2025-10-24 18:27:58	2025-10-24 19:47:58	2025-10-24 18:27:58
3731	742	2025-07-27 16:16:07	2025-07-27 19:19:07	2025-07-27 16:16:07
3732	88	2025-10-05 16:35:59	2025-10-05 18:35:59	2025-10-05 16:35:59
3733	306	2025-05-24 15:57:48	2025-05-24 19:43:48	2025-05-24 15:57:48
3734	178	2025-04-08 14:19:21	2025-04-08 18:45:21	2025-04-08 14:19:21
3735	908	2025-07-13 15:15:30	2025-07-13 17:16:30	2025-07-13 15:15:30
3736	385	2025-11-05 17:30:40	2025-11-05 22:09:40	2025-11-05 17:30:40
3737	353	2025-10-07 05:50:00	2025-10-07 09:13:00	2025-10-07 05:50:00
3738	755	2024-12-24 17:25:43	2024-12-24 23:12:43	2024-12-24 17:25:43
3739	419	2024-11-26 19:27:49	2024-11-27 00:13:49	2024-11-26 19:27:49
3740	938	2025-03-11 17:59:06	2025-03-11 22:59:06	2025-03-11 17:59:06
3741	28	2025-07-12 18:24:43	2025-07-12 20:22:43	2025-07-12 18:24:43
3742	941	2025-08-17 09:27:41	2025-08-17 12:11:41	2025-08-17 09:27:41
3743	121	2025-09-14 14:23:38	2025-09-14 17:07:38	2025-09-14 14:23:38
3744	323	2024-12-29 15:09:51	2024-12-29 16:14:51	2024-12-29 15:09:51
3745	994	2024-11-16 16:06:42	2024-11-16 21:12:42	2024-11-16 16:06:42
3746	611	2025-01-09 12:52:11	2025-01-09 18:47:11	2025-01-09 12:52:11
3747	402	2025-05-31 15:36:53	2025-05-31 20:39:53	2025-05-31 15:36:53
3748	385	2025-05-24 17:35:34	2025-05-24 22:17:34	2025-05-24 17:35:34
3749	459	2025-06-02 22:43:29	2025-06-03 02:25:29	2025-06-02 22:43:29
3750	533	2025-06-08 15:48:28	2025-06-08 20:02:28	2025-06-08 15:48:28
3751	101	2025-07-12 06:39:16	2025-07-12 08:10:16	2025-07-12 06:39:16
3752	16	2025-06-01 14:50:03	2025-06-01 20:04:03	2025-06-01 14:50:03
3753	829	2025-02-11 17:00:08	2025-02-11 19:34:08	2025-02-11 17:00:08
3754	643	2025-02-09 19:36:30	2025-02-09 21:53:30	2025-02-09 19:36:30
3755	211	2025-03-01 08:37:38	2025-03-01 12:29:38	2025-03-01 08:37:38
3756	571	2024-12-10 11:48:14	2024-12-10 16:11:14	2024-12-10 11:48:14
3757	549	2025-02-08 15:56:50	2025-02-08 18:39:50	2025-02-08 15:56:50
3758	951	2025-01-26 06:34:51	2025-01-26 09:04:51	2025-01-26 06:34:51
3759	851	2025-07-20 16:36:47	2025-07-20 22:30:47	2025-07-20 16:36:47
3760	642	2025-07-22 17:47:05	2025-07-22 23:32:05	2025-07-22 17:47:05
3761	185	2025-05-27 01:48:47	2025-05-27 03:12:47	2025-05-27 01:48:47
3762	898	2025-07-27 16:21:23	2025-07-27 19:24:23	2025-07-27 16:21:23
3763	112	2025-09-07 18:10:04	2025-09-08 00:04:04	2025-09-07 18:10:04
3764	746	2025-01-19 16:47:44	2025-01-19 19:49:44	2025-01-19 16:47:44
3765	323	2025-11-04 17:19:05	2025-11-04 20:41:05	2025-11-04 17:19:05
3766	671	2025-04-12 14:03:26	2025-04-12 19:18:26	2025-04-12 14:03:26
3767	765	2024-11-17 16:36:16	2024-11-17 22:28:16	2024-11-17 16:36:16
3768	402	2025-03-05 16:35:58	2025-03-05 19:11:58	2025-03-05 16:35:58
3769	199	2025-10-12 13:43:34	2025-10-12 15:32:34	2025-10-12 13:43:34
3770	873	2024-11-21 16:41:34	2024-11-21 17:43:34	2024-11-21 16:41:34
3771	946	2025-10-28 16:31:05	2025-10-28 17:46:05	2025-10-28 16:31:05
3772	481	2024-12-09 19:46:57	2024-12-09 23:14:57	2024-12-09 19:46:57
3773	672	2025-02-11 21:42:08	2025-02-12 01:00:08	2025-02-11 21:42:08
3774	623	2025-04-20 11:48:42	2025-04-20 13:11:42	2025-04-20 11:48:42
3775	843	2025-06-01 16:15:10	2025-06-01 20:33:10	2025-06-01 16:15:10
3776	695	2025-09-23 15:17:58	2025-09-23 20:27:58	2025-09-23 15:17:58
3777	482	2025-05-27 14:47:52	2025-05-27 17:10:52	2025-05-27 14:47:52
3778	890	2025-05-03 12:51:26	2025-05-03 18:13:26	2025-05-03 12:51:26
3779	538	2024-11-17 15:06:17	2024-11-17 17:30:17	2024-11-17 15:06:17
3780	577	2025-09-14 15:16:36	2025-09-14 19:55:36	2025-09-14 15:16:36
3781	662	2025-11-04 22:38:22	2025-11-05 03:13:22	2025-11-04 22:38:22
3782	295	2025-08-03 15:57:57	2025-08-03 19:44:57	2025-08-03 15:57:57
3783	342	2025-03-11 15:00:12	2025-03-11 17:38:12	2025-03-11 15:00:12
3784	198	2025-06-28 18:48:03	2025-06-28 23:57:03	2025-06-28 18:48:03
3785	161	2025-10-26 19:43:50	2025-10-27 00:44:50	2025-10-26 19:43:50
3786	473	2025-01-21 15:43:05	2025-01-21 19:16:05	2025-01-21 15:43:05
3787	39	2025-09-28 16:41:57	2025-09-28 19:34:57	2025-09-28 16:41:57
3788	848	2024-12-10 22:33:49	2024-12-11 00:06:49	2024-12-10 22:33:49
3789	585	2025-03-04 09:32:37	2025-03-04 11:57:37	2025-03-04 09:32:37
3790	971	2025-03-30 15:56:23	2025-03-30 17:45:23	2025-03-30 15:56:23
3791	692	2025-02-12 15:17:10	2025-02-12 20:51:10	2025-02-12 15:17:10
3792	365	2025-03-04 15:43:00	2025-03-04 20:32:00	2025-03-04 15:43:00
3793	60	2025-03-30 18:43:32	2025-03-30 20:11:32	2025-03-30 18:43:32
3794	616	2025-08-09 14:28:21	2025-08-09 15:51:21	2025-08-09 14:28:21
3795	871	2025-04-05 05:43:39	2025-04-05 11:05:39	2025-04-05 05:43:39
3796	538	2024-12-31 18:24:50	2024-12-31 21:54:50	2024-12-31 18:24:50
3797	622	2025-04-29 14:16:15	2025-04-29 15:45:15	2025-04-29 14:16:15
3798	396	2025-02-02 17:06:48	2025-02-02 19:42:48	2025-02-02 17:06:48
3799	62	2025-04-05 11:10:25	2025-04-05 15:13:25	2025-04-05 11:10:25
3800	681	2025-04-01 15:38:25	2025-04-01 20:04:25	2025-04-01 15:38:25
3801	52	2025-08-26 16:40:39	2025-08-26 20:43:39	2025-08-26 16:40:39
3802	679	2025-10-26 17:07:31	2025-10-26 20:55:31	2025-10-26 17:07:31
3803	779	2025-07-22 16:04:13	2025-07-22 20:57:13	2025-07-22 16:04:13
3804	327	2025-10-19 14:26:54	2025-10-19 20:12:54	2025-10-19 14:26:54
3805	860	2025-05-13 16:21:11	2025-05-13 21:27:11	2025-05-13 16:21:11
3806	246	2024-11-26 16:36:17	2024-11-26 21:20:17	2024-11-26 16:36:17
3807	182	2025-04-22 14:55:29	2025-04-22 19:35:29	2025-04-22 14:55:29
3808	100	2025-08-12 17:00:33	2025-08-12 19:17:33	2025-08-12 17:00:33
3809	932	2024-12-28 16:44:41	2024-12-28 21:13:41	2024-12-28 16:44:41
3810	905	2025-03-24 16:02:26	2025-03-24 20:47:26	2025-03-24 16:02:26
3811	34	2025-07-29 08:33:58	2025-07-29 12:56:58	2025-07-29 08:33:58
3812	702	2025-02-16 02:00:25	2025-02-16 04:00:25	2025-02-16 02:00:25
3813	962	2025-02-08 16:31:22	2025-02-08 18:58:22	2025-02-08 16:31:22
3814	778	2025-08-26 19:55:33	2025-08-26 23:27:33	2025-08-26 19:55:33
3815	598	2025-03-11 19:00:29	2025-03-12 00:31:29	2025-03-11 19:00:29
3816	818	2025-01-04 15:36:38	2025-01-04 17:12:38	2025-01-04 15:36:38
3817	671	2025-08-05 16:58:11	2025-08-05 21:55:11	2025-08-05 16:58:11
3818	406	2025-01-19 19:37:22	2025-01-19 23:15:22	2025-01-19 19:37:22
3819	64	2025-01-26 15:40:53	2025-01-26 19:48:53	2025-01-26 15:40:53
3820	568	2025-05-20 14:49:49	2025-05-20 20:43:49	2025-05-20 14:49:49
3821	348	2024-11-30 15:33:38	2024-11-30 18:28:38	2024-11-30 15:33:38
3822	793	2025-09-23 10:08:23	2025-09-23 14:48:23	2025-09-23 10:08:23
3823	97	2025-06-21 15:56:03	2025-06-21 20:54:03	2025-06-21 15:56:03
3824	58	2025-07-08 12:35:19	2025-07-08 15:57:19	2025-07-08 12:35:19
3825	975	2025-02-25 17:26:10	2025-02-25 20:33:10	2025-02-25 17:26:10
3826	402	2025-08-31 13:20:10	2025-08-31 18:40:10	2025-08-31 13:20:10
3827	157	2024-12-31 09:18:08	2024-12-31 12:37:08	2024-12-31 09:18:08
3828	431	2025-08-24 17:18:55	2025-08-24 19:52:55	2025-08-24 17:18:55
3829	896	2025-07-15 15:22:41	2025-07-15 19:29:41	2025-07-15 15:22:41
3830	711	2025-11-01 17:31:07	2025-11-01 22:19:07	2025-11-01 17:31:07
3831	774	2024-11-09 17:52:35	2024-11-09 23:09:35	2024-11-09 17:52:35
3832	299	2025-06-22 09:36:37	2025-06-22 10:44:37	2025-06-22 09:36:37
3833	284	2025-10-18 15:11:12	2025-10-18 17:32:12	2025-10-18 15:11:12
3834	798	2025-08-09 16:31:02	2025-08-09 21:56:02	2025-08-09 16:31:02
3835	74	2025-03-11 19:05:36	2025-03-12 00:47:36	2025-03-11 19:05:36
3836	960	2025-02-18 15:16:18	2025-02-18 16:43:18	2025-02-18 15:16:18
3837	625	2025-05-11 14:10:31	2025-05-11 19:04:31	2025-05-11 14:10:31
3838	971	2025-10-19 21:22:03	2025-10-20 02:13:03	2025-10-19 21:22:03
3839	829	2024-11-19 19:40:49	2024-11-19 23:41:49	2024-11-19 19:40:49
3840	686	2025-05-19 23:44:00	2025-05-20 01:57:00	2025-05-19 23:44:00
3841	97	2025-05-14 15:01:02	2025-05-14 19:47:02	2025-05-14 15:01:02
3842	577	2025-04-27 14:49:53	2025-04-27 15:55:53	2025-04-27 14:49:53
3843	926	2025-05-06 16:49:39	2025-05-06 18:54:39	2025-05-06 16:49:39
3844	594	2025-05-06 05:19:36	2025-05-06 07:30:36	2025-05-06 05:19:36
3845	533	2024-12-07 15:20:21	2024-12-07 20:42:21	2024-12-07 15:20:21
3846	828	2025-04-12 17:37:13	2025-04-12 20:54:13	2025-04-12 17:37:13
3847	166	2024-11-10 15:04:43	2024-11-10 17:08:43	2024-11-10 15:04:43
3848	213	2025-06-28 06:40:41	2025-06-28 10:37:41	2025-06-28 06:40:41
3849	64	2025-03-08 16:25:20	2025-03-08 19:47:20	2025-03-08 16:25:20
3850	341	2025-10-07 14:11:25	2025-10-07 19:07:25	2025-10-07 14:11:25
3851	783	2025-05-06 16:23:53	2025-05-06 19:10:53	2025-05-06 16:23:53
3852	692	2025-04-19 14:12:02	2025-04-19 16:05:02	2025-04-19 14:12:02
3853	523	2024-11-19 17:14:58	2024-11-19 19:30:58	2024-11-19 17:14:58
3854	771	2025-07-19 17:36:51	2025-07-19 21:22:51	2025-07-19 17:36:51
3855	59	2024-12-07 17:16:18	2024-12-07 22:38:18	2024-12-07 17:16:18
3856	81	2024-12-14 16:57:04	2024-12-14 22:43:04	2024-12-14 16:57:04
3857	526	2025-09-28 03:51:55	2025-09-28 09:26:55	2025-09-28 03:51:55
3858	217	2024-11-30 16:03:34	2024-11-30 18:16:34	2024-11-30 16:03:34
3859	948	2025-10-25 14:11:52	2025-10-25 16:09:52	2025-10-25 14:11:52
3860	462	2025-10-07 16:46:30	2025-10-07 19:38:30	2025-10-07 16:46:30
3861	807	2025-10-14 16:28:44	2025-10-14 21:21:44	2025-10-14 16:28:44
3862	73	2025-03-01 15:54:17	2025-03-01 18:57:17	2025-03-01 15:54:17
3863	535	2025-06-01 16:11:40	2025-06-01 21:10:40	2025-06-01 16:11:40
3864	650	2025-07-06 16:58:51	2025-07-06 22:01:51	2025-07-06 16:58:51
3865	878	2025-07-19 16:26:40	2025-07-19 20:44:40	2025-07-19 16:26:40
3866	107	2025-03-25 15:28:20	2025-03-25 18:21:20	2025-03-25 15:28:20
3867	700	2025-03-10 17:18:47	2025-03-10 20:04:47	2025-03-10 17:18:47
3868	15	2025-02-22 17:31:09	2025-02-22 22:55:09	2025-02-22 17:31:09
3869	273	2025-02-15 15:39:38	2025-02-15 16:59:38	2025-02-15 15:39:38
3870	663	2024-11-17 08:59:23	2024-11-17 14:03:23	2024-11-17 08:59:23
3871	536	2024-11-25 10:25:02	2024-11-25 15:45:02	2024-11-25 10:25:02
3872	755	2025-02-23 10:49:46	2025-02-23 12:04:46	2025-02-23 10:49:46
3873	372	2024-11-19 16:49:47	2024-11-19 22:39:47	2024-11-19 16:49:47
3874	979	2025-04-13 17:40:24	2025-04-13 21:05:24	2025-04-13 17:40:24
3875	51	2025-03-01 06:30:29	2025-03-01 09:25:29	2025-03-01 06:30:29
3876	763	2025-08-30 14:47:56	2025-08-30 16:31:56	2025-08-30 14:47:56
3877	621	2024-11-16 09:47:19	2024-11-16 14:59:19	2024-11-16 09:47:19
3878	605	2025-06-28 00:37:38	2025-06-28 06:19:38	2025-06-28 00:37:38
3879	590	2025-03-11 16:28:47	2025-03-11 21:01:47	2025-03-11 16:28:47
3880	105	2024-11-09 15:44:44	2024-11-09 20:33:44	2024-11-09 15:44:44
3881	887	2024-12-30 15:01:22	2024-12-30 17:42:22	2024-12-30 15:01:22
3882	34	2025-07-07 14:45:10	2025-07-07 18:06:10	2025-07-07 14:45:10
3883	137	2025-04-29 17:22:28	2025-04-29 22:25:28	2025-04-29 17:22:28
3884	563	2025-06-15 17:32:23	2025-06-15 18:35:23	2025-06-15 17:32:23
3885	191	2025-04-27 16:53:22	2025-04-27 19:52:22	2025-04-27 16:53:22
3886	863	2025-05-17 18:20:22	2025-05-17 20:06:22	2025-05-17 18:20:22
3887	941	2025-03-01 18:46:56	2025-03-01 21:12:56	2025-03-01 18:46:56
3888	967	2024-11-10 08:55:58	2024-11-10 11:09:58	2024-11-10 08:55:58
3889	641	2025-09-09 16:43:41	2025-09-09 21:08:41	2025-09-09 16:43:41
3890	207	2025-04-22 14:45:46	2025-04-22 19:18:46	2025-04-22 14:45:46
3891	656	2025-07-26 15:28:24	2025-07-26 19:33:24	2025-07-26 15:28:24
3892	688	2025-04-15 16:04:04	2025-04-15 21:30:04	2025-04-15 16:04:04
3893	326	2025-08-19 05:46:53	2025-08-19 06:47:53	2025-08-19 05:46:53
3894	780	2025-11-01 07:02:51	2025-11-01 11:47:51	2025-11-01 07:02:51
3895	544	2025-10-12 15:12:23	2025-10-12 16:48:23	2025-10-12 15:12:23
3896	514	2025-08-03 14:52:15	2025-08-03 18:54:15	2025-08-03 14:52:15
3897	499	2025-01-21 17:42:13	2025-01-21 22:56:13	2025-01-21 17:42:13
3898	29	2025-04-15 07:33:00	2025-04-15 10:02:00	2025-04-15 07:33:00
3899	791	2025-01-28 16:01:14	2025-01-28 17:26:14	2025-01-28 16:01:14
3900	108	2025-03-22 16:58:36	2025-03-22 22:29:36	2025-03-22 16:58:36
3901	302	2024-12-07 15:35:50	2024-12-07 19:52:50	2024-12-07 15:35:50
3902	323	2025-04-26 14:51:31	2025-04-26 16:11:31	2025-04-26 14:51:31
3903	975	2025-01-28 18:13:27	2025-01-28 22:36:27	2025-01-28 18:13:27
3904	757	2025-04-13 22:58:09	2025-04-14 01:59:09	2025-04-13 22:58:09
3905	698	2024-12-29 16:44:54	2024-12-29 21:55:54	2024-12-29 16:44:54
3906	538	2025-07-22 15:51:39	2025-07-22 21:21:39	2025-07-22 15:51:39
3907	183	2025-06-17 15:37:36	2025-06-17 16:37:36	2025-06-17 15:37:36
3908	523	2024-12-28 18:14:07	2024-12-28 21:33:07	2024-12-28 18:14:07
3909	743	2025-03-11 19:13:54	2025-03-11 23:06:54	2025-03-11 19:13:54
3910	970	2025-10-26 17:36:16	2025-10-26 23:26:16	2025-10-26 17:36:16
3911	591	2025-02-11 06:25:38	2025-02-11 08:48:38	2025-02-11 06:25:38
3912	89	2025-05-25 08:52:57	2025-05-25 13:49:57	2025-05-25 08:52:57
3913	816	2025-05-17 16:00:48	2025-05-17 20:35:48	2025-05-17 16:00:48
3914	246	2025-04-15 15:33:44	2025-04-15 17:37:44	2025-04-15 15:33:44
3915	897	2025-09-28 14:51:17	2025-09-28 17:11:17	2025-09-28 14:51:17
3916	532	2025-09-30 14:45:20	2025-09-30 17:23:20	2025-09-30 14:45:20
3917	457	2025-11-02 15:52:15	2025-11-02 18:14:15	2025-11-02 15:52:15
3918	810	2025-06-09 23:13:31	2025-06-10 00:48:31	2025-06-09 23:13:31
3919	883	2025-07-15 14:14:13	2025-07-15 19:12:13	2025-07-15 14:14:13
3920	565	2025-07-20 15:12:48	2025-07-20 17:52:48	2025-07-20 15:12:48
3921	289	2025-07-08 13:01:56	2025-07-08 15:46:56	2025-07-08 13:01:56
3922	294	2025-08-16 17:49:16	2025-08-16 21:12:16	2025-08-16 17:49:16
3923	56	2025-02-16 13:10:19	2025-02-16 16:42:19	2025-02-16 13:10:19
3924	866	2025-03-22 14:53:38	2025-03-22 16:04:38	2025-03-22 14:53:38
3925	552	2024-11-30 15:09:22	2024-11-30 16:15:22	2024-11-30 15:09:22
3926	917	2025-09-16 15:21:34	2025-09-16 19:31:34	2025-09-16 15:21:34
3927	751	2025-07-29 08:17:27	2025-07-29 10:59:27	2025-07-29 08:17:27
3928	849	2024-12-15 15:11:06	2024-12-15 19:38:06	2024-12-15 15:11:06
3929	99	2025-10-14 14:37:48	2025-10-14 20:23:48	2025-10-14 14:37:48
3930	380	2025-06-17 15:17:57	2025-06-17 17:40:57	2025-06-17 15:17:57
3931	584	2025-03-23 17:56:22	2025-03-23 19:50:22	2025-03-23 17:56:22
3932	929	2025-02-16 18:52:01	2025-02-16 22:41:01	2025-02-16 18:52:01
3933	579	2025-09-06 14:14:20	2025-09-06 17:53:20	2025-09-06 14:14:20
3934	148	2025-10-04 10:05:23	2025-10-04 13:00:23	2025-10-04 10:05:23
3935	661	2025-03-08 10:34:04	2025-03-08 12:14:04	2025-03-08 10:34:04
3936	830	2025-05-03 16:21:07	2025-05-03 19:36:07	2025-05-03 16:21:07
3937	343	2024-12-04 16:48:14	2024-12-04 21:58:14	2024-12-04 16:48:14
3938	979	2025-05-05 10:28:55	2025-05-05 15:38:55	2025-05-05 10:28:55
3939	935	2024-11-13 18:24:17	2024-11-13 21:12:17	2024-11-13 18:24:17
3940	849	2025-07-08 16:53:27	2025-07-08 19:56:27	2025-07-08 16:53:27
3941	475	2025-06-28 14:58:17	2025-06-28 19:23:17	2025-06-28 14:58:17
3942	302	2025-06-03 14:39:27	2025-06-03 18:11:27	2025-06-03 14:39:27
3943	712	2024-12-07 15:10:41	2024-12-07 20:14:41	2024-12-07 15:10:41
3944	669	2025-06-03 11:51:34	2025-06-03 17:10:34	2025-06-03 11:51:34
3945	731	2025-05-24 14:36:35	2025-05-24 17:58:35	2025-05-24 14:36:35
3946	820	2025-10-25 03:44:27	2025-10-25 08:47:27	2025-10-25 03:44:27
3947	366	2025-02-22 16:16:48	2025-02-22 18:44:48	2025-02-22 16:16:48
3948	467	2025-05-10 15:15:44	2025-05-10 20:01:44	2025-05-10 15:15:44
3949	769	2025-10-21 14:41:52	2025-10-21 18:08:52	2025-10-21 14:41:52
3950	76	2025-05-04 04:48:57	2025-05-04 06:28:57	2025-05-04 04:48:57
3951	661	2025-10-27 16:41:39	2025-10-27 19:52:39	2025-10-27 16:41:39
3952	399	2025-10-07 16:50:17	2025-10-07 21:55:17	2025-10-07 16:50:17
3953	215	2025-04-20 16:30:59	2025-04-20 19:20:59	2025-04-20 16:30:59
3954	289	2025-06-07 16:59:01	2025-06-07 18:36:01	2025-06-07 16:59:01
3955	676	2025-09-16 14:40:47	2025-09-16 16:08:47	2025-09-16 14:40:47
3956	876	2025-06-10 16:50:21	2025-06-10 18:10:21	2025-06-10 16:50:21
3957	73	2025-02-22 15:34:20	2025-02-22 20:21:20	2025-02-22 15:34:20
3958	435	2025-07-13 15:03:44	2025-07-13 17:59:44	2025-07-13 15:03:44
3959	407	2025-10-07 18:13:16	2025-10-07 22:24:16	2025-10-07 18:13:16
3960	641	2025-04-06 05:33:37	2025-04-06 08:02:37	2025-04-06 05:33:37
3961	582	2025-07-22 15:31:25	2025-07-22 18:44:25	2025-07-22 15:31:25
3962	93	2025-08-23 14:57:55	2025-08-23 19:53:55	2025-08-23 14:57:55
3963	830	2025-10-19 15:09:39	2025-10-19 18:21:39	2025-10-19 15:09:39
3964	732	2025-04-18 17:25:53	2025-04-18 21:16:53	2025-04-18 17:25:53
3965	698	2025-04-13 11:15:46	2025-04-13 12:31:46	2025-04-13 11:15:46
3966	360	2025-02-09 15:23:24	2025-02-09 18:37:24	2025-02-09 15:23:24
3967	242	2025-07-26 15:17:36	2025-07-26 18:19:36	2025-07-26 15:17:36
3968	377	2024-12-22 06:12:49	2024-12-22 09:16:49	2024-12-22 06:12:49
3969	151	2025-02-18 11:54:29	2025-02-18 15:55:29	2025-02-18 11:54:29
3970	866	2025-07-26 13:39:14	2025-07-26 18:56:14	2025-07-26 13:39:14
3971	628	2025-06-07 14:27:07	2025-06-07 20:26:07	2025-06-07 14:27:07
3972	61	2025-05-11 15:48:59	2025-05-11 20:35:59	2025-05-11 15:48:59
3973	104	2025-08-30 14:59:00	2025-08-30 17:52:00	2025-08-30 14:59:00
3974	656	2025-02-01 16:58:39	2025-02-01 19:49:39	2025-02-01 16:58:39
3975	744	2025-09-23 17:22:44	2025-09-23 20:43:44	2025-09-23 17:22:44
3976	722	2025-01-04 15:56:22	2025-01-04 17:28:22	2025-01-04 15:56:22
3977	492	2025-11-01 05:00:17	2025-11-01 10:37:17	2025-11-01 05:00:17
3978	835	2025-02-18 03:08:51	2025-02-18 08:17:51	2025-02-18 03:08:51
3979	533	2024-11-26 16:32:25	2024-11-26 18:41:25	2024-11-26 16:32:25
3980	10	2025-02-11 17:27:14	2025-02-11 22:23:14	2025-02-11 17:27:14
3981	896	2025-06-07 18:45:39	2025-06-08 00:21:39	2025-06-07 18:45:39
3982	556	2025-03-16 17:48:28	2025-03-16 20:11:28	2025-03-16 17:48:28
3983	669	2025-02-02 01:55:00	2025-02-02 04:49:00	2025-02-02 01:55:00
3984	937	2025-07-15 18:05:52	2025-07-15 22:24:52	2025-07-15 18:05:52
3985	336	2025-07-27 14:25:00	2025-07-27 17:36:00	2025-07-27 14:25:00
3986	522	2025-05-20 15:43:03	2025-05-20 21:19:03	2025-05-20 15:43:03
3987	269	2025-03-09 16:54:49	2025-03-09 19:08:49	2025-03-09 16:54:49
3988	903	2025-05-25 11:31:26	2025-05-25 15:39:26	2025-05-25 11:31:26
3989	433	2025-04-19 04:11:40	2025-04-19 07:11:40	2025-04-19 04:11:40
3990	258	2025-02-01 16:11:21	2025-02-01 17:33:21	2025-02-01 16:11:21
3991	899	2025-03-25 15:01:44	2025-03-25 19:42:44	2025-03-25 15:01:44
3992	50	2025-11-02 11:10:50	2025-11-02 15:04:50	2025-11-02 11:10:50
3993	635	2025-09-16 16:11:23	2025-09-16 18:37:23	2025-09-16 16:11:23
3994	656	2025-03-29 15:50:25	2025-03-29 20:18:25	2025-03-29 15:50:25
3995	704	2024-12-31 16:39:16	2024-12-31 21:33:16	2024-12-31 16:39:16
3996	585	2025-10-04 14:14:28	2025-10-04 18:44:28	2025-10-04 14:14:28
3997	562	2025-08-16 17:18:53	2025-08-16 23:12:53	2025-08-16 17:18:53
3998	572	2025-09-14 14:13:53	2025-09-14 16:34:53	2025-09-14 14:13:53
3999	31	2025-07-14 23:15:36	2025-07-15 02:08:36	2025-07-14 23:15:36
4000	835	2025-10-13 14:53:53	2025-10-13 20:16:53	2025-10-13 14:53:53
4001	811	2025-08-10 04:18:29	2025-08-10 08:28:29	2025-08-10 04:18:29
4002	267	2025-06-08 15:06:33	2025-06-08 17:39:33	2025-06-08 15:06:33
4003	258	2025-08-11 14:53:12	2025-08-11 16:45:12	2025-08-11 14:53:12
4004	235	2025-09-16 10:22:28	2025-09-16 12:46:28	2025-09-16 10:22:28
4005	334	2024-12-31 15:15:23	2024-12-31 17:40:23	2024-12-31 15:15:23
4006	579	2025-09-02 02:54:47	2025-09-02 04:45:47	2025-09-02 02:54:47
4007	842	2024-11-16 17:28:18	2024-11-16 18:46:18	2024-11-16 17:28:18
4008	652	2025-07-26 15:23:16	2025-07-26 16:32:16	2025-07-26 15:23:16
4009	773	2024-12-22 15:01:53	2024-12-22 17:34:53	2024-12-22 15:01:53
4010	22	2025-02-25 18:34:54	2025-02-25 21:18:54	2025-02-25 18:34:54
4011	368	2025-07-20 16:52:18	2025-07-20 18:33:18	2025-07-20 16:52:18
4012	545	2025-07-19 16:08:34	2025-07-19 21:41:34	2025-07-19 16:08:34
4013	914	2025-08-24 15:49:53	2025-08-24 17:45:53	2025-08-24 15:49:53
4014	190	2025-09-01 15:31:42	2025-09-01 17:42:42	2025-09-01 15:31:42
4015	191	2025-01-21 05:46:44	2025-01-21 10:57:44	2025-01-21 05:46:44
4016	451	2025-01-18 18:33:16	2025-01-18 20:44:16	2025-01-18 18:33:16
4017	523	2024-12-14 11:48:35	2024-12-14 13:01:35	2024-12-14 11:48:35
4018	693	2025-09-13 16:58:40	2025-09-13 19:24:40	2025-09-13 16:58:40
4019	207	2025-05-05 16:34:52	2025-05-05 19:21:52	2025-05-05 16:34:52
4020	155	2025-06-01 18:16:36	2025-06-01 21:24:36	2025-06-01 18:16:36
4021	15	2025-06-21 08:44:04	2025-06-21 14:27:04	2025-06-21 08:44:04
4022	331	2025-04-27 15:18:04	2025-04-27 17:48:04	2025-04-27 15:18:04
4023	258	2024-12-29 16:19:09	2024-12-29 20:40:09	2024-12-29 16:19:09
4024	480	2025-02-11 15:38:25	2025-02-11 19:43:25	2025-02-11 15:38:25
4025	110	2025-04-15 15:20:09	2025-04-15 19:55:09	2025-04-15 15:20:09
4026	865	2025-04-16 14:19:34	2025-04-16 15:45:34	2025-04-16 14:19:34
4027	580	2025-04-27 14:14:06	2025-04-27 16:59:06	2025-04-27 14:14:06
4028	133	2025-08-02 18:40:43	2025-08-02 20:06:43	2025-08-02 18:40:43
4029	45	2025-04-13 05:18:35	2025-04-13 09:01:35	2025-04-13 05:18:35
4030	736	2025-07-05 12:21:46	2025-07-05 17:01:46	2025-07-05 12:21:46
4031	80	2025-08-30 16:14:02	2025-08-30 19:07:02	2025-08-30 16:14:02
4032	820	2025-07-29 15:20:20	2025-07-29 20:32:20	2025-07-29 15:20:20
4033	675	2025-06-24 10:49:55	2025-06-24 15:09:55	2025-06-24 10:49:55
4034	171	2024-12-03 16:25:28	2024-12-03 18:54:28	2024-12-03 16:25:28
4035	487	2025-08-12 14:11:08	2025-08-12 17:05:08	2025-08-12 14:11:08
4036	764	2025-02-15 15:36:18	2025-02-15 21:30:18	2025-02-15 15:36:18
4037	242	2024-11-09 15:42:52	2024-11-09 20:53:52	2024-11-09 15:42:52
4038	462	2025-01-19 07:08:46	2025-01-19 09:33:46	2025-01-19 07:08:46
4039	16	2025-06-08 14:33:57	2025-06-08 18:31:57	2025-06-08 14:33:57
4040	684	2025-02-11 15:01:58	2025-02-11 16:58:58	2025-02-11 15:01:58
4041	494	2025-09-02 16:00:39	2025-09-02 19:50:39	2025-09-02 16:00:39
4042	360	2025-08-16 17:25:29	2025-08-16 18:34:29	2025-08-16 17:25:29
4043	992	2025-04-05 08:54:48	2025-04-05 13:46:48	2025-04-05 08:54:48
4044	51	2025-10-14 06:05:30	2025-10-14 09:12:30	2025-10-14 06:05:30
4045	357	2025-01-21 17:21:12	2025-01-21 22:19:12	2025-01-21 17:21:12
4046	295	2025-05-27 16:23:25	2025-05-27 20:09:25	2025-05-27 16:23:25
4047	646	2025-02-16 05:21:04	2025-02-16 08:08:04	2025-02-16 05:21:04
4048	390	2025-08-11 05:58:42	2025-08-11 07:10:42	2025-08-11 05:58:42
4049	667	2024-12-29 17:13:02	2024-12-29 19:16:02	2024-12-29 17:13:02
4050	846	2025-01-21 15:39:48	2025-01-21 17:47:48	2025-01-21 15:39:48
4051	532	2025-02-22 17:47:07	2025-02-22 19:38:07	2025-02-22 17:47:07
4052	270	2025-03-29 17:27:02	2025-03-29 20:01:02	2025-03-29 17:27:02
4053	221	2025-07-27 15:59:39	2025-07-27 17:20:39	2025-07-27 15:59:39
4054	156	2025-04-26 18:51:18	2025-04-27 00:37:18	2025-04-26 18:51:18
4055	794	2025-03-09 16:51:51	2025-03-09 19:38:51	2025-03-09 16:51:51
4056	787	2025-02-01 13:59:19	2025-02-01 19:00:19	2025-02-01 13:59:19
4057	117	2025-01-12 15:42:55	2025-01-12 19:15:55	2025-01-12 15:42:55
4058	934	2025-03-04 17:14:13	2025-03-04 22:47:13	2025-03-04 17:14:13
4059	21	2025-05-04 16:35:34	2025-05-04 17:45:34	2025-05-04 16:35:34
4060	567	2024-12-17 17:58:16	2024-12-17 23:46:16	2024-12-17 17:58:16
4061	718	2025-04-19 15:46:57	2025-04-19 19:59:57	2025-04-19 15:46:57
4062	923	2025-04-27 14:40:31	2025-04-27 16:37:31	2025-04-27 14:40:31
4063	205	2025-02-04 19:37:11	2025-02-05 01:06:11	2025-02-04 19:37:11
4064	847	2025-05-10 15:24:59	2025-05-10 19:16:59	2025-05-10 15:24:59
4065	541	2025-02-11 11:26:35	2025-02-11 15:39:35	2025-02-11 11:26:35
4066	598	2025-01-10 09:51:00	2025-01-10 11:48:00	2025-01-10 09:51:00
4067	697	2025-02-23 19:44:41	2025-02-23 22:37:41	2025-02-23 19:44:41
4068	422	2025-08-05 14:26:09	2025-08-05 18:07:09	2025-08-05 14:26:09
4069	972	2025-07-05 23:53:41	2025-07-06 02:08:41	2025-07-05 23:53:41
4070	375	2025-05-20 10:01:40	2025-05-20 11:59:40	2025-05-20 10:01:40
4071	54	2025-08-17 18:33:53	2025-08-17 23:04:53	2025-08-17 18:33:53
4072	567	2025-03-18 17:19:38	2025-03-18 22:17:38	2025-03-18 17:19:38
4073	667	2024-11-30 14:45:00	2024-11-30 18:31:00	2024-11-30 14:45:00
4074	391	2025-05-10 11:06:55	2025-05-10 13:43:55	2025-05-10 11:06:55
4075	382	2025-01-18 15:56:05	2025-01-18 20:00:05	2025-01-18 15:56:05
4076	91	2025-03-18 17:46:02	2025-03-18 22:54:02	2025-03-18 17:46:02
4077	319	2025-01-14 15:26:48	2025-01-14 18:30:48	2025-01-14 15:26:48
4078	376	2025-06-07 17:23:00	2025-06-07 22:27:00	2025-06-07 17:23:00
4079	215	2025-09-10 15:17:05	2025-09-10 19:37:05	2025-09-10 15:17:05
4080	353	2025-07-30 00:54:03	2025-07-30 03:40:03	2025-07-30 00:54:03
4081	70	2025-05-13 15:34:55	2025-05-13 17:25:55	2025-05-13 15:34:55
4082	849	2024-12-01 17:39:00	2024-12-01 22:59:00	2024-12-01 17:39:00
4083	690	2025-06-10 14:01:39	2025-06-10 19:17:39	2025-06-10 14:01:39
4084	68	2025-07-11 23:20:53	2025-07-12 03:32:53	2025-07-11 23:20:53
4085	423	2025-09-16 09:27:41	2025-09-16 13:39:41	2025-09-16 09:27:41
4086	14	2024-11-12 09:58:37	2024-11-12 11:15:37	2024-11-12 09:58:37
4087	927	2025-08-03 05:18:18	2025-08-03 08:44:18	2025-08-03 05:18:18
4088	375	2025-09-28 18:25:40	2025-09-28 20:30:40	2025-09-28 18:25:40
4089	48	2025-01-18 18:16:46	2025-01-18 22:20:46	2025-01-18 18:16:46
4090	567	2025-06-07 15:45:38	2025-06-07 21:26:38	2025-06-07 15:45:38
4091	853	2025-07-01 16:36:31	2025-07-01 22:26:31	2025-07-01 16:36:31
4092	58	2025-08-26 15:35:14	2025-08-26 20:34:14	2025-08-26 15:35:14
4093	862	2025-04-27 15:00:05	2025-04-27 20:42:05	2025-04-27 15:00:05
4094	33	2025-03-30 12:46:25	2025-03-30 16:39:25	2025-03-30 12:46:25
4095	21	2025-03-11 11:30:50	2025-03-11 14:50:50	2025-03-11 11:30:50
4096	332	2025-01-28 19:33:13	2025-01-29 00:43:13	2025-01-28 19:33:13
4097	184	2025-04-11 15:10:35	2025-04-11 19:37:35	2025-04-11 15:10:35
4098	702	2025-10-12 14:21:24	2025-10-12 15:54:24	2025-10-12 14:21:24
4099	636	2025-07-12 18:58:00	2025-07-12 20:30:00	2025-07-12 18:58:00
4100	86	2025-07-06 15:24:58	2025-07-06 18:11:58	2025-07-06 15:24:58
4101	476	2025-05-11 06:24:14	2025-05-11 10:28:14	2025-05-11 06:24:14
4102	88	2025-09-12 15:34:12	2025-09-12 16:40:12	2025-09-12 15:34:12
4103	108	2025-10-04 05:47:03	2025-10-04 08:26:03	2025-10-04 05:47:03
4104	245	2025-09-16 14:28:15	2025-09-16 17:51:15	2025-09-16 14:28:15
4105	401	2025-05-20 14:59:45	2025-05-20 20:37:45	2025-05-20 14:59:45
4106	722	2025-06-17 16:28:18	2025-06-17 17:28:18	2025-06-17 16:28:18
4107	650	2025-05-04 04:36:35	2025-05-04 09:38:35	2025-05-04 04:36:35
4108	650	2025-06-15 08:39:35	2025-06-15 12:26:35	2025-06-15 08:39:35
4109	499	2025-05-17 20:06:57	2025-05-18 00:52:57	2025-05-17 20:06:57
4110	351	2025-03-29 16:16:23	2025-03-29 18:18:23	2025-03-29 16:16:23
4111	95	2025-06-03 15:43:34	2025-06-03 18:46:34	2025-06-03 15:43:34
4112	172	2025-06-21 16:30:26	2025-06-21 18:25:26	2025-06-21 16:30:26
4113	863	2025-10-05 14:56:52	2025-10-05 16:19:52	2025-10-05 14:56:52
4114	652	2025-11-01 15:48:39	2025-11-01 19:24:39	2025-11-01 15:48:39
4115	653	2025-08-23 15:19:10	2025-08-23 19:19:10	2025-08-23 15:19:10
4116	944	2024-11-30 15:07:54	2024-11-30 20:28:54	2024-11-30 15:07:54
4117	406	2024-12-08 14:23:24	2024-12-08 16:36:24	2024-12-08 14:23:24
4118	81	2025-01-11 12:28:36	2025-01-11 17:17:36	2025-01-11 12:28:36
4119	813	2025-06-21 16:45:52	2025-06-21 18:38:52	2025-06-21 16:45:52
4120	942	2025-01-04 15:00:11	2025-01-04 18:49:11	2025-01-04 15:00:11
4121	991	2025-10-28 15:08:49	2025-10-28 19:58:49	2025-10-28 15:08:49
4122	318	2025-07-10 05:27:04	2025-07-10 08:38:04	2025-07-10 05:27:04
4123	845	2024-11-10 17:26:55	2024-11-10 19:28:55	2024-11-10 17:26:55
4124	597	2025-10-04 15:12:19	2025-10-04 20:17:19	2025-10-04 15:12:19
4125	217	2025-06-14 15:55:28	2025-06-14 20:19:28	2025-06-14 15:55:28
4126	352	2024-12-22 19:03:06	2024-12-23 00:25:06	2024-12-22 19:03:06
4127	818	2025-02-18 15:19:53	2025-02-18 16:44:53	2025-02-18 15:19:53
4128	863	2025-10-28 16:47:46	2025-10-28 22:37:46	2025-10-28 16:47:46
4129	286	2025-09-23 16:28:40	2025-09-23 22:19:40	2025-09-23 16:28:40
4130	978	2025-04-01 17:23:56	2025-04-01 22:25:56	2025-04-01 17:23:56
4131	315	2024-11-23 17:28:56	2024-11-23 19:44:56	2024-11-23 17:28:56
4132	350	2025-07-01 15:55:53	2025-07-01 20:07:53	2025-07-01 15:55:53
4133	12	2024-12-28 17:06:17	2024-12-28 21:37:17	2024-12-28 17:06:17
4134	504	2024-12-21 16:33:59	2024-12-21 17:43:59	2024-12-21 16:33:59
4135	149	2025-01-19 13:15:12	2025-01-19 17:56:12	2025-01-19 13:15:12
4136	43	2024-11-19 17:33:32	2024-11-19 20:33:32	2024-11-19 17:33:32
4137	42	2025-07-01 15:59:10	2025-07-01 17:46:10	2025-07-01 15:59:10
4138	980	2025-08-24 17:05:03	2025-08-24 21:56:03	2025-08-24 17:05:03
4139	289	2025-03-30 11:40:40	2025-03-30 13:24:40	2025-03-30 11:40:40
4140	120	2024-11-17 06:29:29	2024-11-17 11:52:29	2024-11-17 06:29:29
4141	498	2024-11-19 17:00:31	2024-11-19 22:40:31	2024-11-19 17:00:31
4142	361	2025-08-09 18:17:43	2025-08-09 20:52:43	2025-08-09 18:17:43
4143	135	2025-08-16 16:48:41	2025-08-16 20:14:41	2025-08-16 16:48:41
4144	635	2025-09-21 06:46:13	2025-09-21 09:19:13	2025-09-21 06:46:13
4145	770	2025-01-25 16:21:03	2025-01-25 20:19:03	2025-01-25 16:21:03
4146	6	2024-12-17 15:56:13	2024-12-17 21:32:13	2024-12-17 15:56:13
4147	671	2024-11-19 15:55:02	2024-11-19 20:03:02	2024-11-19 15:55:02
4148	462	2025-02-02 16:54:41	2025-02-02 18:47:41	2025-02-02 16:54:41
4149	524	2025-04-01 14:17:04	2025-04-01 18:27:04	2025-04-01 14:17:04
4150	336	2025-01-16 19:42:49	2025-01-16 20:47:49	2025-01-16 19:42:49
4151	670	2025-04-26 18:03:20	2025-04-26 23:04:20	2025-04-26 18:03:20
4152	10	2025-07-27 15:24:20	2025-07-27 18:35:20	2025-07-27 15:24:20
4153	723	2025-07-20 15:45:37	2025-07-20 16:49:37	2025-07-20 15:45:37
4154	405	2025-10-26 18:33:42	2025-10-26 22:48:42	2025-10-26 18:33:42
4155	924	2025-01-26 01:42:36	2025-01-26 03:08:36	2025-01-26 01:42:36
4156	859	2025-07-27 10:48:19	2025-07-27 15:32:19	2025-07-27 10:48:19
4157	487	2025-09-21 01:54:09	2025-09-21 04:35:09	2025-09-21 01:54:09
4158	869	2025-07-26 14:05:07	2025-07-26 15:28:07	2025-07-26 14:05:07
4159	609	2024-12-08 17:12:25	2024-12-08 19:48:25	2024-12-08 17:12:25
4160	262	2025-03-05 12:02:54	2025-03-05 13:50:54	2025-03-05 12:02:54
4161	516	2025-07-19 14:45:19	2025-07-19 16:30:19	2025-07-19 14:45:19
4162	259	2025-06-15 14:17:57	2025-06-15 19:03:57	2025-06-15 14:17:57
4163	865	2025-10-26 18:10:05	2025-10-26 19:18:05	2025-10-26 18:10:05
4164	379	2025-01-25 16:02:51	2025-01-25 21:18:51	2025-01-25 16:02:51
4165	587	2024-11-09 19:22:51	2024-11-09 21:31:51	2024-11-09 19:22:51
4166	371	2024-12-01 13:33:45	2024-12-01 15:09:45	2024-12-01 13:33:45
4167	676	2025-05-20 15:42:27	2025-05-20 20:07:27	2025-05-20 15:42:27
4168	140	2025-04-08 14:56:08	2025-04-08 19:51:08	2025-04-08 14:56:08
4169	337	2025-07-15 21:35:34	2025-07-16 01:37:34	2025-07-15 21:35:34
4170	1000	2025-08-26 14:02:59	2025-08-26 16:47:59	2025-08-26 14:02:59
4171	192	2024-12-10 17:39:05	2024-12-10 19:51:05	2024-12-10 17:39:05
4172	7	2024-11-23 08:50:05	2024-11-23 10:47:05	2024-11-23 08:50:05
4173	859	2025-03-29 12:46:23	2025-03-29 15:29:23	2025-03-29 12:46:23
4174	320	2025-08-10 16:51:24	2025-08-10 19:25:24	2025-08-10 16:51:24
4175	454	2025-07-29 16:22:00	2025-07-29 20:25:00	2025-07-29 16:22:00
4176	366	2025-06-14 14:03:30	2025-06-14 16:35:30	2025-06-14 14:03:30
4177	179	2025-09-14 16:13:13	2025-09-14 22:00:13	2025-09-14 16:13:13
4178	514	2025-03-25 16:52:57	2025-03-25 18:22:57	2025-03-25 16:52:57
4179	468	2025-01-11 16:00:14	2025-01-11 20:26:14	2025-01-11 16:00:14
4180	471	2025-10-14 17:53:50	2025-10-14 20:31:50	2025-10-14 17:53:50
4181	267	2025-07-27 18:48:54	2025-07-27 22:38:54	2025-07-27 18:48:54
4182	554	2025-06-24 16:22:55	2025-06-24 22:20:55	2025-06-24 16:22:55
4183	890	2025-03-18 17:32:42	2025-03-18 22:48:42	2025-03-18 17:32:42
4184	54	2025-01-04 17:01:08	2025-01-04 19:51:08	2025-01-04 17:01:08
4185	574	2025-08-16 17:50:27	2025-08-16 20:42:27	2025-08-16 17:50:27
4186	637	2025-05-30 12:38:23	2025-05-30 18:15:23	2025-05-30 12:38:23
4187	249	2025-09-02 17:36:44	2025-09-02 20:15:44	2025-09-02 17:36:44
4188	781	2025-10-26 15:58:49	2025-10-26 20:47:49	2025-10-26 15:58:49
4189	597	2025-02-23 06:08:12	2025-02-23 08:20:12	2025-02-23 06:08:12
4190	370	2025-02-04 17:12:13	2025-02-04 19:03:13	2025-02-04 17:12:13
4191	497	2024-12-07 18:58:22	2024-12-07 22:40:22	2024-12-07 18:58:22
4192	921	2025-09-27 05:53:37	2025-09-27 09:18:37	2025-09-27 05:53:37
4193	337	2025-10-04 14:01:10	2025-10-04 16:03:10	2025-10-04 14:01:10
4194	172	2025-08-16 15:13:38	2025-08-16 16:59:38	2025-08-16 15:13:38
4195	92	2025-04-29 16:28:35	2025-04-29 20:23:35	2025-04-29 16:28:35
4196	791	2025-08-10 10:18:04	2025-08-10 15:10:04	2025-08-10 10:18:04
4197	588	2025-07-19 08:15:23	2025-07-19 13:30:23	2025-07-19 08:15:23
4198	547	2024-11-26 16:36:52	2024-11-26 21:38:52	2024-11-26 16:36:52
4199	406	2025-09-09 15:44:08	2025-09-09 19:39:08	2025-09-09 15:44:08
4200	751	2025-08-16 04:03:45	2025-08-16 07:16:45	2025-08-16 04:03:45
4201	715	2024-11-23 15:38:35	2024-11-23 17:32:35	2024-11-23 15:38:35
4202	319	2025-06-15 17:19:23	2025-06-15 21:47:23	2025-06-15 17:19:23
4203	308	2025-02-01 09:40:37	2025-02-01 12:48:37	2025-02-01 09:40:37
4204	689	2025-07-26 15:25:28	2025-07-26 16:47:28	2025-07-26 15:25:28
4205	963	2025-02-04 17:45:29	2025-02-04 23:41:29	2025-02-04 17:45:29
4206	851	2024-11-16 19:14:41	2024-11-16 21:08:41	2024-11-16 19:14:41
4207	299	2025-10-12 18:42:30	2025-10-12 21:20:30	2025-10-12 18:42:30
4208	189	2025-02-18 16:22:13	2025-02-18 17:30:13	2025-02-18 16:22:13
4209	833	2025-07-22 14:03:25	2025-07-22 16:16:25	2025-07-22 14:03:25
4210	35	2025-05-10 16:39:08	2025-05-10 20:09:08	2025-05-10 16:39:08
4211	114	2025-03-01 12:06:02	2025-03-01 14:52:02	2025-03-01 12:06:02
4212	315	2025-06-03 15:34:03	2025-06-03 17:09:03	2025-06-03 15:34:03
4213	511	2024-12-21 16:12:18	2024-12-21 20:52:18	2024-12-21 16:12:18
4214	799	2025-01-24 16:55:35	2025-01-24 18:20:35	2025-01-24 16:55:35
4215	868	2024-11-17 13:48:44	2024-11-17 15:31:44	2024-11-17 13:48:44
4216	368	2024-11-09 15:24:02	2024-11-09 16:44:02	2024-11-09 15:24:02
4217	635	2024-11-26 15:54:54	2024-11-26 16:54:54	2024-11-26 15:54:54
4218	278	2025-08-10 16:02:16	2025-08-10 17:59:16	2025-08-10 16:02:16
4219	537	2025-07-08 05:07:44	2025-07-08 10:18:44	2025-07-08 05:07:44
4220	463	2025-09-08 14:32:07	2025-09-08 20:28:07	2025-09-08 14:32:07
4221	200	2025-06-01 16:14:04	2025-06-01 20:18:04	2025-06-01 16:14:04
4222	316	2025-06-22 16:12:07	2025-06-22 18:41:07	2025-06-22 16:12:07
4223	391	2025-01-21 15:31:22	2025-01-21 20:52:22	2025-01-21 15:31:22
4224	812	2025-04-26 11:02:26	2025-04-26 13:45:26	2025-04-26 11:02:26
4225	597	2025-05-01 08:18:22	2025-05-01 12:42:22	2025-05-01 08:18:22
4226	452	2025-03-25 17:23:09	2025-03-25 22:08:09	2025-03-25 17:23:09
4227	543	2024-12-17 18:56:19	2024-12-17 20:58:19	2024-12-17 18:56:19
4228	140	2025-03-02 16:27:47	2025-03-02 18:27:47	2025-03-02 16:27:47
4229	323	2025-02-09 08:12:04	2025-02-09 11:47:04	2025-02-09 08:12:04
4230	673	2025-08-05 17:57:09	2025-08-05 19:04:09	2025-08-05 17:57:09
4231	659	2024-12-24 10:51:07	2024-12-24 15:23:07	2024-12-24 10:51:07
4232	40	2025-02-11 15:16:48	2025-02-11 21:07:48	2025-02-11 15:16:48
4233	738	2025-03-09 17:57:42	2025-03-09 20:15:42	2025-03-09 17:57:42
4234	241	2025-08-31 14:26:09	2025-08-31 19:31:09	2025-08-31 14:26:09
4235	869	2025-10-20 15:00:46	2025-10-20 20:26:46	2025-10-20 15:00:46
4236	545	2025-05-13 15:03:39	2025-05-13 18:34:39	2025-05-13 15:03:39
4237	344	2025-07-26 15:31:54	2025-07-26 18:42:54	2025-07-26 15:31:54
4238	160	2025-09-09 15:53:01	2025-09-09 20:55:01	2025-09-09 15:53:01
4239	490	2025-08-17 16:04:57	2025-08-17 18:55:57	2025-08-17 16:04:57
4240	732	2025-03-22 17:43:42	2025-03-22 21:19:42	2025-03-22 17:43:42
4241	732	2025-01-28 19:24:58	2025-01-29 00:58:58	2025-01-28 19:24:58
4242	393	2025-05-17 17:37:28	2025-05-17 21:41:28	2025-05-17 17:37:28
4243	799	2024-12-01 19:06:40	2024-12-01 20:41:40	2024-12-01 19:06:40
4244	81	2025-10-18 15:35:20	2025-10-18 18:27:20	2025-10-18 15:35:20
4245	338	2025-07-29 16:08:28	2025-07-29 18:07:28	2025-07-29 16:08:28
4246	518	2025-04-12 14:24:54	2025-04-12 20:06:54	2025-04-12 14:24:54
4247	363	2024-12-08 14:27:51	2024-12-08 18:22:51	2024-12-08 14:27:51
4248	861	2025-10-21 15:12:06	2025-10-21 18:07:06	2025-10-21 15:12:06
4249	835	2025-10-22 15:20:01	2025-10-22 16:27:01	2025-10-22 15:20:01
4250	68	2025-06-28 17:44:10	2025-06-28 20:45:10	2025-06-28 17:44:10
4251	469	2025-03-18 13:28:14	2025-03-18 19:10:14	2025-03-18 13:28:14
4252	937	2025-04-08 16:07:45	2025-04-08 18:01:45	2025-04-08 16:07:45
4253	819	2025-04-29 16:50:39	2025-04-29 19:42:39	2025-04-29 16:50:39
4254	242	2025-10-04 14:24:49	2025-10-04 16:45:49	2025-10-04 14:24:49
4255	298	2024-11-23 16:20:55	2024-11-23 18:08:55	2024-11-23 16:20:55
4256	548	2025-11-01 06:17:11	2025-11-01 07:21:11	2025-11-01 06:17:11
4257	541	2025-07-01 14:30:18	2025-07-01 18:10:18	2025-07-01 14:30:18
4258	544	2025-04-20 15:02:40	2025-04-20 20:26:40	2025-04-20 15:02:40
4259	94	2025-09-16 14:16:08	2025-09-16 16:35:08	2025-09-16 14:16:08
4260	701	2025-06-15 17:02:24	2025-06-15 18:52:24	2025-06-15 17:02:24
4261	286	2024-12-24 05:08:29	2024-12-24 11:06:29	2024-12-24 05:08:29
4262	55	2025-10-05 15:27:36	2025-10-05 21:14:36	2025-10-05 15:27:36
4263	273	2025-06-24 15:59:18	2025-06-24 19:02:18	2025-06-24 15:59:18
4264	457	2025-01-18 15:44:21	2025-01-18 18:12:21	2025-01-18 15:44:21
4265	187	2025-03-01 16:04:10	2025-03-01 18:25:10	2025-03-01 16:04:10
4266	216	2025-07-22 18:31:42	2025-07-22 19:51:42	2025-07-22 18:31:42
4267	824	2024-12-08 13:16:16	2024-12-08 17:54:16	2024-12-08 13:16:16
4268	62	2025-04-08 14:42:02	2025-04-08 18:31:02	2025-04-08 14:42:02
4269	94	2025-07-27 14:16:43	2025-07-27 16:16:43	2025-07-27 14:16:43
4270	275	2025-02-01 10:24:06	2025-02-01 12:22:06	2025-02-01 10:24:06
4271	604	2025-01-07 17:48:26	2025-01-07 19:43:26	2025-01-07 17:48:26
4272	264	2025-04-26 15:32:55	2025-04-26 16:55:55	2025-04-26 15:32:55
4273	151	2025-02-18 19:33:22	2025-02-19 00:17:22	2025-02-18 19:33:22
4274	141	2025-09-02 15:34:43	2025-09-02 17:29:43	2025-09-02 15:34:43
4275	283	2025-08-10 14:11:29	2025-08-10 15:13:29	2025-08-10 14:11:29
4276	936	2024-12-09 17:43:04	2024-12-09 19:40:04	2024-12-09 17:43:04
4277	995	2025-01-12 18:02:55	2025-01-12 21:53:55	2025-01-12 18:02:55
4278	970	2025-08-09 14:52:46	2025-08-09 17:27:46	2025-08-09 14:52:46
4279	785	2025-05-27 18:43:23	2025-05-27 22:11:23	2025-05-27 18:43:23
4280	460	2025-01-16 16:33:38	2025-01-16 22:29:38	2025-01-16 16:33:38
4281	269	2025-04-09 16:01:50	2025-04-09 20:08:50	2025-04-09 16:01:50
4282	863	2025-03-11 15:15:25	2025-03-11 16:48:25	2025-03-11 15:15:25
4283	418	2025-01-21 15:16:58	2025-01-21 19:59:58	2025-01-21 15:16:58
4284	924	2025-01-07 13:33:10	2025-01-07 16:13:10	2025-01-07 13:33:10
4285	169	2025-06-15 18:55:44	2025-06-15 23:51:44	2025-06-15 18:55:44
4286	253	2025-05-06 09:47:00	2025-05-06 15:00:00	2025-05-06 09:47:00
4287	255	2025-04-08 16:32:51	2025-04-08 22:26:51	2025-04-08 16:32:51
4288	878	2025-03-04 07:41:12	2025-03-04 13:11:12	2025-03-04 07:41:12
4289	16	2025-08-17 16:06:41	2025-08-17 20:39:41	2025-08-17 16:06:41
4290	465	2025-04-19 16:19:39	2025-04-19 19:15:39	2025-04-19 16:19:39
4291	140	2025-05-24 16:31:24	2025-05-24 21:25:24	2025-05-24 16:31:24
4292	189	2024-12-03 10:45:50	2024-12-03 13:59:50	2024-12-03 10:45:50
4293	461	2024-12-01 16:52:55	2024-12-01 21:49:55	2024-12-01 16:52:55
4294	33	2025-03-29 14:42:59	2025-03-29 17:36:59	2025-03-29 14:42:59
4295	272	2025-01-07 16:18:41	2025-01-07 19:48:41	2025-01-07 16:18:41
4296	427	2025-01-04 19:34:43	2025-01-04 20:41:43	2025-01-04 19:34:43
4297	366	2025-02-15 16:29:44	2025-02-15 19:22:44	2025-02-15 16:29:44
4298	458	2025-07-22 15:18:04	2025-07-22 17:07:04	2025-07-22 15:18:04
4299	591	2025-06-17 15:00:56	2025-06-17 20:05:56	2025-06-17 15:00:56
4300	654	2025-06-10 15:14:03	2025-06-10 17:20:03	2025-06-10 15:14:03
4301	693	2025-01-07 16:06:56	2025-01-07 17:16:56	2025-01-07 16:06:56
4302	873	2025-09-14 16:52:16	2025-09-14 20:34:16	2025-09-14 16:52:16
4303	524	2025-07-22 15:40:47	2025-07-22 17:14:47	2025-07-22 15:40:47
4304	679	2025-01-21 16:36:08	2025-01-21 21:06:08	2025-01-21 16:36:08
4305	602	2025-10-21 15:13:35	2025-10-21 16:29:35	2025-10-21 15:13:35
4306	344	2025-02-04 17:44:28	2025-02-04 19:10:28	2025-02-04 17:44:28
4307	822	2025-10-26 05:10:22	2025-10-26 09:42:22	2025-10-26 05:10:22
4308	986	2025-10-07 15:10:37	2025-10-07 20:11:37	2025-10-07 15:10:37
4309	424	2025-02-25 07:21:58	2025-02-25 11:17:58	2025-02-25 07:21:58
4310	129	2025-03-08 05:44:46	2025-03-08 08:09:46	2025-03-08 05:44:46
4311	291	2025-03-01 18:40:20	2025-03-01 23:08:20	2025-03-01 18:40:20
4312	634	2024-11-30 19:20:14	2024-11-30 22:43:14	2024-11-30 19:20:14
4313	317	2025-05-24 16:50:03	2025-05-24 19:03:03	2025-05-24 16:50:03
4314	174	2025-03-30 16:51:33	2025-03-30 21:52:33	2025-03-30 16:51:33
4315	469	2025-08-23 18:33:15	2025-08-24 00:27:15	2025-08-23 18:33:15
4316	975	2025-04-27 15:47:23	2025-04-27 18:44:23	2025-04-27 15:47:23
4317	506	2025-02-15 17:53:37	2025-02-15 21:51:37	2025-02-15 17:53:37
4318	382	2025-02-23 15:09:27	2025-02-23 18:42:27	2025-02-23 15:09:27
4319	238	2025-02-01 15:47:11	2025-02-01 19:34:11	2025-02-01 15:47:11
4320	16	2024-11-09 15:09:15	2024-11-09 18:46:15	2024-11-09 15:09:15
4321	288	2025-02-11 15:13:58	2025-02-11 16:17:58	2025-02-11 15:13:58
4322	965	2025-03-16 11:34:35	2025-03-16 17:22:35	2025-03-16 11:34:35
4323	410	2025-04-13 14:45:45	2025-04-13 16:33:45	2025-04-13 14:45:45
4324	880	2025-02-04 07:42:15	2025-02-04 11:44:15	2025-02-04 07:42:15
4325	670	2025-08-10 03:16:06	2025-08-10 07:11:06	2025-08-10 03:16:06
4326	425	2025-05-24 14:43:08	2025-05-24 15:53:08	2025-05-24 14:43:08
4327	131	2024-11-19 11:29:53	2024-11-19 13:43:53	2024-11-19 11:29:53
4328	161	2025-05-27 16:40:34	2025-05-27 20:25:34	2025-05-27 16:40:34
4329	793	2024-12-28 15:45:22	2024-12-28 21:22:22	2024-12-28 15:45:22
4330	676	2025-08-09 14:09:33	2025-08-09 17:44:33	2025-08-09 14:09:33
4331	153	2024-12-15 03:46:54	2024-12-15 06:54:54	2024-12-15 03:46:54
4332	254	2025-05-12 22:07:34	2025-05-13 00:16:34	2025-05-12 22:07:34
4333	199	2025-06-16 04:35:36	2025-06-16 09:09:36	2025-06-16 04:35:36
4334	268	2025-03-01 15:02:43	2025-03-01 16:45:43	2025-03-01 15:02:43
4335	620	2025-02-09 16:21:51	2025-02-09 20:30:51	2025-02-09 16:21:51
4336	878	2025-09-13 18:32:41	2025-09-13 20:39:41	2025-09-13 18:32:41
4337	634	2025-04-19 15:16:17	2025-04-19 21:08:17	2025-04-19 15:16:17
4338	801	2025-07-22 14:30:44	2025-07-22 18:59:44	2025-07-22 14:30:44
4339	400	2025-04-19 15:18:43	2025-04-19 18:27:43	2025-04-19 15:18:43
4340	888	2025-03-01 16:32:12	2025-03-01 18:26:12	2025-03-01 16:32:12
4341	356	2025-10-22 14:25:43	2025-10-22 20:22:43	2025-10-22 14:25:43
4342	727	2025-02-15 17:49:04	2025-02-15 22:02:04	2025-02-15 17:49:04
4343	428	2025-01-21 19:39:56	2025-01-21 21:12:56	2025-01-21 19:39:56
4344	281	2025-04-29 16:02:34	2025-04-29 18:25:34	2025-04-29 16:02:34
4345	355	2025-06-21 06:05:44	2025-06-21 11:31:44	2025-06-21 06:05:44
4346	788	2025-01-04 15:07:51	2025-01-04 17:34:51	2025-01-04 15:07:51
4347	496	2025-03-16 16:30:49	2025-03-16 19:22:49	2025-03-16 16:30:49
4348	825	2025-10-28 16:30:33	2025-10-28 20:32:33	2025-10-28 16:30:33
4349	702	2025-04-12 14:35:14	2025-04-12 15:44:14	2025-04-12 14:35:14
4350	986	2025-04-12 14:11:39	2025-04-12 18:51:39	2025-04-12 14:11:39
4351	947	2024-12-17 16:29:00	2024-12-17 17:48:00	2024-12-17 16:29:00
4352	565	2024-11-23 16:30:25	2024-11-23 18:44:25	2024-11-23 16:30:25
4353	83	2025-02-04 19:56:32	2025-02-04 22:53:32	2025-02-04 19:56:32
4354	732	2025-01-21 17:46:51	2025-01-21 22:13:51	2025-01-21 17:46:51
4355	498	2025-07-15 15:47:27	2025-07-15 19:50:27	2025-07-15 15:47:27
4356	68	2025-10-19 05:43:36	2025-10-19 11:23:36	2025-10-19 05:43:36
4357	242	2025-04-06 18:49:33	2025-04-06 21:19:33	2025-04-06 18:49:33
4358	780	2025-07-15 12:13:39	2025-07-15 15:52:39	2025-07-15 12:13:39
4359	183	2025-06-29 09:30:11	2025-06-29 13:40:11	2025-06-29 09:30:11
4360	476	2025-04-05 16:56:29	2025-04-05 19:55:29	2025-04-05 16:56:29
4361	533	2025-08-21 11:27:55	2025-08-21 17:20:55	2025-08-21 11:27:55
4362	443	2025-08-12 18:53:40	2025-08-13 00:16:40	2025-08-12 18:53:40
4363	860	2025-11-02 16:59:54	2025-11-02 19:21:54	2025-11-02 16:59:54
4364	614	2024-12-03 16:07:58	2024-12-03 18:30:58	2024-12-03 16:07:58
4365	705	2025-06-17 15:07:17	2025-06-17 17:30:17	2025-06-17 15:07:17
4366	724	2025-06-18 15:34:22	2025-06-18 16:36:22	2025-06-18 15:34:22
4367	508	2025-10-04 15:30:31	2025-10-04 21:00:31	2025-10-04 15:30:31
4368	616	2025-05-06 16:29:32	2025-05-06 18:56:32	2025-05-06 16:29:32
4369	607	2024-12-07 12:05:36	2024-12-07 14:44:36	2024-12-07 12:05:36
4370	136	2025-02-09 16:44:49	2025-02-09 20:37:49	2025-02-09 16:44:49
4371	727	2025-08-23 10:50:22	2025-08-23 13:00:22	2025-08-23 10:50:22
4372	846	2025-09-28 14:59:01	2025-09-28 16:50:01	2025-09-28 14:59:01
4373	758	2025-10-26 11:36:24	2025-10-26 15:41:24	2025-10-26 11:36:24
4374	194	2025-05-20 14:28:38	2025-05-20 16:23:38	2025-05-20 14:28:38
4375	555	2025-08-03 09:50:12	2025-08-03 14:05:12	2025-08-03 09:50:12
4376	517	2025-04-05 15:56:12	2025-04-05 18:44:12	2025-04-05 15:56:12
4377	119	2025-04-19 14:52:24	2025-04-19 17:48:24	2025-04-19 14:52:24
4378	325	2025-04-06 15:24:43	2025-04-06 17:15:43	2025-04-06 15:24:43
4379	875	2025-02-08 12:42:16	2025-02-08 14:44:16	2025-02-08 12:42:16
4380	853	2024-12-12 15:01:12	2024-12-12 19:19:12	2024-12-12 15:01:12
4381	59	2025-02-25 16:07:52	2025-02-25 20:58:52	2025-02-25 16:07:52
4382	258	2025-08-03 14:31:25	2025-08-03 19:43:25	2025-08-03 14:31:25
4383	985	2025-10-14 16:40:25	2025-10-14 19:35:25	2025-10-14 16:40:25
4384	135	2025-02-04 15:49:56	2025-02-04 17:38:56	2025-02-04 15:49:56
4385	488	2025-06-22 15:27:55	2025-06-22 19:02:55	2025-06-22 15:27:55
4386	188	2024-12-22 17:52:56	2024-12-22 21:04:56	2024-12-22 17:52:56
4387	772	2025-02-11 17:58:41	2025-02-11 23:49:41	2025-02-11 17:58:41
4388	783	2025-07-01 14:14:37	2025-07-01 19:18:37	2025-07-01 14:14:37
4389	360	2025-01-14 17:59:54	2025-01-14 19:10:54	2025-01-14 17:59:54
4390	162	2025-07-21 15:25:19	2025-07-21 20:34:19	2025-07-21 15:25:19
4391	66	2025-03-22 19:31:50	2025-03-22 23:53:50	2025-03-22 19:31:50
4392	662	2025-02-18 15:13:37	2025-02-18 20:21:37	2025-02-18 15:13:37
4393	554	2025-05-27 16:06:45	2025-05-27 21:07:45	2025-05-27 16:06:45
4394	851	2024-11-30 09:46:10	2024-11-30 11:24:10	2024-11-30 09:46:10
4395	830	2025-05-20 11:10:54	2025-05-20 13:13:54	2025-05-20 11:10:54
4396	401	2024-12-14 18:34:19	2024-12-14 23:34:19	2024-12-14 18:34:19
4397	492	2025-04-12 15:59:42	2025-04-12 17:49:42	2025-04-12 15:59:42
4398	286	2025-10-18 14:57:46	2025-10-18 17:01:46	2025-10-18 14:57:46
4399	598	2025-01-12 17:43:15	2025-01-12 19:34:15	2025-01-12 17:43:15
4400	816	2024-12-17 03:04:58	2024-12-17 08:15:58	2024-12-17 03:04:58
4401	235	2025-04-25 17:56:31	2025-04-25 20:48:31	2025-04-25 17:56:31
4402	300	2025-05-27 17:42:42	2025-05-27 18:55:42	2025-05-27 17:42:42
4403	905	2025-02-16 19:32:45	2025-02-16 21:46:45	2025-02-16 19:32:45
4404	921	2024-12-14 17:26:13	2024-12-14 18:47:13	2024-12-14 17:26:13
4405	115	2025-07-26 14:53:41	2025-07-26 20:51:41	2025-07-26 14:53:41
4406	737	2024-11-09 09:32:57	2024-11-09 12:48:57	2024-11-09 09:32:57
4407	997	2025-04-24 14:50:54	2025-04-24 19:52:54	2025-04-24 14:50:54
4408	714	2024-12-01 17:23:22	2024-12-01 19:59:22	2024-12-01 17:23:22
4409	107	2025-08-12 15:44:37	2025-08-12 18:51:37	2025-08-12 15:44:37
4410	672	2025-05-10 16:59:06	2025-05-10 22:10:06	2025-05-10 16:59:06
4411	362	2025-09-20 09:41:41	2025-09-20 14:04:41	2025-09-20 09:41:41
4412	865	2024-11-24 11:33:30	2024-11-24 16:35:30	2024-11-24 11:33:30
4413	169	2025-03-09 16:58:44	2025-03-09 22:01:44	2025-03-09 16:58:44
4414	394	2025-06-10 16:44:26	2025-06-10 18:07:26	2025-06-10 16:44:26
4415	612	2025-06-01 17:08:47	2025-06-01 19:33:47	2025-06-01 17:08:47
4416	974	2025-08-30 15:12:57	2025-08-30 16:26:57	2025-08-30 15:12:57
4417	436	2025-10-28 15:37:15	2025-10-28 17:39:15	2025-10-28 15:37:15
4418	821	2025-04-27 00:06:51	2025-04-27 04:57:51	2025-04-27 00:06:51
4419	398	2025-05-27 15:43:31	2025-05-27 19:42:31	2025-05-27 15:43:31
4420	868	2025-01-07 19:32:13	2025-01-07 20:38:13	2025-01-07 19:32:13
4421	232	2025-04-20 16:13:10	2025-04-20 20:42:10	2025-04-20 16:13:10
4422	803	2024-11-26 17:57:07	2024-11-26 19:57:07	2024-11-26 17:57:07
4423	365	2025-07-15 16:19:43	2025-07-15 18:46:43	2025-07-15 16:19:43
4424	559	2025-08-08 18:52:12	2025-08-08 20:43:12	2025-08-08 18:52:12
4425	681	2025-10-05 14:14:39	2025-10-05 16:36:39	2025-10-05 14:14:39
4426	267	2025-03-15 15:00:06	2025-03-15 19:50:06	2025-03-15 15:00:06
4427	672	2024-12-29 11:01:29	2024-12-29 12:49:29	2024-12-29 11:01:29
4428	83	2025-11-04 16:36:17	2025-11-04 22:07:17	2025-11-04 16:36:17
4429	396	2025-06-28 16:14:40	2025-06-28 18:55:40	2025-06-28 16:14:40
4430	830	2024-12-21 15:49:54	2024-12-21 21:22:54	2024-12-21 15:49:54
4431	605	2025-04-27 14:12:40	2025-04-27 17:02:40	2025-04-27 14:12:40
4432	286	2024-12-17 15:27:41	2024-12-17 16:42:41	2024-12-17 15:27:41
4433	926	2025-10-21 18:59:57	2025-10-22 00:31:57	2025-10-21 18:59:57
4434	511	2025-09-14 17:45:09	2025-09-14 19:09:09	2025-09-14 17:45:09
4435	295	2025-02-02 15:03:38	2025-02-02 20:32:38	2025-02-02 15:03:38
4436	176	2025-02-16 18:49:06	2025-02-16 23:01:06	2025-02-16 18:49:06
4437	923	2025-09-16 15:49:51	2025-09-16 16:50:51	2025-09-16 15:49:51
4438	959	2025-04-05 14:06:02	2025-04-05 18:58:02	2025-04-05 14:06:02
4439	116	2025-01-26 16:53:34	2025-01-26 21:42:34	2025-01-26 16:53:34
4440	699	2025-04-07 14:59:00	2025-04-07 20:23:00	2025-04-07 14:59:00
4441	60	2025-06-22 14:12:08	2025-06-22 15:32:08	2025-06-22 14:12:08
4442	779	2025-09-30 09:09:15	2025-09-30 12:11:15	2025-09-30 09:09:15
4443	305	2025-05-31 15:05:55	2025-05-31 19:59:55	2025-05-31 15:05:55
4444	535	2024-12-10 19:47:36	2024-12-10 21:57:36	2024-12-10 19:47:36
4445	831	2025-08-10 08:43:34	2025-08-10 14:42:34	2025-08-10 08:43:34
4446	239	2025-02-02 15:02:49	2025-02-02 19:17:49	2025-02-02 15:02:49
4447	903	2025-10-11 15:33:57	2025-10-11 21:25:57	2025-10-11 15:33:57
4448	89	2025-04-27 12:08:06	2025-04-27 13:43:06	2025-04-27 12:08:06
4449	712	2025-03-29 05:53:15	2025-03-29 09:52:15	2025-03-29 05:53:15
4450	660	2025-05-10 14:40:12	2025-05-10 15:46:12	2025-05-10 14:40:12
4451	324	2024-12-15 11:36:05	2024-12-15 15:18:05	2024-12-15 11:36:05
4452	845	2024-11-26 18:27:41	2024-11-27 00:04:41	2024-11-26 18:27:41
4453	309	2025-10-26 16:12:39	2025-10-26 21:38:39	2025-10-26 16:12:39
4454	433	2025-05-24 16:12:28	2025-05-24 21:44:28	2025-05-24 16:12:28
4455	380	2024-11-26 18:17:57	2024-11-26 23:41:57	2024-11-26 18:17:57
4456	565	2025-01-19 17:31:09	2025-01-19 19:01:09	2025-01-19 17:31:09
4457	576	2024-12-17 16:11:50	2024-12-17 19:45:50	2024-12-17 16:11:50
4458	913	2025-02-18 16:21:49	2025-02-18 21:37:49	2025-02-18 16:21:49
4459	355	2024-11-23 09:17:06	2024-11-23 14:35:06	2024-11-23 09:17:06
4460	256	2025-07-24 14:43:47	2025-07-24 20:37:47	2025-07-24 14:43:47
4461	503	2025-09-28 10:08:40	2025-09-28 13:51:40	2025-09-28 10:08:40
4462	989	2025-09-28 15:12:18	2025-09-28 17:00:18	2025-09-28 15:12:18
4463	580	2025-01-18 19:34:10	2025-01-18 21:20:10	2025-01-18 19:34:10
4464	397	2024-12-08 15:23:56	2024-12-08 16:31:56	2024-12-08 15:23:56
4465	548	2024-12-31 18:07:48	2024-12-31 21:29:48	2024-12-31 18:07:48
4466	756	2025-07-19 06:39:05	2025-07-19 12:07:05	2025-07-19 06:39:05
4467	66	2025-08-29 14:25:13	2025-08-29 19:05:13	2025-08-29 14:25:13
4468	526	2025-10-28 16:05:05	2025-10-28 18:06:05	2025-10-28 16:05:05
4469	550	2025-09-28 05:25:20	2025-09-28 07:00:20	2025-09-28 05:25:20
4470	759	2025-06-07 05:31:20	2025-06-07 10:51:20	2025-06-07 05:31:20
4471	257	2025-05-03 04:02:03	2025-05-03 06:15:03	2025-05-03 04:02:03
4472	780	2025-05-24 15:50:26	2025-05-24 19:32:26	2025-05-24 15:50:26
4473	104	2025-09-23 12:44:28	2025-09-23 15:24:28	2025-09-23 12:44:28
4474	190	2024-11-23 18:14:23	2024-11-23 19:24:23	2024-11-23 18:14:23
4475	534	2025-07-29 17:10:07	2025-07-29 21:17:07	2025-07-29 17:10:07
4476	426	2025-09-13 14:29:15	2025-09-13 16:52:15	2025-09-13 14:29:15
4477	561	2024-12-07 07:52:32	2024-12-07 12:27:32	2024-12-07 07:52:32
4478	580	2024-12-29 17:15:53	2024-12-29 19:12:53	2024-12-29 17:15:53
4479	563	2024-12-08 13:51:23	2024-12-08 18:06:23	2024-12-08 13:51:23
4480	795	2025-10-05 15:16:51	2025-10-05 18:13:51	2025-10-05 15:16:51
4481	975	2025-07-27 15:51:42	2025-07-27 19:14:42	2025-07-27 15:51:42
4482	246	2025-04-29 18:23:04	2025-04-29 20:50:04	2025-04-29 18:23:04
4483	266	2025-07-22 15:08:04	2025-07-22 19:53:04	2025-07-22 15:08:04
4484	383	2025-03-13 16:57:51	2025-03-13 19:38:51	2025-03-13 16:57:51
4485	428	2025-07-15 18:19:25	2025-07-15 22:29:25	2025-07-15 18:19:25
4486	310	2025-02-27 15:13:03	2025-02-27 16:54:03	2025-02-27 15:13:03
4487	300	2025-01-05 16:31:51	2025-01-05 17:36:51	2025-01-05 16:31:51
4488	555	2025-10-01 16:35:37	2025-10-01 20:05:37	2025-10-01 16:35:37
4489	397	2025-11-02 11:03:17	2025-11-02 16:01:17	2025-11-02 11:03:17
4490	837	2025-09-30 12:03:30	2025-09-30 15:11:30	2025-09-30 12:03:30
4491	418	2025-03-08 17:55:59	2025-03-08 19:09:59	2025-03-08 17:55:59
4492	27	2025-03-08 16:21:52	2025-03-08 21:27:52	2025-03-08 16:21:52
4493	662	2025-10-10 14:31:17	2025-10-10 17:53:17	2025-10-10 14:31:17
4494	969	2025-03-30 05:32:22	2025-03-30 06:38:22	2025-03-30 05:32:22
4495	562	2025-09-02 12:52:24	2025-09-02 15:15:24	2025-09-02 12:52:24
4496	6	2025-04-13 15:05:01	2025-04-13 16:44:01	2025-04-13 15:05:01
4497	212	2025-10-26 16:51:27	2025-10-26 18:14:27	2025-10-26 16:51:27
4498	7	2025-06-01 16:03:01	2025-06-01 21:24:01	2025-06-01 16:03:01
4499	274	2025-05-31 23:36:45	2025-06-01 02:08:45	2025-05-31 23:36:45
4500	187	2025-07-13 15:28:43	2025-07-13 20:22:43	2025-07-13 15:28:43
4501	992	2025-01-28 17:06:40	2025-01-28 19:35:40	2025-01-28 17:06:40
4502	516	2025-10-11 16:21:31	2025-10-11 22:20:31	2025-10-11 16:21:31
4503	974	2025-02-02 15:47:18	2025-02-02 20:43:18	2025-02-02 15:47:18
4504	343	2025-04-06 15:51:34	2025-04-06 17:20:34	2025-04-06 15:51:34
4505	575	2025-05-17 15:20:22	2025-05-17 18:04:22	2025-05-17 15:20:22
4506	380	2025-11-01 19:12:16	2025-11-01 23:56:16	2025-11-01 19:12:16
4507	392	2024-12-15 18:42:07	2024-12-15 22:07:07	2024-12-15 18:42:07
4508	148	2025-03-29 17:12:12	2025-03-29 20:42:12	2025-03-29 17:12:12
4509	617	2025-10-11 17:53:37	2025-10-11 21:34:37	2025-10-11 17:53:37
4510	293	2024-11-16 16:03:07	2024-11-16 17:17:07	2024-11-16 16:03:07
4511	768	2024-11-16 05:43:34	2024-11-16 07:40:34	2024-11-16 05:43:34
4512	377	2025-05-24 15:58:12	2025-05-24 17:31:12	2025-05-24 15:58:12
4513	609	2025-01-13 18:55:47	2025-01-13 22:10:47	2025-01-13 18:55:47
4514	343	2025-06-07 20:18:36	2025-06-07 21:36:36	2025-06-07 20:18:36
4515	961	2024-12-31 15:06:48	2024-12-31 20:48:48	2024-12-31 15:06:48
4516	934	2025-01-30 16:22:39	2025-01-30 19:39:39	2025-01-30 16:22:39
4517	800	2025-04-22 07:42:25	2025-04-22 09:56:25	2025-04-22 07:42:25
4518	232	2025-07-08 18:06:40	2025-07-08 23:09:40	2025-07-08 18:06:40
4519	593	2025-05-27 14:15:25	2025-05-27 19:35:25	2025-05-27 14:15:25
4520	829	2025-03-01 16:11:43	2025-03-01 21:24:43	2025-03-01 16:11:43
4521	49	2025-10-31 18:35:00	2025-10-31 20:31:00	2025-10-31 18:35:00
4522	574	2024-12-03 17:04:22	2024-12-03 20:53:22	2024-12-03 17:04:22
4523	171	2025-09-30 14:52:41	2025-09-30 19:01:41	2025-09-30 14:52:41
4524	73	2025-09-28 15:56:30	2025-09-28 20:18:30	2025-09-28 15:56:30
4525	440	2025-04-22 08:54:28	2025-04-22 11:13:28	2025-04-22 08:54:28
4526	937	2024-11-23 15:44:57	2024-11-23 17:22:57	2024-11-23 15:44:57
4527	226	2024-12-19 16:48:16	2024-12-19 18:28:16	2024-12-19 16:48:16
4528	491	2025-03-08 18:01:34	2025-03-08 19:43:34	2025-03-08 18:01:34
4529	760	2024-12-10 17:18:54	2024-12-10 18:34:54	2024-12-10 17:18:54
4530	29	2025-06-15 14:03:21	2025-06-15 18:13:21	2025-06-15 14:03:21
4531	575	2024-11-28 17:59:25	2024-11-28 22:56:25	2024-11-28 17:59:25
4532	34	2025-09-30 15:35:48	2025-09-30 21:23:48	2025-09-30 15:35:48
4533	133	2024-11-12 17:32:24	2024-11-12 20:19:24	2024-11-12 17:32:24
4534	530	2025-08-31 18:06:41	2025-08-31 22:03:41	2025-08-31 18:06:41
4535	18	2025-05-31 15:38:21	2025-05-31 19:58:21	2025-05-31 15:38:21
4536	100	2025-02-22 16:02:05	2025-02-22 19:49:05	2025-02-22 16:02:05
4537	609	2025-10-04 15:34:35	2025-10-04 16:53:35	2025-10-04 15:34:35
4538	359	2025-10-13 15:53:34	2025-10-13 17:07:34	2025-10-13 15:53:34
4539	14	2025-06-01 14:38:02	2025-06-01 19:05:02	2025-06-01 14:38:02
4540	479	2025-05-24 14:54:14	2025-05-24 18:14:14	2025-05-24 14:54:14
4541	744	2024-11-30 17:35:43	2024-11-30 20:52:43	2024-11-30 17:35:43
4542	882	2025-05-18 14:40:29	2025-05-18 19:52:29	2025-05-18 14:40:29
4543	810	2025-06-22 16:04:17	2025-06-22 18:33:17	2025-06-22 16:04:17
4544	442	2025-05-27 04:18:48	2025-05-27 09:06:48	2025-05-27 04:18:48
4545	75	2025-06-03 18:11:08	2025-06-04 00:09:08	2025-06-03 18:11:08
4546	512	2025-10-14 16:58:24	2025-10-14 18:30:24	2025-10-14 16:58:24
4547	273	2025-04-22 15:02:29	2025-04-22 20:27:29	2025-04-22 15:02:29
4548	281	2024-11-19 05:47:42	2024-11-19 07:09:42	2024-11-19 05:47:42
4549	132	2025-08-24 14:34:57	2025-08-24 16:42:57	2025-08-24 14:34:57
4550	410	2025-05-31 16:24:38	2025-05-31 20:18:38	2025-05-31 16:24:38
4551	214	2025-05-27 14:08:34	2025-05-27 17:31:34	2025-05-27 14:08:34
4552	409	2025-07-12 16:20:48	2025-07-12 20:50:48	2025-07-12 16:20:48
4553	628	2025-10-14 18:22:21	2025-10-14 23:36:21	2025-10-14 18:22:21
4554	106	2025-08-17 21:50:54	2025-08-17 22:55:54	2025-08-17 21:50:54
4555	531	2024-11-19 05:09:03	2024-11-19 10:25:03	2024-11-19 05:09:03
4556	150	2025-05-27 14:39:58	2025-05-27 19:50:58	2025-05-27 14:39:58
4557	362	2025-03-23 15:17:11	2025-03-23 21:01:11	2025-03-23 15:17:11
4558	854	2025-10-28 17:38:39	2025-10-28 21:41:39	2025-10-28 17:38:39
4559	792	2025-02-04 08:24:15	2025-02-04 10:58:15	2025-02-04 08:24:15
4560	688	2025-08-05 16:02:10	2025-08-05 17:28:10	2025-08-05 16:02:10
4561	94	2025-07-29 14:14:51	2025-07-29 19:53:51	2025-07-29 14:14:51
4562	256	2024-12-01 17:27:55	2024-12-01 19:26:55	2024-12-01 17:27:55
4563	635	2025-10-28 17:29:21	2025-10-28 19:21:21	2025-10-28 17:29:21
4564	52	2024-12-10 15:28:01	2024-12-10 21:08:01	2024-12-10 15:28:01
4565	303	2024-11-19 15:01:02	2024-11-19 19:32:02	2024-11-19 15:01:02
4566	975	2024-11-19 11:37:39	2024-11-19 13:15:39	2024-11-19 11:37:39
4567	699	2025-01-03 19:25:51	2025-01-03 23:11:51	2025-01-03 19:25:51
4568	846	2025-08-19 15:30:46	2025-08-19 17:15:46	2025-08-19 15:30:46
4569	60	2025-08-23 07:07:10	2025-08-23 09:07:10	2025-08-23 07:07:10
4570	673	2025-09-09 16:28:50	2025-09-09 22:23:50	2025-09-09 16:28:50
4571	882	2025-10-07 00:46:21	2025-10-07 04:55:21	2025-10-07 00:46:21
4572	623	2025-01-11 17:35:42	2025-01-11 21:08:42	2025-01-11 17:35:42
4573	444	2025-09-27 16:24:34	2025-09-27 20:06:34	2025-09-27 16:24:34
4574	52	2025-03-16 10:28:38	2025-03-16 12:31:38	2025-03-16 10:28:38
4575	501	2025-04-01 17:02:47	2025-04-01 21:39:47	2025-04-01 17:02:47
4576	170	2025-09-06 14:29:43	2025-09-06 19:38:43	2025-09-06 14:29:43
4577	317	2025-06-22 14:41:03	2025-06-22 16:31:03	2025-06-22 14:41:03
4578	129	2025-06-01 16:16:14	2025-06-01 19:37:14	2025-06-01 16:16:14
4579	835	2025-05-18 16:21:55	2025-05-18 20:47:55	2025-05-18 16:21:55
4580	464	2025-08-23 02:09:39	2025-08-23 07:24:39	2025-08-23 02:09:39
4581	16	2025-03-09 15:35:09	2025-03-09 16:57:09	2025-03-09 15:35:09
4582	620	2025-04-20 14:59:20	2025-04-20 20:13:20	2025-04-20 14:59:20
4583	158	2025-05-24 17:47:18	2025-05-24 21:48:18	2025-05-24 17:47:18
4584	605	2025-05-04 15:09:07	2025-05-04 20:15:07	2025-05-04 15:09:07
4585	6	2025-09-02 16:24:10	2025-09-02 20:49:10	2025-09-02 16:24:10
4586	645	2024-12-22 17:46:26	2024-12-22 19:08:26	2024-12-22 17:46:26
4587	563	2024-12-10 18:55:01	2024-12-10 21:23:01	2024-12-10 18:55:01
4588	235	2025-06-11 08:57:58	2025-06-11 13:04:58	2025-06-11 08:57:58
4589	548	2025-01-14 01:48:20	2025-01-14 04:00:20	2025-01-14 01:48:20
4590	605	2025-04-26 17:05:00	2025-04-26 20:52:00	2025-04-26 17:05:00
4591	179	2025-03-01 16:48:48	2025-03-01 18:55:48	2025-03-01 16:48:48
4592	903	2025-08-23 10:45:10	2025-08-23 15:03:10	2025-08-23 10:45:10
4593	402	2025-02-07 16:19:22	2025-02-07 18:43:22	2025-02-07 16:19:22
4594	752	2025-05-31 16:55:18	2025-05-31 21:22:18	2025-05-31 16:55:18
4595	628	2025-01-25 15:51:36	2025-01-25 18:09:36	2025-01-25 15:51:36
4596	184	2024-12-22 06:17:30	2024-12-22 08:33:30	2024-12-22 06:17:30
4597	588	2025-05-10 14:53:24	2025-05-10 20:03:24	2025-05-10 14:53:24
4598	382	2025-03-18 11:41:27	2025-03-18 12:42:27	2025-03-18 11:41:27
4599	364	2024-11-17 08:07:56	2024-11-17 09:45:56	2024-11-17 08:07:56
4600	892	2025-01-21 08:26:30	2025-01-21 09:43:30	2025-01-21 08:26:30
4601	31	2025-01-07 16:51:36	2025-01-07 18:20:36	2025-01-07 16:51:36
4602	959	2025-07-08 14:01:04	2025-07-08 16:04:04	2025-07-08 14:01:04
4603	483	2025-01-11 16:25:25	2025-01-11 18:26:25	2025-01-11 16:25:25
4604	375	2025-01-14 16:09:36	2025-01-14 19:16:36	2025-01-14 16:09:36
4605	31	2024-12-08 15:53:56	2024-12-08 18:33:56	2024-12-08 15:53:56
4606	275	2024-11-23 12:57:44	2024-11-23 15:12:44	2024-11-23 12:57:44
4607	597	2025-04-05 17:20:02	2025-04-05 18:43:02	2025-04-05 17:20:02
4608	389	2025-02-15 11:07:01	2025-02-15 16:34:01	2025-02-15 11:07:01
4609	608	2025-03-05 15:09:38	2025-03-05 16:59:38	2025-03-05 15:09:38
4610	666	2025-06-03 15:29:31	2025-06-03 19:15:31	2025-06-03 15:29:31
4611	801	2025-05-11 15:45:11	2025-05-11 18:52:11	2025-05-11 15:45:11
4612	98	2024-11-10 17:19:22	2024-11-10 20:14:22	2024-11-10 17:19:22
4613	745	2025-04-08 14:30:07	2025-04-08 20:13:07	2025-04-08 14:30:07
4614	16	2024-11-30 16:09:00	2024-11-30 19:34:00	2024-11-30 16:09:00
4615	245	2024-11-22 19:12:56	2024-11-22 21:14:56	2024-11-22 19:12:56
4616	874	2025-07-21 16:36:15	2025-07-21 21:30:15	2025-07-21 16:36:15
4617	309	2025-03-04 15:57:38	2025-03-04 17:21:38	2025-03-04 15:57:38
4618	552	2025-10-16 02:31:33	2025-10-16 04:29:33	2025-10-16 02:31:33
4619	138	2025-03-23 15:37:11	2025-03-23 18:53:11	2025-03-23 15:37:11
4620	587	2025-01-19 16:45:11	2025-01-19 21:33:11	2025-01-19 16:45:11
4621	761	2024-12-31 15:49:16	2024-12-31 17:42:16	2024-12-31 15:49:16
4622	383	2025-06-03 16:36:42	2025-06-03 22:11:42	2025-06-03 16:36:42
4623	310	2025-02-25 19:31:44	2025-02-25 21:44:44	2025-02-25 19:31:44
4624	460	2024-12-08 15:28:30	2024-12-08 20:36:30	2024-12-08 15:28:30
4625	988	2025-07-08 15:59:01	2025-07-08 19:36:01	2025-07-08 15:59:01
4626	125	2025-03-09 16:31:02	2025-03-09 17:51:02	2025-03-09 16:31:02
4627	617	2025-06-10 16:20:48	2025-06-10 17:35:48	2025-06-10 16:20:48
4628	195	2025-08-23 15:13:43	2025-08-23 16:23:43	2025-08-23 15:13:43
4629	281	2025-04-12 15:25:51	2025-04-12 16:38:51	2025-04-12 15:25:51
4630	745	2025-04-06 15:34:31	2025-04-06 16:34:31	2025-04-06 15:34:31
4631	747	2025-06-07 14:27:27	2025-06-07 16:53:27	2025-06-07 14:27:27
4632	267	2024-12-15 19:06:48	2024-12-16 00:29:48	2024-12-15 19:06:48
4633	408	2025-04-22 07:40:41	2025-04-22 10:09:41	2025-04-22 07:40:41
4634	561	2025-05-10 20:29:41	2025-05-11 00:54:41	2025-05-10 20:29:41
4635	999	2025-03-29 10:28:54	2025-03-29 13:29:54	2025-03-29 10:28:54
4636	353	2025-01-21 16:51:24	2025-01-21 19:10:24	2025-01-21 16:51:24
4637	392	2025-10-07 14:00:42	2025-10-07 16:23:42	2025-10-07 14:00:42
4638	437	2025-05-21 15:37:46	2025-05-21 19:06:46	2025-05-21 15:37:46
4639	996	2025-08-23 16:59:05	2025-08-23 19:25:05	2025-08-23 16:59:05
4640	996	2025-03-09 17:40:45	2025-03-09 19:28:45	2025-03-09 17:40:45
4641	362	2025-06-24 02:10:11	2025-06-24 05:04:11	2025-06-24 02:10:11
4642	216	2025-06-15 14:07:21	2025-06-15 17:08:21	2025-06-15 14:07:21
4643	854	2025-08-19 15:01:04	2025-08-19 17:19:04	2025-08-19 15:01:04
4644	396	2025-08-30 07:16:48	2025-08-30 11:00:48	2025-08-30 07:16:48
4645	336	2025-09-21 06:04:29	2025-09-21 10:24:29	2025-09-21 06:04:29
4646	320	2024-12-01 17:49:03	2024-12-01 22:25:03	2024-12-01 17:49:03
4647	98	2025-01-18 17:03:46	2025-01-18 19:25:46	2025-01-18 17:03:46
4648	68	2025-07-15 15:34:43	2025-07-15 17:17:43	2025-07-15 15:34:43
4649	965	2024-12-08 17:07:02	2024-12-08 22:55:02	2024-12-08 17:07:02
4650	681	2024-12-22 15:08:24	2024-12-22 20:22:24	2024-12-22 15:08:24
4651	955	2025-02-21 15:39:10	2025-02-21 17:18:10	2025-02-21 15:39:10
4652	123	2025-03-01 15:29:22	2025-03-01 17:55:22	2025-03-01 15:29:22
4653	547	2025-07-29 08:34:15	2025-07-29 09:37:15	2025-07-29 08:34:15
4654	546	2025-06-29 14:18:06	2025-06-29 18:17:06	2025-06-29 14:18:06
4655	940	2025-05-31 16:36:15	2025-05-31 18:36:15	2025-05-31 16:36:15
4656	816	2025-08-30 18:53:58	2025-08-30 23:48:58	2025-08-30 18:53:58
4657	598	2025-06-17 16:44:57	2025-06-17 17:48:57	2025-06-17 16:44:57
4658	277	2024-12-21 16:47:55	2024-12-21 21:46:55	2024-12-21 16:47:55
4659	839	2025-06-07 14:25:44	2025-06-07 17:25:44	2025-06-07 14:25:44
4660	289	2024-12-24 17:49:25	2024-12-24 20:45:25	2024-12-24 17:49:25
4661	545	2025-04-05 12:54:56	2025-04-05 14:17:56	2025-04-05 12:54:56
4662	598	2025-01-18 15:07:11	2025-01-18 17:21:11	2025-01-18 15:07:11
4663	726	2025-10-07 08:14:24	2025-10-07 10:27:24	2025-10-07 08:14:24
4664	159	2025-06-03 16:47:18	2025-06-03 21:40:18	2025-06-03 16:47:18
4665	56	2025-02-25 19:32:26	2025-02-26 00:34:26	2025-02-25 19:32:26
4666	578	2025-06-01 14:24:39	2025-06-01 15:40:39	2025-06-01 14:24:39
4667	943	2025-02-11 16:12:46	2025-02-11 20:42:46	2025-02-11 16:12:46
4668	900	2025-06-01 11:39:50	2025-06-01 13:45:50	2025-06-01 11:39:50
4669	254	2025-06-10 15:12:58	2025-06-10 16:44:58	2025-06-10 15:12:58
4670	963	2025-03-25 17:56:00	2025-03-25 22:07:00	2025-03-25 17:56:00
4671	900	2024-12-11 19:43:58	2024-12-11 23:37:58	2024-12-11 19:43:58
4672	730	2025-01-11 17:12:18	2025-01-11 20:44:18	2025-01-11 17:12:18
4673	125	2025-06-22 14:09:07	2025-06-22 19:29:07	2025-06-22 14:09:07
4674	645	2025-02-22 12:37:16	2025-02-22 13:39:16	2025-02-22 12:37:16
4675	542	2025-07-19 03:30:43	2025-07-19 08:13:43	2025-07-19 03:30:43
4676	588	2025-03-18 19:56:02	2025-03-18 21:34:02	2025-03-18 19:56:02
4677	360	2025-08-19 16:16:13	2025-08-19 20:57:13	2025-08-19 16:16:13
4678	206	2025-02-26 15:45:03	2025-02-26 17:20:03	2025-02-26 15:45:03
4679	702	2025-02-04 17:27:31	2025-02-04 20:38:31	2025-02-04 17:27:31
4680	241	2025-09-30 18:39:05	2025-09-30 20:47:05	2025-09-30 18:39:05
4681	555	2025-03-08 16:55:26	2025-03-08 21:47:26	2025-03-08 16:55:26
4682	961	2025-04-20 18:58:49	2025-04-20 22:35:49	2025-04-20 18:58:49
4683	769	2025-09-16 16:02:28	2025-09-16 19:30:28	2025-09-16 16:02:28
4684	995	2025-05-27 07:06:12	2025-05-27 08:13:12	2025-05-27 07:06:12
4685	547	2025-03-30 14:09:53	2025-03-30 17:55:53	2025-03-30 14:09:53
4686	89	2025-08-26 15:41:23	2025-08-26 20:59:23	2025-08-26 15:41:23
4687	569	2025-01-28 21:17:03	2025-01-29 00:47:03	2025-01-28 21:17:03
4688	966	2025-08-19 16:27:28	2025-08-19 18:26:28	2025-08-19 16:27:28
4689	282	2025-03-30 16:40:30	2025-03-30 21:02:30	2025-03-30 16:40:30
4690	487	2025-02-11 10:44:53	2025-02-11 14:28:53	2025-02-11 10:44:53
4691	18	2025-07-22 15:26:18	2025-07-22 16:46:18	2025-07-22 15:26:18
4692	563	2025-01-19 16:39:14	2025-01-19 19:47:14	2025-01-19 16:39:14
4693	217	2025-08-10 14:17:09	2025-08-10 16:25:09	2025-08-10 14:17:09
4694	713	2025-05-19 14:06:49	2025-05-19 15:12:49	2025-05-19 14:06:49
4695	885	2025-08-12 14:54:11	2025-08-12 17:59:11	2025-08-12 14:54:11
4696	220	2025-03-22 15:36:43	2025-03-22 17:18:43	2025-03-22 15:36:43
4697	869	2025-02-16 11:32:15	2025-02-16 15:10:15	2025-02-16 11:32:15
4698	764	2025-04-26 17:41:50	2025-04-26 20:03:50	2025-04-26 17:41:50
4699	741	2024-12-10 17:10:29	2024-12-10 21:49:29	2024-12-10 17:10:29
4700	488	2024-12-28 17:34:06	2024-12-28 21:08:06	2024-12-28 17:34:06
4701	139	2025-01-04 08:10:05	2025-01-04 09:46:05	2025-01-04 08:10:05
4702	548	2025-05-24 18:46:52	2025-05-24 23:55:52	2025-05-24 18:46:52
4703	511	2025-05-17 17:23:18	2025-05-17 19:04:18	2025-05-17 17:23:18
4704	739	2025-01-04 15:30:28	2025-01-04 21:19:28	2025-01-04 15:30:28
4705	321	2025-09-13 16:02:11	2025-09-13 21:11:11	2025-09-13 16:02:11
4706	145	2025-06-08 15:38:23	2025-06-08 18:39:23	2025-06-08 15:38:23
4707	118	2025-08-30 16:29:10	2025-08-30 19:18:10	2025-08-30 16:29:10
4708	193	2024-11-24 15:59:10	2024-11-24 20:52:10	2024-11-24 15:59:10
4709	271	2025-10-21 15:31:51	2025-10-21 19:38:51	2025-10-21 15:31:51
4710	457	2025-06-24 14:41:52	2025-06-24 16:12:52	2025-06-24 14:41:52
4711	708	2025-04-12 16:27:54	2025-04-12 17:55:54	2025-04-12 16:27:54
4712	23	2025-10-16 16:41:27	2025-10-16 19:57:27	2025-10-16 16:41:27
4713	907	2025-05-20 14:09:17	2025-05-20 18:01:17	2025-05-20 14:09:17
4714	259	2024-12-03 17:07:50	2024-12-03 21:50:50	2024-12-03 17:07:50
4715	693	2025-01-28 18:25:15	2025-01-28 23:06:15	2025-01-28 18:25:15
4716	58	2025-02-15 18:32:47	2025-02-15 20:54:47	2025-02-15 18:32:47
4717	400	2025-10-12 17:04:09	2025-10-12 22:15:09	2025-10-12 17:04:09
4718	393	2025-04-12 16:06:42	2025-04-12 21:20:42	2025-04-12 16:06:42
4719	286	2025-07-01 15:18:51	2025-07-01 17:18:51	2025-07-01 15:18:51
4720	831	2025-01-26 09:21:43	2025-01-26 12:20:43	2025-01-26 09:21:43
4721	731	2025-10-15 08:47:10	2025-10-15 14:22:10	2025-10-15 08:47:10
4722	411	2024-12-28 14:07:27	2024-12-28 19:51:27	2024-12-28 14:07:27
4723	476	2025-03-16 13:27:33	2025-03-16 19:02:33	2025-03-16 13:27:33
4724	263	2025-01-07 19:11:30	2025-01-08 00:14:30	2025-01-07 19:11:30
4725	839	2025-10-28 10:05:38	2025-10-28 14:59:38	2025-10-28 10:05:38
4726	286	2025-05-11 14:36:30	2025-05-11 19:42:30	2025-05-11 14:36:30
4727	501	2025-05-20 17:43:56	2025-05-20 23:08:56	2025-05-20 17:43:56
4728	357	2025-02-09 17:11:23	2025-02-09 22:17:23	2025-02-09 17:11:23
4729	604	2025-05-06 14:44:37	2025-05-06 18:34:37	2025-05-06 14:44:37
4730	759	2025-04-08 04:59:23	2025-04-08 07:11:23	2025-04-08 04:59:23
4731	937	2025-04-08 14:06:28	2025-04-08 20:01:28	2025-04-08 14:06:28
4732	459	2025-04-22 13:02:12	2025-04-22 16:06:12	2025-04-22 13:02:12
4733	95	2025-05-31 14:41:55	2025-05-31 19:36:55	2025-05-31 14:41:55
4734	132	2025-08-24 13:46:45	2025-08-24 17:19:45	2025-08-24 13:46:45
4735	215	2025-04-12 18:06:26	2025-04-12 21:42:26	2025-04-12 18:06:26
4736	918	2025-03-29 15:41:04	2025-03-29 16:43:04	2025-03-29 15:41:04
4737	188	2025-05-03 10:59:25	2025-05-03 14:20:25	2025-05-03 10:59:25
4738	73	2024-11-23 05:20:52	2024-11-23 08:22:52	2024-11-23 05:20:52
4739	569	2025-07-01 16:22:29	2025-07-01 19:08:29	2025-07-01 16:22:29
4740	518	2025-06-29 16:50:20	2025-06-29 19:11:20	2025-06-29 16:50:20
4741	486	2025-08-26 14:49:03	2025-08-26 20:22:03	2025-08-26 14:49:03
4742	800	2025-04-26 16:52:52	2025-04-26 20:34:52	2025-04-26 16:52:52
4743	606	2025-10-11 16:28:31	2025-10-11 21:10:31	2025-10-11 16:28:31
4744	956	2025-08-11 22:25:15	2025-08-12 03:23:15	2025-08-11 22:25:15
4745	753	2025-10-18 14:58:14	2025-10-18 16:09:14	2025-10-18 14:58:14
4746	699	2025-09-16 09:47:06	2025-09-16 10:48:06	2025-09-16 09:47:06
4747	869	2025-07-01 16:35:51	2025-07-01 20:19:51	2025-07-01 16:35:51
4748	985	2025-05-11 06:23:46	2025-05-11 12:06:46	2025-05-11 06:23:46
4749	94	2025-07-22 15:07:31	2025-07-22 18:11:31	2025-07-22 15:07:31
4750	844	2025-06-28 14:58:39	2025-06-28 17:54:39	2025-06-28 14:58:39
4751	552	2025-09-14 23:10:52	2025-09-15 00:55:52	2025-09-14 23:10:52
4752	860	2025-07-01 14:52:41	2025-07-01 17:26:41	2025-07-01 14:52:41
4753	667	2024-11-24 05:55:32	2024-11-24 08:16:32	2024-11-24 05:55:32
4754	546	2025-04-29 18:10:03	2025-04-29 21:29:03	2025-04-29 18:10:03
4755	403	2025-09-09 15:07:27	2025-09-09 16:21:27	2025-09-09 15:07:27
4756	154	2024-11-23 12:33:16	2024-11-23 18:11:16	2024-11-23 12:33:16
4757	750	2025-10-04 15:06:03	2025-10-04 17:09:03	2025-10-04 15:06:03
4758	68	2025-09-25 16:34:50	2025-09-25 17:44:50	2025-09-25 16:34:50
4759	930	2025-09-30 18:16:34	2025-09-30 22:11:34	2025-09-30 18:16:34
4760	467	2025-07-26 16:34:21	2025-07-26 17:59:21	2025-07-26 16:34:21
4761	207	2024-12-15 19:47:41	2024-12-15 21:55:41	2024-12-15 19:47:41
4762	687	2025-08-10 15:27:38	2025-08-10 19:09:38	2025-08-10 15:27:38
4763	318	2024-11-19 17:14:54	2024-11-19 20:14:54	2024-11-19 17:14:54
4764	430	2024-11-19 19:15:59	2024-11-20 01:00:59	2024-11-19 19:15:59
4765	12	2024-12-24 16:22:31	2024-12-24 18:59:31	2024-12-24 16:22:31
4766	389	2025-06-17 16:44:04	2025-06-17 20:04:04	2025-06-17 16:44:04
4767	336	2025-03-22 14:53:48	2025-03-22 17:34:48	2025-03-22 14:53:48
4768	342	2024-11-19 16:28:38	2024-11-19 20:02:38	2024-11-19 16:28:38
4769	393	2025-07-29 14:54:25	2025-07-29 16:15:25	2025-07-29 14:54:25
4770	415	2025-07-27 14:14:47	2025-07-27 18:55:47	2025-07-27 14:14:47
4771	380	2025-10-07 14:21:38	2025-10-07 19:46:38	2025-10-07 14:21:38
4772	975	2025-08-19 09:29:16	2025-08-19 15:08:16	2025-08-19 09:29:16
4773	49	2025-06-14 06:23:19	2025-06-14 09:07:19	2025-06-14 06:23:19
4774	586	2025-05-04 16:09:20	2025-05-04 21:01:20	2025-05-04 16:09:20
4775	454	2025-07-12 15:28:30	2025-07-12 18:11:30	2025-07-12 15:28:30
4776	280	2024-12-24 16:16:15	2024-12-24 17:23:15	2024-12-24 16:16:15
4777	511	2025-06-10 18:36:13	2025-06-10 19:54:13	2025-06-10 18:36:13
4778	427	2025-02-08 17:59:48	2025-02-08 19:46:48	2025-02-08 17:59:48
4779	393	2025-07-01 16:51:51	2025-07-01 20:58:51	2025-07-01 16:51:51
4780	929	2025-01-25 19:53:25	2025-01-25 23:44:25	2025-01-25 19:53:25
4781	492	2025-10-11 18:06:53	2025-10-11 19:50:53	2025-10-11 18:06:53
4782	629	2025-05-06 16:12:06	2025-05-06 17:54:06	2025-05-06 16:12:06
4783	417	2025-05-27 18:50:59	2025-05-27 22:38:59	2025-05-27 18:50:59
4784	636	2025-10-04 18:14:25	2025-10-04 20:53:25	2025-10-04 18:14:25
4785	605	2025-06-10 15:49:57	2025-06-10 21:06:57	2025-06-10 15:49:57
4786	207	2025-05-20 08:33:21	2025-05-20 09:41:21	2025-05-20 08:33:21
4787	453	2025-05-20 18:17:42	2025-05-20 21:14:42	2025-05-20 18:17:42
4788	981	2025-08-30 15:51:56	2025-08-30 18:44:56	2025-08-30 15:51:56
4789	324	2025-03-25 15:54:43	2025-03-25 16:58:43	2025-03-25 15:54:43
4790	79	2025-04-01 16:59:47	2025-04-01 18:08:47	2025-04-01 16:59:47
4791	842	2025-04-15 13:46:07	2025-04-15 17:34:07	2025-04-15 13:46:07
4792	3	2025-09-06 14:30:52	2025-09-06 20:08:52	2025-09-06 14:30:52
4793	928	2025-01-07 16:22:30	2025-01-07 18:57:30	2025-01-07 16:22:30
4794	759	2025-10-25 16:24:17	2025-10-25 21:46:17	2025-10-25 16:24:17
4795	731	2025-03-15 15:33:14	2025-03-15 19:51:14	2025-03-15 15:33:14
4796	873	2024-12-15 19:16:49	2024-12-15 22:35:49	2024-12-15 19:16:49
4797	229	2025-10-14 14:25:30	2025-10-14 16:07:30	2025-10-14 14:25:30
4798	147	2025-09-30 08:29:06	2025-09-30 09:57:06	2025-09-30 08:29:06
4799	831	2025-05-27 17:28:40	2025-05-27 21:08:40	2025-05-27 17:28:40
4800	459	2024-11-30 15:44:04	2024-11-30 17:47:04	2024-11-30 15:44:04
4801	385	2025-06-03 15:36:25	2025-06-03 17:31:25	2025-06-03 15:36:25
4802	747	2025-05-17 18:42:59	2025-05-17 20:26:59	2025-05-17 18:42:59
4803	92	2025-07-05 15:07:19	2025-07-05 20:05:19	2025-07-05 15:07:19
4804	786	2025-02-04 17:15:00	2025-02-04 20:29:00	2025-02-04 17:15:00
4805	717	2025-07-19 00:49:11	2025-07-19 03:37:11	2025-07-19 00:49:11
4806	628	2025-06-02 21:00:38	2025-06-03 01:05:38	2025-06-02 21:00:38
4807	599	2024-12-31 16:17:45	2024-12-31 18:23:45	2024-12-31 16:17:45
4808	510	2025-03-02 09:51:42	2025-03-02 13:12:42	2025-03-02 09:51:42
4809	475	2025-10-26 05:02:10	2025-10-26 08:02:10	2025-10-26 05:02:10
4810	320	2025-10-07 04:46:36	2025-10-07 10:18:36	2025-10-07 04:46:36
4811	833	2025-10-28 16:16:25	2025-10-28 17:41:25	2025-10-28 16:16:25
4812	690	2025-01-07 17:33:39	2025-01-07 23:21:39	2025-01-07 17:33:39
4813	235	2025-05-20 15:07:08	2025-05-20 20:39:08	2025-05-20 15:07:08
4814	777	2025-07-22 07:25:40	2025-07-22 11:53:40	2025-07-22 07:25:40
4815	229	2025-09-14 08:56:54	2025-09-14 14:38:54	2025-09-14 08:56:54
4816	290	2025-09-30 18:19:15	2025-09-30 22:53:15	2025-09-30 18:19:15
4817	851	2024-12-21 07:25:54	2024-12-21 09:45:54	2024-12-21 07:25:54
4818	787	2025-04-27 10:28:30	2025-04-27 11:40:30	2025-04-27 10:28:30
4819	507	2024-11-16 05:59:30	2024-11-16 09:14:30	2024-11-16 05:59:30
4820	796	2025-09-28 15:17:48	2025-09-28 18:07:48	2025-09-28 15:17:48
4821	11	2025-09-09 14:23:08	2025-09-09 15:33:08	2025-09-09 14:23:08
4822	949	2025-05-31 10:34:14	2025-05-31 13:04:14	2025-05-31 10:34:14
4823	209	2025-07-29 18:25:07	2025-07-29 22:45:07	2025-07-29 18:25:07
4824	37	2025-07-05 15:57:13	2025-07-05 17:01:13	2025-07-05 15:57:13
4825	644	2025-06-11 16:48:46	2025-06-11 21:56:46	2025-06-11 16:48:46
4826	634	2025-03-25 15:29:25	2025-03-25 18:45:25	2025-03-25 15:29:25
4827	40	2025-03-08 17:55:05	2025-03-08 19:10:05	2025-03-08 17:55:05
4828	37	2025-01-28 16:47:55	2025-01-28 19:17:55	2025-01-28 16:47:55
4829	598	2024-11-12 15:11:31	2024-11-12 18:23:31	2024-11-12 15:11:31
4830	472	2025-06-28 15:57:48	2025-06-28 18:45:48	2025-06-28 15:57:48
4831	715	2025-07-08 18:32:05	2025-07-08 20:40:05	2025-07-08 18:32:05
4832	933	2024-12-07 15:16:31	2024-12-07 18:51:31	2024-12-07 15:16:31
4833	540	2024-11-23 16:05:02	2024-11-23 21:50:02	2024-11-23 16:05:02
4834	650	2024-12-31 15:46:14	2024-12-31 21:05:14	2024-12-31 15:46:14
4835	49	2025-05-04 15:20:40	2025-05-04 16:39:40	2025-05-04 15:20:40
4836	381	2025-05-03 16:10:22	2025-05-03 21:20:22	2025-05-03 16:10:22
4837	872	2025-01-17 16:38:51	2025-01-17 20:39:51	2025-01-17 16:38:51
4838	79	2025-07-05 14:07:48	2025-07-05 15:23:48	2025-07-05 14:07:48
4839	865	2025-06-03 17:16:30	2025-06-03 20:00:30	2025-06-03 17:16:30
4840	214	2025-03-15 15:45:04	2025-03-15 18:21:04	2025-03-15 15:45:04
4841	707	2025-05-20 16:44:17	2025-05-20 19:48:17	2025-05-20 16:44:17
4842	501	2025-01-07 17:44:58	2025-01-07 19:57:58	2025-01-07 17:44:58
4843	480	2025-07-05 05:14:06	2025-07-05 08:43:06	2025-07-05 05:14:06
4844	990	2025-03-23 17:33:07	2025-03-23 22:14:07	2025-03-23 17:33:07
4845	358	2025-01-11 15:38:42	2025-01-11 19:01:42	2025-01-11 15:38:42
4846	981	2024-11-23 16:50:12	2024-11-23 19:46:12	2024-11-23 16:50:12
4847	481	2025-05-18 14:50:54	2025-05-18 19:18:54	2025-05-18 14:50:54
4848	484	2025-02-01 18:48:52	2025-02-01 23:16:52	2025-02-01 18:48:52
4849	598	2025-04-15 14:50:30	2025-04-15 18:28:30	2025-04-15 14:50:30
4850	862	2025-02-16 16:07:10	2025-02-16 19:12:10	2025-02-16 16:07:10
4851	2	2024-12-13 16:37:21	2024-12-13 17:47:21	2024-12-13 16:37:21
4852	661	2025-05-29 02:48:59	2025-05-29 04:34:59	2025-05-29 02:48:59
4853	619	2025-11-02 16:29:05	2025-11-02 19:30:05	2025-11-02 16:29:05
4854	3	2024-11-19 08:04:17	2024-11-19 10:00:17	2024-11-19 08:04:17
4855	152	2025-03-30 15:55:15	2025-03-30 18:38:15	2025-03-30 15:55:15
4856	449	2025-07-06 17:29:36	2025-07-06 21:53:36	2025-07-06 17:29:36
4857	689	2025-07-29 14:50:09	2025-07-29 16:34:09	2025-07-29 14:50:09
4858	912	2025-05-09 18:08:59	2025-05-09 20:02:59	2025-05-09 18:08:59
4859	929	2025-07-08 18:35:06	2025-07-08 22:30:06	2025-07-08 18:35:06
4860	870	2025-07-01 14:27:22	2025-07-01 19:03:22	2025-07-01 14:27:22
4861	8	2025-08-09 07:31:07	2025-08-09 09:10:07	2025-08-09 07:31:07
4862	226	2025-08-12 10:00:27	2025-08-12 15:53:27	2025-08-12 10:00:27
4863	461	2025-07-26 17:06:45	2025-07-26 18:24:45	2025-07-26 17:06:45
4864	745	2025-09-16 15:11:54	2025-09-16 19:55:54	2025-09-16 15:11:54
4865	38	2025-08-09 00:33:06	2025-08-09 05:43:06	2025-08-09 00:33:06
4866	847	2025-05-04 14:20:05	2025-05-04 17:49:05	2025-05-04 14:20:05
4867	477	2025-06-29 14:22:25	2025-06-29 18:12:25	2025-06-29 14:22:25
4868	499	2024-11-16 11:38:57	2024-11-16 15:29:57	2024-11-16 11:38:57
4869	593	2025-07-22 17:14:35	2025-07-22 22:47:35	2025-07-22 17:14:35
4870	594	2025-04-01 15:01:15	2025-04-01 17:17:15	2025-04-01 15:01:15
4871	595	2025-03-25 16:54:10	2025-03-25 21:37:10	2025-03-25 16:54:10
4872	900	2024-11-30 16:56:24	2024-11-30 17:58:24	2024-11-30 16:56:24
4873	603	2025-10-07 14:24:36	2025-10-07 15:33:36	2025-10-07 14:24:36
4874	876	2025-10-22 15:15:42	2025-10-22 21:11:42	2025-10-22 15:15:42
4875	752	2025-01-28 15:15:27	2025-01-28 19:41:27	2025-01-28 15:15:27
4876	210	2025-01-18 06:58:09	2025-01-18 12:10:09	2025-01-18 06:58:09
4877	170	2025-02-04 09:48:13	2025-02-04 11:14:13	2025-02-04 09:48:13
4878	461	2025-06-29 14:01:49	2025-06-29 17:24:49	2025-06-29 14:01:49
4879	668	2025-02-22 15:34:47	2025-02-22 16:48:47	2025-02-22 15:34:47
4880	978	2025-07-19 09:37:28	2025-07-19 11:28:28	2025-07-19 09:37:28
4881	84	2025-10-06 10:10:45	2025-10-06 12:59:45	2025-10-06 10:10:45
4882	86	2025-01-05 17:07:33	2025-01-05 18:17:33	2025-01-05 17:07:33
4883	114	2025-06-17 15:52:56	2025-06-17 18:01:56	2025-06-17 15:52:56
4884	472	2024-11-16 17:44:17	2024-11-16 21:23:17	2024-11-16 17:44:17
4885	716	2024-12-01 17:34:46	2024-12-01 21:59:46	2024-12-01 17:34:46
4886	967	2025-02-04 15:34:57	2025-02-04 19:58:57	2025-02-04 15:34:57
4887	916	2025-09-06 08:56:06	2025-09-06 12:28:06	2025-09-06 08:56:06
4888	198	2025-03-04 15:02:26	2025-03-04 20:09:26	2025-03-04 15:02:26
4889	810	2024-11-23 19:24:50	2024-11-23 21:57:50	2024-11-23 19:24:50
4890	584	2025-02-16 09:35:58	2025-02-16 12:43:58	2025-02-16 09:35:58
4891	727	2025-03-04 15:54:47	2025-03-04 17:09:47	2025-03-04 15:54:47
4892	623	2025-10-04 09:20:48	2025-10-04 12:11:48	2025-10-04 09:20:48
4893	848	2025-10-12 14:10:31	2025-10-12 17:38:31	2025-10-12 14:10:31
4894	662	2025-04-26 08:54:41	2025-04-26 10:07:41	2025-04-26 08:54:41
4895	522	2025-02-11 17:43:40	2025-02-11 22:19:40	2025-02-11 17:43:40
4896	71	2025-04-15 14:01:29	2025-04-15 17:23:29	2025-04-15 14:01:29
4897	840	2024-12-17 11:50:52	2024-12-17 13:04:52	2024-12-17 11:50:52
4898	11	2025-04-06 14:51:17	2025-04-06 18:48:17	2025-04-06 14:51:17
4899	732	2025-05-20 14:11:15	2025-05-20 16:10:15	2025-05-20 14:11:15
4900	967	2025-02-16 17:18:37	2025-02-16 19:23:37	2025-02-16 17:18:37
4901	281	2025-04-29 14:44:15	2025-04-29 18:18:15	2025-04-29 14:44:15
4902	149	2025-01-19 17:36:15	2025-01-19 23:32:15	2025-01-19 17:36:15
4903	843	2024-12-10 08:35:34	2024-12-10 12:51:34	2024-12-10 08:35:34
4904	929	2025-07-20 16:42:08	2025-07-20 18:56:08	2025-07-20 16:42:08
4905	271	2024-11-16 18:33:22	2024-11-16 22:22:22	2024-11-16 18:33:22
4906	707	2025-09-01 17:26:40	2025-09-01 20:01:40	2025-09-01 17:26:40
4907	105	2025-04-26 15:58:49	2025-04-26 18:57:49	2025-04-26 15:58:49
4908	831	2025-02-16 16:35:22	2025-02-16 20:32:22	2025-02-16 16:35:22
4909	844	2025-10-05 14:23:18	2025-10-05 18:41:18	2025-10-05 14:23:18
4910	636	2024-12-13 17:14:41	2024-12-13 19:50:41	2024-12-13 17:14:41
4911	347	2024-12-17 16:21:05	2024-12-17 21:22:05	2024-12-17 16:21:05
4912	989	2025-05-23 14:50:32	2025-05-23 18:58:32	2025-05-23 14:50:32
4913	254	2025-10-18 08:03:19	2025-10-18 12:05:19	2025-10-18 08:03:19
4914	275	2025-01-04 17:22:05	2025-01-04 19:47:05	2025-01-04 17:22:05
4915	354	2025-04-15 15:22:56	2025-04-15 16:46:56	2025-04-15 15:22:56
4916	583	2025-06-29 14:44:35	2025-06-29 19:25:35	2025-06-29 14:44:35
4917	487	2025-05-24 04:54:13	2025-05-24 09:49:13	2025-05-24 04:54:13
4918	527	2025-06-29 18:06:03	2025-06-29 21:06:03	2025-06-29 18:06:03
4919	209	2025-08-09 15:00:37	2025-08-09 19:33:37	2025-08-09 15:00:37
4920	799	2024-12-19 06:18:10	2024-12-19 09:57:10	2024-12-19 06:18:10
4921	127	2025-07-05 15:35:22	2025-07-05 20:09:22	2025-07-05 15:35:22
4922	737	2025-04-27 16:12:42	2025-04-27 20:16:42	2025-04-27 16:12:42
4923	33	2025-05-20 15:17:39	2025-05-20 18:30:39	2025-05-20 15:17:39
4924	476	2025-03-15 17:32:10	2025-03-15 22:16:10	2025-03-15 17:32:10
4925	286	2025-05-30 17:04:42	2025-05-30 21:35:42	2025-05-30 17:04:42
4926	832	2025-06-17 17:07:14	2025-06-17 22:39:14	2025-06-17 17:07:14
4927	496	2025-04-05 14:35:52	2025-04-05 16:20:52	2025-04-05 14:35:52
4928	888	2025-07-12 20:44:38	2025-07-12 21:47:38	2025-07-12 20:44:38
4929	23	2025-07-22 14:39:46	2025-07-22 19:36:46	2025-07-22 14:39:46
4930	728	2025-05-27 15:40:05	2025-05-27 20:58:05	2025-05-27 15:40:05
4931	843	2025-07-31 14:03:08	2025-07-31 16:21:08	2025-07-31 14:03:08
4932	73	2024-12-01 15:43:32	2024-12-01 18:27:32	2024-12-01 15:43:32
4933	58	2025-03-02 12:22:24	2025-03-02 15:13:24	2025-03-02 12:22:24
4934	990	2025-03-18 15:59:55	2025-03-18 19:45:55	2025-03-18 15:59:55
4935	209	2025-10-07 12:21:21	2025-10-07 15:05:21	2025-10-07 12:21:21
4936	105	2025-08-16 21:20:33	2025-08-17 02:13:33	2025-08-16 21:20:33
4937	578	2025-05-17 14:46:23	2025-05-17 16:46:23	2025-05-17 14:46:23
4938	996	2025-01-25 15:46:37	2025-01-25 20:37:37	2025-01-25 15:46:37
4939	212	2025-10-18 17:42:28	2025-10-18 20:59:28	2025-10-18 17:42:28
4940	66	2025-04-19 16:17:09	2025-04-19 18:22:09	2025-04-19 16:17:09
4941	4	2025-02-10 16:57:40	2025-02-10 22:43:40	2025-02-10 16:57:40
4942	735	2025-07-27 16:37:56	2025-07-27 22:13:56	2025-07-27 16:37:56
4943	247	2025-09-21 05:13:28	2025-09-21 06:23:28	2025-09-21 05:13:28
4944	19	2025-06-10 15:19:35	2025-06-10 17:51:35	2025-06-10 15:19:35
4945	613	2025-02-11 19:37:53	2025-02-11 23:33:53	2025-02-11 19:37:53
4946	597	2025-05-03 14:41:17	2025-05-03 20:38:17	2025-05-03 14:41:17
4947	131	2025-02-11 16:17:44	2025-02-11 17:34:44	2025-02-11 16:17:44
4948	502	2025-04-22 18:06:20	2025-04-22 22:37:20	2025-04-22 18:06:20
4949	375	2024-11-17 17:25:03	2024-11-17 19:54:03	2024-11-17 17:25:03
4950	834	2025-05-20 14:37:56	2025-05-20 18:04:56	2025-05-20 14:37:56
4951	365	2025-05-17 17:03:05	2025-05-17 20:13:05	2025-05-17 17:03:05
4952	754	2025-03-04 16:00:14	2025-03-04 20:06:14	2025-03-04 16:00:14
4953	644	2025-03-30 16:20:39	2025-03-30 19:02:39	2025-03-30 16:20:39
4954	103	2025-03-05 18:57:10	2025-03-06 00:48:10	2025-03-05 18:57:10
4955	835	2025-07-27 08:27:47	2025-07-27 12:33:47	2025-07-27 08:27:47
4956	765	2025-06-29 19:13:39	2025-06-30 01:09:39	2025-06-29 19:13:39
4957	10	2025-05-20 16:37:20	2025-05-20 20:35:20	2025-05-20 16:37:20
4958	736	2025-05-15 15:20:23	2025-05-15 20:45:23	2025-05-15 15:20:23
4959	218	2025-05-18 16:44:35	2025-05-18 18:00:35	2025-05-18 16:44:35
4960	566	2025-05-08 15:32:40	2025-05-08 18:41:40	2025-05-08 15:32:40
4961	181	2025-06-28 16:09:27	2025-06-28 18:54:27	2025-06-28 16:09:27
4962	894	2025-09-30 16:43:59	2025-09-30 18:16:59	2025-09-30 16:43:59
4963	248	2025-10-28 15:05:18	2025-10-28 17:58:18	2025-10-28 15:05:18
4964	994	2024-12-21 16:26:13	2024-12-21 19:11:13	2024-12-21 16:26:13
4965	404	2025-10-07 14:14:40	2025-10-07 16:35:40	2025-10-07 14:14:40
4966	530	2025-03-09 13:36:07	2025-03-09 16:29:07	2025-03-09 13:36:07
4967	308	2025-06-22 12:26:18	2025-06-22 14:00:18	2025-06-22 12:26:18
4968	698	2025-09-16 06:18:18	2025-09-16 08:23:18	2025-09-16 06:18:18
4969	385	2025-03-15 16:24:10	2025-03-15 21:48:10	2025-03-15 16:24:10
4970	655	2024-12-04 15:26:59	2024-12-04 21:18:59	2024-12-04 15:26:59
4971	855	2024-12-21 16:35:11	2024-12-21 20:19:11	2024-12-21 16:35:11
4972	914	2025-08-24 16:50:50	2025-08-24 20:19:50	2025-08-24 16:50:50
4973	25	2025-09-20 14:20:06	2025-09-20 15:46:06	2025-09-20 14:20:06
4974	564	2025-06-28 01:23:52	2025-06-28 04:23:52	2025-06-28 01:23:52
4975	318	2025-04-29 15:46:37	2025-04-29 20:57:37	2025-04-29 15:46:37
4976	328	2025-06-29 15:20:54	2025-06-29 19:16:54	2025-06-29 15:20:54
4977	898	2025-07-19 15:13:10	2025-07-19 19:46:10	2025-07-19 15:13:10
4978	556	2025-08-24 17:18:11	2025-08-24 22:16:11	2025-08-24 17:18:11
4979	728	2025-03-22 16:26:42	2025-03-22 17:38:42	2025-03-22 16:26:42
4980	471	2025-03-14 15:06:14	2025-03-14 17:31:14	2025-03-14 15:06:14
4981	977	2025-05-10 14:48:25	2025-05-10 20:20:25	2025-05-10 14:48:25
4982	488	2025-02-11 09:42:28	2025-02-11 15:06:28	2025-02-11 09:42:28
4983	427	2025-03-04 18:34:42	2025-03-05 00:04:42	2025-03-04 18:34:42
4984	240	2024-12-10 11:13:18	2024-12-10 13:32:18	2024-12-10 11:13:18
4985	848	2025-03-09 16:12:34	2025-03-09 20:54:34	2025-03-09 16:12:34
4986	564	2025-09-09 06:00:28	2025-09-09 11:17:28	2025-09-09 06:00:28
4987	660	2025-04-29 14:20:50	2025-04-29 19:31:50	2025-04-29 14:20:50
4988	699	2025-02-18 15:36:20	2025-02-18 20:26:20	2025-02-18 15:36:20
4989	674	2025-02-18 16:37:00	2025-02-18 18:33:00	2025-02-18 16:37:00
4990	38	2025-05-11 15:14:49	2025-05-11 18:24:49	2025-05-11 15:14:49
4991	574	2024-11-23 15:04:18	2024-11-23 18:47:18	2024-11-23 15:04:18
4992	109	2025-02-25 07:07:15	2025-02-25 12:22:15	2025-02-25 07:07:15
4993	724	2025-07-08 04:07:16	2025-07-08 06:47:16	2025-07-08 04:07:16
4994	65	2025-08-12 15:57:55	2025-08-12 17:56:55	2025-08-12 15:57:55
4995	696	2025-02-04 16:54:03	2025-02-04 20:19:03	2025-02-04 16:54:03
4996	679	2025-01-04 16:44:40	2025-01-04 18:32:40	2025-01-04 16:44:40
4997	936	2024-12-15 18:28:20	2024-12-15 22:32:20	2024-12-15 18:28:20
4998	913	2024-11-19 18:08:11	2024-11-20 00:07:11	2024-11-19 18:08:11
4999	438	2025-09-07 17:03:09	2025-09-07 20:33:09	2025-09-07 17:03:09
5000	258	2025-11-02 11:43:06	2025-11-02 15:36:06	2025-11-02 11:43:06
5001	112	2025-07-12 15:07:14	2025-07-12 18:28:14	2025-07-12 15:07:14
5002	274	2025-07-21 15:11:38	2025-07-21 16:20:38	2025-07-21 15:11:38
5003	402	2024-12-17 15:37:47	2024-12-17 17:32:47	2024-12-17 15:37:47
5004	91	2025-08-10 14:10:42	2025-08-10 15:32:42	2025-08-10 14:10:42
5005	507	2024-11-30 05:06:52	2024-11-30 07:39:52	2024-11-30 05:06:52
5006	580	2024-11-09 08:54:23	2024-11-09 13:07:23	2024-11-09 08:54:23
5007	231	2025-10-19 18:11:31	2025-10-19 21:05:31	2025-10-19 18:11:31
5008	200	2025-09-28 16:34:44	2025-09-28 18:40:44	2025-09-28 16:34:44
5009	950	2025-08-16 14:53:27	2025-08-16 16:12:27	2025-08-16 14:53:27
5010	924	2025-09-08 17:26:49	2025-09-08 22:01:49	2025-09-08 17:26:49
5011	640	2025-07-06 18:29:32	2025-07-06 19:56:32	2025-07-06 18:29:32
5012	503	2025-08-28 14:08:11	2025-08-28 18:13:11	2025-08-28 14:08:11
5013	751	2024-12-31 19:25:05	2024-12-31 22:18:05	2024-12-31 19:25:05
5014	7	2024-12-21 16:03:08	2024-12-21 19:14:08	2024-12-21 16:03:08
5015	204	2025-07-15 14:31:42	2025-07-15 15:40:42	2025-07-15 14:31:42
5016	55	2025-03-05 12:48:24	2025-03-05 18:21:24	2025-03-05 12:48:24
5017	930	2025-01-11 13:50:55	2025-01-11 16:19:55	2025-01-11 13:50:55
5018	960	2025-07-15 15:48:55	2025-07-15 19:58:55	2025-07-15 15:48:55
5019	495	2025-04-27 14:03:29	2025-04-27 18:17:29	2025-04-27 14:03:29
5020	201	2024-11-19 18:08:35	2024-11-19 20:45:35	2024-11-19 18:08:35
5021	316	2024-11-24 16:01:54	2024-11-24 20:05:54	2024-11-24 16:01:54
5022	514	2024-12-01 14:24:25	2024-12-01 15:41:25	2024-12-01 14:24:25
5023	826	2025-10-14 15:26:32	2025-10-14 20:00:32	2025-10-14 15:26:32
5024	486	2024-11-30 19:29:10	2024-12-01 00:40:10	2024-11-30 19:29:10
5025	283	2025-10-05 15:17:28	2025-10-05 17:12:28	2025-10-05 15:17:28
5026	738	2025-03-09 16:15:07	2025-03-09 21:14:07	2025-03-09 16:15:07
5027	623	2024-12-21 19:52:20	2024-12-21 21:03:20	2024-12-21 19:52:20
5028	590	2025-01-28 17:31:03	2025-01-28 20:13:03	2025-01-28 17:31:03
5029	993	2025-11-01 17:33:35	2025-11-01 19:34:35	2025-11-01 17:33:35
5030	744	2025-09-16 14:54:52	2025-09-16 18:15:52	2025-09-16 14:54:52
5031	683	2025-08-01 15:45:53	2025-08-01 17:56:53	2025-08-01 15:45:53
5032	580	2025-08-10 16:21:52	2025-08-10 18:39:52	2025-08-10 16:21:52
5033	351	2025-07-22 17:57:37	2025-07-22 23:42:37	2025-07-22 17:57:37
5034	753	2025-02-04 15:40:50	2025-02-04 18:36:50	2025-02-04 15:40:50
5035	482	2025-04-15 07:22:36	2025-04-15 10:31:36	2025-04-15 07:22:36
5036	84	2025-05-18 15:29:30	2025-05-18 16:51:30	2025-05-18 15:29:30
5037	354	2025-04-01 15:36:23	2025-04-01 20:53:23	2025-04-01 15:36:23
5038	635	2025-04-12 16:10:23	2025-04-12 17:30:23	2025-04-12 16:10:23
5039	299	2025-06-24 14:05:53	2025-06-24 15:50:53	2025-06-24 14:05:53
5040	571	2025-01-14 17:32:37	2025-01-14 23:02:37	2025-01-14 17:32:37
5041	16	2025-05-31 15:26:04	2025-05-31 21:10:04	2025-05-31 15:26:04
5042	903	2025-02-01 16:53:52	2025-02-01 21:37:52	2025-02-01 16:53:52
5043	443	2025-07-26 18:57:56	2025-07-26 23:09:56	2025-07-26 18:57:56
5044	34	2025-01-18 03:09:27	2025-01-18 04:22:27	2025-01-18 03:09:27
5045	384	2025-07-06 15:22:26	2025-07-06 21:14:26	2025-07-06 15:22:26
5046	427	2024-12-31 17:30:54	2024-12-31 22:46:54	2024-12-31 17:30:54
5047	378	2025-03-04 17:48:45	2025-03-04 20:41:45	2025-03-04 17:48:45
5048	771	2025-01-07 03:51:32	2025-01-07 05:55:32	2025-01-07 03:51:32
5049	977	2025-03-29 17:45:45	2025-03-29 19:06:45	2025-03-29 17:45:45
5050	444	2025-09-27 15:48:12	2025-09-27 17:17:12	2025-09-27 15:48:12
5051	418	2025-05-24 13:41:54	2025-05-24 17:26:54	2025-05-24 13:41:54
5052	614	2025-06-07 06:25:36	2025-06-07 08:50:36	2025-06-07 06:25:36
5053	55	2025-08-12 15:29:50	2025-08-12 20:25:50	2025-08-12 15:29:50
5054	658	2025-08-24 17:43:02	2025-08-24 19:37:02	2025-08-24 17:43:02
5055	989	2025-04-06 11:09:40	2025-04-06 16:09:40	2025-04-06 11:09:40
5056	287	2024-12-08 12:35:40	2024-12-08 17:22:40	2024-12-08 12:35:40
5057	13	2025-10-23 16:37:55	2025-10-23 18:01:55	2025-10-23 16:37:55
5058	764	2025-07-20 16:08:37	2025-07-20 21:59:37	2025-07-20 16:08:37
5059	23	2025-10-12 15:53:36	2025-10-12 21:26:36	2025-10-12 15:53:36
5060	827	2025-08-17 17:46:24	2025-08-17 20:43:24	2025-08-17 17:46:24
5061	928	2025-11-02 14:28:25	2025-11-02 20:09:25	2025-11-02 14:28:25
5062	829	2025-04-19 15:20:19	2025-04-19 21:19:19	2025-04-19 15:20:19
5063	932	2025-09-20 11:17:13	2025-09-20 14:15:13	2025-09-20 11:17:13
5064	1000	2025-02-16 10:02:58	2025-02-16 15:26:58	2025-02-16 10:02:58
5065	75	2025-07-26 14:22:03	2025-07-26 17:00:03	2025-07-26 14:22:03
5066	703	2025-05-10 14:04:06	2025-05-10 16:27:06	2025-05-10 14:04:06
5067	187	2024-12-17 12:14:38	2024-12-17 13:40:38	2024-12-17 12:14:38
5068	263	2025-08-02 18:58:23	2025-08-02 20:15:23	2025-08-02 18:58:23
5069	287	2025-03-16 16:42:47	2025-03-16 22:19:47	2025-03-16 16:42:47
5070	341	2025-03-16 15:57:57	2025-03-16 19:52:57	2025-03-16 15:57:57
5071	352	2024-12-28 14:53:34	2024-12-28 16:14:34	2024-12-28 14:53:34
5072	589	2025-08-02 15:47:49	2025-08-02 19:59:49	2025-08-02 15:47:49
5073	221	2025-04-20 16:33:44	2025-04-20 20:44:44	2025-04-20 16:33:44
5074	321	2024-11-26 17:50:41	2024-11-26 18:54:41	2024-11-26 17:50:41
5075	487	2025-04-01 15:14:46	2025-04-01 20:34:46	2025-04-01 15:14:46
5076	907	2025-02-24 09:37:34	2025-02-24 12:21:34	2025-02-24 09:37:34
5077	884	2025-10-11 14:49:11	2025-10-11 18:34:11	2025-10-11 14:49:11
5078	264	2025-08-20 06:54:10	2025-08-20 11:42:10	2025-08-20 06:54:10
5079	261	2025-04-12 17:50:39	2025-04-12 19:31:39	2025-04-12 17:50:39
5080	285	2025-10-26 15:04:16	2025-10-26 18:45:16	2025-10-26 15:04:16
5081	61	2025-07-20 15:04:47	2025-07-20 19:01:47	2025-07-20 15:04:47
5082	826	2025-05-24 20:49:35	2025-05-25 01:32:35	2025-05-24 20:49:35
5083	626	2025-02-01 16:49:21	2025-02-01 20:11:21	2025-02-01 16:49:21
5084	936	2024-12-22 18:41:28	2024-12-22 22:07:28	2024-12-22 18:41:28
5085	553	2025-01-07 16:57:47	2025-01-07 22:24:47	2025-01-07 16:57:47
5086	322	2025-02-18 18:30:44	2025-02-18 23:22:44	2025-02-18 18:30:44
5087	863	2024-12-15 19:13:54	2024-12-16 00:22:54	2024-12-15 19:13:54
5088	594	2025-05-13 17:30:18	2025-05-13 22:01:18	2025-05-13 17:30:18
5089	642	2024-11-12 17:16:55	2024-11-12 22:34:55	2024-11-12 17:16:55
5090	18	2025-03-23 15:01:12	2025-03-23 20:56:12	2025-03-23 15:01:12
5091	167	2025-01-25 16:41:07	2025-01-25 18:34:07	2025-01-25 16:41:07
5092	385	2025-03-04 16:46:39	2025-03-04 19:51:39	2025-03-04 16:46:39
5093	358	2025-07-15 16:16:46	2025-07-15 17:57:46	2025-07-15 16:16:46
5094	370	2025-10-14 15:53:32	2025-10-14 19:35:32	2025-10-14 15:53:32
5095	443	2025-02-19 11:49:29	2025-02-19 12:51:29	2025-02-19 11:49:29
5096	253	2024-12-08 15:22:08	2024-12-08 19:27:08	2024-12-08 15:22:08
5097	305	2025-01-25 16:20:44	2025-01-25 21:57:44	2025-01-25 16:20:44
5098	516	2025-03-11 16:34:27	2025-03-11 22:13:27	2025-03-11 16:34:27
5099	168	2025-11-02 15:18:08	2025-11-02 20:55:08	2025-11-02 15:18:08
5100	706	2025-06-29 15:28:51	2025-06-29 19:44:51	2025-06-29 15:28:51
5101	855	2025-04-01 15:21:36	2025-04-01 17:36:36	2025-04-01 15:21:36
5102	540	2024-12-14 15:20:48	2024-12-14 16:34:48	2024-12-14 15:20:48
5103	621	2025-01-26 15:47:03	2025-01-26 20:50:03	2025-01-26 15:47:03
5104	762	2024-11-24 17:37:02	2024-11-24 18:50:02	2024-11-24 17:37:02
5105	528	2025-02-23 16:08:08	2025-02-23 19:14:08	2025-02-23 16:08:08
5106	970	2025-05-18 18:08:14	2025-05-18 19:37:14	2025-05-18 18:08:14
5107	681	2024-12-22 17:45:34	2024-12-22 20:37:34	2024-12-22 17:45:34
5108	291	2025-03-29 20:55:15	2025-03-29 22:53:15	2025-03-29 20:55:15
5109	975	2025-09-13 15:00:27	2025-09-13 16:53:27	2025-09-13 15:00:27
5110	67	2025-08-19 17:46:18	2025-08-19 19:06:18	2025-08-19 17:46:18
5111	177	2025-02-18 19:12:14	2025-02-18 23:36:14	2025-02-18 19:12:14
5112	260	2025-11-02 13:57:06	2025-11-02 15:43:06	2025-11-02 13:57:06
5113	575	2025-07-29 14:27:49	2025-07-29 17:21:49	2025-07-29 14:27:49
5114	965	2025-03-02 12:41:19	2025-03-02 18:12:19	2025-03-02 12:41:19
5115	304	2024-12-14 16:58:09	2024-12-14 19:56:09	2024-12-14 16:58:09
5116	417	2024-11-16 16:33:01	2024-11-16 20:31:01	2024-11-16 16:33:01
5117	965	2025-07-25 05:23:54	2025-07-25 07:09:54	2025-07-25 05:23:54
5118	731	2024-11-19 16:34:01	2024-11-19 18:46:01	2024-11-19 16:34:01
5119	266	2025-10-28 18:40:03	2025-10-28 21:01:03	2025-10-28 18:40:03
5120	259	2025-08-31 14:58:49	2025-08-31 18:04:49	2025-08-31 14:58:49
5121	131	2025-01-02 19:57:04	2025-01-02 23:24:04	2025-01-02 19:57:04
5122	55	2025-03-01 15:34:08	2025-03-01 18:30:08	2025-03-01 15:34:08
5123	34	2024-11-17 12:44:55	2024-11-17 16:50:55	2024-11-17 12:44:55
5124	383	2025-09-13 18:11:03	2025-09-13 19:33:03	2025-09-13 18:11:03
5125	845	2025-04-01 15:32:16	2025-04-01 17:33:16	2025-04-01 15:32:16
5126	653	2025-01-27 16:57:04	2025-01-27 18:52:04	2025-01-27 16:57:04
5127	517	2025-04-22 14:19:14	2025-04-22 19:14:14	2025-04-22 14:19:14
5128	501	2025-10-14 15:02:44	2025-10-14 18:03:44	2025-10-14 15:02:44
5129	41	2025-10-17 15:17:52	2025-10-17 17:09:52	2025-10-17 15:17:52
5130	591	2025-09-14 14:24:51	2025-09-14 17:09:51	2025-09-14 14:24:51
5131	894	2025-05-06 18:19:09	2025-05-06 23:27:09	2025-05-06 18:19:09
5132	99	2025-02-15 16:19:54	2025-02-15 18:03:54	2025-02-15 16:19:54
5133	272	2025-07-27 16:37:05	2025-07-27 20:40:05	2025-07-27 16:37:05
5134	96	2025-03-30 14:02:26	2025-03-30 17:50:26	2025-03-30 14:02:26
5135	598	2025-07-22 14:19:12	2025-07-22 20:01:12	2025-07-22 14:19:12
5136	152	2025-03-14 15:39:34	2025-03-14 21:13:34	2025-03-14 15:39:34
5137	617	2025-02-08 19:31:48	2025-02-08 21:00:48	2025-02-08 19:31:48
5138	655	2025-01-19 15:58:03	2025-01-19 20:19:03	2025-01-19 15:58:03
5139	44	2025-07-15 17:57:48	2025-07-15 19:21:48	2025-07-15 17:57:48
5140	47	2025-08-16 15:52:05	2025-08-16 18:12:05	2025-08-16 15:52:05
5141	504	2025-04-06 17:28:43	2025-04-06 22:15:43	2025-04-06 17:28:43
5142	694	2025-01-28 17:50:04	2025-01-28 22:17:04	2025-01-28 17:50:04
5143	502	2025-06-21 15:13:34	2025-06-21 16:44:34	2025-06-21 15:13:34
5144	498	2024-12-09 16:41:18	2024-12-09 22:30:18	2024-12-09 16:41:18
5145	803	2025-09-23 14:22:51	2025-09-23 19:34:51	2025-09-23 14:22:51
5146	912	2025-06-07 15:19:19	2025-06-07 18:11:19	2025-06-07 15:19:19
5147	148	2025-05-11 18:43:08	2025-05-11 22:30:08	2025-05-11 18:43:08
5148	882	2025-03-16 16:51:16	2025-03-16 20:28:16	2025-03-16 16:51:16
5149	532	2025-03-25 15:13:53	2025-03-25 16:18:53	2025-03-25 15:13:53
5150	915	2024-11-23 16:02:18	2024-11-23 20:09:18	2024-11-23 16:02:18
5151	626	2025-07-28 14:56:28	2025-07-28 17:01:28	2025-07-28 14:56:28
5152	566	2025-03-05 17:40:49	2025-03-05 22:31:49	2025-03-05 17:40:49
5153	469	2025-02-25 18:38:12	2025-02-25 21:45:12	2025-02-25 18:38:12
5154	943	2024-12-22 15:40:44	2024-12-22 19:36:44	2024-12-22 15:40:44
5155	76	2024-12-29 16:36:13	2024-12-29 21:08:13	2024-12-29 16:36:13
5156	478	2025-05-04 12:56:08	2025-05-04 16:36:08	2025-05-04 12:56:08
5157	464	2025-05-06 14:46:39	2025-05-06 19:37:39	2025-05-06 14:46:39
5158	857	2024-12-29 15:21:31	2024-12-29 17:58:31	2024-12-29 15:21:31
5159	295	2025-05-13 16:37:43	2025-05-13 21:38:43	2025-05-13 16:37:43
5160	98	2025-09-06 18:24:59	2025-09-06 22:02:59	2025-09-06 18:24:59
5161	121	2025-04-10 10:05:26	2025-04-10 13:55:26	2025-04-10 10:05:26
5162	241	2024-12-14 17:56:01	2024-12-14 21:09:01	2024-12-14 17:56:01
5163	505	2025-05-27 15:38:35	2025-05-27 18:31:35	2025-05-27 15:38:35
5164	196	2025-10-18 14:46:13	2025-10-18 17:45:13	2025-10-18 14:46:13
5165	973	2025-07-08 17:53:46	2025-07-08 21:55:46	2025-07-08 17:53:46
5166	449	2025-05-24 16:01:33	2025-05-24 19:55:33	2025-05-24 16:01:33
5167	156	2025-07-03 15:14:21	2025-07-03 20:36:21	2025-07-03 15:14:21
5168	896	2025-01-05 10:12:28	2025-01-05 15:19:28	2025-01-05 10:12:28
5169	488	2025-04-01 15:48:04	2025-04-01 19:07:04	2025-04-01 15:48:04
5170	59	2024-11-12 17:00:59	2024-11-12 22:33:59	2024-11-12 17:00:59
5171	946	2025-01-12 17:46:21	2025-01-12 22:44:21	2025-01-12 17:46:21
5172	624	2024-11-24 16:27:34	2024-11-24 19:32:34	2024-11-24 16:27:34
5173	725	2025-06-01 16:10:40	2025-06-01 19:20:40	2025-06-01 16:10:40
5174	174	2025-02-25 17:24:03	2025-02-25 19:23:03	2025-02-25 17:24:03
5175	574	2025-05-11 18:25:29	2025-05-11 22:44:29	2025-05-11 18:25:29
5176	325	2025-02-09 16:38:31	2025-02-09 21:40:31	2025-02-09 16:38:31
5177	983	2025-09-03 16:57:33	2025-09-03 22:26:33	2025-09-03 16:57:33
5178	989	2025-05-04 17:03:17	2025-05-04 18:28:17	2025-05-04 17:03:17
5179	407	2025-03-08 18:53:46	2025-03-08 22:58:46	2025-03-08 18:53:46
5180	188	2025-02-22 19:30:49	2025-02-22 21:20:49	2025-02-22 19:30:49
5181	339	2025-03-01 15:57:15	2025-03-01 17:37:15	2025-03-01 15:57:15
5182	97	2025-10-06 11:13:51	2025-10-06 14:03:51	2025-10-06 11:13:51
5183	350	2025-05-10 14:02:41	2025-05-10 18:23:41	2025-05-10 14:02:41
5184	147	2025-03-25 08:03:16	2025-03-25 13:15:16	2025-03-25 08:03:16
5185	599	2025-07-22 14:17:48	2025-07-22 19:45:48	2025-07-22 14:17:48
5186	761	2024-11-26 17:32:53	2024-11-26 20:33:53	2024-11-26 17:32:53
5187	638	2025-02-25 16:03:59	2025-02-25 17:18:59	2025-02-25 16:03:59
5188	307	2025-05-25 17:04:37	2025-05-25 20:38:37	2025-05-25 17:04:37
5189	840	2025-05-24 16:02:08	2025-05-24 20:00:08	2025-05-24 16:02:08
5190	788	2025-10-11 16:22:06	2025-10-11 21:46:06	2025-10-11 16:22:06
5191	178	2025-10-07 12:59:09	2025-10-07 14:13:09	2025-10-07 12:59:09
5192	297	2025-01-18 17:17:11	2025-01-18 23:03:11	2025-01-18 17:17:11
5193	455	2025-05-07 15:04:14	2025-05-07 17:25:14	2025-05-07 15:04:14
5194	971	2024-12-01 15:36:29	2024-12-01 20:56:29	2024-12-01 15:36:29
5195	902	2025-08-23 16:13:50	2025-08-23 20:16:50	2025-08-23 16:13:50
5196	989	2025-06-05 07:02:55	2025-06-05 12:07:55	2025-06-05 07:02:55
5197	513	2025-01-21 16:09:42	2025-01-21 19:58:42	2025-01-21 16:09:42
5198	807	2025-08-12 16:57:57	2025-08-12 22:00:57	2025-08-12 16:57:57
5199	578	2025-03-24 16:48:05	2025-03-24 21:57:05	2025-03-24 16:48:05
5200	267	2025-06-24 18:43:10	2025-06-24 21:53:10	2025-06-24 18:43:10
5201	16	2025-11-04 16:14:13	2025-11-04 19:31:13	2025-11-04 16:14:13
5202	495	2025-06-22 17:00:07	2025-06-22 22:39:07	2025-06-22 17:00:07
5203	510	2024-11-10 16:39:37	2024-11-10 21:07:37	2024-11-10 16:39:37
5204	837	2025-03-04 05:13:54	2025-03-04 06:25:54	2025-03-04 05:13:54
5205	202	2025-04-10 16:29:35	2025-04-10 19:34:35	2025-04-10 16:29:35
5206	67	2024-12-10 17:36:49	2024-12-10 22:27:49	2024-12-10 17:36:49
5207	362	2025-08-19 15:35:05	2025-08-19 18:17:05	2025-08-19 15:35:05
5208	155	2025-04-26 22:27:31	2025-04-26 23:45:31	2025-04-26 22:27:31
5209	552	2025-03-04 16:15:53	2025-03-04 19:17:53	2025-03-04 16:15:53
5210	437	2025-08-28 16:17:49	2025-08-28 22:04:49	2025-08-28 16:17:49
5211	1000	2024-11-26 15:08:11	2024-11-26 17:56:11	2024-11-26 15:08:11
5212	149	2025-01-19 06:24:37	2025-01-19 09:10:37	2025-01-19 06:24:37
5213	389	2025-06-29 17:54:08	2025-06-29 20:43:08	2025-06-29 17:54:08
5214	385	2025-05-06 14:41:56	2025-05-06 19:38:56	2025-05-06 14:41:56
5215	465	2024-12-01 17:45:51	2024-12-01 22:18:51	2024-12-01 17:45:51
5216	968	2025-08-17 18:38:54	2025-08-17 22:08:54	2025-08-17 18:38:54
5217	463	2025-08-31 17:11:52	2025-08-31 19:48:52	2025-08-31 17:11:52
5218	746	2025-05-20 17:23:55	2025-05-20 22:00:55	2025-05-20 17:23:55
5219	840	2025-05-24 01:35:30	2025-05-24 03:27:30	2025-05-24 01:35:30
5220	758	2025-08-24 16:10:22	2025-08-24 17:25:22	2025-08-24 16:10:22
5221	627	2024-12-06 20:37:36	2024-12-06 23:59:36	2024-12-06 20:37:36
5222	719	2025-09-16 15:26:00	2025-09-16 20:40:00	2025-09-16 15:26:00
5223	575	2025-01-05 17:31:40	2025-01-05 21:02:40	2025-01-05 17:31:40
5224	997	2025-01-31 12:53:18	2025-01-31 18:17:18	2025-01-31 12:53:18
5225	171	2025-02-01 13:36:34	2025-02-01 16:51:34	2025-02-01 13:36:34
5226	395	2025-10-11 14:47:27	2025-10-11 20:27:27	2025-10-11 14:47:27
5227	546	2025-02-22 19:36:07	2025-02-23 01:29:07	2025-02-22 19:36:07
5228	432	2025-07-01 14:13:28	2025-07-01 19:18:28	2025-07-01 14:13:28
5229	732	2025-03-09 15:28:36	2025-03-09 20:04:36	2025-03-09 15:28:36
5230	322	2025-04-01 15:51:38	2025-04-01 20:51:38	2025-04-01 15:51:38
5231	414	2025-09-22 18:02:25	2025-09-22 21:57:25	2025-09-22 18:02:25
5232	945	2025-03-22 15:42:56	2025-03-22 19:54:56	2025-03-22 15:42:56
5233	629	2025-01-14 16:07:28	2025-01-14 19:39:28	2025-01-14 16:07:28
5234	622	2025-02-16 16:24:11	2025-02-16 20:23:11	2025-02-16 16:24:11
5235	131	2025-09-30 17:38:11	2025-09-30 21:27:11	2025-09-30 17:38:11
5236	522	2024-12-14 05:04:31	2024-12-14 10:10:31	2024-12-14 05:04:31
5237	440	2024-11-30 08:57:41	2024-11-30 14:40:41	2024-11-30 08:57:41
5238	43	2025-02-15 16:37:43	2025-02-15 21:40:43	2025-02-15 16:37:43
5239	490	2024-11-17 15:19:42	2024-11-17 19:17:42	2024-11-17 15:19:42
5240	875	2024-11-26 16:29:04	2024-11-26 22:05:04	2024-11-26 16:29:04
5241	646	2025-03-23 17:55:19	2025-03-23 19:08:19	2025-03-23 17:55:19
5242	576	2025-07-20 16:13:24	2025-07-20 18:03:24	2025-07-20 16:13:24
5243	6	2025-05-04 16:37:14	2025-05-04 21:49:14	2025-05-04 16:37:14
5244	949	2025-02-23 17:23:14	2025-02-23 20:28:14	2025-02-23 17:23:14
5245	357	2025-06-10 05:50:37	2025-06-10 08:15:37	2025-06-10 05:50:37
5246	270	2025-09-20 16:11:12	2025-09-20 17:15:12	2025-09-20 16:11:12
5247	538	2025-10-07 14:37:05	2025-10-07 18:00:05	2025-10-07 14:37:05
5248	819	2025-10-14 09:31:17	2025-10-14 11:42:17	2025-10-14 09:31:17
5249	623	2025-10-19 18:03:42	2025-10-19 21:26:42	2025-10-19 18:03:42
5250	750	2025-10-04 14:41:41	2025-10-04 16:17:41	2025-10-04 14:41:41
5251	782	2024-11-16 19:02:39	2024-11-16 20:09:39	2024-11-16 19:02:39
5252	90	2025-07-02 15:24:30	2025-07-02 18:09:30	2025-07-02 15:24:30
5253	349	2025-08-23 16:23:46	2025-08-23 20:15:46	2025-08-23 16:23:46
5254	241	2025-07-05 08:19:33	2025-07-05 11:20:33	2025-07-05 08:19:33
5255	657	2025-05-31 14:06:01	2025-05-31 19:51:01	2025-05-31 14:06:01
5256	755	2025-01-04 07:38:52	2025-01-04 10:55:52	2025-01-04 07:38:52
5257	375	2025-06-29 15:25:00	2025-06-29 17:06:00	2025-06-29 15:25:00
5258	315	2025-01-04 19:31:54	2025-01-04 22:58:54	2025-01-04 19:31:54
5259	664	2025-10-13 15:32:29	2025-10-13 21:14:29	2025-10-13 15:32:29
5260	366	2025-09-23 15:21:52	2025-09-23 20:27:52	2025-09-23 15:21:52
5261	610	2025-10-12 07:11:02	2025-10-12 08:11:02	2025-10-12 07:11:02
5262	158	2025-10-02 14:25:05	2025-10-02 15:51:05	2025-10-02 14:25:05
5263	666	2025-01-21 01:00:02	2025-01-21 04:35:02	2025-01-21 01:00:02
5264	242	2025-02-11 17:46:33	2025-02-11 21:55:33	2025-02-11 17:46:33
5265	938	2025-01-18 19:14:36	2025-01-18 21:15:36	2025-01-18 19:14:36
5266	146	2025-03-01 17:17:18	2025-03-01 19:04:18	2025-03-01 17:17:18
5267	946	2025-08-12 12:27:08	2025-08-12 14:52:08	2025-08-12 12:27:08
5268	815	2025-10-19 01:46:17	2025-10-19 05:12:17	2025-10-19 01:46:17
5269	605	2025-04-05 16:09:41	2025-04-05 18:42:41	2025-04-05 16:09:41
5270	22	2025-10-18 17:18:46	2025-10-18 21:38:46	2025-10-18 17:18:46
5271	787	2025-07-27 14:57:46	2025-07-27 17:16:46	2025-07-27 14:57:46
5272	875	2025-09-28 10:19:36	2025-09-28 16:18:36	2025-09-28 10:19:36
5273	491	2024-12-28 06:20:08	2024-12-28 09:18:08	2024-12-28 06:20:08
5274	699	2024-12-17 17:01:18	2024-12-17 18:47:18	2024-12-17 17:01:18
5275	66	2024-12-10 16:15:55	2024-12-10 18:33:55	2024-12-10 16:15:55
5276	685	2025-01-05 07:17:57	2025-01-05 11:36:57	2025-01-05 07:17:57
5277	438	2025-02-04 16:51:53	2025-02-04 21:50:53	2025-02-04 16:51:53
5278	881	2024-11-26 18:00:28	2024-11-26 19:38:28	2024-11-26 18:00:28
5279	573	2024-12-22 15:57:20	2024-12-22 19:17:20	2024-12-22 15:57:20
5280	831	2025-08-02 16:57:15	2025-08-02 18:49:15	2025-08-02 16:57:15
5281	341	2025-10-11 17:08:15	2025-10-11 19:45:15	2025-10-11 17:08:15
5282	568	2025-10-07 14:33:26	2025-10-07 18:02:26	2025-10-07 14:33:26
5283	900	2025-01-21 08:17:57	2025-01-21 13:13:57	2025-01-21 08:17:57
5284	826	2025-03-29 09:46:29	2025-03-29 12:50:29	2025-03-29 09:46:29
5285	802	2025-03-18 16:19:18	2025-03-18 21:00:18	2025-03-18 16:19:18
5286	603	2025-03-22 11:54:29	2025-03-22 17:04:29	2025-03-22 11:54:29
5287	55	2025-09-23 15:01:18	2025-09-23 20:15:18	2025-09-23 15:01:18
5288	55	2025-02-01 15:04:52	2025-02-01 19:31:52	2025-02-01 15:04:52
5289	523	2025-08-31 16:30:57	2025-08-31 18:44:57	2025-08-31 16:30:57
5290	296	2025-06-28 18:18:59	2025-06-28 19:19:59	2025-06-28 18:18:59
5291	795	2025-04-12 16:56:53	2025-04-12 19:51:53	2025-04-12 16:56:53
5292	248	2025-06-01 15:47:18	2025-06-01 21:01:18	2025-06-01 15:47:18
5293	366	2025-06-28 15:14:06	2025-06-28 18:04:06	2025-06-28 15:14:06
5294	285	2025-03-18 16:02:24	2025-03-18 21:45:24	2025-03-18 16:02:24
5295	528	2025-08-02 04:06:09	2025-08-02 05:43:09	2025-08-02 04:06:09
5296	830	2025-09-06 14:34:08	2025-09-06 19:00:08	2025-09-06 14:34:08
5297	249	2025-09-02 08:36:59	2025-09-02 13:45:59	2025-09-02 08:36:59
5298	124	2025-05-24 09:02:56	2025-05-24 12:10:56	2025-05-24 09:02:56
5299	759	2025-06-03 14:41:10	2025-06-03 19:48:10	2025-06-03 14:41:10
5300	461	2024-12-10 17:49:36	2024-12-10 23:03:36	2024-12-10 17:49:36
5301	355	2025-03-11 17:06:11	2025-03-11 19:15:11	2025-03-11 17:06:11
5302	695	2025-04-08 18:32:48	2025-04-08 19:53:48	2025-04-08 18:32:48
5303	782	2025-11-01 16:48:23	2025-11-01 18:04:23	2025-11-01 16:48:23
5304	977	2025-08-04 15:15:53	2025-08-04 17:49:53	2025-08-04 15:15:53
5305	775	2025-04-22 16:48:42	2025-04-22 21:49:42	2025-04-22 16:48:42
5306	780	2025-04-15 15:55:19	2025-04-15 21:07:19	2025-04-15 15:55:19
5307	493	2025-03-16 16:54:44	2025-03-16 18:07:44	2025-03-16 16:54:44
5308	244	2025-05-06 16:07:08	2025-05-06 18:11:08	2025-05-06 16:07:08
5309	510	2025-08-31 13:01:11	2025-08-31 15:39:11	2025-08-31 13:01:11
5310	464	2025-03-30 14:01:09	2025-03-30 18:49:09	2025-03-30 14:01:09
5311	374	2025-09-28 15:08:08	2025-09-28 20:36:08	2025-09-28 15:08:08
5312	197	2025-05-17 16:33:35	2025-05-17 17:58:35	2025-05-17 16:33:35
5313	470	2024-12-17 03:40:43	2024-12-17 06:39:43	2024-12-17 03:40:43
5314	775	2025-01-07 17:27:01	2025-01-07 23:01:01	2025-01-07 17:27:01
5315	505	2025-09-16 15:03:35	2025-09-16 19:44:35	2025-09-16 15:03:35
5316	200	2025-09-20 15:52:42	2025-09-20 20:33:42	2025-09-20 15:52:42
5317	824	2025-04-01 07:38:04	2025-04-01 12:16:04	2025-04-01 07:38:04
5318	716	2025-11-01 15:10:16	2025-11-01 18:36:16	2025-11-01 15:10:16
5319	599	2025-04-26 15:05:21	2025-04-26 16:21:21	2025-04-26 15:05:21
5320	954	2025-06-14 15:19:10	2025-06-14 16:48:10	2025-06-14 15:19:10
5321	7	2025-04-27 14:59:31	2025-04-27 19:16:31	2025-04-27 14:59:31
5322	663	2025-08-17 15:26:00	2025-08-17 19:50:00	2025-08-17 15:26:00
5323	605	2025-01-04 18:55:53	2025-01-04 21:23:53	2025-01-04 18:55:53
5324	854	2025-05-24 14:07:22	2025-05-24 19:00:22	2025-05-24 14:07:22
5325	385	2025-10-18 14:07:16	2025-10-18 19:37:16	2025-10-18 14:07:16
5326	599	2025-06-08 18:31:16	2025-06-08 22:59:16	2025-06-08 18:31:16
5327	177	2025-07-21 15:26:00	2025-07-21 17:28:00	2025-07-21 15:26:00
5328	913	2024-11-16 16:03:03	2024-11-16 21:40:03	2024-11-16 16:03:03
5329	869	2025-03-02 15:03:18	2025-03-02 18:18:18	2025-03-02 15:03:18
5330	653	2025-01-28 16:23:48	2025-01-28 18:54:48	2025-01-28 16:23:48
5331	689	2025-04-29 15:35:21	2025-04-29 21:09:21	2025-04-29 15:35:21
5332	912	2024-11-24 15:04:31	2024-11-24 18:37:31	2024-11-24 15:04:31
5333	708	2025-01-25 11:25:47	2025-01-25 15:02:47	2025-01-25 11:25:47
5334	823	2025-03-04 16:05:22	2025-03-04 17:10:22	2025-03-04 16:05:22
5335	626	2025-01-18 09:37:10	2025-01-18 12:30:10	2025-01-18 09:37:10
5336	262	2025-05-20 15:28:34	2025-05-20 20:07:34	2025-05-20 15:28:34
5337	426	2024-12-21 16:18:23	2024-12-21 20:26:23	2024-12-21 16:18:23
5338	558	2024-11-26 19:17:59	2024-11-26 23:15:59	2024-11-26 19:17:59
5339	770	2025-05-12 16:10:32	2025-05-12 17:55:32	2025-05-12 16:10:32
5340	645	2025-02-01 16:17:00	2025-02-01 21:41:00	2025-02-01 16:17:00
5341	635	2025-10-18 10:20:27	2025-10-18 13:03:27	2025-10-18 10:20:27
5342	422	2024-12-14 16:15:18	2024-12-14 18:29:18	2024-12-14 16:15:18
5343	412	2025-01-26 19:36:02	2025-01-26 21:30:02	2025-01-26 19:36:02
5344	657	2025-02-20 16:34:41	2025-02-20 18:25:41	2025-02-20 16:34:41
5345	672	2025-06-01 14:36:37	2025-06-01 17:38:37	2025-06-01 14:36:37
5346	185	2024-12-28 17:39:40	2024-12-28 20:26:40	2024-12-28 17:39:40
5347	781	2025-03-22 18:51:47	2025-03-23 00:30:47	2025-03-22 18:51:47
5348	244	2025-06-29 15:37:38	2025-06-29 18:17:38	2025-06-29 15:37:38
5349	693	2025-02-25 13:15:32	2025-02-25 17:25:32	2025-02-25 13:15:32
5350	364	2025-07-25 14:43:27	2025-07-25 16:34:27	2025-07-25 14:43:27
5351	36	2025-10-28 16:24:44	2025-10-28 20:06:44	2025-10-28 16:24:44
5352	207	2025-04-11 06:20:58	2025-04-11 09:44:58	2025-04-11 06:20:58
5353	96	2025-08-02 14:29:46	2025-08-02 18:43:46	2025-08-02 14:29:46
5354	730	2025-09-06 15:47:11	2025-09-06 19:36:11	2025-09-06 15:47:11
5355	499	2025-02-16 17:59:36	2025-02-16 19:46:36	2025-02-16 17:59:36
5356	463	2024-12-14 17:41:11	2024-12-14 19:30:11	2024-12-14 17:41:11
5357	859	2025-07-13 07:33:47	2025-07-13 10:59:47	2025-07-13 07:33:47
5358	287	2024-11-30 19:22:13	2024-11-30 23:45:13	2024-11-30 19:22:13
5359	980	2025-07-12 14:41:53	2025-07-12 19:14:53	2025-07-12 14:41:53
5360	381	2025-07-22 16:13:08	2025-07-22 21:15:08	2025-07-22 16:13:08
5361	719	2025-08-19 18:18:43	2025-08-19 21:39:43	2025-08-19 18:18:43
5362	276	2025-11-02 16:30:25	2025-11-02 19:27:25	2025-11-02 16:30:25
5363	383	2025-07-13 10:09:17	2025-07-13 13:22:17	2025-07-13 10:09:17
5364	325	2025-09-21 14:36:15	2025-09-21 18:21:15	2025-09-21 14:36:15
5365	852	2025-07-20 15:26:05	2025-07-20 18:18:05	2025-07-20 15:26:05
5366	166	2025-05-17 16:00:14	2025-05-17 20:36:14	2025-05-17 16:00:14
5367	313	2025-02-15 16:45:26	2025-02-15 20:48:26	2025-02-15 16:45:26
5368	610	2025-08-05 16:12:58	2025-08-05 21:54:58	2025-08-05 16:12:58
5369	935	2025-05-06 16:49:36	2025-05-06 22:45:36	2025-05-06 16:49:36
5370	959	2025-02-23 15:36:56	2025-02-23 19:17:56	2025-02-23 15:36:56
5371	629	2025-05-28 12:10:54	2025-05-28 15:26:54	2025-05-28 12:10:54
5372	793	2025-07-19 16:49:59	2025-07-19 22:33:59	2025-07-19 16:49:59
5373	921	2025-04-01 15:55:59	2025-04-01 19:30:59	2025-04-01 15:55:59
5374	802	2025-10-07 17:31:52	2025-10-07 19:28:52	2025-10-07 17:31:52
5375	681	2025-01-07 15:43:58	2025-01-07 20:08:58	2025-01-07 15:43:58
5376	812	2024-12-29 15:22:08	2024-12-29 18:43:08	2024-12-29 15:22:08
5377	951	2025-08-05 14:43:16	2025-08-05 15:43:16	2025-08-05 14:43:16
5378	792	2025-01-18 16:21:19	2025-01-18 20:03:19	2025-01-18 16:21:19
5379	688	2024-11-20 06:47:07	2024-11-20 09:13:07	2024-11-20 06:47:07
5380	985	2025-06-10 06:23:38	2025-06-10 08:32:38	2025-06-10 06:23:38
5381	87	2025-05-06 01:32:17	2025-05-06 03:39:17	2025-05-06 01:32:17
5382	721	2024-12-14 08:28:23	2024-12-14 12:14:23	2024-12-14 08:28:23
5383	520	2025-06-22 14:57:39	2025-06-22 17:09:39	2025-06-22 14:57:39
5384	457	2025-06-10 17:45:54	2025-06-10 19:16:54	2025-06-10 17:45:54
5385	361	2025-04-20 03:14:22	2025-04-20 09:11:22	2025-04-20 03:14:22
5386	128	2024-12-08 18:45:36	2024-12-08 20:15:36	2024-12-08 18:45:36
5387	114	2025-01-11 21:12:53	2025-01-12 01:50:53	2025-01-11 21:12:53
5388	643	2024-12-21 15:58:05	2024-12-21 19:34:05	2024-12-21 15:58:05
5389	484	2025-02-04 18:52:24	2025-02-04 19:54:24	2025-02-04 18:52:24
5390	758	2024-11-25 17:54:01	2024-11-25 19:51:01	2024-11-25 17:54:01
5391	698	2025-08-30 15:04:48	2025-08-30 19:37:48	2025-08-30 15:04:48
5392	668	2025-09-30 16:05:09	2025-09-30 20:30:09	2025-09-30 16:05:09
5393	875	2025-02-02 18:33:18	2025-02-02 22:32:18	2025-02-02 18:33:18
5394	34	2025-09-23 15:05:37	2025-09-23 17:11:37	2025-09-23 15:05:37
5395	217	2025-06-15 14:48:22	2025-06-15 20:14:22	2025-06-15 14:48:22
5396	962	2024-12-29 17:09:07	2024-12-29 20:17:07	2024-12-29 17:09:07
5397	985	2025-09-23 18:52:34	2025-09-23 21:12:34	2025-09-23 18:52:34
5398	949	2025-01-07 05:21:56	2025-01-07 09:36:56	2025-01-07 05:21:56
5399	869	2025-10-04 08:27:45	2025-10-04 10:58:45	2025-10-04 08:27:45
5400	549	2025-07-15 15:55:31	2025-07-15 16:57:31	2025-07-15 15:55:31
5401	485	2025-05-03 15:42:26	2025-05-03 21:00:26	2025-05-03 15:42:26
5402	463	2025-05-04 15:21:36	2025-05-04 19:28:36	2025-05-04 15:21:36
5403	939	2025-07-08 14:47:17	2025-07-08 17:57:17	2025-07-08 14:47:17
5404	197	2025-03-30 04:31:41	2025-03-30 09:54:41	2025-03-30 04:31:41
5405	301	2025-10-12 14:22:48	2025-10-12 19:13:48	2025-10-12 14:22:48
5406	890	2024-12-31 10:25:15	2024-12-31 13:36:15	2024-12-31 10:25:15
5407	649	2025-01-21 17:59:51	2025-01-21 22:22:51	2025-01-21 17:59:51
5408	485	2024-11-30 19:49:11	2024-11-30 23:41:11	2024-11-30 19:49:11
5409	713	2025-03-18 17:26:52	2025-03-18 23:16:52	2025-03-18 17:26:52
5410	849	2025-09-30 06:35:19	2025-09-30 10:48:19	2025-09-30 06:35:19
5411	276	2025-07-22 17:51:57	2025-07-22 22:19:57	2025-07-22 17:51:57
5412	613	2024-12-22 01:11:54	2024-12-22 06:18:54	2024-12-22 01:11:54
5413	149	2025-04-10 16:01:04	2025-04-10 17:50:04	2025-04-10 16:01:04
5414	283	2025-04-15 06:55:14	2025-04-15 11:25:14	2025-04-15 06:55:14
5415	803	2025-02-04 15:14:08	2025-02-04 19:14:08	2025-02-04 15:14:08
5416	990	2025-06-03 14:15:01	2025-06-03 17:48:01	2025-06-03 14:15:01
5417	117	2025-03-23 17:07:22	2025-03-23 19:40:22	2025-03-23 17:07:22
5418	804	2024-11-17 19:15:26	2024-11-18 00:46:26	2024-11-17 19:15:26
5419	796	2025-01-23 17:08:12	2025-01-23 22:34:12	2025-01-23 17:08:12
5420	246	2025-10-04 06:37:40	2025-10-04 10:45:40	2025-10-04 06:37:40
5421	46	2025-07-15 18:54:16	2025-07-15 23:00:16	2025-07-15 18:54:16
5422	419	2025-02-01 16:14:23	2025-02-01 17:46:23	2025-02-01 16:14:23
5423	603	2025-07-15 16:25:37	2025-07-15 20:11:37	2025-07-15 16:25:37
5424	884	2024-11-16 16:55:08	2024-11-16 18:16:08	2024-11-16 16:55:08
5425	895	2025-05-11 18:23:14	2025-05-11 22:19:14	2025-05-11 18:23:14
5426	939	2025-04-05 17:04:50	2025-04-05 22:05:50	2025-04-05 17:04:50
5427	581	2025-04-13 17:12:28	2025-04-13 20:25:28	2025-04-13 17:12:28
5428	213	2025-03-16 17:09:55	2025-03-16 20:33:55	2025-03-16 17:09:55
5429	145	2025-09-16 13:07:05	2025-09-16 14:56:05	2025-09-16 13:07:05
5430	534	2025-09-30 16:03:10	2025-09-30 18:42:10	2025-09-30 16:03:10
5431	44	2025-03-30 18:40:51	2025-03-30 20:53:51	2025-03-30 18:40:51
5432	970	2025-01-06 19:36:36	2025-01-06 20:49:36	2025-01-06 19:36:36
5433	510	2025-07-01 14:41:28	2025-07-01 17:09:28	2025-07-01 14:41:28
5434	403	2025-04-15 15:50:26	2025-04-15 19:01:26	2025-04-15 15:50:26
5435	991	2025-10-25 15:04:37	2025-10-25 19:32:37	2025-10-25 15:04:37
5436	587	2025-07-01 15:39:11	2025-07-01 18:43:11	2025-07-01 15:39:11
5437	68	2025-06-08 16:30:33	2025-06-08 18:51:33	2025-06-08 16:30:33
5438	636	2024-12-21 05:32:39	2024-12-21 10:22:39	2024-12-21 05:32:39
5439	166	2025-10-25 18:54:47	2025-10-25 23:57:47	2025-10-25 18:54:47
5440	273	2025-05-31 15:34:28	2025-05-31 16:39:28	2025-05-31 15:34:28
5441	231	2025-02-02 15:18:02	2025-02-02 20:10:02	2025-02-02 15:18:02
5442	159	2024-12-08 17:11:04	2024-12-08 19:35:04	2024-12-08 17:11:04
5443	72	2025-08-03 17:00:09	2025-08-03 22:03:09	2025-08-03 17:00:09
5444	842	2025-10-04 20:35:41	2025-10-04 23:25:41	2025-10-04 20:35:41
5445	789	2025-10-14 15:13:26	2025-10-14 21:12:26	2025-10-14 15:13:26
5446	708	2025-05-24 17:03:28	2025-05-24 20:03:28	2025-05-24 17:03:28
5447	101	2025-04-29 15:37:03	2025-04-29 21:03:03	2025-04-29 15:37:03
5448	261	2025-02-03 16:31:20	2025-02-03 21:23:20	2025-02-03 16:31:20
5449	908	2025-05-13 16:09:32	2025-05-13 18:11:32	2025-05-13 16:09:32
5450	763	2025-11-02 15:56:03	2025-11-02 18:21:03	2025-11-02 15:56:03
5451	143	2025-03-22 16:42:35	2025-03-22 21:43:35	2025-03-22 16:42:35
5452	626	2025-01-11 10:02:10	2025-01-11 11:37:10	2025-01-11 10:02:10
5453	604	2025-09-27 17:55:00	2025-09-27 23:15:00	2025-09-27 17:55:00
5454	446	2025-10-18 16:35:55	2025-10-18 21:49:55	2025-10-18 16:35:55
5455	265	2025-01-07 16:32:37	2025-01-07 19:50:37	2025-01-07 16:32:37
5456	154	2025-06-10 14:38:12	2025-06-10 16:57:12	2025-06-10 14:38:12
5457	348	2025-01-18 17:58:39	2025-01-18 19:40:39	2025-01-18 17:58:39
5458	315	2025-01-02 16:10:51	2025-01-02 19:52:51	2025-01-02 16:10:51
5459	399	2025-06-21 16:44:04	2025-06-21 20:05:04	2025-06-21 16:44:04
5460	293	2025-07-22 15:38:08	2025-07-22 18:38:08	2025-07-22 15:38:08
5461	2	2025-02-18 16:24:50	2025-02-18 20:57:50	2025-02-18 16:24:50
5462	351	2025-06-17 15:33:16	2025-06-17 17:57:16	2025-06-17 15:33:16
5463	309	2025-03-11 15:26:55	2025-03-11 18:05:55	2025-03-11 15:26:55
5464	68	2025-03-15 12:20:13	2025-03-15 16:33:13	2025-03-15 12:20:13
5465	212	2025-10-14 14:02:21	2025-10-14 15:21:21	2025-10-14 14:02:21
5466	422	2025-03-04 07:27:43	2025-03-04 12:11:43	2025-03-04 07:27:43
5467	245	2024-11-12 14:54:01	2024-11-12 19:53:01	2024-11-12 14:54:01
5468	581	2025-01-26 17:19:30	2025-01-26 18:50:30	2025-01-26 17:19:30
5469	868	2024-12-08 15:41:18	2024-12-08 18:38:18	2024-12-08 15:41:18
5470	49	2025-08-05 17:44:29	2025-08-05 22:00:29	2025-08-05 17:44:29
5471	999	2025-09-07 07:36:57	2025-09-07 10:18:57	2025-09-07 07:36:57
5472	778	2024-12-31 16:07:52	2024-12-31 18:03:52	2024-12-31 16:07:52
5473	755	2025-01-04 15:34:15	2025-01-04 18:12:15	2025-01-04 15:34:15
5474	77	2025-05-06 17:01:38	2025-05-06 22:37:38	2025-05-06 17:01:38
5475	171	2025-01-28 17:42:26	2025-01-28 20:29:26	2025-01-28 17:42:26
5476	17	2025-06-05 18:29:18	2025-06-05 23:41:18	2025-06-05 18:29:18
5477	165	2025-04-01 13:41:05	2025-04-01 16:48:05	2025-04-01 13:41:05
5478	186	2025-05-04 14:46:40	2025-05-04 18:04:40	2025-05-04 14:46:40
5479	578	2025-06-24 16:32:51	2025-06-24 21:58:51	2025-06-24 16:32:51
5480	41	2025-05-24 05:42:43	2025-05-24 09:10:43	2025-05-24 05:42:43
5481	862	2025-05-17 14:30:31	2025-05-17 20:04:31	2025-05-17 14:30:31
5482	66	2024-12-28 14:48:49	2024-12-28 19:25:49	2024-12-28 14:48:49
5483	743	2025-04-05 17:54:29	2025-04-05 21:52:29	2025-04-05 17:54:29
5484	907	2025-09-02 16:27:51	2025-09-02 22:24:51	2025-09-02 16:27:51
5485	155	2024-12-08 19:39:03	2024-12-08 22:47:03	2024-12-08 19:39:03
5486	550	2025-02-04 16:03:00	2025-02-04 19:51:00	2025-02-04 16:03:00
5487	723	2025-02-22 16:07:03	2025-02-22 20:50:03	2025-02-22 16:07:03
5488	732	2025-04-05 08:06:52	2025-04-05 11:54:52	2025-04-05 08:06:52
5489	367	2025-01-19 09:49:48	2025-01-19 13:17:48	2025-01-19 09:49:48
5490	316	2025-04-13 17:35:10	2025-04-13 19:39:10	2025-04-13 17:35:10
5491	681	2025-04-20 05:59:48	2025-04-20 10:08:48	2025-04-20 05:59:48
5492	91	2025-04-26 15:38:39	2025-04-26 17:37:39	2025-04-26 15:38:39
5493	198	2025-01-07 19:42:17	2025-01-07 23:34:17	2025-01-07 19:42:17
5494	273	2025-11-01 17:26:40	2025-11-01 20:59:40	2025-11-01 17:26:40
5495	325	2025-10-26 17:03:55	2025-10-26 18:19:55	2025-10-26 17:03:55
5496	483	2025-03-18 15:17:02	2025-03-18 19:46:02	2025-03-18 15:17:02
5497	168	2025-01-05 11:50:29	2025-01-05 13:20:29	2025-01-05 11:50:29
5498	23	2025-04-29 18:57:52	2025-04-29 20:36:52	2025-04-29 18:57:52
5499	330	2025-01-14 16:43:32	2025-01-14 17:57:32	2025-01-14 16:43:32
5500	741	2025-04-20 18:28:01	2025-04-20 21:38:01	2025-04-20 18:28:01
5501	284	2025-03-22 16:47:21	2025-03-22 19:20:21	2025-03-22 16:47:21
5502	779	2025-07-26 18:01:45	2025-07-26 20:06:45	2025-07-26 18:01:45
5503	556	2025-09-20 18:29:52	2025-09-20 19:54:52	2025-09-20 18:29:52
5504	16	2025-05-13 17:09:32	2025-05-13 18:38:32	2025-05-13 17:09:32
5505	666	2025-10-12 15:31:27	2025-10-12 19:15:27	2025-10-12 15:31:27
5506	822	2025-09-13 18:27:21	2025-09-13 22:13:21	2025-09-13 18:27:21
5507	763	2025-09-06 12:10:41	2025-09-06 13:58:41	2025-09-06 12:10:41
5508	695	2025-07-15 18:42:27	2025-07-16 00:16:27	2025-07-15 18:42:27
5509	365	2024-12-14 16:18:35	2024-12-14 18:42:35	2024-12-14 16:18:35
5510	366	2025-10-16 14:22:05	2025-10-16 19:23:05	2025-10-16 14:22:05
5511	133	2025-08-17 14:13:29	2025-08-17 15:59:29	2025-08-17 14:13:29
5512	135	2024-12-01 15:54:18	2024-12-01 20:02:18	2024-12-01 15:54:18
5513	806	2025-06-22 15:21:14	2025-06-22 17:49:14	2025-06-22 15:21:14
5514	416	2025-08-03 15:24:16	2025-08-03 19:20:16	2025-08-03 15:24:16
5515	694	2025-01-28 16:23:25	2025-01-28 21:53:25	2025-01-28 16:23:25
5516	582	2025-10-11 14:09:28	2025-10-11 16:38:28	2025-10-11 14:09:28
5517	965	2025-09-27 15:44:15	2025-09-27 20:29:15	2025-09-27 15:44:15
5518	774	2025-03-22 18:20:57	2025-03-22 23:19:57	2025-03-22 18:20:57
5519	48	2025-06-28 14:19:58	2025-06-28 16:44:58	2025-06-28 14:19:58
5520	235	2025-03-01 15:08:43	2025-03-01 18:04:43	2025-03-01 15:08:43
5521	440	2025-10-21 17:14:15	2025-10-21 18:21:15	2025-10-21 17:14:15
5522	498	2025-03-30 13:39:19	2025-03-30 15:17:19	2025-03-30 13:39:19
5523	977	2024-11-19 18:25:16	2024-11-19 22:05:16	2024-11-19 18:25:16
5524	629	2025-03-25 03:23:28	2025-03-25 06:31:28	2025-03-25 03:23:28
5525	65	2024-12-01 18:34:46	2024-12-01 23:48:46	2024-12-01 18:34:46
5526	733	2025-05-06 04:04:52	2025-05-06 09:22:52	2025-05-06 04:04:52
5527	689	2025-07-22 15:41:43	2025-07-22 21:26:43	2025-07-22 15:41:43
5528	685	2025-01-26 16:00:00	2025-01-26 17:05:00	2025-01-26 16:00:00
5529	762	2025-04-22 15:22:34	2025-04-22 17:48:34	2025-04-22 15:22:34
5530	931	2024-11-19 16:13:39	2024-11-19 18:33:39	2024-11-19 16:13:39
5531	76	2024-12-07 16:50:36	2024-12-07 20:12:36	2024-12-07 16:50:36
5532	481	2025-03-06 19:22:30	2025-03-06 23:35:30	2025-03-06 19:22:30
5533	67	2025-09-23 02:46:18	2025-09-23 07:11:18	2025-09-23 02:46:18
5534	860	2025-06-10 16:30:52	2025-06-10 18:40:52	2025-06-10 16:30:52
5535	690	2025-07-26 14:03:57	2025-07-26 16:39:57	2025-07-26 14:03:57
5536	744	2025-08-24 09:55:52	2025-08-24 11:07:52	2025-08-24 09:55:52
5537	444	2024-12-08 16:29:25	2024-12-08 22:23:25	2024-12-08 16:29:25
5538	261	2025-04-01 15:43:23	2025-04-01 20:45:23	2025-04-01 15:43:23
5539	384	2025-01-18 16:41:08	2025-01-18 20:24:08	2025-01-18 16:41:08
5540	329	2025-07-05 12:38:36	2025-07-05 15:02:36	2025-07-05 12:38:36
5541	118	2024-12-24 19:53:48	2024-12-25 00:44:48	2024-12-24 19:53:48
5542	908	2025-01-04 15:59:19	2025-01-04 18:44:19	2025-01-04 15:59:19
5543	175	2025-07-15 15:42:45	2025-07-15 20:06:45	2025-07-15 15:42:45
5544	323	2024-12-28 17:41:12	2024-12-28 19:12:12	2024-12-28 17:41:12
5545	113	2025-01-23 17:51:13	2025-01-23 23:11:13	2025-01-23 17:51:13
5546	553	2025-05-06 18:08:03	2025-05-06 19:17:03	2025-05-06 18:08:03
5547	175	2025-05-06 17:49:52	2025-05-06 21:12:52	2025-05-06 17:49:52
5548	570	2025-03-25 15:47:43	2025-03-25 20:11:43	2025-03-25 15:47:43
5549	30	2024-11-19 09:02:42	2024-11-19 10:06:42	2024-11-19 09:02:42
5550	866	2025-03-01 07:55:31	2025-03-01 13:31:31	2025-03-01 07:55:31
5551	375	2025-04-05 18:12:37	2025-04-05 19:31:37	2025-04-05 18:12:37
5552	428	2025-03-09 11:33:06	2025-03-09 15:15:06	2025-03-09 11:33:06
5553	475	2025-10-12 17:55:36	2025-10-12 20:22:36	2025-10-12 17:55:36
5554	731	2025-04-21 16:40:04	2025-04-21 19:48:04	2025-04-21 16:40:04
5555	715	2025-03-29 15:30:17	2025-03-29 19:04:17	2025-03-29 15:30:17
5556	984	2025-06-24 16:45:37	2025-06-24 22:04:37	2025-06-24 16:45:37
5557	341	2025-07-26 16:25:15	2025-07-26 19:08:15	2025-07-26 16:25:15
5558	750	2025-07-19 13:20:34	2025-07-19 18:52:34	2025-07-19 13:20:34
5559	573	2025-09-07 09:39:42	2025-09-07 12:02:42	2025-09-07 09:39:42
5560	206	2025-10-04 15:55:48	2025-10-04 20:23:48	2025-10-04 15:55:48
5561	580	2024-11-16 17:49:39	2024-11-16 22:36:39	2024-11-16 17:49:39
5562	545	2024-11-24 17:01:59	2024-11-24 20:41:59	2024-11-24 17:01:59
5563	557	2025-07-12 17:39:26	2025-07-12 21:33:26	2025-07-12 17:39:26
5564	146	2025-02-08 16:32:45	2025-02-08 22:08:45	2025-02-08 16:32:45
5565	791	2024-11-15 17:36:33	2024-11-15 21:53:33	2024-11-15 17:36:33
5566	979	2025-03-29 15:40:44	2025-03-29 17:31:44	2025-03-29 15:40:44
5567	389	2025-04-26 18:22:29	2025-04-26 20:31:29	2025-04-26 18:22:29
5568	836	2025-02-09 16:26:16	2025-02-09 18:03:16	2025-02-09 16:26:16
5569	165	2025-01-14 15:26:25	2025-01-14 18:37:25	2025-01-14 15:26:25
5570	367	2025-08-10 16:15:30	2025-08-10 18:39:30	2025-08-10 16:15:30
5571	719	2024-11-14 15:59:44	2024-11-14 18:53:44	2024-11-14 15:59:44
5572	253	2025-05-17 23:03:29	2025-05-18 04:51:29	2025-05-17 23:03:29
5573	868	2025-05-17 14:53:42	2025-05-17 16:56:42	2025-05-17 14:53:42
5574	489	2024-12-03 14:00:25	2024-12-03 18:16:25	2024-12-03 14:00:25
5575	503	2025-03-23 15:08:48	2025-03-23 20:38:48	2025-03-23 15:08:48
5576	6	2025-07-08 16:18:07	2025-07-08 21:40:07	2025-07-08 16:18:07
5577	634	2025-07-15 12:43:58	2025-07-15 16:23:58	2025-07-15 12:43:58
5578	69	2025-02-22 03:18:55	2025-02-22 06:48:55	2025-02-22 03:18:55
5579	305	2025-05-12 22:41:59	2025-05-13 04:32:59	2025-05-12 22:41:59
5580	339	2025-01-28 15:07:12	2025-01-28 19:20:12	2025-01-28 15:07:12
5581	162	2025-03-29 18:51:29	2025-03-29 22:09:29	2025-03-29 18:51:29
5582	345	2025-04-22 14:42:04	2025-04-22 18:41:04	2025-04-22 14:42:04
5583	79	2025-01-28 16:00:18	2025-01-28 21:33:18	2025-01-28 16:00:18
5584	972	2025-08-31 05:56:47	2025-08-31 08:41:47	2025-08-31 05:56:47
5585	701	2025-07-20 05:04:06	2025-07-20 10:08:06	2025-07-20 05:04:06
5586	181	2025-06-28 17:50:11	2025-06-28 18:56:11	2025-06-28 17:50:11
5587	161	2025-05-25 11:04:57	2025-05-25 15:14:57	2025-05-25 11:04:57
5588	682	2025-06-03 14:52:59	2025-06-03 15:55:59	2025-06-03 14:52:59
5589	722	2024-12-28 10:10:26	2024-12-28 13:11:26	2024-12-28 10:10:26
5590	206	2025-06-03 14:43:55	2025-06-03 18:55:55	2025-06-03 14:43:55
5591	999	2025-07-29 05:50:09	2025-07-29 10:20:09	2025-07-29 05:50:09
5592	49	2025-06-10 14:44:39	2025-06-10 18:39:39	2025-06-10 14:44:39
5593	975	2025-03-15 18:37:28	2025-03-15 20:24:28	2025-03-15 18:37:28
5594	100	2025-04-20 14:26:13	2025-04-20 17:25:13	2025-04-20 14:26:13
5595	913	2025-07-31 17:26:12	2025-07-31 21:13:12	2025-07-31 17:26:12
5596	205	2025-08-09 15:16:03	2025-08-09 16:17:03	2025-08-09 15:16:03
5597	925	2025-06-04 15:02:09	2025-06-04 17:17:09	2025-06-04 15:02:09
5598	780	2025-03-01 16:49:28	2025-03-01 22:06:28	2025-03-01 16:49:28
5599	351	2025-11-02 16:47:00	2025-11-02 19:27:00	2025-11-02 16:47:00
5600	503	2025-03-25 19:59:47	2025-03-25 23:46:47	2025-03-25 19:59:47
5601	12	2025-07-27 15:11:03	2025-07-27 17:23:03	2025-07-27 15:11:03
5602	502	2025-07-27 14:48:42	2025-07-27 20:43:42	2025-07-27 14:48:42
5603	60	2025-05-18 11:06:58	2025-05-18 14:00:58	2025-05-18 11:06:58
5604	744	2025-06-21 10:57:09	2025-06-21 14:21:09	2025-06-21 10:57:09
5605	192	2025-10-11 16:39:14	2025-10-11 22:08:14	2025-10-11 16:39:14
5606	497	2025-03-08 02:02:28	2025-03-08 03:24:28	2025-03-08 02:02:28
5607	238	2025-06-10 16:43:43	2025-06-10 21:08:43	2025-06-10 16:43:43
5608	108	2025-09-07 09:23:39	2025-09-07 12:52:39	2025-09-07 09:23:39
5609	991	2025-03-29 06:32:21	2025-03-29 09:30:21	2025-03-29 06:32:21
5610	395	2024-11-11 18:38:09	2024-11-11 23:38:09	2024-11-11 18:38:09
5611	424	2025-09-21 16:06:39	2025-09-21 18:06:39	2025-09-21 16:06:39
5612	571	2025-05-04 14:55:36	2025-05-04 15:58:36	2025-05-04 14:55:36
5613	635	2024-12-15 18:57:12	2024-12-15 21:43:12	2024-12-15 18:57:12
5614	746	2025-06-01 16:50:02	2025-06-01 21:43:02	2025-06-01 16:50:02
5615	134	2025-03-22 16:52:37	2025-03-22 20:14:37	2025-03-22 16:52:37
5616	164	2024-12-28 16:19:44	2024-12-28 19:49:44	2024-12-28 16:19:44
5617	310	2025-04-12 15:26:05	2025-04-12 19:58:05	2025-04-12 15:26:05
5618	213	2025-01-14 22:17:54	2025-01-15 01:01:54	2025-01-14 22:17:54
5619	413	2024-12-09 08:03:33	2024-12-09 10:57:33	2024-12-09 08:03:33
5620	499	2025-01-25 15:24:32	2025-01-25 17:41:32	2025-01-25 15:24:32
5621	908	2025-09-09 16:47:46	2025-09-09 21:40:46	2025-09-09 16:47:46
5622	898	2024-11-19 15:35:38	2024-11-19 21:16:38	2024-11-19 15:35:38
5623	686	2025-01-19 12:38:42	2025-01-19 14:04:42	2025-01-19 12:38:42
5624	39	2025-08-30 09:29:39	2025-08-30 15:10:39	2025-08-30 09:29:39
5625	322	2025-04-06 11:30:45	2025-04-06 17:00:45	2025-04-06 11:30:45
5626	142	2025-06-08 16:58:09	2025-06-08 20:20:09	2025-06-08 16:58:09
5627	978	2025-09-23 11:53:38	2025-09-23 14:14:38	2025-09-23 11:53:38
5628	723	2025-04-27 14:48:23	2025-04-27 18:07:23	2025-04-27 14:48:23
5629	381	2025-03-02 17:22:45	2025-03-02 20:26:45	2025-03-02 17:22:45
5630	822	2025-06-01 16:32:01	2025-06-01 22:14:01	2025-06-01 16:32:01
5631	789	2025-09-09 16:16:25	2025-09-09 19:26:25	2025-09-09 16:16:25
5632	499	2025-05-24 15:35:32	2025-05-24 19:44:32	2025-05-24 15:35:32
5633	162	2025-06-21 17:25:49	2025-06-21 20:08:49	2025-06-21 17:25:49
5634	814	2025-09-09 15:38:26	2025-09-09 20:26:26	2025-09-09 15:38:26
5635	260	2025-08-23 14:56:15	2025-08-23 16:35:15	2025-08-23 14:56:15
5636	575	2025-01-26 06:21:22	2025-01-26 09:20:22	2025-01-26 06:21:22
5637	161	2025-04-10 15:03:45	2025-04-10 18:42:45	2025-04-10 15:03:45
5638	747	2025-06-14 16:50:39	2025-06-14 19:56:39	2025-06-14 16:50:39
5639	120	2025-06-30 18:47:57	2025-06-30 23:01:57	2025-06-30 18:47:57
5640	787	2025-01-26 13:14:58	2025-01-26 15:47:58	2025-01-26 13:14:58
5641	103	2025-04-29 14:28:44	2025-04-29 17:14:44	2025-04-29 14:28:44
5642	773	2025-06-14 11:23:28	2025-06-14 13:55:28	2025-06-14 11:23:28
5643	876	2025-04-13 14:37:32	2025-04-13 16:01:32	2025-04-13 14:37:32
5644	967	2024-11-12 17:50:13	2024-11-12 22:25:13	2024-11-12 17:50:13
5645	307	2025-07-22 15:36:41	2025-07-22 18:05:41	2025-07-22 15:36:41
5646	902	2025-05-03 16:14:45	2025-05-03 20:57:45	2025-05-03 16:14:45
5647	338	2024-11-12 16:35:41	2024-11-12 19:13:41	2024-11-12 16:35:41
5648	422	2025-05-24 15:38:08	2025-05-24 20:53:08	2025-05-24 15:38:08
5649	118	2025-02-15 15:58:01	2025-02-15 17:58:01	2025-02-15 15:58:01
5650	750	2025-10-28 19:42:35	2025-10-28 21:59:35	2025-10-28 19:42:35
5651	902	2025-01-07 16:49:59	2025-01-07 20:35:59	2025-01-07 16:49:59
5652	142	2025-01-27 16:43:51	2025-01-27 19:27:51	2025-01-27 16:43:51
5653	550	2025-03-23 12:36:03	2025-03-23 16:20:03	2025-03-23 12:36:03
5654	814	2025-07-13 14:39:04	2025-07-13 19:47:04	2025-07-13 14:39:04
5655	129	2025-06-03 15:16:02	2025-06-03 17:28:02	2025-06-03 15:16:02
5656	766	2025-05-10 15:51:58	2025-05-10 21:02:58	2025-05-10 15:51:58
5657	336	2025-04-15 16:40:23	2025-04-15 19:18:23	2025-04-15 16:40:23
5658	523	2025-01-26 15:36:17	2025-01-26 19:32:17	2025-01-26 15:36:17
5659	159	2024-12-24 04:23:57	2024-12-24 10:03:57	2024-12-24 04:23:57
5660	202	2025-06-10 05:36:29	2025-06-10 10:12:29	2025-06-10 05:36:29
5661	796	2025-10-21 16:02:28	2025-10-21 19:05:28	2025-10-21 16:02:28
5662	575	2025-08-09 15:03:36	2025-08-09 18:21:36	2025-08-09 15:03:36
5663	945	2025-07-08 07:32:38	2025-07-08 13:07:38	2025-07-08 07:32:38
5664	143	2024-12-22 08:41:11	2024-12-22 14:30:11	2024-12-22 08:41:11
5665	498	2025-07-29 14:44:15	2025-07-29 16:34:15	2025-07-29 14:44:15
5666	101	2024-12-10 18:20:10	2024-12-10 21:10:10	2024-12-10 18:20:10
5667	581	2025-02-08 17:59:57	2025-02-08 19:51:57	2025-02-08 17:59:57
5668	606	2025-07-13 15:42:38	2025-07-13 19:03:38	2025-07-13 15:42:38
5669	942	2025-09-06 15:48:22	2025-09-06 20:09:22	2025-09-06 15:48:22
5670	75	2025-04-26 16:36:51	2025-04-26 22:19:51	2025-04-26 16:36:51
5671	388	2024-12-01 13:45:50	2024-12-01 18:45:50	2024-12-01 13:45:50
5672	8	2025-09-23 15:39:53	2025-09-23 16:39:53	2025-09-23 15:39:53
5673	251	2025-07-08 15:59:18	2025-07-08 20:30:18	2025-07-08 15:59:18
5674	256	2025-08-26 06:45:55	2025-08-26 09:11:55	2025-08-26 06:45:55
5675	73	2025-06-22 14:28:35	2025-06-22 16:43:35	2025-06-22 14:28:35
5676	826	2025-06-21 16:55:43	2025-06-21 20:32:43	2025-06-21 16:55:43
5677	405	2025-11-04 19:59:17	2025-11-05 01:35:17	2025-11-04 19:59:17
5678	66	2024-12-17 13:18:25	2024-12-17 14:18:25	2024-12-17 13:18:25
5679	219	2025-01-19 15:21:07	2025-01-19 20:49:07	2025-01-19 15:21:07
5680	369	2025-05-20 14:26:34	2025-05-20 19:29:34	2025-05-20 14:26:34
5681	149	2024-12-19 17:45:27	2024-12-19 21:12:27	2024-12-19 17:45:27
5682	358	2024-12-01 19:08:29	2024-12-02 00:52:29	2024-12-01 19:08:29
5683	250	2025-04-26 18:28:11	2025-04-26 21:47:11	2025-04-26 18:28:11
5684	224	2025-04-22 14:38:14	2025-04-22 17:46:14	2025-04-22 14:38:14
5685	623	2025-07-31 11:03:55	2025-07-31 16:04:55	2025-07-31 11:03:55
5686	248	2025-02-22 15:06:53	2025-02-22 19:50:53	2025-02-22 15:06:53
5687	999	2025-01-26 19:46:50	2025-01-26 22:18:50	2025-01-26 19:46:50
5688	234	2025-10-25 13:40:58	2025-10-25 17:58:58	2025-10-25 13:40:58
5689	666	2025-10-07 16:25:19	2025-10-07 17:50:19	2025-10-07 16:25:19
5690	602	2025-04-01 07:12:22	2025-04-01 09:54:22	2025-04-01 07:12:22
5691	737	2025-04-01 16:49:21	2025-04-01 22:37:21	2025-04-01 16:49:21
5692	309	2024-11-16 16:34:31	2024-11-16 21:58:31	2024-11-16 16:34:31
5693	709	2025-05-17 09:27:18	2025-05-17 14:18:18	2025-05-17 09:27:18
5694	305	2025-04-20 16:32:06	2025-04-20 20:58:06	2025-04-20 16:32:06
5695	56	2025-04-27 10:58:37	2025-04-27 15:13:37	2025-04-27 10:58:37
5696	484	2025-06-21 12:10:44	2025-06-21 15:37:44	2025-06-21 12:10:44
5697	676	2025-01-11 10:48:32	2025-01-11 16:01:32	2025-01-11 10:48:32
5698	519	2025-06-14 16:07:18	2025-06-14 21:51:18	2025-06-14 16:07:18
5699	106	2025-07-29 14:20:09	2025-07-29 17:59:09	2025-07-29 14:20:09
5700	156	2025-01-27 15:01:17	2025-01-27 20:28:17	2025-01-27 15:01:17
5701	811	2025-09-21 15:20:50	2025-09-21 18:46:50	2025-09-21 15:20:50
5702	848	2025-06-02 14:43:38	2025-06-02 17:49:38	2025-06-02 14:43:38
5703	607	2024-11-12 15:02:51	2024-11-12 18:11:51	2024-11-12 15:02:51
5704	562	2025-08-23 18:33:27	2025-08-23 19:35:27	2025-08-23 18:33:27
5705	683	2025-06-10 14:48:07	2025-06-10 18:25:07	2025-06-10 14:48:07
5706	567	2025-03-16 16:28:09	2025-03-16 21:22:09	2025-03-16 16:28:09
5707	721	2025-02-02 17:46:03	2025-02-02 20:36:03	2025-02-02 17:46:03
5708	87	2025-06-29 18:35:10	2025-06-29 23:51:10	2025-06-29 18:35:10
5709	931	2025-09-30 15:49:03	2025-09-30 19:07:03	2025-09-30 15:49:03
5710	368	2025-03-22 17:29:01	2025-03-22 21:24:01	2025-03-22 17:29:01
5711	104	2024-12-10 08:15:24	2024-12-10 11:59:24	2024-12-10 08:15:24
5712	767	2024-11-10 15:49:00	2024-11-10 18:13:00	2024-11-10 15:49:00
5713	77	2024-12-24 15:28:40	2024-12-24 18:42:40	2024-12-24 15:28:40
5714	918	2024-12-31 15:57:31	2024-12-31 21:46:31	2024-12-31 15:57:31
5715	440	2025-05-10 14:42:50	2025-05-10 19:04:50	2025-05-10 14:42:50
5716	202	2025-04-29 16:21:48	2025-04-29 19:12:48	2025-04-29 16:21:48
5717	48	2025-06-15 05:40:02	2025-06-15 11:01:02	2025-06-15 05:40:02
5718	589	2025-08-31 08:27:31	2025-08-31 13:48:31	2025-08-31 08:27:31
5719	821	2025-03-16 06:51:02	2025-03-16 11:35:02	2025-03-16 06:51:02
5720	831	2025-02-18 17:03:08	2025-02-18 20:58:08	2025-02-18 17:03:08
5721	476	2025-05-25 18:01:09	2025-05-25 19:42:09	2025-05-25 18:01:09
5722	53	2025-10-14 14:53:38	2025-10-14 17:21:38	2025-10-14 14:53:38
5723	917	2025-04-27 06:17:55	2025-04-27 08:06:55	2025-04-27 06:17:55
5724	64	2025-10-21 16:06:35	2025-10-21 19:17:35	2025-10-21 16:06:35
5725	474	2024-12-22 09:33:29	2024-12-22 12:36:29	2024-12-22 09:33:29
5726	948	2025-08-16 16:47:39	2025-08-16 19:13:39	2025-08-16 16:47:39
5727	530	2024-12-01 16:44:29	2024-12-01 20:31:29	2024-12-01 16:44:29
5728	527	2025-09-27 15:26:14	2025-09-27 16:34:14	2025-09-27 15:26:14
5729	513	2025-05-13 15:57:24	2025-05-13 19:11:24	2025-05-13 15:57:24
5730	909	2025-01-26 15:31:57	2025-01-26 17:06:57	2025-01-26 15:31:57
5731	787	2025-11-01 15:42:07	2025-11-01 20:23:07	2025-11-01 15:42:07
5732	33	2025-08-02 15:02:48	2025-08-02 19:36:48	2025-08-02 15:02:48
5733	318	2025-07-26 08:07:55	2025-07-26 13:21:55	2025-07-26 08:07:55
5734	780	2025-05-13 12:44:56	2025-05-13 18:07:56	2025-05-13 12:44:56
5735	183	2025-10-21 17:16:16	2025-10-21 20:55:16	2025-10-21 17:16:16
5736	674	2025-07-22 15:16:21	2025-07-22 20:08:21	2025-07-22 15:16:21
5737	356	2024-11-16 18:44:17	2024-11-16 21:31:17	2024-11-16 18:44:17
5738	802	2025-04-18 22:14:52	2025-04-19 00:55:52	2025-04-18 22:14:52
5739	77	2025-02-25 16:53:52	2025-02-25 21:36:52	2025-02-25 16:53:52
5740	20	2025-04-29 16:22:47	2025-04-29 20:22:47	2025-04-29 16:22:47
5741	906	2025-03-22 15:00:13	2025-03-22 20:37:13	2025-03-22 15:00:13
5742	357	2025-05-25 17:03:51	2025-05-25 19:24:51	2025-05-25 17:03:51
5743	760	2025-03-09 06:23:44	2025-03-09 09:47:44	2025-03-09 06:23:44
5744	290	2025-08-09 14:08:04	2025-08-09 18:02:04	2025-08-09 14:08:04
5745	328	2025-02-25 15:27:35	2025-02-25 20:14:35	2025-02-25 15:27:35
5746	94	2025-05-17 14:23:28	2025-05-17 20:14:28	2025-05-17 14:23:28
5747	63	2025-10-21 15:30:36	2025-10-21 21:27:36	2025-10-21 15:30:36
5748	619	2025-08-02 00:33:14	2025-08-02 04:21:14	2025-08-02 00:33:14
5749	829	2025-10-21 15:57:36	2025-10-21 18:50:36	2025-10-21 15:57:36
5750	564	2025-04-19 16:48:59	2025-04-19 20:31:59	2025-04-19 16:48:59
5751	512	2025-03-15 17:22:59	2025-03-15 21:08:59	2025-03-15 17:22:59
5752	446	2024-12-14 08:42:47	2024-12-14 12:26:47	2024-12-14 08:42:47
5753	716	2025-10-25 14:37:01	2025-10-25 18:30:01	2025-10-25 14:37:01
5754	877	2025-09-09 08:56:45	2025-09-09 10:06:45	2025-09-09 08:56:45
5755	704	2025-09-28 17:55:35	2025-09-28 22:20:35	2025-09-28 17:55:35
5756	80	2025-06-10 16:14:50	2025-06-10 18:10:50	2025-06-10 16:14:50
5757	185	2025-05-03 04:32:59	2025-05-03 09:41:59	2025-05-03 04:32:59
5758	40	2025-09-13 14:48:01	2025-09-13 17:11:01	2025-09-13 14:48:01
5759	838	2025-06-24 13:55:41	2025-06-24 16:30:41	2025-06-24 13:55:41
5760	406	2024-12-31 15:48:22	2024-12-31 19:28:22	2024-12-31 15:48:22
5761	329	2025-08-10 14:42:54	2025-08-10 16:01:54	2025-08-10 14:42:54
5762	866	2025-08-19 16:23:01	2025-08-19 21:32:01	2025-08-19 16:23:01
5763	417	2025-07-22 16:02:53	2025-07-22 19:17:53	2025-07-22 16:02:53
5764	641	2025-08-19 15:54:27	2025-08-19 21:01:27	2025-08-19 15:54:27
5765	461	2025-10-26 17:43:57	2025-10-26 20:05:57	2025-10-26 17:43:57
5766	702	2025-04-26 14:27:37	2025-04-26 15:27:37	2025-04-26 14:27:37
5767	274	2025-08-31 16:13:14	2025-08-31 21:14:14	2025-08-31 16:13:14
5768	688	2025-04-12 08:58:53	2025-04-12 11:37:53	2025-04-12 08:58:53
5769	509	2025-06-24 16:39:02	2025-06-24 19:37:02	2025-06-24 16:39:02
5770	714	2025-07-16 15:21:17	2025-07-16 21:15:17	2025-07-16 15:21:17
5771	614	2025-07-27 14:34:44	2025-07-27 19:49:44	2025-07-27 14:34:44
5772	469	2025-04-22 18:40:24	2025-04-22 20:29:24	2025-04-22 18:40:24
5773	135	2025-09-22 17:17:39	2025-09-22 19:09:39	2025-09-22 17:17:39
5774	332	2025-06-07 13:25:02	2025-06-07 17:36:02	2025-06-07 13:25:02
5775	619	2024-12-17 16:36:21	2024-12-17 22:25:21	2024-12-17 16:36:21
5776	328	2025-03-22 18:42:24	2025-03-22 21:20:24	2025-03-22 18:42:24
5777	116	2025-01-19 16:10:16	2025-01-19 19:51:16	2025-01-19 16:10:16
5778	656	2025-07-29 04:44:34	2025-07-29 09:11:34	2025-07-29 04:44:34
5779	756	2025-09-09 14:28:02	2025-09-09 19:02:02	2025-09-09 14:28:02
5780	940	2025-10-23 16:52:19	2025-10-23 18:51:19	2025-10-23 16:52:19
5781	835	2025-01-05 17:40:34	2025-01-05 21:33:34	2025-01-05 17:40:34
5782	648	2025-05-22 06:05:17	2025-05-22 12:04:17	2025-05-22 06:05:17
5783	294	2024-11-19 16:43:29	2024-11-19 19:47:29	2024-11-19 16:43:29
5784	789	2025-04-19 14:51:44	2025-04-19 17:02:44	2025-04-19 14:51:44
5785	610	2025-03-09 17:29:17	2025-03-09 20:44:17	2025-03-09 17:29:17
5786	904	2025-02-08 16:01:55	2025-02-08 17:53:55	2025-02-08 16:01:55
5787	337	2025-05-20 06:32:43	2025-05-20 10:05:43	2025-05-20 06:32:43
5788	460	2025-10-04 17:39:14	2025-10-04 22:59:14	2025-10-04 17:39:14
5789	164	2025-05-25 15:39:05	2025-05-25 17:03:05	2025-05-25 15:39:05
5790	842	2024-12-17 15:55:44	2024-12-17 19:40:44	2024-12-17 15:55:44
5791	168	2025-07-26 11:57:00	2025-07-26 13:41:00	2025-07-26 11:57:00
5792	780	2025-06-14 14:12:46	2025-06-14 17:46:46	2025-06-14 14:12:46
5793	350	2025-07-18 14:02:22	2025-07-18 15:55:22	2025-07-18 14:02:22
5794	618	2025-04-08 08:31:04	2025-04-08 12:00:04	2025-04-08 08:31:04
5795	914	2025-02-04 16:10:37	2025-02-04 18:26:37	2025-02-04 16:10:37
5796	429	2025-05-13 16:26:12	2025-05-13 19:25:12	2025-05-13 16:26:12
5797	312	2024-12-17 18:25:57	2024-12-17 19:43:57	2024-12-17 18:25:57
5798	201	2024-11-24 15:54:53	2024-11-24 16:59:53	2024-11-24 15:54:53
5799	624	2025-03-22 15:58:19	2025-03-22 19:32:19	2025-03-22 15:58:19
5800	979	2025-07-12 23:03:19	2025-07-13 04:35:19	2025-07-12 23:03:19
5801	402	2025-06-05 18:18:31	2025-06-05 21:58:31	2025-06-05 18:18:31
5802	46	2025-10-05 14:20:15	2025-10-05 18:11:15	2025-10-05 14:20:15
5803	979	2025-06-21 16:13:23	2025-06-21 21:40:23	2025-06-21 16:13:23
5804	42	2025-02-11 18:15:42	2025-02-11 19:22:42	2025-02-11 18:15:42
5805	861	2025-09-02 16:32:49	2025-09-02 21:54:49	2025-09-02 16:32:49
5806	946	2024-11-24 16:57:07	2024-11-24 22:14:07	2024-11-24 16:57:07
5807	890	2025-03-29 16:35:33	2025-03-29 18:37:33	2025-03-29 16:35:33
5808	104	2024-12-11 15:23:42	2024-12-11 20:36:42	2024-12-11 15:23:42
5809	757	2025-09-09 15:59:46	2025-09-09 19:34:46	2025-09-09 15:59:46
5810	865	2025-01-28 18:49:20	2025-01-28 22:59:20	2025-01-28 18:49:20
5811	399	2025-10-12 15:57:19	2025-10-12 20:47:19	2025-10-12 15:57:19
5812	247	2025-04-12 14:47:11	2025-04-12 19:10:11	2025-04-12 14:47:11
5813	397	2025-05-31 16:15:23	2025-05-31 21:49:23	2025-05-31 16:15:23
5814	763	2025-08-23 15:29:37	2025-08-23 21:04:37	2025-08-23 15:29:37
5815	328	2025-10-04 14:24:31	2025-10-04 18:36:31	2025-10-04 14:24:31
5816	511	2025-04-06 15:25:00	2025-04-06 17:38:00	2025-04-06 15:25:00
5817	179	2025-03-16 16:09:09	2025-03-16 19:13:09	2025-03-16 16:09:09
5818	554	2024-11-19 15:44:48	2024-11-19 19:25:48	2024-11-19 15:44:48
5819	18	2025-08-30 05:57:45	2025-08-30 07:02:45	2025-08-30 05:57:45
5820	449	2025-11-02 15:27:37	2025-11-02 19:43:37	2025-11-02 15:27:37
5821	322	2025-08-19 16:49:44	2025-08-19 21:12:44	2025-08-19 16:49:44
5822	654	2025-10-28 18:46:55	2025-10-28 21:04:55	2025-10-28 18:46:55
5823	972	2025-06-24 13:33:14	2025-06-24 16:49:14	2025-06-24 13:33:14
5824	156	2025-10-21 16:38:18	2025-10-21 20:29:18	2025-10-21 16:38:18
5825	86	2025-05-25 17:46:33	2025-05-25 19:39:33	2025-05-25 17:46:33
5826	581	2025-02-13 07:48:53	2025-02-13 11:20:53	2025-02-13 07:48:53
5827	649	2025-01-04 13:31:08	2025-01-04 15:28:08	2025-01-04 13:31:08
5828	692	2025-10-03 22:53:44	2025-10-04 03:40:44	2025-10-03 22:53:44
5829	890	2025-02-16 08:43:22	2025-02-16 13:10:22	2025-02-16 08:43:22
5830	839	2025-08-16 17:09:58	2025-08-16 22:08:58	2025-08-16 17:09:58
5831	582	2025-10-19 18:06:18	2025-10-19 19:29:18	2025-10-19 18:06:18
5832	429	2025-08-12 15:38:15	2025-08-12 18:21:15	2025-08-12 15:38:15
5833	564	2025-01-18 18:49:31	2025-01-18 22:08:31	2025-01-18 18:49:31
5834	143	2025-06-01 15:14:55	2025-06-01 17:12:55	2025-06-01 15:14:55
5835	452	2025-03-30 15:53:09	2025-03-30 21:44:09	2025-03-30 15:53:09
5836	267	2025-03-15 20:16:38	2025-03-16 01:48:38	2025-03-15 20:16:38
5837	958	2025-07-12 07:01:40	2025-07-12 10:32:40	2025-07-12 07:01:40
5838	168	2025-10-26 09:22:44	2025-10-26 13:44:44	2025-10-26 09:22:44
5839	857	2025-04-22 14:46:08	2025-04-22 16:44:08	2025-04-22 14:46:08
5840	672	2024-12-28 15:44:19	2024-12-28 20:33:19	2024-12-28 15:44:19
5841	551	2024-12-07 17:04:49	2024-12-07 18:45:49	2024-12-07 17:04:49
5842	298	2025-06-22 16:43:35	2025-06-22 19:52:35	2025-06-22 16:43:35
5843	396	2025-10-26 17:22:57	2025-10-26 22:34:57	2025-10-26 17:22:57
5844	756	2025-04-08 17:12:06	2025-04-08 20:23:06	2025-04-08 17:12:06
5845	230	2024-12-31 11:03:08	2024-12-31 14:41:08	2024-12-31 11:03:08
5846	82	2025-09-28 06:26:04	2025-09-28 12:17:04	2025-09-28 06:26:04
5847	522	2025-09-21 16:07:46	2025-09-21 20:06:46	2025-09-21 16:07:46
5848	171	2024-12-24 15:29:18	2024-12-24 20:52:18	2024-12-24 15:29:18
5849	65	2024-12-05 17:31:49	2024-12-05 21:29:49	2024-12-05 17:31:49
5850	646	2025-03-01 15:55:55	2025-03-01 21:21:55	2025-03-01 15:55:55
5851	882	2025-01-09 17:44:49	2025-01-09 21:20:49	2025-01-09 17:44:49
5852	455	2025-04-15 14:23:05	2025-04-15 18:32:05	2025-04-15 14:23:05
5853	517	2025-03-18 15:41:05	2025-03-18 18:03:05	2025-03-18 15:41:05
5854	631	2025-09-30 14:54:39	2025-09-30 20:39:39	2025-09-30 14:54:39
5855	701	2025-09-09 15:11:57	2025-09-09 18:44:57	2025-09-09 15:11:57
5856	240	2025-11-04 17:27:24	2025-11-04 19:51:24	2025-11-04 17:27:24
5857	529	2025-05-06 15:49:27	2025-05-06 18:43:27	2025-05-06 15:49:27
5858	218	2025-07-06 14:50:47	2025-07-06 16:58:47	2025-07-06 14:50:47
5859	659	2025-05-27 04:01:43	2025-05-27 06:36:43	2025-05-27 04:01:43
5860	18	2025-02-16 11:19:25	2025-02-16 15:50:25	2025-02-16 11:19:25
5861	269	2025-04-20 16:04:21	2025-04-20 21:17:21	2025-04-20 16:04:21
5862	39	2024-12-14 15:33:53	2024-12-14 19:03:53	2024-12-14 15:33:53
5863	484	2025-02-18 17:53:02	2025-02-18 20:57:02	2025-02-18 17:53:02
5864	269	2024-12-31 16:57:27	2024-12-31 19:30:27	2024-12-31 16:57:27
5865	397	2025-08-19 16:15:32	2025-08-19 17:38:32	2025-08-19 16:15:32
5866	946	2025-01-18 16:27:11	2025-01-18 18:36:11	2025-01-18 16:27:11
5867	590	2024-12-28 16:18:31	2024-12-28 22:10:31	2024-12-28 16:18:31
5868	936	2025-02-04 17:39:08	2025-02-04 18:53:08	2025-02-04 17:39:08
5869	378	2024-12-03 05:47:26	2024-12-03 11:40:26	2024-12-03 05:47:26
5870	2	2025-06-03 17:25:07	2025-06-03 21:56:07	2025-06-03 17:25:07
5871	980	2025-10-11 15:26:57	2025-10-11 16:48:57	2025-10-11 15:26:57
5872	196	2025-05-30 15:32:00	2025-05-30 19:13:00	2025-05-30 15:32:00
5873	922	2025-05-20 15:32:33	2025-05-20 18:49:33	2025-05-20 15:32:33
5874	988	2025-10-11 12:51:14	2025-10-11 14:48:14	2025-10-11 12:51:14
5875	850	2025-04-12 15:38:22	2025-04-12 20:33:22	2025-04-12 15:38:22
5876	539	2025-10-11 17:41:26	2025-10-11 23:32:26	2025-10-11 17:41:26
5877	902	2025-03-29 14:55:46	2025-03-29 18:35:46	2025-03-29 14:55:46
5878	727	2024-12-22 15:06:38	2024-12-22 21:02:38	2024-12-22 15:06:38
5879	393	2025-04-20 18:14:45	2025-04-20 19:36:45	2025-04-20 18:14:45
5880	809	2025-07-05 16:32:29	2025-07-05 20:51:29	2025-07-05 16:32:29
5881	130	2025-10-26 17:43:23	2025-10-26 20:19:23	2025-10-26 17:43:23
5882	743	2025-05-27 15:43:30	2025-05-27 16:55:30	2025-05-27 15:43:30
5883	407	2025-02-15 17:17:19	2025-02-15 21:04:19	2025-02-15 17:17:19
5884	850	2024-12-31 15:19:39	2024-12-31 19:12:39	2024-12-31 15:19:39
5885	756	2025-10-21 14:57:46	2025-10-21 18:15:46	2025-10-21 14:57:46
5886	32	2025-06-10 16:50:14	2025-06-10 20:27:14	2025-06-10 16:50:14
5887	807	2025-06-28 16:34:52	2025-06-28 19:22:52	2025-06-28 16:34:52
5888	648	2025-08-23 15:41:58	2025-08-23 17:09:58	2025-08-23 15:41:58
5889	915	2025-07-29 18:04:33	2025-07-29 23:20:33	2025-07-29 18:04:33
5890	833	2025-01-12 18:55:07	2025-01-12 20:18:07	2025-01-12 18:55:07
5891	649	2025-09-21 14:50:26	2025-09-21 17:15:26	2025-09-21 14:50:26
5892	926	2025-08-17 15:41:15	2025-08-17 21:38:15	2025-08-17 15:41:15
5893	659	2025-07-19 06:49:16	2025-07-19 08:32:16	2025-07-19 06:49:16
5894	370	2025-09-14 14:39:27	2025-09-14 16:35:27	2025-09-14 14:39:27
5895	574	2025-06-10 18:42:12	2025-06-10 20:59:12	2025-06-10 18:42:12
5896	928	2025-10-21 15:01:35	2025-10-21 19:25:35	2025-10-21 15:01:35
5897	627	2025-06-21 09:55:42	2025-06-21 11:24:42	2025-06-21 09:55:42
5898	437	2025-07-03 17:45:00	2025-07-03 22:41:00	2025-07-03 17:45:00
5899	519	2025-07-14 23:01:07	2025-07-15 03:14:07	2025-07-14 23:01:07
5900	696	2025-08-27 17:40:15	2025-08-27 23:01:15	2025-08-27 17:40:15
5901	801	2025-04-06 14:09:20	2025-04-06 19:28:20	2025-04-06 14:09:20
5902	126	2025-05-04 18:38:58	2025-05-05 00:30:58	2025-05-04 18:38:58
5903	963	2025-06-29 15:26:42	2025-06-29 20:47:42	2025-06-29 15:26:42
5904	231	2025-06-21 04:28:17	2025-06-21 09:41:17	2025-06-21 04:28:17
5905	945	2025-10-21 16:00:22	2025-10-21 17:36:22	2025-10-21 16:00:22
5906	601	2025-03-30 14:08:23	2025-03-30 15:21:23	2025-03-30 14:08:23
5907	844	2025-04-27 16:30:23	2025-04-27 19:49:23	2025-04-27 16:30:23
5908	845	2024-12-24 15:35:01	2024-12-24 18:45:01	2024-12-24 15:35:01
5909	497	2025-09-28 18:34:34	2025-09-28 20:17:34	2025-09-28 18:34:34
5910	779	2025-03-04 16:36:15	2025-03-04 18:04:15	2025-03-04 16:36:15
5911	546	2025-01-19 15:36:43	2025-01-19 18:24:43	2025-01-19 15:36:43
5912	101	2025-10-14 17:09:21	2025-10-14 19:10:21	2025-10-14 17:09:21
5913	356	2024-12-31 19:36:11	2025-01-01 01:26:11	2024-12-31 19:36:11
5914	386	2025-05-01 16:21:46	2025-05-01 18:55:46	2025-05-01 16:21:46
5915	253	2025-06-17 17:12:42	2025-06-17 18:19:42	2025-06-17 17:12:42
5916	204	2025-05-24 17:26:53	2025-05-24 21:44:53	2025-05-24 17:26:53
5917	4	2025-09-09 12:25:38	2025-09-09 15:10:38	2025-09-09 12:25:38
5918	938	2025-09-16 16:35:29	2025-09-16 18:00:29	2025-09-16 16:35:29
5919	965	2025-02-19 17:42:01	2025-02-19 22:28:01	2025-02-19 17:42:01
5920	972	2024-12-14 16:19:13	2024-12-14 21:35:13	2024-12-14 16:19:13
5921	991	2025-07-16 14:06:10	2025-07-16 19:03:10	2025-07-16 14:06:10
5922	48	2025-07-30 15:21:10	2025-07-30 18:25:10	2025-07-30 15:21:10
5923	847	2025-06-16 14:38:09	2025-06-16 18:33:09	2025-06-16 14:38:09
5924	65	2025-10-14 13:19:15	2025-10-14 17:54:15	2025-10-14 13:19:15
5925	781	2025-07-22 16:04:30	2025-07-22 17:58:30	2025-07-22 16:04:30
5926	844	2025-05-17 15:00:03	2025-05-17 20:10:03	2025-05-17 15:00:03
5927	349	2025-01-05 14:33:20	2025-01-05 18:22:20	2025-01-05 14:33:20
5928	100	2025-10-14 16:36:31	2025-10-14 20:34:31	2025-10-14 16:36:31
5929	710	2025-09-20 15:47:00	2025-09-20 20:36:00	2025-09-20 15:47:00
5930	618	2025-09-07 15:08:42	2025-09-07 16:44:42	2025-09-07 15:08:42
5931	77	2025-02-15 17:19:37	2025-02-15 19:19:37	2025-02-15 17:19:37
5932	34	2025-01-11 15:13:58	2025-01-11 18:48:58	2025-01-11 15:13:58
5933	758	2025-04-01 09:44:30	2025-04-01 13:52:30	2025-04-01 09:44:30
5934	404	2025-10-31 17:55:02	2025-10-31 22:54:02	2025-10-31 17:55:02
5935	630	2025-08-19 14:56:27	2025-08-19 17:52:27	2025-08-19 14:56:27
5936	486	2025-01-11 15:20:44	2025-01-11 19:04:44	2025-01-11 15:20:44
5937	235	2025-03-25 14:58:01	2025-03-25 16:10:01	2025-03-25 14:58:01
5938	611	2025-04-27 17:07:53	2025-04-27 22:55:53	2025-04-27 17:07:53
5939	63	2025-04-12 17:09:23	2025-04-12 19:51:23	2025-04-12 17:09:23
5940	304	2025-04-22 07:09:04	2025-04-22 10:45:04	2025-04-22 07:09:04
5941	170	2025-05-24 23:43:58	2025-05-25 05:34:58	2025-05-24 23:43:58
5942	221	2025-01-05 18:09:59	2025-01-05 22:06:59	2025-01-05 18:09:59
5943	210	2025-05-25 16:24:44	2025-05-25 18:59:44	2025-05-25 16:24:44
5944	882	2025-06-01 14:31:41	2025-06-01 17:32:41	2025-06-01 14:31:41
5945	127	2025-10-12 14:47:44	2025-10-12 19:59:44	2025-10-12 14:47:44
5946	54	2025-08-17 06:23:55	2025-08-17 09:16:55	2025-08-17 06:23:55
5947	377	2025-03-04 17:17:56	2025-03-04 19:19:56	2025-03-04 17:17:56
5948	72	2025-04-19 14:17:10	2025-04-19 18:34:10	2025-04-19 14:17:10
5949	113	2024-12-28 16:51:28	2024-12-28 21:02:28	2024-12-28 16:51:28
5950	662	2024-12-21 17:04:30	2024-12-21 19:29:30	2024-12-21 17:04:30
5951	874	2025-10-19 15:49:39	2025-10-19 17:26:39	2025-10-19 15:49:39
5952	68	2025-01-12 17:27:16	2025-01-12 19:45:16	2025-01-12 17:27:16
5953	133	2025-08-30 17:08:21	2025-08-30 23:05:21	2025-08-30 17:08:21
5954	220	2025-05-20 06:28:11	2025-05-20 08:30:11	2025-05-20 06:28:11
5955	779	2025-10-04 17:15:48	2025-10-04 18:48:48	2025-10-04 17:15:48
5956	353	2025-08-09 16:02:14	2025-08-09 19:05:14	2025-08-09 16:02:14
5957	515	2025-06-01 18:39:52	2025-06-02 00:12:52	2025-06-01 18:39:52
5958	294	2025-03-04 16:09:45	2025-03-04 21:26:45	2025-03-04 16:09:45
5959	31	2025-08-12 15:05:36	2025-08-12 20:48:36	2025-08-12 15:05:36
5960	394	2025-06-22 16:38:57	2025-06-22 19:45:57	2025-06-22 16:38:57
5961	208	2025-01-21 12:13:32	2025-01-21 16:43:32	2025-01-21 12:13:32
5962	499	2024-11-30 18:52:12	2024-11-30 22:52:12	2024-11-30 18:52:12
5963	15	2025-10-21 14:34:55	2025-10-21 16:58:55	2025-10-21 14:34:55
5964	130	2025-01-05 15:37:30	2025-01-05 18:45:30	2025-01-05 15:37:30
5965	654	2025-02-16 15:46:44	2025-02-16 19:10:44	2025-02-16 15:46:44
5966	809	2025-06-28 14:50:53	2025-06-28 16:11:53	2025-06-28 14:50:53
5967	676	2025-09-27 18:47:41	2025-09-27 22:43:41	2025-09-27 18:47:41
5968	941	2025-02-01 17:44:43	2025-02-01 21:44:43	2025-02-01 17:44:43
5969	834	2024-12-21 16:07:56	2024-12-21 17:15:56	2024-12-21 16:07:56
5970	71	2025-09-17 18:58:34	2025-09-17 20:24:34	2025-09-17 18:58:34
5971	800	2025-03-02 15:01:02	2025-03-02 18:19:02	2025-03-02 15:01:02
5972	992	2025-03-09 06:13:34	2025-03-09 10:52:34	2025-03-09 06:13:34
5973	569	2025-08-02 19:43:33	2025-08-02 22:29:33	2025-08-02 19:43:33
5974	889	2024-11-17 18:42:23	2024-11-18 00:29:23	2024-11-17 18:42:23
5975	843	2024-12-31 17:46:29	2024-12-31 20:07:29	2024-12-31 17:46:29
5976	396	2025-03-11 04:55:01	2025-03-11 07:09:01	2025-03-11 04:55:01
5977	462	2025-05-17 17:45:18	2025-05-17 19:54:18	2025-05-17 17:45:18
5978	778	2025-10-04 15:27:11	2025-10-04 18:11:11	2025-10-04 15:27:11
5979	537	2025-08-09 15:21:14	2025-08-09 16:23:14	2025-08-09 15:21:14
5980	981	2024-12-07 12:11:12	2024-12-07 13:59:12	2024-12-07 12:11:12
5981	859	2025-07-15 14:54:34	2025-07-15 20:14:34	2025-07-15 14:54:34
5982	313	2025-08-03 04:31:17	2025-08-03 06:06:17	2025-08-03 04:31:17
5983	173	2025-03-11 18:07:07	2025-03-11 20:01:07	2025-03-11 18:07:07
5984	654	2025-07-08 04:17:19	2025-07-08 09:24:19	2025-07-08 04:17:19
5985	694	2024-12-01 06:46:40	2024-12-01 10:16:40	2024-12-01 06:46:40
5986	594	2025-08-26 16:37:24	2025-08-26 22:22:24	2025-08-26 16:37:24
5987	187	2025-02-15 08:56:05	2025-02-15 11:46:05	2025-02-15 08:56:05
5988	789	2025-05-20 17:14:45	2025-05-20 20:26:45	2025-05-20 17:14:45
5989	237	2025-09-23 16:38:36	2025-09-23 19:23:36	2025-09-23 16:38:36
5990	216	2025-03-09 15:22:33	2025-03-09 18:47:33	2025-03-09 15:22:33
5991	884	2025-02-09 17:49:37	2025-02-09 19:33:37	2025-02-09 17:49:37
5992	917	2025-03-25 19:54:10	2025-03-25 22:14:10	2025-03-25 19:54:10
5993	429	2025-02-27 16:00:03	2025-02-27 19:49:03	2025-02-27 16:00:03
5994	25	2025-05-24 15:53:21	2025-05-24 20:43:21	2025-05-24 15:53:21
5995	562	2025-02-17 09:57:43	2025-02-17 13:08:43	2025-02-17 09:57:43
5996	50	2025-08-09 15:31:54	2025-08-09 18:35:54	2025-08-09 15:31:54
5997	455	2025-01-07 01:49:19	2025-01-07 07:24:19	2025-01-07 01:49:19
5998	463	2025-06-03 08:04:15	2025-06-03 10:41:15	2025-06-03 08:04:15
5999	836	2025-03-30 14:08:50	2025-03-30 19:09:50	2025-03-30 14:08:50
6000	963	2024-11-26 17:53:22	2024-11-26 20:25:22	2024-11-26 17:53:22
6001	811	2025-09-23 14:00:10	2025-09-23 17:07:10	2025-09-23 14:00:10
6002	902	2025-02-01 14:55:13	2025-02-01 18:21:13	2025-02-01 14:55:13
6003	524	2025-08-19 16:21:53	2025-08-19 19:16:53	2025-08-19 16:21:53
6004	583	2025-10-16 13:56:40	2025-10-16 15:26:40	2025-10-16 13:56:40
6005	477	2025-01-12 16:03:01	2025-01-12 17:27:01	2025-01-12 16:03:01
6006	469	2025-09-30 18:04:04	2025-09-30 21:34:04	2025-09-30 18:04:04
6007	237	2025-07-12 16:27:44	2025-07-12 17:38:44	2025-07-12 16:27:44
6008	714	2025-01-21 17:03:09	2025-01-21 21:02:09	2025-01-21 17:03:09
6009	371	2025-06-29 16:12:32	2025-06-29 18:17:32	2025-06-29 16:12:32
6010	866	2024-12-24 18:45:15	2024-12-24 19:51:15	2024-12-24 18:45:15
6011	379	2025-05-04 14:04:43	2025-05-04 19:18:43	2025-05-04 14:04:43
6012	676	2024-11-16 14:05:23	2024-11-16 15:08:23	2024-11-16 14:05:23
6013	393	2025-06-17 18:07:31	2025-06-17 19:10:31	2025-06-17 18:07:31
6014	266	2025-04-13 14:14:58	2025-04-13 18:15:58	2025-04-13 14:14:58
6015	531	2025-10-05 07:26:11	2025-10-05 09:12:11	2025-10-05 07:26:11
6016	837	2025-07-19 15:55:23	2025-07-19 18:23:23	2025-07-19 15:55:23
6017	187	2025-03-29 12:57:27	2025-03-29 18:45:27	2025-03-29 12:57:27
6018	563	2025-09-14 16:32:26	2025-09-14 18:30:26	2025-09-14 16:32:26
6019	790	2025-07-13 14:07:51	2025-07-13 15:54:51	2025-07-13 14:07:51
6020	178	2024-11-26 16:13:33	2024-11-26 17:16:33	2024-11-26 16:13:33
6021	114	2024-11-30 01:11:16	2024-11-30 02:37:16	2024-11-30 01:11:16
6022	467	2025-05-11 14:34:04	2025-05-11 17:18:04	2025-05-11 14:34:04
6023	803	2025-02-08 17:43:32	2025-02-08 20:09:32	2025-02-08 17:43:32
6024	749	2025-06-24 16:10:07	2025-06-24 20:47:07	2025-06-24 16:10:07
6025	199	2025-10-26 16:35:04	2025-10-26 19:08:04	2025-10-26 16:35:04
6026	173	2025-05-20 14:19:40	2025-05-20 19:01:40	2025-05-20 14:19:40
6027	886	2025-01-21 17:54:48	2025-01-21 21:11:48	2025-01-21 17:54:48
6028	775	2025-06-17 14:57:23	2025-06-17 19:48:23	2025-06-17 14:57:23
6029	77	2025-05-24 15:38:38	2025-05-24 20:01:38	2025-05-24 15:38:38
6030	26	2025-05-27 18:40:39	2025-05-27 20:20:39	2025-05-27 18:40:39
6031	580	2025-10-11 16:38:11	2025-10-11 19:53:11	2025-10-11 16:38:11
6032	826	2025-06-21 16:51:57	2025-06-21 19:20:57	2025-06-21 16:51:57
6033	35	2025-09-02 06:05:48	2025-09-02 09:41:48	2025-09-02 06:05:48
6034	328	2025-01-09 19:34:17	2025-01-09 21:37:17	2025-01-09 19:34:17
6035	229	2025-06-07 12:24:21	2025-06-07 13:32:21	2025-06-07 12:24:21
6036	951	2025-01-25 18:31:45	2025-01-25 19:31:45	2025-01-25 18:31:45
6037	664	2025-04-14 14:37:38	2025-04-14 16:10:38	2025-04-14 14:37:38
6038	416	2025-08-02 12:24:03	2025-08-02 15:13:03	2025-08-02 12:24:03
6039	872	2025-09-09 15:40:14	2025-09-09 19:48:14	2025-09-09 15:40:14
6040	784	2024-12-24 21:11:01	2024-12-24 23:48:01	2024-12-24 21:11:01
6041	854	2024-11-12 17:01:21	2024-11-12 22:49:21	2024-11-12 17:01:21
6042	288	2025-10-11 18:42:51	2025-10-11 21:56:51	2025-10-11 18:42:51
6043	400	2025-08-04 03:30:48	2025-08-04 07:02:48	2025-08-04 03:30:48
6044	207	2025-01-28 15:08:02	2025-01-28 17:52:02	2025-01-28 15:08:02
6045	586	2025-05-18 07:01:28	2025-05-18 12:54:28	2025-05-18 07:01:28
6046	439	2025-07-12 12:46:19	2025-07-12 15:25:19	2025-07-12 12:46:19
6047	290	2025-04-22 16:38:56	2025-04-22 20:01:56	2025-04-22 16:38:56
6048	219	2024-12-03 12:10:04	2024-12-03 14:24:04	2024-12-03 12:10:04
6049	690	2025-01-28 16:25:07	2025-01-28 20:04:07	2025-01-28 16:25:07
6050	546	2025-04-22 16:46:22	2025-04-22 20:23:22	2025-04-22 16:46:22
6051	457	2025-07-22 14:02:06	2025-07-22 19:37:06	2025-07-22 14:02:06
6052	122	2025-09-14 17:23:27	2025-09-14 19:58:27	2025-09-14 17:23:27
6053	786	2025-08-02 16:35:11	2025-08-02 20:13:11	2025-08-02 16:35:11
6054	209	2025-04-20 14:33:40	2025-04-20 19:37:40	2025-04-20 14:33:40
6055	67	2025-02-11 16:53:44	2025-02-11 19:18:44	2025-02-11 16:53:44
6056	605	2025-03-02 16:54:44	2025-03-02 21:23:44	2025-03-02 16:54:44
6057	465	2025-06-01 15:50:53	2025-06-01 17:22:53	2025-06-01 15:50:53
6058	596	2025-03-01 16:59:47	2025-03-01 18:13:47	2025-03-01 16:59:47
6059	828	2025-02-22 08:23:37	2025-02-22 10:02:37	2025-02-22 08:23:37
6060	730	2024-11-16 08:13:48	2024-11-16 11:29:48	2024-11-16 08:13:48
6061	359	2025-03-04 17:12:13	2025-03-04 21:22:13	2025-03-04 17:12:13
6062	485	2025-11-02 16:07:27	2025-11-02 19:30:27	2025-11-02 16:07:27
6063	938	2025-06-10 09:22:06	2025-06-10 15:06:06	2025-06-10 09:22:06
6064	52	2025-08-26 15:50:55	2025-08-26 18:26:55	2025-08-26 15:50:55
6065	529	2025-02-25 16:52:16	2025-02-25 21:38:16	2025-02-25 16:52:16
6066	811	2025-09-23 10:04:35	2025-09-23 14:41:35	2025-09-23 10:04:35
6067	994	2025-08-09 16:46:59	2025-08-09 19:56:59	2025-08-09 16:46:59
6068	756	2025-01-14 15:10:27	2025-01-14 17:47:27	2025-01-14 15:10:27
6069	959	2025-05-08 07:20:32	2025-05-08 09:50:32	2025-05-08 07:20:32
6070	453	2025-05-06 14:49:04	2025-05-06 17:02:04	2025-05-06 14:49:04
6071	971	2025-05-02 15:09:13	2025-05-02 16:17:13	2025-05-02 15:09:13
6072	288	2025-02-14 15:48:38	2025-02-14 21:27:38	2025-02-14 15:48:38
6073	957	2025-07-22 11:47:35	2025-07-22 13:24:35	2025-07-22 11:47:35
6074	965	2025-10-19 13:46:14	2025-10-19 15:57:14	2025-10-19 13:46:14
6075	39	2025-04-12 14:15:38	2025-04-12 18:12:38	2025-04-12 14:15:38
6076	28	2025-09-06 14:44:06	2025-09-06 16:56:06	2025-09-06 14:44:06
6077	83	2025-01-08 15:50:45	2025-01-08 18:55:45	2025-01-08 15:50:45
6078	47	2024-12-03 14:34:17	2024-12-03 15:50:17	2024-12-03 14:34:17
6079	776	2025-10-21 14:24:44	2025-10-21 18:36:44	2025-10-21 14:24:44
6080	669	2025-04-01 09:23:21	2025-04-01 13:37:21	2025-04-01 09:23:21
6081	321	2025-03-29 02:56:59	2025-03-29 08:06:59	2025-03-29 02:56:59
6082	431	2025-10-02 16:44:27	2025-10-02 19:26:27	2025-10-02 16:44:27
6083	719	2025-07-05 14:16:49	2025-07-05 18:06:49	2025-07-05 14:16:49
6084	459	2025-09-09 08:55:09	2025-09-09 11:58:09	2025-09-09 08:55:09
6085	77	2025-05-11 16:33:02	2025-05-11 20:00:02	2025-05-11 16:33:02
6086	940	2025-06-07 18:01:31	2025-06-07 23:54:31	2025-06-07 18:01:31
6087	676	2025-05-03 16:34:01	2025-05-03 18:29:01	2025-05-03 16:34:01
6088	368	2025-10-18 04:04:39	2025-10-18 06:00:39	2025-10-18 04:04:39
6089	536	2025-09-06 15:32:02	2025-09-06 19:49:02	2025-09-06 15:32:02
6090	588	2025-10-19 11:11:27	2025-10-19 16:32:27	2025-10-19 11:11:27
6091	147	2024-12-08 16:40:13	2024-12-08 19:55:13	2024-12-08 16:40:13
6092	561	2025-04-02 16:37:48	2025-04-02 21:56:48	2025-04-02 16:37:48
6093	789	2025-06-15 05:30:54	2025-06-15 09:02:54	2025-06-15 05:30:54
6094	344	2024-12-01 17:12:44	2024-12-01 21:00:44	2024-12-01 17:12:44
6095	593	2025-01-21 16:08:02	2025-01-21 20:20:02	2025-01-21 16:08:02
6096	945	2025-07-26 17:10:28	2025-07-26 21:58:28	2025-07-26 17:10:28
6097	267	2024-11-30 15:55:23	2024-11-30 19:40:23	2024-11-30 15:55:23
6098	863	2025-04-10 16:54:06	2025-04-10 20:51:06	2025-04-10 16:54:06
6099	954	2025-10-14 15:16:47	2025-10-14 19:13:47	2025-10-14 15:16:47
6100	938	2025-06-15 17:38:16	2025-06-15 22:47:16	2025-06-15 17:38:16
6101	290	2025-06-08 04:44:15	2025-06-08 08:12:15	2025-06-08 04:44:15
6102	735	2025-02-02 11:10:08	2025-02-02 15:54:08	2025-02-02 11:10:08
6103	188	2025-04-27 14:21:16	2025-04-27 15:41:16	2025-04-27 14:21:16
6104	65	2024-12-29 18:47:42	2024-12-29 20:47:42	2024-12-29 18:47:42
6105	287	2025-02-08 17:05:54	2025-02-08 22:52:54	2025-02-08 17:05:54
6106	711	2025-08-05 15:30:27	2025-08-05 17:29:27	2025-08-05 15:30:27
6107	545	2024-12-28 16:43:04	2024-12-28 18:36:04	2024-12-28 16:43:04
6108	220	2025-10-21 16:03:43	2025-10-21 20:47:43	2025-10-21 16:03:43
6109	979	2025-02-23 19:58:23	2025-02-24 01:26:23	2025-02-23 19:58:23
6110	111	2025-06-22 17:15:21	2025-06-22 20:54:21	2025-06-22 17:15:21
6111	172	2025-07-01 17:16:53	2025-07-01 21:20:53	2025-07-01 17:16:53
6112	812	2025-04-05 09:52:38	2025-04-05 13:51:38	2025-04-05 09:52:38
6113	191	2025-08-06 06:54:30	2025-08-06 12:44:30	2025-08-06 06:54:30
6114	904	2025-07-06 15:13:38	2025-07-06 16:42:38	2025-07-06 15:13:38
6115	477	2025-06-17 18:08:21	2025-06-17 23:00:21	2025-06-17 18:08:21
6116	560	2025-03-09 16:30:21	2025-03-09 20:43:21	2025-03-09 16:30:21
6117	796	2025-08-17 12:13:05	2025-08-17 16:17:05	2025-08-17 12:13:05
6118	774	2025-01-07 16:55:25	2025-01-07 19:54:25	2025-01-07 16:55:25
6119	429	2025-03-25 17:53:28	2025-03-25 19:30:28	2025-03-25 17:53:28
6120	626	2025-04-11 15:59:42	2025-04-11 18:02:42	2025-04-11 15:59:42
6121	281	2025-03-29 19:34:31	2025-03-29 20:43:31	2025-03-29 19:34:31
6122	548	2025-10-14 15:24:24	2025-10-14 16:40:24	2025-10-14 15:24:24
6123	992	2025-09-17 14:31:24	2025-09-17 17:17:24	2025-09-17 14:31:24
6124	768	2025-05-10 15:10:30	2025-05-10 19:43:30	2025-05-10 15:10:30
6125	572	2025-01-07 16:36:19	2025-01-07 18:47:19	2025-01-07 16:36:19
6126	444	2025-03-11 15:06:06	2025-03-11 18:40:06	2025-03-11 15:06:06
6127	158	2025-04-19 12:12:02	2025-04-19 13:48:02	2025-04-19 12:12:02
6128	249	2025-08-02 17:24:35	2025-08-02 18:41:35	2025-08-02 17:24:35
6129	742	2025-04-07 15:27:36	2025-04-07 20:22:36	2025-04-07 15:27:36
6130	771	2025-04-10 16:37:12	2025-04-10 19:24:12	2025-04-10 16:37:12
6131	384	2025-09-27 14:19:36	2025-09-27 17:04:36	2025-09-27 14:19:36
6132	595	2025-01-18 16:07:10	2025-01-18 21:07:10	2025-01-18 16:07:10
6133	965	2024-12-22 14:33:15	2024-12-22 19:32:15	2024-12-22 14:33:15
6134	199	2025-08-16 21:42:01	2025-08-17 03:40:01	2025-08-16 21:42:01
6135	195	2025-03-02 11:29:43	2025-03-02 14:49:43	2025-03-02 11:29:43
6136	678	2025-03-29 17:11:30	2025-03-29 19:50:30	2025-03-29 17:11:30
6137	338	2025-04-05 07:42:44	2025-04-05 12:07:44	2025-04-05 07:42:44
6138	650	2025-07-26 07:08:02	2025-07-26 12:06:02	2025-07-26 07:08:02
6139	418	2024-12-03 15:29:19	2024-12-03 17:36:19	2024-12-03 15:29:19
6140	454	2025-08-17 17:45:58	2025-08-17 22:58:58	2025-08-17 17:45:58
6141	81	2025-06-15 04:46:38	2025-06-15 07:00:38	2025-06-15 04:46:38
6142	359	2025-10-11 16:17:24	2025-10-11 17:58:24	2025-10-11 16:17:24
6143	212	2025-10-18 14:30:19	2025-10-18 18:33:19	2025-10-18 14:30:19
6144	427	2025-05-03 16:31:58	2025-05-03 17:33:58	2025-05-03 16:31:58
6145	591	2025-07-05 18:46:52	2025-07-05 21:31:52	2025-07-05 18:46:52
6146	819	2025-06-03 16:49:25	2025-06-03 22:13:25	2025-06-03 16:49:25
6147	289	2025-04-05 05:34:32	2025-04-05 06:34:32	2025-04-05 05:34:32
6148	797	2024-11-17 19:49:30	2024-11-17 21:54:30	2024-11-17 19:49:30
6149	916	2025-07-15 17:30:36	2025-07-15 20:29:36	2025-07-15 17:30:36
6150	186	2025-01-07 15:33:37	2025-01-07 20:48:37	2025-01-07 15:33:37
6151	448	2025-08-24 10:27:40	2025-08-24 14:33:40	2025-08-24 10:27:40
6152	854	2025-04-13 05:57:07	2025-04-13 11:03:07	2025-04-13 05:57:07
6153	913	2025-02-01 19:41:27	2025-02-01 21:07:27	2025-02-01 19:41:27
6154	67	2025-05-02 16:50:37	2025-05-02 19:29:37	2025-05-02 16:50:37
6155	869	2025-09-28 15:16:48	2025-09-28 17:51:48	2025-09-28 15:16:48
6156	408	2025-06-16 17:46:45	2025-06-16 20:10:45	2025-06-16 17:46:45
6157	620	2025-06-10 15:28:09	2025-06-10 19:01:09	2025-06-10 15:28:09
6158	118	2024-12-17 17:32:34	2024-12-17 22:36:34	2024-12-17 17:32:34
6159	712	2025-02-01 17:57:13	2025-02-01 21:18:13	2025-02-01 17:57:13
6160	238	2025-02-23 15:51:51	2025-02-23 19:23:51	2025-02-23 15:51:51
6161	727	2025-11-04 17:56:59	2025-11-04 18:56:59	2025-11-04 17:56:59
6162	761	2025-06-07 16:33:31	2025-06-07 20:45:31	2025-06-07 16:33:31
6163	228	2025-01-14 15:43:11	2025-01-14 20:34:11	2025-01-14 15:43:11
6164	657	2025-09-16 15:18:43	2025-09-16 20:59:43	2025-09-16 15:18:43
6165	166	2025-02-08 16:57:22	2025-02-08 18:33:22	2025-02-08 16:57:22
6166	760	2025-10-28 07:23:20	2025-10-28 10:37:20	2025-10-28 07:23:20
6167	415	2025-01-21 17:28:47	2025-01-21 21:02:47	2025-01-21 17:28:47
6168	790	2025-08-09 16:29:59	2025-08-09 22:04:59	2025-08-09 16:29:59
6169	111	2025-08-26 14:35:39	2025-08-26 15:58:39	2025-08-26 14:35:39
6170	840	2025-10-20 18:30:16	2025-10-21 00:00:16	2025-10-20 18:30:16
6171	619	2025-10-07 14:23:04	2025-10-07 19:28:04	2025-10-07 14:23:04
6172	861	2025-05-14 10:49:50	2025-05-14 14:37:50	2025-05-14 10:49:50
6173	540	2025-05-18 18:49:44	2025-05-18 22:21:44	2025-05-18 18:49:44
6174	272	2025-04-05 17:49:56	2025-04-05 18:52:56	2025-04-05 17:49:56
6175	219	2025-01-28 17:23:52	2025-01-28 19:05:52	2025-01-28 17:23:52
6176	575	2025-09-27 16:39:54	2025-09-27 21:15:54	2025-09-27 16:39:54
6177	697	2024-12-17 19:44:42	2024-12-17 21:41:42	2024-12-17 19:44:42
6178	600	2025-10-18 17:55:38	2025-10-18 23:33:38	2025-10-18 17:55:38
6179	3	2025-02-11 15:48:57	2025-02-11 20:43:57	2025-02-11 15:48:57
6180	697	2024-11-19 15:35:55	2024-11-19 17:44:55	2024-11-19 15:35:55
6181	959	2024-12-31 18:06:53	2024-12-31 19:20:53	2024-12-31 18:06:53
6182	845	2024-12-28 17:32:49	2024-12-28 21:16:49	2024-12-28 17:32:49
6183	396	2024-12-08 13:10:29	2024-12-08 14:28:29	2024-12-08 13:10:29
6184	817	2025-01-28 19:02:46	2025-01-28 22:08:46	2025-01-28 19:02:46
6185	16	2024-11-12 19:14:57	2024-11-12 20:54:57	2024-11-12 19:14:57
6186	879	2025-07-29 16:17:42	2025-07-29 19:58:42	2025-07-29 16:17:42
6187	345	2024-12-17 17:51:53	2024-12-17 21:45:53	2024-12-17 17:51:53
6188	158	2025-02-09 19:50:10	2025-02-09 21:23:10	2025-02-09 19:50:10
6189	133	2025-03-18 14:37:52	2025-03-18 19:38:52	2025-03-18 14:37:52
6190	975	2025-11-01 15:57:15	2025-11-01 19:16:15	2025-11-01 15:57:15
6191	550	2024-12-08 16:17:45	2024-12-08 19:58:45	2024-12-08 16:17:45
6192	496	2025-05-18 15:44:22	2025-05-18 16:50:22	2025-05-18 15:44:22
6193	998	2025-10-12 17:55:11	2025-10-12 22:01:11	2025-10-12 17:55:11
6194	447	2025-10-19 16:18:59	2025-10-19 17:29:59	2025-10-19 16:18:59
6195	284	2025-09-30 15:45:54	2025-09-30 18:22:54	2025-09-30 15:45:54
6196	418	2025-02-11 15:44:59	2025-02-11 19:52:59	2025-02-11 15:44:59
6197	342	2024-12-07 17:14:42	2024-12-07 21:03:42	2024-12-07 17:14:42
6198	705	2025-10-14 18:04:35	2025-10-14 22:43:35	2025-10-14 18:04:35
6199	4	2024-11-12 17:18:24	2024-11-12 20:54:24	2024-11-12 17:18:24
6200	152	2025-10-14 16:07:10	2025-10-14 19:02:10	2025-10-14 16:07:10
6201	356	2025-05-15 15:26:54	2025-05-15 17:25:54	2025-05-15 15:26:54
6202	272	2024-11-19 16:49:17	2024-11-19 18:53:17	2024-11-19 16:49:17
6203	491	2025-08-12 10:38:58	2025-08-12 15:28:58	2025-08-12 10:38:58
6204	217	2025-03-04 15:55:16	2025-03-04 21:48:16	2025-03-04 15:55:16
6205	229	2025-08-09 16:32:34	2025-08-09 17:37:34	2025-08-09 16:32:34
6206	34	2025-10-21 15:37:42	2025-10-21 20:47:42	2025-10-21 15:37:42
6207	419	2025-05-13 07:31:53	2025-05-13 10:02:53	2025-05-13 07:31:53
6208	417	2025-10-07 04:42:25	2025-10-07 08:27:25	2025-10-07 04:42:25
6209	621	2025-07-29 16:36:35	2025-07-29 21:36:35	2025-07-29 16:36:35
6210	860	2025-11-01 17:33:28	2025-11-01 18:48:28	2025-11-01 17:33:28
6211	255	2025-03-09 16:05:29	2025-03-09 18:05:29	2025-03-09 16:05:29
6212	583	2025-07-01 18:53:28	2025-07-01 23:24:28	2025-07-01 18:53:28
6213	61	2025-06-08 16:30:52	2025-06-08 17:56:52	2025-06-08 16:30:52
6214	566	2025-07-20 07:46:54	2025-07-20 13:16:54	2025-07-20 07:46:54
6215	872	2025-04-22 15:47:00	2025-04-22 21:19:00	2025-04-22 15:47:00
6216	827	2025-09-09 16:20:33	2025-09-09 18:58:33	2025-09-09 16:20:33
6217	618	2025-02-04 17:05:19	2025-02-04 22:11:19	2025-02-04 17:05:19
6218	681	2025-01-18 15:42:17	2025-01-18 20:07:17	2025-01-18 15:42:17
6219	452	2025-08-12 15:06:51	2025-08-12 18:57:51	2025-08-12 15:06:51
6220	5	2025-01-14 15:58:22	2025-01-14 21:09:22	2025-01-14 15:58:22
6221	860	2025-06-24 18:42:43	2025-06-24 20:33:43	2025-06-24 18:42:43
6222	592	2025-07-19 04:55:11	2025-07-19 06:12:11	2025-07-19 04:55:11
6223	787	2025-06-22 16:58:14	2025-06-22 20:00:14	2025-06-22 16:58:14
6224	178	2025-10-21 15:45:51	2025-10-21 17:54:51	2025-10-21 15:45:51
6225	157	2024-12-07 16:11:26	2024-12-07 19:06:26	2024-12-07 16:11:26
6226	14	2025-05-27 15:23:35	2025-05-27 18:08:35	2025-05-27 15:23:35
6227	566	2025-09-23 16:07:45	2025-09-23 20:10:45	2025-09-23 16:07:45
6228	170	2025-05-20 14:38:19	2025-05-20 16:51:19	2025-05-20 14:38:19
6229	664	2025-09-23 12:49:32	2025-09-23 18:05:32	2025-09-23 12:49:32
6230	265	2025-06-10 16:19:00	2025-06-10 20:23:00	2025-06-10 16:19:00
6231	276	2025-06-16 14:41:09	2025-06-16 20:39:09	2025-06-16 14:41:09
6232	734	2024-12-24 16:30:12	2024-12-24 18:53:12	2024-12-24 16:30:12
6233	177	2025-08-17 14:23:31	2025-08-17 18:57:31	2025-08-17 14:23:31
6234	437	2024-11-16 06:42:48	2024-11-16 08:28:48	2024-11-16 06:42:48
6235	296	2025-02-28 15:05:09	2025-02-28 17:47:09	2025-02-28 15:05:09
6236	605	2025-04-15 16:00:53	2025-04-15 19:37:53	2025-04-15 16:00:53
6237	945	2025-07-27 15:59:03	2025-07-27 17:20:03	2025-07-27 15:59:03
6238	825	2025-09-06 12:20:24	2025-09-06 15:26:24	2025-09-06 12:20:24
6239	892	2025-03-04 15:41:00	2025-03-04 18:22:00	2025-03-04 15:41:00
6240	968	2025-05-31 20:26:02	2025-05-31 21:39:02	2025-05-31 20:26:02
6241	614	2025-01-11 17:38:52	2025-01-11 19:31:52	2025-01-11 17:38:52
6242	762	2025-09-02 14:38:23	2025-09-02 20:07:23	2025-09-02 14:38:23
6243	225	2025-03-23 16:34:01	2025-03-23 19:41:01	2025-03-23 16:34:01
6244	863	2025-05-11 14:18:36	2025-05-11 18:52:36	2025-05-11 14:18:36
6245	587	2024-12-17 11:21:28	2024-12-17 14:11:28	2024-12-17 11:21:28
6246	490	2025-10-25 14:25:46	2025-10-25 19:08:46	2025-10-25 14:25:46
6247	45	2025-03-09 19:23:58	2025-03-09 20:38:58	2025-03-09 19:23:58
6248	400	2025-09-30 16:08:36	2025-09-30 20:38:36	2025-09-30 16:08:36
6249	704	2025-06-07 17:03:31	2025-06-07 19:22:31	2025-06-07 17:03:31
6250	695	2025-09-14 14:34:25	2025-09-14 17:43:25	2025-09-14 14:34:25
6251	433	2025-04-22 16:29:19	2025-04-22 20:04:19	2025-04-22 16:29:19
6252	74	2025-07-22 16:19:08	2025-07-22 20:33:08	2025-07-22 16:19:08
6253	427	2025-09-30 16:49:42	2025-09-30 22:43:42	2025-09-30 16:49:42
6254	539	2025-08-13 15:01:06	2025-08-13 19:38:06	2025-08-13 15:01:06
6255	880	2025-03-08 15:47:44	2025-03-08 18:08:44	2025-03-08 15:47:44
6256	3	2025-03-02 12:31:28	2025-03-02 16:08:28	2025-03-02 12:31:28
6257	445	2025-03-22 17:11:50	2025-03-22 20:13:50	2025-03-22 17:11:50
6258	690	2025-06-10 14:15:49	2025-06-10 19:22:49	2025-06-10 14:15:49
6259	335	2024-12-22 16:56:55	2024-12-22 22:47:55	2024-12-22 16:56:55
6260	47	2025-03-08 18:06:53	2025-03-08 23:30:53	2025-03-08 18:06:53
6261	697	2025-04-29 15:23:08	2025-04-29 19:24:08	2025-04-29 15:23:08
6262	596	2024-12-22 18:37:33	2024-12-22 23:05:33	2024-12-22 18:37:33
6263	204	2025-05-14 16:53:34	2025-05-14 22:11:34	2025-05-14 16:53:34
6264	488	2025-02-02 15:18:28	2025-02-02 19:14:28	2025-02-02 15:18:28
6265	187	2025-09-21 14:15:59	2025-09-21 18:33:59	2025-09-21 14:15:59
6266	459	2025-10-05 15:34:28	2025-10-05 21:25:28	2025-10-05 15:34:28
6267	299	2025-06-03 15:05:53	2025-06-03 20:17:53	2025-06-03 15:05:53
6268	154	2025-11-05 15:35:02	2025-11-05 19:44:02	2025-11-05 15:35:02
6269	315	2025-07-22 14:39:19	2025-07-22 18:14:19	2025-07-22 14:39:19
6270	112	2025-07-13 15:10:07	2025-07-13 16:20:07	2025-07-13 15:10:07
6271	706	2025-10-14 14:54:23	2025-10-14 19:43:23	2025-10-14 14:54:23
6272	556	2025-10-25 16:51:17	2025-10-25 20:31:17	2025-10-25 16:51:17
6273	182	2025-03-25 15:12:35	2025-03-25 19:10:35	2025-03-25 15:12:35
6274	216	2024-12-07 15:30:29	2024-12-07 17:14:29	2024-12-07 15:30:29
6275	761	2024-12-22 15:05:11	2024-12-22 16:50:11	2024-12-22 15:05:11
6276	247	2025-03-15 17:39:45	2025-03-15 23:09:45	2025-03-15 17:39:45
6277	453	2025-10-28 16:08:51	2025-10-28 17:22:51	2025-10-28 16:08:51
6278	472	2025-05-03 18:56:50	2025-05-03 19:56:50	2025-05-03 18:56:50
6279	920	2025-10-26 19:18:46	2025-10-26 20:26:46	2025-10-26 19:18:46
6280	565	2025-03-31 17:13:05	2025-03-31 22:19:05	2025-03-31 17:13:05
6281	918	2025-04-10 17:06:43	2025-04-10 19:09:43	2025-04-10 17:06:43
6282	293	2025-05-18 13:46:24	2025-05-18 17:11:24	2025-05-18 13:46:24
6283	540	2025-04-22 16:05:31	2025-04-22 18:52:31	2025-04-22 16:05:31
6284	729	2025-08-26 19:24:18	2025-08-26 23:04:18	2025-08-26 19:24:18
6285	5	2025-08-17 16:25:44	2025-08-17 21:52:44	2025-08-17 16:25:44
6286	197	2024-12-15 17:40:40	2024-12-15 22:48:40	2024-12-15 17:40:40
6287	680	2025-06-07 18:05:38	2025-06-07 22:43:38	2025-06-07 18:05:38
6288	230	2025-10-14 06:13:32	2025-10-14 08:40:32	2025-10-14 06:13:32
6289	645	2025-03-16 18:37:26	2025-03-16 20:48:26	2025-03-16 18:37:26
6290	809	2025-05-10 14:11:44	2025-05-10 17:11:44	2025-05-10 14:11:44
6291	395	2025-09-21 07:25:53	2025-09-21 11:15:53	2025-09-21 07:25:53
6292	255	2025-06-29 08:04:17	2025-06-29 09:31:17	2025-06-29 08:04:17
6293	100	2025-11-04 09:24:55	2025-11-04 15:10:55	2025-11-04 09:24:55
6294	844	2025-03-31 14:46:25	2025-03-31 19:00:25	2025-03-31 14:46:25
6295	622	2025-10-05 15:22:04	2025-10-05 16:46:04	2025-10-05 15:22:04
6296	422	2024-12-31 19:49:39	2024-12-31 21:34:39	2024-12-31 19:49:39
6297	227	2025-02-04 15:57:52	2025-02-04 21:08:52	2025-02-04 15:57:52
6298	6	2025-11-01 16:55:18	2025-11-01 20:08:18	2025-11-01 16:55:18
6299	28	2025-05-10 17:25:36	2025-05-10 22:28:36	2025-05-10 17:25:36
6300	665	2024-11-16 17:04:05	2024-11-16 19:45:05	2024-11-16 17:04:05
6301	989	2025-03-15 18:52:51	2025-03-15 20:52:51	2025-03-15 18:52:51
6302	693	2025-05-20 06:57:49	2025-05-20 11:46:49	2025-05-20 06:57:49
6303	470	2025-10-04 11:52:52	2025-10-04 16:31:52	2025-10-04 11:52:52
6304	689	2025-05-22 13:21:23	2025-05-22 15:14:23	2025-05-22 13:21:23
6305	694	2025-10-04 16:37:02	2025-10-04 18:47:02	2025-10-04 16:37:02
6306	847	2025-10-21 11:55:17	2025-10-21 14:15:17	2025-10-21 11:55:17
6307	255	2025-02-18 18:35:35	2025-02-18 21:03:35	2025-02-18 18:35:35
6308	973	2025-07-08 14:59:05	2025-07-08 16:18:05	2025-07-08 14:59:05
6309	378	2024-12-07 11:34:20	2024-12-07 15:51:20	2024-12-07 11:34:20
6310	527	2025-07-12 22:39:50	2025-07-13 00:25:50	2025-07-12 22:39:50
6311	60	2025-08-10 18:13:23	2025-08-10 19:57:23	2025-08-10 18:13:23
6312	630	2025-08-17 16:10:41	2025-08-17 18:45:41	2025-08-17 16:10:41
6313	249	2025-02-10 15:21:44	2025-02-10 18:06:44	2025-02-10 15:21:44
6314	15	2025-03-16 17:19:18	2025-03-16 20:55:18	2025-03-16 17:19:18
6315	148	2025-09-23 14:12:21	2025-09-23 15:41:21	2025-09-23 14:12:21
6316	164	2024-12-08 16:57:58	2024-12-08 20:50:58	2024-12-08 16:57:58
6317	646	2025-08-05 14:48:55	2025-08-05 18:14:55	2025-08-05 14:48:55
6318	872	2025-07-15 16:39:30	2025-07-15 19:17:30	2025-07-15 16:39:30
6319	144	2025-08-30 16:23:47	2025-08-30 19:59:47	2025-08-30 16:23:47
6320	254	2025-04-22 18:04:15	2025-04-22 19:51:15	2025-04-22 18:04:15
6321	398	2025-03-04 15:08:58	2025-03-04 18:41:58	2025-03-04 15:08:58
6322	686	2025-02-04 16:29:58	2025-02-04 20:12:58	2025-02-04 16:29:58
6323	843	2025-10-14 14:00:06	2025-10-14 18:11:06	2025-10-14 14:00:06
6324	847	2025-10-07 16:58:04	2025-10-07 19:32:04	2025-10-07 16:58:04
6325	397	2025-08-12 16:04:58	2025-08-12 21:09:58	2025-08-12 16:04:58
6326	564	2025-02-01 13:04:08	2025-02-01 16:57:08	2025-02-01 13:04:08
6327	800	2025-04-01 14:45:40	2025-04-01 19:14:40	2025-04-01 14:45:40
6328	182	2025-04-29 16:18:36	2025-04-29 20:40:36	2025-04-29 16:18:36
6329	662	2024-12-10 17:46:16	2024-12-10 22:04:16	2024-12-10 17:46:16
6330	779	2025-01-09 17:57:05	2025-01-09 22:42:05	2025-01-09 17:57:05
6331	522	2025-09-09 10:35:20	2025-09-09 16:24:20	2025-09-09 10:35:20
6332	102	2025-09-28 16:41:37	2025-09-28 20:37:37	2025-09-28 16:41:37
6333	140	2025-10-20 14:46:41	2025-10-20 19:12:41	2025-10-20 14:46:41
6334	188	2025-08-10 17:14:07	2025-08-10 22:06:07	2025-08-10 17:14:07
6335	444	2025-02-16 17:16:54	2025-02-16 20:34:54	2025-02-16 17:16:54
6336	972	2024-11-30 16:58:48	2024-11-30 22:46:48	2024-11-30 16:58:48
6337	63	2025-10-18 15:22:57	2025-10-18 19:49:57	2025-10-18 15:22:57
6338	131	2024-12-22 15:35:16	2024-12-22 18:24:16	2024-12-22 15:35:16
6339	922	2024-11-17 16:56:42	2024-11-17 18:43:42	2024-11-17 16:56:42
6340	125	2024-12-24 17:52:30	2024-12-24 20:34:30	2024-12-24 17:52:30
6341	487	2025-03-02 21:34:09	2025-03-02 23:37:09	2025-03-02 21:34:09
6342	470	2025-02-03 04:22:43	2025-02-03 06:11:43	2025-02-03 04:22:43
6343	567	2025-08-16 10:23:46	2025-08-16 11:34:46	2025-08-16 10:23:46
6344	129	2025-08-17 15:31:57	2025-08-17 19:48:57	2025-08-17 15:31:57
6345	339	2025-01-21 16:51:40	2025-01-21 21:11:40	2025-01-21 16:51:40
6346	548	2024-11-13 18:42:46	2024-11-13 23:12:46	2024-11-13 18:42:46
6347	800	2024-12-09 17:39:07	2024-12-09 18:46:07	2024-12-09 17:39:07
6348	227	2025-02-07 23:44:43	2025-02-08 02:08:43	2025-02-07 23:44:43
6349	599	2024-12-21 04:45:01	2024-12-21 09:59:01	2024-12-21 04:45:01
6350	907	2025-03-11 15:21:43	2025-03-11 17:56:43	2025-03-11 15:21:43
6351	11	2025-04-13 14:28:23	2025-04-13 17:14:23	2025-04-13 14:28:23
6352	339	2025-10-18 18:14:01	2025-10-18 21:28:01	2025-10-18 18:14:01
6353	603	2025-08-03 15:57:52	2025-08-03 19:56:52	2025-08-03 15:57:52
6354	405	2025-06-29 04:10:49	2025-06-29 09:08:49	2025-06-29 04:10:49
6355	678	2024-11-12 16:04:27	2024-11-12 20:30:27	2024-11-12 16:04:27
6356	231	2024-12-28 15:28:25	2024-12-28 20:34:25	2024-12-28 15:28:25
6357	539	2025-10-07 15:47:42	2025-10-07 20:00:42	2025-10-07 15:47:42
6358	877	2025-03-11 17:32:37	2025-03-11 23:17:37	2025-03-11 17:32:37
6359	743	2025-01-07 19:44:01	2025-01-08 01:27:01	2025-01-07 19:44:01
6360	566	2025-08-14 14:28:04	2025-08-14 15:33:04	2025-08-14 14:28:04
6361	873	2025-08-12 18:29:07	2025-08-12 20:53:07	2025-08-12 18:29:07
6362	263	2025-04-20 14:14:59	2025-04-20 15:25:59	2025-04-20 14:14:59
6363	930	2024-11-19 16:21:02	2024-11-19 17:50:02	2024-11-19 16:21:02
6364	155	2025-09-27 16:06:39	2025-09-27 21:04:39	2025-09-27 16:06:39
6365	929	2025-04-13 16:01:34	2025-04-13 17:44:34	2025-04-13 16:01:34
6366	622	2025-10-21 09:48:54	2025-10-21 15:12:54	2025-10-21 09:48:54
6367	937	2025-10-11 20:11:00	2025-10-12 01:03:00	2025-10-11 20:11:00
6368	178	2025-07-16 12:01:52	2025-07-16 16:33:52	2025-07-16 12:01:52
6369	848	2025-01-26 17:45:41	2025-01-26 23:03:41	2025-01-26 17:45:41
6370	834	2024-12-15 23:38:46	2024-12-16 01:04:46	2024-12-15 23:38:46
6371	426	2025-07-24 08:30:06	2025-07-24 12:07:06	2025-07-24 08:30:06
6372	609	2025-01-14 16:44:50	2025-01-14 20:58:50	2025-01-14 16:44:50
6373	654	2025-07-08 14:36:05	2025-07-08 17:58:05	2025-07-08 14:36:05
6374	518	2025-10-11 03:34:25	2025-10-11 06:18:25	2025-10-11 03:34:25
6375	997	2024-11-30 15:21:46	2024-11-30 16:54:46	2024-11-30 15:21:46
6376	269	2025-09-09 18:59:40	2025-09-09 20:18:40	2025-09-09 18:59:40
6377	933	2024-11-12 05:14:31	2024-11-12 10:58:31	2024-11-12 05:14:31
6378	371	2025-02-09 15:54:19	2025-02-09 17:35:19	2025-02-09 15:54:19
6379	104	2025-08-26 14:09:49	2025-08-26 18:28:49	2025-08-26 14:09:49
6380	622	2025-03-25 15:46:42	2025-03-25 21:10:42	2025-03-25 15:46:42
6381	823	2025-06-17 15:25:51	2025-06-17 17:34:51	2025-06-17 15:25:51
6382	619	2025-02-23 15:28:37	2025-02-23 17:09:37	2025-02-23 15:28:37
6383	939	2024-11-30 17:42:27	2024-11-30 19:14:27	2024-11-30 17:42:27
6384	460	2025-10-21 15:44:08	2025-10-21 20:55:08	2025-10-21 15:44:08
6385	65	2024-12-15 17:56:02	2024-12-15 21:46:02	2024-12-15 17:56:02
6386	838	2025-01-14 16:40:32	2025-01-14 18:14:32	2025-01-14 16:40:32
6387	759	2025-06-21 15:28:47	2025-06-21 18:49:47	2025-06-21 15:28:47
6388	368	2025-06-24 14:16:08	2025-06-24 17:27:08	2025-06-24 14:16:08
6389	933	2025-09-16 11:58:57	2025-09-16 16:31:57	2025-09-16 11:58:57
6390	218	2025-04-07 14:06:30	2025-04-07 19:41:30	2025-04-07 14:06:30
6391	390	2025-02-15 08:00:35	2025-02-15 12:20:35	2025-02-15 08:00:35
6392	590	2025-02-16 19:12:50	2025-02-16 22:40:50	2025-02-16 19:12:50
6393	758	2024-12-10 15:05:25	2024-12-10 16:32:25	2024-12-10 15:05:25
6394	646	2025-09-30 16:11:45	2025-09-30 17:39:45	2025-09-30 16:11:45
6395	294	2025-07-11 07:53:18	2025-07-11 10:09:18	2025-07-11 07:53:18
6396	432	2025-07-01 06:54:01	2025-07-01 11:47:01	2025-07-01 06:54:01
6397	631	2025-06-17 09:28:35	2025-06-17 13:19:35	2025-06-17 09:28:35
6398	951	2025-06-15 04:32:24	2025-06-15 09:28:24	2025-06-15 04:32:24
6399	916	2025-09-13 06:41:40	2025-09-13 11:57:40	2025-09-13 06:41:40
6400	32	2025-11-02 15:39:04	2025-11-02 18:21:04	2025-11-02 15:39:04
6401	868	2025-04-10 06:21:27	2025-04-10 10:15:27	2025-04-10 06:21:27
6402	11	2025-03-22 15:38:42	2025-03-22 16:53:42	2025-03-22 15:38:42
6403	530	2025-03-15 17:02:11	2025-03-15 20:10:11	2025-03-15 17:02:11
6404	408	2025-11-02 19:56:20	2025-11-02 23:02:20	2025-11-02 19:56:20
6405	785	2025-08-27 16:06:00	2025-08-27 17:50:00	2025-08-27 16:06:00
6406	581	2024-12-01 17:35:08	2024-12-01 18:45:08	2024-12-01 17:35:08
6407	68	2025-04-19 14:04:18	2025-04-19 20:03:18	2025-04-19 14:04:18
6408	388	2025-10-25 14:33:54	2025-10-25 19:46:54	2025-10-25 14:33:54
6409	106	2025-02-02 17:29:33	2025-02-02 22:40:33	2025-02-02 17:29:33
6410	331	2025-06-24 16:29:16	2025-06-24 18:06:16	2025-06-24 16:29:16
6411	669	2025-01-14 02:22:52	2025-01-14 03:40:52	2025-01-14 02:22:52
6412	751	2025-10-14 14:13:04	2025-10-14 20:05:04	2025-10-14 14:13:04
6413	994	2025-06-07 16:19:53	2025-06-07 17:34:53	2025-06-07 16:19:53
6414	604	2025-01-05 17:09:47	2025-01-05 18:49:47	2025-01-05 17:09:47
6415	279	2025-03-09 19:25:36	2025-03-09 20:48:36	2025-03-09 19:25:36
6416	429	2025-01-07 17:15:19	2025-01-07 22:37:19	2025-01-07 17:15:19
6417	74	2025-05-03 16:52:57	2025-05-03 20:57:57	2025-05-03 16:52:57
6418	358	2025-07-25 16:25:50	2025-07-25 21:59:50	2025-07-25 16:25:50
6419	680	2025-04-01 15:26:06	2025-04-01 17:07:06	2025-04-01 15:26:06
6420	271	2025-04-12 14:21:17	2025-04-12 16:06:17	2025-04-12 14:21:17
6421	100	2025-07-05 15:32:19	2025-07-05 18:54:19	2025-07-05 15:32:19
6422	610	2024-11-16 17:29:56	2024-11-16 21:44:56	2024-11-16 17:29:56
6423	275	2025-05-21 15:08:03	2025-05-21 17:24:03	2025-05-21 15:08:03
6424	175	2025-02-16 16:04:37	2025-02-16 19:27:37	2025-02-16 16:04:37
6425	878	2025-06-03 18:33:26	2025-06-03 21:49:26	2025-06-03 18:33:26
6426	503	2025-10-26 15:39:41	2025-10-26 17:55:41	2025-10-26 15:39:41
6427	648	2025-04-12 19:11:14	2025-04-12 23:51:14	2025-04-12 19:11:14
6428	174	2025-10-07 17:09:48	2025-10-07 21:20:48	2025-10-07 17:09:48
6429	554	2025-01-04 19:34:03	2025-01-04 22:13:03	2025-01-04 19:34:03
6430	75	2025-02-16 16:51:51	2025-02-16 20:16:51	2025-02-16 16:51:51
6431	241	2025-02-22 06:26:29	2025-02-22 09:19:29	2025-02-22 06:26:29
6432	904	2025-02-15 15:40:21	2025-02-15 21:34:21	2025-02-15 15:40:21
6433	257	2025-09-13 14:27:19	2025-09-13 16:49:19	2025-09-13 14:27:19
6434	228	2025-07-13 14:52:17	2025-07-13 16:18:17	2025-07-13 14:52:17
6435	902	2025-08-03 16:40:34	2025-08-03 22:17:34	2025-08-03 16:40:34
6436	644	2025-09-07 14:31:03	2025-09-07 17:33:03	2025-09-07 14:31:03
6437	849	2025-03-18 16:53:51	2025-03-18 20:15:51	2025-03-18 16:53:51
6438	159	2025-05-06 16:20:45	2025-05-06 18:53:45	2025-05-06 16:20:45
6439	570	2025-04-01 16:25:36	2025-04-01 19:36:36	2025-04-01 16:25:36
6440	366	2025-05-20 14:07:28	2025-05-20 17:28:28	2025-05-20 14:07:28
6441	931	2025-02-01 17:58:44	2025-02-01 22:11:44	2025-02-01 17:58:44
6442	616	2024-12-05 16:14:03	2024-12-05 18:52:03	2024-12-05 16:14:03
6443	960	2025-04-05 18:19:23	2025-04-05 23:40:23	2025-04-05 18:19:23
6444	715	2025-02-25 18:09:09	2025-02-25 21:20:09	2025-02-25 18:09:09
6445	353	2025-09-09 18:48:05	2025-09-09 23:11:05	2025-09-09 18:48:05
6446	324	2024-12-31 15:02:06	2024-12-31 18:42:06	2024-12-31 15:02:06
6447	265	2025-06-29 16:13:03	2025-06-29 19:08:03	2025-06-29 16:13:03
6448	571	2024-12-29 12:13:45	2024-12-29 14:40:45	2024-12-29 12:13:45
6449	301	2025-10-01 14:44:35	2025-10-01 16:32:35	2025-10-01 14:44:35
6450	677	2025-08-12 11:02:11	2025-08-12 13:57:11	2025-08-12 11:02:11
6451	202	2024-11-26 15:52:32	2024-11-26 20:22:32	2024-11-26 15:52:32
6452	332	2025-03-22 21:16:05	2025-03-23 01:43:05	2025-03-22 21:16:05
6453	599	2025-04-05 16:28:29	2025-04-05 21:54:29	2025-04-05 16:28:29
6454	318	2025-05-17 15:08:02	2025-05-17 19:40:02	2025-05-17 15:08:02
6455	133	2025-10-14 14:18:41	2025-10-14 17:41:41	2025-10-14 14:18:41
6456	683	2025-03-02 19:10:07	2025-03-02 23:38:07	2025-03-02 19:10:07
6457	822	2024-12-17 14:30:53	2024-12-17 19:40:53	2024-12-17 14:30:53
6458	291	2025-09-30 16:40:57	2025-09-30 19:01:57	2025-09-30 16:40:57
6459	239	2025-07-12 03:39:28	2025-07-12 05:04:28	2025-07-12 03:39:28
6460	563	2025-04-19 15:52:51	2025-04-19 19:36:51	2025-04-19 15:52:51
6461	891	2025-02-09 06:50:24	2025-02-09 08:14:24	2025-02-09 06:50:24
6462	336	2025-05-03 18:42:55	2025-05-03 20:21:55	2025-05-03 18:42:55
6463	640	2025-06-30 11:42:15	2025-06-30 17:01:15	2025-06-30 11:42:15
6464	385	2025-10-12 13:10:27	2025-10-12 16:53:27	2025-10-12 13:10:27
6465	89	2025-05-18 15:26:27	2025-05-18 18:22:27	2025-05-18 15:26:27
6466	681	2025-09-30 10:35:11	2025-09-30 13:55:11	2025-09-30 10:35:11
6467	391	2025-07-29 17:37:26	2025-07-29 19:44:26	2025-07-29 17:37:26
6468	57	2024-12-14 16:19:00	2024-12-14 17:55:00	2024-12-14 16:19:00
6469	561	2025-09-13 17:27:51	2025-09-13 21:04:51	2025-09-13 17:27:51
6470	803	2025-08-30 16:36:59	2025-08-30 17:37:59	2025-08-30 16:36:59
6471	508	2025-04-12 14:43:58	2025-04-12 16:58:58	2025-04-12 14:43:58
6472	692	2025-05-06 01:39:15	2025-05-06 06:58:15	2025-05-06 01:39:15
6473	837	2025-11-02 16:24:06	2025-11-02 18:19:06	2025-11-02 16:24:06
6474	874	2025-01-22 16:36:00	2025-01-22 21:12:00	2025-01-22 16:36:00
6475	772	2025-09-01 18:02:51	2025-09-01 21:30:51	2025-09-01 18:02:51
6476	443	2025-01-27 17:07:39	2025-01-27 21:41:39	2025-01-27 17:07:39
6477	664	2025-07-04 16:22:48	2025-07-04 17:38:48	2025-07-04 16:22:48
6478	44	2025-02-25 16:49:50	2025-02-25 19:53:50	2025-02-25 16:49:50
6479	84	2025-09-30 14:59:58	2025-09-30 19:51:58	2025-09-30 14:59:58
6480	346	2024-11-19 15:08:18	2024-11-19 18:11:18	2024-11-19 15:08:18
6481	719	2025-06-10 16:54:00	2025-06-10 21:20:00	2025-06-10 16:54:00
6482	340	2025-08-08 22:52:28	2025-08-09 03:46:28	2025-08-08 22:52:28
6483	810	2025-04-01 20:37:28	2025-04-01 22:35:28	2025-04-01 20:37:28
6484	220	2024-12-14 12:46:48	2024-12-14 14:06:48	2024-12-14 12:46:48
6485	57	2025-09-06 15:59:31	2025-09-06 18:36:31	2025-09-06 15:59:31
6486	407	2025-03-08 17:12:14	2025-03-08 20:33:14	2025-03-08 17:12:14
6487	878	2025-10-19 04:00:51	2025-10-19 07:01:51	2025-10-19 04:00:51
6488	529	2025-11-01 16:00:58	2025-11-01 20:36:58	2025-11-01 16:00:58
6489	194	2024-12-11 17:16:38	2024-12-11 22:24:38	2024-12-11 17:16:38
6490	889	2024-11-24 15:22:13	2024-11-24 20:07:13	2024-11-24 15:22:13
6491	531	2025-10-05 17:10:11	2025-10-05 22:13:11	2025-10-05 17:10:11
6492	382	2025-05-04 17:26:23	2025-05-04 21:21:23	2025-05-04 17:26:23
6493	276	2025-01-21 15:51:42	2025-01-21 21:14:42	2025-01-21 15:51:42
6494	786	2025-07-22 10:26:22	2025-07-22 14:41:22	2025-07-22 10:26:22
6495	700	2025-09-13 14:17:28	2025-09-13 16:14:28	2025-09-13 14:17:28
6496	4	2025-06-08 14:37:27	2025-06-08 16:40:27	2025-06-08 14:37:27
6497	334	2025-08-17 13:39:11	2025-08-17 15:33:11	2025-08-17 13:39:11
6498	101	2025-08-02 15:10:11	2025-08-02 17:11:11	2025-08-02 15:10:11
6499	290	2025-10-28 15:42:42	2025-10-28 20:38:42	2025-10-28 15:42:42
6500	116	2025-09-02 16:06:31	2025-09-02 21:12:31	2025-09-02 16:06:31
6501	224	2025-02-25 05:50:11	2025-02-25 11:40:11	2025-02-25 05:50:11
6502	46	2024-11-23 06:54:09	2024-11-23 07:59:09	2024-11-23 06:54:09
6503	572	2024-12-10 16:42:01	2024-12-10 19:10:01	2024-12-10 16:42:01
6504	794	2025-02-09 16:15:14	2025-02-09 18:35:14	2025-02-09 16:15:14
6505	613	2024-12-26 16:59:00	2024-12-26 20:20:00	2024-12-26 16:59:00
6506	915	2025-09-23 14:37:49	2025-09-23 18:11:49	2025-09-23 14:37:49
6507	486	2024-12-26 17:14:07	2024-12-26 20:03:07	2024-12-26 17:14:07
6508	20	2025-08-26 15:36:37	2025-08-26 17:35:37	2025-08-26 15:36:37
6509	853	2025-09-20 17:57:24	2025-09-20 23:52:24	2025-09-20 17:57:24
6510	357	2025-03-17 15:23:17	2025-03-17 16:33:17	2025-03-17 15:23:17
6511	960	2025-09-30 17:14:43	2025-09-30 22:33:43	2025-09-30 17:14:43
6512	321	2025-10-17 14:32:34	2025-10-17 17:23:34	2025-10-17 14:32:34
6513	733	2025-10-18 15:13:27	2025-10-18 19:19:27	2025-10-18 15:13:27
6514	131	2025-05-13 16:44:47	2025-05-13 22:33:47	2025-05-13 16:44:47
6515	269	2025-09-28 03:10:54	2025-09-28 04:58:54	2025-09-28 03:10:54
6516	302	2025-07-08 16:56:27	2025-07-08 21:58:27	2025-07-08 16:56:27
6517	111	2025-09-14 17:55:39	2025-09-14 23:40:39	2025-09-14 17:55:39
6518	884	2025-05-18 15:18:13	2025-05-18 16:35:13	2025-05-18 15:18:13
6519	34	2025-06-10 16:31:03	2025-06-10 18:47:03	2025-06-10 16:31:03
6520	861	2025-10-13 15:48:34	2025-10-13 18:40:34	2025-10-13 15:48:34
6521	448	2025-09-07 15:49:36	2025-09-07 18:18:36	2025-09-07 15:49:36
6522	891	2024-12-21 15:13:07	2024-12-21 17:42:07	2024-12-21 15:13:07
6523	668	2025-09-06 14:48:41	2025-09-06 17:18:41	2025-09-06 14:48:41
6524	310	2025-08-26 14:16:42	2025-08-26 15:38:42	2025-08-26 14:16:42
6525	967	2025-08-05 18:40:23	2025-08-05 23:04:23	2025-08-05 18:40:23
6526	351	2025-01-04 15:39:18	2025-01-04 19:54:18	2025-01-04 15:39:18
6527	288	2025-09-30 04:51:01	2025-09-30 08:35:01	2025-09-30 04:51:01
6528	383	2025-06-27 11:22:31	2025-06-27 13:26:31	2025-06-27 11:22:31
6529	425	2025-10-25 15:42:22	2025-10-25 19:08:22	2025-10-25 15:42:22
6530	768	2025-06-03 09:30:54	2025-06-03 12:49:54	2025-06-03 09:30:54
6531	574	2025-08-03 04:53:39	2025-08-03 09:35:39	2025-08-03 04:53:39
6532	366	2025-10-26 14:57:20	2025-10-26 16:31:20	2025-10-26 14:57:20
6533	882	2025-04-15 18:29:16	2025-04-15 21:05:16	2025-04-15 18:29:16
6534	517	2024-12-08 17:11:25	2024-12-08 20:51:25	2024-12-08 17:11:25
6535	524	2025-04-01 17:08:27	2025-04-01 18:39:27	2025-04-01 17:08:27
6536	792	2025-09-14 14:55:50	2025-09-14 19:39:50	2025-09-14 14:55:50
6537	24	2025-07-22 06:18:22	2025-07-22 09:41:22	2025-07-22 06:18:22
6538	570	2024-12-31 15:44:59	2024-12-31 18:38:59	2024-12-31 15:44:59
6539	26	2024-12-22 16:30:01	2024-12-22 20:57:01	2024-12-22 16:30:01
6540	622	2025-05-13 14:58:57	2025-05-13 19:27:57	2025-05-13 14:58:57
6541	323	2025-06-08 15:23:21	2025-06-08 21:21:21	2025-06-08 15:23:21
6542	866	2025-08-02 09:31:51	2025-08-02 10:52:51	2025-08-02 09:31:51
6543	429	2025-07-19 05:02:21	2025-07-19 08:56:21	2025-07-19 05:02:21
6544	602	2025-07-22 14:23:34	2025-07-22 19:23:34	2025-07-22 14:23:34
6545	138	2025-05-27 15:13:13	2025-05-27 16:26:13	2025-05-27 15:13:13
6546	271	2025-07-20 09:40:12	2025-07-20 15:04:12	2025-07-20 09:40:12
6547	353	2025-09-16 16:46:49	2025-09-16 19:29:49	2025-09-16 16:46:49
6548	71	2025-07-29 15:43:45	2025-07-29 20:26:45	2025-07-29 15:43:45
6549	54	2025-05-06 17:24:46	2025-05-06 19:19:46	2025-05-06 17:24:46
6550	344	2025-02-02 18:15:36	2025-02-02 21:15:36	2025-02-02 18:15:36
6551	882	2024-12-24 15:38:51	2024-12-24 20:43:51	2024-12-24 15:38:51
6552	723	2025-06-24 08:30:16	2025-06-24 12:26:16	2025-06-24 08:30:16
6553	963	2024-12-28 17:53:16	2024-12-28 22:35:16	2024-12-28 17:53:16
6554	630	2025-08-24 06:42:31	2025-08-24 09:33:31	2025-08-24 06:42:31
6555	688	2025-06-03 15:38:07	2025-06-03 17:54:07	2025-06-03 15:38:07
6556	584	2025-04-15 17:46:34	2025-04-15 20:07:34	2025-04-15 17:46:34
6557	523	2025-02-04 16:09:48	2025-02-04 18:33:48	2025-02-04 16:09:48
6558	169	2025-08-24 14:39:28	2025-08-24 20:38:28	2025-08-24 14:39:28
6559	340	2025-06-08 15:05:31	2025-06-08 18:32:31	2025-06-08 15:05:31
6560	653	2025-06-22 15:20:31	2025-06-22 17:18:31	2025-06-22 15:20:31
6561	941	2025-06-22 16:01:49	2025-06-22 19:01:49	2025-06-22 16:01:49
6562	130	2024-12-10 17:52:03	2024-12-10 21:25:03	2024-12-10 17:52:03
6563	530	2025-09-23 15:12:41	2025-09-23 19:23:41	2025-09-23 15:12:41
6564	557	2024-12-10 16:12:19	2024-12-10 22:03:19	2024-12-10 16:12:19
6565	441	2025-06-22 18:39:28	2025-06-22 20:33:28	2025-06-22 18:39:28
6566	567	2025-02-01 15:30:52	2025-02-01 18:42:52	2025-02-01 15:30:52
6567	366	2025-06-28 15:22:42	2025-06-28 18:59:42	2025-06-28 15:22:42
6568	398	2025-05-10 01:32:32	2025-05-10 03:33:32	2025-05-10 01:32:32
6569	882	2025-01-01 16:39:26	2025-01-01 18:54:26	2025-01-01 16:39:26
6570	624	2024-12-21 16:23:05	2024-12-21 20:32:05	2024-12-21 16:23:05
6571	148	2025-03-16 16:00:09	2025-03-16 20:59:09	2025-03-16 16:00:09
6572	849	2024-11-12 15:52:32	2024-11-12 17:52:32	2024-11-12 15:52:32
6573	719	2025-04-22 16:58:35	2025-04-22 18:22:35	2025-04-22 16:58:35
6574	778	2025-02-09 16:03:35	2025-02-09 18:08:35	2025-02-09 16:03:35
6575	844	2025-05-10 14:30:40	2025-05-10 15:48:40	2025-05-10 14:30:40
6576	734	2025-11-03 06:03:57	2025-11-03 10:05:57	2025-11-03 06:03:57
6577	34	2025-05-20 15:51:32	2025-05-20 19:41:32	2025-05-20 15:51:32
6578	843	2025-05-25 15:00:47	2025-05-25 19:29:47	2025-05-25 15:00:47
6579	267	2025-09-13 16:31:28	2025-09-13 20:22:28	2025-09-13 16:31:28
6580	918	2025-04-22 16:12:01	2025-04-22 20:42:01	2025-04-22 16:12:01
6581	303	2025-02-11 15:35:00	2025-02-11 17:12:00	2025-02-11 15:35:00
6582	188	2024-11-30 09:19:46	2024-11-30 13:43:46	2024-11-30 09:19:46
6583	72	2025-10-18 18:09:35	2025-10-18 22:26:35	2025-10-18 18:09:35
6584	283	2025-02-01 16:31:38	2025-02-01 21:19:38	2025-02-01 16:31:38
6585	85	2025-08-12 16:36:49	2025-08-12 21:19:49	2025-08-12 16:36:49
6586	460	2025-01-04 15:23:12	2025-01-04 20:24:12	2025-01-04 15:23:12
6587	485	2025-01-14 18:12:24	2025-01-14 23:12:24	2025-01-14 18:12:24
6588	792	2025-03-04 11:10:38	2025-03-04 15:11:38	2025-03-04 11:10:38
6589	804	2025-05-13 14:30:36	2025-05-13 16:25:36	2025-05-13 14:30:36
6590	458	2025-01-19 11:04:49	2025-01-19 15:16:49	2025-01-19 11:04:49
6591	388	2025-04-20 17:01:04	2025-04-20 20:08:04	2025-04-20 17:01:04
6592	13	2025-09-23 14:19:14	2025-09-23 18:27:14	2025-09-23 14:19:14
6593	121	2024-12-25 15:31:17	2024-12-25 20:32:17	2024-12-25 15:31:17
6594	717	2025-02-09 15:30:23	2025-02-09 17:02:23	2025-02-09 15:30:23
6595	299	2024-12-28 02:43:21	2024-12-28 04:03:21	2024-12-28 02:43:21
6596	393	2025-05-11 15:28:24	2025-05-11 18:03:24	2025-05-11 15:28:24
6597	881	2025-10-05 14:07:20	2025-10-05 16:51:20	2025-10-05 14:07:20
6598	544	2025-05-31 16:33:13	2025-05-31 17:36:13	2025-05-31 16:33:13
6599	272	2025-01-11 20:30:10	2025-01-12 00:33:10	2025-01-11 20:30:10
6600	601	2025-08-19 16:46:30	2025-08-19 18:58:30	2025-08-19 16:46:30
6601	81	2025-02-23 11:02:37	2025-02-23 13:24:37	2025-02-23 11:02:37
6602	514	2025-07-01 16:45:24	2025-07-01 19:00:24	2025-07-01 16:45:24
6603	144	2025-09-21 16:49:08	2025-09-21 20:53:08	2025-09-21 16:49:08
6604	446	2024-12-03 16:22:26	2024-12-03 21:23:26	2024-12-03 16:22:26
6605	588	2024-11-19 16:11:34	2024-11-19 17:13:34	2024-11-19 16:11:34
6606	670	2025-09-02 15:41:31	2025-09-02 20:41:31	2025-09-02 15:41:31
6607	460	2025-02-04 17:00:58	2025-02-04 21:59:58	2025-02-04 17:00:58
6608	890	2025-05-29 15:16:22	2025-05-29 17:06:22	2025-05-29 15:16:22
6609	413	2025-10-12 15:15:42	2025-10-12 20:01:42	2025-10-12 15:15:42
6610	80	2025-04-05 16:03:24	2025-04-05 21:42:24	2025-04-05 16:03:24
6611	348	2025-10-28 14:42:24	2025-10-28 18:15:24	2025-10-28 14:42:24
6612	41	2025-08-05 14:10:44	2025-08-05 16:02:44	2025-08-05 14:10:44
6613	964	2025-09-30 18:00:11	2025-09-30 19:17:11	2025-09-30 18:00:11
6614	772	2025-01-11 18:51:01	2025-01-11 22:37:01	2025-01-11 18:51:01
6615	624	2025-10-26 15:22:58	2025-10-26 19:07:58	2025-10-26 15:22:58
6616	522	2025-11-01 16:35:58	2025-11-01 18:50:58	2025-11-01 16:35:58
6617	582	2025-07-26 16:38:03	2025-07-26 20:18:03	2025-07-26 16:38:03
6618	250	2025-01-14 17:11:57	2025-01-14 18:37:57	2025-01-14 17:11:57
6619	142	2025-04-12 14:17:18	2025-04-12 19:20:18	2025-04-12 14:17:18
6620	466	2024-11-16 07:42:58	2024-11-16 11:50:58	2024-11-16 07:42:58
6621	173	2025-01-28 16:42:41	2025-01-28 17:58:41	2025-01-28 16:42:41
6622	193	2025-09-02 13:05:26	2025-09-02 17:37:26	2025-09-02 13:05:26
6623	696	2025-06-14 17:08:41	2025-06-14 18:33:41	2025-06-14 17:08:41
6624	734	2025-10-25 14:37:37	2025-10-25 20:04:37	2025-10-25 14:37:37
6625	491	2025-02-13 08:56:05	2025-02-13 14:40:05	2025-02-13 08:56:05
6626	859	2024-12-24 07:20:41	2024-12-24 09:28:41	2024-12-24 07:20:41
6627	190	2024-11-26 17:11:47	2024-11-26 19:35:47	2024-11-26 17:11:47
6628	327	2025-06-01 14:05:58	2025-06-01 18:45:58	2025-06-01 14:05:58
6629	626	2025-09-06 13:49:52	2025-09-06 17:33:52	2025-09-06 13:49:52
6630	428	2025-01-04 15:05:31	2025-01-04 19:49:31	2025-01-04 15:05:31
6631	527	2025-07-12 15:34:45	2025-07-12 19:01:45	2025-07-12 15:34:45
6632	847	2025-04-05 15:03:03	2025-04-05 19:16:03	2025-04-05 15:03:03
6633	562	2025-06-01 13:30:48	2025-06-01 18:00:48	2025-06-01 13:30:48
6634	609	2025-07-26 16:51:02	2025-07-26 20:31:02	2025-07-26 16:51:02
6635	939	2024-11-19 19:16:47	2024-11-19 23:21:47	2024-11-19 19:16:47
6636	473	2025-07-29 16:33:37	2025-07-29 18:06:37	2025-07-29 16:33:37
6637	390	2024-11-26 15:05:08	2024-11-26 18:40:08	2024-11-26 15:05:08
6638	694	2025-09-30 15:25:36	2025-09-30 16:28:36	2025-09-30 15:25:36
6639	209	2025-03-09 17:38:04	2025-03-09 20:21:04	2025-03-09 17:38:04
6640	378	2025-02-18 19:23:05	2025-02-19 01:11:05	2025-02-18 19:23:05
6641	627	2025-10-05 14:09:51	2025-10-05 18:28:51	2025-10-05 14:09:51
6642	737	2025-03-11 17:04:15	2025-03-11 22:27:15	2025-03-11 17:04:15
6643	517	2025-05-11 14:47:05	2025-05-11 16:04:05	2025-05-11 14:47:05
6644	888	2025-10-11 16:38:55	2025-10-11 18:17:55	2025-10-11 16:38:55
6645	62	2024-11-09 15:53:34	2024-11-09 18:02:34	2024-11-09 15:53:34
6646	962	2025-07-06 11:01:23	2025-07-06 15:54:23	2025-07-06 11:01:23
6647	969	2025-04-06 05:57:03	2025-04-06 10:50:03	2025-04-06 05:57:03
6648	458	2025-10-18 10:28:35	2025-10-18 12:23:35	2025-10-18 10:28:35
6649	735	2025-07-22 06:45:45	2025-07-22 08:36:45	2025-07-22 06:45:45
6650	955	2025-03-01 15:42:31	2025-03-01 18:05:31	2025-03-01 15:42:31
6651	236	2024-12-17 16:26:59	2024-12-17 18:50:59	2024-12-17 16:26:59
6652	583	2025-04-15 17:16:33	2025-04-15 19:30:33	2025-04-15 17:16:33
6653	329	2025-03-09 06:38:50	2025-03-09 09:12:50	2025-03-09 06:38:50
6654	459	2025-05-24 14:48:49	2025-05-24 17:08:49	2025-05-24 14:48:49
6655	516	2024-11-23 09:23:27	2024-11-23 14:33:27	2024-11-23 09:23:27
6656	28	2025-08-23 15:32:59	2025-08-23 19:33:59	2025-08-23 15:32:59
6657	608	2025-07-29 05:03:10	2025-07-29 08:08:10	2025-07-29 05:03:10
6658	829	2025-09-21 14:25:25	2025-09-21 19:00:25	2025-09-21 14:25:25
6659	707	2025-07-22 15:22:08	2025-07-22 17:22:08	2025-07-22 15:22:08
6660	884	2025-03-18 06:23:02	2025-03-18 07:49:02	2025-03-18 06:23:02
6661	775	2025-02-11 16:10:45	2025-02-11 20:24:45	2025-02-11 16:10:45
6662	259	2025-09-09 17:46:59	2025-09-09 20:45:59	2025-09-09 17:46:59
6663	504	2024-12-29 16:28:34	2024-12-29 18:10:34	2024-12-29 16:28:34
6664	508	2024-12-10 15:56:17	2024-12-10 18:02:17	2024-12-10 15:56:17
6665	99	2025-03-11 16:36:09	2025-03-11 17:36:09	2025-03-11 16:36:09
6666	97	2025-04-06 16:38:28	2025-04-06 19:41:28	2025-04-06 16:38:28
6667	333	2025-06-29 15:01:49	2025-06-29 16:07:49	2025-06-29 15:01:49
6668	183	2024-12-24 10:14:33	2024-12-24 14:58:33	2024-12-24 10:14:33
6669	4	2025-04-29 18:30:02	2025-04-29 23:22:02	2025-04-29 18:30:02
6670	925	2024-12-08 17:31:47	2024-12-08 21:01:47	2024-12-08 17:31:47
6671	452	2025-08-04 02:00:52	2025-08-04 07:21:52	2025-08-04 02:00:52
6672	609	2025-05-20 18:08:06	2025-05-20 20:21:06	2025-05-20 18:08:06
6673	374	2025-02-09 15:25:33	2025-02-09 18:58:33	2025-02-09 15:25:33
6674	265	2025-01-18 06:08:31	2025-01-18 09:31:31	2025-01-18 06:08:31
6675	492	2025-01-28 17:49:44	2025-01-28 23:05:44	2025-01-28 17:49:44
6676	941	2024-12-17 18:01:02	2024-12-17 20:07:02	2024-12-17 18:01:02
6677	552	2025-06-10 14:36:20	2025-06-10 18:31:20	2025-06-10 14:36:20
6678	919	2025-09-21 16:46:20	2025-09-21 19:40:20	2025-09-21 16:46:20
6679	678	2025-10-12 14:39:25	2025-10-12 19:32:25	2025-10-12 14:39:25
6680	256	2025-07-15 16:38:02	2025-07-15 19:25:02	2025-07-15 16:38:02
6681	32	2025-09-09 15:23:47	2025-09-09 21:20:47	2025-09-09 15:23:47
6682	523	2025-06-03 15:48:32	2025-06-03 17:58:32	2025-06-03 15:48:32
6683	110	2025-03-15 17:51:45	2025-03-15 22:45:45	2025-03-15 17:51:45
6684	990	2025-08-23 14:37:29	2025-08-23 19:28:29	2025-08-23 14:37:29
6685	347	2025-05-24 14:55:05	2025-05-24 18:06:05	2025-05-24 14:55:05
6686	214	2025-08-19 16:06:54	2025-08-19 18:29:54	2025-08-19 16:06:54
6687	4	2025-03-25 16:17:14	2025-03-25 20:39:14	2025-03-25 16:17:14
6688	897	2025-05-03 14:06:28	2025-05-03 17:35:28	2025-05-03 14:06:28
6689	317	2025-04-01 17:20:51	2025-04-01 20:57:51	2025-04-01 17:20:51
6690	245	2025-09-15 14:00:46	2025-09-15 16:29:46	2025-09-15 14:00:46
6691	248	2025-01-07 16:24:01	2025-01-07 19:44:01	2025-01-07 16:24:01
6692	634	2025-07-13 16:50:37	2025-07-13 22:04:37	2025-07-13 16:50:37
6693	453	2025-10-28 17:23:40	2025-10-28 18:42:40	2025-10-28 17:23:40
6694	965	2025-02-09 11:58:53	2025-02-09 15:51:53	2025-02-09 11:58:53
6695	969	2025-09-30 14:32:30	2025-09-30 19:40:30	2025-09-30 14:32:30
6696	159	2025-03-16 18:31:45	2025-03-16 20:48:45	2025-03-16 18:31:45
6697	59	2025-08-19 14:14:52	2025-08-19 17:02:52	2025-08-19 14:14:52
6698	228	2024-12-28 17:24:19	2024-12-28 19:14:19	2024-12-28 17:24:19
6699	237	2025-10-21 16:37:46	2025-10-21 20:28:46	2025-10-21 16:37:46
6700	626	2025-09-27 14:09:52	2025-09-27 16:38:52	2025-09-27 14:09:52
6701	408	2024-11-23 16:26:29	2024-11-23 20:08:29	2024-11-23 16:26:29
6702	998	2024-12-22 20:46:19	2024-12-22 23:52:19	2024-12-22 20:46:19
6703	345	2025-10-21 18:43:11	2025-10-21 19:44:11	2025-10-21 18:43:11
6704	148	2025-05-04 15:32:29	2025-05-04 20:05:29	2025-05-04 15:32:29
6705	390	2025-01-18 16:58:22	2025-01-18 19:42:22	2025-01-18 16:58:22
6706	467	2025-05-18 16:16:16	2025-05-18 18:23:16	2025-05-18 16:16:16
6707	900	2025-04-19 15:01:10	2025-04-19 19:57:10	2025-04-19 15:01:10
6708	5	2025-10-12 15:15:46	2025-10-12 16:41:46	2025-10-12 15:15:46
6709	863	2025-09-30 07:33:30	2025-09-30 09:48:30	2025-09-30 07:33:30
6710	474	2025-10-05 10:55:15	2025-10-05 14:34:15	2025-10-05 10:55:15
6711	362	2025-01-05 19:36:57	2025-01-05 23:47:57	2025-01-05 19:36:57
6712	538	2025-03-04 19:04:18	2025-03-05 00:33:18	2025-03-04 19:04:18
6713	241	2024-12-07 15:13:31	2024-12-07 18:06:31	2024-12-07 15:13:31
6714	659	2025-11-04 19:27:04	2025-11-05 01:23:04	2025-11-04 19:27:04
6715	943	2025-04-03 15:11:45	2025-04-03 18:25:45	2025-04-03 15:11:45
6716	775	2025-09-23 16:32:02	2025-09-23 20:41:02	2025-09-23 16:32:02
6717	998	2025-02-18 18:15:55	2025-02-18 22:20:55	2025-02-18 18:15:55
6718	481	2025-08-09 15:51:53	2025-08-09 20:58:53	2025-08-09 15:51:53
6719	743	2025-07-15 18:39:45	2025-07-15 22:34:45	2025-07-15 18:39:45
6720	160	2025-05-10 18:45:27	2025-05-10 21:43:27	2025-05-10 18:45:27
6721	611	2025-09-14 18:51:44	2025-09-14 23:02:44	2025-09-14 18:51:44
6722	627	2025-08-16 16:59:38	2025-08-16 20:26:38	2025-08-16 16:59:38
6723	625	2025-09-07 17:58:27	2025-09-07 19:56:27	2025-09-07 17:58:27
6724	322	2025-07-05 16:15:05	2025-07-05 21:39:05	2025-07-05 16:15:05
6725	375	2025-04-15 16:21:29	2025-04-15 21:18:29	2025-04-15 16:21:29
6726	95	2025-09-27 16:52:28	2025-09-27 22:01:28	2025-09-27 16:52:28
6727	17	2025-06-24 15:18:13	2025-06-24 19:12:13	2025-06-24 15:18:13
6728	613	2025-10-07 03:08:52	2025-10-07 07:44:52	2025-10-07 03:08:52
6729	656	2025-09-23 14:11:40	2025-09-23 16:17:40	2025-09-23 14:11:40
6730	517	2025-06-24 02:26:08	2025-06-24 06:25:08	2025-06-24 02:26:08
6731	318	2025-07-06 18:13:18	2025-07-06 20:37:18	2025-07-06 18:13:18
6732	616	2025-02-18 08:40:59	2025-02-18 10:27:59	2025-02-18 08:40:59
6733	541	2024-12-31 19:03:24	2024-12-31 22:19:24	2024-12-31 19:03:24
6734	895	2025-01-04 15:42:17	2025-01-04 17:11:17	2025-01-04 15:42:17
6735	750	2025-05-24 16:02:12	2025-05-24 18:06:12	2025-05-24 16:02:12
6736	22	2025-10-26 15:47:00	2025-10-26 21:34:00	2025-10-26 15:47:00
6737	332	2025-08-19 15:54:59	2025-08-19 19:07:59	2025-08-19 15:54:59
6738	218	2025-04-01 16:21:32	2025-04-01 22:04:32	2025-04-01 16:21:32
6739	398	2025-09-28 17:49:09	2025-09-28 22:54:09	2025-09-28 17:49:09
6740	368	2025-01-28 15:47:03	2025-01-28 20:20:03	2025-01-28 15:47:03
6741	452	2024-12-17 07:11:11	2024-12-17 12:11:11	2024-12-17 07:11:11
6742	886	2024-12-21 19:48:03	2024-12-21 21:43:03	2024-12-21 19:48:03
6743	469	2025-02-04 15:46:28	2025-02-04 21:32:28	2025-02-04 15:46:28
6744	959	2025-02-15 15:50:31	2025-02-15 17:32:31	2025-02-15 15:50:31
6745	771	2025-10-11 16:45:18	2025-10-11 18:44:18	2025-10-11 16:45:18
6746	433	2025-09-27 15:28:39	2025-09-27 21:00:39	2025-09-27 15:28:39
6747	426	2024-11-16 14:17:33	2024-11-16 16:28:33	2024-11-16 14:17:33
6748	712	2025-06-21 15:10:45	2025-06-21 17:43:45	2025-06-21 15:10:45
6749	118	2025-04-26 16:03:05	2025-04-26 21:30:05	2025-04-26 16:03:05
6750	70	2025-06-24 05:26:35	2025-06-24 10:50:35	2025-06-24 05:26:35
6751	733	2025-05-12 14:26:12	2025-05-12 17:51:12	2025-05-12 14:26:12
6752	679	2025-07-20 14:16:39	2025-07-20 15:59:39	2025-07-20 14:16:39
6753	734	2024-12-07 10:19:29	2024-12-07 11:39:29	2024-12-07 10:19:29
6754	970	2025-05-30 22:00:56	2025-05-31 03:43:56	2025-05-30 22:00:56
6755	663	2025-03-15 17:50:53	2025-03-15 20:32:53	2025-03-15 17:50:53
6756	539	2025-11-02 19:24:05	2025-11-02 20:52:05	2025-11-02 19:24:05
6757	349	2025-03-22 15:36:32	2025-03-22 19:10:32	2025-03-22 15:36:32
6758	157	2025-04-22 15:17:17	2025-04-22 17:15:17	2025-04-22 15:17:17
6759	529	2024-12-22 19:20:22	2024-12-22 21:52:22	2024-12-22 19:20:22
6760	173	2025-11-01 06:19:16	2025-11-01 11:58:16	2025-11-01 06:19:16
6761	658	2024-12-14 15:28:43	2024-12-14 17:23:43	2024-12-14 15:28:43
6762	53	2025-07-14 15:24:44	2025-07-14 18:07:44	2025-07-14 15:24:44
6763	938	2025-03-03 00:38:27	2025-03-03 01:56:27	2025-03-03 00:38:27
6764	711	2024-12-28 15:36:48	2024-12-28 17:47:48	2024-12-28 15:36:48
6765	360	2024-12-07 18:04:54	2024-12-07 20:58:54	2024-12-07 18:04:54
6766	879	2025-11-02 15:28:24	2025-11-02 17:45:24	2025-11-02 15:28:24
6767	266	2024-12-14 16:25:23	2024-12-14 20:42:23	2024-12-14 16:25:23
6768	353	2025-05-20 14:39:39	2025-05-20 19:09:39	2025-05-20 14:39:39
6769	639	2025-03-04 19:46:56	2025-03-04 23:32:56	2025-03-04 19:46:56
6770	239	2025-08-23 10:19:29	2025-08-23 14:44:29	2025-08-23 10:19:29
6771	625	2025-06-29 15:08:37	2025-06-29 19:10:37	2025-06-29 15:08:37
6772	36	2025-05-13 15:37:51	2025-05-13 19:26:51	2025-05-13 15:37:51
6773	915	2025-08-22 15:46:09	2025-08-22 17:02:09	2025-08-22 15:46:09
6774	793	2025-04-05 11:14:30	2025-04-05 15:12:30	2025-04-05 11:14:30
6775	556	2025-05-13 15:33:59	2025-05-13 19:51:59	2025-05-13 15:33:59
6776	519	2025-10-11 15:55:34	2025-10-11 18:02:34	2025-10-11 15:55:34
6777	734	2024-12-07 09:45:23	2024-12-07 15:14:23	2024-12-07 09:45:23
6778	709	2025-01-21 17:14:47	2025-01-21 19:45:47	2025-01-21 17:14:47
6779	986	2025-01-18 05:27:51	2025-01-18 10:52:51	2025-01-18 05:27:51
6780	480	2025-10-12 21:42:29	2025-10-12 23:51:29	2025-10-12 21:42:29
6781	677	2025-08-26 14:19:27	2025-08-26 16:22:27	2025-08-26 14:19:27
6782	138	2025-10-19 04:43:59	2025-10-19 09:52:59	2025-10-19 04:43:59
6783	627	2025-05-31 16:48:04	2025-05-31 22:14:04	2025-05-31 16:48:04
6784	573	2025-09-30 18:31:47	2025-09-30 22:53:47	2025-09-30 18:31:47
6785	250	2025-04-02 02:29:14	2025-04-02 08:09:14	2025-04-02 02:29:14
6786	802	2025-01-18 17:07:51	2025-01-18 22:49:51	2025-01-18 17:07:51
6787	303	2025-09-14 17:54:00	2025-09-14 20:39:00	2025-09-14 17:54:00
6788	757	2025-04-27 14:16:05	2025-04-27 16:19:05	2025-04-27 14:16:05
6789	563	2025-02-15 15:34:17	2025-02-15 18:08:17	2025-02-15 15:34:17
6790	12	2025-01-19 15:40:43	2025-01-19 19:05:43	2025-01-19 15:40:43
6791	754	2025-08-02 18:46:39	2025-08-02 21:39:39	2025-08-02 18:46:39
6792	249	2025-10-14 08:44:05	2025-10-14 14:26:05	2025-10-14 08:44:05
6793	987	2025-08-02 16:10:31	2025-08-02 17:46:31	2025-08-02 16:10:31
6794	790	2025-06-21 15:22:50	2025-06-21 18:19:50	2025-06-21 15:22:50
6795	466	2025-07-05 05:41:59	2025-07-05 08:14:59	2025-07-05 05:41:59
6796	376	2025-08-12 06:23:13	2025-08-12 10:14:13	2025-08-12 06:23:13
6797	508	2025-08-12 10:17:48	2025-08-12 15:48:48	2025-08-12 10:17:48
6798	339	2025-03-23 18:45:14	2025-03-23 22:20:14	2025-03-23 18:45:14
6799	523	2025-10-11 14:31:14	2025-10-11 20:13:14	2025-10-11 14:31:14
6800	168	2025-04-12 07:28:00	2025-04-12 09:48:00	2025-04-12 07:28:00
6801	304	2025-07-05 14:04:44	2025-07-05 19:17:44	2025-07-05 14:04:44
6802	881	2025-08-17 14:19:58	2025-08-17 17:20:58	2025-08-17 14:19:58
6803	478	2025-02-13 15:02:35	2025-02-13 17:31:35	2025-02-13 15:02:35
6804	396	2025-03-18 16:09:13	2025-03-18 19:46:13	2025-03-18 16:09:13
6805	490	2025-06-10 15:01:12	2025-06-10 16:05:12	2025-06-10 15:01:12
6806	365	2025-08-26 15:28:02	2025-08-26 19:43:02	2025-08-26 15:28:02
6807	219	2025-09-16 17:40:12	2025-09-16 20:13:12	2025-09-16 17:40:12
6808	54	2025-08-23 15:00:24	2025-08-23 17:55:24	2025-08-23 15:00:24
6809	50	2025-11-02 09:16:15	2025-11-02 10:30:15	2025-11-02 09:16:15
6810	955	2024-12-31 17:59:12	2024-12-31 22:25:12	2024-12-31 17:59:12
6811	971	2025-02-18 15:53:32	2025-02-18 21:48:32	2025-02-18 15:53:32
6812	429	2025-08-16 14:08:19	2025-08-16 16:28:19	2025-08-16 14:08:19
6813	139	2025-05-17 14:32:12	2025-05-17 18:47:12	2025-05-17 14:32:12
6814	485	2025-05-11 15:01:53	2025-05-11 16:11:53	2025-05-11 15:01:53
6815	408	2025-06-16 14:42:16	2025-06-16 16:12:16	2025-06-16 14:42:16
6816	877	2025-09-07 14:59:52	2025-09-07 18:23:52	2025-09-07 14:59:52
6817	3	2025-06-24 17:41:35	2025-06-24 19:44:35	2025-06-24 17:41:35
6818	267	2025-02-11 15:45:07	2025-02-11 16:51:07	2025-02-11 15:45:07
6819	1000	2025-01-07 09:08:59	2025-01-07 13:43:59	2025-01-07 09:08:59
6820	969	2025-02-01 15:03:14	2025-02-01 18:30:14	2025-02-01 15:03:14
6821	72	2025-01-19 17:10:51	2025-01-19 23:08:51	2025-01-19 17:10:51
6822	818	2024-11-23 03:32:46	2024-11-23 08:50:46	2024-11-23 03:32:46
6823	408	2025-08-05 14:07:51	2025-08-05 20:05:51	2025-08-05 14:07:51
6824	95	2025-10-04 18:42:57	2025-10-04 22:17:57	2025-10-04 18:42:57
6825	237	2025-05-25 16:47:50	2025-05-25 21:28:50	2025-05-25 16:47:50
6826	859	2024-12-15 18:06:10	2024-12-15 22:27:10	2024-12-15 18:06:10
6827	880	2025-08-08 14:03:24	2025-08-08 17:08:24	2025-08-08 14:03:24
6828	873	2025-10-04 17:40:48	2025-10-04 20:44:48	2025-10-04 17:40:48
6829	815	2025-09-09 18:59:45	2025-09-10 00:29:45	2025-09-09 18:59:45
6830	995	2025-08-30 15:48:36	2025-08-30 17:01:36	2025-08-30 15:48:36
6831	605	2025-02-25 05:17:49	2025-02-25 09:09:49	2025-02-25 05:17:49
6832	436	2025-04-06 15:02:05	2025-04-06 17:22:05	2025-04-06 15:02:05
6833	285	2025-06-07 17:16:48	2025-06-07 21:47:48	2025-06-07 17:16:48
6834	861	2025-05-26 06:03:07	2025-05-26 09:50:07	2025-05-26 06:03:07
6835	674	2025-03-05 17:32:41	2025-03-05 20:15:41	2025-03-05 17:32:41
6836	940	2025-08-02 02:23:42	2025-08-02 04:28:42	2025-08-02 02:23:42
6837	774	2025-05-25 16:36:40	2025-05-25 20:35:40	2025-05-25 16:36:40
6838	539	2025-09-20 14:57:05	2025-09-20 16:08:05	2025-09-20 14:57:05
6839	521	2025-02-25 15:31:33	2025-02-25 17:31:33	2025-02-25 15:31:33
6840	780	2025-03-25 15:29:59	2025-03-25 21:27:59	2025-03-25 15:29:59
6841	610	2025-05-06 14:22:48	2025-05-06 18:52:48	2025-05-06 14:22:48
6842	36	2025-09-16 15:52:44	2025-09-16 17:06:44	2025-09-16 15:52:44
6843	10	2025-02-23 17:35:16	2025-02-23 18:39:16	2025-02-23 17:35:16
6844	637	2025-02-15 17:00:54	2025-02-15 21:11:54	2025-02-15 17:00:54
6845	387	2025-11-01 19:35:46	2025-11-02 01:20:46	2025-11-01 19:35:46
6846	91	2025-10-05 15:56:21	2025-10-05 20:53:21	2025-10-05 15:56:21
6847	999	2025-01-25 17:58:05	2025-01-25 22:38:05	2025-01-25 17:58:05
6848	250	2025-03-26 13:27:19	2025-03-26 18:45:19	2025-03-26 13:27:19
6849	154	2025-06-28 14:27:33	2025-06-28 19:50:33	2025-06-28 14:27:33
6850	888	2025-08-26 14:04:16	2025-08-26 15:11:16	2025-08-26 14:04:16
6851	696	2025-04-01 15:17:50	2025-04-01 18:57:50	2025-04-01 15:17:50
6852	681	2025-02-15 17:49:10	2025-02-15 23:15:10	2025-02-15 17:49:10
6853	373	2025-09-20 16:27:55	2025-09-20 19:13:55	2025-09-20 16:27:55
6854	859	2025-08-12 16:00:27	2025-08-12 19:40:27	2025-08-12 16:00:27
6855	561	2025-06-01 13:50:47	2025-06-01 18:28:47	2025-06-01 13:50:47
6856	453	2025-04-12 16:41:10	2025-04-12 22:01:10	2025-04-12 16:41:10
6857	774	2025-04-12 17:33:15	2025-04-12 22:09:15	2025-04-12 17:33:15
6858	708	2025-05-17 16:55:26	2025-05-17 22:16:26	2025-05-17 16:55:26
6859	958	2025-10-12 14:44:00	2025-10-12 20:20:00	2025-10-12 14:44:00
6860	989	2025-06-29 15:00:41	2025-06-29 19:59:41	2025-06-29 15:00:41
6861	591	2025-03-23 18:02:18	2025-03-23 19:43:18	2025-03-23 18:02:18
6862	432	2024-11-26 17:13:11	2024-11-26 19:04:11	2024-11-26 17:13:11
6863	546	2025-02-03 17:09:21	2025-02-03 21:23:21	2025-02-03 17:09:21
6864	13	2025-10-07 16:47:33	2025-10-07 20:23:33	2025-10-07 16:47:33
6865	153	2025-03-08 15:22:35	2025-03-08 19:48:35	2025-03-08 15:22:35
6866	514	2025-06-28 16:38:23	2025-06-28 19:09:23	2025-06-28 16:38:23
6867	732	2024-12-15 18:32:45	2024-12-15 21:09:45	2024-12-15 18:32:45
6868	146	2025-10-18 10:45:10	2025-10-18 13:28:10	2025-10-18 10:45:10
6869	852	2025-08-05 16:16:40	2025-08-05 20:02:40	2025-08-05 16:16:40
6870	126	2025-05-13 14:44:31	2025-05-13 16:18:31	2025-05-13 14:44:31
6871	952	2025-04-13 10:31:15	2025-04-13 13:58:15	2025-04-13 10:31:15
6872	850	2025-09-23 12:57:35	2025-09-23 16:40:35	2025-09-23 12:57:35
6873	870	2025-09-27 15:36:13	2025-09-27 21:30:13	2025-09-27 15:36:13
6874	820	2025-06-24 17:49:12	2025-06-24 22:46:12	2025-06-24 17:49:12
6875	659	2024-12-29 15:38:29	2024-12-29 21:29:29	2024-12-29 15:38:29
6876	692	2025-08-31 16:37:39	2025-08-31 20:56:39	2025-08-31 16:37:39
6877	268	2025-02-02 18:27:33	2025-02-02 23:12:33	2025-02-02 18:27:33
6878	630	2025-05-24 14:14:32	2025-05-24 19:46:32	2025-05-24 14:14:32
6879	524	2025-07-20 16:43:21	2025-07-20 19:51:21	2025-07-20 16:43:21
6880	733	2025-07-08 15:22:20	2025-07-08 18:48:20	2025-07-08 15:22:20
6881	997	2025-03-25 08:33:47	2025-03-25 13:55:47	2025-03-25 08:33:47
6882	16	2025-03-29 05:25:25	2025-03-29 08:04:25	2025-03-29 05:25:25
6883	904	2025-08-31 04:35:03	2025-08-31 06:49:03	2025-08-31 04:35:03
6884	5	2025-10-11 06:39:13	2025-10-11 07:54:13	2025-10-11 06:39:13
6885	844	2025-05-18 18:04:55	2025-05-18 21:29:55	2025-05-18 18:04:55
6886	586	2025-06-28 11:19:51	2025-06-28 14:59:51	2025-06-28 11:19:51
6887	297	2025-02-11 10:03:51	2025-02-11 13:58:51	2025-02-11 10:03:51
6888	791	2025-02-01 17:03:40	2025-02-01 18:11:40	2025-02-01 17:03:40
6889	25	2025-08-16 15:32:02	2025-08-16 21:26:02	2025-08-16 15:32:02
6890	728	2024-12-22 16:23:36	2024-12-22 21:07:36	2024-12-22 16:23:36
6891	88	2025-09-07 15:00:04	2025-09-07 16:10:04	2025-09-07 15:00:04
6892	949	2025-03-25 11:58:05	2025-03-25 13:01:05	2025-03-25 11:58:05
6893	423	2025-05-11 15:23:56	2025-05-11 19:52:56	2025-05-11 15:23:56
6894	641	2024-11-10 00:41:19	2024-11-10 02:01:19	2024-11-10 00:41:19
6895	286	2025-09-21 14:10:45	2025-09-21 16:16:45	2025-09-21 14:10:45
6896	975	2024-11-30 17:24:28	2024-11-30 21:08:28	2024-11-30 17:24:28
6897	555	2025-05-22 16:27:38	2025-05-22 20:13:38	2025-05-22 16:27:38
6898	782	2025-02-08 05:07:17	2025-02-08 07:48:17	2025-02-08 05:07:17
6899	357	2025-05-25 14:37:47	2025-05-25 15:37:47	2025-05-25 14:37:47
6900	248	2025-01-11 19:43:06	2025-01-11 21:06:06	2025-01-11 19:43:06
6901	422	2025-02-25 12:38:41	2025-02-25 14:58:41	2025-02-25 12:38:41
6902	385	2025-05-06 08:24:58	2025-05-06 12:24:58	2025-05-06 08:24:58
6903	774	2025-03-11 17:55:29	2025-03-11 21:29:29	2025-03-11 17:55:29
6904	544	2025-05-26 15:53:36	2025-05-26 21:38:36	2025-05-26 15:53:36
6905	429	2025-05-25 14:46:41	2025-05-25 20:16:41	2025-05-25 14:46:41
6906	780	2025-01-28 17:30:16	2025-01-28 19:18:16	2025-01-28 17:30:16
6907	306	2025-06-24 12:25:14	2025-06-24 16:29:14	2025-06-24 12:25:14
6908	917	2025-04-15 16:08:53	2025-04-15 18:39:53	2025-04-15 16:08:53
6909	706	2025-07-15 17:24:12	2025-07-15 18:32:12	2025-07-15 17:24:12
6910	235	2025-09-30 15:59:36	2025-09-30 19:44:36	2025-09-30 15:59:36
6911	244	2025-07-19 14:09:22	2025-07-19 15:18:22	2025-07-19 14:09:22
6912	780	2025-02-11 05:35:05	2025-02-11 09:43:05	2025-02-11 05:35:05
6913	32	2025-09-21 14:27:10	2025-09-21 15:34:10	2025-09-21 14:27:10
6914	358	2025-09-30 16:18:05	2025-09-30 20:17:05	2025-09-30 16:18:05
6915	795	2024-12-17 15:59:15	2024-12-17 21:27:15	2024-12-17 15:59:15
6916	561	2025-06-15 17:55:24	2025-06-15 21:48:24	2025-06-15 17:55:24
6917	775	2025-05-15 16:00:22	2025-05-15 17:04:22	2025-05-15 16:00:22
6918	184	2024-12-01 17:00:38	2024-12-01 18:14:38	2024-12-01 17:00:38
6919	486	2024-12-03 13:00:44	2024-12-03 16:14:44	2024-12-03 13:00:44
6920	45	2025-04-22 05:26:39	2025-04-22 08:58:39	2025-04-22 05:26:39
6921	939	2025-03-09 07:37:17	2025-03-09 12:08:17	2025-03-09 07:37:17
6922	435	2024-11-26 06:07:42	2024-11-26 09:45:42	2024-11-26 06:07:42
6923	862	2025-08-30 17:03:52	2025-08-30 20:59:52	2025-08-30 17:03:52
6924	587	2025-08-31 14:29:33	2025-08-31 16:12:33	2025-08-31 14:29:33
6925	616	2025-08-09 14:21:41	2025-08-09 16:06:41	2025-08-09 14:21:41
6926	605	2025-08-05 16:25:52	2025-08-05 20:58:52	2025-08-05 16:25:52
6927	346	2025-10-27 16:26:53	2025-10-27 19:27:53	2025-10-27 16:26:53
6928	605	2024-12-03 17:24:06	2024-12-03 23:09:06	2024-12-03 17:24:06
6929	710	2025-03-29 06:59:58	2025-03-29 09:06:58	2025-03-29 06:59:58
6930	220	2025-01-19 05:09:53	2025-01-19 07:25:53	2025-01-19 05:09:53
6931	121	2025-05-13 08:55:16	2025-05-13 10:08:16	2025-05-13 08:55:16
6932	918	2024-12-08 17:03:18	2024-12-08 21:31:18	2024-12-08 17:03:18
6933	845	2025-03-15 19:37:27	2025-03-15 23:51:27	2025-03-15 19:37:27
6934	41	2025-02-18 21:19:04	2025-02-19 01:50:04	2025-02-18 21:19:04
6935	512	2024-12-24 19:49:40	2024-12-25 00:36:40	2024-12-24 19:49:40
6936	849	2024-12-29 16:45:47	2024-12-29 18:37:47	2024-12-29 16:45:47
6937	936	2025-08-31 14:37:12	2025-08-31 17:50:12	2025-08-31 14:37:12
6938	873	2025-07-13 17:07:14	2025-07-13 18:38:14	2025-07-13 17:07:14
6939	287	2025-05-13 16:49:52	2025-05-13 18:09:52	2025-05-13 16:49:52
6940	382	2025-06-18 18:48:54	2025-06-19 00:12:54	2025-06-18 18:48:54
6941	796	2025-01-20 15:10:12	2025-01-20 20:32:12	2025-01-20 15:10:12
6942	576	2025-06-22 16:15:58	2025-06-22 17:47:58	2025-06-22 16:15:58
6943	209	2024-12-21 18:55:34	2024-12-22 00:37:34	2024-12-21 18:55:34
6944	137	2025-03-25 19:02:41	2025-03-26 00:35:41	2025-03-25 19:02:41
6945	292	2024-12-22 15:35:06	2024-12-22 17:34:06	2024-12-22 15:35:06
6946	253	2024-11-30 05:14:33	2024-11-30 09:07:33	2024-11-30 05:14:33
6947	866	2025-04-12 16:32:05	2025-04-12 19:42:05	2025-04-12 16:32:05
6948	759	2024-11-21 17:24:12	2024-11-21 23:11:12	2024-11-21 17:24:12
6949	11	2025-01-25 17:25:41	2025-01-25 21:53:41	2025-01-25 17:25:41
6950	407	2025-10-11 17:03:55	2025-10-11 20:16:55	2025-10-11 17:03:55
6951	755	2025-10-18 15:25:40	2025-10-18 18:17:40	2025-10-18 15:25:40
6952	62	2025-02-01 15:33:07	2025-02-01 18:55:07	2025-02-01 15:33:07
6953	357	2025-03-30 15:43:28	2025-03-30 21:10:28	2025-03-30 15:43:28
6954	25	2025-04-15 06:25:13	2025-04-15 08:48:13	2025-04-15 06:25:13
6955	960	2025-08-31 14:54:55	2025-08-31 20:25:55	2025-08-31 14:54:55
6956	70	2025-04-08 16:59:58	2025-04-08 19:54:58	2025-04-08 16:59:58
6957	563	2025-01-05 15:57:18	2025-01-05 18:20:18	2025-01-05 15:57:18
6958	276	2025-08-02 14:28:50	2025-08-02 19:24:50	2025-08-02 14:28:50
6959	701	2025-02-11 03:32:10	2025-02-11 05:20:10	2025-02-11 03:32:10
6960	469	2024-12-17 17:37:54	2024-12-17 18:54:54	2024-12-17 17:37:54
6961	495	2025-08-26 14:11:28	2025-08-26 17:22:28	2025-08-26 14:11:28
6962	749	2025-10-19 14:35:30	2025-10-19 16:50:30	2025-10-19 14:35:30
6963	307	2025-03-04 17:36:39	2025-03-04 22:53:39	2025-03-04 17:36:39
6964	913	2024-12-01 16:04:55	2024-12-01 20:12:55	2024-12-01 16:04:55
6965	565	2024-12-17 18:07:35	2024-12-17 19:23:35	2024-12-17 18:07:35
6966	797	2025-03-09 06:07:48	2025-03-09 11:56:48	2025-03-09 06:07:48
6967	267	2025-06-14 17:01:39	2025-06-14 21:16:39	2025-06-14 17:01:39
6968	228	2025-03-15 08:22:10	2025-03-15 11:26:10	2025-03-15 08:22:10
6969	790	2025-02-08 17:17:45	2025-02-08 21:28:45	2025-02-08 17:17:45
6970	443	2025-06-21 13:15:03	2025-06-21 16:32:03	2025-06-21 13:15:03
6971	31	2025-06-01 16:23:41	2025-06-01 20:15:41	2025-06-01 16:23:41
6972	843	2025-05-11 16:01:10	2025-05-11 17:36:10	2025-05-11 16:01:10
6973	171	2025-09-27 05:55:30	2025-09-27 07:12:30	2025-09-27 05:55:30
6974	778	2025-01-08 10:02:23	2025-01-08 14:04:23	2025-01-08 10:02:23
6975	570	2025-07-08 15:49:30	2025-07-08 21:18:30	2025-07-08 15:49:30
6976	121	2025-03-14 19:28:27	2025-03-14 20:39:27	2025-03-14 19:28:27
6977	907	2025-04-30 15:12:20	2025-04-30 19:39:20	2025-04-30 15:12:20
6978	989	2025-04-22 05:44:13	2025-04-22 09:07:13	2025-04-22 05:44:13
6979	158	2025-03-15 17:16:57	2025-03-15 21:18:57	2025-03-15 17:16:57
6980	182	2025-02-01 10:51:54	2025-02-01 15:40:54	2025-02-01 10:51:54
6981	966	2025-06-21 07:40:09	2025-06-21 13:14:09	2025-06-21 07:40:09
6982	850	2025-04-22 16:28:58	2025-04-22 18:46:58	2025-04-22 16:28:58
6983	143	2025-02-23 19:47:51	2025-02-23 20:47:51	2025-02-23 19:47:51
6984	187	2025-10-07 15:45:50	2025-10-07 20:22:50	2025-10-07 15:45:50
6985	468	2025-09-18 15:35:12	2025-09-18 17:45:12	2025-09-18 15:35:12
6986	788	2025-07-13 18:12:49	2025-07-13 19:59:49	2025-07-13 18:12:49
6987	671	2024-12-02 17:45:03	2024-12-02 21:19:03	2024-12-02 17:45:03
6988	697	2024-12-14 06:40:32	2024-12-14 11:16:32	2024-12-14 06:40:32
6989	804	2025-04-15 15:53:36	2025-04-15 21:24:36	2025-04-15 15:53:36
6990	567	2025-07-12 14:01:02	2025-07-12 17:37:02	2025-07-12 14:01:02
6991	93	2025-09-16 14:40:46	2025-09-16 17:20:46	2025-09-16 14:40:46
6992	703	2025-09-07 17:04:40	2025-09-07 18:05:40	2025-09-07 17:04:40
6993	623	2025-03-05 17:12:19	2025-03-05 19:50:19	2025-03-05 17:12:19
6994	978	2025-08-05 02:49:15	2025-08-05 04:32:15	2025-08-05 02:49:15
6995	387	2025-07-29 08:37:13	2025-07-29 14:18:13	2025-07-29 08:37:13
6996	777	2025-05-17 16:53:37	2025-05-17 19:26:37	2025-05-17 16:53:37
6997	83	2025-01-25 08:44:59	2025-01-25 10:13:59	2025-01-25 08:44:59
6998	426	2025-03-01 17:37:27	2025-03-01 22:09:27	2025-03-01 17:37:27
6999	230	2025-08-19 15:51:46	2025-08-19 20:47:46	2025-08-19 15:51:46
7000	631	2025-03-22 17:47:21	2025-03-22 21:54:21	2025-03-22 17:47:21
7001	361	2025-06-30 16:53:30	2025-06-30 21:49:30	2025-06-30 16:53:30
7002	145	2025-06-14 15:10:13	2025-06-14 18:42:13	2025-06-14 15:10:13
7003	288	2025-09-02 16:51:21	2025-09-02 21:03:21	2025-09-02 16:51:21
7004	83	2024-11-20 15:19:29	2024-11-20 18:55:29	2024-11-20 15:19:29
7005	833	2025-06-07 17:07:47	2025-06-07 18:11:47	2025-06-07 17:07:47
7006	926	2025-06-10 04:52:07	2025-06-10 09:49:07	2025-06-10 04:52:07
7007	839	2025-09-22 07:29:18	2025-09-22 10:19:18	2025-09-22 07:29:18
7008	90	2024-12-29 17:31:09	2024-12-29 19:53:09	2024-12-29 17:31:09
7009	506	2025-10-21 10:46:43	2025-10-21 13:04:43	2025-10-21 10:46:43
7010	872	2024-12-01 11:50:48	2024-12-01 12:59:48	2024-12-01 11:50:48
7011	97	2025-05-13 14:35:44	2025-05-13 18:57:44	2025-05-13 14:35:44
7012	322	2025-09-27 08:13:10	2025-09-27 13:32:10	2025-09-27 08:13:10
7013	334	2024-11-17 15:22:39	2024-11-17 20:53:39	2024-11-17 15:22:39
7014	546	2025-01-07 19:42:18	2025-01-07 22:12:18	2025-01-07 19:42:18
7015	508	2024-11-17 16:52:21	2024-11-17 19:06:21	2024-11-17 16:52:21
7016	891	2025-05-04 14:33:28	2025-05-04 18:27:28	2025-05-04 14:33:28
7017	347	2024-11-30 14:27:42	2024-11-30 17:30:42	2024-11-30 14:27:42
7018	398	2025-04-05 14:09:48	2025-04-05 19:31:48	2025-04-05 14:09:48
7019	818	2025-01-04 17:16:50	2025-01-04 21:35:50	2025-01-04 17:16:50
7020	296	2025-04-29 05:28:38	2025-04-29 07:16:38	2025-04-29 05:28:38
7021	904	2025-03-04 15:48:00	2025-03-04 19:19:00	2025-03-04 15:48:00
7022	34	2025-03-04 17:57:02	2025-03-04 21:53:02	2025-03-04 17:57:02
7023	217	2025-06-15 14:38:02	2025-06-15 17:49:02	2025-06-15 14:38:02
7024	967	2025-10-19 09:30:20	2025-10-19 15:18:20	2025-10-19 09:30:20
7025	600	2025-06-03 04:51:21	2025-06-03 07:29:21	2025-06-03 04:51:21
7026	61	2025-10-04 06:47:06	2025-10-04 12:35:06	2025-10-04 06:47:06
7027	100	2025-05-17 17:01:42	2025-05-17 20:47:42	2025-05-17 17:01:42
7028	13	2025-05-06 13:29:58	2025-05-06 15:56:58	2025-05-06 13:29:58
7029	551	2024-12-29 07:22:31	2024-12-29 08:42:31	2024-12-29 07:22:31
7030	125	2025-04-15 18:01:06	2025-04-15 22:47:06	2025-04-15 18:01:06
7031	648	2025-06-07 16:55:31	2025-06-07 21:41:31	2025-06-07 16:55:31
7032	337	2025-02-11 15:00:34	2025-02-11 16:55:34	2025-02-11 15:00:34
7033	596	2024-11-24 15:14:26	2024-11-24 21:10:26	2024-11-24 15:14:26
7034	830	2025-07-22 16:45:07	2025-07-22 19:40:07	2025-07-22 16:45:07
7035	513	2025-10-11 17:41:42	2025-10-11 21:04:42	2025-10-11 17:41:42
7036	844	2025-10-07 15:25:46	2025-10-07 20:33:46	2025-10-07 15:25:46
7037	117	2025-06-29 14:12:53	2025-06-29 17:43:53	2025-06-29 14:12:53
7038	816	2025-09-23 14:49:37	2025-09-23 20:00:37	2025-09-23 14:49:37
7039	97	2025-08-24 17:56:46	2025-08-24 23:22:46	2025-08-24 17:56:46
7040	628	2025-09-30 15:17:03	2025-09-30 19:37:03	2025-09-30 15:17:03
7041	397	2024-11-12 15:44:27	2024-11-12 20:41:27	2024-11-12 15:44:27
7042	87	2024-11-16 07:44:16	2024-11-16 10:37:16	2024-11-16 07:44:16
7043	670	2025-09-13 18:43:31	2025-09-13 22:06:31	2025-09-13 18:43:31
7044	653	2025-05-17 16:08:43	2025-05-17 19:32:43	2025-05-17 16:08:43
7045	356	2025-03-22 02:50:10	2025-03-22 04:18:10	2025-03-22 02:50:10
7046	61	2025-04-01 14:45:41	2025-04-01 20:31:41	2025-04-01 14:45:41
7047	926	2025-09-23 16:45:35	2025-09-23 18:26:35	2025-09-23 16:45:35
7048	516	2025-06-07 14:05:29	2025-06-07 15:06:29	2025-06-07 14:05:29
7049	240	2025-08-05 14:17:15	2025-08-05 16:35:15	2025-08-05 14:17:15
7050	708	2025-09-07 17:51:57	2025-09-07 23:09:57	2025-09-07 17:51:57
7051	243	2024-12-17 15:37:15	2024-12-17 20:32:15	2024-12-17 15:37:15
7052	509	2025-10-28 15:45:41	2025-10-28 18:44:41	2025-10-28 15:45:41
7053	421	2025-06-03 16:54:51	2025-06-03 19:21:51	2025-06-03 16:54:51
7054	924	2024-12-03 16:28:32	2024-12-03 20:12:32	2024-12-03 16:28:32
7055	843	2024-12-10 13:29:59	2024-12-10 16:29:59	2024-12-10 13:29:59
7056	547	2024-11-19 16:35:42	2024-11-19 18:27:42	2024-11-19 16:35:42
7057	924	2025-04-05 19:08:16	2025-04-05 21:32:16	2025-04-05 19:08:16
7058	984	2025-06-10 16:20:27	2025-06-10 18:28:27	2025-06-10 16:20:27
7059	129	2025-10-19 16:00:55	2025-10-19 20:44:55	2025-10-19 16:00:55
7060	568	2025-07-27 15:24:01	2025-07-27 17:33:01	2025-07-27 15:24:01
7061	621	2025-02-09 15:25:35	2025-02-09 19:52:35	2025-02-09 15:25:35
7062	989	2024-12-24 13:08:06	2024-12-24 16:53:06	2024-12-24 13:08:06
7063	873	2025-02-11 16:15:35	2025-02-11 22:03:35	2025-02-11 16:15:35
7064	125	2025-02-18 19:21:06	2025-02-18 21:16:06	2025-02-18 19:21:06
7065	987	2025-11-01 13:18:48	2025-11-01 16:31:48	2025-11-01 13:18:48
7066	103	2025-06-20 14:25:11	2025-06-20 18:59:11	2025-06-20 14:25:11
7067	46	2025-10-21 04:15:47	2025-10-21 08:54:47	2025-10-21 04:15:47
7068	612	2025-10-11 09:22:26	2025-10-11 10:28:26	2025-10-11 09:22:26
7069	905	2025-06-10 10:10:58	2025-06-10 13:42:58	2025-06-10 10:10:58
7070	831	2025-02-02 04:38:12	2025-02-02 09:47:12	2025-02-02 04:38:12
7071	166	2025-01-21 17:07:23	2025-01-21 21:52:23	2025-01-21 17:07:23
7072	520	2024-11-12 16:06:21	2024-11-12 17:09:21	2024-11-12 16:06:21
7073	362	2025-07-05 15:10:41	2025-07-05 17:53:41	2025-07-05 15:10:41
7074	779	2025-07-15 14:40:08	2025-07-15 15:58:08	2025-07-15 14:40:08
7075	36	2025-01-03 17:13:20	2025-01-03 20:03:20	2025-01-03 17:13:20
7076	740	2025-08-12 16:23:11	2025-08-12 19:42:11	2025-08-12 16:23:11
7077	780	2025-09-27 14:28:29	2025-09-27 15:50:29	2025-09-27 14:28:29
7078	592	2025-05-06 14:00:14	2025-05-06 15:22:14	2025-05-06 14:00:14
7079	2	2025-03-16 10:10:23	2025-03-16 11:15:23	2025-03-16 10:10:23
7080	365	2025-05-25 03:10:06	2025-05-25 08:09:06	2025-05-25 03:10:06
7081	546	2025-07-22 16:54:27	2025-07-22 22:36:27	2025-07-22 16:54:27
7082	387	2024-12-08 15:40:51	2024-12-08 19:08:51	2024-12-08 15:40:51
7083	174	2025-04-27 06:30:56	2025-04-27 08:53:56	2025-04-27 06:30:56
7084	570	2025-02-16 17:00:21	2025-02-16 18:05:21	2025-02-16 17:00:21
7085	3	2025-09-28 15:26:49	2025-09-28 16:57:49	2025-09-28 15:26:49
7086	510	2025-05-18 14:41:27	2025-05-18 20:04:27	2025-05-18 14:41:27
7087	650	2025-03-01 18:39:12	2025-03-01 22:27:12	2025-03-01 18:39:12
7088	204	2025-01-04 15:43:50	2025-01-04 19:45:50	2025-01-04 15:43:50
7089	767	2025-01-25 15:23:55	2025-01-25 18:08:55	2025-01-25 15:23:55
7090	717	2025-01-11 13:29:17	2025-01-11 18:15:17	2025-01-11 13:29:17
7091	627	2025-09-30 18:46:43	2025-09-30 20:56:43	2025-09-30 18:46:43
7092	467	2025-05-04 15:25:07	2025-05-04 16:54:07	2025-05-04 15:25:07
7093	118	2025-04-16 17:44:36	2025-04-16 21:18:36	2025-04-16 17:44:36
7094	368	2025-05-13 15:54:48	2025-05-13 19:41:48	2025-05-13 15:54:48
7095	225	2024-12-10 08:28:33	2024-12-10 11:42:33	2024-12-10 08:28:33
7096	310	2025-09-23 15:40:23	2025-09-23 20:52:23	2025-09-23 15:40:23
7097	130	2025-10-07 14:45:08	2025-10-07 16:16:08	2025-10-07 14:45:08
7098	837	2025-08-05 14:53:21	2025-08-05 17:46:21	2025-08-05 14:53:21
7099	311	2025-06-03 18:24:27	2025-06-03 20:42:27	2025-06-03 18:24:27
7100	441	2024-11-26 03:21:36	2024-11-26 07:05:36	2024-11-26 03:21:36
7101	22	2025-05-03 18:33:33	2025-05-03 22:45:33	2025-05-03 18:33:33
7102	107	2025-08-30 14:52:54	2025-08-30 16:23:54	2025-08-30 14:52:54
7103	339	2025-04-13 16:51:41	2025-04-13 20:16:41	2025-04-13 16:51:41
7104	883	2025-03-30 14:16:44	2025-03-30 15:17:44	2025-03-30 14:16:44
7105	98	2025-07-15 17:46:13	2025-07-15 20:12:13	2025-07-15 17:46:13
7106	94	2025-06-17 21:09:09	2025-06-18 00:03:09	2025-06-17 21:09:09
7107	783	2025-07-08 16:08:39	2025-07-08 19:52:39	2025-07-08 16:08:39
7108	175	2025-04-19 05:52:32	2025-04-19 09:36:32	2025-04-19 05:52:32
7109	281	2025-07-12 08:37:13	2025-07-12 11:45:13	2025-07-12 08:37:13
7110	751	2025-05-13 15:22:08	2025-05-13 18:38:08	2025-05-13 15:22:08
7111	217	2025-05-27 16:01:07	2025-05-27 17:41:07	2025-05-27 16:01:07
7112	286	2024-11-16 18:41:55	2024-11-16 20:42:55	2024-11-16 18:41:55
7113	568	2025-09-21 07:48:51	2025-09-21 12:09:51	2025-09-21 07:48:51
7114	82	2025-06-24 09:49:50	2025-06-24 13:23:50	2025-06-24 09:49:50
7115	323	2025-01-11 17:46:07	2025-01-11 19:55:07	2025-01-11 17:46:07
7116	399	2025-02-02 15:30:26	2025-02-02 19:19:26	2025-02-02 15:30:26
7117	634	2025-08-26 14:36:33	2025-08-26 20:19:33	2025-08-26 14:36:33
7118	15	2025-09-28 05:40:54	2025-09-28 11:08:54	2025-09-28 05:40:54
7119	767	2025-06-10 15:44:32	2025-06-10 20:54:32	2025-06-10 15:44:32
7120	838	2025-01-11 17:54:02	2025-01-11 22:43:02	2025-01-11 17:54:02
7121	231	2025-02-08 09:25:25	2025-02-08 13:12:25	2025-02-08 09:25:25
7122	607	2024-11-19 05:34:15	2024-11-19 10:50:15	2024-11-19 05:34:15
7123	88	2025-05-27 16:20:21	2025-05-27 17:52:21	2025-05-27 16:20:21
7124	372	2025-08-05 11:08:36	2025-08-05 13:03:36	2025-08-05 11:08:36
7125	95	2025-03-11 15:09:02	2025-03-11 17:49:02	2025-03-11 15:09:02
7126	851	2025-10-12 08:44:54	2025-10-12 14:24:54	2025-10-12 08:44:54
7127	579	2025-07-05 16:20:54	2025-07-05 18:12:54	2025-07-05 16:20:54
7128	246	2024-12-07 16:53:36	2024-12-07 22:15:36	2024-12-07 16:53:36
7129	14	2025-03-25 17:03:12	2025-03-25 18:12:12	2025-03-25 17:03:12
7130	116	2025-07-25 23:56:33	2025-07-26 04:43:33	2025-07-25 23:56:33
7131	23	2025-08-17 09:22:37	2025-08-17 12:34:37	2025-08-17 09:22:37
7132	364	2025-08-30 14:48:01	2025-08-30 18:45:01	2025-08-30 14:48:01
7133	933	2025-03-02 15:33:36	2025-03-02 19:36:36	2025-03-02 15:33:36
7134	710	2024-11-12 15:51:05	2024-11-12 20:09:05	2024-11-12 15:51:05
7135	213	2025-08-24 18:50:08	2025-08-24 20:05:08	2025-08-24 18:50:08
7136	350	2025-07-08 15:56:17	2025-07-08 17:10:17	2025-07-08 15:56:17
7137	924	2025-03-11 16:27:20	2025-03-11 18:23:20	2025-03-11 16:27:20
7138	96	2025-01-26 11:19:04	2025-01-26 14:53:04	2025-01-26 11:19:04
7139	203	2025-05-31 06:32:53	2025-05-31 10:35:53	2025-05-31 06:32:53
7140	150	2025-10-28 12:39:52	2025-10-28 17:53:52	2025-10-28 12:39:52
7141	485	2025-07-22 14:38:46	2025-07-22 16:02:46	2025-07-22 14:38:46
7142	184	2025-06-20 10:41:34	2025-06-20 15:33:34	2025-06-20 10:41:34
7143	682	2025-08-16 14:14:29	2025-08-16 16:35:29	2025-08-16 14:14:29
7144	235	2025-02-01 07:36:15	2025-02-01 11:32:15	2025-02-01 07:36:15
7145	561	2024-12-01 15:08:38	2024-12-01 18:12:38	2024-12-01 15:08:38
7146	919	2025-03-11 16:38:18	2025-03-11 18:07:18	2025-03-11 16:38:18
7147	389	2025-01-07 09:23:47	2025-01-07 12:51:47	2025-01-07 09:23:47
7148	709	2025-06-14 15:28:16	2025-06-14 17:37:16	2025-06-14 15:28:16
7149	469	2025-01-18 13:14:59	2025-01-18 18:10:59	2025-01-18 13:14:59
7150	330	2025-04-19 16:25:50	2025-04-19 17:39:50	2025-04-19 16:25:50
7151	729	2025-02-04 15:55:53	2025-02-04 18:43:53	2025-02-04 15:55:53
7152	737	2024-11-19 17:10:00	2024-11-19 19:07:00	2024-11-19 17:10:00
7153	369	2025-07-15 14:52:17	2025-07-15 20:08:17	2025-07-15 14:52:17
7154	154	2025-08-23 14:24:33	2025-08-23 15:34:33	2025-08-23 14:24:33
7155	826	2025-09-06 14:36:14	2025-09-06 20:35:14	2025-09-06 14:36:14
7156	295	2025-04-08 09:48:19	2025-04-08 10:59:19	2025-04-08 09:48:19
7157	452	2025-05-06 16:01:02	2025-05-06 20:36:02	2025-05-06 16:01:02
7158	905	2025-03-23 15:45:31	2025-03-23 17:13:31	2025-03-23 15:45:31
7159	190	2025-08-19 16:47:13	2025-08-19 21:45:13	2025-08-19 16:47:13
7160	68	2025-05-27 14:33:19	2025-05-27 17:18:19	2025-05-27 14:33:19
7161	112	2025-07-27 10:30:20	2025-07-27 16:15:20	2025-07-27 10:30:20
7162	402	2024-11-26 11:02:33	2024-11-26 12:53:33	2024-11-26 11:02:33
7163	345	2024-11-30 04:49:48	2024-11-30 10:25:48	2024-11-30 04:49:48
7164	690	2025-03-25 15:13:00	2025-03-25 16:13:00	2025-03-25 15:13:00
7165	611	2025-07-19 15:42:42	2025-07-19 18:21:42	2025-07-19 15:42:42
7166	515	2025-03-01 15:35:39	2025-03-01 20:48:39	2025-03-01 15:35:39
7167	244	2025-06-14 14:46:55	2025-06-14 16:37:55	2025-06-14 14:46:55
7168	418	2025-10-25 15:13:59	2025-10-25 20:24:59	2025-10-25 15:13:59
7169	928	2025-05-24 17:39:42	2025-05-24 19:19:42	2025-05-24 17:39:42
7170	793	2025-10-05 18:47:31	2025-10-05 23:05:31	2025-10-05 18:47:31
7171	257	2025-01-08 19:39:16	2025-01-08 22:21:16	2025-01-08 19:39:16
7172	528	2025-04-05 15:59:40	2025-04-05 18:37:40	2025-04-05 15:59:40
7173	588	2025-01-25 16:45:07	2025-01-25 21:36:07	2025-01-25 16:45:07
7174	402	2025-08-30 15:48:27	2025-08-30 20:53:27	2025-08-30 15:48:27
7175	669	2025-03-04 18:27:24	2025-03-04 20:15:24	2025-03-04 18:27:24
7176	525	2025-04-26 17:54:26	2025-04-26 22:13:26	2025-04-26 17:54:26
7177	519	2024-12-08 17:31:30	2024-12-08 19:42:30	2024-12-08 17:31:30
7178	228	2025-01-09 18:14:23	2025-01-09 19:40:23	2025-01-09 18:14:23
7179	76	2024-11-26 16:55:01	2024-11-26 19:12:01	2024-11-26 16:55:01
7180	176	2024-12-07 16:07:12	2024-12-07 20:38:12	2024-12-07 16:07:12
7181	971	2025-09-30 14:55:33	2025-09-30 18:41:33	2025-09-30 14:55:33
7182	241	2025-10-05 16:19:00	2025-10-05 18:18:00	2025-10-05 16:19:00
7183	357	2025-03-09 16:18:06	2025-03-09 22:08:06	2025-03-09 16:18:06
7184	745	2025-07-19 15:40:26	2025-07-19 18:15:26	2025-07-19 15:40:26
7185	954	2025-04-06 10:56:29	2025-04-06 13:12:29	2025-04-06 10:56:29
7186	400	2024-11-12 13:30:13	2024-11-12 18:27:13	2024-11-12 13:30:13
7187	383	2024-12-03 15:33:19	2024-12-03 16:45:19	2024-12-03 15:33:19
7188	640	2024-12-03 15:30:44	2024-12-03 20:12:44	2024-12-03 15:30:44
7189	647	2025-06-07 16:49:05	2025-06-07 21:30:05	2025-06-07 16:49:05
7190	436	2024-12-31 16:42:23	2024-12-31 18:19:23	2024-12-31 16:42:23
7191	696	2025-09-16 17:40:16	2025-09-16 19:48:16	2025-09-16 17:40:16
7192	423	2025-09-28 14:18:29	2025-09-28 19:18:29	2025-09-28 14:18:29
7193	668	2025-01-21 15:28:29	2025-01-21 20:18:29	2025-01-21 15:28:29
7194	861	2025-05-20 08:16:18	2025-05-20 12:16:18	2025-05-20 08:16:18
7195	685	2025-06-24 16:51:59	2025-06-24 19:40:59	2025-06-24 16:51:59
7196	308	2025-06-10 19:19:24	2025-06-10 21:28:24	2025-06-10 19:19:24
7197	257	2025-06-28 12:46:44	2025-06-28 14:00:44	2025-06-28 12:46:44
7198	985	2025-06-28 15:23:58	2025-06-28 17:10:58	2025-06-28 15:23:58
7199	83	2025-10-05 16:12:55	2025-10-05 21:55:55	2025-10-05 16:12:55
7200	425	2025-11-02 15:33:03	2025-11-02 21:20:03	2025-11-02 15:33:03
7201	927	2025-03-04 16:25:56	2025-03-04 21:14:56	2025-03-04 16:25:56
7202	881	2025-10-07 17:06:10	2025-10-07 22:39:10	2025-10-07 17:06:10
7203	359	2025-03-29 17:49:26	2025-03-29 22:51:26	2025-03-29 17:49:26
7204	844	2025-09-23 17:24:13	2025-09-23 22:44:13	2025-09-23 17:24:13
7205	594	2025-08-10 14:07:38	2025-08-10 15:54:38	2025-08-10 14:07:38
7206	996	2025-10-26 17:58:18	2025-10-26 19:44:18	2025-10-26 17:58:18
7207	960	2025-08-24 15:59:43	2025-08-24 17:28:43	2025-08-24 15:59:43
7208	204	2025-03-02 19:22:27	2025-03-02 22:13:27	2025-03-02 19:22:27
7209	366	2024-11-16 16:42:11	2024-11-16 20:15:11	2024-11-16 16:42:11
7210	835	2025-03-02 16:59:54	2025-03-02 18:32:54	2025-03-02 16:59:54
7211	641	2025-04-13 06:56:28	2025-04-13 09:37:28	2025-04-13 06:56:28
7212	892	2025-04-26 15:53:37	2025-04-26 21:41:37	2025-04-26 15:53:37
7213	394	2025-08-12 14:36:31	2025-08-12 17:09:31	2025-08-12 14:36:31
7214	315	2025-02-18 16:07:28	2025-02-18 20:14:28	2025-02-18 16:07:28
7215	863	2025-05-13 05:16:20	2025-05-13 10:43:20	2025-05-13 05:16:20
7216	824	2025-03-02 17:39:59	2025-03-02 20:51:59	2025-03-02 17:39:59
7217	914	2025-04-15 15:31:37	2025-04-15 17:38:37	2025-04-15 15:31:37
7218	941	2025-02-18 15:04:15	2025-02-18 17:36:15	2025-02-18 15:04:15
7219	720	2025-03-29 17:07:52	2025-03-29 18:46:52	2025-03-29 17:07:52
7220	950	2024-12-17 16:17:01	2024-12-17 21:39:01	2024-12-17 16:17:01
7221	831	2025-07-22 16:08:36	2025-07-22 17:37:36	2025-07-22 16:08:36
7222	666	2025-04-22 14:14:03	2025-04-22 19:08:03	2025-04-22 14:14:03
7223	342	2025-05-31 15:19:12	2025-05-31 16:24:12	2025-05-31 15:19:12
7224	773	2024-11-26 18:15:02	2024-11-26 22:45:02	2024-11-26 18:15:02
7225	16	2025-07-12 16:04:01	2025-07-12 19:14:01	2025-07-12 16:04:01
7226	392	2025-09-12 17:34:58	2025-09-12 21:54:58	2025-09-12 17:34:58
7227	899	2025-01-16 16:15:26	2025-01-16 21:13:26	2025-01-16 16:15:26
7228	815	2025-04-14 15:48:30	2025-04-14 18:40:30	2025-04-14 15:48:30
7229	300	2025-04-27 17:17:35	2025-04-27 18:31:35	2025-04-27 17:17:35
7230	686	2024-12-01 17:22:48	2024-12-01 18:27:48	2024-12-01 17:22:48
7231	518	2025-06-07 16:21:42	2025-06-07 20:11:42	2025-06-07 16:21:42
7232	779	2025-07-12 16:46:35	2025-07-12 19:07:35	2025-07-12 16:46:35
7233	423	2025-03-30 16:42:38	2025-03-30 19:39:38	2025-03-30 16:42:38
7234	433	2025-02-04 01:04:31	2025-02-04 04:30:31	2025-02-04 01:04:31
7235	441	2024-12-10 14:54:08	2024-12-10 17:35:08	2024-12-10 14:54:08
7236	881	2025-02-18 16:01:02	2025-02-18 18:12:02	2025-02-18 16:01:02
7237	186	2025-01-28 16:03:47	2025-01-28 20:34:47	2025-01-28 16:03:47
7238	457	2025-10-19 06:44:06	2025-10-19 08:41:06	2025-10-19 06:44:06
7239	600	2025-06-17 10:49:18	2025-06-17 15:47:18	2025-06-17 10:49:18
7240	676	2025-05-20 04:32:39	2025-05-20 05:51:39	2025-05-20 04:32:39
7241	964	2025-10-08 15:59:53	2025-10-08 19:59:53	2025-10-08 15:59:53
7242	673	2025-11-01 06:49:09	2025-11-01 11:28:09	2025-11-01 06:49:09
7243	594	2025-03-11 19:32:41	2025-03-11 21:42:41	2025-03-11 19:32:41
7244	902	2025-02-08 17:52:45	2025-02-08 21:59:45	2025-02-08 17:52:45
7245	928	2025-10-07 14:07:44	2025-10-07 19:42:44	2025-10-07 14:07:44
7246	996	2025-01-26 18:58:11	2025-01-27 00:24:11	2025-01-26 18:58:11
7247	712	2025-03-23 16:46:14	2025-03-23 17:58:14	2025-03-23 16:46:14
7248	64	2025-06-24 14:46:19	2025-06-24 19:10:19	2025-06-24 14:46:19
7249	725	2025-01-21 16:39:32	2025-01-21 21:42:32	2025-01-21 16:39:32
7250	750	2025-03-23 10:43:47	2025-03-23 14:44:47	2025-03-23 10:43:47
7251	548	2024-12-10 16:31:48	2024-12-10 21:37:48	2024-12-10 16:31:48
7252	916	2025-01-11 15:50:25	2025-01-11 19:35:25	2025-01-11 15:50:25
7253	86	2025-10-04 14:05:04	2025-10-04 16:26:04	2025-10-04 14:05:04
7254	1000	2025-02-08 15:55:42	2025-02-08 19:05:42	2025-02-08 15:55:42
7255	92	2025-08-19 14:10:37	2025-08-19 17:40:37	2025-08-19 14:10:37
7256	957	2024-11-30 19:52:04	2024-11-30 22:16:04	2024-11-30 19:52:04
7257	581	2025-09-16 14:51:31	2025-09-16 20:45:31	2025-09-16 14:51:31
7258	964	2025-09-13 14:43:52	2025-09-13 18:53:52	2025-09-13 14:43:52
7259	174	2024-12-31 15:01:23	2024-12-31 16:29:23	2024-12-31 15:01:23
7260	477	2025-05-25 17:35:49	2025-05-25 22:20:49	2025-05-25 17:35:49
7261	645	2025-08-09 15:45:20	2025-08-09 20:57:20	2025-08-09 15:45:20
7262	85	2025-03-02 16:50:06	2025-03-02 19:26:06	2025-03-02 16:50:06
7263	57	2025-03-02 09:35:28	2025-03-02 12:18:28	2025-03-02 09:35:28
7264	656	2025-06-10 14:08:42	2025-06-10 18:10:42	2025-06-10 14:08:42
7265	491	2024-12-17 09:14:51	2024-12-17 12:43:51	2024-12-17 09:14:51
7266	131	2025-08-23 05:09:56	2025-08-23 10:03:56	2025-08-23 05:09:56
7267	727	2025-04-15 17:57:24	2025-04-15 20:58:24	2025-04-15 17:57:24
7268	88	2025-06-22 02:00:57	2025-06-22 07:21:57	2025-06-22 02:00:57
7269	711	2025-02-23 16:51:02	2025-02-23 21:59:02	2025-02-23 16:51:02
7270	306	2025-01-10 17:41:10	2025-01-10 22:28:10	2025-01-10 17:41:10
7271	141	2024-12-24 17:09:27	2024-12-24 22:16:27	2024-12-24 17:09:27
7272	398	2025-06-24 15:06:51	2025-06-24 18:43:51	2025-06-24 15:06:51
7273	599	2025-01-26 17:01:01	2025-01-26 21:11:01	2025-01-26 17:01:01
7274	354	2025-04-10 18:37:35	2025-04-10 21:25:35	2025-04-10 18:37:35
7275	657	2025-03-11 17:12:52	2025-03-11 21:38:52	2025-03-11 17:12:52
7276	901	2025-08-12 16:06:18	2025-08-12 18:06:18	2025-08-12 16:06:18
7277	415	2025-01-21 17:51:58	2025-01-21 20:22:58	2025-01-21 17:51:58
7278	639	2025-06-01 14:55:14	2025-06-01 18:29:14	2025-06-01 14:55:14
7279	86	2025-09-28 05:36:57	2025-09-28 08:48:57	2025-09-28 05:36:57
7280	389	2025-01-25 17:11:15	2025-01-25 22:32:15	2025-01-25 17:11:15
7281	419	2024-11-10 15:40:04	2024-11-10 21:37:04	2024-11-10 15:40:04
7282	829	2025-11-04 02:14:12	2025-11-04 03:55:12	2025-11-04 02:14:12
7283	607	2025-08-09 08:50:36	2025-08-09 13:55:36	2025-08-09 08:50:36
7284	229	2025-02-04 17:52:12	2025-02-04 21:00:12	2025-02-04 17:52:12
7285	313	2025-07-01 15:48:36	2025-07-01 20:50:36	2025-07-01 15:48:36
7286	846	2025-05-06 07:45:31	2025-05-06 10:54:31	2025-05-06 07:45:31
7287	444	2025-11-04 10:53:54	2025-11-04 13:06:54	2025-11-04 10:53:54
7288	285	2024-12-03 19:22:04	2024-12-03 20:46:04	2024-12-03 19:22:04
7289	285	2025-03-18 15:46:23	2025-03-18 20:15:23	2025-03-18 15:46:23
7290	592	2025-07-12 18:41:39	2025-07-12 20:34:39	2025-07-12 18:41:39
7291	199	2025-03-04 17:35:08	2025-03-04 22:55:08	2025-03-04 17:35:08
7292	831	2025-07-01 15:25:36	2025-07-01 16:43:36	2025-07-01 15:25:36
7293	35	2025-07-01 15:32:41	2025-07-01 20:09:41	2025-07-01 15:32:41
7294	532	2025-02-15 19:05:12	2025-02-15 21:37:12	2025-02-15 19:05:12
7295	381	2025-08-05 15:45:51	2025-08-05 19:53:51	2025-08-05 15:45:51
7296	978	2025-06-22 16:32:34	2025-06-22 19:19:34	2025-06-22 16:32:34
7297	422	2025-05-11 16:27:32	2025-05-11 20:06:32	2025-05-11 16:27:32
7298	823	2025-05-10 16:10:53	2025-05-10 17:36:53	2025-05-10 16:10:53
7299	29	2024-11-10 14:09:31	2024-11-10 20:02:31	2024-11-10 14:09:31
7300	116	2025-07-26 14:07:16	2025-07-26 16:42:16	2025-07-26 14:07:16
7301	679	2024-12-31 16:32:57	2024-12-31 20:54:57	2024-12-31 16:32:57
7302	109	2025-05-31 14:32:27	2025-05-31 18:53:27	2025-05-31 14:32:27
7303	831	2025-10-19 15:48:12	2025-10-19 16:56:12	2025-10-19 15:48:12
7304	264	2025-04-08 18:55:21	2025-04-08 20:58:21	2025-04-08 18:55:21
7305	141	2025-03-25 17:28:22	2025-03-25 18:46:22	2025-03-25 17:28:22
7306	108	2025-09-02 14:31:41	2025-09-02 16:35:41	2025-09-02 14:31:41
7307	248	2025-05-20 15:14:03	2025-05-20 16:34:03	2025-05-20 15:14:03
7308	863	2025-03-29 18:55:29	2025-03-29 22:04:29	2025-03-29 18:55:29
7309	326	2025-05-06 18:54:22	2025-05-07 00:23:22	2025-05-06 18:54:22
7310	54	2025-09-02 18:17:57	2025-09-03 00:10:57	2025-09-02 18:17:57
7311	758	2025-03-15 15:11:01	2025-03-15 20:49:01	2025-03-15 15:11:01
7312	453	2025-05-13 21:15:10	2025-05-14 02:20:10	2025-05-13 21:15:10
7313	880	2025-09-06 14:09:06	2025-09-06 15:31:06	2025-09-06 14:09:06
7314	538	2025-04-13 17:48:55	2025-04-13 19:32:55	2025-04-13 17:48:55
7315	276	2025-05-13 14:56:03	2025-05-13 18:58:03	2025-05-13 14:56:03
7316	121	2025-07-15 19:40:12	2025-07-16 01:36:12	2025-07-15 19:40:12
7317	548	2025-09-09 14:10:13	2025-09-09 18:18:13	2025-09-09 14:10:13
7318	584	2025-02-19 12:00:06	2025-02-19 17:22:06	2025-02-19 12:00:06
7319	961	2025-06-03 18:54:45	2025-06-03 21:07:45	2025-06-03 18:54:45
7320	59	2025-04-01 15:32:38	2025-04-01 20:39:38	2025-04-01 15:32:38
7321	237	2025-03-22 16:57:30	2025-03-22 21:18:30	2025-03-22 16:57:30
7322	606	2025-06-23 15:42:28	2025-06-23 17:19:28	2025-06-23 15:42:28
7323	681	2024-12-31 17:48:08	2024-12-31 23:35:08	2024-12-31 17:48:08
7324	114	2025-03-01 11:05:17	2025-03-01 14:24:17	2025-03-01 11:05:17
7325	995	2025-08-12 05:31:38	2025-08-12 08:41:38	2025-08-12 05:31:38
7326	716	2025-06-03 04:36:17	2025-06-03 08:03:17	2025-06-03 04:36:17
7327	711	2025-07-05 17:16:28	2025-07-05 19:43:28	2025-07-05 17:16:28
7328	636	2025-08-09 16:18:06	2025-08-09 21:59:06	2025-08-09 16:18:06
7329	689	2025-04-06 15:40:55	2025-04-06 21:14:55	2025-04-06 15:40:55
7330	690	2024-11-24 15:59:18	2024-11-24 18:49:18	2024-11-24 15:59:18
7331	12	2025-04-20 18:58:07	2025-04-21 00:28:07	2025-04-20 18:58:07
7332	828	2025-06-10 01:34:13	2025-06-10 05:37:13	2025-06-10 01:34:13
7333	379	2025-05-13 13:26:14	2025-05-13 15:13:14	2025-05-13 13:26:14
7334	817	2025-05-17 15:44:54	2025-05-17 20:09:54	2025-05-17 15:44:54
7335	406	2025-02-16 15:29:15	2025-02-16 18:49:15	2025-02-16 15:29:15
7336	687	2025-08-09 09:46:46	2025-08-09 12:43:46	2025-08-09 09:46:46
7337	671	2025-02-04 19:12:27	2025-02-04 23:32:27	2025-02-04 19:12:27
7338	207	2024-12-24 16:40:30	2024-12-24 19:58:30	2024-12-24 16:40:30
7339	134	2025-01-31 16:33:50	2025-01-31 20:14:50	2025-01-31 16:33:50
7340	982	2025-07-26 15:55:24	2025-07-26 19:17:24	2025-07-26 15:55:24
7341	382	2025-01-14 19:02:37	2025-01-14 21:35:37	2025-01-14 19:02:37
7342	851	2024-11-26 15:15:59	2024-11-26 20:02:59	2024-11-26 15:15:59
7343	516	2025-03-15 15:20:02	2025-03-15 18:45:02	2025-03-15 15:20:02
7344	546	2025-06-22 16:29:47	2025-06-22 22:05:47	2025-06-22 16:29:47
7345	447	2025-09-14 16:43:17	2025-09-14 19:04:17	2025-09-14 16:43:17
7346	805	2024-12-01 17:27:03	2024-12-01 18:33:03	2024-12-01 17:27:03
7347	212	2025-02-11 10:25:24	2025-02-11 16:22:24	2025-02-11 10:25:24
7348	238	2025-04-08 14:46:26	2025-04-08 19:33:26	2025-04-08 14:46:26
7349	964	2025-04-08 15:03:23	2025-04-08 18:05:23	2025-04-08 15:03:23
7350	642	2024-12-17 18:58:04	2024-12-17 23:04:04	2024-12-17 18:58:04
7351	972	2025-02-04 15:41:11	2025-02-04 17:20:11	2025-02-04 15:41:11
7352	415	2025-05-11 16:05:15	2025-05-11 17:47:15	2025-05-11 16:05:15
7353	548	2024-12-24 15:02:57	2024-12-24 20:39:57	2024-12-24 15:02:57
7354	113	2025-02-18 18:20:01	2025-02-18 21:16:01	2025-02-18 18:20:01
7355	154	2025-01-04 17:15:26	2025-01-04 20:22:26	2025-01-04 17:15:26
7356	256	2025-06-01 15:03:52	2025-06-01 17:35:52	2025-06-01 15:03:52
7357	171	2025-10-21 15:18:23	2025-10-21 19:26:23	2025-10-21 15:18:23
7358	47	2025-07-16 15:27:17	2025-07-16 16:47:17	2025-07-16 15:27:17
7359	502	2025-09-13 16:09:01	2025-09-13 20:41:01	2025-09-13 16:09:01
7360	570	2024-11-16 15:29:14	2024-11-16 20:50:14	2024-11-16 15:29:14
7361	77	2025-09-28 15:57:48	2025-09-28 21:09:48	2025-09-28 15:57:48
7362	66	2025-07-06 16:13:28	2025-07-06 21:24:28	2025-07-06 16:13:28
7363	98	2025-08-19 14:25:24	2025-08-19 16:20:24	2025-08-19 14:25:24
7364	775	2025-08-16 10:34:16	2025-08-16 15:41:16	2025-08-16 10:34:16
7365	589	2025-06-14 19:37:55	2025-06-15 00:37:55	2025-06-14 19:37:55
7366	278	2025-09-02 17:05:04	2025-09-02 22:45:04	2025-09-02 17:05:04
7367	343	2025-01-12 10:32:21	2025-01-12 14:28:21	2025-01-12 10:32:21
7368	849	2025-11-01 18:56:52	2025-11-01 22:10:52	2025-11-01 18:56:52
7369	36	2025-04-05 14:19:42	2025-04-05 17:06:42	2025-04-05 14:19:42
7370	99	2024-11-24 22:35:35	2024-11-25 02:09:35	2024-11-24 22:35:35
7371	556	2025-02-16 15:09:50	2025-02-16 18:31:50	2025-02-16 15:09:50
7372	618	2025-02-04 07:55:08	2025-02-04 09:58:08	2025-02-04 07:55:08
7373	960	2025-04-08 11:23:47	2025-04-08 15:48:47	2025-04-08 11:23:47
7374	72	2025-01-07 17:39:30	2025-01-07 22:48:30	2025-01-07 17:39:30
7375	357	2025-10-28 16:18:24	2025-10-28 20:53:24	2025-10-28 16:18:24
7376	523	2025-09-06 15:38:09	2025-09-06 19:04:09	2025-09-06 15:38:09
7377	689	2025-04-12 13:52:54	2025-04-12 19:26:54	2025-04-12 13:52:54
7378	312	2025-02-15 15:18:35	2025-02-15 17:25:35	2025-02-15 15:18:35
7379	707	2025-05-04 15:52:57	2025-05-04 19:14:57	2025-05-04 15:52:57
7380	707	2025-01-04 16:59:33	2025-01-04 21:54:33	2025-01-04 16:59:33
7381	546	2025-10-25 09:29:12	2025-10-25 15:05:12	2025-10-25 09:29:12
7382	956	2025-10-11 16:05:43	2025-10-11 19:51:43	2025-10-11 16:05:43
7383	592	2025-05-03 21:45:41	2025-05-04 00:15:41	2025-05-03 21:45:41
7384	288	2024-11-19 16:34:59	2024-11-19 19:22:59	2024-11-19 16:34:59
7385	286	2025-03-02 15:08:47	2025-03-02 20:24:47	2025-03-02 15:08:47
7386	870	2025-02-09 15:23:03	2025-02-09 17:08:03	2025-02-09 15:23:03
7387	390	2025-02-01 17:12:39	2025-02-01 19:33:39	2025-02-01 17:12:39
7388	688	2024-11-26 18:34:10	2024-11-26 20:21:10	2024-11-26 18:34:10
7389	377	2025-09-28 15:29:16	2025-09-28 16:55:16	2025-09-28 15:29:16
7390	95	2025-04-22 17:22:00	2025-04-22 22:05:00	2025-04-22 17:22:00
7391	234	2025-02-26 18:38:30	2025-02-26 22:04:30	2025-02-26 18:38:30
7392	752	2025-04-05 15:35:25	2025-04-05 21:15:25	2025-04-05 15:35:25
7393	542	2025-11-04 17:23:52	2025-11-04 20:56:52	2025-11-04 17:23:52
7394	166	2024-11-09 17:02:16	2024-11-09 20:21:16	2024-11-09 17:02:16
7395	370	2025-02-16 16:05:12	2025-02-16 21:04:12	2025-02-16 16:05:12
7396	242	2025-07-29 15:32:50	2025-07-29 17:23:50	2025-07-29 15:32:50
7397	521	2025-01-18 16:32:21	2025-01-18 18:44:21	2025-01-18 16:32:21
7398	606	2024-11-17 16:18:25	2024-11-17 20:22:25	2024-11-17 16:18:25
7399	998	2025-04-01 16:58:34	2025-04-01 20:04:34	2025-04-01 16:58:34
7400	59	2025-05-20 16:46:55	2025-05-20 20:31:55	2025-05-20 16:46:55
7401	157	2025-01-28 16:26:29	2025-01-28 19:15:29	2025-01-28 16:26:29
7402	255	2024-12-27 18:52:33	2024-12-27 20:42:33	2024-12-27 18:52:33
7403	256	2025-04-01 14:38:48	2025-04-01 15:45:48	2025-04-01 14:38:48
7404	161	2025-07-05 17:25:14	2025-07-05 19:24:14	2025-07-05 17:25:14
7405	42	2025-08-23 15:42:48	2025-08-23 17:14:48	2025-08-23 15:42:48
7406	2	2025-09-27 14:43:05	2025-09-27 17:33:05	2025-09-27 14:43:05
7407	37	2025-08-17 15:44:35	2025-08-17 18:04:35	2025-08-17 15:44:35
7408	95	2025-04-04 14:44:26	2025-04-04 17:23:26	2025-04-04 14:44:26
7409	672	2024-12-21 15:03:02	2024-12-21 18:50:02	2024-12-21 15:03:02
7410	883	2025-10-05 14:57:17	2025-10-05 20:54:17	2025-10-05 14:57:17
7411	123	2025-02-12 16:25:06	2025-02-12 19:35:06	2025-02-12 16:25:06
7412	76	2024-12-29 11:43:06	2024-12-29 17:19:06	2024-12-29 11:43:06
7413	737	2025-08-12 16:47:54	2025-08-12 22:36:54	2025-08-12 16:47:54
7414	125	2025-05-18 07:44:53	2025-05-18 09:17:53	2025-05-18 07:44:53
7415	890	2025-03-01 15:47:46	2025-03-01 20:07:46	2025-03-01 15:47:46
7416	362	2025-04-22 14:47:20	2025-04-22 18:38:20	2025-04-22 14:47:20
7417	832	2024-11-24 17:42:49	2024-11-24 20:26:49	2024-11-24 17:42:49
7418	925	2025-07-29 18:12:36	2025-07-29 21:55:36	2025-07-29 18:12:36
7419	660	2024-12-24 15:02:32	2024-12-24 18:48:32	2024-12-24 15:02:32
7420	668	2025-06-07 14:34:27	2025-06-07 19:38:27	2025-06-07 14:34:27
7421	265	2025-07-22 16:36:14	2025-07-22 18:13:14	2025-07-22 16:36:14
7422	386	2025-02-26 15:39:22	2025-02-26 17:42:22	2025-02-26 15:39:22
7423	545	2025-06-24 15:59:52	2025-06-24 17:09:52	2025-06-24 15:59:52
7424	444	2025-06-17 14:39:35	2025-06-17 18:23:35	2025-06-17 14:39:35
7425	275	2025-04-19 11:11:29	2025-04-19 15:51:29	2025-04-19 11:11:29
7426	904	2025-02-11 17:55:39	2025-02-11 23:23:39	2025-02-11 17:55:39
7427	290	2025-05-10 15:55:40	2025-05-10 21:23:40	2025-05-10 15:55:40
7428	959	2025-04-12 15:28:53	2025-04-12 20:33:53	2025-04-12 15:28:53
7429	308	2025-06-01 14:01:42	2025-06-01 18:51:42	2025-06-01 14:01:42
7430	684	2025-08-02 14:14:22	2025-08-02 15:38:22	2025-08-02 14:14:22
7431	518	2025-01-25 15:16:32	2025-01-25 16:22:32	2025-01-25 15:16:32
7432	657	2025-10-04 16:51:09	2025-10-04 20:33:09	2025-10-04 16:51:09
7433	207	2025-03-02 17:03:57	2025-03-02 21:10:57	2025-03-02 17:03:57
7434	331	2025-05-11 04:30:18	2025-05-11 09:35:18	2025-05-11 04:30:18
7435	209	2025-02-04 17:15:43	2025-02-04 21:19:43	2025-02-04 17:15:43
7436	752	2024-12-31 19:22:47	2025-01-01 01:07:47	2024-12-31 19:22:47
7437	648	2025-10-07 15:44:34	2025-10-07 21:10:34	2025-10-07 15:44:34
7438	821	2025-11-04 15:33:34	2025-11-04 18:01:34	2025-11-04 15:33:34
7439	272	2025-06-22 17:36:17	2025-06-22 23:05:17	2025-06-22 17:36:17
7440	579	2025-04-20 17:44:47	2025-04-20 20:24:47	2025-04-20 17:44:47
7441	638	2025-03-09 18:22:44	2025-03-09 23:01:44	2025-03-09 18:22:44
7442	739	2025-01-18 14:02:05	2025-01-18 17:55:05	2025-01-18 14:02:05
7443	288	2025-08-10 15:41:52	2025-08-10 18:20:52	2025-08-10 15:41:52
7444	425	2025-02-22 16:59:33	2025-02-22 22:46:33	2025-02-22 16:59:33
7445	257	2025-03-18 15:45:23	2025-03-18 21:24:23	2025-03-18 15:45:23
7446	744	2024-11-16 18:38:00	2024-11-16 21:35:00	2024-11-16 18:38:00
7447	367	2025-08-09 06:20:12	2025-08-09 09:16:12	2025-08-09 06:20:12
7448	529	2025-02-02 16:46:14	2025-02-02 20:54:14	2025-02-02 16:46:14
7449	149	2025-07-12 05:14:17	2025-07-12 08:44:17	2025-07-12 05:14:17
7450	419	2024-12-10 05:50:15	2024-12-10 10:42:15	2024-12-10 05:50:15
7451	219	2024-12-10 08:04:30	2024-12-10 13:43:30	2024-12-10 08:04:30
7452	549	2025-04-08 10:51:20	2025-04-08 12:42:20	2025-04-08 10:51:20
7453	614	2024-12-21 18:00:16	2024-12-21 23:55:16	2024-12-21 18:00:16
7454	946	2025-03-13 17:25:07	2025-03-13 22:09:07	2025-03-13 17:25:07
7455	674	2025-06-22 15:19:59	2025-06-22 20:06:59	2025-06-22 15:19:59
7456	879	2025-09-23 18:25:47	2025-09-23 20:37:47	2025-09-23 18:25:47
7457	14	2025-04-05 18:41:56	2025-04-05 23:46:56	2025-04-05 18:41:56
7458	792	2025-02-18 18:29:49	2025-02-19 00:14:49	2025-02-18 18:29:49
7459	59	2025-07-26 23:39:06	2025-07-27 05:37:06	2025-07-26 23:39:06
7460	700	2025-02-18 17:45:05	2025-02-18 21:38:05	2025-02-18 17:45:05
7461	470	2025-06-03 17:46:23	2025-06-03 20:18:23	2025-06-03 17:46:23
7462	957	2025-04-19 07:57:41	2025-04-19 13:29:41	2025-04-19 07:57:41
7463	824	2024-11-29 18:57:37	2024-11-29 22:53:37	2024-11-29 18:57:37
7464	114	2024-11-28 15:57:06	2024-11-28 21:15:06	2024-11-28 15:57:06
7465	660	2025-04-12 15:07:14	2025-04-12 16:27:14	2025-04-12 15:07:14
7466	581	2025-01-05 16:30:31	2025-01-05 20:40:31	2025-01-05 16:30:31
7467	241	2025-03-29 19:39:47	2025-03-30 00:39:47	2025-03-29 19:39:47
7468	755	2025-04-08 16:14:54	2025-04-08 20:57:54	2025-04-08 16:14:54
7469	344	2024-12-21 16:16:49	2024-12-21 19:09:49	2024-12-21 16:16:49
7470	639	2025-08-12 16:14:31	2025-08-12 19:53:31	2025-08-12 16:14:31
7471	383	2025-10-18 17:57:53	2025-10-18 23:07:53	2025-10-18 17:57:53
7472	805	2025-09-27 14:38:43	2025-09-27 16:26:43	2025-09-27 14:38:43
7473	428	2025-02-15 16:52:33	2025-02-15 20:58:33	2025-02-15 16:52:33
7474	188	2025-05-17 18:58:25	2025-05-18 00:13:25	2025-05-17 18:58:25
7475	285	2025-02-09 18:05:36	2025-02-09 22:53:36	2025-02-09 18:05:36
7476	151	2025-09-13 07:13:14	2025-09-13 12:35:14	2025-09-13 07:13:14
7477	951	2025-06-21 10:41:02	2025-06-21 15:45:02	2025-06-21 10:41:02
7478	506	2024-12-28 17:44:45	2024-12-28 20:02:45	2024-12-28 17:44:45
7479	171	2024-11-17 16:53:57	2024-11-17 19:44:57	2024-11-17 16:53:57
7480	175	2025-02-06 18:23:37	2025-02-06 21:40:37	2025-02-06 18:23:37
7481	220	2025-05-17 18:39:53	2025-05-17 23:32:53	2025-05-17 18:39:53
7482	655	2025-10-07 15:36:50	2025-10-07 20:21:50	2025-10-07 15:36:50
7483	200	2025-06-15 15:42:19	2025-06-15 18:47:19	2025-06-15 15:42:19
7484	519	2025-04-12 14:59:36	2025-04-12 17:32:36	2025-04-12 14:59:36
7485	824	2025-07-29 14:35:39	2025-07-29 17:42:39	2025-07-29 14:35:39
7486	944	2025-10-28 06:00:06	2025-10-28 11:10:06	2025-10-28 06:00:06
7487	398	2025-01-29 16:20:24	2025-01-29 19:51:24	2025-01-29 16:20:24
7488	173	2025-08-01 14:59:36	2025-08-01 17:33:36	2025-08-01 14:59:36
7489	416	2024-12-08 13:40:35	2024-12-08 14:56:35	2024-12-08 13:40:35
7490	203	2025-06-07 05:46:24	2025-06-07 09:25:24	2025-06-07 05:46:24
7491	127	2025-05-13 14:39:21	2025-05-13 18:20:21	2025-05-13 14:39:21
7492	486	2025-02-11 17:10:50	2025-02-11 18:10:50	2025-02-11 17:10:50
7493	777	2025-04-06 03:55:27	2025-04-06 06:06:27	2025-04-06 03:55:27
7494	531	2025-02-25 03:58:49	2025-02-25 06:32:49	2025-02-25 03:58:49
7495	758	2025-07-12 18:52:26	2025-07-12 23:01:26	2025-07-12 18:52:26
7496	54	2025-03-17 17:58:55	2025-03-17 23:03:55	2025-03-17 17:58:55
7497	59	2025-05-03 14:28:18	2025-05-03 15:34:18	2025-05-03 14:28:18
7498	804	2025-10-21 00:49:03	2025-10-21 03:09:03	2025-10-21 00:49:03
7499	833	2025-06-28 18:07:33	2025-06-28 22:08:33	2025-06-28 18:07:33
7500	401	2025-05-20 14:18:55	2025-05-20 17:14:55	2025-05-20 14:18:55
7501	616	2025-06-17 15:43:25	2025-06-17 19:57:25	2025-06-17 15:43:25
7502	163	2025-05-06 16:24:36	2025-05-06 17:44:36	2025-05-06 16:24:36
7503	711	2025-05-17 05:57:01	2025-05-17 11:25:01	2025-05-17 05:57:01
7504	216	2025-03-15 16:17:05	2025-03-15 21:27:05	2025-03-15 16:17:05
7505	347	2025-08-16 14:10:54	2025-08-16 19:00:54	2025-08-16 14:10:54
7506	915	2024-12-24 08:51:57	2024-12-24 10:56:57	2024-12-24 08:51:57
7507	68	2025-01-14 15:08:23	2025-01-14 17:42:23	2025-01-14 15:08:23
7508	130	2025-09-21 14:24:13	2025-09-21 15:34:13	2025-09-21 14:24:13
7509	441	2025-07-13 17:13:34	2025-07-13 20:59:34	2025-07-13 17:13:34
7510	855	2025-05-18 15:33:51	2025-05-18 18:34:51	2025-05-18 15:33:51
7511	302	2025-06-03 15:42:39	2025-06-03 18:52:39	2025-06-03 15:42:39
7512	269	2025-08-10 16:51:13	2025-08-10 19:00:13	2025-08-10 16:51:13
7513	486	2024-11-19 19:29:27	2024-11-19 22:07:27	2024-11-19 19:29:27
7514	726	2025-04-29 06:43:01	2025-04-29 11:37:01	2025-04-29 06:43:01
7515	937	2024-12-31 13:09:21	2024-12-31 17:14:21	2024-12-31 13:09:21
7516	367	2025-06-22 14:11:34	2025-06-22 19:14:34	2025-06-22 14:11:34
7517	743	2025-02-15 15:10:18	2025-02-15 20:35:18	2025-02-15 15:10:18
7518	132	2025-04-22 00:42:09	2025-04-22 04:41:09	2025-04-22 00:42:09
7519	932	2025-09-07 08:46:54	2025-09-07 10:14:54	2025-09-07 08:46:54
7520	212	2025-10-19 14:11:17	2025-10-19 15:29:17	2025-10-19 14:11:17
7521	953	2025-02-15 09:48:18	2025-02-15 15:43:18	2025-02-15 09:48:18
7522	434	2025-09-07 16:11:47	2025-09-07 21:49:47	2025-09-07 16:11:47
7523	234	2025-03-04 14:30:55	2025-03-04 18:04:55	2025-03-04 14:30:55
7524	576	2025-08-16 16:56:11	2025-08-16 21:44:11	2025-08-16 16:56:11
7525	482	2024-12-09 16:09:26	2024-12-09 17:26:26	2024-12-09 16:09:26
7526	770	2024-12-03 16:24:19	2024-12-03 18:25:19	2024-12-03 16:24:19
7527	204	2025-07-31 17:39:43	2025-07-31 19:25:43	2025-07-31 17:39:43
7528	840	2025-04-08 12:35:08	2025-04-08 15:20:08	2025-04-08 12:35:08
7529	150	2025-05-01 17:27:09	2025-05-01 21:59:09	2025-05-01 17:27:09
7530	842	2025-11-04 18:03:42	2025-11-04 22:57:42	2025-11-04 18:03:42
7531	921	2024-12-23 07:34:45	2024-12-23 10:47:45	2024-12-23 07:34:45
7532	953	2024-12-07 17:05:36	2024-12-07 20:21:36	2024-12-07 17:05:36
7533	458	2025-01-09 17:55:02	2025-01-09 19:52:02	2025-01-09 17:55:02
7534	985	2024-11-23 19:52:16	2024-11-24 00:09:16	2024-11-23 19:52:16
7535	832	2025-03-16 15:20:43	2025-03-16 17:24:43	2025-03-16 15:20:43
7536	426	2025-07-05 18:55:15	2025-07-06 00:32:15	2025-07-05 18:55:15
7537	332	2025-09-02 15:56:47	2025-09-02 19:30:47	2025-09-02 15:56:47
7538	648	2025-01-21 15:31:03	2025-01-21 20:12:03	2025-01-21 15:31:03
7539	193	2025-06-15 16:58:54	2025-06-15 21:01:54	2025-06-15 16:58:54
7540	474	2025-09-23 14:13:46	2025-09-23 16:21:46	2025-09-23 14:13:46
7541	785	2024-11-10 17:07:48	2024-11-10 22:51:48	2024-11-10 17:07:48
7542	662	2025-03-22 12:04:49	2025-03-22 16:17:49	2025-03-22 12:04:49
7543	820	2025-05-04 18:27:11	2025-05-04 23:08:11	2025-05-04 18:27:11
7544	761	2025-03-27 19:57:57	2025-03-28 00:02:57	2025-03-27 19:57:57
7545	580	2024-12-22 10:10:58	2024-12-22 14:55:58	2024-12-22 10:10:58
7546	905	2025-09-27 16:37:17	2025-09-27 18:26:17	2025-09-27 16:37:17
7547	535	2025-05-31 14:02:33	2025-05-31 15:09:33	2025-05-31 14:02:33
7548	204	2024-11-24 08:04:28	2024-11-24 10:05:28	2024-11-24 08:04:28
7549	662	2024-12-10 17:30:42	2024-12-10 23:04:42	2024-12-10 17:30:42
7550	75	2025-07-01 15:01:17	2025-07-01 19:07:17	2025-07-01 15:01:17
7551	878	2024-12-01 17:14:29	2024-12-01 18:35:29	2024-12-01 17:14:29
7552	613	2025-08-26 16:07:34	2025-08-26 18:06:34	2025-08-26 16:07:34
7553	300	2025-05-06 14:46:22	2025-05-06 17:43:22	2025-05-06 14:46:22
7554	470	2025-01-10 15:02:24	2025-01-10 16:55:24	2025-01-10 15:02:24
7555	62	2025-08-05 09:54:25	2025-08-05 13:10:25	2025-08-05 09:54:25
7556	787	2024-11-23 16:32:17	2024-11-23 19:25:17	2024-11-23 16:32:17
7557	41	2025-03-25 15:40:55	2025-03-25 18:39:55	2025-03-25 15:40:55
7558	712	2025-09-07 14:57:30	2025-09-07 20:32:30	2025-09-07 14:57:30
7559	608	2025-09-13 18:58:45	2025-09-14 00:27:45	2025-09-13 18:58:45
7560	281	2025-06-10 14:36:32	2025-06-10 18:39:32	2025-06-10 14:36:32
7561	662	2025-05-25 17:57:55	2025-05-25 22:44:55	2025-05-25 17:57:55
7562	91	2025-06-06 15:45:34	2025-06-06 17:00:34	2025-06-06 15:45:34
7563	546	2025-04-29 16:11:01	2025-04-29 18:22:01	2025-04-29 16:11:01
7564	566	2024-12-10 12:06:16	2024-12-10 14:32:16	2024-12-10 12:06:16
7565	615	2025-10-14 17:58:57	2025-10-14 20:23:57	2025-10-14 17:58:57
7566	748	2025-09-21 17:20:08	2025-09-21 19:59:08	2025-09-21 17:20:08
7567	939	2025-02-05 14:05:34	2025-02-05 15:14:34	2025-02-05 14:05:34
7568	691	2025-01-14 15:27:22	2025-01-14 20:42:22	2025-01-14 15:27:22
7569	618	2025-07-29 14:16:35	2025-07-29 17:57:35	2025-07-29 14:16:35
7570	476	2025-01-04 19:59:38	2025-01-04 21:35:38	2025-01-04 19:59:38
7571	399	2025-08-05 06:28:15	2025-08-05 12:02:15	2025-08-05 06:28:15
7572	299	2025-05-30 14:22:19	2025-05-30 17:00:19	2025-05-30 14:22:19
7573	515	2025-03-15 16:11:33	2025-03-15 21:58:33	2025-03-15 16:11:33
7574	421	2025-09-07 15:23:19	2025-09-07 20:44:19	2025-09-07 15:23:19
7575	80	2024-12-14 19:53:28	2024-12-14 21:16:28	2024-12-14 19:53:28
7576	723	2025-11-01 19:31:36	2025-11-01 21:46:36	2025-11-01 19:31:36
7577	60	2025-06-21 14:27:58	2025-06-21 19:36:58	2025-06-21 14:27:58
7578	70	2025-06-22 11:14:10	2025-06-22 12:41:10	2025-06-22 11:14:10
7579	200	2025-07-26 10:37:17	2025-07-26 13:16:17	2025-07-26 10:37:17
7580	457	2024-12-29 15:18:56	2024-12-29 20:40:56	2024-12-29 15:18:56
7581	569	2025-02-04 16:20:08	2025-02-04 22:18:08	2025-02-04 16:20:08
7582	750	2025-06-21 18:06:19	2025-06-21 23:08:19	2025-06-21 18:06:19
7583	823	2025-06-14 14:36:56	2025-06-14 16:07:56	2025-06-14 14:36:56
7584	894	2025-03-04 15:03:31	2025-03-04 18:04:31	2025-03-04 15:03:31
7585	628	2025-03-01 18:10:32	2025-03-01 21:32:32	2025-03-01 18:10:32
7586	896	2025-06-03 16:04:18	2025-06-03 20:09:18	2025-06-03 16:04:18
7587	700	2025-04-05 06:10:18	2025-04-05 10:03:18	2025-04-05 06:10:18
7588	79	2025-09-09 15:51:13	2025-09-09 19:04:13	2025-09-09 15:51:13
7589	694	2024-12-24 17:01:02	2024-12-24 21:59:02	2024-12-24 17:01:02
7590	883	2025-03-25 16:28:33	2025-03-25 19:45:33	2025-03-25 16:28:33
7591	244	2025-04-19 12:41:19	2025-04-19 14:02:19	2025-04-19 12:41:19
7592	228	2025-06-07 14:49:07	2025-06-07 17:02:07	2025-06-07 14:49:07
7593	322	2025-02-04 16:11:49	2025-02-04 18:04:49	2025-02-04 16:11:49
7594	829	2025-04-08 16:41:08	2025-04-08 20:50:08	2025-04-08 16:41:08
7595	424	2025-01-07 19:08:35	2025-01-07 23:13:35	2025-01-07 19:08:35
7596	299	2024-11-15 17:12:26	2024-11-15 19:38:26	2024-11-15 17:12:26
7597	177	2025-02-23 09:32:46	2025-02-23 11:00:46	2025-02-23 09:32:46
7598	329	2025-06-08 15:27:30	2025-06-08 19:03:30	2025-06-08 15:27:30
7599	445	2025-06-06 23:10:58	2025-06-07 00:30:58	2025-06-06 23:10:58
7600	694	2025-10-14 15:56:31	2025-10-14 18:05:31	2025-10-14 15:56:31
7601	153	2025-02-16 15:16:26	2025-02-16 16:17:26	2025-02-16 15:16:26
7602	828	2025-03-30 15:11:52	2025-03-30 18:58:52	2025-03-30 15:11:52
7603	911	2025-01-26 21:33:19	2025-01-27 02:13:19	2025-01-26 21:33:19
7604	943	2025-07-06 07:10:10	2025-07-06 10:05:10	2025-07-06 07:10:10
7605	550	2024-12-31 16:08:17	2024-12-31 21:14:17	2024-12-31 16:08:17
7606	477	2025-10-12 16:25:17	2025-10-12 19:06:17	2025-10-12 16:25:17
7607	876	2025-07-27 08:49:49	2025-07-27 11:02:49	2025-07-27 08:49:49
7608	284	2025-02-01 16:49:28	2025-02-01 18:06:28	2025-02-01 16:49:28
7609	894	2024-12-24 17:15:41	2024-12-24 22:45:41	2024-12-24 17:15:41
7610	639	2025-02-25 17:59:43	2025-02-25 19:36:43	2025-02-25 17:59:43
7611	230	2024-12-01 17:31:20	2024-12-01 19:18:20	2024-12-01 17:31:20
7612	965	2025-03-11 17:30:18	2025-03-11 20:14:18	2025-03-11 17:30:18
7613	881	2025-10-05 14:42:11	2025-10-05 19:34:11	2025-10-05 14:42:11
7614	902	2024-12-21 13:38:16	2024-12-21 17:03:16	2024-12-21 13:38:16
7615	138	2025-07-20 13:30:59	2025-07-20 19:19:59	2025-07-20 13:30:59
7616	192	2025-02-09 19:44:22	2025-02-09 23:25:22	2025-02-09 19:44:22
7617	425	2025-07-08 14:31:34	2025-07-08 16:58:34	2025-07-08 14:31:34
7618	968	2024-11-23 17:37:08	2024-11-23 23:12:08	2024-11-23 17:37:08
7619	97	2025-06-03 14:48:07	2025-06-03 16:51:07	2025-06-03 14:48:07
7620	418	2025-04-08 15:58:54	2025-04-08 18:52:54	2025-04-08 15:58:54
7621	428	2025-06-28 15:19:03	2025-06-28 16:28:03	2025-06-28 15:19:03
7622	186	2025-07-12 16:56:18	2025-07-12 20:25:18	2025-07-12 16:56:18
7623	847	2025-06-03 16:55:24	2025-06-03 19:00:24	2025-06-03 16:55:24
7624	317	2025-07-06 14:27:09	2025-07-06 19:46:09	2025-07-06 14:27:09
7625	831	2025-06-28 16:59:19	2025-06-28 18:18:19	2025-06-28 16:59:19
7626	961	2025-03-23 15:13:36	2025-03-23 18:24:36	2025-03-23 15:13:36
7627	485	2025-04-19 15:13:51	2025-04-19 18:53:51	2025-04-19 15:13:51
7628	923	2025-09-07 09:04:47	2025-09-07 13:55:47	2025-09-07 09:04:47
7629	414	2025-10-19 15:56:04	2025-10-19 19:33:04	2025-10-19 15:56:04
7630	535	2025-01-15 17:39:02	2025-01-15 23:20:02	2025-01-15 17:39:02
7631	635	2024-11-17 15:03:07	2024-11-17 19:38:07	2024-11-17 15:03:07
7632	566	2025-01-26 18:53:16	2025-01-26 20:10:16	2025-01-26 18:53:16
7633	34	2025-05-14 15:12:02	2025-05-14 19:33:02	2025-05-14 15:12:02
7634	316	2025-04-30 15:29:47	2025-04-30 20:46:47	2025-04-30 15:29:47
7635	238	2025-06-21 18:13:16	2025-06-21 21:03:16	2025-06-21 18:13:16
7636	318	2025-10-21 15:07:05	2025-10-21 20:10:05	2025-10-21 15:07:05
7637	989	2025-03-18 05:47:25	2025-03-18 08:32:25	2025-03-18 05:47:25
7638	871	2025-10-04 15:34:04	2025-10-04 18:44:04	2025-10-04 15:34:04
7639	928	2024-12-14 10:22:31	2024-12-14 14:44:31	2024-12-14 10:22:31
7640	434	2025-09-20 03:57:41	2025-09-20 06:07:41	2025-09-20 03:57:41
7641	898	2025-02-15 21:33:13	2025-02-16 03:04:13	2025-02-15 21:33:13
7642	447	2025-01-27 17:48:45	2025-01-27 19:22:45	2025-01-27 17:48:45
7643	135	2025-04-27 15:57:14	2025-04-27 20:10:14	2025-04-27 15:57:14
7644	296	2024-12-31 17:15:55	2024-12-31 22:57:55	2024-12-31 17:15:55
7645	745	2025-03-01 15:09:31	2025-03-01 19:49:31	2025-03-01 15:09:31
7646	632	2025-08-21 16:24:50	2025-08-21 20:24:50	2025-08-21 16:24:50
7647	510	2025-01-12 17:11:55	2025-01-12 18:16:55	2025-01-12 17:11:55
7648	929	2025-07-22 05:32:59	2025-07-22 09:18:59	2025-07-22 05:32:59
7649	334	2024-12-08 17:34:25	2024-12-08 18:44:25	2024-12-08 17:34:25
7650	360	2025-04-05 16:19:43	2025-04-05 17:42:43	2025-04-05 16:19:43
7651	107	2025-07-06 14:46:34	2025-07-06 17:06:34	2025-07-06 14:46:34
7652	319	2024-12-28 17:25:57	2024-12-28 22:06:57	2024-12-28 17:25:57
7653	526	2025-01-12 19:05:06	2025-01-12 21:40:06	2025-01-12 19:05:06
7654	38	2025-10-05 16:31:21	2025-10-05 19:24:21	2025-10-05 16:31:21
7655	237	2024-11-24 00:38:22	2024-11-24 03:48:22	2024-11-24 00:38:22
7656	202	2025-10-11 14:06:13	2025-10-11 15:35:13	2025-10-11 14:06:13
7657	151	2025-10-28 17:48:54	2025-10-28 23:45:54	2025-10-28 17:48:54
7658	665	2025-01-28 15:07:43	2025-01-28 20:41:43	2025-01-28 15:07:43
7659	246	2025-06-28 15:47:00	2025-06-28 17:15:00	2025-06-28 15:47:00
7660	684	2025-10-11 15:20:46	2025-10-11 16:56:46	2025-10-11 15:20:46
7661	709	2025-08-12 14:28:02	2025-08-12 18:28:02	2025-08-12 14:28:02
7662	143	2024-11-26 18:53:41	2024-11-27 00:49:41	2024-11-26 18:53:41
7663	318	2025-10-19 15:24:42	2025-10-19 20:19:42	2025-10-19 15:24:42
7664	281	2025-07-27 15:09:06	2025-07-27 17:19:06	2025-07-27 15:09:06
7665	443	2025-04-26 16:54:02	2025-04-26 22:17:02	2025-04-26 16:54:02
7666	339	2025-03-16 17:30:22	2025-03-16 18:50:22	2025-03-16 17:30:22
7667	622	2025-07-12 14:04:24	2025-07-12 17:36:24	2025-07-12 14:04:24
7668	988	2025-03-09 17:40:35	2025-03-09 19:12:35	2025-03-09 17:40:35
7669	229	2025-03-21 19:45:23	2025-03-21 23:56:23	2025-03-21 19:45:23
7670	993	2025-08-19 09:52:17	2025-08-19 14:28:17	2025-08-19 09:52:17
7671	142	2025-08-28 16:56:32	2025-08-28 19:46:32	2025-08-28 16:56:32
7672	547	2025-06-02 16:28:27	2025-06-02 17:52:27	2025-06-02 16:28:27
7673	557	2025-07-19 18:34:18	2025-07-19 22:46:18	2025-07-19 18:34:18
7674	283	2025-10-25 16:42:37	2025-10-25 20:41:37	2025-10-25 16:42:37
7675	41	2025-03-23 06:49:07	2025-03-23 12:15:07	2025-03-23 06:49:07
7676	566	2025-06-13 15:14:52	2025-06-13 16:17:52	2025-06-13 15:14:52
7677	84	2025-03-08 19:10:51	2025-03-08 23:06:51	2025-03-08 19:10:51
7678	354	2025-02-22 15:27:17	2025-02-22 20:16:17	2025-02-22 15:27:17
7679	679	2025-08-23 15:58:41	2025-08-23 17:54:41	2025-08-23 15:58:41
7680	251	2024-12-21 07:06:28	2024-12-21 11:08:28	2024-12-21 07:06:28
7681	416	2025-04-22 11:15:44	2025-04-22 14:51:44	2025-04-22 11:15:44
7682	749	2025-10-26 17:50:20	2025-10-26 20:17:20	2025-10-26 17:50:20
7683	370	2025-05-27 15:24:06	2025-05-27 20:34:06	2025-05-27 15:24:06
7684	347	2024-12-26 19:05:42	2024-12-26 21:23:42	2024-12-26 19:05:42
7685	459	2024-12-21 17:39:42	2024-12-21 21:12:42	2024-12-21 17:39:42
7686	602	2025-09-16 16:25:02	2025-09-16 19:37:02	2025-09-16 16:25:02
7687	930	2025-06-03 04:43:28	2025-06-03 06:20:28	2025-06-03 04:43:28
7688	964	2025-07-05 17:28:15	2025-07-05 19:28:15	2025-07-05 17:28:15
7689	528	2025-05-03 15:14:08	2025-05-03 18:33:08	2025-05-03 15:14:08
7690	266	2025-10-01 16:35:21	2025-10-01 21:50:21	2025-10-01 16:35:21
7691	91	2024-12-21 15:59:43	2024-12-21 19:07:43	2024-12-21 15:59:43
7692	668	2025-02-02 17:52:55	2025-02-02 22:02:55	2025-02-02 17:52:55
7693	607	2025-05-24 09:19:52	2025-05-24 12:40:52	2025-05-24 09:19:52
7694	764	2025-04-26 16:16:08	2025-04-26 19:52:08	2025-04-26 16:16:08
7695	980	2025-09-14 14:28:02	2025-09-14 17:23:02	2025-09-14 14:28:02
7696	573	2025-08-31 01:42:32	2025-08-31 02:52:32	2025-08-31 01:42:32
7697	144	2025-08-12 15:54:46	2025-08-12 17:09:46	2025-08-12 15:54:46
7698	850	2025-07-08 17:22:56	2025-07-08 22:22:56	2025-07-08 17:22:56
7699	913	2024-12-14 18:59:45	2024-12-15 00:05:45	2024-12-14 18:59:45
7700	139	2025-05-24 17:23:57	2025-05-24 21:28:57	2025-05-24 17:23:57
7701	157	2025-04-20 09:04:07	2025-04-20 14:31:07	2025-04-20 09:04:07
7702	214	2025-06-14 14:52:02	2025-06-14 17:07:02	2025-06-14 14:52:02
7703	457	2025-09-14 14:43:37	2025-09-14 16:58:37	2025-09-14 14:43:37
7704	302	2025-07-19 15:41:27	2025-07-19 17:47:27	2025-07-19 15:41:27
7705	347	2024-11-17 16:05:21	2024-11-17 19:38:21	2024-11-17 16:05:21
7706	399	2025-09-02 04:24:42	2025-09-02 07:12:42	2025-09-02 04:24:42
7707	352	2025-03-18 15:20:48	2025-03-18 19:59:48	2025-03-18 15:20:48
7708	108	2024-12-29 07:34:10	2024-12-29 09:54:10	2024-12-29 07:34:10
7709	403	2025-06-21 16:47:16	2025-06-21 20:13:16	2025-06-21 16:47:16
7710	528	2025-10-05 17:33:00	2025-10-05 21:56:00	2025-10-05 17:33:00
7711	82	2024-12-29 16:04:55	2024-12-29 18:42:55	2024-12-29 16:04:55
7712	885	2025-07-08 15:22:34	2025-07-08 20:26:34	2025-07-08 15:22:34
7713	655	2025-07-20 14:22:37	2025-07-20 17:52:37	2025-07-20 14:22:37
7714	433	2024-11-17 17:25:10	2024-11-17 20:13:10	2024-11-17 17:25:10
7715	146	2025-08-26 15:40:15	2025-08-26 18:50:15	2025-08-26 15:40:15
7716	696	2024-12-03 15:50:46	2024-12-03 16:50:46	2024-12-03 15:50:46
7717	583	2025-04-13 17:35:41	2025-04-13 21:17:41	2025-04-13 17:35:41
7718	330	2025-08-12 14:48:04	2025-08-12 20:21:04	2025-08-12 14:48:04
7719	431	2025-02-23 16:50:38	2025-02-23 21:36:38	2025-02-23 16:50:38
7720	797	2024-11-26 17:47:59	2024-11-26 22:31:59	2024-11-26 17:47:59
7721	114	2025-08-03 14:20:13	2025-08-03 19:52:13	2025-08-03 14:20:13
7722	617	2025-09-06 16:36:26	2025-09-06 20:48:26	2025-09-06 16:36:26
7723	170	2025-07-08 06:38:59	2025-07-08 09:14:59	2025-07-08 06:38:59
7724	502	2025-04-20 15:30:31	2025-04-20 18:54:31	2025-04-20 15:30:31
7725	890	2025-05-18 06:46:13	2025-05-18 09:09:13	2025-05-18 06:46:13
7726	157	2024-12-29 17:34:05	2024-12-29 18:48:05	2024-12-29 17:34:05
7727	943	2025-05-20 17:37:44	2025-05-20 21:16:44	2025-05-20 17:37:44
7728	135	2025-06-21 16:04:31	2025-06-21 20:26:31	2025-06-21 16:04:31
7729	77	2025-02-11 16:38:20	2025-02-11 18:35:20	2025-02-11 16:38:20
7730	444	2025-03-04 11:06:31	2025-03-04 16:16:31	2025-03-04 11:06:31
7731	752	2025-10-11 15:54:42	2025-10-11 18:12:42	2025-10-11 15:54:42
7732	564	2025-01-25 17:00:51	2025-01-25 21:11:51	2025-01-25 17:00:51
7733	264	2025-04-12 08:37:43	2025-04-12 13:35:43	2025-04-12 08:37:43
7734	787	2025-03-01 05:45:29	2025-03-01 07:52:29	2025-03-01 05:45:29
7735	140	2025-05-13 16:19:35	2025-05-13 21:03:35	2025-05-13 16:19:35
7736	529	2025-08-23 08:40:35	2025-08-23 10:36:35	2025-08-23 08:40:35
7737	288	2025-02-11 15:20:36	2025-02-11 19:49:36	2025-02-11 15:20:36
7738	75	2025-08-08 14:56:08	2025-08-08 17:22:08	2025-08-08 14:56:08
7739	927	2025-08-26 16:21:54	2025-08-26 17:52:54	2025-08-26 16:21:54
7740	2	2025-04-29 21:28:06	2025-04-29 23:09:06	2025-04-29 21:28:06
7741	116	2025-03-25 14:08:48	2025-03-25 15:48:48	2025-03-25 14:08:48
7742	369	2025-08-19 15:06:22	2025-08-19 20:52:22	2025-08-19 15:06:22
7743	915	2025-04-19 14:17:50	2025-04-19 19:01:50	2025-04-19 14:17:50
7744	328	2025-09-07 15:30:18	2025-09-07 20:43:18	2025-09-07 15:30:18
7745	183	2025-07-08 14:19:43	2025-07-08 18:03:43	2025-07-08 14:19:43
7746	840	2025-05-31 18:10:43	2025-05-31 20:47:43	2025-05-31 18:10:43
7747	745	2025-01-25 05:09:59	2025-01-25 09:59:59	2025-01-25 05:09:59
7748	388	2025-08-02 05:03:16	2025-08-02 08:07:16	2025-08-02 05:03:16
7749	794	2025-08-07 19:33:04	2025-08-07 23:16:04	2025-08-07 19:33:04
7750	690	2025-07-08 16:18:38	2025-07-08 19:17:38	2025-07-08 16:18:38
7751	396	2025-02-09 15:04:15	2025-02-09 17:28:15	2025-02-09 15:04:15
7752	604	2025-05-17 16:16:02	2025-05-17 19:12:02	2025-05-17 16:16:02
7753	547	2025-09-07 08:39:30	2025-09-07 11:21:30	2025-09-07 08:39:30
7754	607	2025-09-20 14:32:11	2025-09-20 19:52:11	2025-09-20 14:32:11
7755	757	2025-08-05 16:47:47	2025-08-05 17:55:47	2025-08-05 16:47:47
7756	842	2025-01-14 12:45:32	2025-01-14 17:10:32	2025-01-14 12:45:32
7757	249	2025-07-12 05:02:34	2025-07-12 08:41:34	2025-07-12 05:02:34
7758	904	2025-01-12 17:21:57	2025-01-12 19:17:57	2025-01-12 17:21:57
7759	870	2025-05-13 16:38:47	2025-05-13 19:03:47	2025-05-13 16:38:47
7760	825	2025-03-15 17:51:09	2025-03-15 22:25:09	2025-03-15 17:51:09
7761	41	2025-08-31 15:18:58	2025-08-31 20:53:58	2025-08-31 15:18:58
7762	722	2025-09-30 12:07:37	2025-09-30 14:13:37	2025-09-30 12:07:37
7763	866	2025-04-06 16:19:32	2025-04-06 21:28:32	2025-04-06 16:19:32
7764	603	2025-09-23 16:26:08	2025-09-23 18:59:08	2025-09-23 16:26:08
7765	345	2025-10-05 20:30:16	2025-10-05 22:27:16	2025-10-05 20:30:16
7766	235	2025-03-17 19:34:01	2025-03-17 23:48:01	2025-03-17 19:34:01
7767	657	2025-03-11 15:03:38	2025-03-11 20:29:38	2025-03-11 15:03:38
7768	861	2025-03-04 13:46:56	2025-03-04 16:07:56	2025-03-04 13:46:56
7769	803	2025-02-01 09:28:13	2025-02-01 15:20:13	2025-02-01 09:28:13
7770	799	2025-06-21 14:59:49	2025-06-21 19:57:49	2025-06-21 14:59:49
7771	302	2025-01-18 15:00:26	2025-01-18 20:18:26	2025-01-18 15:00:26
7772	833	2025-09-16 20:26:01	2025-09-16 21:39:01	2025-09-16 20:26:01
7773	611	2025-06-07 16:40:46	2025-06-07 19:44:46	2025-06-07 16:40:46
7774	850	2025-02-25 17:21:27	2025-02-25 19:18:27	2025-02-25 17:21:27
7775	536	2025-06-07 11:53:28	2025-06-07 15:08:28	2025-06-07 11:53:28
7776	628	2025-01-21 17:50:56	2025-01-21 23:46:56	2025-01-21 17:50:56
7777	901	2025-02-02 17:12:03	2025-02-02 22:55:03	2025-02-02 17:12:03
7778	558	2025-10-26 18:53:09	2025-10-26 23:16:09	2025-10-26 18:53:09
7779	777	2025-10-19 16:34:32	2025-10-19 22:09:32	2025-10-19 16:34:32
7780	842	2025-02-23 17:47:27	2025-02-23 19:33:27	2025-02-23 17:47:27
7781	992	2025-08-23 18:51:19	2025-08-23 20:12:19	2025-08-23 18:51:19
7782	650	2025-01-25 15:58:09	2025-01-25 18:48:09	2025-01-25 15:58:09
7783	712	2025-03-22 08:48:17	2025-03-22 12:39:17	2025-03-22 08:48:17
7784	778	2025-07-12 16:21:02	2025-07-12 22:16:02	2025-07-12 16:21:02
7785	579	2024-11-17 18:13:04	2024-11-17 22:04:04	2024-11-17 18:13:04
7786	549	2025-08-24 17:00:28	2025-08-24 18:31:28	2025-08-24 17:00:28
7787	398	2025-09-21 05:28:54	2025-09-21 07:39:54	2025-09-21 05:28:54
7788	836	2025-09-20 04:42:14	2025-09-20 07:32:14	2025-09-20 04:42:14
7789	156	2025-01-11 17:40:50	2025-01-11 23:07:50	2025-01-11 17:40:50
7790	27	2025-04-08 08:22:18	2025-04-08 13:54:18	2025-04-08 08:22:18
7791	320	2024-11-30 16:00:17	2024-11-30 20:10:17	2024-11-30 16:00:17
7792	750	2025-11-04 17:09:21	2025-11-04 21:55:21	2025-11-04 17:09:21
7793	353	2025-09-07 16:03:56	2025-09-07 18:47:56	2025-09-07 16:03:56
7794	188	2025-08-30 14:55:21	2025-08-30 15:57:21	2025-08-30 14:55:21
7795	493	2025-01-18 19:26:35	2025-01-18 23:08:35	2025-01-18 19:26:35
7796	325	2025-07-07 06:47:22	2025-07-07 11:45:22	2025-07-07 06:47:22
7797	724	2024-11-16 17:45:17	2024-11-16 22:23:17	2024-11-16 17:45:17
7798	113	2025-07-06 18:43:58	2025-07-06 20:42:58	2025-07-06 18:43:58
7799	92	2025-02-04 16:11:21	2025-02-04 20:59:21	2025-02-04 16:11:21
7800	34	2025-07-27 16:03:57	2025-07-27 22:02:57	2025-07-27 16:03:57
7801	271	2025-08-09 14:18:29	2025-08-09 18:24:29	2025-08-09 14:18:29
7802	588	2025-09-28 15:46:32	2025-09-28 17:05:32	2025-09-28 15:46:32
7803	327	2025-07-12 15:29:53	2025-07-12 20:36:53	2025-07-12 15:29:53
7804	59	2025-09-23 09:24:21	2025-09-23 12:12:21	2025-09-23 09:24:21
7805	461	2024-11-26 16:46:57	2024-11-26 17:55:57	2024-11-26 16:46:57
7806	656	2025-03-30 17:47:20	2025-03-30 19:59:20	2025-03-30 17:47:20
7807	867	2025-05-24 14:32:14	2025-05-24 17:12:14	2025-05-24 14:32:14
7808	93	2025-07-05 14:24:15	2025-07-05 18:49:15	2025-07-05 14:24:15
7809	389	2025-05-11 17:47:24	2025-05-11 22:27:24	2025-05-11 17:47:24
7810	941	2024-12-03 17:20:07	2024-12-03 23:11:07	2024-12-03 17:20:07
7811	606	2025-06-01 15:16:10	2025-06-01 18:27:10	2025-06-01 15:16:10
7812	277	2025-06-03 08:41:49	2025-06-03 13:11:49	2025-06-03 08:41:49
7813	421	2025-10-11 14:51:44	2025-10-11 19:06:44	2025-10-11 14:51:44
7814	336	2025-03-01 15:04:55	2025-03-01 19:35:55	2025-03-01 15:04:55
7815	458	2025-06-15 04:11:19	2025-06-15 08:17:19	2025-06-15 04:11:19
7816	988	2024-12-29 17:58:04	2024-12-29 22:53:04	2024-12-29 17:58:04
7817	855	2025-04-27 15:49:15	2025-04-27 18:55:15	2025-04-27 15:49:15
7818	780	2025-06-03 14:13:39	2025-06-03 16:43:39	2025-06-03 14:13:39
7819	559	2025-06-13 14:00:23	2025-06-13 18:01:23	2025-06-13 14:00:23
7820	565	2025-02-15 17:40:05	2025-02-15 21:47:05	2025-02-15 17:40:05
7821	525	2025-03-16 17:26:17	2025-03-16 18:55:17	2025-03-16 17:26:17
7822	93	2025-03-01 16:04:16	2025-03-01 18:48:16	2025-03-01 16:04:16
7823	843	2024-12-22 15:17:01	2024-12-22 17:30:01	2024-12-22 15:17:01
7824	165	2025-02-18 17:48:17	2025-02-18 21:35:17	2025-02-18 17:48:17
7825	65	2025-02-22 15:32:17	2025-02-22 17:23:17	2025-02-22 15:32:17
7826	960	2025-08-02 16:15:57	2025-08-02 22:08:57	2025-08-02 16:15:57
7827	989	2025-03-25 16:37:39	2025-03-25 19:33:39	2025-03-25 16:37:39
7828	923	2025-04-20 15:35:28	2025-04-20 17:38:28	2025-04-20 15:35:28
7829	283	2025-10-18 16:44:27	2025-10-18 22:41:27	2025-10-18 16:44:27
7830	347	2025-07-01 16:05:45	2025-07-01 19:06:45	2025-07-01 16:05:45
7831	640	2025-02-25 15:56:05	2025-02-25 19:26:05	2025-02-25 15:56:05
7832	409	2025-08-16 14:52:23	2025-08-16 16:00:23	2025-08-16 14:52:23
7833	175	2025-06-17 15:09:58	2025-06-17 20:21:58	2025-06-17 15:09:58
7834	628	2025-01-14 17:21:00	2025-01-14 21:42:00	2025-01-14 17:21:00
7835	889	2025-03-26 16:40:48	2025-03-26 19:57:48	2025-03-26 16:40:48
7836	970	2025-03-19 16:00:10	2025-03-19 20:10:10	2025-03-19 16:00:10
7837	429	2025-06-17 15:10:41	2025-06-17 16:27:41	2025-06-17 15:10:41
7838	230	2025-08-30 15:48:38	2025-08-30 17:39:38	2025-08-30 15:48:38
7839	320	2025-04-12 16:18:21	2025-04-12 20:40:21	2025-04-12 16:18:21
7840	330	2025-06-17 18:19:03	2025-06-17 22:50:03	2025-06-17 18:19:03
7841	970	2025-04-01 10:17:04	2025-04-01 14:30:04	2025-04-01 10:17:04
7842	477	2025-07-08 16:17:08	2025-07-08 17:32:08	2025-07-08 16:17:08
7843	698	2025-06-22 14:16:14	2025-06-22 19:43:14	2025-06-22 14:16:14
7844	112	2025-07-26 16:46:49	2025-07-26 17:52:49	2025-07-26 16:46:49
7845	329	2025-09-09 04:50:01	2025-09-09 05:55:01	2025-09-09 04:50:01
7846	338	2025-05-20 01:12:52	2025-05-20 07:05:52	2025-05-20 01:12:52
7847	670	2025-07-05 14:24:44	2025-07-05 16:08:44	2025-07-05 14:24:44
7848	632	2025-07-27 15:51:03	2025-07-27 20:06:03	2025-07-27 15:51:03
7849	129	2024-12-03 19:42:41	2024-12-03 23:39:41	2024-12-03 19:42:41
7850	570	2025-01-09 15:33:08	2025-01-09 19:20:08	2025-01-09 15:33:08
7851	677	2025-06-29 00:02:41	2025-06-29 03:40:41	2025-06-29 00:02:41
7852	848	2025-01-21 02:03:30	2025-01-21 05:48:30	2025-01-21 02:03:30
7853	547	2025-06-14 14:19:51	2025-06-14 16:44:51	2025-06-14 14:19:51
7854	299	2024-12-21 18:52:44	2024-12-21 20:28:44	2024-12-21 18:52:44
7855	629	2024-12-15 17:55:01	2024-12-15 23:52:01	2024-12-15 17:55:01
7856	6	2024-11-26 19:57:27	2024-11-27 01:00:27	2024-11-26 19:57:27
7857	199	2024-12-31 17:59:12	2024-12-31 22:34:12	2024-12-31 17:59:12
7858	837	2025-02-09 08:27:01	2025-02-09 10:58:01	2025-02-09 08:27:01
7859	119	2025-09-01 22:02:20	2025-09-01 23:04:20	2025-09-01 22:02:20
7860	793	2024-12-08 07:48:18	2024-12-08 12:41:18	2024-12-08 07:48:18
7861	739	2025-01-06 15:51:20	2025-01-06 17:41:20	2025-01-06 15:51:20
7862	23	2025-06-08 09:36:40	2025-06-08 11:05:40	2025-06-08 09:36:40
7863	235	2025-08-10 14:02:22	2025-08-10 17:49:22	2025-08-10 14:02:22
7864	809	2025-01-19 17:19:58	2025-01-19 18:23:58	2025-01-19 17:19:58
7865	559	2025-04-01 18:35:28	2025-04-01 23:03:28	2025-04-01 18:35:28
7866	186	2025-07-05 15:49:45	2025-07-05 18:37:45	2025-07-05 15:49:45
7867	348	2025-06-19 16:18:45	2025-06-19 20:20:45	2025-06-19 16:18:45
7868	644	2025-07-15 15:18:59	2025-07-15 20:23:59	2025-07-15 15:18:59
7869	178	2025-08-12 07:14:42	2025-08-12 09:03:42	2025-08-12 07:14:42
7870	259	2025-05-25 15:56:12	2025-05-25 20:54:12	2025-05-25 15:56:12
7871	627	2024-12-28 04:07:55	2024-12-28 07:48:55	2024-12-28 04:07:55
7872	807	2025-09-07 16:24:07	2025-09-07 18:23:07	2025-09-07 16:24:07
7873	716	2025-01-05 16:16:05	2025-01-05 17:20:05	2025-01-05 16:16:05
7874	893	2025-02-23 15:42:38	2025-02-23 18:16:38	2025-02-23 15:42:38
7875	738	2024-11-26 17:07:12	2024-11-26 20:34:12	2024-11-26 17:07:12
7876	766	2025-01-11 17:40:44	2025-01-11 22:45:44	2025-01-11 17:40:44
7877	34	2025-04-18 15:31:34	2025-04-18 18:04:34	2025-04-18 15:31:34
7878	287	2025-01-28 17:51:23	2025-01-28 23:33:23	2025-01-28 17:51:23
7879	8	2025-01-04 18:36:23	2025-01-04 23:19:23	2025-01-04 18:36:23
7880	699	2025-04-06 14:50:06	2025-04-06 19:01:06	2025-04-06 14:50:06
7881	25	2025-09-02 16:15:26	2025-09-02 17:31:26	2025-09-02 16:15:26
7882	180	2024-11-17 17:51:57	2024-11-17 19:41:57	2024-11-17 17:51:57
7883	332	2025-06-24 14:40:33	2025-06-24 19:43:33	2025-06-24 14:40:33
7884	361	2025-05-31 14:00:25	2025-05-31 16:32:25	2025-05-31 14:00:25
7885	562	2025-09-23 16:41:09	2025-09-23 18:58:09	2025-09-23 16:41:09
7886	237	2025-09-02 14:51:53	2025-09-02 17:20:53	2025-09-02 14:51:53
7887	535	2025-07-22 16:13:59	2025-07-22 18:24:59	2025-07-22 16:13:59
7888	975	2025-05-20 14:00:33	2025-05-20 17:36:33	2025-05-20 14:00:33
7889	469	2025-09-20 14:28:42	2025-09-20 17:44:42	2025-09-20 14:28:42
7890	600	2024-11-20 15:58:58	2024-11-20 20:38:58	2024-11-20 15:58:58
7891	106	2025-02-25 15:45:49	2025-02-25 18:10:49	2025-02-25 15:45:49
7892	858	2025-06-24 17:55:51	2025-06-24 20:31:51	2025-06-24 17:55:51
7893	28	2025-04-13 14:54:44	2025-04-13 20:41:44	2025-04-13 14:54:44
7894	505	2025-02-16 16:04:37	2025-02-16 19:32:37	2025-02-16 16:04:37
7895	311	2025-01-26 09:04:21	2025-01-26 14:12:21	2025-01-26 09:04:21
7896	746	2025-06-10 15:19:59	2025-06-10 20:43:59	2025-06-10 15:19:59
7897	264	2025-06-03 16:10:01	2025-06-03 19:14:01	2025-06-03 16:10:01
7898	453	2025-08-02 16:00:21	2025-08-02 18:34:21	2025-08-02 16:00:21
7899	92	2025-01-11 16:46:12	2025-01-11 20:48:12	2025-01-11 16:46:12
7900	4	2025-08-23 18:29:52	2025-08-23 23:31:52	2025-08-23 18:29:52
7901	492	2025-06-03 17:44:45	2025-06-03 23:05:45	2025-06-03 17:44:45
7902	282	2025-04-13 16:32:30	2025-04-13 20:18:30	2025-04-13 16:32:30
7903	500	2025-03-01 15:11:43	2025-03-01 19:38:43	2025-03-01 15:11:43
7904	289	2025-08-10 16:55:00	2025-08-10 19:57:00	2025-08-10 16:55:00
7905	498	2025-02-18 19:59:20	2025-02-19 00:16:20	2025-02-18 19:59:20
7906	83	2024-11-12 15:33:15	2024-11-12 21:07:15	2024-11-12 15:33:15
7907	964	2025-09-14 01:00:33	2025-09-14 04:57:33	2025-09-14 01:00:33
7908	266	2024-11-24 15:15:24	2024-11-24 20:22:24	2024-11-24 15:15:24
7909	816	2025-09-23 15:42:16	2025-09-23 21:13:16	2025-09-23 15:42:16
7910	782	2024-11-24 17:30:47	2024-11-24 20:58:47	2024-11-24 17:30:47
7911	360	2024-12-14 17:59:07	2024-12-14 22:00:07	2024-12-14 17:59:07
7912	789	2025-11-01 13:16:36	2025-11-01 16:35:36	2025-11-01 13:16:36
7913	235	2025-07-13 13:35:17	2025-07-13 19:17:17	2025-07-13 13:35:17
7914	586	2024-12-10 16:17:46	2024-12-10 19:24:46	2024-12-10 16:17:46
7915	409	2025-05-06 16:21:31	2025-05-06 20:05:31	2025-05-06 16:21:31
7916	774	2025-02-22 15:46:41	2025-02-22 19:01:41	2025-02-22 15:46:41
7917	318	2025-01-28 15:31:44	2025-01-28 16:48:44	2025-01-28 15:31:44
7918	534	2025-03-08 17:25:58	2025-03-08 21:05:58	2025-03-08 17:25:58
7919	989	2025-08-03 18:41:17	2025-08-04 00:08:17	2025-08-03 18:41:17
7920	758	2025-05-24 16:33:39	2025-05-24 19:33:39	2025-05-24 16:33:39
7921	924	2025-04-22 14:33:57	2025-04-22 16:37:57	2025-04-22 14:33:57
7922	667	2025-03-04 17:25:42	2025-03-04 20:29:42	2025-03-04 17:25:42
7923	425	2025-09-02 16:51:18	2025-09-02 19:53:18	2025-09-02 16:51:18
7924	532	2025-01-21 19:13:08	2025-01-21 22:33:08	2025-01-21 19:13:08
7925	560	2025-08-03 14:26:02	2025-08-03 17:03:02	2025-08-03 14:26:02
7926	924	2025-08-19 05:32:26	2025-08-19 08:41:26	2025-08-19 05:32:26
7927	624	2025-07-15 16:02:28	2025-07-15 18:19:28	2025-07-15 16:02:28
7928	869	2025-03-15 07:06:21	2025-03-15 11:27:21	2025-03-15 07:06:21
7929	108	2024-11-24 15:14:16	2024-11-24 20:30:16	2024-11-24 15:14:16
7930	927	2025-03-08 17:51:54	2025-03-08 20:22:54	2025-03-08 17:51:54
7931	678	2025-05-27 17:27:28	2025-05-27 23:07:28	2025-05-27 17:27:28
7932	266	2025-07-01 15:17:25	2025-07-01 16:43:25	2025-07-01 15:17:25
7933	988	2025-10-04 08:47:59	2025-10-04 13:40:59	2025-10-04 08:47:59
7934	70	2024-12-01 15:51:00	2024-12-01 20:00:00	2024-12-01 15:51:00
7935	72	2024-11-19 05:28:10	2024-11-19 08:40:10	2024-11-19 05:28:10
7936	245	2025-02-22 18:10:11	2025-02-22 20:54:11	2025-02-22 18:10:11
7937	545	2025-04-19 16:17:16	2025-04-19 20:37:16	2025-04-19 16:17:16
7938	1	2025-03-27 09:54:15	2025-03-27 14:47:15	2025-03-27 09:54:15
7939	192	2025-11-01 16:23:24	2025-11-01 17:58:24	2025-11-01 16:23:24
7940	975	2025-10-25 14:26:48	2025-10-25 18:52:48	2025-10-25 14:26:48
7941	738	2025-01-14 15:51:29	2025-01-14 17:09:29	2025-01-14 15:51:29
7942	231	2025-06-28 15:15:15	2025-06-28 19:40:15	2025-06-28 15:15:15
7943	839	2025-10-26 15:32:03	2025-10-26 18:23:03	2025-10-26 15:32:03
7944	395	2025-08-10 15:35:49	2025-08-10 21:02:49	2025-08-10 15:35:49
7945	803	2025-03-23 08:37:57	2025-03-23 10:57:57	2025-03-23 08:37:57
7946	612	2024-12-17 15:17:21	2024-12-17 18:47:21	2024-12-17 15:17:21
7947	348	2025-07-31 10:12:16	2025-07-31 15:43:16	2025-07-31 10:12:16
7948	460	2025-01-07 15:52:15	2025-01-07 21:38:15	2025-01-07 15:52:15
7949	650	2025-03-09 15:51:45	2025-03-09 19:14:45	2025-03-09 15:51:45
7950	560	2025-10-14 14:18:13	2025-10-14 18:02:13	2025-10-14 14:18:13
7951	854	2025-03-29 16:26:16	2025-03-29 17:29:16	2025-03-29 16:26:16
7952	773	2024-12-29 18:58:57	2024-12-29 22:38:57	2024-12-29 18:58:57
7953	102	2025-01-04 18:38:29	2025-01-04 21:56:29	2025-01-04 18:38:29
7954	429	2024-11-30 18:19:54	2024-11-30 20:54:54	2024-11-30 18:19:54
7955	261	2025-05-31 07:08:56	2025-05-31 08:31:56	2025-05-31 07:08:56
7956	498	2025-07-29 21:25:43	2025-07-30 01:34:43	2025-07-29 21:25:43
7957	101	2024-12-07 04:37:32	2024-12-07 06:03:32	2024-12-07 04:37:32
7958	684	2024-12-10 17:06:55	2024-12-10 21:14:55	2024-12-10 17:06:55
7959	516	2024-11-13 15:21:08	2024-11-13 18:50:08	2024-11-13 15:21:08
7960	4	2025-02-18 15:21:22	2025-02-18 17:34:22	2025-02-18 15:21:22
7961	831	2025-04-26 18:50:55	2025-04-26 22:46:55	2025-04-26 18:50:55
7962	398	2025-07-12 14:16:50	2025-07-12 16:52:50	2025-07-12 14:16:50
7963	742	2025-03-23 16:20:14	2025-03-23 17:39:14	2025-03-23 16:20:14
7964	320	2025-04-22 16:44:37	2025-04-22 18:55:37	2025-04-22 16:44:37
7965	295	2025-08-17 16:56:46	2025-08-17 20:13:46	2025-08-17 16:56:46
7966	55	2025-01-19 01:55:06	2025-01-19 03:44:06	2025-01-19 01:55:06
7967	147	2025-01-26 09:11:34	2025-01-26 12:28:34	2025-01-26 09:11:34
7968	144	2025-09-16 17:31:06	2025-09-16 22:39:06	2025-09-16 17:31:06
7969	469	2025-03-29 15:49:16	2025-03-29 19:38:16	2025-03-29 15:49:16
7970	64	2025-04-26 15:17:58	2025-04-26 18:30:58	2025-04-26 15:17:58
7971	990	2025-01-18 19:52:26	2025-01-19 00:20:26	2025-01-18 19:52:26
7972	362	2025-06-03 15:15:49	2025-06-03 19:42:49	2025-06-03 15:15:49
7973	580	2025-01-25 16:27:03	2025-01-25 19:42:03	2025-01-25 16:27:03
7974	808	2025-05-06 17:00:40	2025-05-06 19:00:40	2025-05-06 17:00:40
7975	578	2025-08-16 17:58:38	2025-08-16 20:04:38	2025-08-16 17:58:38
7976	88	2025-06-24 11:50:39	2025-06-24 16:21:39	2025-06-24 11:50:39
7977	232	2025-06-07 14:32:30	2025-06-07 16:06:30	2025-06-07 14:32:30
7978	723	2025-05-27 15:22:53	2025-05-27 20:28:53	2025-05-27 15:22:53
7979	353	2025-08-16 18:39:49	2025-08-16 23:37:49	2025-08-16 18:39:49
7980	365	2025-08-17 16:05:29	2025-08-17 21:05:29	2025-08-17 16:05:29
7981	348	2025-08-23 17:13:08	2025-08-23 21:34:08	2025-08-23 17:13:08
7982	545	2025-04-06 17:00:18	2025-04-06 22:44:18	2025-04-06 17:00:18
7983	769	2025-03-29 18:31:53	2025-03-29 22:54:53	2025-03-29 18:31:53
7984	975	2025-01-14 15:31:15	2025-01-14 20:23:15	2025-01-14 15:31:15
7985	47	2024-12-31 11:23:24	2024-12-31 15:01:24	2024-12-31 11:23:24
7986	631	2025-09-27 14:16:38	2025-09-27 18:48:38	2025-09-27 14:16:38
7987	266	2025-08-26 14:50:33	2025-08-26 18:25:33	2025-08-26 14:50:33
7988	375	2025-03-01 16:22:33	2025-03-01 17:57:33	2025-03-01 16:22:33
7989	575	2025-09-20 15:49:26	2025-09-20 16:53:26	2025-09-20 15:49:26
7990	385	2025-02-02 05:08:35	2025-02-02 09:13:35	2025-02-02 05:08:35
7991	826	2025-01-18 16:40:04	2025-01-18 18:48:04	2025-01-18 16:40:04
7992	757	2024-11-30 15:03:35	2024-11-30 16:10:35	2024-11-30 15:03:35
7993	147	2025-05-11 16:02:56	2025-05-11 18:08:56	2025-05-11 16:02:56
7994	358	2025-04-29 14:02:11	2025-04-29 16:32:11	2025-04-29 14:02:11
7995	217	2024-11-22 18:10:10	2024-11-22 20:41:10	2024-11-22 18:10:10
7996	895	2024-12-28 09:19:48	2024-12-28 11:30:48	2024-12-28 09:19:48
7997	856	2025-02-15 15:56:03	2025-02-15 21:05:03	2025-02-15 15:56:03
7998	319	2025-06-14 16:42:17	2025-06-14 19:59:17	2025-06-14 16:42:17
7999	134	2025-10-26 15:52:22	2025-10-26 19:19:22	2025-10-26 15:52:22
8000	31	2024-11-16 03:26:59	2024-11-16 09:19:59	2024-11-16 03:26:59
\.


--
-- TOC entry 3475 (class 0 OID 16404)
-- Dependencies: 223
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.memberships (id, customer_id, offer_id, valid_from, valid_to, created_at) FROM stdin;
1	303	2	2025-04-05	2026-01-12	2025-11-06 23:50:46.3
2	971	3	2025-07-03	2025-10-06	2025-11-06 23:50:46.3
3	69	1	2025-08-06	2026-09-13	2025-11-06 23:50:46.3
4	74	4	2026-02-13	2026-03-27	2025-11-06 23:50:46.3
5	944	3	2026-08-12	2027-07-16	2025-11-06 23:50:46.3
6	130	2	2026-09-26	2027-02-20	2025-11-06 23:50:46.3
7	266	3	2026-09-04	2026-12-11	2025-11-06 23:50:46.3
8	602	4	2026-01-11	2026-03-31	2025-11-06 23:50:46.3
9	768	4	2026-03-21	2027-03-10	2025-11-06 23:50:46.3
10	986	1	2025-09-25	2025-10-19	2025-11-06 23:50:46.3
11	555	3	2025-09-23	2025-09-25	2025-11-06 23:50:46.3
12	272	4	2025-06-08	2025-12-15	2025-11-06 23:50:46.3
13	594	4	2025-10-01	2026-08-30	2025-11-06 23:50:46.3
14	773	2	2025-09-21	2026-03-02	2025-11-06 23:50:46.3
15	863	3	2025-04-19	2025-08-27	2025-11-06 23:50:46.3
16	728	1	2025-08-06	2026-10-04	2025-11-06 23:50:46.3
17	904	2	2024-12-25	2025-12-16	2025-11-06 23:50:46.3
18	137	1	2026-02-11	2026-12-04	2025-11-06 23:50:46.3
19	848	1	2025-08-12	2025-06-09	2025-11-06 23:50:46.3
20	303	2	2026-02-08	2026-02-10	2025-11-06 23:50:46.3
21	346	3	2025-08-10	2025-10-15	2025-11-06 23:50:46.3
22	939	4	2026-07-04	2026-11-10	2025-11-06 23:50:46.3
23	460	1	2026-08-26	2027-01-22	2025-11-06 23:50:46.3
24	64	3	2025-09-07	2025-09-17	2025-11-06 23:50:46.3
25	721	3	2026-08-25	2027-08-03	2025-11-06 23:50:46.3
26	55	2	2025-08-21	2025-09-13	2025-11-06 23:50:46.3
27	557	3	2025-07-26	2026-05-15	2025-11-06 23:50:46.3
28	823	2	2025-09-13	2026-08-10	2025-11-06 23:50:46.3
29	205	2	2024-10-07	2025-10-30	2025-11-06 23:50:46.3
30	717	3	2025-07-17	2025-09-21	2025-11-06 23:50:46.3
31	709	2	2025-08-22	2025-10-02	2025-11-06 23:50:46.3
32	119	3	2025-10-24	2026-11-02	2025-11-06 23:50:46.3
33	285	1	2025-08-09	2026-01-20	2025-11-06 23:50:46.3
34	604	1	2025-03-18	2026-06-24	2025-11-06 23:50:46.3
35	821	1	2025-10-26	2026-09-25	2025-11-06 23:50:46.3
36	274	2	2026-09-23	2027-09-08	2025-11-06 23:50:46.3
37	650	3	2026-07-11	2026-10-01	2025-11-06 23:50:46.3
38	164	1	2024-08-31	2025-02-16	2025-11-06 23:50:46.3
39	639	3	2025-11-06	2026-06-13	2025-11-06 23:50:46.3
40	558	1	2025-06-15	2025-07-27	2025-11-06 23:50:46.3
41	202	3	2025-08-25	2025-09-02	2025-11-06 23:50:46.3
42	994	4	2026-11-04	2027-05-29	2025-11-06 23:50:46.3
43	897	3	2025-06-18	2025-08-19	2025-11-06 23:50:46.3
44	249	3	2025-09-09	2025-10-14	2025-11-06 23:50:46.3
45	706	1	2025-01-07	2025-11-01	2025-11-06 23:50:46.3
46	967	2	2026-07-25	2027-02-04	2025-11-06 23:50:46.3
47	763	3	2026-10-07	2026-12-26	2025-11-06 23:50:46.3
48	529	3	2026-08-01	2026-10-07	2025-11-06 23:50:46.3
49	571	4	2025-08-13	2026-05-08	2025-11-06 23:50:46.3
50	269	2	2025-07-18	2026-01-18	2025-11-06 23:50:46.3
51	894	4	2025-11-02	2025-11-03	2025-11-06 23:50:46.3
52	527	2	2025-09-21	2026-01-06	2025-11-06 23:50:46.3
53	338	4	2026-01-20	2026-07-01	2025-11-06 23:50:46.3
54	868	4	2025-10-27	2026-08-29	2025-11-06 23:50:46.3
55	137	4	2025-08-20	2025-08-20	2025-11-06 23:50:46.3
56	29	3	2025-09-15	2026-02-14	2025-11-06 23:50:46.3
57	127	4	2026-05-10	2027-03-26	2025-11-06 23:50:46.3
58	625	2	2025-01-02	2025-04-02	2025-11-06 23:50:46.3
59	8	2	2026-07-29	2026-09-19	2025-11-06 23:50:46.3
60	121	4	2025-09-12	2026-09-07	2025-11-06 23:50:46.3
61	230	2	2026-01-24	2026-04-17	2025-11-06 23:50:46.3
62	91	3	2025-10-09	2026-08-14	2025-11-06 23:50:46.3
63	679	4	2025-01-13	2026-05-05	2025-11-06 23:50:46.3
64	830	4	2025-05-10	2026-10-27	2025-11-06 23:50:46.3
65	606	2	2026-07-23	2027-01-12	2025-11-06 23:50:46.3
66	910	3	2025-09-14	2026-01-03	2025-11-06 23:50:46.3
67	395	4	2024-12-22	2025-11-01	2025-11-06 23:50:46.3
68	728	4	2026-09-04	2027-01-11	2025-11-06 23:50:46.3
69	817	2	2026-05-02	2026-08-23	2025-11-06 23:50:46.3
70	764	4	2025-08-14	2026-10-10	2025-11-06 23:50:46.3
71	353	1	2025-10-06	2025-08-22	2025-11-06 23:50:46.3
72	154	4	2026-05-16	2026-11-02	2025-11-06 23:50:46.3
73	736	1	2025-10-28	2026-03-28	2025-11-06 23:50:46.3
74	756	1	2025-10-12	2026-05-15	2025-11-06 23:50:46.3
75	330	1	2026-01-15	2026-09-29	2025-11-06 23:50:46.3
76	866	2	2025-01-02	2026-10-06	2025-11-06 23:50:46.3
77	43	4	2026-11-04	2027-04-20	2025-11-06 23:50:46.3
78	23	1	2026-04-12	2027-01-07	2025-11-06 23:50:46.3
79	259	4	2025-04-30	2026-03-01	2025-11-06 23:50:46.3
80	654	4	2025-08-11	2026-02-28	2025-11-06 23:50:46.3
81	356	4	2025-07-30	2025-10-18	2025-11-06 23:50:46.3
82	719	1	2025-09-14	2026-01-13	2025-11-06 23:50:46.3
83	646	4	2025-07-31	2026-07-22	2025-11-06 23:50:46.3
84	751	3	2025-10-24	2025-11-07	2025-11-06 23:50:46.3
85	710	2	2025-01-14	2025-08-23	2025-11-06 23:50:46.3
86	605	3	2025-02-11	2026-03-02	2025-11-06 23:50:46.3
87	989	3	2026-08-11	2027-07-29	2025-11-06 23:50:46.3
88	881	1	2025-07-02	2026-06-18	2025-11-06 23:50:46.3
89	87	4	2026-06-11	2026-08-17	2025-11-06 23:50:46.3
90	776	1	2026-03-02	2026-07-09	2025-11-06 23:50:46.3
91	172	4	2026-08-26	2027-06-27	2025-11-06 23:50:46.3
92	737	3	2025-12-21	2026-10-04	2025-11-06 23:50:46.3
93	603	4	2026-01-28	2026-12-13	2025-11-06 23:50:46.3
94	949	4	2025-10-28	2025-12-05	2025-11-06 23:50:46.3
95	415	2	2026-10-15	2027-08-22	2025-11-06 23:50:46.3
96	275	3	2026-04-16	2026-12-04	2025-11-06 23:50:46.3
97	138	4	2026-03-30	2026-11-01	2025-11-06 23:50:46.3
98	498	3	2025-06-15	2026-02-22	2025-11-06 23:50:46.3
99	935	3	2024-07-10	2025-10-13	2025-11-06 23:50:46.3
100	391	2	2026-04-20	2026-12-06	2025-11-06 23:50:46.3
101	806	3	2025-12-28	2026-12-04	2025-11-06 23:50:46.3
102	395	3	2024-10-06	2025-10-27	2025-11-06 23:50:46.3
103	222	1	2025-10-29	2026-11-01	2025-11-06 23:50:46.3
104	747	4	2025-04-02	2025-05-27	2025-11-06 23:50:46.3
105	538	3	2024-09-14	2025-10-28	2025-11-06 23:50:46.3
106	118	4	2026-04-24	2027-03-31	2025-11-06 23:50:46.3
107	39	1	2026-03-19	2026-06-26	2025-11-06 23:50:46.3
108	648	1	2026-06-06	2026-07-05	2025-11-06 23:50:46.3
109	202	2	2025-10-28	2025-11-02	2025-11-06 23:50:46.3
110	395	2	2024-07-24	2025-02-27	2025-11-06 23:50:46.3
111	718	2	2026-09-19	2026-11-01	2025-11-06 23:50:46.3
112	42	2	2025-08-07	2026-11-02	2025-11-06 23:50:46.3
113	544	1	2025-11-27	2026-04-13	2025-11-06 23:50:46.3
114	680	4	2026-07-20	2027-07-11	2025-11-06 23:50:46.3
115	120	1	2026-10-11	2027-05-22	2025-11-06 23:50:46.3
116	870	1	2025-10-18	2026-09-18	2025-11-06 23:50:46.3
117	968	3	2024-12-25	2025-03-09	2025-11-06 23:50:46.3
118	759	2	2026-08-20	2027-07-01	2025-11-06 23:50:46.3
119	412	4	2025-03-24	2025-08-14	2025-11-06 23:50:46.3
120	489	3	2026-01-14	2026-10-22	2025-11-06 23:50:46.3
121	222	2	2025-09-23	2025-10-31	2025-11-06 23:50:46.3
122	21	1	2025-05-12	2025-11-05	2025-11-06 23:50:46.3
123	583	1	2025-01-13	2025-02-03	2025-11-06 23:50:46.3
124	397	4	2025-05-10	2025-10-02	2025-11-06 23:50:46.3
125	639	3	2026-04-03	2026-04-19	2025-11-06 23:50:46.3
126	871	2	2025-07-30	2025-08-17	2025-11-06 23:50:46.3
127	706	4	2025-10-24	2026-01-17	2025-11-06 23:50:46.3
128	344	3	2026-11-03	2027-05-17	2025-11-06 23:50:46.3
129	723	2	2025-11-29	2026-09-26	2025-11-06 23:50:46.3
130	57	3	2023-12-01	2025-07-21	2025-11-06 23:50:46.3
131	741	3	2025-04-27	2025-12-05	2025-11-06 23:50:46.3
132	594	3	2025-04-02	2025-07-09	2025-11-06 23:50:46.3
133	807	3	2026-09-16	2027-01-06	2025-11-06 23:50:46.3
134	240	1	2025-10-25	2026-01-25	2025-11-06 23:50:46.3
135	626	4	2025-09-28	2025-12-13	2025-11-06 23:50:46.3
136	474	2	2026-07-06	2027-02-19	2025-11-06 23:50:46.3
137	478	1	2025-10-29	2025-11-29	2025-11-06 23:50:46.3
138	29	2	2025-02-03	2025-10-11	2025-11-06 23:50:46.3
139	567	3	2025-01-02	2026-07-10	2025-11-06 23:50:46.3
140	760	2	2025-08-12	2025-06-30	2025-11-06 23:50:46.3
141	999	3	2025-08-10	2025-06-14	2025-11-06 23:50:46.3
142	866	4	2024-08-09	2025-10-29	2025-11-06 23:50:46.3
143	744	4	2024-12-26	2025-04-08	2025-11-06 23:50:46.3
144	965	2	2026-03-22	2026-08-29	2025-11-06 23:50:46.3
145	367	2	2025-09-28	2026-04-12	2025-11-06 23:50:46.3
146	195	4	2025-12-22	2026-02-25	2025-11-06 23:50:46.3
147	851	3	2025-10-02	2025-11-28	2025-11-06 23:50:46.3
148	463	1	2026-05-31	2026-09-11	2025-11-06 23:50:46.3
149	954	1	2026-10-06	2026-12-28	2025-11-06 23:50:46.3
150	280	1	2025-06-24	2026-10-10	2025-11-06 23:50:46.3
151	906	1	2024-12-15	2024-12-18	2025-11-06 23:50:46.3
152	879	3	2025-12-25	2026-02-24	2025-11-06 23:50:46.3
153	970	4	2024-11-22	2025-09-19	2025-11-06 23:50:46.3
154	84	4	2025-10-23	2026-05-31	2025-11-06 23:50:46.3
155	399	4	2025-10-19	2026-07-25	2025-11-06 23:50:46.3
156	117	2	2025-10-29	2026-08-25	2025-11-06 23:50:46.3
157	353	1	2025-10-01	2025-08-11	2025-11-06 23:50:46.3
158	921	2	2025-09-24	2026-06-05	2025-11-06 23:50:46.3
159	526	4	2025-05-20	2024-12-22	2025-11-06 23:50:46.3
160	411	2	2025-07-22	2026-08-08	2025-11-06 23:50:46.3
161	167	3	2026-10-26	2026-11-29	2025-11-06 23:50:46.3
162	199	1	2026-03-09	2026-07-21	2025-11-06 23:50:46.3
163	17	2	2025-07-19	2025-09-15	2025-11-06 23:50:46.3
164	240	1	2025-03-16	2025-08-08	2025-11-06 23:50:46.3
165	103	1	2025-09-20	2026-06-26	2025-11-06 23:50:46.3
166	944	2	2024-08-22	2025-04-30	2025-11-06 23:50:46.3
167	174	3	2026-10-10	2027-10-04	2025-11-06 23:50:46.3
168	821	2	2025-04-15	2025-04-22	2025-11-06 23:50:46.3
169	690	4	2025-10-20	2026-08-28	2025-11-06 23:50:46.3
170	628	1	2025-08-08	2026-07-06	2025-11-06 23:50:46.3
171	470	3	2026-04-03	2026-09-01	2025-11-06 23:50:46.3
172	810	3	2025-08-25	2026-03-16	2025-11-06 23:50:46.3
173	127	4	2026-10-27	2027-05-27	2025-11-06 23:50:46.3
174	286	1	2024-10-15	2025-07-17	2025-11-06 23:50:46.3
175	272	3	2026-08-10	2027-01-23	2025-11-06 23:50:46.3
176	487	4	2025-08-09	2025-08-31	2025-11-06 23:50:46.3
177	661	3	2025-03-22	2025-03-30	2025-11-06 23:50:46.3
178	621	2	2024-09-25	2025-05-30	2025-11-06 23:50:46.3
179	485	3	2025-11-10	2026-06-09	2025-11-06 23:50:46.3
180	825	4	2025-08-04	2025-08-18	2025-11-06 23:50:46.3
181	514	1	2024-12-14	2025-03-28	2025-11-06 23:50:46.3
182	268	2	2025-09-01	2026-10-27	2025-11-06 23:50:46.3
183	568	1	2025-09-07	2025-10-18	2025-11-06 23:50:46.3
184	202	3	2025-08-03	2026-01-11	2025-11-06 23:50:46.3
185	330	1	2026-06-21	2026-07-09	2025-11-06 23:50:46.3
186	668	3	2025-11-04	2025-12-20	2025-11-06 23:50:46.3
187	438	2	2025-04-24	2026-04-17	2025-11-06 23:50:46.3
188	63	4	2025-07-18	2025-12-22	2025-11-06 23:50:46.3
189	544	2	2026-10-29	2027-04-11	2025-11-06 23:50:46.3
190	481	2	2025-07-25	2026-01-05	2025-11-06 23:50:46.3
191	489	4	2025-08-17	2026-06-11	2025-11-06 23:50:46.3
192	385	1	2025-04-13	2026-01-05	2025-11-06 23:50:46.3
193	439	3	2025-02-25	2025-03-27	2025-11-06 23:50:46.3
194	329	3	2025-10-12	2026-05-22	2025-11-06 23:50:46.3
195	859	2	2024-03-20	2025-08-12	2025-11-06 23:50:46.3
196	744	4	2025-07-31	2026-05-27	2025-11-06 23:50:46.3
197	632	3	2025-09-17	2025-10-12	2025-11-06 23:50:46.3
198	776	2	2025-12-06	2026-10-01	2025-11-06 23:50:46.3
199	958	1	2025-05-18	2025-05-25	2025-11-06 23:50:46.3
200	424	4	2026-02-24	2026-05-02	2025-11-06 23:50:46.3
201	556	3	2025-10-13	2026-07-23	2025-11-06 23:50:46.3
202	446	1	2025-02-20	2025-08-02	2025-11-06 23:50:46.3
203	459	4	2026-06-05	2027-04-03	2025-11-06 23:50:46.3
204	506	2	2026-02-08	2026-05-02	2025-11-06 23:50:46.3
205	308	4	2025-06-08	2025-08-06	2025-11-06 23:50:46.3
206	317	1	2025-10-10	2026-05-03	2025-11-06 23:50:46.3
207	323	1	2026-04-07	2026-09-22	2025-11-06 23:50:46.3
208	100	4	2026-06-17	2026-07-16	2025-11-06 23:50:46.3
209	537	2	2025-09-07	2026-04-21	2025-11-06 23:50:46.3
210	38	1	2025-09-05	2025-10-16	2025-11-06 23:50:46.3
211	512	4	2025-09-03	2026-08-14	2025-11-06 23:50:46.3
212	887	1	2025-03-06	2025-06-25	2025-11-06 23:50:46.3
213	214	4	2024-10-05	2025-10-20	2025-11-06 23:50:46.3
214	217	1	2026-06-04	2027-03-25	2025-11-06 23:50:46.3
215	533	1	2026-08-17	2027-04-29	2025-11-06 23:50:46.3
216	767	2	2025-10-21	2026-09-06	2025-11-06 23:50:46.3
217	364	3	2026-08-01	2027-01-19	2025-11-06 23:50:46.3
218	514	1	2025-07-04	2026-03-05	2025-11-06 23:50:46.3
219	341	2	2026-05-30	2027-01-17	2025-11-06 23:50:46.3
220	625	1	2025-07-01	2025-10-26	2025-11-06 23:50:46.3
221	757	3	2025-08-08	2026-07-29	2025-11-06 23:50:46.3
222	143	4	2026-05-31	2026-11-04	2025-11-06 23:50:46.3
223	222	1	2026-03-22	2026-03-31	2025-11-06 23:50:46.3
224	492	2	2026-10-16	2027-10-06	2025-11-06 23:50:46.3
225	131	2	2026-03-27	2026-12-01	2025-11-06 23:50:46.3
226	637	4	2025-03-05	2025-09-28	2025-11-06 23:50:46.3
227	194	4	2026-03-17	2026-04-15	2025-11-06 23:50:46.3
228	143	1	2024-12-21	2026-01-20	2025-11-06 23:50:46.3
229	472	1	2025-09-27	2025-10-31	2025-11-06 23:50:46.3
230	199	3	2024-12-12	2025-08-26	2025-11-06 23:50:46.3
231	752	2	2025-09-09	2025-11-11	2025-11-06 23:50:46.3
232	884	3	2025-10-12	2026-02-23	2025-11-06 23:50:46.3
233	723	2	2026-06-14	2027-03-29	2025-11-06 23:50:46.3
234	213	4	2026-01-08	2026-11-14	2025-11-06 23:50:46.3
235	323	4	2024-08-18	2025-05-01	2025-11-06 23:50:46.3
236	115	2	2025-04-06	2025-09-07	2025-11-06 23:50:46.3
237	627	4	2025-06-22	2025-07-24	2025-11-06 23:50:46.3
238	924	4	2025-08-10	2026-08-07	2025-11-06 23:50:46.3
239	207	3	2025-10-05	2026-04-28	2025-11-06 23:50:46.3
240	394	3	2024-05-19	2025-03-29	2025-11-06 23:50:46.3
241	698	2	2025-03-02	2025-10-05	2025-11-06 23:50:46.3
242	196	1	2025-10-25	2026-09-20	2025-11-06 23:50:46.3
243	346	4	2025-07-25	2025-07-25	2025-11-06 23:50:46.3
244	547	1	2025-10-22	2026-07-10	2025-11-06 23:50:46.3
245	993	3	2025-10-03	2025-12-03	2025-11-06 23:50:46.3
246	642	3	2025-06-25	2025-10-14	2025-11-06 23:50:46.3
247	554	4	2025-08-24	2025-08-26	2025-11-06 23:50:46.3
248	359	3	2025-10-16	2026-02-12	2025-11-06 23:50:46.3
249	645	3	2024-08-11	2025-08-12	2025-11-06 23:50:46.3
250	89	1	2026-10-20	2027-04-10	2025-11-06 23:50:46.3
251	634	3	2025-08-03	2025-11-29	2025-11-06 23:50:46.3
252	775	1	2026-05-03	2026-10-28	2025-11-06 23:50:46.3
253	633	3	2026-04-12	2026-06-27	2025-11-06 23:50:46.3
254	891	2	2024-12-16	2025-01-19	2025-11-06 23:50:46.3
255	133	4	2025-11-15	2025-12-30	2025-11-06 23:50:46.3
256	878	3	2025-12-05	2026-11-15	2025-11-06 23:50:46.3
257	898	2	2025-10-25	2026-01-18	2025-11-06 23:50:46.301
258	344	1	2025-03-24	2025-05-06	2025-11-06 23:50:46.301
259	456	2	2025-05-19	2025-07-28	2025-11-06 23:50:46.301
260	338	4	2025-02-17	2025-10-14	2025-11-06 23:50:46.301
261	761	4	2026-10-06	2027-02-15	2025-11-06 23:50:46.301
262	555	2	2025-04-21	2026-04-13	2025-11-06 23:50:46.301
263	610	3	2025-07-30	2025-07-31	2025-11-06 23:50:46.301
264	87	3	2025-10-23	2026-10-12	2025-11-06 23:50:46.301
265	348	2	2025-10-07	2026-01-19	2025-11-06 23:50:46.301
266	205	4	2025-01-11	2025-11-02	2025-11-06 23:50:46.301
267	48	4	2026-07-06	2027-05-10	2025-11-06 23:50:46.301
268	750	2	2024-07-24	2025-03-17	2025-11-06 23:50:46.301
269	414	3	2026-01-01	2026-11-17	2025-11-06 23:50:46.301
270	583	3	2025-04-11	2026-09-17	2025-11-06 23:50:46.301
271	787	4	2025-07-24	2025-10-20	2025-11-06 23:50:46.301
272	231	3	2025-11-08	2026-09-17	2025-11-06 23:50:46.301
273	345	1	2024-09-30	2025-07-23	2025-11-06 23:50:46.301
274	618	4	2025-09-05	2026-08-20	2025-11-06 23:50:46.301
275	809	3	2025-05-04	2026-09-22	2025-11-06 23:50:46.301
276	19	1	2026-07-24	2026-11-12	2025-11-06 23:50:46.301
277	368	3	2025-04-20	2026-01-22	2025-11-06 23:50:46.301
278	660	3	2025-09-21	2025-11-28	2025-11-06 23:50:46.301
279	407	1	2026-01-24	2026-07-15	2025-11-06 23:50:46.301
280	517	1	2025-10-17	2026-08-12	2025-11-06 23:50:46.301
281	905	3	2026-10-13	2026-11-26	2025-11-06 23:50:46.301
282	650	1	2026-02-27	2026-03-26	2025-11-06 23:50:46.301
283	137	3	2025-09-10	2026-05-07	2025-11-06 23:50:46.301
284	461	4	2025-08-22	2026-11-05	2025-11-06 23:50:46.301
285	306	3	2024-05-22	2025-10-27	2025-11-06 23:50:46.301
286	737	2	2025-12-08	2026-12-02	2025-11-06 23:50:46.301
287	426	2	2024-12-08	2026-09-27	2025-11-06 23:50:46.301
288	264	3	2025-09-20	2025-11-04	2025-11-06 23:50:46.301
289	799	4	2025-10-08	2026-08-19	2025-11-06 23:50:46.301
290	380	3	2025-05-04	2025-10-02	2025-11-06 23:50:46.301
291	887	3	2025-11-25	2026-09-18	2025-11-06 23:50:46.301
292	706	4	2026-04-29	2026-09-04	2025-11-06 23:50:46.301
293	458	4	2025-10-20	2025-10-10	2025-11-06 23:50:46.301
294	70	3	2025-11-08	2026-02-14	2025-11-06 23:50:46.301
295	821	3	2024-12-29	2025-03-08	2025-11-06 23:50:46.301
296	559	3	2025-09-09	2026-10-19	2025-11-06 23:50:46.301
297	508	2	2026-02-03	2027-01-28	2025-11-06 23:50:46.301
298	396	2	2025-10-21	2026-02-05	2025-11-06 23:50:46.301
299	570	2	2026-08-06	2026-10-13	2025-11-06 23:50:46.301
300	150	2	2025-05-13	2025-06-21	2025-11-06 23:50:46.301
301	60	4	2025-09-13	2026-04-15	2025-11-06 23:50:46.301
302	67	2	2025-05-14	2026-04-26	2025-11-06 23:50:46.301
303	76	2	2025-04-30	2026-07-26	2025-11-06 23:50:46.301
304	133	2	2026-10-30	2027-02-02	2025-11-06 23:50:46.301
305	321	3	2025-10-15	2026-04-11	2025-11-06 23:50:46.301
306	703	4	2025-09-22	2025-09-21	2025-11-06 23:50:46.301
307	232	2	2025-08-07	2026-10-19	2025-11-06 23:50:46.301
308	232	2	2025-05-16	2025-10-07	2025-11-06 23:50:46.301
309	939	2	2026-05-26	2026-07-15	2025-11-06 23:50:46.301
310	882	3	2025-10-24	2026-05-19	2025-11-06 23:50:46.301
311	176	2	2025-09-09	2025-09-11	2025-11-06 23:50:46.301
312	503	4	2025-07-18	2025-09-21	2025-11-06 23:50:46.301
313	246	2	2025-11-04	2026-10-06	2025-11-06 23:50:46.301
314	156	3	2026-11-01	2026-12-06	2025-11-06 23:50:46.301
315	377	3	2025-09-02	2025-08-11	2025-11-06 23:50:46.301
316	740	3	2025-09-02	2025-05-09	2025-11-06 23:50:46.301
317	618	2	2026-05-07	2027-01-18	2025-11-06 23:50:46.301
318	398	3	2025-05-27	2025-06-01	2025-11-06 23:50:46.301
319	976	4	2025-05-08	2026-09-13	2025-11-06 23:50:46.301
320	390	2	2025-03-18	2025-03-24	2025-11-06 23:50:46.301
321	585	3	2026-09-27	2027-04-20	2025-11-06 23:50:46.301
322	370	4	2025-11-03	2026-07-14	2025-11-06 23:50:46.301
323	191	2	2024-09-01	2025-08-14	2025-11-06 23:50:46.301
324	476	4	2026-02-08	2026-10-14	2025-11-06 23:50:46.301
325	93	1	2026-04-03	2026-09-06	2025-11-06 23:50:46.301
326	455	3	2025-08-21	2026-04-16	2025-11-06 23:50:46.301
327	758	1	2025-09-25	2025-12-14	2025-11-06 23:50:46.301
328	256	2	2025-10-14	2026-09-25	2025-11-06 23:50:46.301
329	889	3	2025-04-28	2026-01-09	2025-11-06 23:50:46.301
330	607	1	2025-09-02	2026-01-11	2025-11-06 23:50:46.301
331	543	3	2026-03-28	2026-12-10	2025-11-06 23:50:46.301
332	542	2	2025-02-22	2025-02-15	2025-11-06 23:50:46.301
333	840	2	2025-06-23	2025-11-30	2025-11-06 23:50:46.301
334	992	4	2025-10-18	2026-11-02	2025-11-06 23:50:46.301
335	774	2	2026-10-16	2027-02-08	2025-11-06 23:50:46.301
336	198	4	2025-08-21	2026-05-12	2025-11-06 23:50:46.301
337	639	3	2026-01-30	2026-11-11	2025-11-06 23:50:46.301
338	974	3	2025-09-08	2026-05-02	2025-11-06 23:50:46.301
339	991	2	2025-08-22	2026-06-27	2025-11-06 23:50:46.301
340	68	2	2025-03-27	2025-10-02	2025-11-06 23:50:46.301
341	584	4	2025-10-24	2026-05-04	2025-11-06 23:50:46.301
342	971	1	2025-10-13	2026-04-25	2025-11-06 23:50:46.301
343	602	1	2025-10-23	2026-03-17	2025-11-06 23:50:46.301
344	724	3	2025-09-07	2025-09-06	2025-11-06 23:50:46.301
345	348	3	2025-10-07	2025-10-28	2025-11-06 23:50:46.301
346	503	3	2025-03-03	2025-07-25	2025-11-06 23:50:46.301
347	269	4	2024-09-14	2025-06-03	2025-11-06 23:50:46.301
348	13	2	2025-11-01	2026-10-01	2025-11-06 23:50:46.301
349	609	4	2025-05-07	2025-10-15	2025-11-06 23:50:46.301
350	787	4	2025-09-07	2025-10-02	2025-11-06 23:50:46.301
351	595	2	2025-09-21	2026-09-02	2025-11-06 23:50:46.301
352	513	4	2025-11-04	2026-08-28	2025-11-06 23:50:46.301
353	843	1	2026-09-16	2027-04-24	2025-11-06 23:50:46.301
354	478	3	2025-07-26	2025-10-31	2025-11-06 23:50:46.301
355	818	3	2025-04-17	2025-05-24	2025-11-06 23:50:46.301
356	364	2	2025-10-23	2025-12-05	2025-11-06 23:50:46.301
357	337	2	2025-04-09	2026-06-09	2025-11-06 23:50:46.301
358	4	4	2025-10-25	2026-10-27	2025-11-06 23:50:46.301
359	191	1	2025-04-07	2026-08-18	2025-11-06 23:50:46.301
360	805	3	2025-03-29	2026-08-13	2025-11-06 23:50:46.301
361	736	4	2025-05-31	2025-04-15	2025-11-06 23:50:46.301
362	202	2	2025-06-12	2025-06-09	2025-11-06 23:50:46.301
363	940	2	2025-09-30	2026-04-02	2025-11-06 23:50:46.301
364	612	4	2025-08-04	2026-07-22	2025-11-06 23:50:46.301
365	512	1	2024-09-06	2025-11-04	2025-11-06 23:50:46.301
366	379	2	2025-04-19	2026-03-05	2025-11-06 23:50:46.301
367	664	3	2025-07-06	2026-02-28	2025-11-06 23:50:46.301
368	521	4	2025-04-30	2025-08-16	2025-11-06 23:50:46.301
369	167	1	2025-07-26	2026-11-01	2025-11-06 23:50:46.301
370	959	2	2025-05-28	2026-02-05	2025-11-06 23:50:46.301
371	558	2	2025-10-27	2026-10-07	2025-11-06 23:50:46.301
372	46	1	2024-06-20	2025-10-25	2025-11-06 23:50:46.301
373	97	3	2025-11-11	2025-12-30	2025-11-06 23:50:46.301
374	146	4	2025-04-29	2025-06-05	2025-11-06 23:50:46.301
375	145	4	2025-10-24	2026-04-14	2025-11-06 23:50:46.301
376	277	1	2025-03-24	2025-10-30	2025-11-06 23:50:46.301
377	375	1	2024-07-01	2025-11-05	2025-11-06 23:50:46.301
378	84	4	2026-04-22	2026-08-27	2025-11-06 23:50:46.301
379	84	1	2025-05-02	2025-01-06	2025-11-06 23:50:46.301
380	848	3	2025-11-03	2026-08-31	2025-11-06 23:50:46.301
381	886	2	2025-01-18	2025-04-09	2025-11-06 23:50:46.301
382	683	1	2025-02-15	2025-10-20	2025-11-06 23:50:46.301
383	823	4	2025-03-01	2025-06-06	2025-11-06 23:50:46.301
384	963	2	2026-03-07	2026-12-14	2025-11-06 23:50:46.301
385	439	1	2026-04-15	2027-03-18	2025-11-06 23:50:46.301
386	136	1	2025-04-23	2026-06-10	2025-11-06 23:50:46.301
387	110	2	2025-05-08	2026-03-15	2025-11-06 23:50:46.301
388	271	3	2025-10-30	2026-04-03	2025-11-06 23:50:46.301
389	781	4	2025-09-10	2025-09-20	2025-11-06 23:50:46.301
390	142	1	2025-05-13	2026-10-22	2025-11-06 23:50:46.301
391	968	2	2026-04-19	2026-11-14	2025-11-06 23:50:46.301
392	224	1	2025-10-17	2026-08-08	2025-11-06 23:50:46.301
393	598	1	2025-06-23	2025-09-11	2025-11-06 23:50:46.301
394	282	1	2026-01-30	2026-06-03	2025-11-06 23:50:46.301
395	927	3	2025-09-01	2026-01-26	2025-11-06 23:50:46.301
396	381	3	2025-08-18	2025-09-22	2025-11-06 23:50:46.301
397	410	4	2026-08-24	2026-12-20	2025-11-06 23:50:46.301
398	361	3	2024-10-12	2025-04-19	2025-11-06 23:50:46.301
399	547	4	2026-10-31	2027-09-24	2025-11-06 23:50:46.301
400	998	1	2025-12-21	2026-10-26	2025-11-06 23:50:46.301
401	701	3	2025-06-13	2026-05-17	2025-11-06 23:50:46.301
402	978	3	2026-01-22	2026-04-07	2025-11-06 23:50:46.301
403	967	2	2026-07-11	2027-07-07	2025-11-06 23:50:46.301
404	466	1	2026-09-23	2026-10-29	2025-11-06 23:50:46.301
405	245	3	2024-12-01	2025-08-21	2025-11-06 23:50:46.301
406	806	3	2025-06-23	2026-11-03	2025-11-06 23:50:46.301
407	921	3	2026-04-18	2026-11-21	2025-11-06 23:50:46.301
408	321	3	2025-05-01	2025-05-03	2025-11-06 23:50:46.301
409	649	4	2025-04-11	2026-07-04	2025-11-06 23:50:46.301
410	121	2	2025-05-10	2025-07-18	2025-11-06 23:50:46.301
411	911	3	2025-10-01	2026-07-04	2025-11-06 23:50:46.301
412	614	4	2025-03-19	2025-10-06	2025-11-06 23:50:46.301
413	55	2	2024-07-12	2025-01-31	2025-11-06 23:50:46.301
414	645	2	2025-09-12	2026-03-05	2025-11-06 23:50:46.301
415	576	2	2026-02-07	2026-03-09	2025-11-06 23:50:46.301
416	446	3	2025-05-28	2025-09-21	2025-11-06 23:50:46.301
417	723	2	2026-09-16	2026-10-07	2025-11-06 23:50:46.301
418	675	2	2026-05-24	2026-10-09	2025-11-06 23:50:46.301
419	248	4	2025-10-31	2026-10-04	2025-11-06 23:50:46.301
420	330	3	2025-06-22	2025-10-27	2025-11-06 23:50:46.301
421	822	3	2025-10-23	2026-10-28	2025-11-06 23:50:46.301
422	146	3	2026-04-12	2027-01-03	2025-11-06 23:50:46.301
423	889	1	2026-06-19	2026-10-02	2025-11-06 23:50:46.301
424	743	4	2024-06-18	2025-08-20	2025-11-06 23:50:46.301
425	898	1	2026-08-23	2026-09-15	2025-11-06 23:50:46.301
426	996	4	2024-12-22	2025-10-16	2025-11-06 23:50:46.301
427	348	2	2024-06-10	2025-07-08	2025-11-06 23:50:46.301
428	560	1	2026-08-08	2027-04-30	2025-11-06 23:50:46.301
429	475	3	2025-09-06	2026-08-27	2025-11-06 23:50:46.301
430	10	2	2025-05-24	2025-12-15	2025-11-06 23:50:46.301
431	164	2	2025-10-04	2026-05-08	2025-11-06 23:50:46.301
432	650	3	2025-07-17	2026-09-18	2025-11-06 23:50:46.301
433	810	3	2025-02-04	2025-05-26	2025-11-06 23:50:46.301
434	191	2	2026-09-16	2027-09-02	2025-11-06 23:50:46.301
435	39	4	2026-06-03	2027-05-30	2025-11-06 23:50:46.301
436	322	3	2026-09-30	2026-11-21	2025-11-06 23:50:46.301
437	950	1	2026-04-23	2027-04-12	2025-11-06 23:50:46.301
438	262	4	2026-05-14	2026-11-14	2025-11-06 23:50:46.301
439	479	4	2025-10-17	2026-04-02	2025-11-06 23:50:46.301
440	674	1	2025-10-21	2026-08-23	2025-11-06 23:50:46.301
441	105	2	2025-11-02	2026-05-26	2025-11-06 23:50:46.301
442	318	3	2026-04-11	2026-10-29	2025-11-06 23:50:46.301
443	255	4	2025-07-10	2026-10-04	2025-11-06 23:50:46.301
444	268	2	2025-02-20	2025-08-08	2025-11-06 23:50:46.301
445	52	2	2026-05-27	2026-08-27	2025-11-06 23:50:46.301
446	798	1	2025-09-14	2026-04-30	2025-11-06 23:50:46.301
447	803	1	2025-06-16	2026-05-28	2025-11-06 23:50:46.301
448	279	4	2025-10-07	2026-01-04	2025-11-06 23:50:46.301
449	380	1	2025-11-06	2026-04-26	2025-11-06 23:50:46.301
450	527	4	2026-02-11	2026-05-03	2025-11-06 23:50:46.301
451	360	3	2025-05-12	2026-08-03	2025-11-06 23:50:46.301
452	66	4	2024-12-20	2025-01-09	2025-11-06 23:50:46.301
453	688	4	2025-11-05	2026-10-13	2025-11-06 23:50:46.301
454	771	2	2025-06-29	2026-09-25	2025-11-06 23:50:46.301
455	521	2	2025-09-08	2025-12-02	2025-11-06 23:50:46.301
456	268	1	2025-11-25	2026-06-04	2025-11-06 23:50:46.301
457	986	2	2026-02-18	2026-03-15	2025-11-06 23:50:46.301
458	665	2	2026-09-13	2027-05-06	2025-11-06 23:50:46.301
459	82	2	2025-10-26	2026-02-17	2025-11-06 23:50:46.301
460	375	4	2026-10-07	2026-10-12	2025-11-06 23:50:46.301
461	905	2	2025-02-22	2026-01-06	2025-11-06 23:50:46.301
462	786	3	2025-07-26	2025-09-01	2025-11-06 23:50:46.301
463	896	3	2025-07-05	2026-09-14	2025-11-06 23:50:46.301
464	740	3	2026-05-13	2027-01-21	2025-11-06 23:50:46.301
465	766	4	2026-04-29	2026-05-10	2025-11-06 23:50:46.301
466	281	3	2025-05-11	2025-08-29	2025-11-06 23:50:46.301
467	434	1	2024-11-29	2025-01-27	2025-11-06 23:50:46.301
468	263	4	2026-10-21	2027-03-17	2025-11-06 23:50:46.301
469	215	4	2026-07-25	2027-03-18	2025-11-06 23:50:46.301
470	748	2	2025-07-30	2026-06-10	2025-11-06 23:50:46.301
471	456	1	2025-06-11	2025-09-12	2025-11-06 23:50:46.301
472	459	2	2025-08-11	2025-10-18	2025-11-06 23:50:46.301
473	785	4	2026-03-24	2026-10-10	2025-11-06 23:50:46.301
474	953	1	2026-01-28	2026-04-17	2025-11-06 23:50:46.301
475	392	1	2025-07-11	2026-10-01	2025-11-06 23:50:46.301
476	962	1	2025-12-07	2026-03-02	2025-11-06 23:50:46.301
477	837	2	2026-03-29	2026-06-20	2025-11-06 23:50:46.301
478	236	3	2026-06-14	2027-06-07	2025-11-06 23:50:46.301
479	610	4	2025-07-12	2025-01-31	2025-11-06 23:50:46.301
480	455	1	2025-10-13	2025-10-21	2025-11-06 23:50:46.301
481	345	1	2026-08-29	2026-11-18	2025-11-06 23:50:46.301
482	679	1	2025-07-29	2025-11-05	2025-11-06 23:50:46.301
483	932	2	2024-08-03	2025-11-05	2025-11-06 23:50:46.301
484	414	3	2025-07-21	2025-08-24	2025-11-06 23:50:46.301
485	452	1	2026-08-16	2027-04-10	2025-11-06 23:50:46.301
486	15	2	2026-09-07	2027-02-22	2025-11-06 23:50:46.301
487	111	2	2025-09-08	2025-08-13	2025-11-06 23:50:46.301
488	956	2	2025-10-31	2026-10-06	2025-11-06 23:50:46.301
489	142	3	2026-03-05	2026-11-10	2025-11-06 23:50:46.301
490	843	4	2025-08-16	2025-10-07	2025-11-06 23:50:46.301
491	351	1	2026-09-22	2026-10-10	2025-11-06 23:50:46.301
492	868	4	2026-01-04	2026-02-20	2025-11-06 23:50:46.301
493	427	4	2025-01-04	2026-10-28	2025-11-06 23:50:46.301
494	156	4	2025-02-02	2025-03-01	2025-11-06 23:50:46.301
495	601	4	2025-05-23	2026-02-24	2025-11-06 23:50:46.301
496	205	3	2025-11-05	2026-02-01	2025-11-06 23:50:46.301
497	498	1	2026-03-12	2026-07-23	2025-11-06 23:50:46.301
498	6	1	2025-10-09	2026-09-02	2025-11-06 23:50:46.301
499	101	1	2025-03-12	2025-06-10	2025-11-06 23:50:46.301
500	579	3	2025-07-09	2026-01-08	2025-11-06 23:50:46.301
501	997	2	2026-10-03	2027-02-28	2025-11-06 23:50:46.301
502	775	4	2024-11-18	2026-03-06	2025-11-06 23:50:46.301
503	967	1	2025-05-06	2026-03-25	2025-11-06 23:50:46.301
504	554	2	2025-06-25	2026-10-13	2025-11-06 23:50:46.301
505	347	4	2025-02-26	2025-05-10	2025-11-06 23:50:46.301
506	748	3	2026-07-31	2026-08-21	2025-11-06 23:50:46.301
507	414	1	2025-08-29	2026-07-23	2025-11-06 23:50:46.301
508	725	1	2025-08-08	2025-11-02	2025-11-06 23:50:46.301
509	883	2	2024-09-14	2025-08-03	2025-11-06 23:50:46.301
510	271	3	2026-04-02	2026-09-22	2025-11-06 23:50:46.301
511	919	3	2025-11-18	2025-12-11	2025-11-06 23:50:46.301
512	940	3	2025-06-02	2025-11-04	2025-11-06 23:50:46.301
513	995	1	2025-10-20	2026-07-09	2025-11-06 23:50:46.301
514	967	4	2026-07-20	2026-08-09	2025-11-06 23:50:46.301
515	44	1	2025-02-28	2025-08-15	2025-11-06 23:50:46.301
516	966	1	2025-09-19	2025-10-20	2025-11-06 23:50:46.301
517	793	3	2025-09-09	2025-11-05	2025-11-06 23:50:46.301
518	656	1	2025-07-24	2025-08-17	2025-11-06 23:50:46.301
519	920	4	2025-04-07	2026-10-04	2025-11-06 23:50:46.301
520	174	1	2025-09-11	2026-10-07	2025-11-06 23:50:46.301
521	31	1	2025-09-10	2026-08-02	2025-11-06 23:50:46.301
522	498	3	2026-01-19	2026-03-15	2025-11-06 23:50:46.301
523	792	3	2025-03-15	2025-09-12	2025-11-06 23:50:46.301
524	928	2	2026-01-11	2026-08-19	2025-11-06 23:50:46.301
525	829	2	2026-05-21	2026-12-11	2025-11-06 23:50:46.301
526	141	2	2026-05-28	2026-06-07	2025-11-06 23:50:46.301
527	553	4	2025-11-03	2026-04-24	2025-11-06 23:50:46.301
528	432	3	2024-12-21	2025-06-07	2025-11-06 23:50:46.301
529	242	2	2025-09-07	2026-02-16	2025-11-06 23:50:46.301
530	142	2	2025-05-15	2025-04-01	2025-11-06 23:50:46.301
531	249	2	2025-08-28	2026-10-24	2025-11-06 23:50:46.301
532	717	2	2025-04-23	2025-12-13	2025-11-06 23:50:46.301
533	866	3	2024-10-15	2025-02-08	2025-11-06 23:50:46.301
534	836	1	2025-06-24	2026-10-15	2025-11-06 23:50:46.301
535	288	2	2026-01-23	2026-02-08	2025-11-06 23:50:46.301
536	97	2	2026-07-11	2027-07-06	2025-11-06 23:50:46.301
537	918	3	2026-07-21	2026-10-29	2025-11-06 23:50:46.301
538	886	1	2026-10-21	2027-09-06	2025-11-06 23:50:46.301
539	590	2	2025-09-13	2025-09-06	2025-11-06 23:50:46.301
540	576	4	2025-12-01	2026-04-30	2025-11-06 23:50:46.301
541	701	3	2026-01-25	2026-05-18	2025-11-06 23:50:46.301
542	308	3	2025-11-06	2025-12-28	2025-11-06 23:50:46.301
543	214	1	2025-09-26	2026-07-19	2025-11-06 23:50:46.301
544	513	1	2024-08-21	2025-05-22	2025-11-06 23:50:46.301
545	939	4	2026-06-28	2027-04-18	2025-11-06 23:50:46.301
546	312	1	2026-09-26	2026-12-11	2025-11-06 23:50:46.301
547	637	1	2025-10-13	2026-07-31	2025-11-06 23:50:46.301
548	398	3	2025-05-06	2026-08-30	2025-11-06 23:50:46.301
549	477	4	2026-06-14	2026-07-30	2025-11-06 23:50:46.301
550	825	1	2025-01-26	2025-10-10	2025-11-06 23:50:46.301
551	474	2	2025-10-27	2026-01-22	2025-11-06 23:50:46.301
552	369	2	2026-03-29	2026-12-13	2025-11-06 23:50:46.301
553	598	4	2025-10-22	2026-10-13	2025-11-06 23:50:46.301
554	392	3	2026-06-15	2027-06-07	2025-11-06 23:50:46.301
555	457	1	2025-09-30	2026-08-30	2025-11-06 23:50:46.301
556	972	1	2026-02-12	2026-05-09	2025-11-06 23:50:46.302
557	825	2	2025-09-06	2025-08-21	2025-11-06 23:50:46.302
558	204	4	2025-04-27	2026-01-30	2025-11-06 23:50:46.302
559	144	1	2025-10-08	2026-01-17	2025-11-06 23:50:46.302
560	580	3	2026-09-25	2027-06-19	2025-11-06 23:50:46.302
561	68	2	2026-03-07	2026-11-02	2025-11-06 23:50:46.302
562	208	2	2025-08-25	2025-08-29	2025-11-06 23:50:46.302
563	228	1	2025-10-26	2026-07-17	2025-11-06 23:50:46.302
564	958	4	2025-09-04	2025-09-09	2025-11-06 23:50:46.302
565	515	4	2025-08-15	2026-03-13	2025-11-06 23:50:46.302
566	376	3	2025-10-01	2025-09-19	2025-11-06 23:50:46.302
567	805	1	2026-02-16	2026-03-27	2025-11-06 23:50:46.302
568	651	4	2025-01-27	2026-10-11	2025-11-06 23:50:46.302
569	602	2	2025-04-08	2025-09-05	2025-11-06 23:50:46.302
570	311	2	2025-11-28	2026-02-01	2025-11-06 23:50:46.302
571	412	2	2025-11-02	2026-07-16	2025-11-06 23:50:46.302
572	44	2	2025-06-13	2025-06-04	2025-11-06 23:50:46.302
573	688	2	2025-04-11	2025-09-10	2025-11-06 23:50:46.302
574	533	2	2026-03-09	2026-06-26	2025-11-06 23:50:46.302
575	676	1	2025-09-19	2025-09-17	2025-11-06 23:50:46.302
576	557	3	2026-04-30	2026-06-26	2025-11-06 23:50:46.302
577	805	1	2025-07-25	2025-08-19	2025-11-06 23:50:46.302
578	69	4	2025-10-22	2025-09-27	2025-11-06 23:50:46.302
579	120	3	2024-12-14	2025-09-10	2025-11-06 23:50:46.302
580	494	4	2025-09-24	2026-03-29	2025-11-06 23:50:46.302
581	330	1	2025-04-22	2025-05-21	2025-11-06 23:50:46.302
582	857	1	2026-07-15	2027-06-22	2025-11-06 23:50:46.302
583	614	4	2025-12-02	2026-11-19	2025-11-06 23:50:46.302
584	663	1	2025-11-03	2026-09-03	2025-11-06 23:50:46.302
585	84	2	2024-02-23	2025-03-05	2025-11-06 23:50:46.302
586	844	4	2025-10-26	2026-01-01	2025-11-06 23:50:46.302
587	289	1	2026-04-09	2026-06-22	2025-11-06 23:50:46.302
588	114	4	2026-10-02	2026-12-19	2025-11-06 23:50:46.302
589	235	4	2025-11-06	2026-01-20	2025-11-06 23:50:46.302
590	250	4	2025-10-29	2026-10-19	2025-11-06 23:50:46.302
591	65	1	2025-03-02	2025-12-31	2025-11-06 23:50:46.302
592	839	2	2025-11-06	2026-02-04	2025-11-06 23:50:46.302
593	545	2	2025-10-03	2026-06-30	2025-11-06 23:50:46.302
594	186	4	2026-07-04	2027-02-03	2025-11-06 23:50:46.302
595	80	3	2026-02-07	2026-11-04	2025-11-06 23:50:46.302
596	941	1	2025-05-29	2026-08-14	2025-11-06 23:50:46.302
597	539	4	2025-11-21	2026-02-21	2025-11-06 23:50:46.302
598	212	1	2025-09-23	2025-09-19	2025-11-06 23:50:46.302
599	294	4	2025-01-29	2025-01-30	2025-11-06 23:50:46.302
600	418	1	2025-08-27	2026-10-23	2025-11-06 23:50:46.302
601	265	3	2025-06-19	2025-10-07	2025-11-06 23:50:46.302
602	818	4	2025-01-01	2025-04-30	2025-11-06 23:50:46.302
603	164	2	2026-10-15	2027-01-18	2025-11-06 23:50:46.302
604	258	2	2025-12-24	2026-02-05	2025-11-06 23:50:46.302
605	580	3	2026-05-07	2027-03-10	2025-11-06 23:50:46.302
606	134	1	2026-10-01	2026-11-28	2025-11-06 23:50:46.302
607	52	4	2025-05-13	2026-09-24	2025-11-06 23:50:46.302
608	735	4	2025-09-10	2025-06-18	2025-11-06 23:50:46.302
609	948	3	2025-07-30	2025-10-01	2025-11-06 23:50:46.302
610	896	2	2025-09-21	2025-10-09	2025-11-06 23:50:46.302
611	824	1	2025-10-21	2025-10-22	2025-11-06 23:50:46.302
612	961	4	2025-08-25	2025-08-22	2025-11-06 23:50:46.302
613	795	4	2026-03-31	2026-08-17	2025-11-06 23:50:46.302
614	264	1	2025-01-27	2026-08-24	2025-11-06 23:50:46.302
615	837	4	2025-07-18	2026-03-17	2025-11-06 23:50:46.302
616	87	4	2024-12-30	2025-05-15	2025-11-06 23:50:46.302
617	791	4	2026-02-25	2026-11-04	2025-11-06 23:50:46.302
618	418	1	2025-06-04	2025-08-30	2025-11-06 23:50:46.302
619	598	1	2025-06-28	2025-10-18	2025-11-06 23:50:46.302
620	610	2	2025-08-25	2025-05-25	2025-11-06 23:50:46.302
621	772	2	2025-11-05	2026-11-06	2025-11-06 23:50:46.302
622	628	2	2026-01-08	2026-12-30	2025-11-06 23:50:46.302
623	981	4	2026-10-07	2026-12-31	2025-11-06 23:50:46.302
624	618	4	2025-04-03	2025-05-29	2025-11-06 23:50:46.302
625	841	2	2025-09-25	2026-04-25	2025-11-06 23:50:46.302
626	545	1	2025-11-08	2026-04-19	2025-11-06 23:50:46.302
627	33	1	2025-05-27	2025-05-21	2025-11-06 23:50:46.302
628	306	3	2026-04-11	2026-12-03	2025-11-06 23:50:46.302
629	825	3	2025-01-13	2026-08-01	2025-11-06 23:50:46.302
630	302	2	2025-09-01	2026-06-11	2025-11-06 23:50:46.302
631	315	3	2025-04-25	2025-10-12	2025-11-06 23:50:46.302
632	789	2	2024-05-17	2025-05-11	2025-11-06 23:50:46.302
633	324	1	2025-08-31	2026-01-24	2025-11-06 23:50:46.302
634	705	2	2025-09-15	2026-10-14	2025-11-06 23:50:46.302
635	818	3	2026-01-24	2026-11-13	2025-11-06 23:50:46.302
636	103	3	2025-02-27	2025-04-02	2025-11-06 23:50:46.302
637	851	4	2026-09-14	2026-10-18	2025-11-06 23:50:46.302
638	65	3	2025-11-18	2026-04-06	2025-11-06 23:50:46.302
639	743	4	2025-09-30	2026-04-21	2025-11-06 23:50:46.302
640	453	3	2025-08-01	2025-06-27	2025-11-06 23:50:46.302
641	338	1	2025-10-18	2026-07-14	2025-11-06 23:50:46.302
642	986	1	2025-12-02	2026-10-15	2025-11-06 23:50:46.302
643	923	4	2025-09-24	2025-11-26	2025-11-06 23:50:46.302
644	281	3	2025-07-24	2026-03-05	2025-11-06 23:50:46.302
645	701	4	2025-04-27	2025-08-02	2025-11-06 23:50:46.302
646	78	4	2025-05-18	2025-12-01	2025-11-06 23:50:46.302
647	488	3	2025-06-12	2025-08-12	2025-11-06 23:50:46.302
648	758	4	2024-09-24	2025-07-23	2025-11-06 23:50:46.302
649	790	3	2025-09-30	2025-11-22	2025-11-06 23:50:46.302
650	678	4	2025-07-29	2026-05-31	2025-11-06 23:50:46.302
651	917	2	2025-10-26	2026-05-11	2025-11-06 23:50:46.302
652	507	4	2025-09-28	2026-07-30	2025-11-06 23:50:46.302
653	898	1	2026-06-02	2027-04-18	2025-11-06 23:50:46.302
654	581	2	2026-04-23	2027-01-09	2025-11-06 23:50:46.302
655	322	2	2025-10-14	2025-12-21	2025-11-06 23:50:46.302
656	255	3	2026-10-19	2027-05-16	2025-11-06 23:50:46.302
657	65	4	2026-04-26	2026-10-11	2025-11-06 23:50:46.302
658	354	3	2025-11-11	2026-09-30	2025-11-06 23:50:46.302
659	174	2	2025-11-28	2026-04-29	2025-11-06 23:50:46.302
660	4	4	2025-12-09	2026-07-04	2025-11-06 23:50:46.302
661	168	1	2026-06-18	2026-11-12	2025-11-06 23:50:46.302
662	225	1	2026-05-16	2027-02-06	2025-11-06 23:50:46.302
663	911	3	2026-09-24	2026-11-14	2025-11-06 23:50:46.302
664	273	4	2025-05-17	2025-05-19	2025-11-06 23:50:46.302
665	212	4	2025-07-23	2025-08-01	2025-11-06 23:50:46.302
666	739	4	2025-10-18	2025-11-05	2025-11-06 23:50:46.302
667	883	4	2024-11-04	2025-10-29	2025-11-06 23:50:46.302
668	387	1	2026-06-16	2027-03-14	2025-11-06 23:50:46.302
669	77	2	2026-03-31	2026-08-02	2025-11-06 23:50:46.302
670	182	1	2024-09-16	2025-03-24	2025-11-06 23:50:46.302
671	565	3	2025-12-12	2026-02-20	2025-11-06 23:50:46.302
672	846	3	2025-10-05	2026-02-16	2025-11-06 23:50:46.302
673	559	4	2024-03-19	2025-07-02	2025-11-06 23:50:46.302
674	81	4	2025-08-05	2025-08-21	2025-11-06 23:50:46.302
675	157	4	2025-10-31	2026-05-21	2025-11-06 23:50:46.302
676	382	2	2025-06-21	2026-05-22	2025-11-06 23:50:46.302
677	242	2	2024-05-18	2025-03-27	2025-11-06 23:50:46.302
678	177	1	2025-06-01	2026-09-07	2025-11-06 23:50:46.302
679	322	2	2026-04-25	2027-01-07	2025-11-06 23:50:46.302
680	350	1	2025-09-03	2025-09-08	2025-11-06 23:50:46.302
681	993	1	2025-06-11	2025-06-20	2025-11-06 23:50:46.302
682	703	1	2026-08-16	2027-02-01	2025-11-06 23:50:46.302
683	521	1	2025-03-21	2025-03-03	2025-11-06 23:50:46.302
684	255	4	2026-03-30	2026-04-27	2025-11-06 23:50:46.302
685	728	1	2025-08-07	2025-07-01	2025-11-06 23:50:46.302
686	653	1	2025-09-15	2026-06-26	2025-11-06 23:50:46.302
687	884	4	2024-12-09	2025-01-05	2025-11-06 23:50:46.302
688	771	3	2025-03-16	2025-10-26	2025-11-06 23:50:46.302
689	842	4	2025-01-22	2025-05-01	2025-11-06 23:50:46.302
690	291	4	2026-03-04	2026-12-07	2025-11-06 23:50:46.302
691	742	1	2025-11-01	2026-10-14	2025-11-06 23:50:46.302
692	607	3	2026-01-02	2026-07-07	2025-11-06 23:50:46.302
693	716	1	2026-03-15	2026-09-24	2025-11-06 23:50:46.302
694	63	3	2025-01-26	2025-10-18	2025-11-06 23:50:46.302
695	70	2	2025-07-31	2025-04-02	2025-11-06 23:50:46.302
696	172	4	2025-03-15	2025-03-15	2025-11-06 23:50:46.302
697	514	3	2025-05-25	2025-10-26	2025-11-06 23:50:46.302
698	135	3	2026-02-24	2026-06-11	2025-11-06 23:50:46.302
699	991	1	2026-07-29	2027-07-13	2025-11-06 23:50:46.302
700	925	1	2026-03-11	2026-11-20	2025-11-06 23:50:46.302
701	390	1	2026-01-24	2026-07-05	2025-11-06 23:50:46.302
702	732	4	2026-08-24	2027-05-25	2025-11-06 23:50:46.302
703	310	3	2025-10-10	2026-02-15	2025-11-06 23:50:46.302
704	680	3	2025-12-28	2026-03-05	2025-11-06 23:50:46.302
705	855	1	2025-09-20	2026-04-27	2025-11-06 23:50:46.302
706	471	4	2025-06-16	2026-10-20	2025-11-06 23:50:46.302
707	254	1	2025-01-22	2025-04-14	2025-11-06 23:50:46.302
708	620	1	2025-09-23	2025-12-17	2025-11-06 23:50:46.302
709	927	1	2024-12-19	2024-12-21	2025-11-06 23:50:46.302
710	20	3	2025-02-17	2026-06-01	2025-11-06 23:50:46.302
711	686	3	2025-06-21	2025-08-24	2025-11-06 23:50:46.302
712	267	2	2026-06-13	2027-05-21	2025-11-06 23:50:46.302
713	676	4	2025-05-30	2025-10-02	2025-11-06 23:50:46.302
714	24	1	2025-06-09	2026-03-18	2025-11-06 23:50:46.302
715	145	4	2024-12-30	2025-10-07	2025-11-06 23:50:46.302
716	568	4	2025-11-10	2026-10-29	2025-11-06 23:50:46.302
717	124	2	2025-04-23	2025-05-20	2025-11-06 23:50:46.302
718	574	1	2026-04-25	2026-05-02	2025-11-06 23:50:46.302
719	359	3	2025-09-04	2025-10-24	2025-11-06 23:50:46.302
720	183	3	2026-09-16	2026-12-08	2025-11-06 23:50:46.302
721	537	2	2024-10-21	2025-01-21	2025-11-06 23:50:46.302
722	859	4	2025-10-13	2026-07-24	2025-11-06 23:50:46.302
723	199	2	2025-10-31	2026-06-22	2025-11-06 23:50:46.302
724	623	2	2025-10-26	2026-02-18	2025-11-06 23:50:46.302
725	341	4	2025-02-22	2025-09-01	2025-11-06 23:50:46.302
726	853	1	2025-11-25	2026-01-19	2025-11-06 23:50:46.302
727	785	2	2025-09-01	2026-05-31	2025-11-06 23:50:46.302
728	978	3	2025-01-30	2025-09-24	2025-11-06 23:50:46.302
729	457	4	2026-01-23	2026-10-28	2025-11-06 23:50:46.302
730	757	1	2026-03-20	2026-06-08	2025-11-06 23:50:46.302
731	536	2	2025-06-23	2026-03-17	2025-11-06 23:50:46.302
732	927	3	2025-04-07	2025-04-29	2025-11-06 23:50:46.302
733	580	4	2025-11-14	2026-07-31	2025-11-06 23:50:46.302
734	203	4	2025-11-10	2026-10-05	2025-11-06 23:50:46.302
735	984	2	2025-04-16	2026-10-16	2025-11-06 23:50:46.302
736	311	2	2025-05-15	2026-07-13	2025-11-06 23:50:46.302
737	205	4	2026-08-11	2027-05-10	2025-11-06 23:50:46.302
738	604	2	2026-04-21	2026-07-11	2025-11-06 23:50:46.302
739	422	4	2025-07-10	2026-11-03	2025-11-06 23:50:46.302
740	176	1	2025-05-30	2026-02-25	2025-11-06 23:50:46.302
741	844	1	2025-06-23	2025-09-06	2025-11-06 23:50:46.302
742	874	1	2025-08-12	2025-10-15	2025-11-06 23:50:46.302
743	543	4	2025-04-19	2025-08-10	2025-11-06 23:50:46.302
744	375	2	2025-08-11	2025-09-15	2025-11-06 23:50:46.302
745	657	4	2024-11-16	2025-07-16	2025-11-06 23:50:46.302
746	645	1	2025-07-19	2025-09-14	2025-11-06 23:50:46.302
747	356	1	2025-07-07	2026-08-24	2025-11-06 23:50:46.302
748	462	3	2026-10-05	2027-01-19	2025-11-06 23:50:46.302
749	746	3	2025-11-30	2026-10-16	2025-11-06 23:50:46.302
750	937	2	2025-05-31	2026-01-05	2025-11-06 23:50:46.302
751	613	1	2025-08-07	2025-06-09	2025-11-06 23:50:46.302
752	992	1	2025-08-01	2025-08-01	2025-11-06 23:50:46.302
753	367	4	2024-11-02	2025-03-20	2025-11-06 23:50:46.302
754	511	1	2025-10-26	2026-08-13	2025-11-06 23:50:46.302
755	127	4	2025-09-01	2026-04-18	2025-11-06 23:50:46.302
756	11	1	2025-05-15	2025-08-26	2025-11-06 23:50:46.302
757	559	1	2026-10-17	2026-12-29	2025-11-06 23:50:46.302
758	650	3	2026-09-19	2027-09-01	2025-11-06 23:50:46.302
759	192	3	2026-02-13	2026-09-04	2025-11-06 23:50:46.302
760	106	1	2025-10-12	2026-07-12	2025-11-06 23:50:46.302
761	226	4	2025-10-11	2026-04-22	2025-11-06 23:50:46.302
762	308	3	2026-06-22	2027-01-31	2025-11-06 23:50:46.302
763	135	3	2025-01-01	2026-02-21	2025-11-06 23:50:46.302
764	337	2	2026-06-30	2027-05-21	2025-11-06 23:50:46.302
765	552	1	2025-07-23	2026-08-08	2025-11-06 23:50:46.302
766	331	4	2025-01-18	2026-06-02	2025-11-06 23:50:46.302
767	349	2	2025-08-22	2026-07-11	2025-11-06 23:50:46.302
768	132	1	2025-10-28	2026-03-14	2025-11-06 23:50:46.302
769	667	3	2025-10-30	2026-01-21	2025-11-06 23:50:46.302
770	184	4	2026-04-06	2026-11-27	2025-11-06 23:50:46.302
771	881	1	2026-05-16	2026-05-21	2025-11-06 23:50:46.302
772	842	3	2025-08-18	2025-07-11	2025-11-06 23:50:46.302
773	831	4	2024-12-19	2025-08-07	2025-11-06 23:50:46.302
774	127	1	2024-12-22	2025-06-16	2025-11-06 23:50:46.302
775	590	3	2025-10-21	2026-01-31	2025-11-06 23:50:46.302
776	51	2	2025-09-24	2026-07-28	2025-11-06 23:50:46.302
777	858	4	2025-05-06	2026-02-22	2025-11-06 23:50:46.302
778	938	3	2025-06-13	2026-01-10	2025-11-06 23:50:46.302
779	627	2	2026-03-26	2026-10-31	2025-11-06 23:50:46.302
780	330	3	2026-07-17	2027-01-05	2025-11-06 23:50:46.302
781	254	1	2025-08-10	2026-03-17	2025-11-06 23:50:46.302
782	201	4	2025-09-28	2026-09-06	2025-11-06 23:50:46.302
783	985	4	2025-06-17	2026-03-07	2025-11-06 23:50:46.302
784	225	2	2026-04-01	2027-01-12	2025-11-06 23:50:46.302
785	698	2	2025-11-06	2026-09-27	2025-11-06 23:50:46.302
786	529	3	2025-08-06	2025-11-02	2025-11-06 23:50:46.302
787	993	3	2025-02-01	2025-10-14	2025-11-06 23:50:46.302
788	9	4	2026-03-20	2027-02-05	2025-11-06 23:50:46.302
789	80	2	2025-08-12	2026-04-06	2025-11-06 23:50:46.302
790	920	2	2026-02-20	2026-08-19	2025-11-06 23:50:46.302
791	7	2	2024-12-18	2025-02-22	2025-11-06 23:50:46.302
792	732	3	2025-07-14	2025-07-11	2025-11-06 23:50:46.302
793	416	3	2025-03-09	2025-07-16	2025-11-06 23:50:46.302
794	423	1	2025-11-01	2026-10-17	2025-11-06 23:50:46.302
795	244	4	2026-06-13	2026-11-11	2025-11-06 23:50:46.302
796	916	3	2026-05-23	2027-04-30	2025-11-06 23:50:46.302
797	345	4	2026-02-27	2026-09-06	2025-11-06 23:50:46.302
798	377	3	2025-09-15	2025-10-10	2025-11-06 23:50:46.302
799	253	1	2025-11-04	2026-10-24	2025-11-06 23:50:46.302
800	308	2	2024-07-10	2025-03-22	2025-11-06 23:50:46.302
801	371	4	2025-03-11	2025-02-11	2025-11-06 23:50:46.302
802	268	4	2026-01-20	2026-04-10	2025-11-06 23:50:46.302
803	79	2	2026-07-03	2027-06-01	2025-11-06 23:50:46.302
804	572	1	2025-03-20	2026-05-20	2025-11-06 23:50:46.302
805	83	1	2024-09-25	2025-08-13	2025-11-06 23:50:46.302
806	381	3	2024-08-17	2025-10-20	2025-11-06 23:50:46.302
807	236	3	2026-08-09	2026-11-16	2025-11-06 23:50:46.302
808	357	4	2025-09-15	2026-01-17	2025-11-06 23:50:46.302
809	776	4	2025-02-13	2026-01-16	2025-11-06 23:50:46.302
810	754	4	2025-05-07	2026-04-05	2025-11-06 23:50:46.302
811	454	2	2025-07-30	2026-01-17	2025-11-06 23:50:46.302
812	336	4	2025-10-13	2026-01-23	2025-11-06 23:50:46.302
813	459	1	2024-08-02	2025-03-24	2025-11-06 23:50:46.302
814	856	2	2025-11-01	2026-01-04	2025-11-06 23:50:46.302
815	683	2	2025-06-07	2026-08-29	2025-11-06 23:50:46.302
816	111	3	2025-08-30	2025-09-10	2025-11-06 23:50:46.302
817	441	1	2025-07-06	2025-12-06	2025-11-06 23:50:46.302
818	678	1	2024-05-18	2025-08-17	2025-11-06 23:50:46.302
819	675	3	2025-09-17	2026-05-27	2025-11-06 23:50:46.302
820	685	4	2026-05-18	2027-01-11	2025-11-06 23:50:46.302
821	715	3	2026-06-01	2026-07-19	2025-11-06 23:50:46.302
822	302	3	2026-04-26	2026-11-04	2025-11-06 23:50:46.302
823	660	1	2025-06-18	2025-07-15	2025-11-06 23:50:46.302
824	993	1	2025-05-31	2025-06-06	2025-11-06 23:50:46.302
825	506	2	2025-01-09	2025-05-29	2025-11-06 23:50:46.302
826	761	2	2024-08-03	2025-10-20	2025-11-06 23:50:46.302
827	652	4	2026-07-31	2026-09-22	2025-11-06 23:50:46.302
828	263	4	2025-10-07	2025-10-29	2025-11-06 23:50:46.302
829	665	1	2026-04-19	2026-05-09	2025-11-06 23:50:46.302
830	319	1	2025-06-10	2025-06-06	2025-11-06 23:50:46.302
831	870	1	2026-08-07	2027-06-25	2025-11-06 23:50:46.302
832	598	4	2026-10-17	2026-11-28	2025-11-06 23:50:46.302
833	425	4	2025-09-06	2026-10-10	2025-11-06 23:50:46.302
834	312	1	2025-09-19	2026-10-19	2025-11-06 23:50:46.302
835	747	1	2025-10-12	2026-03-21	2025-11-06 23:50:46.302
836	369	1	2025-10-18	2026-05-11	2025-11-06 23:50:46.302
837	679	2	2025-11-18	2026-06-01	2025-11-06 23:50:46.302
838	600	2	2025-06-01	2026-09-05	2025-11-06 23:50:46.302
839	930	3	2025-10-08	2026-03-22	2025-11-06 23:50:46.302
840	714	3	2025-06-30	2025-11-28	2025-11-06 23:50:46.302
841	886	1	2026-10-01	2026-11-29	2025-11-06 23:50:46.302
842	780	4	2025-02-19	2025-05-23	2025-11-06 23:50:46.302
843	198	1	2026-05-28	2026-07-13	2025-11-06 23:50:46.302
844	322	3	2025-07-26	2025-10-21	2025-11-06 23:50:46.303
845	492	4	2025-06-07	2025-12-28	2025-11-06 23:50:46.303
846	164	4	2026-03-20	2026-08-14	2025-11-06 23:50:46.303
847	846	2	2025-05-29	2025-05-29	2025-11-06 23:50:46.303
848	838	4	2025-04-04	2026-09-04	2025-11-06 23:50:46.303
849	189	2	2024-11-28	2024-12-18	2025-11-06 23:50:46.303
850	663	3	2025-09-26	2025-09-21	2025-11-06 23:50:46.303
851	515	4	2025-12-02	2026-10-11	2025-11-06 23:50:46.303
852	201	2	2026-01-27	2026-06-28	2025-11-06 23:50:46.303
853	235	3	2026-10-01	2027-01-17	2025-11-06 23:50:46.303
854	293	2	2025-09-27	2025-08-24	2025-11-06 23:50:46.303
855	555	1	2025-03-07	2025-10-14	2025-11-06 23:50:46.303
856	973	1	2025-08-27	2025-12-27	2025-11-06 23:50:46.303
857	868	1	2026-07-05	2027-02-15	2025-11-06 23:50:46.303
858	790	2	2025-01-07	2025-03-23	2025-11-06 23:50:46.303
859	704	1	2026-03-26	2026-09-26	2025-11-06 23:50:46.303
860	475	2	2025-04-09	2025-05-01	2025-11-06 23:50:46.303
861	791	4	2026-07-04	2026-09-25	2025-11-06 23:50:46.303
862	496	2	2025-10-22	2026-09-29	2025-11-06 23:50:46.303
863	323	3	2025-10-04	2026-10-16	2025-11-06 23:50:46.303
864	299	2	2025-03-02	2026-07-21	2025-11-06 23:50:46.303
865	254	3	2025-05-18	2025-05-31	2025-11-06 23:50:46.303
866	517	4	2024-12-25	2025-10-28	2025-11-06 23:50:46.303
867	115	1	2026-08-19	2027-08-19	2025-11-06 23:50:46.303
868	783	2	2026-08-08	2026-11-24	2025-11-06 23:50:46.303
869	772	4	2026-09-03	2027-08-21	2025-11-06 23:50:46.303
870	361	1	2025-02-04	2025-07-18	2025-11-06 23:50:46.303
871	949	3	2024-06-28	2025-11-04	2025-11-06 23:50:46.303
872	614	2	2025-05-04	2026-07-04	2025-11-06 23:50:46.303
873	856	1	2025-05-03	2025-04-17	2025-11-06 23:50:46.303
874	685	3	2026-04-04	2027-02-08	2025-11-06 23:50:46.303
875	743	1	2026-05-07	2027-03-18	2025-11-06 23:50:46.303
876	972	4	2024-04-24	2025-05-22	2025-11-06 23:50:46.303
877	568	1	2026-01-17	2026-06-13	2025-11-06 23:50:46.303
878	98	3	2024-11-22	2025-11-28	2025-11-06 23:50:46.303
879	368	1	2026-05-22	2026-11-02	2025-11-06 23:50:46.303
880	873	3	2026-10-29	2026-12-20	2025-11-06 23:50:46.303
881	248	3	2025-11-25	2026-11-15	2025-11-06 23:50:46.303
882	537	3	2025-11-06	2025-11-02	2025-11-06 23:50:46.303
883	905	3	2025-06-30	2025-09-20	2025-11-06 23:50:46.303
884	835	2	2024-03-25	2025-06-28	2025-11-06 23:50:46.303
885	963	1	2026-10-16	2027-10-10	2025-11-06 23:50:46.303
886	132	2	2026-08-25	2027-07-19	2025-11-06 23:50:46.303
887	746	1	2025-08-29	2026-07-31	2025-11-06 23:50:46.303
888	481	1	2025-06-02	2025-06-28	2025-11-06 23:50:46.303
889	255	1	2026-04-16	2027-02-04	2025-11-06 23:50:46.303
890	848	2	2025-03-06	2025-07-01	2025-11-06 23:50:46.303
891	565	3	2026-08-02	2026-10-28	2025-11-06 23:50:46.303
892	249	1	2026-04-24	2026-12-29	2025-11-06 23:50:46.303
893	828	3	2025-03-24	2025-02-27	2025-11-06 23:50:46.303
894	181	3	2025-12-23	2026-12-13	2025-11-06 23:50:46.303
895	306	2	2025-11-05	2026-07-10	2025-11-06 23:50:46.303
896	927	2	2025-07-14	2025-08-31	2025-11-06 23:50:46.303
897	305	4	2025-08-13	2026-02-03	2025-11-06 23:50:46.303
898	491	2	2025-09-25	2025-09-24	2025-11-06 23:50:46.303
899	285	4	2026-07-14	2027-04-24	2025-11-06 23:50:46.303
900	133	3	2025-05-25	2026-07-19	2025-11-06 23:50:46.303
901	308	3	2025-09-01	2025-09-16	2025-11-06 23:50:46.303
902	627	1	2025-03-29	2026-05-24	2025-11-06 23:50:46.303
903	507	3	2025-09-12	2025-09-21	2025-11-06 23:50:46.303
904	326	1	2025-09-16	2025-11-19	2025-11-06 23:50:46.303
905	560	4	2026-05-11	2026-12-04	2025-11-06 23:50:46.303
906	727	1	2025-09-22	2026-06-06	2025-11-06 23:50:46.303
907	425	2	2025-08-24	2025-04-20	2025-11-06 23:50:46.303
908	916	1	2025-05-14	2025-10-26	2025-11-06 23:50:46.303
909	160	4	2024-09-15	2025-08-22	2025-11-06 23:50:46.303
910	494	4	2024-11-17	2025-07-10	2025-11-06 23:50:46.303
911	139	4	2025-08-04	2026-09-29	2025-11-06 23:50:46.303
912	198	3	2026-08-25	2027-03-12	2025-11-06 23:50:46.303
913	675	3	2026-10-14	2027-05-08	2025-11-06 23:50:46.303
914	440	1	2025-02-04	2026-10-04	2025-11-06 23:50:46.303
915	169	1	2026-02-02	2026-06-11	2025-11-06 23:50:46.303
916	633	1	2025-09-16	2025-07-06	2025-11-06 23:50:46.303
917	754	1	2026-08-23	2027-03-01	2025-11-06 23:50:46.303
918	976	1	2026-01-02	2026-03-07	2025-11-06 23:50:46.303
919	817	3	2025-11-01	2026-02-22	2025-11-06 23:50:46.303
920	154	3	2025-04-14	2026-07-10	2025-11-06 23:50:46.303
921	838	4	2024-08-04	2025-09-04	2025-11-06 23:50:46.303
922	450	1	2026-10-27	2027-07-01	2025-11-06 23:50:46.303
923	987	1	2025-05-15	2026-07-14	2025-11-06 23:50:46.303
924	77	1	2025-08-08	2026-07-06	2025-11-06 23:50:46.303
925	968	4	2026-05-02	2027-03-13	2025-11-06 23:50:46.303
926	581	4	2025-10-20	2026-09-01	2025-11-06 23:50:46.303
927	732	2	2025-09-05	2026-08-29	2025-11-06 23:50:46.303
928	143	4	2025-09-15	2025-11-05	2025-11-06 23:50:46.303
929	798	1	2024-07-21	2025-08-05	2025-11-06 23:50:46.303
930	274	1	2025-11-04	2025-11-07	2025-11-06 23:50:46.303
931	436	2	2025-05-29	2025-05-25	2025-11-06 23:50:46.303
932	548	3	2025-04-11	2025-12-31	2025-11-06 23:50:46.303
933	615	4	2025-03-14	2026-07-15	2025-11-06 23:50:46.303
934	71	4	2025-11-04	2026-03-27	2025-11-06 23:50:46.303
935	837	4	2024-10-20	2025-09-15	2025-11-06 23:50:46.303
936	817	1	2025-02-09	2025-10-25	2025-11-06 23:50:46.303
937	166	4	2024-10-19	2025-11-03	2025-11-06 23:50:46.303
938	564	3	2025-11-05	2026-02-17	2025-11-06 23:50:46.303
939	295	4	2025-12-14	2026-10-22	2025-11-06 23:50:46.303
940	663	1	2025-09-03	2025-09-30	2025-11-06 23:50:46.303
941	487	4	2025-08-31	2026-09-26	2025-11-06 23:50:46.303
942	158	4	2025-07-01	2025-05-31	2025-11-06 23:50:46.303
943	829	2	2025-11-08	2026-04-20	2025-11-06 23:50:46.303
944	432	4	2025-06-13	2025-05-13	2025-11-06 23:50:46.303
945	392	3	2026-06-09	2027-01-29	2025-11-06 23:50:46.303
946	419	3	2025-10-01	2026-08-08	2025-11-06 23:50:46.303
947	458	3	2026-06-03	2027-05-03	2025-11-06 23:50:46.303
948	787	2	2025-07-28	2026-09-02	2025-11-06 23:50:46.303
949	701	1	2026-10-29	2027-04-26	2025-11-06 23:50:46.303
950	638	4	2025-10-09	2026-02-13	2025-11-06 23:50:46.303
951	422	1	2026-06-14	2027-05-24	2025-11-06 23:50:46.303
952	265	3	2024-03-31	2025-09-14	2025-11-06 23:50:46.303
953	380	2	2026-04-25	2027-02-15	2025-11-06 23:50:46.303
954	263	4	2025-06-16	2025-09-29	2025-11-06 23:50:46.303
955	638	3	2025-02-14	2025-05-16	2025-11-06 23:50:46.303
956	871	4	2025-08-24	2026-05-25	2025-11-06 23:50:46.303
957	930	4	2026-06-26	2026-08-24	2025-11-06 23:50:46.303
958	732	2	2025-11-15	2026-09-29	2025-11-06 23:50:46.303
959	496	3	2026-04-23	2027-04-03	2025-11-06 23:50:46.303
960	971	4	2024-07-24	2025-10-08	2025-11-06 23:50:46.303
961	734	4	2025-06-20	2026-09-29	2025-11-06 23:50:46.303
962	640	3	2026-05-04	2026-10-26	2025-11-06 23:50:46.303
963	597	1	2025-04-14	2026-02-14	2025-11-06 23:50:46.303
964	699	2	2026-09-06	2026-12-18	2025-11-06 23:50:46.303
965	493	2	2026-01-14	2026-01-25	2025-11-06 23:50:46.303
966	832	1	2025-10-29	2025-12-22	2025-11-06 23:50:46.303
967	176	1	2024-07-22	2025-08-19	2025-11-06 23:50:46.303
968	668	3	2026-06-05	2026-08-14	2025-11-06 23:50:46.303
969	276	4	2025-07-22	2026-06-19	2025-11-06 23:50:46.303
970	969	2	2024-04-04	2025-07-19	2025-11-06 23:50:46.303
971	188	3	2025-03-22	2026-03-19	2025-11-06 23:50:46.303
972	654	2	2025-07-13	2025-07-20	2025-11-06 23:50:46.303
973	459	4	2026-08-19	2026-08-20	2025-11-06 23:50:46.303
974	225	3	2024-09-25	2025-11-05	2025-11-06 23:50:46.303
975	478	3	2026-01-10	2026-10-24	2025-11-06 23:50:46.303
976	326	4	2024-08-19	2025-05-09	2025-11-06 23:50:46.303
977	292	2	2026-10-03	2026-10-04	2025-11-06 23:50:46.303
978	484	1	2025-04-14	2025-10-07	2025-11-06 23:50:46.303
979	221	3	2026-03-20	2027-01-15	2025-11-06 23:50:46.303
980	867	3	2025-01-11	2025-11-15	2025-11-06 23:50:46.303
981	339	2	2024-11-10	2025-11-05	2025-11-06 23:50:46.303
982	884	2	2026-03-01	2026-05-08	2025-11-06 23:50:46.303
983	498	1	2025-06-27	2025-07-08	2025-11-06 23:50:46.303
984	716	3	2026-03-09	2026-10-22	2025-11-06 23:50:46.303
985	658	3	2025-10-29	2026-04-26	2025-11-06 23:50:46.303
986	442	1	2026-09-16	2026-10-30	2025-11-06 23:50:46.303
987	482	4	2025-03-21	2025-05-27	2025-11-06 23:50:46.303
988	151	3	2025-10-18	2026-10-29	2025-11-06 23:50:46.303
989	989	1	2025-07-13	2026-10-08	2025-11-06 23:50:46.303
990	233	3	2025-10-22	2026-10-02	2025-11-06 23:50:46.303
991	380	1	2025-02-26	2025-07-07	2025-11-06 23:50:46.303
992	387	1	2024-09-24	2025-10-30	2025-11-06 23:50:46.303
993	397	3	2025-10-17	2026-02-16	2025-11-06 23:50:46.303
994	627	1	2026-07-28	2026-12-16	2025-11-06 23:50:46.303
995	394	3	2025-08-10	2026-10-04	2025-11-06 23:50:46.303
996	685	1	2025-01-07	2025-12-28	2025-11-06 23:50:46.303
997	32	4	2025-09-11	2026-07-22	2025-11-06 23:50:46.303
998	980	4	2026-05-11	2027-01-17	2025-11-06 23:50:46.303
999	953	4	2025-03-02	2025-07-24	2025-11-06 23:50:46.303
1000	402	3	2025-06-20	2026-08-10	2025-11-06 23:50:46.303
1001	785	1	2026-10-27	2027-09-24	2025-11-06 23:50:46.303
1002	643	3	2025-05-24	2025-05-14	2025-11-06 23:50:46.303
1003	871	4	2026-07-26	2026-09-03	2025-11-06 23:50:46.303
1004	208	3	2025-09-09	2026-04-25	2025-11-06 23:50:46.303
1005	266	2	2025-10-14	2026-02-17	2025-11-06 23:50:46.303
1006	805	1	2025-08-04	2025-09-29	2025-11-06 23:50:46.303
1007	404	2	2026-08-30	2027-02-21	2025-11-06 23:50:46.303
1008	388	4	2026-03-10	2026-05-11	2025-11-06 23:50:46.303
1009	841	1	2025-02-26	2025-08-19	2025-11-06 23:50:46.303
1010	675	3	2025-12-18	2026-08-07	2025-11-06 23:50:46.303
1011	686	4	2025-11-30	2026-09-07	2025-11-06 23:50:46.303
1012	627	3	2026-08-16	2026-09-03	2025-11-06 23:50:46.303
1013	439	1	2026-06-23	2027-03-28	2025-11-06 23:50:46.303
1014	769	3	2025-05-26	2025-10-10	2025-11-06 23:50:46.303
1015	391	2	2025-10-05	2025-10-05	2025-11-06 23:50:46.303
1016	699	4	2025-08-17	2026-06-20	2025-11-06 23:50:46.303
1017	26	3	2025-08-01	2026-04-18	2025-11-06 23:50:46.303
1018	465	2	2025-06-08	2025-06-27	2025-11-06 23:50:46.303
1019	412	3	2025-10-21	2025-10-26	2025-11-06 23:50:46.303
1020	437	4	2024-09-22	2025-04-30	2025-11-06 23:50:46.303
1021	520	4	2025-07-30	2025-08-03	2025-11-06 23:50:46.303
1022	833	4	2025-09-17	2026-01-29	2025-11-06 23:50:46.303
1023	408	4	2024-06-25	2025-08-30	2025-11-06 23:50:46.303
1024	44	2	2024-08-31	2025-03-01	2025-11-06 23:50:46.303
1025	532	2	2025-10-09	2026-05-24	2025-11-06 23:50:46.303
1026	863	2	2025-07-10	2025-06-24	2025-11-06 23:50:46.303
1027	59	1	2025-11-17	2026-01-30	2025-11-06 23:50:46.303
1028	243	4	2025-03-15	2025-09-09	2025-11-06 23:50:46.303
1029	109	1	2026-04-14	2027-02-24	2025-11-06 23:50:46.303
1030	213	2	2026-05-07	2027-01-30	2025-11-06 23:50:46.303
1031	15	1	2025-06-07	2025-11-25	2025-11-06 23:50:46.303
1032	690	1	2025-04-22	2025-04-15	2025-11-06 23:50:46.303
1033	744	2	2025-07-03	2025-10-20	2025-11-06 23:50:46.303
1034	925	1	2025-09-09	2026-09-19	2025-11-06 23:50:46.303
1035	782	3	2025-05-07	2026-08-04	2025-11-06 23:50:46.303
1036	932	1	2026-11-02	2027-09-13	2025-11-06 23:50:46.303
1037	559	3	2026-02-02	2026-11-22	2025-11-06 23:50:46.303
1038	234	2	2026-03-18	2026-09-30	2025-11-06 23:50:46.303
1039	909	4	2026-06-06	2027-05-04	2025-11-06 23:50:46.303
1040	613	1	2025-07-31	2025-12-28	2025-11-06 23:50:46.303
1041	932	3	2025-09-05	2025-08-27	2025-11-06 23:50:46.303
1042	276	2	2026-01-03	2026-05-27	2025-11-06 23:50:46.303
1043	45	1	2025-07-02	2026-07-22	2025-11-06 23:50:46.303
1044	77	3	2024-12-05	2025-06-18	2025-11-06 23:50:46.303
1045	97	2	2026-06-07	2027-02-09	2025-11-06 23:50:46.303
1046	350	2	2025-07-21	2026-05-24	2025-11-06 23:50:46.303
1047	737	3	2025-11-24	2026-09-18	2025-11-06 23:50:46.303
1048	180	2	2024-07-23	2025-10-05	2025-11-06 23:50:46.303
1049	713	4	2025-02-23	2026-06-06	2025-11-06 23:50:46.303
1050	620	1	2025-08-27	2025-10-20	2025-11-06 23:50:46.303
1051	285	2	2025-08-27	2025-09-06	2025-11-06 23:50:46.303
1052	502	3	2026-09-12	2026-10-10	2025-11-06 23:50:46.303
1053	863	2	2025-08-31	2026-03-07	2025-11-06 23:50:46.303
1054	138	1	2025-09-09	2026-08-05	2025-11-06 23:50:46.303
1055	358	3	2025-08-21	2026-07-19	2025-11-06 23:50:46.303
1056	411	3	2025-06-29	2025-05-18	2025-11-06 23:50:46.303
1057	737	3	2025-09-05	2026-11-02	2025-11-06 23:50:46.303
1058	462	3	2026-07-21	2027-02-19	2025-11-06 23:50:46.303
1059	706	4	2025-03-09	2025-10-25	2025-11-06 23:50:46.303
1060	156	1	2025-11-03	2026-10-12	2025-11-06 23:50:46.303
1061	983	3	2025-01-16	2025-07-27	2025-11-06 23:50:46.303
1062	176	1	2026-04-14	2026-05-06	2025-11-06 23:50:46.303
1063	952	1	2026-03-03	2026-08-04	2025-11-06 23:50:46.303
1064	226	4	2025-02-08	2025-06-30	2025-11-06 23:50:46.303
1065	926	3	2025-01-06	2026-04-23	2025-11-06 23:50:46.303
1066	661	4	2025-10-17	2026-04-19	2025-11-06 23:50:46.303
1067	599	4	2026-06-05	2026-11-15	2025-11-06 23:50:46.303
1068	160	2	2025-11-09	2026-02-06	2025-11-06 23:50:46.303
1069	305	3	2024-12-14	2025-09-07	2025-11-06 23:50:46.303
1070	483	3	2025-06-28	2026-06-06	2025-11-06 23:50:46.303
1071	512	1	2025-04-04	2025-08-17	2025-11-06 23:50:46.303
1072	725	1	2025-10-12	2025-12-19	2025-11-06 23:50:46.303
1073	990	4	2025-11-01	2026-02-27	2025-11-06 23:50:46.303
1074	391	1	2026-05-26	2026-07-18	2025-11-06 23:50:46.303
1075	216	4	2026-04-30	2027-02-11	2025-11-06 23:50:46.303
1076	918	4	2025-05-27	2026-02-25	2025-11-06 23:50:46.303
1077	592	4	2025-11-04	2025-11-05	2025-11-06 23:50:46.303
1078	786	4	2025-03-09	2025-06-23	2025-11-06 23:50:46.303
1079	456	3	2025-09-05	2025-10-12	2025-11-06 23:50:46.303
1080	28	1	2025-03-18	2026-04-29	2025-11-06 23:50:46.303
1081	736	2	2025-02-09	2025-03-07	2025-11-06 23:50:46.303
1082	819	1	2025-08-19	2025-09-14	2025-11-06 23:50:46.303
1083	975	3	2025-07-20	2025-09-13	2025-11-06 23:50:46.303
1084	224	2	2026-09-05	2027-04-10	2025-11-06 23:50:46.303
1085	915	4	2025-11-02	2026-10-27	2025-11-06 23:50:46.303
1086	138	2	2026-06-06	2026-12-07	2025-11-06 23:50:46.303
1087	355	4	2025-05-15	2025-12-30	2025-11-06 23:50:46.303
1088	877	2	2025-10-20	2026-05-20	2025-11-06 23:50:46.303
1089	347	1	2026-01-07	2026-06-25	2025-11-06 23:50:46.303
1090	359	2	2026-06-22	2026-11-23	2025-11-06 23:50:46.303
1091	407	4	2025-07-15	2025-10-16	2025-11-06 23:50:46.303
1092	424	2	2024-09-24	2025-11-04	2025-11-06 23:50:46.303
1093	596	4	2025-03-12	2025-08-18	2025-11-06 23:50:46.303
1094	50	1	2026-02-13	2027-02-12	2025-11-06 23:50:46.303
1095	29	2	2025-08-14	2025-05-21	2025-11-06 23:50:46.303
1096	36	4	2025-09-10	2026-08-14	2025-11-06 23:50:46.303
1097	390	1	2026-06-11	2026-12-25	2025-11-06 23:50:46.303
1098	26	2	2025-09-18	2025-09-23	2025-11-06 23:50:46.303
1099	7	2	2025-03-05	2026-04-05	2025-11-06 23:50:46.303
1100	926	4	2026-10-25	2026-12-29	2025-11-06 23:50:46.303
1101	436	3	2026-07-11	2027-06-25	2025-11-06 23:50:46.303
1102	611	4	2025-01-18	2025-10-16	2025-11-06 23:50:46.303
1103	271	1	2024-11-30	2024-12-07	2025-11-06 23:50:46.303
1104	489	3	2026-01-17	2026-03-14	2025-11-06 23:50:46.303
1105	875	2	2024-12-21	2026-08-19	2025-11-06 23:50:46.303
1106	404	3	2024-05-10	2025-09-29	2025-11-06 23:50:46.303
1107	279	1	2026-06-22	2026-11-12	2025-11-06 23:50:46.303
1108	740	4	2025-09-15	2025-12-15	2025-11-06 23:50:46.303
1109	34	3	2026-05-28	2027-05-13	2025-11-06 23:50:46.303
1110	727	1	2025-07-04	2025-07-17	2025-11-06 23:50:46.303
1111	920	3	2026-02-17	2026-09-18	2025-11-06 23:50:46.303
1112	36	3	2024-08-20	2025-09-13	2025-11-06 23:50:46.303
1113	922	3	2025-05-18	2025-03-26	2025-11-06 23:50:46.303
1114	738	3	2025-04-12	2025-04-08	2025-11-06 23:50:46.303
1115	928	2	2025-09-29	2025-07-24	2025-11-06 23:50:46.303
1116	249	1	2025-01-20	2025-09-04	2025-11-06 23:50:46.303
1117	813	3	2026-07-10	2027-01-31	2025-11-06 23:50:46.303
1118	943	2	2026-03-26	2027-02-24	2025-11-06 23:50:46.303
1119	747	2	2026-05-12	2027-01-04	2025-11-06 23:50:46.303
1120	158	4	2025-10-02	2026-01-06	2025-11-06 23:50:46.303
1121	504	3	2025-10-28	2026-03-25	2025-11-06 23:50:46.303
1122	593	2	2026-10-30	2027-03-13	2025-11-06 23:50:46.303
1123	548	4	2026-03-02	2026-07-15	2025-11-06 23:50:46.303
1124	981	3	2025-09-24	2026-10-27	2025-11-06 23:50:46.303
1125	636	1	2026-06-10	2027-05-04	2025-11-06 23:50:46.303
1126	160	1	2026-08-26	2027-01-25	2025-11-06 23:50:46.303
1127	491	2	2025-10-24	2026-10-24	2025-11-06 23:50:46.303
1128	662	4	2025-04-17	2025-06-19	2025-11-06 23:50:46.303
1129	90	4	2026-10-18	2027-09-01	2025-11-06 23:50:46.303
1130	403	4	2025-08-25	2025-08-27	2025-11-06 23:50:46.303
1131	494	3	2025-12-23	2026-05-22	2025-11-06 23:50:46.303
1132	644	2	2025-04-05	2026-09-15	2025-11-06 23:50:46.303
1133	350	2	2025-11-29	2026-02-13	2025-11-06 23:50:46.303
1134	490	3	2025-03-01	2025-09-06	2025-11-06 23:50:46.303
1135	534	1	2024-08-06	2025-09-20	2025-11-06 23:50:46.303
1136	109	4	2025-09-02	2025-10-18	2025-11-06 23:50:46.303
1137	820	2	2025-07-01	2025-12-27	2025-11-06 23:50:46.303
1138	484	3	2025-10-13	2026-02-01	2025-11-06 23:50:46.303
1139	844	1	2025-10-02	2025-09-14	2025-11-06 23:50:46.303
1140	136	4	2026-09-21	2027-03-24	2025-11-06 23:50:46.303
1141	693	2	2025-10-24	2026-01-28	2025-11-06 23:50:46.303
1142	712	3	2025-10-16	2026-05-22	2025-11-06 23:50:46.303
1143	103	3	2025-12-23	2026-11-13	2025-11-06 23:50:46.303
1144	519	2	2024-10-11	2025-03-14	2025-11-06 23:50:46.303
1145	411	3	2025-09-17	2025-09-17	2025-11-06 23:50:46.303
1146	843	2	2024-09-18	2025-07-01	2025-11-06 23:50:46.303
1147	808	2	2025-04-01	2025-03-18	2025-11-06 23:50:46.303
1148	45	3	2026-07-19	2026-08-08	2025-11-06 23:50:46.303
1149	7	3	2024-07-01	2025-04-17	2025-11-06 23:50:46.303
1150	746	2	2025-01-21	2025-10-07	2025-11-06 23:50:46.303
1151	933	1	2026-09-11	2027-04-19	2025-11-06 23:50:46.303
1152	315	2	2025-09-04	2026-07-10	2025-11-06 23:50:46.303
1153	851	1	2026-04-15	2027-01-07	2025-11-06 23:50:46.303
1154	719	2	2025-05-09	2025-11-01	2025-11-06 23:50:46.303
1155	959	2	2025-09-09	2025-11-02	2025-11-06 23:50:46.304
1156	252	3	2026-06-01	2027-03-30	2025-11-06 23:50:46.304
1157	939	1	2025-03-21	2026-08-28	2025-11-06 23:50:46.304
1158	233	4	2025-07-13	2025-09-23	2025-11-06 23:50:46.304
1159	923	2	2025-08-01	2025-08-02	2025-11-06 23:50:46.304
1160	725	2	2026-04-03	2026-07-14	2025-11-06 23:50:46.304
1161	10	2	2024-09-13	2025-05-13	2025-11-06 23:50:46.304
1162	41	4	2025-07-14	2025-07-03	2025-11-06 23:50:46.304
1163	560	3	2025-09-03	2026-03-26	2025-11-06 23:50:46.304
1164	898	4	2025-06-21	2025-08-25	2025-11-06 23:50:46.304
1165	918	2	2026-06-19	2027-03-09	2025-11-06 23:50:46.304
1166	367	1	2024-08-24	2025-08-30	2025-11-06 23:50:46.304
1167	883	3	2025-10-12	2026-04-06	2025-11-06 23:50:46.304
1168	590	4	2025-07-29	2025-09-10	2025-11-06 23:50:46.304
1169	162	2	2026-08-25	2027-06-06	2025-11-06 23:50:46.304
1170	717	4	2026-05-15	2027-03-05	2025-11-06 23:50:46.304
1171	986	3	2026-04-08	2026-10-22	2025-11-06 23:50:46.304
1172	676	4	2025-03-22	2025-06-30	2025-11-06 23:50:46.304
1173	232	3	2026-02-22	2027-02-21	2025-11-06 23:50:46.304
1174	114	3	2025-04-23	2026-10-27	2025-11-06 23:50:46.304
1175	515	4	2026-04-26	2027-04-22	2025-11-06 23:50:46.304
1176	433	4	2025-10-10	2026-05-20	2025-11-06 23:50:46.304
1177	38	1	2025-04-02	2025-11-13	2025-11-06 23:50:46.304
1178	621	3	2024-11-14	2025-04-20	2025-11-06 23:50:46.304
1179	665	1	2025-09-26	2025-11-16	2025-11-06 23:50:46.304
1180	363	1	2025-01-12	2025-02-19	2025-11-06 23:50:46.304
1181	716	4	2025-09-17	2026-04-28	2025-11-06 23:50:46.304
1182	811	1	2025-05-22	2025-11-29	2025-11-06 23:50:46.304
1183	98	2	2026-05-22	2026-05-30	2025-11-06 23:50:46.304
1184	872	4	2025-08-22	2026-04-02	2025-11-06 23:50:46.304
1185	869	3	2026-08-15	2027-02-22	2025-11-06 23:50:46.304
1186	173	3	2025-12-11	2026-07-27	2025-11-06 23:50:46.304
1187	768	4	2026-06-08	2026-09-19	2025-11-06 23:50:46.304
1188	424	1	2025-09-06	2026-02-03	2025-11-06 23:50:46.304
1189	207	3	2026-05-01	2026-09-28	2025-11-06 23:50:46.304
1190	883	1	2024-11-06	2025-05-16	2025-11-06 23:50:46.304
1191	907	1	2025-04-01	2026-08-29	2025-11-06 23:50:46.304
1192	554	1	2026-05-12	2026-07-19	2025-11-06 23:50:46.304
1193	814	3	2025-07-31	2026-08-26	2025-11-06 23:50:46.304
1194	525	4	2025-09-11	2026-01-28	2025-11-06 23:50:46.304
1195	917	2	2026-04-20	2026-10-15	2025-11-06 23:50:46.304
1196	571	1	2026-02-13	2026-04-16	2025-11-06 23:50:46.304
1197	933	4	2025-10-08	2026-03-15	2025-11-06 23:50:46.304
1198	506	3	2026-02-09	2026-09-12	2025-11-06 23:50:46.304
1199	279	1	2024-06-18	2025-08-08	2025-11-06 23:50:46.304
1200	470	2	2026-01-19	2026-12-19	2025-11-06 23:50:46.304
1201	766	3	2025-08-21	2025-10-24	2025-11-06 23:50:46.304
1202	814	1	2025-04-19	2025-05-07	2025-11-06 23:50:46.304
1203	135	3	2025-12-11	2026-01-19	2025-11-06 23:50:46.304
1204	202	2	2025-08-01	2025-10-17	2025-11-06 23:50:46.304
1205	254	1	2026-04-24	2026-11-10	2025-11-06 23:50:46.304
1206	502	4	2026-02-20	2026-07-11	2025-11-06 23:50:46.304
1207	345	2	2026-10-12	2027-07-23	2025-11-06 23:50:46.304
1208	151	4	2025-03-27	2025-04-04	2025-11-06 23:50:46.304
1209	328	1	2025-04-09	2025-04-09	2025-11-06 23:50:46.304
1210	821	4	2025-07-24	2025-04-15	2025-11-06 23:50:46.304
1211	221	3	2025-11-27	2026-08-05	2025-11-06 23:50:46.304
1212	996	4	2026-08-01	2026-12-26	2025-11-06 23:50:46.304
1213	812	4	2026-06-24	2026-10-15	2025-11-06 23:50:46.304
1214	522	4	2025-08-30	2026-01-24	2025-11-06 23:50:46.304
1215	174	2	2026-06-03	2026-08-08	2025-11-06 23:50:46.304
1216	166	2	2026-05-19	2026-12-03	2025-11-06 23:50:46.304
1217	62	2	2025-09-24	2026-03-05	2025-11-06 23:50:46.304
1218	147	2	2025-08-13	2026-09-28	2025-11-06 23:50:46.304
1219	550	4	2026-04-02	2026-04-04	2025-11-06 23:50:46.304
1220	88	2	2025-10-03	2026-01-10	2025-11-06 23:50:46.304
1221	631	2	2025-10-01	2026-01-07	2025-11-06 23:50:46.304
1222	57	4	2025-04-22	2026-07-03	2025-11-06 23:50:46.304
1223	578	3	2026-06-04	2026-12-21	2025-11-06 23:50:46.304
1224	695	3	2026-06-18	2027-02-06	2025-11-06 23:50:46.304
1225	327	2	2025-01-30	2026-05-04	2025-11-06 23:50:46.304
1226	497	4	2025-09-23	2026-02-23	2025-11-06 23:50:46.304
1227	486	2	2026-07-18	2026-09-14	2025-11-06 23:50:46.304
1228	372	2	2025-12-17	2026-03-15	2025-11-06 23:50:46.304
1229	610	1	2025-11-28	2026-07-08	2025-11-06 23:50:46.304
1230	378	2	2025-07-05	2026-04-03	2025-11-06 23:50:46.304
1231	875	2	2026-06-02	2026-06-07	2025-11-06 23:50:46.304
1232	729	3	2024-12-10	2025-06-27	2025-11-06 23:50:46.304
1233	359	1	2026-03-05	2026-07-08	2025-11-06 23:50:46.304
1234	408	1	2025-06-07	2026-02-26	2025-11-06 23:50:46.304
1235	426	3	2025-07-22	2025-10-12	2025-11-06 23:50:46.304
1236	262	4	2025-11-04	2026-01-09	2025-11-06 23:50:46.304
1237	418	1	2024-12-20	2025-01-05	2025-11-06 23:50:46.304
1238	715	1	2026-08-29	2026-12-20	2025-11-06 23:50:46.304
1239	178	3	2025-05-19	2026-03-07	2025-11-06 23:50:46.304
1240	820	4	2026-08-07	2026-10-08	2025-11-06 23:50:46.304
1241	736	4	2025-07-06	2025-09-20	2025-11-06 23:50:46.304
1242	119	1	2026-09-25	2027-01-02	2025-11-06 23:50:46.304
1243	556	4	2025-06-23	2025-08-18	2025-11-06 23:50:46.304
1244	35	3	2025-06-01	2025-11-30	2025-11-06 23:50:46.304
1245	191	1	2024-07-20	2025-10-21	2025-11-06 23:50:46.304
1246	761	4	2025-09-16	2025-12-14	2025-11-06 23:50:46.304
1247	927	2	2025-12-18	2026-05-11	2025-11-06 23:50:46.304
1248	509	3	2025-11-04	2026-09-06	2025-11-06 23:50:46.304
1249	506	2	2025-04-26	2026-09-26	2025-11-06 23:50:46.304
1250	590	1	2024-11-27	2025-02-05	2025-11-06 23:50:46.304
1251	627	4	2026-05-31	2026-06-27	2025-11-06 23:50:46.304
1252	87	1	2026-07-14	2027-04-21	2025-11-06 23:50:46.304
1253	332	2	2025-06-26	2025-10-29	2025-11-06 23:50:46.304
1254	289	1	2025-05-04	2025-05-05	2025-11-06 23:50:46.304
1255	172	3	2026-01-31	2026-04-10	2025-11-06 23:50:46.304
1256	103	3	2026-08-08	2027-05-23	2025-11-06 23:50:46.304
1257	782	2	2026-01-06	2026-01-20	2025-11-06 23:50:46.304
1258	817	1	2024-12-31	2025-10-07	2025-11-06 23:50:46.304
1259	747	3	2025-12-15	2026-08-12	2025-11-06 23:50:46.304
1260	906	2	2026-06-16	2026-07-22	2025-11-06 23:50:46.304
1261	715	4	2025-08-20	2026-07-21	2025-11-06 23:50:46.304
1262	493	1	2025-12-06	2026-11-12	2025-11-06 23:50:46.304
1263	455	3	2026-02-19	2026-10-13	2025-11-06 23:50:46.304
1264	795	1	2026-07-05	2027-06-20	2025-11-06 23:50:46.304
1265	165	1	2026-08-07	2026-09-16	2025-11-06 23:50:46.304
1266	800	2	2025-04-23	2025-06-07	2025-11-06 23:50:46.304
1267	652	1	2026-10-13	2026-12-28	2025-11-06 23:50:46.304
1268	521	4	2026-05-01	2027-01-06	2025-11-06 23:50:46.304
1269	46	3	2025-04-13	2026-02-24	2025-11-06 23:50:46.304
1270	372	3	2025-06-19	2025-11-21	2025-11-06 23:50:46.304
1271	393	2	2026-01-31	2026-12-20	2025-11-06 23:50:46.304
1272	877	3	2024-06-04	2025-06-23	2025-11-06 23:50:46.304
1273	882	1	2025-06-13	2025-04-17	2025-11-06 23:50:46.304
1274	369	1	2025-07-07	2025-08-11	2025-11-06 23:50:46.304
1275	372	4	2026-03-07	2026-08-18	2025-11-06 23:50:46.304
1276	511	3	2024-12-27	2025-01-14	2025-11-06 23:50:46.304
1277	850	1	2025-08-30	2026-08-13	2025-11-06 23:50:46.304
1278	213	2	2025-04-06	2026-07-21	2025-11-06 23:50:46.304
1279	756	2	2025-06-27	2025-10-07	2025-11-06 23:50:46.304
1280	722	3	2025-11-03	2026-05-03	2025-11-06 23:50:46.304
1281	634	1	2024-12-28	2025-10-18	2025-11-06 23:50:46.304
1282	544	2	2025-04-12	2025-10-14	2025-11-06 23:50:46.304
1283	64	1	2025-09-02	2025-10-02	2025-11-06 23:50:46.304
1284	322	4	2025-06-09	2025-06-30	2025-11-06 23:50:46.304
1285	781	4	2026-03-15	2026-10-02	2025-11-06 23:50:46.304
1286	49	4	2025-10-29	2026-02-24	2025-11-06 23:50:46.304
1287	836	1	2026-03-22	2026-04-13	2025-11-06 23:50:46.304
1288	157	1	2026-11-01	2027-01-13	2025-11-06 23:50:46.304
1289	125	2	2025-08-30	2025-09-06	2025-11-06 23:50:46.304
1290	349	3	2025-06-01	2025-06-02	2025-11-06 23:50:46.304
1291	265	2	2024-10-15	2025-07-23	2025-11-06 23:50:46.304
1292	453	3	2025-11-06	2025-12-26	2025-11-06 23:50:46.304
1293	169	3	2026-06-10	2027-05-26	2025-11-06 23:50:46.304
1294	251	4	2024-11-15	2025-10-22	2025-11-06 23:50:46.304
1295	454	2	2025-11-28	2026-03-09	2025-11-06 23:50:46.304
1296	259	1	2026-08-10	2027-01-05	2025-11-06 23:50:46.304
1297	309	2	2025-08-28	2026-02-13	2025-11-06 23:50:46.304
1298	597	2	2025-06-26	2025-10-25	2025-11-06 23:50:46.304
1299	898	4	2026-07-05	2027-06-05	2025-11-06 23:50:46.304
1300	406	4	2026-07-01	2027-05-10	2025-11-06 23:50:46.304
1301	187	2	2025-08-31	2026-03-04	2025-11-06 23:50:46.304
1302	872	4	2025-07-22	2025-10-15	2025-11-06 23:50:46.304
1303	308	1	2025-10-14	2025-11-06	2025-11-06 23:50:46.304
1304	197	3	2025-08-01	2025-07-16	2025-11-06 23:50:46.304
1305	221	4	2025-08-05	2025-09-06	2025-11-06 23:50:46.304
1306	236	3	2026-03-19	2026-08-05	2025-11-06 23:50:46.304
1307	479	2	2026-02-16	2026-04-04	2025-11-06 23:50:46.304
1308	170	3	2025-10-11	2025-12-12	2025-11-06 23:50:46.304
1309	715	4	2024-02-12	2025-10-22	2025-11-06 23:50:46.304
1310	415	2	2026-11-01	2027-01-27	2025-11-06 23:50:46.304
1311	286	4	2026-01-20	2026-11-08	2025-11-06 23:50:46.304
1312	79	1	2026-11-05	2027-06-04	2025-11-06 23:50:46.304
1313	308	1	2026-09-25	2026-12-25	2025-11-06 23:50:46.304
1314	12	3	2026-03-27	2026-07-21	2025-11-06 23:50:46.304
1315	903	1	2025-06-09	2025-10-23	2025-11-06 23:50:46.304
1316	465	1	2025-09-26	2025-12-08	2025-11-06 23:50:46.304
1317	591	4	2025-10-22	2026-04-24	2025-11-06 23:50:46.304
1318	102	3	2024-10-06	2025-07-01	2025-11-06 23:50:46.304
1319	628	4	2025-12-16	2026-09-06	2025-11-06 23:50:46.304
1320	218	2	2025-09-20	2025-08-21	2025-11-06 23:50:46.304
1321	375	3	2026-05-28	2026-08-07	2025-11-06 23:50:46.304
1322	354	3	2025-07-28	2026-04-01	2025-11-06 23:50:46.304
1323	675	4	2026-05-25	2026-12-21	2025-11-06 23:50:46.304
1324	447	3	2025-07-01	2025-07-14	2025-11-06 23:50:46.304
1325	913	2	2025-09-05	2026-03-09	2025-11-06 23:50:46.304
1326	778	3	2025-04-18	2025-12-04	2025-11-06 23:50:46.304
1327	780	4	2026-08-02	2027-05-02	2025-11-06 23:50:46.304
1328	661	1	2025-08-13	2025-10-23	2025-11-06 23:50:46.304
1329	763	4	2025-07-15	2025-11-04	2025-11-06 23:50:46.304
1330	601	1	2026-10-23	2027-08-01	2025-11-06 23:50:46.304
1331	220	2	2025-10-18	2026-05-28	2025-11-06 23:50:46.304
1332	885	2	2025-10-03	2025-09-28	2025-11-06 23:50:46.304
1333	202	4	2026-08-03	2027-04-21	2025-11-06 23:50:46.304
1334	439	2	2026-04-26	2026-04-28	2025-11-06 23:50:46.304
1335	865	1	2026-06-16	2026-09-01	2025-11-06 23:50:46.304
1336	296	1	2025-10-25	2025-12-13	2025-11-06 23:50:46.304
1337	917	4	2026-04-16	2026-05-09	2025-11-06 23:50:46.304
1338	689	2	2026-01-15	2026-12-17	2025-11-06 23:50:46.304
1339	43	1	2026-03-04	2026-05-03	2025-11-06 23:50:46.304
1340	46	4	2025-04-29	2025-07-07	2025-11-06 23:50:46.304
1341	679	2	2026-02-26	2026-08-27	2025-11-06 23:50:46.304
1342	596	4	2026-02-23	2026-05-10	2025-11-06 23:50:46.304
1343	918	1	2025-08-21	2025-11-03	2025-11-06 23:50:46.304
1344	393	1	2025-08-14	2026-05-06	2025-11-06 23:50:46.304
1345	213	4	2025-05-17	2025-05-15	2025-11-06 23:50:46.304
1346	443	1	2025-02-19	2026-04-17	2025-11-06 23:50:46.304
1347	545	1	2025-09-17	2025-09-19	2025-11-06 23:50:46.304
1348	50	4	2024-11-02	2025-08-17	2025-11-06 23:50:46.304
1349	56	3	2025-09-09	2025-10-23	2025-11-06 23:50:46.304
1350	493	3	2025-08-14	2026-02-27	2025-11-06 23:50:46.304
1351	168	1	2026-02-28	2026-10-05	2025-11-06 23:50:46.304
1352	30	4	2025-01-03	2025-04-30	2025-11-06 23:50:46.304
1353	678	1	2026-10-06	2027-04-14	2025-11-06 23:50:46.304
1354	54	4	2024-05-28	2025-04-17	2025-11-06 23:50:46.304
1355	564	1	2025-09-12	2025-09-15	2025-11-06 23:50:46.304
1356	43	4	2025-11-06	2026-03-02	2025-11-06 23:50:46.304
1357	480	2	2026-07-26	2026-09-28	2025-11-06 23:50:46.304
1358	586	1	2025-09-21	2025-10-29	2025-11-06 23:50:46.304
1359	560	4	2026-10-25	2027-05-25	2025-11-06 23:50:46.304
1360	516	3	2025-11-26	2025-12-24	2025-11-06 23:50:46.304
1361	27	4	2025-09-04	2025-07-21	2025-11-06 23:50:46.304
1362	587	1	2026-05-28	2027-02-08	2025-11-06 23:50:46.304
1363	223	3	2025-09-20	2025-10-13	2025-11-06 23:50:46.304
1364	709	1	2025-07-08	2026-10-16	2025-11-06 23:50:46.304
1365	183	3	2025-03-01	2025-11-03	2025-11-06 23:50:46.304
1366	753	4	2025-08-26	2025-10-30	2025-11-06 23:50:46.304
1367	120	3	2025-10-27	2025-10-31	2025-11-06 23:50:46.304
1368	990	2	2025-05-16	2025-04-18	2025-11-06 23:50:46.304
1369	350	2	2024-10-25	2025-09-23	2025-11-06 23:50:46.304
1370	173	2	2026-03-05	2026-07-10	2025-11-06 23:50:46.304
1371	703	4	2026-02-18	2026-10-20	2025-11-06 23:50:46.304
1372	836	4	2025-01-23	2025-08-16	2025-11-06 23:50:46.304
1373	435	1	2025-11-19	2026-03-06	2025-11-06 23:50:46.304
1374	643	4	2025-03-08	2025-02-12	2025-11-06 23:50:46.304
1375	247	1	2025-09-16	2026-07-14	2025-11-06 23:50:46.304
1376	612	4	2026-06-02	2026-12-06	2025-11-06 23:50:46.304
1377	607	4	2025-11-22	2026-05-28	2025-11-06 23:50:46.304
1378	113	1	2024-05-14	2025-10-31	2025-11-06 23:50:46.304
1379	2	4	2025-03-30	2026-03-27	2025-11-06 23:50:46.304
1380	214	1	2026-02-26	2026-03-29	2025-11-06 23:50:46.304
1381	444	4	2026-03-14	2026-07-30	2025-11-06 23:50:46.304
1382	331	4	2026-05-27	2026-09-11	2025-11-06 23:50:46.304
1383	304	4	2026-04-07	2027-03-26	2025-11-06 23:50:46.304
1384	825	2	2025-02-08	2025-06-24	2025-11-06 23:50:46.304
1385	747	3	2026-08-24	2027-08-21	2025-11-06 23:50:46.304
1386	812	4	2025-05-03	2025-10-04	2025-11-06 23:50:46.304
1387	558	4	2024-11-10	2025-09-09	2025-11-06 23:50:46.304
1388	104	2	2025-04-07	2026-01-26	2025-11-06 23:50:46.304
1389	658	2	2025-08-03	2025-11-04	2025-11-06 23:50:46.304
1390	35	4	2026-09-15	2026-10-21	2025-11-06 23:50:46.304
1391	38	1	2024-12-05	2025-06-09	2025-11-06 23:50:46.304
1392	884	3	2025-09-11	2025-06-26	2025-11-06 23:50:46.304
1393	642	2	2026-08-18	2026-12-28	2025-11-06 23:50:46.304
1394	382	3	2026-09-08	2026-09-18	2025-11-06 23:50:46.304
1395	216	4	2025-10-05	2026-01-18	2025-11-06 23:50:46.304
1396	10	3	2026-07-19	2026-10-17	2025-11-06 23:50:46.304
1397	565	1	2025-10-19	2026-06-26	2025-11-06 23:50:46.304
1398	723	3	2026-10-13	2027-05-25	2025-11-06 23:50:46.304
1399	373	3	2025-04-10	2025-12-05	2025-11-06 23:50:46.304
1400	217	4	2025-09-20	2026-05-03	2025-11-06 23:50:46.304
1401	158	4	2024-09-15	2025-04-03	2025-11-06 23:50:46.304
1402	680	4	2025-07-23	2025-10-26	2025-11-06 23:50:46.304
1403	726	4	2026-02-25	2026-07-26	2025-11-06 23:50:46.304
1404	132	1	2025-05-14	2025-11-03	2025-11-06 23:50:46.304
1405	867	3	2026-07-31	2027-06-14	2025-11-06 23:50:46.304
1406	698	4	2026-02-21	2026-08-24	2025-11-06 23:50:46.304
1407	63	1	2024-10-16	2025-08-28	2025-11-06 23:50:46.304
1408	645	3	2025-10-01	2025-11-05	2025-11-06 23:50:46.304
1409	87	2	2026-03-21	2027-01-26	2025-11-06 23:50:46.304
1410	617	3	2025-11-04	2026-05-05	2025-11-06 23:50:46.304
1411	551	2	2026-02-11	2026-12-03	2025-11-06 23:50:46.304
1412	106	4	2026-03-05	2026-04-06	2025-11-06 23:50:46.304
1413	172	2	2025-05-02	2025-10-21	2025-11-06 23:50:46.304
1414	635	2	2025-07-01	2025-12-01	2025-11-06 23:50:46.304
1415	842	4	2025-04-29	2025-09-20	2025-11-06 23:50:46.304
1416	926	2	2025-08-13	2025-11-05	2025-11-06 23:50:46.304
1417	326	1	2026-09-04	2026-10-13	2025-11-06 23:50:46.304
1418	539	1	2025-02-26	2025-08-04	2025-11-06 23:50:46.304
1419	623	4	2026-07-15	2027-01-19	2025-11-06 23:50:46.304
1420	204	1	2025-07-05	2025-06-11	2025-11-06 23:50:46.304
1421	942	2	2026-03-31	2026-10-25	2025-11-06 23:50:46.304
1422	568	2	2026-05-13	2026-12-28	2025-11-06 23:50:46.304
1423	869	2	2025-10-19	2026-06-20	2025-11-06 23:50:46.304
1424	672	4	2025-07-31	2025-09-09	2025-11-06 23:50:46.304
1425	344	1	2026-10-24	2027-06-20	2025-11-06 23:50:46.304
1426	386	1	2025-11-05	2026-01-20	2025-11-06 23:50:46.304
1427	734	3	2026-04-15	2027-01-10	2025-11-06 23:50:46.304
1428	47	2	2026-10-07	2026-11-20	2025-11-06 23:50:46.304
1429	587	2	2025-03-05	2025-09-07	2025-11-06 23:50:46.304
1430	659	2	2024-08-20	2025-06-02	2025-11-06 23:50:46.304
1431	152	3	2025-10-08	2026-04-23	2025-11-06 23:50:46.304
1432	912	4	2025-01-09	2025-04-30	2025-11-06 23:50:46.304
1433	611	3	2025-09-24	2025-11-05	2025-11-06 23:50:46.304
1434	91	4	2024-10-15	2025-10-26	2025-11-06 23:50:46.304
1435	290	2	2025-10-20	2026-03-03	2025-11-06 23:50:46.304
1436	511	3	2026-08-18	2027-08-17	2025-11-06 23:50:46.304
1437	231	4	2025-06-26	2025-06-04	2025-11-06 23:50:46.304
1438	996	3	2026-06-01	2027-04-23	2025-11-06 23:50:46.304
1439	260	1	2026-09-01	2027-01-17	2025-11-06 23:50:46.304
1440	855	2	2024-12-22	2025-09-01	2025-11-06 23:50:46.304
1441	169	3	2025-09-30	2026-07-08	2025-11-06 23:50:46.304
1442	720	1	2025-07-22	2026-01-08	2025-11-06 23:50:46.304
1443	565	4	2025-11-18	2026-06-10	2025-11-06 23:50:46.304
1444	181	3	2025-09-15	2025-12-06	2025-11-06 23:50:46.304
1445	263	3	2025-06-12	2025-06-07	2025-11-06 23:50:46.304
1446	412	1	2024-11-29	2025-07-19	2025-11-06 23:50:46.304
1447	222	1	2026-07-17	2026-11-12	2025-11-06 23:50:46.304
1448	769	4	2025-09-18	2026-09-03	2025-11-06 23:50:46.304
1449	798	4	2026-02-22	2026-06-05	2025-11-06 23:50:46.304
1450	758	2	2024-07-06	2025-11-04	2025-11-06 23:50:46.304
1451	684	3	2025-04-26	2025-10-23	2025-11-06 23:50:46.304
1452	615	2	2026-09-22	2027-04-12	2025-11-06 23:50:46.304
1453	145	1	2026-04-07	2026-09-04	2025-11-06 23:50:46.304
1454	405	1	2025-10-15	2026-10-31	2025-11-06 23:50:46.304
1455	876	3	2025-08-24	2025-09-08	2025-11-06 23:50:46.304
1456	270	1	2025-09-17	2026-03-07	2025-11-06 23:50:46.304
1457	456	4	2025-04-27	2026-01-03	2025-11-06 23:50:46.304
1458	965	3	2026-06-05	2027-03-04	2025-11-06 23:50:46.304
1459	834	3	2026-08-23	2026-09-30	2025-11-06 23:50:46.304
1460	274	1	2024-12-27	2025-03-17	2025-11-06 23:50:46.304
1461	500	4	2025-09-17	2025-04-08	2025-11-06 23:50:46.304
1462	161	3	2026-05-20	2026-08-07	2025-11-06 23:50:46.304
1463	51	4	2025-05-09	2025-03-07	2025-11-06 23:50:46.304
1464	421	3	2025-08-07	2025-10-27	2025-11-06 23:50:46.304
1465	90	2	2025-08-05	2026-05-08	2025-11-06 23:50:46.304
1466	10	2	2025-08-06	2025-10-09	2025-11-06 23:50:46.304
1467	179	2	2025-11-03	2026-03-26	2025-11-06 23:50:46.304
1468	965	3	2025-12-18	2026-06-28	2025-11-06 23:50:46.305
1469	314	4	2026-01-30	2026-12-18	2025-11-06 23:50:46.305
1470	591	4	2026-04-27	2026-06-08	2025-11-06 23:50:46.305
1471	553	4	2025-10-30	2025-10-30	2025-11-06 23:50:46.305
1472	466	4	2025-06-25	2026-03-23	2025-11-06 23:50:46.305
1473	966	2	2026-10-20	2027-01-12	2025-11-06 23:50:46.305
1474	967	1	2025-12-25	2026-10-03	2025-11-06 23:50:46.305
1475	756	4	2025-04-09	2025-09-20	2025-11-06 23:50:46.305
1476	395	4	2025-06-12	2025-06-07	2025-11-06 23:50:46.305
1477	917	1	2026-10-05	2027-03-27	2025-11-06 23:50:46.305
1478	906	3	2025-11-02	2026-05-04	2025-11-06 23:50:46.305
1479	876	2	2025-04-13	2025-02-20	2025-11-06 23:50:46.305
1480	74	4	2025-10-26	2026-03-18	2025-11-06 23:50:46.305
1481	970	1	2026-09-24	2027-02-23	2025-11-06 23:50:46.305
1482	906	4	2026-07-28	2027-02-26	2025-11-06 23:50:46.305
1483	999	2	2026-04-07	2026-12-19	2025-11-06 23:50:46.305
1484	424	2	2025-08-28	2025-08-24	2025-11-06 23:50:46.305
1485	332	1	2025-09-17	2025-11-01	2025-11-06 23:50:46.305
1486	806	2	2025-08-13	2025-09-13	2025-11-06 23:50:46.305
1487	523	3	2025-08-01	2026-02-25	2025-11-06 23:50:46.305
1488	932	1	2025-11-06	2026-04-09	2025-11-06 23:50:46.305
1489	517	2	2025-06-18	2025-09-20	2025-11-06 23:50:46.305
1490	405	4	2025-03-31	2025-06-19	2025-11-06 23:50:46.305
1491	668	4	2024-12-05	2025-07-27	2025-11-06 23:50:46.305
1492	126	1	2025-07-12	2025-09-02	2025-11-06 23:50:46.305
1493	355	4	2025-10-08	2025-11-04	2025-11-06 23:50:46.305
1494	381	2	2026-06-25	2027-01-25	2025-11-06 23:50:46.305
1495	23	4	2025-05-21	2025-11-05	2025-11-06 23:50:46.305
1496	456	2	2026-07-24	2026-09-09	2025-11-06 23:50:46.305
1497	6	3	2025-12-13	2026-03-16	2025-11-06 23:50:46.305
1498	605	3	2026-09-17	2027-01-13	2025-11-06 23:50:46.305
1499	399	3	2026-09-12	2027-05-19	2025-11-06 23:50:46.305
1500	945	4	2025-09-10	2025-08-05	2025-11-06 23:50:46.305
1501	643	2	2024-06-25	2025-10-22	2025-11-06 23:50:46.305
1502	625	3	2025-07-11	2025-10-13	2025-11-06 23:50:46.305
1503	85	1	2026-05-09	2027-04-03	2025-11-06 23:50:46.305
1504	464	3	2025-03-28	2025-12-09	2025-11-06 23:50:46.305
1505	896	1	2026-05-03	2026-09-19	2025-11-06 23:50:46.305
1506	123	1	2025-10-22	2026-06-12	2025-11-06 23:50:46.305
1507	552	1	2025-08-12	2025-07-24	2025-11-06 23:50:46.305
1508	531	2	2025-05-09	2025-08-03	2025-11-06 23:50:46.305
1509	254	1	2026-03-23	2027-03-23	2025-11-06 23:50:46.305
1510	249	4	2024-12-22	2025-08-02	2025-11-06 23:50:46.305
1511	593	3	2026-02-14	2026-06-24	2025-11-06 23:50:46.305
1512	634	4	2025-08-07	2025-07-23	2025-11-06 23:50:46.305
1513	98	2	2026-10-05	2027-02-02	2025-11-06 23:50:46.305
1514	533	4	2025-04-15	2025-11-03	2025-11-06 23:50:46.305
1515	45	3	2026-03-31	2026-10-25	2025-11-06 23:50:46.305
1516	742	1	2026-04-20	2027-03-12	2025-11-06 23:50:46.305
1517	667	3	2025-09-13	2025-10-07	2025-11-06 23:50:46.305
1518	516	4	2025-04-18	2026-08-24	2025-11-06 23:50:46.305
1519	664	2	2025-05-21	2025-04-27	2025-11-06 23:50:46.305
1520	623	1	2026-09-06	2027-07-29	2025-11-06 23:50:46.305
1521	100	1	2025-09-23	2026-06-10	2025-11-06 23:50:46.305
1522	125	2	2026-10-25	2027-08-04	2025-11-06 23:50:46.305
1523	321	2	2026-06-11	2027-01-14	2025-11-06 23:50:46.305
1524	193	2	2025-10-28	2026-10-21	2025-11-06 23:50:46.305
1525	293	3	2025-01-13	2026-09-05	2025-11-06 23:50:46.305
1526	302	3	2026-04-18	2026-11-16	2025-11-06 23:50:46.305
1527	321	2	2026-08-24	2026-10-13	2025-11-06 23:50:46.305
1528	324	2	2025-01-27	2025-07-29	2025-11-06 23:50:46.305
1529	306	4	2026-08-06	2027-04-11	2025-11-06 23:50:46.305
1530	957	3	2025-05-28	2025-10-31	2025-11-06 23:50:46.305
1531	595	3	2026-10-30	2027-08-21	2025-11-06 23:50:46.305
1532	986	1	2025-08-16	2026-05-08	2025-11-06 23:50:46.305
1533	994	3	2026-03-07	2026-03-20	2025-11-06 23:50:46.305
1534	206	2	2024-01-23	2024-11-17	2025-11-06 23:50:46.305
1535	276	3	2026-01-02	2026-08-14	2025-11-06 23:50:46.305
1536	742	1	2025-02-12	2025-09-11	2025-11-06 23:50:46.305
1537	486	2	2025-03-07	2025-11-01	2025-11-06 23:50:46.305
1538	677	4	2025-05-04	2026-01-03	2025-11-06 23:50:46.305
1539	790	3	2024-10-12	2025-04-13	2025-11-06 23:50:46.305
1540	495	3	2026-03-31	2026-06-20	2025-11-06 23:50:46.305
1541	457	2	2024-04-22	2025-06-29	2025-11-06 23:50:46.305
1542	729	3	2025-09-29	2026-03-26	2025-11-06 23:50:46.305
1543	348	4	2025-04-28	2025-07-22	2025-11-06 23:50:46.305
1544	79	4	2026-09-15	2027-01-27	2025-11-06 23:50:46.305
1545	366	2	2026-08-08	2027-05-26	2025-11-06 23:50:46.305
1546	121	4	2026-08-01	2027-03-20	2025-11-06 23:50:46.305
1547	779	4	2026-04-11	2026-10-17	2025-11-06 23:50:46.305
1548	304	3	2026-06-21	2026-06-28	2025-11-06 23:50:46.305
1549	691	4	2025-11-06	2026-03-01	2025-11-06 23:50:46.305
1550	421	2	2025-08-16	2026-01-01	2025-11-06 23:50:46.305
1551	366	4	2026-01-07	2026-06-05	2025-11-06 23:50:46.305
1552	270	4	2025-05-01	2025-06-13	2025-11-06 23:50:46.305
1553	171	2	2025-10-06	2026-05-28	2025-11-06 23:50:46.305
1554	36	4	2025-03-03	2025-11-01	2025-11-06 23:50:46.305
1555	277	3	2025-09-03	2025-10-20	2025-11-06 23:50:46.305
1556	347	1	2025-08-08	2025-08-14	2025-11-06 23:50:46.305
1557	835	4	2025-10-09	2026-01-13	2025-11-06 23:50:46.305
1558	503	3	2025-11-03	2025-12-02	2025-11-06 23:50:46.305
1559	974	1	2025-02-23	2025-11-05	2025-11-06 23:50:46.305
1560	28	2	2024-01-19	2025-09-04	2025-11-06 23:50:46.305
1561	663	4	2025-03-20	2025-10-08	2025-11-06 23:50:46.305
1562	905	4	2026-10-07	2027-07-14	2025-11-06 23:50:46.305
1563	584	2	2025-06-25	2025-11-03	2025-11-06 23:50:46.305
1564	798	4	2026-06-06	2027-05-10	2025-11-06 23:50:46.305
1565	876	1	2026-09-18	2027-03-21	2025-11-06 23:50:46.305
1566	391	4	2025-04-13	2025-04-14	2025-11-06 23:50:46.305
1567	225	1	2025-06-30	2026-10-13	2025-11-06 23:50:46.305
1568	985	4	2025-10-25	2025-11-04	2025-11-06 23:50:46.305
1569	701	1	2025-04-11	2025-08-25	2025-11-06 23:50:46.305
1570	475	4	2026-08-05	2026-11-11	2025-11-06 23:50:46.305
1571	250	4	2026-04-25	2026-07-11	2025-11-06 23:50:46.305
1572	266	3	2025-09-16	2025-05-27	2025-11-06 23:50:46.305
1573	387	3	2025-06-24	2025-10-09	2025-11-06 23:50:46.305
1574	187	1	2026-04-14	2026-08-24	2025-11-06 23:50:46.305
1575	643	4	2025-09-25	2026-01-20	2025-11-06 23:50:46.305
1576	727	2	2026-01-26	2026-03-10	2025-11-06 23:50:46.305
1577	885	1	2026-06-19	2026-10-30	2025-11-06 23:50:46.305
1578	302	4	2026-07-16	2026-08-19	2025-11-06 23:50:46.305
1579	20	1	2026-08-27	2027-05-14	2025-11-06 23:50:46.305
1580	532	4	2026-04-20	2026-11-21	2025-11-06 23:50:46.305
1581	975	2	2026-09-05	2027-05-20	2025-11-06 23:50:46.305
1582	17	2	2026-02-07	2026-04-02	2025-11-06 23:50:46.305
1583	964	2	2026-05-19	2027-02-08	2025-11-06 23:50:46.305
1584	124	3	2025-09-17	2025-10-31	2025-11-06 23:50:46.305
1585	89	2	2025-08-08	2026-01-06	2025-11-06 23:50:46.305
1586	565	3	2025-04-27	2025-08-17	2025-11-06 23:50:46.305
1587	39	4	2025-09-24	2026-06-20	2025-11-06 23:50:46.305
1588	212	1	2026-05-30	2027-03-25	2025-11-06 23:50:46.305
1589	610	3	2025-03-12	2025-05-15	2025-11-06 23:50:46.305
1590	163	1	2026-01-22	2026-03-15	2025-11-06 23:50:46.305
1591	1000	3	2026-05-12	2026-07-08	2025-11-06 23:50:46.305
1592	387	3	2025-03-10	2026-09-20	2025-11-06 23:50:46.305
1593	337	3	2025-08-25	2025-09-29	2025-11-06 23:50:46.305
1594	251	2	2025-07-26	2026-08-16	2025-11-06 23:50:46.305
1595	743	3	2026-05-19	2026-11-28	2025-11-06 23:50:46.305
1596	445	1	2025-10-31	2026-02-11	2025-11-06 23:50:46.305
1597	127	4	2025-02-12	2025-04-04	2025-11-06 23:50:46.305
1598	844	4	2026-03-22	2027-02-04	2025-11-06 23:50:46.305
1599	934	1	2025-06-19	2025-09-02	2025-11-06 23:50:46.305
1600	612	1	2026-01-13	2026-04-29	2025-11-06 23:50:46.305
\.


--
-- TOC entry 3477 (class 0 OID 16414)
-- Dependencies: 225
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offers (id, name, price, days_valid, created_at) FROM stdin;
1	Miesięczny Standard	59.99	30	2020-01-01 08:00:00
2	Kwartalny Plus	159.99	90	2020-01-01 08:00:00
3	Roczny Premium	599.00	365	2020-01-01 08:00:00
4	Tygodniowy Basic	29.99	7	2020-01-01 08:00:00
\.


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 222
-- Name: entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.entries_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 224
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.memberships_id_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 226
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.offers_id_seq', 1, false);


--
-- TOC entry 3310 (class 2606 OID 16428)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 16430)
-- Name: entries entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16432)
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 16434)
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 1259 OID 16435)
-- Name: idx_entries_customer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entries_customer ON public.entries USING btree (customer_id);


--
-- TOC entry 3314 (class 1259 OID 16436)
-- Name: idx_entries_entered; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entries_entered ON public.entries USING btree (entered_at);


--
-- TOC entry 3315 (class 1259 OID 16437)
-- Name: idx_memberships_customer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_memberships_customer ON public.memberships USING btree (customer_id);


--
-- TOC entry 3316 (class 1259 OID 16438)
-- Name: idx_memberships_offer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_memberships_offer ON public.memberships USING btree (offer_id);


--
-- TOC entry 3321 (class 2606 OID 16439)
-- Name: entries entries_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 16444)
-- Name: memberships memberships_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- TOC entry 3323 (class 2606 OID 16449)
-- Name: memberships memberships_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offers(id) ON DELETE RESTRICT;


-- Completed on 2025-11-13 13:13:16 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict 4hMNAoU1yL5nDLJG3DRDUEljzfECYxnh754eCJmKbQcWxDO0pxtmAnpl30izJzZ

