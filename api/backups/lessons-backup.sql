--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    lesson_id integer NOT NULL,
    name character varying(100) NOT NULL,
    lang character varying(100) NOT NULL,
    level character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- Name: lessons_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_lesson_id_seq OWNER TO postgres;

--
-- Name: lessons_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_lesson_id_seq OWNED BY public.lessons.lesson_id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    file text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words (
    word_id integer NOT NULL,
    value character varying(100) NOT NULL,
    translated character varying(255) NOT NULL,
    lesson_id integer NOT NULL,
    type character varying(10) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.words OWNER TO postgres;

--
-- Name: words_word_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.words_word_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.words_word_id_seq OWNER TO postgres;

--
-- Name: words_word_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.words_word_id_seq OWNED BY public.words.word_id;


--
-- Name: lessons lesson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN lesson_id SET DEFAULT nextval('public.lessons_lesson_id_seq'::regclass);


--
-- Name: words word_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words ALTER COLUMN word_id SET DEFAULT nextval('public.words_word_id_seq'::regclass);


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (lesson_id, name, lang, level, created_at) FROM stdin;
2	Dom	Spanish	A1	2022-04-05 12:08:52.783846
3	Miasto i wie??	Spanish	A1	2022-04-05 12:19:21.021122
4	Anatomia	Spanish	A1	2022-04-05 12:26:16.047068
5	Poczta	Spanish	A1	2022-04-05 12:28:19.812105
6	Media i komunikacja	Spanish	A1	2022-04-05 12:30:07.296564
7	Cechy charakteru	Spanish	A1	2022-04-05 12:31:43.145974
8	Podr????e	Spanish	A1	2022-04-05 12:32:51.405835
9	Od??ywianie	Spanish	A1	2022-04-05 12:35:25.219229
10	Nauka i edukacja	Spanish	A1	2022-04-05 12:42:27.898394
11	Natura i pogoda	Spanish	A1	2022-04-05 12:50:29.875982
12	Wygl??d	Spanish	A1	2022-04-05 12:52:03.544611
13	Ubi??r	Spanish	A1	2022-04-05 12:52:54.060398
14	Kolory	Spanish	A1	2022-04-05 12:53:40.684809
15	Kalendarz	Spanish	A1	2022-04-05 12:54:42.345141
16	Rodzina	Spanish	A1	2022-04-05 12:55:35.060501
17	Ro??liny	Spanish	A1	2022-04-05 12:57:04.614507
18	Uczucia	Spanish	A1	2022-04-05 12:57:37.668794
19	Dane osobowe	Spanish	A1	2022-04-05 12:58:41.631995
20	Zdrowie	Spanish	A1	2022-04-05 12:59:29.480201
21	Zwierz??ta	Spanish	A1	2022-04-05 13:00:37.734819
22	Praca	Spanish	A1	2022-04-05 13:01:11.497668
23	Zakupy	Spanish	A1	2022-04-05 13:01:42.898723
24	Higiena	Spanish	A1	2022-04-05 13:03:37.703442
25	Po??o??enie	Spanish	A1	2022-04-05 13:04:42.56757
26	Transport	Spanish	A1	2022-04-05 13:05:19.639027
27	Kraje	Spanish	A1	2022-04-05 13:06:43.519919
28	Pa??stwo i prawo	Spanish	A1	2022-04-05 13:07:12.382454
29	Sport i rozrywka	Spanish	A1	2022-04-05 13:07:50.989929
30	Religia	Spanish	A1	2022-04-05 13:08:43.186581
31	Kultura i sztuka	Spanish	A1	2022-04-05 13:09:28.676142
32	Substancje	Spanish	A1	2022-04-05 13:11:48.373879
33	Gospodarka i finanse	Spanish	A1	2022-04-05 13:12:41.186643
34	Wojna	Spanish	A1	2022-04-05 13:13:16.491823
35	R????ne	Spanish	A1	2022-04-05 13:14:04.64222
36	Czas	Spanish	A2	2022-04-05 16:35:42.303029
37	Liczby	Spanish	A2	2022-04-05 20:16:00.954682
38	Miary	Spanish	A2	2022-04-05 20:16:54.108631
39	Miasto i wie??	Spanish	A2	2022-04-05 20:18:25.342683
40	Od??ywianie	Spanish	A2	2022-04-05 20:19:09.042499
41	Praca	Spanish	A2	2022-04-05 20:20:58.478437
42	Ro??liny	Spanish	A2	2022-04-05 20:21:37.525718
43	Substancje i materia??y	Spanish	A2	2022-04-05 20:22:35.241603
44	Uczucia	Spanish	A2	2022-04-05 20:23:04.360403
45	Zwierz??ta	Spanish	A2	2022-04-05 20:23:54.858793
46	Dom	Spanish	A2	2022-04-05 20:24:56.730064
47	Charakter i osobowo????	Spanish	A2	2022-04-05 20:25:37.546445
48	Anatomia	Spanish	A2	2022-04-05 20:27:03.625523
49	Gospodarka i finanse	Spanish	A2	2022-04-05 20:27:40.177258
50	Kraje	Spanish	A2	2022-04-05 20:28:44.92811
51	Kultura i sztuka	Spanish	A2	2022-04-05 20:29:20.144851
52	Media i technologia	Spanish	A2	2022-04-05 20:30:05.244893
53	Moda i ubi??r	Spanish	A2	2022-04-05 20:30:35.74524
54	Porozumiewanie si??	Spanish	A2	2022-04-05 20:31:19.327343
55	Natura i ekologia	Spanish	A2	2022-04-05 20:31:51.083911
56	Nauka i edukacja	Spanish	A2	2022-04-05 20:32:25.645666
57	Opinie	Spanish	A2	2022-04-05 20:33:50.229259
58	Podr????e	Spanish	A2	2022-04-05 20:34:19.148659
59	Pogoda	Spanish	A2	2022-04-05 20:34:55.313006
60	Rodzina	Spanish	A2	2022-04-05 20:35:31.59697
61	Po??o??enie	Spanish	A2	2022-04-05 20:36:11.331816
62	Transport	Spanish	A2	2022-04-05 20:36:46.514297
63	Zakupy	Spanish	A2	2022-04-05 20:37:18.983899
64	Zdrowie	Spanish	A2	2022-04-05 20:37:52.383658
65	Higiena	Spanish	A2	2022-04-05 20:38:35.983206
66	Pa??stwo i polityka	Spanish	A2	2022-04-05 20:39:07.865738
67	Prawo i problemy spo??eczne	Spanish	A2	2022-04-05 20:39:48.167375
68	Przedmioty	Spanish	A2	2022-04-05 20:40:27.001263
69	Religia	Spanish	A2	2022-04-05 20:40:59.901007
70	Sport i czas wolny	Spanish	A2	2022-04-05 20:41:35.78251
71	Urz??dy	Spanish	A2	2022-04-05 20:42:09.050219
72	Wojny i katastrofy	Spanish	A2	2022-04-05 20:42:41.552927
73	Wygl??d zewn??trzny	Spanish	A2	2022-04-05 20:43:28.836456
74	??wiat fantazji	Spanish	A2	2022-04-05 20:44:15.885397
75	R????ne	Spanish	A2	2022-04-05 20:45:14.305693
76	Czas	Spanish	B1	2022-04-07 20:35:58.005442
77	Miary	Spanish	B1	2022-04-07 20:39:02.885164
78	Dom	Spanish	B1	2022-04-07 20:39:40.97773
79	Zwierz??ta	Spanish	B1	2022-04-07 20:40:29.979273
80	Miasto i wie??	Spanish	B1	2022-04-07 20:41:23.762887
81	Kolory, kszta??ty i d??wi??ki	Spanish	B1	2022-04-07 20:42:18.696233
82	Uczucia	Spanish	B1	2022-04-07 20:44:46.95117
83	Media i technologia	Spanish	B1	2022-04-07 20:46:54.630143
84	Zakupy	Spanish	B1	2022-04-07 20:47:30.777651
85	Przedmioty	Spanish	B1	2022-04-07 20:48:05.646386
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, file, created_at) FROM stdin;
16c8336e-8738-4852-8800-5831bdb66497	0000-init_migrations.sql	2022-04-04 17:04:23.584294
0b3d1da3-4607-46fb-9b23-d3a42e9b1408	0001-initial_data.sql	2022-04-04 17:04:23.584294
\.


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words (word_id, value, translated, lesson_id, type, created_at) FROM stdin;
1226	el patr??n	pracodawca	41	word	2022-04-05 20:21:24.199495
1227	emplear	zatrudnia??	41	word	2022-04-05 20:21:24.199495
4	la casa	dom	2	word	2022-04-05 12:17:07.182851
5	vivir	mieszka??	2	word	2022-04-05 12:17:07.182851
6	el vecino	s??siad	2	word	2022-04-05 12:17:07.182851
7	el piso	mieszkanie	2	word	2022-04-05 12:17:07.182851
8	la planta	pi??tro	2	word	2022-04-05 12:17:07.182851
9	la planta baja	parter	2	word	2022-04-05 12:17:07.182851
10	la escalera	schody	2	word	2022-04-05 12:17:07.182851
11	el ascensor	winda	2	word	2022-04-05 12:17:07.182851
12	la puerta	drzwi	2	word	2022-04-05 12:17:07.182851
13	la llave	klucz	2	word	2022-04-05 12:17:07.182851
14	el pasillo	korytarz	2	word	2022-04-05 12:17:07.182851
15	la cocina	kuchnia	2	word	2022-04-05 12:17:07.182851
16	el cuarto	pok??j (w rodzaju m??skim)	2	word	2022-04-05 12:17:07.182851
17	el cuarto de ba??o	??azienka	2	word	2022-04-05 12:17:07.182851
18	el servicio	toaleta	2	word	2022-04-05 12:17:07.182851
19	el espejo	lustro	2	word	2022-04-05 12:17:07.182851
20	la habitaci??n	pok??j (w rodzaju ??e??skim)	2	word	2022-04-05 12:17:07.182851
21	el sal??n	salon	2	word	2022-04-05 12:17:07.182851
22	el estante	p????ka	2	word	2022-04-05 12:17:07.182851
23	la estanter??a	rega??	2	word	2022-04-05 12:17:07.182851
24	el sill??n	fotel	2	word	2022-04-05 12:17:07.182851
25	c??modo	wygodny	2	word	2022-04-05 12:17:07.182851
26	inc??modo	niewygodny	2	word	2022-04-05 12:17:07.182851
27	el sof??	sofa	2	word	2022-04-05 12:17:07.182851
28	el suelo	pod??oga	2	word	2022-04-05 12:17:07.182851
29	la alfombra	dywan	2	word	2022-04-05 12:17:07.182851
30	el comedor	jadalnia	2	word	2022-04-05 12:17:07.182851
31	la silla	krzes??o	2	word	2022-04-05 12:17:07.182851
32	la mesa	st????	2	word	2022-04-05 12:17:07.182851
33	la l??mpara	lampa	2	word	2022-04-05 12:17:07.182851
34	el techo	sufit	2	word	2022-04-05 12:17:07.182851
35	el dormitorio	sypialnia	2	word	2022-04-05 12:17:07.182851
36	la cama	??????ko	2	word	2022-04-05 12:17:07.182851
37	el armario	szafa	2	word	2022-04-05 12:17:07.182851
38	la pared	??ciana	2	word	2022-04-05 12:17:07.182851
39	la ventana	okno	2	word	2022-04-05 12:17:07.182851
40	el balc??n	balkon	2	word	2022-04-05 12:17:07.182851
41	el patio	podw??rze, dziedziniec	2	word	2022-04-05 12:17:07.182851
42	el plato	talerz	2	word	2022-04-05 12:17:07.182851
43	el platillo	spodek	2	word	2022-04-05 12:17:07.182851
44	la cuchara	??y??ka	2	word	2022-04-05 12:17:07.182851
45	el tenedor	widelec	2	word	2022-04-05 12:17:07.182851
46	el cuchillo	n????	2	word	2022-04-05 12:17:07.182851
47	el vaso	szklanka	2	word	2022-04-05 12:17:07.182851
48	la taza	fili??anka	2	word	2022-04-05 12:17:07.182851
49	la olla	garnek	2	word	2022-04-05 12:17:07.182851
50	la sart??n	patelnia	2	word	2022-04-05 12:17:07.182851
51	preparar	przygotowywa??	2	word	2022-04-05 12:17:07.182851
52	la preparaci??n	przygotowanie	2	word	2022-04-05 12:17:07.182851
53	el orden	porz??dek	2	word	2022-04-05 12:17:07.182851
54	el desorden	nieporz??dek	2	word	2022-04-05 12:17:07.182851
55	la suciedad	brud	2	word	2022-04-05 12:17:07.182851
56	sucio	brudny	2	word	2022-04-05 12:17:07.182851
57	la basura	??mieci	2	word	2022-04-05 12:17:07.182851
58	limpiar	czy??ci??	2	word	2022-04-05 12:17:07.182851
59	limpio	czysty	2	word	2022-04-05 12:17:07.182851
60	lavar	pra??, zmywa??	2	word	2022-04-05 12:17:07.182851
61	la lavadora	pralka	2	word	2022-04-05 12:17:07.182851
62	la nevera	lod??wka	2	word	2022-04-05 12:17:07.182851
63	la ciudad	miasto	3	word	2022-04-05 12:20:01.728215
64	la capital	stolica	3	word	2022-04-05 12:20:01.728215
65	la calle	ulica	3	word	2022-04-05 12:20:01.728215
66	la plaza	plac	3	word	2022-04-05 12:20:01.728215
67	el centro	centrum	3	word	2022-04-05 12:20:01.728215
68	el barrio	dzielnica	3	word	2022-04-05 12:20:01.728215
69	el parque	park	3	word	2022-04-05 12:20:01.728215
70	el banco	??awka	3	word	2022-04-05 12:20:01.728215
71	el autob??s	autobus	3	word	2022-04-05 12:20:01.728215
72	el tranv??a	tramwaj	3	word	2022-04-05 12:20:01.728215
73	la parada	przystanek	3	word	2022-04-05 12:20:01.728215
74	el metro	metro	3	word	2022-04-05 12:20:01.728215
75	el taxi	taks??wka	3	word	2022-04-05 12:20:01.728215
76	el taxista	taks??wkarz	3	word	2022-04-05 12:20:01.728215
77	aparcar	parkowa??	3	word	2022-04-05 12:20:01.728215
78	el aparcamiento	parking	3	word	2022-04-05 12:20:01.728215
79	el puente	most	3	word	2022-04-05 12:20:01.728215
80	construir	budowa??	3	word	2022-04-05 12:20:01.728215
81	el edificio	budynek	3	word	2022-04-05 12:20:01.728215
82	moderno	nowoczesny	3	word	2022-04-05 12:20:01.728215
83	antiguo	stary, zabytkowy	3	word	2022-04-05 12:20:01.728215
84	el campo	wie?? (tereny pozamiejskie)	3	word	2022-04-05 12:20:01.728215
85	el campesino	ch??op, wie??niak	3	word	2022-04-05 12:20:01.728215
86	campesino	wiejski	3	word	2022-04-05 12:20:01.728215
87	el pueblo	wie??, ma??a miejscowo????	3	word	2022-04-05 12:20:01.728215
88	el campo	pole	3	word	2022-04-05 12:20:01.728215
89	el tractor	traktor	3	word	2022-04-05 12:20:01.728215
90	el camino	droga	3	word	2022-04-05 12:20:01.728215
91	la anatom??a	anatomia	4	word	2022-04-05 12:26:55.063594
92	el cuerpo	cia??o	4	word	2022-04-05 12:26:55.063594
93	la cabeza	g??owa	4	word	2022-04-05 12:26:55.063594
94	la cara	twarz	4	word	2022-04-05 12:26:55.063594
95	el ojo	oko	4	word	2022-04-05 12:26:55.063594
96	ver	widzie??	4	word	2022-04-05 12:26:55.063594
97	la oreja	ucho	4	word	2022-04-05 12:26:55.063594
98	o??r	s??ysze?? (1g)	4	word	2022-04-05 12:26:55.063594
99	la nariz	nos	4	word	2022-04-05 12:26:55.063594
100	la boca	usta	4	word	2022-04-05 12:26:55.063594
101	la lengua	j??zyk	4	word	2022-04-05 12:26:55.063594
102	el diente	z??b	4	word	2022-04-05 12:26:55.063594
103	la garganta	gard??o	4	word	2022-04-05 12:26:55.063594
104	el pecho	klatka piersiowa	4	word	2022-04-05 12:26:55.063594
105	el coraz??n	serce	4	word	2022-04-05 12:26:55.063594
106	la sangre	krew	4	word	2022-04-05 12:26:55.063594
107	el brazo	rami??, r??ka	4	word	2022-04-05 12:26:55.063594
108	el codo	??okie??	4	word	2022-04-05 12:26:55.063594
109	la mano	r??ka, d??o??	4	word	2022-04-05 12:26:55.063594
110	el dedo	palec	4	word	2022-04-05 12:26:55.063594
111	el vientre	brzuch	4	word	2022-04-05 12:26:55.063594
112	el est??mago	??o????dek	4	word	2022-04-05 12:26:55.063594
113	la pierna	noga	4	word	2022-04-05 12:26:55.063594
114	la rodilla	kolano	4	word	2022-04-05 12:26:55.063594
115	el pie	stopa	4	word	2022-04-05 12:26:55.063594
116	la piel	sk??ra	4	word	2022-04-05 12:26:55.063594
117	el correo	korespondencja, poczta	5	word	2022-04-05 12:28:45.428327
118	la oficina de correos	urz??d pocztowy	5	word	2022-04-05 12:28:45.428327
119	la carta	list	5	word	2022-04-05 12:28:45.428327
120	la tarjeta	karta	5	word	2022-04-05 12:28:45.428327
121	postal	pocztowy	5	word	2022-04-05 12:28:45.428327
122	el sello	znaczek pocztowy	5	word	2022-04-05 12:28:45.428327
123	la direcci??n	adres	5	word	2022-04-05 12:28:45.428327
124	enviar	wysy??a??	5	word	2022-04-05 12:28:45.428327
125	el cartero	listonosz	5	word	2022-04-05 12:28:45.428327
126	el tel??fono	telefon	6	word	2022-04-05 12:30:55.375338
127	telef??nico	telefoniczny	6	word	2022-04-05 12:30:55.375338
128	llamar	dzwoni??	6	word	2022-04-05 12:30:55.375338
129	la llamada	po????czenie (telefoniczne)	6	word	2022-04-05 12:30:55.375338
130	diga	halo, s??ucham	6	word	2022-04-05 12:30:55.375338
131	el peri??dico	gazeta	6	word	2022-04-05 12:30:55.375338
132	la revista	czasopismo	6	word	2022-04-05 12:30:55.375338
133	la radio	radio	6	word	2022-04-05 12:30:55.375338
134	el televisor	telewizor	6	word	2022-04-05 12:30:55.375338
135	la televisi??n	telewizja	6	word	2022-04-05 12:30:55.375338
136	el programa	program	6	word	2022-04-05 12:30:55.375338
137	el ordenador	komputer	6	word	2022-04-05 12:30:55.375338
138	el Internet	internet	6	word	2022-04-05 12:30:55.375338
139	la noticia	wiadomo????	6	word	2022-04-05 12:30:55.375338
140	electr??nico	elektroniczny	6	word	2022-04-05 12:30:55.375338
141	el car??cter	charakter	7	word	2022-04-05 12:32:14.527892
142	caracter??stico	charakterystyczny	7	word	2022-04-05 12:32:14.527892
143	bueno	dobry	7	word	2022-04-05 12:32:14.527892
144	malo	z??y	7	word	2022-04-05 12:32:14.527892
145	amable	mi??y, uprzejmy	7	word	2022-04-05 12:32:14.527892
146	grosero	ordynarny, grubia??ski	7	word	2022-04-05 12:32:14.527892
147	simp??tico	sympatyczny	7	word	2022-04-05 12:32:14.527892
148	antip??tico	niesympatyczny	7	word	2022-04-05 12:32:14.527892
149	serio	powa??ny	7	word	2022-04-05 12:32:14.527892
150	divertido	??mieszny, zabawny	7	word	2022-04-05 12:32:14.527892
151	paciente	cierpliwy	7	word	2022-04-05 12:32:14.527892
152	impaciente	niecierpliwy	7	word	2022-04-05 12:32:14.527892
153	nervioso	nerwowy	7	word	2022-04-05 12:32:14.527892
154	t??mido	nie??mia??y	7	word	2022-04-05 12:32:14.527892
155	riguroso	surowy	7	word	2022-04-05 12:32:14.527892
156	viajar	podr????owa??	8	word	2022-04-05 12:33:20.875123
157	el viaje	podr????	8	word	2022-04-05 12:33:20.875123
158	el viajero	podr????nik	8	word	2022-04-05 12:33:20.875123
159	las vacaciones	wakacje	8	word	2022-04-05 12:33:20.875123
160	la agencia	agencja, biuro	8	word	2022-04-05 12:33:20.875123
161	reservar	rezerwowa??	8	word	2022-04-05 12:33:20.875123
162	la reserva	rezerwacja	8	word	2022-04-05 12:33:20.875123
163	el hotel	hotel	8	word	2022-04-05 12:33:20.875123
164	pasar	sp??dza??	8	word	2022-04-05 12:33:20.875123
165	la mochila	plecak	8	word	2022-04-05 12:33:20.875123
166	la bolsa	torba	8	word	2022-04-05 12:33:20.875123
167	la maleta	walizka	8	word	2022-04-05 12:33:20.875123
168	el equipaje	baga??	8	word	2022-04-05 12:33:20.875123
169	listo	gotowy	8	word	2022-04-05 12:33:20.875123
170	la frontera	granica	8	word	2022-04-05 12:33:20.875123
171	el pasaporte	paszport	8	word	2022-04-05 12:33:20.875123
172	el mapa	mapa	8	word	2022-04-05 12:33:20.875123
173	la excursi??n	wycieczka	8	word	2022-04-05 12:33:20.875123
174	el camping	kemping, pole namiotowe	8	word	2022-04-05 12:33:20.875123
175	la tienda de campa??a	namiot	8	word	2022-04-05 12:33:20.875123
176	el turismo	turystyka	8	word	2022-04-05 12:33:20.875123
177	el turista	turysta	8	word	2022-04-05 12:33:20.875123
178	tur??stico	turystyczny	8	word	2022-04-05 12:33:20.875123
179	la informaci??n	informacja	8	word	2022-04-05 12:33:20.875123
180	planear	planowa??	8	word	2022-04-05 12:33:20.875123
181	el plano	plan	8	word	2022-04-05 12:33:20.875123
182	visitar	zwiedza??	8	word	2022-04-05 12:33:20.875123
183	el gu??a	przewodnik (osoba)	8	word	2022-04-05 12:33:20.875123
184	el monumento	pomnik, zabytek	8	word	2022-04-05 12:33:20.875123
185	famoso	s??awny	8	word	2022-04-05 12:33:20.875123
186	descansar	odpoczywa??	8	word	2022-04-05 12:33:20.875123
187	el descanso	odpoczynek	8	word	2022-04-05 12:33:20.875123
188	la playa	pla??a	8	word	2022-04-05 12:33:20.875123
189	tomar	bra??	8	word	2022-04-05 12:33:20.875123
190	la tranquilidad	spok??j	8	word	2022-04-05 12:33:20.875123
191	tranquilo	spokojny	8	word	2022-04-05 12:33:20.875123
192	ba??ar	k??pa??	8	word	2022-04-05 12:33:20.875123
193	agradable	przyjemny	8	word	2022-04-05 12:33:20.875123
194	desagradable	nieprzyjemny	8	word	2022-04-05 12:33:20.875123
195	saludar	wita??	8	word	2022-04-05 12:33:20.875123
196	el saludo	powitanie	8	word	2022-04-05 12:33:20.875123
197	volver	wraca?? (o/ue)	8	word	2022-04-05 12:33:20.875123
198	la vuelta	powr??t	8	word	2022-04-05 12:33:20.875123
199	desayunar	je???? ??niadanie	9	word	2022-04-05 12:36:17.848528
200	el desayuno	??niadanie	9	word	2022-04-05 12:36:17.848528
201	el hambre	g????d (rodzaj ??e??ski)	9	word	2022-04-05 12:36:17.848528
202	el alimento	pokarm	9	word	2022-04-05 12:36:17.848528
203	el pan	chleb	9	word	2022-04-05 12:36:17.848528
204	el panecillo	bu??ka	9	word	2022-04-05 12:36:17.848528
205	cortar	kroi??	9	word	2022-04-05 12:36:17.848528
206	la mantequilla	mas??o	9	word	2022-04-05 12:36:17.848528
207	la miel	mi??d	9	word	2022-04-05 12:36:17.848528
208	la marmelada	d??em	9	word	2022-04-05 12:36:17.848528
209	la leche	mleko	9	word	2022-04-05 12:36:17.848528
210	el cacao	kakao	9	word	2022-04-05 12:36:17.848528
211	el yogur	jogurt	9	word	2022-04-05 12:36:17.848528
212	el queso	ser	9	word	2022-04-05 12:36:17.848528
213	el reques??n	twar??g	9	word	2022-04-05 12:36:17.848528
214	fresco	??wie??y	9	word	2022-04-05 12:36:17.848528
215	la nata	??mietana	9	word	2022-04-05 12:36:17.848528
216	el huevo	jajko	9	word	2022-04-05 12:36:17.848528
217	el jam??n	szynka	9	word	2022-04-05 12:36:17.848528
218	la salchicha	kie??basa	9	word	2022-04-05 12:36:17.848528
219	cocinar	gotowa??	9	word	2022-04-05 12:36:17.848528
220	el cocinero	kucharz	9	word	2022-04-05 12:36:17.848528
221	el restaurante	restauracja	9	word	2022-04-05 12:36:17.848528
222	comer	je????	9	word	2022-04-05 12:36:17.848528
223	la comida	jedzenie	9	word	2022-04-05 12:36:17.848528
224	cenar	je???? kolacj??	9	word	2022-04-05 12:36:17.848528
225	la cena	kolacja	9	word	2022-04-05 12:36:17.848528
226	la sopa	zupa	9	word	2022-04-05 12:36:17.848528
227	el arroz	ry??	9	word	2022-04-05 12:36:17.848528
228	los macarrones	makaron	9	word	2022-04-05 12:36:17.848528
229	las patatas fritas	frytki	9	word	2022-04-05 12:36:17.848528
230	el aceite	olej	9	word	2022-04-05 12:36:17.848528
231	el pescado	ryba (potrawa)	9	word	2022-04-05 12:36:17.848528
232	fre??r	sma??y??	9	word	2022-04-05 12:36:17.848528
233	la carne	mi??so	9	word	2022-04-05 12:36:17.848528
234	la carne de vaca	wo??owina	9	word	2022-04-05 12:36:17.848528
235	la carne de cerdo	wieprzowina	9	word	2022-04-05 12:36:17.848528
236	el marisco	owoce morza	9	word	2022-04-05 12:36:17.848528
237	la salsa	sos	9	word	2022-04-05 12:36:17.848528
238	la sal	s??l	9	word	2022-04-05 12:36:17.848528
239	salado	s??ony	9	word	2022-04-05 12:36:17.848528
240	la pimienta	pieprz	9	word	2022-04-05 12:36:17.848528
241	rico	pyszny, wy??mienity	9	word	2022-04-05 12:36:17.848528
242	la ensalada	sa??atka	9	word	2022-04-05 12:36:17.848528
243	la ensaladilla rusa	sa??atka warzywna	9	word	2022-04-05 12:36:17.848528
244	qu?? aproveche	smacznego	9	word	2022-04-05 12:36:17.848528
245	la sed	pragnienie	9	word	2022-04-05 12:36:17.848528
246	beber	pi??	9	word	2022-04-05 12:36:17.848528
247	la bebida	nap??j	9	word	2022-04-05 12:36:17.848528
248	el zumo	sok	9	word	2022-04-05 12:36:17.848528
249	mineral	mineralny	9	word	2022-04-05 12:36:17.848528
250	la cafeter??a	kawiarnia	9	word	2022-04-05 12:36:17.848528
251	el chocolate	czekolada	9	word	2022-04-05 12:36:17.848528
252	la tarta	tort	9	word	2022-04-05 12:36:17.848528
253	dulce	s??odki	9	word	2022-04-05 12:36:17.848528
254	el pastel	ciasto	9	word	2022-04-05 12:36:17.848528
255	la galleta	ciasteczko, herbatnik	9	word	2022-04-05 12:36:17.848528
256	el helado	lody	9	word	2022-04-05 12:36:17.848528
257	el caf??	kawa	9	word	2022-04-05 12:36:17.848528
258	el caf?? solo	kawa czarna	9	word	2022-04-05 12:36:17.848528
259	el t??	herbata	9	word	2022-04-05 12:36:17.848528
260	el az??car	cukier	9	word	2022-04-05 12:36:17.848528
261	el bar	bar	9	word	2022-04-05 12:36:17.848528
262	la tapa	przek??ska	9	word	2022-04-05 12:36:17.848528
263	la tortilla	omlet	9	word	2022-04-05 12:36:17.848528
264	la cerveza	piwo	9	word	2022-04-05 12:36:17.848528
265	el vino	wino	9	word	2022-04-05 12:36:17.848528
266	la escuela	szko??a	10	word	2022-04-05 12:49:42.89867
267	la clase	klasa, sala lekcyjna	10	word	2022-04-05 12:49:42.89867
268	el maestro	nauczyciel (w szkole podstawowej i gimnazjum)	10	word	2022-04-05 12:49:42.89867
269	el alumno	ucze??	10	word	2022-04-05 12:49:42.89867
270	aplicado	pilny	10	word	2022-04-05 12:49:42.89867
271	vago	leniwy	10	word	2022-04-05 12:49:42.89867
272	estudiar	studiowa??, uczy?? si??	10	word	2022-04-05 12:49:42.89867
273	el estudiante	student	10	word	2022-04-05 12:49:42.89867
274	la estudiante	studentka	10	word	2022-04-05 12:49:42.89867
275	la universidad	uniwersytet	10	word	2022-04-05 12:49:42.89867
276	el profesor	nauczyciel, profesor	10	word	2022-04-05 12:49:42.89867
277	la clase	lekcja ( c)	10	word	2022-04-05 12:49:42.89867
278	el recreo	przerwa w szkole	10	word	2022-04-05 12:49:42.89867
279	asistir	ucz??szcza??	10	word	2022-04-05 12:49:42.89867
280	el curso	kurs	10	word	2022-04-05 12:49:42.89867
281	la lecci??n	lekcja (l)	10	word	2022-04-05 12:49:42.89867
282	el tema	temat	10	word	2022-04-05 12:49:42.89867
283	escribir	pisa??	10	word	2022-04-05 12:49:42.89867
284	la pizarra	tablica	10	word	2022-04-05 12:49:42.89867
285	la tiza	kreda	10	word	2022-04-05 12:49:42.89867
286	el libro	ksi????ka	10	word	2022-04-05 12:49:42.89867
287	leer	czyta??	10	word	2022-04-05 12:49:42.89867
288	el texto	tekst	10	word	2022-04-05 12:49:42.89867
289	el libro de texto	podr??cznik	10	word	2022-04-05 12:49:42.89867
290	sobre	o	10	word	2022-04-05 12:49:42.89867
291	la p??gina	strona	10	word	2022-04-05 12:49:42.89867
292	la biblioteca	biblioteka	10	word	2022-04-05 12:49:42.89867
293	el bibliotecario	bibliotekarz	10	word	2022-04-05 12:49:42.89867
294	aprender	uczy?? si??	10	word	2022-04-05 12:49:42.89867
295	f??cil	??atwy	10	word	2022-04-05 12:49:42.89867
296	dif??cil	trudny	10	word	2022-04-05 12:49:42.89867
297	entender	rozumie?? (e/ie)	10	word	2022-04-05 12:49:42.89867
298	repetir	powtarza?? (e/i)	10	word	2022-04-05 12:49:42.89867
299	la repetici??n	powt??rka	10	word	2022-04-05 12:49:42.89867
300	los deberes	praca domowa	10	word	2022-04-05 12:49:42.89867
301	el cuaderno	zeszyt	10	word	2022-04-05 12:49:42.89867
302	mostrar	pokazywa?? (o/ue)	10	word	2022-04-05 12:49:42.89867
303	preguntar	pyta??	10	word	2022-04-05 12:49:42.89867
304	la pregunta	pytanie	10	word	2022-04-05 12:49:42.89867
305	responder	odpowiada??	10	word	2022-04-05 12:49:42.89867
306	la respuesta	odpowied??	10	word	2022-04-05 12:49:42.89867
307	saber	wiedzie?? (nr)	10	word	2022-04-05 12:49:42.89867
308	olvidar	zapomina??	10	word	2022-04-05 12:49:42.89867
309	preparado	przygotowany	10	word	2022-04-05 12:49:42.89867
310	el examen	egzamin	10	word	2022-04-05 12:49:42.89867
311	los ex??menes	egzaminy	10	word	2022-04-05 12:49:42.89867
312	el error	b????d	10	word	2022-04-05 12:49:42.89867
313	discutir	dyskutowa??	10	word	2022-04-05 12:49:42.89867
314	la discusi??n	dyskusja	10	word	2022-04-05 12:49:42.89867
315	la nota	ocena, stopie??	10	word	2022-04-05 12:49:42.89867
316	la asignatura	przedmiot (w szkole)	10	word	2022-04-05 12:49:42.89867
317	favorito	ulubiony (f)	10	word	2022-04-05 12:49:42.89867
318	las matem??ticas	matematyka	10	word	2022-04-05 12:49:42.89867
319	la geograf??a	geografia	10	word	2022-04-05 12:49:42.89867
320	la qu??mica	chemia	10	word	2022-04-05 12:49:42.89867
321	la f??sica	fizyka	10	word	2022-04-05 12:49:42.89867
322	la historia	historia	10	word	2022-04-05 12:49:42.89867
323	la biolog??a	biologia	10	word	2022-04-05 12:49:42.89867
324	el compa??ero	kolega	10	word	2022-04-05 12:49:42.89867
325	la inteligencia	inteligencja	10	word	2022-04-05 12:49:42.89867
326	inteligente	inteligentny	10	word	2022-04-05 12:49:42.89867
327	la tonter??a	g??upota	10	word	2022-04-05 12:49:42.89867
328	el tonto	g??upiec	10	word	2022-04-05 12:49:42.89867
329	tonto	g??upi	10	word	2022-04-05 12:49:42.89867
330	tener que	musie?? (nr)	10	word	2022-04-05 12:49:42.89867
331	hay que	trzeba	10	word	2022-04-05 12:49:42.89867
332	la naturaleza	natura, przyroda	11	word	2022-04-05 12:50:57.851839
333	el mundo	??wiat	11	word	2022-04-05 12:50:57.851839
334	la estrella	gwiazda	11	word	2022-04-05 12:50:57.851839
335	la luna	ksi????yc	11	word	2022-04-05 12:50:57.851839
336	la tierra	ziemia	11	word	2022-04-05 12:50:57.851839
337	el agua	woda	11	word	2022-04-05 12:50:57.851839
338	el oc??ano	ocean	11	word	2022-04-05 12:50:57.851839
339	la isla	wyspa	11	word	2022-04-05 12:50:57.851839
340	el mar	morze	11	word	2022-04-05 12:50:57.851839
341	el r??o	rzeka	11	word	2022-04-05 12:50:57.851839
342	el lago	jezioro	11	word	2022-04-05 12:50:57.851839
343	la monta??a	g??ra	11	word	2022-04-05 12:50:57.851839
344	el bosque	las	11	word	2022-04-05 12:50:57.851839
345	da??ar	krzywdzi??, szkodzi??	11	word	2022-04-05 12:50:57.851839
346	el da??o	krzywda	11	word	2022-04-05 12:50:57.851839
347	proteger	chroni??	11	word	2022-04-05 12:50:57.851839
348	la protecci??n	ochrona	11	word	2022-04-05 12:50:57.851839
349	el medio ambiente	??rodowisko	11	word	2022-04-05 12:50:57.851839
350	el tiempo	pogoda	11	word	2022-04-05 12:50:57.851839
351	el sol	s??o??ce	11	word	2022-04-05 12:50:57.851839
352	el calor	upa??	11	word	2022-04-05 12:50:57.851839
353	caliente	gor??cy, ciep??y	11	word	2022-04-05 12:50:57.851839
354	fr??o	zimny	11	word	2022-04-05 12:50:57.851839
355	llover	pada?? (o deszczu) (o/ue)	11	word	2022-04-05 12:50:57.851839
356	la lluvia	deszcz	11	word	2022-04-05 12:50:57.851839
357	lluvioso	deszczowy	11	word	2022-04-05 12:50:57.851839
358	nevar	pada?? (o ??niegu) (e/ie)	11	word	2022-04-05 12:50:57.851839
359	la nieve	??nieg	11	word	2022-04-05 12:50:57.851839
360	el hielo	l??d	11	word	2022-04-05 12:50:57.851839
361	el viento	wiatr	11	word	2022-04-05 12:50:57.851839
362	el aire	powietrze	11	word	2022-04-05 12:50:57.851839
363	el cielo	niebo	11	word	2022-04-05 12:50:57.851839
364	la nube	chmura	11	word	2022-04-05 12:50:57.851839
365	nublado	zachmurzony, pochmurny	11	word	2022-04-05 12:50:57.851839
366	la temperatura	temperatura	11	word	2022-04-05 12:50:57.851839
367	el grado	stopie??	11	word	2022-04-05 12:50:57.851839
368	alto	wysoki	12	word	2022-04-05 12:52:29.753206
369	bajo	niski	12	word	2022-04-05 12:52:29.753206
370	que	ni??, od	12	word	2022-04-05 12:52:29.753206
371	joven	m??ody	12	word	2022-04-05 12:52:29.753206
372	viejo	stary	12	word	2022-04-05 12:52:29.753206
373	bonito	pi??kny	12	word	2022-04-05 12:52:29.753206
374	feo	brzydki	12	word	2022-04-05 12:52:29.753206
375	la figura	figura	12	word	2022-04-05 12:52:29.753206
376	gordo	gruby, oty??y	12	word	2022-04-05 12:52:29.753206
377	delgado	cienki, chudy	12	word	2022-04-05 12:52:29.753206
378	el pelo	w??os	12	word	2022-04-05 12:52:29.753206
379	rubio	blond	12	word	2022-04-05 12:52:29.753206
380	moreno	brunet, ciemnow??osy	12	word	2022-04-05 12:52:29.753206
381	casta??o	br??zowy (o w??osach), piwny (o oczach)	12	word	2022-04-05 12:52:29.753206
382	pelirrojo	rudow??osy, rudy	12	word	2022-04-05 12:52:29.753206
383	calvo	??ysy	12	word	2022-04-05 12:52:29.753206
384	la barba	broda	12	word	2022-04-05 12:52:29.753206
385	el bigote	w??sy	12	word	2022-04-05 12:52:29.753206
386	la ropa	ubranie	13	word	2022-04-05 12:53:20.560115
387	llevar	nosi??, mie?? na sobie	13	word	2022-04-05 12:53:20.560115
388	el jersey	sweter	13	word	2022-04-05 12:53:20.560115
389	la camisa	koszula	13	word	2022-04-05 12:53:20.560115
390	la camiseta	koszulka	13	word	2022-04-05 12:53:20.560115
391	los pantalones	spodnie	13	word	2022-04-05 12:53:20.560115
392	el calcet??n	skarpetka	13	word	2022-04-05 12:53:20.560115
393	los calcetines	skarpetki	13	word	2022-04-05 12:53:20.560115
394	los vaqueros	spodnie d??insowe	13	word	2022-04-05 12:53:20.560115
395	la cazadora	kurtka	13	word	2022-04-05 12:53:20.560115
396	el bolsillo	kiesze??	13	word	2022-04-05 12:53:20.560115
397	la blusa	bluzka	13	word	2022-04-05 12:53:20.560115
398	la falda	sp??dnica	13	word	2022-04-05 12:53:20.560115
399	el vestido	suknia, sukienka	13	word	2022-04-05 12:53:20.560115
400	el abrigo	p??aszcz	13	word	2022-04-05 12:53:20.560115
401	el paraguas	parasol	13	word	2022-04-05 12:53:20.560115
402	el sombrero	kapelusz	13	word	2022-04-05 12:53:20.560115
403	el zapato	but	13	word	2022-04-05 12:53:20.560115
404	la bota	wysoki but, kozak	13	word	2022-04-05 12:53:20.560115
405	elegante	elegancki	13	word	2022-04-05 12:53:20.560115
406	vestirse	ubiera?? si?? (e/i)	13	word	2022-04-05 12:53:20.560115
407	vestir	ubiera?? (e/i)	13	word	2022-04-05 12:53:20.560115
408	la moda	moda	13	word	2022-04-05 12:53:20.560115
409	de moda	modny	13	word	2022-04-05 12:53:20.560115
410	pasado de moda	niemodny	13	word	2022-04-05 12:53:20.560115
411	el bolso	torebka damska	13	word	2022-04-05 12:53:20.560115
412	el anillo	pier??cionek	13	word	2022-04-05 12:53:20.560115
413	las gafas	okulary	13	word	2022-04-05 12:53:20.560115
414	el reloj	zegarek, zegar	13	word	2022-04-05 12:53:20.560115
415	estupendo	fantastyczny, ??wietny	13	word	2022-04-05 12:53:20.560115
416	demasiado	za, zbyt	13	word	2022-04-05 12:53:20.560115
417	el color	kolor	14	word	2022-04-05 12:54:08.976201
418	de colores	kolorowy	14	word	2022-04-05 12:54:08.976201
419	blanco	bia??y	14	word	2022-04-05 12:54:08.976201
420	negro	czarny	14	word	2022-04-05 12:54:08.976201
421	rojo	czerwony	14	word	2022-04-05 12:54:08.976201
422	amarillo	??????ty	14	word	2022-04-05 12:54:08.976201
423	verde	zielony	14	word	2022-04-05 12:54:08.976201
424	azul	niebieski	14	word	2022-04-05 12:54:08.976201
425	azul marino	granatowy	14	word	2022-04-05 12:54:08.976201
426	gris	szary	14	word	2022-04-05 12:54:08.976201
427	marr??n	br??zowy	14	word	2022-04-05 12:54:08.976201
428	claro	jasny	14	word	2022-04-05 12:54:08.976201
429	oscuro	ciemny	14	word	2022-04-05 12:54:08.976201
430	el calendario	kalendarz	15	word	2022-04-05 12:55:06.007015
431	el d??a	dzie??	15	word	2022-04-05 12:55:06.007015
432	el lunes	poniedzia??ek	15	word	2022-04-05 12:55:06.007015
433	el martes	wtorek	15	word	2022-04-05 12:55:06.007015
434	el mi??rcoles	??roda	15	word	2022-04-05 12:55:06.007015
435	el jueves	czwartek	15	word	2022-04-05 12:55:06.007015
436	el viernes	pi??tek	15	word	2022-04-05 12:55:06.007015
437	el s??bado	sobota	15	word	2022-04-05 12:55:06.007015
438	el domingo	niedziela	15	word	2022-04-05 12:55:06.007015
439	la semana	tydzie??	15	word	2022-04-05 12:55:06.007015
440	el mes	miesi??c	15	word	2022-04-05 12:55:06.007015
441	enero	stycze??	15	word	2022-04-05 12:55:06.007015
442	febrero	luty	15	word	2022-04-05 12:55:06.007015
443	marzo	marzec	15	word	2022-04-05 12:55:06.007015
444	abril	kwiecie??	15	word	2022-04-05 12:55:06.007015
445	mayo	maj	15	word	2022-04-05 12:55:06.007015
446	junio	czerwiec	15	word	2022-04-05 12:55:06.007015
447	julio	lipiec	15	word	2022-04-05 12:55:06.007015
448	agosto	sierpie??	15	word	2022-04-05 12:55:06.007015
449	septiembre	wrzesie??	15	word	2022-04-05 12:55:06.007015
450	octubre	pa??dziernik	15	word	2022-04-05 12:55:06.007015
451	noviembre	listopad	15	word	2022-04-05 12:55:06.007015
452	diciembre	grudzie??	15	word	2022-04-05 12:55:06.007015
453	el a??o	rok	15	word	2022-04-05 12:55:06.007015
454	la estaci??n del a??o	pora roku	15	word	2022-04-05 12:55:06.007015
455	la primavera	wiosna	15	word	2022-04-05 12:55:06.007015
456	el verano	lato	15	word	2022-04-05 12:55:06.007015
457	el oto??o	jesie??	15	word	2022-04-05 12:55:06.007015
458	el invierno	zima	15	word	2022-04-05 12:55:06.007015
459	la familia	rodzina	16	word	2022-04-05 12:56:31.904282
460	el padre	ojciec	16	word	2022-04-05 12:56:31.904282
461	el pap??	tata	16	word	2022-04-05 12:56:31.904282
462	la madre	matka	16	word	2022-04-05 12:56:31.904282
463	la mam??	mama	16	word	2022-04-05 12:56:31.904282
464	los padres	rodzice	16	word	2022-04-05 12:56:31.904282
465	el hermano	brat	16	word	2022-04-05 12:56:31.904282
466	la hermana	siostra	16	word	2022-04-05 12:56:31.904282
467	los hermanos	rodze??stwo	16	word	2022-04-05 12:56:31.904282
468	el ni??o	dziecko (ch??opiec)	16	word	2022-04-05 12:56:31.904282
469	la ni??a	dziecko (dziewczynka)	16	word	2022-04-05 12:56:31.904282
470	el hijo	syn	16	word	2022-04-05 12:56:31.904282
471	la hija	c??rka	16	word	2022-04-05 12:56:31.904282
472	los hijos	dzieci (potomstwo)	16	word	2022-04-05 12:56:31.904282
473	mayor	starszy	16	word	2022-04-05 12:56:31.904282
474	menor	m??odszy	16	word	2022-04-05 12:56:31.904282
475	el abuelo	dziadek	16	word	2022-04-05 12:56:31.904282
476	la abuela	babcia	16	word	2022-04-05 12:56:31.904282
477	el nieto	wnuk	16	word	2022-04-05 12:56:31.904282
478	la nieta	wnuczka	16	word	2022-04-05 12:56:31.904282
479	el t??o	wujek	16	word	2022-04-05 12:56:31.904282
480	la t??a	ciocia	16	word	2022-04-05 12:56:31.904282
481	el marido	m????	16	word	2022-04-05 12:56:31.904282
482	la mujer	??ona	16	word	2022-04-05 12:56:31.904282
483	cumplir	ko??czy?? (o latach)	16	word	2022-04-05 12:56:31.904282
484	el cumplea??os	urodziny	16	word	2022-04-05 12:56:31.904282
485	el santo	imieniny	16	word	2022-04-05 12:56:31.904282
486	la fiesta	przyj??cie	16	word	2022-04-05 12:56:31.904282
487	invitar	zaprasza??	16	word	2022-04-05 12:56:31.904282
488	la invitaci??n	zaproszenie	16	word	2022-04-05 12:56:31.904282
489	visitar	odwiedza??	16	word	2022-04-05 12:56:31.904282
490	la visita	odwiedziny	16	word	2022-04-05 12:56:31.904282
491	el hu??sped	go????	16	word	2022-04-05 12:56:31.904282
492	desear	??yczy??	16	word	2022-04-05 12:56:31.904282
493	el deseo	??yczenie	16	word	2022-04-05 12:56:31.904282
494	felicitar	winszowa??	16	word	2022-04-05 12:56:31.904282
495	la felicidad	szcz????cie	16	word	2022-04-05 12:56:31.904282
496	la sorpresa	niespodzianka	16	word	2022-04-05 12:56:31.904282
497	regalar	dawa?? w prezencie	16	word	2022-04-05 12:56:31.904282
498	el regalo	prezent	16	word	2022-04-05 12:56:31.904282
499	dar	dawa?? (nr)	16	word	2022-04-05 12:56:31.904282
500	recibir	dostawa??	16	word	2022-04-05 12:56:31.904282
501	de	od	16	word	2022-04-05 12:56:31.904282
502	para	dla	16	word	2022-04-05 12:56:31.904282
503	junto	????czny, z????czony	16	word	2022-04-05 12:56:31.904282
504	el ??rbol	drzewo	17	word	2022-04-05 12:57:26.223854
505	la palma	palma	17	word	2022-04-05 12:57:26.223854
506	la flor	kwiat	17	word	2022-04-05 12:57:26.223854
507	la rosa	r????a	17	word	2022-04-05 12:57:26.223854
508	plantar	sadzi??	17	word	2022-04-05 12:57:26.223854
509	la planta	ro??lina	17	word	2022-04-05 12:57:26.223854
510	crecer	rosn???? (c/zc)	17	word	2022-04-05 12:57:26.223854
511	la hierba	trawa	17	word	2022-04-05 12:57:26.223854
512	el jard??n	ogr??d	17	word	2022-04-05 12:57:26.223854
513	el jardinero	ogrodnik	17	word	2022-04-05 12:57:26.223854
514	la verdura	warzywo	17	word	2022-04-05 12:57:26.223854
515	la patata	ziemniak	17	word	2022-04-05 12:57:26.223854
516	la zanahoria	marchewka	17	word	2022-04-05 12:57:26.223854
517	el pepino	og??rek	17	word	2022-04-05 12:57:26.223854
518	el tomate	pomidor	17	word	2022-04-05 12:57:26.223854
519	la cebolla	cebula	17	word	2022-04-05 12:57:26.223854
520	el pimiento	papryka	17	word	2022-04-05 12:57:26.223854
521	la fruta	owoc	17	word	2022-04-05 12:57:26.223854
522	la manzana	jab??ko	17	word	2022-04-05 12:57:26.223854
523	la pera	gruszka	17	word	2022-04-05 12:57:26.223854
524	la fresa	truskawka	17	word	2022-04-05 12:57:26.223854
525	la fresa del bosque	poziomka	17	word	2022-04-05 12:57:26.223854
526	la uva	winogrono	17	word	2022-04-05 12:57:26.223854
527	la naranja	pomara??cza	17	word	2022-04-05 12:57:26.223854
528	el lim??n	cytryna	17	word	2022-04-05 12:57:26.223854
529	el pl??tano	banan	17	word	2022-04-05 12:57:26.223854
530	el amigo	przyjaciel	18	word	2022-04-05 12:57:58.275763
531	querer	lubi??, kocha?? (e/ie)	18	word	2022-04-05 12:57:58.275763
532	querido	kochany	18	word	2022-04-05 12:57:58.275763
533	amar	kocha??	18	word	2022-04-05 12:57:58.275763
534	el amor	mi??o????	18	word	2022-04-05 12:57:58.275763
535	besar	ca??owa??	18	word	2022-04-05 12:57:58.275763
536	el beso	poca??unek	18	word	2022-04-05 12:57:58.275763
537	odiar	nienawidzi??	18	word	2022-04-05 12:57:58.275763
538	el odio	nienawi????	18	word	2022-04-05 12:57:58.275763
539	alegrarse	cieszy?? si??	18	word	2022-04-05 12:57:58.275763
540	la alegr??a	rado????	18	word	2022-04-05 12:57:58.275763
541	alegre	weso??y	18	word	2022-04-05 12:57:58.275763
542	feliz	szcz????liwy	18	word	2022-04-05 12:57:58.275763
543	infeliz	nieszcz????liwy	18	word	2022-04-05 12:57:58.275763
544	la broma	??art	18	word	2022-04-05 12:57:58.275763
545	re??r	??mia?? si?? (nr)	18	word	2022-04-05 12:57:58.275763
546	la risa	??miech	18	word	2022-04-05 12:57:58.275763
547	llorar	p??aka??	18	word	2022-04-05 12:57:58.275763
548	triste	smutny	18	word	2022-04-05 12:57:58.275763
549	esperar	mie?? nadziej??	18	word	2022-04-05 12:57:58.275763
550	la esperanza	nadzieja	18	word	2022-04-05 12:57:58.275763
551	el miedo	strach	18	word	2022-04-05 12:57:58.275763
552	horrible	straszny	18	word	2022-04-05 12:57:58.275763
553	el nombre	imi??, nazwa	19	word	2022-04-05 12:59:02.686929
554	el apellido	nazwisko	19	word	2022-04-05 12:59:02.686929
555	la nacionalidad	narodowo????	19	word	2022-04-05 12:59:02.686929
556	el sexo	p??e??	19	word	2022-04-05 12:59:02.686929
557	nacer	urodzi?? si?? (c/zc)	19	word	2022-04-05 12:59:02.686929
558	el nacimiento	narodziny	19	word	2022-04-05 12:59:02.686929
559	el lugar	miejsce (l)	19	word	2022-04-05 12:59:02.686929
560	morir	umiera?? (o/ue)	19	word	2022-04-05 12:59:02.686929
561	la muerte	??mier??	19	word	2022-04-05 12:59:02.686929
562	la fecha	data	19	word	2022-04-05 12:59:02.686929
563	correcto	poprawny	19	word	2022-04-05 12:59:02.686929
564	falso	b????dny	19	word	2022-04-05 12:59:02.686929
565	el documento	dokument	19	word	2022-04-05 12:59:02.686929
566	el formulario	formularz	19	word	2022-04-05 12:59:02.686929
567	necesario	konieczny	19	word	2022-04-05 12:59:02.686929
568	desgraciadamente	niestety	19	word	2022-04-05 12:59:02.686929
569	vivir	??y??	20	word	2022-04-05 13:00:11.408633
570	la vida	??ycie	20	word	2022-04-05 13:00:11.408633
571	sano	zdrowy	20	word	2022-04-05 13:00:11.408633
572	la salud	zdrowie	20	word	2022-04-05 13:00:11.408633
573	enfermo	chory	20	word	2022-04-05 13:00:11.408633
574	la enfermedad	choroba	20	word	2022-04-05 13:00:11.408633
575	romper	??ama??	20	word	2022-04-05 13:00:11.408633
576	el m??dico	doktor	20	word	2022-04-05 13:00:11.408633
577	llamar	wo??a??, wzywa??	20	word	2022-04-05 13:00:11.408633
578	el socorro	ratunek, pomoc	20	word	2022-04-05 13:00:11.408633
579	el hospital	szpital	20	word	2022-04-05 13:00:11.408633
580	la enfermera	piel??gniarka	20	word	2022-04-05 13:00:11.408633
581	ayudar	pomaga??	20	word	2022-04-05 13:00:11.408633
582	la ayuda	pomoc	20	word	2022-04-05 13:00:11.408633
583	el dentista	dentysta	20	word	2022-04-05 13:00:11.408633
584	poder	m??c (o/ue)	20	word	2022-04-05 13:00:11.408633
585	pasar	zdarza?? si??	20	word	2022-04-05 13:00:11.408633
586	bien	dobrze	20	word	2022-04-05 13:00:11.408633
587	mal	??le	20	word	2022-04-05 13:00:11.408633
588	sentir	czu??	20	word	2022-04-05 13:00:11.408633
589	doler	bole?? (o/ue)	20	word	2022-04-05 13:00:11.408633
590	el dolor	b??l	20	word	2022-04-05 13:00:11.408633
591	toser	kaszle??	20	word	2022-04-05 13:00:11.408633
592	la tos	kaszel	20	word	2022-04-05 13:00:11.408633
593	el catarro	katar	20	word	2022-04-05 13:00:11.408633
594	la fiebre	gor??czka	20	word	2022-04-05 13:00:11.408633
595	el term??metro	termometr	20	word	2022-04-05 13:00:11.408633
596	la gripe	grypa	20	word	2022-04-05 13:00:11.408633
597	el medicamento	lekarstwo	20	word	2022-04-05 13:00:11.408633
598	la pastilla	tabletka	20	word	2022-04-05 13:00:11.408633
599	la aspirina	aspiryna	20	word	2022-04-05 13:00:11.408633
600	fumar	pali??	20	word	2022-04-05 13:00:11.408633
601	el cigarrillo	papieros	20	word	2022-04-05 13:00:11.408633
602	el animal	zwierz??	21	word	2022-04-05 13:00:57.441064
603	el perro	pies	21	word	2022-04-05 13:00:57.441064
604	el gato	kot	21	word	2022-04-05 13:00:57.441064
605	la vaca	krowa	21	word	2022-04-05 13:00:57.441064
606	el toro	byk	21	word	2022-04-05 13:00:57.441064
607	el caballo	ko??	21	word	2022-04-05 13:00:57.441064
608	la oveja	owca	21	word	2022-04-05 13:00:57.441064
609	el cerdo	??winia	21	word	2022-04-05 13:00:57.441064
610	el rat??n	mysz	21	word	2022-04-05 13:00:57.441064
611	el pez	ryba	21	word	2022-04-05 13:00:57.441064
612	los peces	ryby	21	word	2022-04-05 13:00:57.441064
613	la rana	??aba	21	word	2022-04-05 13:00:57.441064
614	el p??jaro	ptak	21	word	2022-04-05 13:00:57.441064
615	el papagayo	papuga	21	word	2022-04-05 13:00:57.441064
616	el pollo	kurczak	21	word	2022-04-05 13:00:57.441064
617	la pata	kaczka	21	word	2022-04-05 13:00:57.441064
618	el zorro	lis	21	word	2022-04-05 13:00:57.441064
619	el lobo	wilk	21	word	2022-04-05 13:00:57.441064
620	el oso	nied??wied??	21	word	2022-04-05 13:00:57.441064
621	el zool??gico	ogr??d zoologiczny	21	word	2022-04-05 13:00:57.441064
622	salvaje	dziki	21	word	2022-04-05 13:00:57.441064
623	el le??n	lew	21	word	2022-04-05 13:00:57.441064
624	el tigre	tygrys	21	word	2022-04-05 13:00:57.441064
625	el elefante	s??o??	21	word	2022-04-05 13:00:57.441064
626	la jirafa	??yrafa	21	word	2022-04-05 13:00:57.441064
627	el cocodrilo	krokodyl	21	word	2022-04-05 13:00:57.441064
628	el mono	ma??pa	21	word	2022-04-05 13:00:57.441064
629	trabajar	pracowa??	22	word	2022-04-05 13:01:31.503793
630	el trabajo	praca	22	word	2022-04-05 13:01:31.503793
631	el trabajador	pracownik	22	word	2022-04-05 13:01:31.503793
632	la profesi??n	zaw??d	22	word	2022-04-05 13:01:31.503793
633	profesional	zawodowy	22	word	2022-04-05 13:01:31.503793
634	hacer	robi?? (1g)	22	word	2022-04-05 13:01:31.503793
635	la secretar??a	sekretariat	22	word	2022-04-05 13:01:31.503793
636	la secretaria	sekretarka	22	word	2022-04-05 13:01:31.503793
637	la oficina	biuro	22	word	2022-04-05 13:01:31.503793
638	el jefe	szef	22	word	2022-04-05 13:01:31.503793
639	el director	dyrektor	22	word	2022-04-05 13:01:31.503793
640	el ingeniero	in??ynier	22	word	2022-04-05 13:01:31.503793
641	ganar	zarabia??	22	word	2022-04-05 13:01:31.503793
642	cansado	zm??czony	22	word	2022-04-05 13:01:31.503793
643	la azafata	stewardesa	22	word	2022-04-05 13:01:31.503793
644	el camarero	kelner	22	word	2022-04-05 13:01:31.503793
645	el peluquero	fryzjer	22	word	2022-04-05 13:01:31.503793
646	el arquitecto	architekt	22	word	2022-04-05 13:01:31.503793
647	el bombero	stra??ak	22	word	2022-04-05 13:01:31.503793
648	el mec??nico	mechanik	22	word	2022-04-05 13:01:31.503793
649	el abogado	adwokat	22	word	2022-04-05 13:01:31.503793
650	la tienda	sklep	23	word	2022-04-05 13:02:08.294458
651	el quiosco	kiosk	23	word	2022-04-05 13:02:08.294458
652	la farmacia	apteka	23	word	2022-04-05 13:02:08.294458
653	la librer??a	ksi??garnia	23	word	2022-04-05 13:02:08.294458
654	la carnicer??a	sklep mi??sny	23	word	2022-04-05 13:02:08.294458
655	la pescader??a	sklep rybny	23	word	2022-04-05 13:02:08.294458
656	la panader??a	piekarnia	23	word	2022-04-05 13:02:08.294458
657	el panadero	piekarz	23	word	2022-04-05 13:02:08.294458
658	la pasteler??a	cukiernia	23	word	2022-04-05 13:02:08.294458
659	el pastelero	cukiernik	23	word	2022-04-05 13:02:08.294458
660	la zapater??a	zak??ad szewski	23	word	2022-04-05 13:02:08.294458
661	el zapatero	szewc	23	word	2022-04-05 13:02:08.294458
662	la relojer??a	zak??ad zegarmistrzowski	23	word	2022-04-05 13:02:08.294458
663	el relojero	zegarmistrz	23	word	2022-04-05 13:02:08.294458
664	abrir	otwiera??	23	word	2022-04-05 13:02:08.294458
665	cerrar	zamyka?? (e/ie)	23	word	2022-04-05 13:02:08.294458
666	el mercado	targ	23	word	2022-04-05 13:02:08.294458
667	comprar	kupowa??	23	word	2022-04-05 13:02:08.294458
668	las compras	zakupy	23	word	2022-04-05 13:02:08.294458
669	vender	sprzedawa??	23	word	2022-04-05 13:02:08.294458
670	el vendedor	sprzedawca	23	word	2022-04-05 13:02:08.294458
671	la caja	kasa	23	word	2022-04-05 13:02:08.294458
672	el cajero	kasjer	23	word	2022-04-05 13:02:08.294458
673	el dependiente	ekspedient	23	word	2022-04-05 13:02:08.294458
674	el cliente	klient	23	word	2022-04-05 13:02:08.294458
675	necesitar	potrzebowa??	23	word	2022-04-05 13:02:08.294458
676	querer	chcie?? (e/ie)	23	word	2022-04-05 13:02:08.294458
677	cu??l	kt??ry?	23	word	2022-04-05 13:02:08.294458
678	mirar	patrze??	23	word	2022-04-05 13:02:08.294458
679	gustar	podoba?? si??	23	word	2022-04-05 13:02:08.294458
680	mucho	bardzo	23	word	2022-04-05 13:02:08.294458
681	muy	bardzo (przed przymiotnikiem i przys????wkiem)	23	word	2022-04-05 13:02:08.294458
682	contento	zadowolony	23	word	2022-04-05 13:02:08.294458
683	descontento	niezadowolony	23	word	2022-04-05 13:02:08.294458
684	cambiar	zmienia??, zamienia??	23	word	2022-04-05 13:02:08.294458
685	el cambio	zmiana, zamiana	23	word	2022-04-05 13:02:08.294458
686	la higiene	higiena	24	word	2022-04-05 13:03:54.360375
687	la pasta de dientes	pasta do z??b??w	24	word	2022-04-05 13:03:54.360375
688	lavar	my??	24	word	2022-04-05 13:03:54.360375
689	el jab??n	myd??o	24	word	2022-04-05 13:03:54.360375
690	el champ??	szampon	24	word	2022-04-05 13:03:54.360375
691	peinar	czesa??	24	word	2022-04-05 13:03:54.360375
692	el peine	grzebie??	24	word	2022-04-05 13:03:54.360375
693	la crema	krem	24	word	2022-04-05 13:03:54.360375
694	afeitarse	goli?? si??	24	word	2022-04-05 13:03:54.360375
695	la ducha	prysznic	24	word	2022-04-05 13:03:54.360375
696	la toalla	r??cznik	24	word	2022-04-05 13:03:54.360375
697	mojado	mokry	24	word	2022-04-05 13:03:54.360375
698	seco	suchy	24	word	2022-04-05 13:03:54.360375
699	acostarse	k??a???? si?? (o/ue)	24	word	2022-04-05 13:03:54.360375
700	dormir	spa?? (o/ue)	24	word	2022-04-05 13:03:54.360375
701	despertar	budzi?? (e/ie)	24	word	2022-04-05 13:03:54.360375
702	levantarse	wstawa??	24	word	2022-04-05 13:03:54.360375
703	la siesta	sjesta	24	word	2022-04-05 13:03:54.360375
704	ir	i????, jecha?? (nr)	25	word	2022-04-05 13:05:01.453952
705	donde	gdzie	25	word	2022-04-05 13:05:01.453952
706	d??nde	gdzie?	25	word	2022-04-05 13:05:01.453952
707	ad??nde	dok??d?	25	word	2022-04-05 13:05:01.453952
708	a	do (po??o??enie)	25	word	2022-04-05 13:05:01.453952
709	aqu??	tutaj	25	word	2022-04-05 13:05:01.453952
710	all??	tam	25	word	2022-04-05 13:05:01.453952
711	cercano	bliski	25	word	2022-04-05 13:05:01.453952
712	cerca	blisko	25	word	2022-04-05 13:05:01.453952
713	lejano	daleki	25	word	2022-04-05 13:05:01.453952
714	lejos	daleko	25	word	2022-04-05 13:05:01.453952
715	detr??s	za	25	word	2022-04-05 13:05:01.453952
716	delante	przed (d) (odno??nie po??o??enia)	25	word	2022-04-05 13:05:01.453952
717	al lado	obok	25	word	2022-04-05 13:05:01.453952
718	enfrente	naprzeciwko	25	word	2022-04-05 13:05:01.453952
719	entre	pomi??dzy	25	word	2022-04-05 13:05:01.453952
720	el centro	??rodek	25	word	2022-04-05 13:05:01.453952
721	derecho	prawy	25	word	2022-04-05 13:05:01.453952
722	izquierdo	lewy	25	word	2022-04-05 13:05:01.453952
723	entrar	wchodzi??	25	word	2022-04-05 13:05:01.453952
724	la entrada	wej??cie	25	word	2022-04-05 13:05:01.453952
725	salir	wychodzi?? (1g)	25	word	2022-04-05 13:05:01.453952
726	la salida	wyj??cie	25	word	2022-04-05 13:05:01.453952
727	venir	przychodzi?? (1g)	25	word	2022-04-05 13:05:01.453952
728	en	w	25	word	2022-04-05 13:05:01.453952
729	quedar	zostawa??	25	word	2022-04-05 13:05:01.453952
730	sentar	sadza?? (e/ie)	25	word	2022-04-05 13:05:01.453952
731	estar sentado	siedzie??	25	word	2022-04-05 13:05:01.453952
732	sentarse	siada?? (e/ie)	25	word	2022-04-05 13:05:01.453952
733	poner	k??a???? (1g)	25	word	2022-04-05 13:05:01.453952
734	encima	nad, na	25	word	2022-04-05 13:05:01.453952
735	debajo	pod	25	word	2022-04-05 13:05:01.453952
736	meter	wk??ada??	25	word	2022-04-05 13:05:01.453952
737	sacar	wyjmowa??, wyci??ga??	25	word	2022-04-05 13:05:01.453952
738	colgar	wiesza??, wisie?? (o/ue)	25	word	2022-04-05 13:05:01.453952
739	por	przez	25	word	2022-04-05 13:05:01.453952
740	subir	wspina?? si??, wchodzi??	25	word	2022-04-05 13:05:01.453952
741	bajar	schodzi??	25	word	2022-04-05 13:05:01.453952
742	arriba	w g??rze, na g??rze	25	word	2022-04-05 13:05:01.453952
743	abajo	na dole	25	word	2022-04-05 13:05:01.453952
744	el este	wsch??d (kierunek)	25	word	2022-04-05 13:05:01.453952
745	el oeste	zach??d (kierunek)	25	word	2022-04-05 13:05:01.453952
746	el norte	p????noc (kierunek)	25	word	2022-04-05 13:05:01.453952
747	el sur	po??udnie (kierunek)	25	word	2022-04-05 13:05:01.453952
748	conducir	kierowa?? (c/zc)	26	word	2022-04-05 13:05:54.494618
749	el conductor	kierowca	26	word	2022-04-05 13:05:54.494618
750	despacio	wolno	26	word	2022-04-05 13:05:54.494618
751	deprisa	szybko	26	word	2022-04-05 13:05:54.494618
752	el coche	samoch??d	26	word	2022-04-05 13:05:54.494618
753	la motocicleta	motocykl	26	word	2022-04-05 13:05:54.494618
754	lento	wolny, powolny	26	word	2022-04-05 13:05:54.494618
755	r??pido	szybki	26	word	2022-04-05 13:05:54.494618
756	la carretera	szosa	26	word	2022-04-05 13:05:54.494618
757	a pie	pieszo	26	word	2022-04-05 13:05:54.494618
758	la estaci??n	stacja, dworzec	26	word	2022-04-05 13:05:54.494618
759	el billete	bilet	26	word	2022-04-05 13:05:54.494618
760	el tren	poci??g	26	word	2022-04-05 13:05:54.494618
761	esperar	czeka??	26	word	2022-04-05 13:05:54.494618
762	puntual	punktualny	26	word	2022-04-05 13:05:54.494618
763	el sitio	miejsce (s)	26	word	2022-04-05 13:05:54.494618
764	libre	wolny (o miejscu)	26	word	2022-04-05 13:05:54.494618
765	ocupado	zaj??ty (o miejscu)	26	word	2022-04-05 13:05:54.494618
766	atenci??n	uwaga	26	word	2022-04-05 13:05:54.494618
767	el barco	statek	26	word	2022-04-05 13:05:54.494618
768	el puerto	port	26	word	2022-04-05 13:05:54.494618
769	volar	lata?? (o/ue)	26	word	2022-04-05 13:05:54.494618
770	el vuelo	lot	26	word	2022-04-05 13:05:54.494618
771	el avi??n	samolot	26	word	2022-04-05 13:05:54.494618
772	el piloto	pilot	26	word	2022-04-05 13:05:54.494618
773	el aeropuerto	lotnisko	26	word	2022-04-05 13:05:54.494618
774	el pa??s	kraj	27	word	2022-04-05 13:07:01.540044
775	ser de	pochodzi?? z (nr)	27	word	2022-04-05 13:07:01.540044
776	hablar	m??wi??	27	word	2022-04-05 13:07:01.540044
777	saber	zna??, umie?? (nr)	27	word	2022-04-05 13:07:01.540044
778	traducir	t??umaczy?? (c/zc)	27	word	2022-04-05 13:07:01.540044
779	la traducci??n	t??umaczenie	27	word	2022-04-05 13:07:01.540044
780	el traductor	t??umacz	27	word	2022-04-05 13:07:01.540044
781	el espa??ol	hiszpa??ski (j??zyk)	27	word	2022-04-05 13:07:01.540044
782	el polaco	polski (j??zyk)	27	word	2022-04-05 13:07:01.540044
783	el ingl??s	angielski (j??zyk)	27	word	2022-04-05 13:07:01.540044
784	el alem??n	niemiecki (j??zyk)	27	word	2022-04-05 13:07:01.540044
785	el franc??s	francuski (j??zyk)	27	word	2022-04-05 13:07:01.540044
786	el italiano	w??oski (j??zyk)	27	word	2022-04-05 13:07:01.540044
787	el ruso	rosyjski (j??zyk)	27	word	2022-04-05 13:07:01.540044
788	el diccionario	s??ownik	27	word	2022-04-05 13:07:01.540044
789	la lengua	j??zyk, mowa	27	word	2022-04-05 13:07:01.540044
790	la lengua materna	j??zyk ojczysty	27	word	2022-04-05 13:07:01.540044
791	el idioma	j??zyk	27	word	2022-04-05 13:07:01.540044
792	el extranjero	zagranica	27	word	2022-04-05 13:07:01.540044
793	el extranjero	cudzoziemiec	27	word	2022-04-05 13:07:01.540044
794	extranjero	zagraniczny	27	word	2022-04-05 13:07:01.540044
795	Polonia	Polska	27	word	2022-04-05 13:07:01.540044
796	Espa??a	Hiszpania	27	word	2022-04-05 13:07:01.540044
797	Inglaterra	Anglia	27	word	2022-04-05 13:07:01.540044
798	Alemania	Niemcy	27	word	2022-04-05 13:07:01.540044
799	Francia	Francja	27	word	2022-04-05 13:07:01.540044
800	Italia	W??ochy	27	word	2022-04-05 13:07:01.540044
801	Rusia	Rosja	27	word	2022-04-05 13:07:01.540044
802	los Estados Unidos de Am??rica	Stany Zjednoczone Ameryki (USA)	27	word	2022-04-05 13:07:01.540044
803	el estado	pa??stwo	28	word	2022-04-05 13:07:30.426962
804	estatal	pa??stwowy	28	word	2022-04-05 13:07:30.426962
805	la libertad	wolno????	28	word	2022-04-05 13:07:30.426962
806	libre	wolny	28	word	2022-04-05 13:07:30.426962
807	el presidente	prezydent	28	word	2022-04-05 13:07:30.426962
808	el parlamento	parlament	28	word	2022-04-05 13:07:30.426962
809	el ministro	minister	28	word	2022-04-05 13:07:30.426962
810	gobernar	rz??dzi?? (e/ie)	28	word	2022-04-05 13:07:30.426962
811	el gobierno	rz??d	28	word	2022-04-05 13:07:30.426962
812	la naci??n	nar??d	28	word	2022-04-05 13:07:30.426962
813	nacional	narodowy	28	word	2022-04-05 13:07:30.426962
814	internacional	mi??dzynarodowy	28	word	2022-04-05 13:07:30.426962
815	la pol??tica	polityka	28	word	2022-04-05 13:07:30.426962
816	el pol??tico	polityk	28	word	2022-04-05 13:07:30.426962
817	pol??tico	polityczny	28	word	2022-04-05 13:07:30.426962
818	el partido	partia	28	word	2022-04-05 13:07:30.426962
819	organizar	organizowa??	28	word	2022-04-05 13:07:30.426962
820	la organizaci??n	organizacja	28	word	2022-04-05 13:07:30.426962
821	robar	kra????	28	word	2022-04-05 13:07:30.426962
822	el robo	kradzie??	28	word	2022-04-05 13:07:30.426962
823	el ladr??n	z??odziej	28	word	2022-04-05 13:07:30.426962
824	la polic??a	policja	28	word	2022-04-05 13:07:30.426962
825	el polic??a	policjant	28	word	2022-04-05 13:07:30.426962
826	el tribunal	s??d	28	word	2022-04-05 13:07:30.426962
827	el juez	s??dzia	28	word	2022-04-05 13:07:30.426962
828	el derecho	prawo	28	word	2022-04-05 13:07:30.426962
829	el problema	problem	28	word	2022-04-05 13:07:30.426962
830	el alcohol	alkohol	28	word	2022-04-05 13:07:30.426962
831	el tabaco	tyto??	28	word	2022-04-05 13:07:30.426962
832	la droga	narkotyk	28	word	2022-04-05 13:07:30.426962
833	la situaci??n	sytuacja	28	word	2022-04-05 13:07:30.426962
834	la pobreza	bieda	28	word	2022-04-05 13:07:30.426962
835	pobre	biedny	28	word	2022-04-05 13:07:30.426962
836	la riqueza	bogactwo	28	word	2022-04-05 13:07:30.426962
837	rico	bogaty	28	word	2022-04-05 13:07:30.426962
838	el deporte	sport	29	word	2022-04-05 13:08:13.39932
839	el deportista	sportowiec	29	word	2022-04-05 13:08:13.39932
840	la pelota	pi??ka (p)	29	word	2022-04-05 13:08:13.39932
841	echar	rzuca??	29	word	2022-04-05 13:08:13.39932
842	coger	??apa??, chwyta??	29	word	2022-04-05 13:08:13.39932
843	jugar	gra?? (u/ue)	29	word	2022-04-05 13:08:13.39932
844	el juego	gra	29	word	2022-04-05 13:08:13.39932
845	el jugador	gracz	29	word	2022-04-05 13:08:13.39932
846	el f??tbol	pi??ka no??na (gra)	29	word	2022-04-05 13:08:13.39932
847	el futbolista	pi??karz	29	word	2022-04-05 13:08:13.39932
848	el bal??n	pi??ka (b)	29	word	2022-04-05 13:08:13.39932
849	el voleibol	siatk??wka	29	word	2022-04-05 13:08:13.39932
850	el baloncesto	koszyk??wka	29	word	2022-04-05 13:08:13.39932
851	el equipo	dru??yna	29	word	2022-04-05 13:08:13.39932
852	el partido	mecz	29	word	2022-04-05 13:08:13.39932
853	el estadio	stadion	29	word	2022-04-05 13:08:13.39932
854	correr	biega??	29	word	2022-04-05 13:08:13.39932
855	el ejercicio	??wiczenie	29	word	2022-04-05 13:08:13.39932
856	d??bil	s??aby	29	word	2022-04-05 13:08:13.39932
857	la fuerza	si??a	29	word	2022-04-05 13:08:13.39932
858	fuerte	silny	29	word	2022-04-05 13:08:13.39932
859	esquiar	je??dzi?? na nartach	29	word	2022-04-05 13:08:13.39932
860	el esqu??	narta, narciarstwo	29	word	2022-04-05 13:08:13.39932
861	el tenis	tenis	29	word	2022-04-05 13:08:13.39932
862	el tenista	tenisista	29	word	2022-04-05 13:08:13.39932
863	nadar	p??ywa??	29	word	2022-04-05 13:08:13.39932
864	la nataci??n	p??ywanie	29	word	2022-04-05 13:08:13.39932
865	la piscina	basen	29	word	2022-04-05 13:08:13.39932
866	la bicicleta	rower	29	word	2022-04-05 13:08:13.39932
867	interesarse	interesowa?? si??	29	word	2022-04-05 13:08:13.39932
868	interesante	interesuj??cy	29	word	2022-04-05 13:08:13.39932
1607	la obra	sztuka	51	word	2022-04-05 20:29:41.874472
869	pasear	spacerowa??	29	word	2022-04-05 13:08:13.39932
870	el paseo	spacer	29	word	2022-04-05 13:08:13.39932
871	aburrirse	nudzi?? si??	29	word	2022-04-05 13:08:13.39932
872	aburrido	nudny, znudzony	29	word	2022-04-05 13:08:13.39932
873	la carta	karta (c )	29	word	2022-04-05 13:08:13.39932
874	el ajedrez	szachy	29	word	2022-04-05 13:08:13.39932
875	gustar	lubi??	29	word	2022-04-05 13:08:13.39932
876	la discoteca	dyskoteka	29	word	2022-04-05 13:08:13.39932
877	divertirse	bawi?? si??, oddawa?? si?? rozrywce	29	word	2022-04-05 13:08:13.39932
878	la diversi??n	rozrywka	29	word	2022-04-05 13:08:13.39932
879	la religi??n	religia	30	word	2022-04-05 13:09:16.197338
880	religioso	religijny	30	word	2022-04-05 13:09:16.197338
881	creer	wierzy??	30	word	2022-04-05 13:09:16.197338
882	Dios	B??g	30	word	2022-04-05 13:09:16.197338
883	la fiesta	??wi??to	30	word	2022-04-05 13:09:16.197338
884	la Navidad	Bo??e Narodzenie	30	word	2022-04-05 13:09:16.197338
885	decorar	ozdabia??, dekorowa??	30	word	2022-04-05 13:09:16.197338
886	Papa Noel	??wi??ty Miko??aj	30	word	2022-04-05 13:09:16.197338
887	la Nochebuena	Wigilia	30	word	2022-04-05 13:09:16.197338
888	el villancico	kol??da	30	word	2022-04-05 13:09:16.197338
889	el ??ngel	anio??	30	word	2022-04-05 13:09:16.197338
890	el diablo	diabe??	30	word	2022-04-05 13:09:16.197338
891	el bel??n	szopka	30	word	2022-04-05 13:09:16.197338
892	la iglesia	ko??ci????	30	word	2022-04-05 13:09:16.197338
893	la cruz	krzy??	30	word	2022-04-05 13:09:16.197338
894	la misa	msza	30	word	2022-04-05 13:09:16.197338
895	el cura	ksi??dz	30	word	2022-04-05 13:09:16.197338
896	el rey	kr??l	30	word	2022-04-05 13:09:16.197338
897	la reina	kr??lowa	30	word	2022-04-05 13:09:16.197338
898	la Pascua	Wielkanoc	30	word	2022-04-05 13:09:16.197338
899	la cultura	kultura	31	word	2022-04-05 13:09:49.740845
900	cultural	kulturalny	31	word	2022-04-05 13:09:49.740845
901	el museo	muzeum	31	word	2022-04-05 13:09:49.740845
902	el cuadro	obraz	31	word	2022-04-05 13:09:49.740845
903	pintar	malowa??	31	word	2022-04-05 13:09:49.740845
904	el pintor	malarz	31	word	2022-04-05 13:09:49.740845
905	el arte	sztuka	31	word	2022-04-05 13:09:49.740845
906	dibujar	rysowa??	31	word	2022-04-05 13:09:49.740845
907	el dibujo	rysunek	31	word	2022-04-05 13:09:49.740845
908	la fotograf??a	zdj??cie, fotografia	31	word	2022-04-05 13:09:49.740845
909	la c??mara	kamera	31	word	2022-04-05 13:09:49.740845
910	el cine	kino	31	word	2022-04-05 13:09:49.740845
911	la pel??cula	film	31	word	2022-04-05 13:09:49.740845
912	el teatro	teatr	31	word	2022-04-05 13:09:49.740845
913	el actor	aktor	31	word	2022-04-05 13:09:49.740845
914	la actriz	aktorka	31	word	2022-04-05 13:09:49.740845
915	bailar	ta??czy??	31	word	2022-04-05 13:09:49.740845
916	el baile	taniec	31	word	2022-04-05 13:09:49.740845
917	el bailar??n	tancerz	31	word	2022-04-05 13:09:49.740845
918	la bailarina	tancerka	31	word	2022-04-05 13:09:49.740845
919	la m??sica	muzyka	31	word	2022-04-05 13:09:49.740845
920	el m??sico	muzyk	31	word	2022-04-05 13:09:49.740845
921	cl??sico	klasyczny	31	word	2022-04-05 13:09:49.740845
922	escuchar	s??ucha??	31	word	2022-04-05 13:09:49.740845
923	tocar	gra?? na instrumencie	31	word	2022-04-05 13:09:49.740845
924	el piano	pianino	31	word	2022-04-05 13:09:49.740845
925	la guitarra	gitara	31	word	2022-04-05 13:09:49.740845
926	el grupo	grupa	31	word	2022-04-05 13:09:49.740845
927	el concierto	koncert	31	word	2022-04-05 13:09:49.740845
928	cantar	??piewa??	31	word	2022-04-05 13:09:49.740845
929	la canci??n	piosenka	31	word	2022-04-05 13:09:49.740845
930	la cantante	piosenkarka	31	word	2022-04-05 13:09:49.740845
931	el cantante	piosenkarz	31	word	2022-04-05 13:09:49.740845
932	la maravilla	cud	31	word	2022-04-05 13:09:49.740845
933	maravilloso	cudowny	31	word	2022-04-05 13:09:49.740845
934	la madera	drewno	32	word	2022-04-05 13:12:07.624276
935	el cristal	szk??o	32	word	2022-04-05 13:12:07.624276
936	el metal	metal	32	word	2022-04-05 13:12:07.624276
937	la plata	srebro	32	word	2022-04-05 13:12:07.624276
938	el oro	z??oto	32	word	2022-04-05 13:12:07.624276
939	el cuero	sk??ra (materia??)	32	word	2022-04-05 13:12:07.624276
940	el papel	papier	32	word	2022-04-05 13:12:07.624276
941	el pl??stico	plastik	32	word	2022-04-05 13:12:07.624276
942	duro	twardy	32	word	2022-04-05 13:12:07.624276
943	blando	mi??kki	32	word	2022-04-05 13:12:07.624276
944	las finanzas	finanse	33	word	2022-04-05 13:13:05.998821
945	el dinero	pieni??dze	33	word	2022-04-05 13:13:05.998821
946	tener	mie?? (nr)	33	word	2022-04-05 13:13:05.998821
947	costar	kosztowa?? (o/ue)	33	word	2022-04-05 13:13:05.998821
948	el precio	cena	33	word	2022-04-05 13:13:05.998821
949	barato	tani	33	word	2022-04-05 13:13:05.998821
950	caro	drogi	33	word	2022-04-05 13:13:05.998821
951	bastante	dosy??	33	word	2022-04-05 13:13:05.998821
952	gratuito	darmowy, bezp??atny	33	word	2022-04-05 13:13:05.998821
953	la cuenta	rachunek	33	word	2022-04-05 13:13:05.998821
954	pagar	p??aci??	33	word	2022-04-05 13:13:05.998821
955	gastar	wydawa??	33	word	2022-04-05 13:13:05.998821
956	el gasto	wydatek	33	word	2022-04-05 13:13:05.998821
957	casi	prawie	33	word	2022-04-05 13:13:05.998821
958	prestar	po??ycza??	33	word	2022-04-05 13:13:05.998821
959	ahorrar	oszcz??dza??	33	word	2022-04-05 13:13:05.998821
960	los ahorros	oszcz??dno??ci	33	word	2022-04-05 13:13:05.998821
961	el banco	bank	33	word	2022-04-05 13:13:05.998821
962	bancario	bankowy	33	word	2022-04-05 13:13:05.998821
963	cambiar dinero	wymienia?? pieni??dze	33	word	2022-04-05 13:13:05.998821
964	la industria	przemys??	33	word	2022-04-05 13:13:05.998821
965	industrial	przemys??owy	33	word	2022-04-05 13:13:05.998821
966	fabricar	produkowa??	33	word	2022-04-05 13:13:05.998821
967	la f??brica	fabryka	33	word	2022-04-05 13:13:05.998821
968	la empresa	firma, przedsi??biorstwo	33	word	2022-04-05 13:13:05.998821
969	el empresario	przedsi??biorca	33	word	2022-04-05 13:13:05.998821
970	privado	prywatny	33	word	2022-04-05 13:13:05.998821
971	p??blico	publiczny	33	word	2022-04-05 13:13:05.998821
972	el negocio	biznes, interes	33	word	2022-04-05 13:13:05.998821
973	comerciar	handlowa??	33	word	2022-04-05 13:13:05.998821
974	el comercio	handel	33	word	2022-04-05 13:13:05.998821
975	la guerra	wojna	34	word	2022-04-05 13:13:37.612712
976	la paz	pok??j	34	word	2022-04-05 13:13:37.612712
977	el soldado	??o??nierz	34	word	2022-04-05 13:13:37.612712
978	disparar	strzela??	34	word	2022-04-05 13:13:37.612712
979	el disparo	strza??	34	word	2022-04-05 13:13:37.612712
980	la pistola	pistolet	34	word	2022-04-05 13:13:37.612712
981	la bomba	bomba	34	word	2022-04-05 13:13:37.612712
982	el fuego	ogie??	34	word	2022-04-05 13:13:37.612712
983	la cat??strofe	katastrofa	34	word	2022-04-05 13:13:37.612712
984	el peligro	niebezpiecze??stwo	34	word	2022-04-05 13:13:37.612712
985	peligroso	niebezpieczny	34	word	2022-04-05 13:13:37.612712
986	la seguridad	bezpiecze??stwo	34	word	2022-04-05 13:13:37.612712
987	seguro	bezpieczny	34	word	2022-04-05 13:13:37.612712
988	el cuidado	ostro??no????	34	word	2022-04-05 13:13:37.612712
989	el silencio	cisza	35	word	2022-04-05 13:14:34.389124
990	bajo	cichy	35	word	2022-04-05 13:14:34.389124
991	el ruido	ha??as	35	word	2022-04-05 13:14:34.389124
992	alto	g??o??ny	35	word	2022-04-05 13:14:34.389124
993	llamar	dzwoni??, puka?? do drzwi	35	word	2022-04-05 13:14:34.389124
994	la forma	kszta??t	35	word	2022-04-05 13:14:34.389124
995	el cuadrado	kwadrat	35	word	2022-04-05 13:14:34.389124
996	cuadrado	kwadratowy	35	word	2022-04-05 13:14:34.389124
997	el c??rculo	ko??o	35	word	2022-04-05 13:14:34.389124
998	redondo	okr??g??y	35	word	2022-04-05 13:14:34.389124
999	recto	prosty	35	word	2022-04-05 13:14:34.389124
1000	la cosa	rzecz	35	word	2022-04-05 13:14:34.389124
1001	el l??piz	o????wek	35	word	2022-04-05 13:14:34.389124
1002	el bol??grafo	d??ugopis	35	word	2022-04-05 13:14:34.389124
1003	la pluma	pi??ro	35	word	2022-04-05 13:14:34.389124
1004	borrar	zmazywa??, ??ciera??	35	word	2022-04-05 13:14:34.389124
1005	la regla	linijka	35	word	2022-04-05 13:14:34.389124
1006	la cartera	portfel	35	word	2022-04-05 13:14:34.389124
1007	dejar	zostawia??	35	word	2022-04-05 13:14:34.389124
1008	perder	gubi?? (e/ie)	35	word	2022-04-05 13:14:34.389124
1009	buscar	szuka??	35	word	2022-04-05 13:14:34.389124
1010	encontrar	znajdowa?? (o/ue)	35	word	2022-04-05 13:14:34.389124
1011	traer	przynosi?? (1g)	35	word	2022-04-05 13:14:34.389124
1012	nuevo	nowy	35	word	2022-04-05 13:14:34.389124
1013	viejo	stary	35	word	2022-04-05 13:14:34.389124
1014	jugar	bawi?? si??, gra?? (u/ue)	35	word	2022-04-05 13:14:34.389124
1015	el juguete	zabawka	35	word	2022-04-05 13:14:34.389124
1016	la mu??eca	lalka	35	word	2022-04-05 13:14:34.389124
1017	con	z	35	word	2022-04-05 13:14:34.389124
1018	sin	bez	35	word	2022-04-05 13:14:34.389124
1019	contar	opowiada?? (o/ue)	35	word	2022-04-05 13:14:34.389124
1020	el cuento	opowiadanie	35	word	2022-04-05 13:14:34.389124
1021	raro	dziwny, niespotykany	35	word	2022-04-05 13:14:34.389124
1022	la bruja	czarownica	35	word	2022-04-05 13:14:34.389124
1023	el pr??ncipe	kr??lewicz	35	word	2022-04-05 13:14:34.389124
1024	la princesa	kr??lewna	35	word	2022-04-05 13:14:34.389124
1025	la fantas??a	fantazja	35	word	2022-04-05 13:14:34.389124
1026	fant??stico	fantastyczny	35	word	2022-04-05 13:14:34.389124
1027	comenzar	zaczyna??, rozpoczyna?? (e/ie)	36	word	2022-04-05 20:15:27.464727
1028	el comienzo	pocz??tek	36	word	2022-04-05 20:15:27.464727
1029	acabar	ko??czy??, sko??czy??	36	word	2022-04-05 20:15:27.464727
1030	el fin	koniec	36	word	2022-04-05 20:15:27.464727
1031	final	ko??cowy	36	word	2022-04-05 20:15:27.464727
1032	por fin	w ko??cu, wreszcie	36	word	2022-04-05 20:15:27.464727
1033	durar	trwa??	36	word	2022-04-05 20:15:27.464727
1034	la duraci??n	czas trwania	36	word	2022-04-05 20:15:27.464727
1035	continuar	kontynuowa??	36	word	2022-04-05 20:15:27.464727
1036	la continuaci??n	kontynuacja	36	word	2022-04-05 20:15:27.464727
1037	la medianoche	p????noc	36	word	2022-04-05 20:15:27.464727
1038	a medianoche	o p????nocy	36	word	2022-04-05 20:15:27.464727
1039	anoche	ubieg??ej nocy, ubieg??ego wieczoru	36	word	2022-04-05 20:15:27.464727
1040	la madrugada	??wit	36	word	2022-04-05 20:15:27.464727
1041	desde	od (punktu w czasie)	36	word	2022-04-05 20:15:27.464727
1042	hace	od, przed (przedzia?? czasu)	36	word	2022-04-05 20:15:27.464727
1043	desde hace	od (przedzia?? czasu)	36	word	2022-04-05 20:15:27.464727
1044	desde hace tiempo	od dawna	36	word	2022-04-05 20:15:27.464727
1045	desde hace poco	od niedawna	36	word	2022-04-05 20:15:27.464727
1046	a??n	jeszcze	36	word	2022-04-05 20:15:27.464727
1047	durante	podczas	36	word	2022-04-05 20:15:27.464727
1048	mientras que	podczas gdy	36	word	2022-04-05 20:15:27.464727
1049	hacia	oko??o	36	word	2022-04-05 20:15:27.464727
1050	s??lo	dopiero	36	word	2022-04-05 20:15:27.464727
1051	en	za (w odniesieniu do czasu)	36	word	2022-04-05 20:15:27.464727
1052	de repente	nagle	36	word	2022-04-05 20:15:27.464727
1053	inmediatamente	natychmiast	36	word	2022-04-05 20:15:27.464727
1054	pronto	szybko, pr??dko	36	word	2022-04-05 20:15:27.464727
1055	general	og??lny, g????wny	36	word	2022-04-05 20:15:27.464727
1056	generalmente	og??lnie, g????wnie	36	word	2022-04-05 20:15:27.464727
1057	frecuente	cz??sty	36	word	2022-04-05 20:15:27.464727
1058	frecuentemente	cz??sto	36	word	2022-04-05 20:15:27.464727
1059	regular	regularny	36	word	2022-04-05 20:15:27.464727
1060	regularmente	regularnie	36	word	2022-04-05 20:15:27.464727
1061	irregular	nieregularny	36	word	2022-04-05 20:15:27.464727
1062	irregularmente	nieregularnie	36	word	2022-04-05 20:15:27.464727
1063	raramente	rzadko	36	word	2022-04-05 20:15:27.464727
1064	una vez	raz	36	word	2022-04-05 20:15:27.464727
1065	de vez en cuando	od czasu do czasu	36	word	2022-04-05 20:15:27.464727
1066	el futuro	przysz??o????	36	word	2022-04-05 20:15:27.464727
1067	futuro	przysz??y	36	word	2022-04-05 20:15:27.464727
1068	el presente	tera??niejszo????	36	word	2022-04-05 20:15:27.464727
1069	presente	obecny	36	word	2022-04-05 20:15:27.464727
1070	el pasado	przesz??o????	36	word	2022-04-05 20:15:27.464727
1071	pasado	przesz??y, miniony	36	word	2022-04-05 20:15:27.464727
1072	pr??ximo	nast??pny, przysz??y	36	word	2022-04-05 20:15:27.464727
1073	pr??ximamente	w najbli??szym czasie	36	word	2022-04-05 20:15:27.464727
1074	??ltimo	ostatni	36	word	2022-04-05 20:15:27.464727
1075	??ltimamente	ostatnio	36	word	2022-04-05 20:15:27.464727
1076	un rato	chwila	36	word	2022-04-05 20:15:27.464727
1077	la prisa	po??piech	36	word	2022-04-05 20:15:27.464727
1078	calcular	liczy??, rachowa??	37	word	2022-04-05 20:16:42.145777
1079	m??s	plus	37	word	2022-04-05 20:16:42.145777
1080	menos	minus	37	word	2022-04-05 20:16:42.145777
1081	por	razy	37	word	2022-04-05 20:16:42.145777
1608	el papel	rola	51	word	2022-04-05 20:29:41.874472
1082	dividir	dzieli??	37	word	2022-04-05 20:16:42.145777
1083	aproximadamente	w przybli??eniu	37	word	2022-04-05 20:16:42.145777
1084	primero	pierwszy	37	word	2022-04-05 20:16:42.145777
1085	segundo	drugi	37	word	2022-04-05 20:16:42.145777
1086	tercero	trzeci	37	word	2022-04-05 20:16:42.145777
1087	cuarto	czwarty	37	word	2022-04-05 20:16:42.145777
1088	quinto	pi??ty	37	word	2022-04-05 20:16:42.145777
1089	sexto	sz??sty	37	word	2022-04-05 20:16:42.145777
1090	s??ptimo	si??dmy	37	word	2022-04-05 20:16:42.145777
1091	octavo	??smy	37	word	2022-04-05 20:16:42.145777
1092	noveno	dziewi??ty	37	word	2022-04-05 20:16:42.145777
1093	d??cimo	dziesi??ty	37	word	2022-04-05 20:16:42.145777
1094	numeroso	liczny	37	word	2022-04-05 20:16:42.145777
1095	la caja	pude??ko, skrzynka	38	word	2022-04-05 20:17:26.435162
1096	la caja fuerte	sejf	38	word	2022-04-05 20:17:26.435162
1097	el saco	worek	38	word	2022-04-05 20:17:26.435162
1098	el saco de dormir	??piw??r	38	word	2022-04-05 20:17:26.435162
1099	el tarro	s??oik	38	word	2022-04-05 20:17:26.435162
1100	el tama??o	wielko????, rozmiar	38	word	2022-04-05 20:17:26.435162
1101	la docena	tuzin	38	word	2022-04-05 20:17:26.435162
1102	medir	mierzy?? (e/i)	38	word	2022-04-05 20:17:26.435162
1103	pesar	wa??y??	38	word	2022-04-05 20:17:26.435162
1104	grueso	gruby (te?? o osobie)	38	word	2022-04-05 20:17:26.435162
1105	fino	cienki	38	word	2022-04-05 20:17:26.435162
1106	solo	jedyny (s)	38	word	2022-04-05 20:17:26.435162
1107	sobrar	pozostawa??, by?? w nadmiarze	38	word	2022-04-05 20:17:26.435162
1108	entero	ca??y, pe??ny	38	word	2022-04-05 20:17:26.435162
1109	partir	dzieli??, rozdziela??	38	word	2022-04-05 20:17:26.435162
1110	la parte	cz??????	38	word	2022-04-05 20:17:26.435162
1111	en parte	cz????ciowo	38	word	2022-04-05 20:17:26.435162
1112	por	na	38	word	2022-04-05 20:17:26.435162
1113	tanto	tym...	38	word	2022-04-05 20:17:26.435162
1114	llenar	nape??nia??	38	word	2022-04-05 20:17:26.435162
1115	contener	zawiera?? (nr)	38	word	2022-04-05 20:17:26.435162
1116	el contenido	zawarto????	38	word	2022-04-05 20:17:26.435162
1117	un mont??n	du??a ilo????, mn??stwo	38	word	2022-04-05 20:17:26.435162
1118	el par	para	38	word	2022-04-05 20:17:26.435162
1119	bastante	do????, dosy??	38	word	2022-04-05 20:17:26.435162
1120	casi	prawie	38	word	2022-04-05 20:17:26.435162
1121	la localidad	miejscowo????	39	word	2022-04-05 20:18:57.689274
1122	habitar	mieszka??, zamieszkiwa??	39	word	2022-04-05 20:18:57.689274
1123	el habitante	mieszkaniec	39	word	2022-04-05 20:18:57.689274
1124	el alcalde	burmistrz	39	word	2022-04-05 20:18:57.689274
1125	el ayuntamiento	ratusz	39	word	2022-04-05 20:18:57.689274
1126	la avenida	aleja	39	word	2022-04-05 20:18:57.689274
1127	el peat??n	pieszy	39	word	2022-04-05 20:18:57.689274
1128	peatonal	dla pieszych	39	word	2022-04-05 20:18:57.689274
1129	la zona	strefa, obszar	39	word	2022-04-05 20:18:57.689274
1130	pasar	przechodzi??, przeje??d??a??	39	word	2022-04-05 20:18:57.689274
1131	cruzarse	krzy??owa?? si??	39	word	2022-04-05 20:18:57.689274
1132	el cruce	skrzy??owanie	39	word	2022-04-05 20:18:57.689274
1133	el sem??foro	sygnalizacja ??wietlna	39	word	2022-04-05 20:18:57.689274
1134	el tr??fico	ruch (uliczny), komunikacja	39	word	2022-04-05 20:18:57.689274
1135	subir	wsiada??	39	word	2022-04-05 20:18:57.689274
1136	bajar	wysiada??	39	word	2022-04-05 20:18:57.689274
1137	el bloque	blok	39	word	2022-04-05 20:18:57.689274
1138	el rascacielos	drapacz chmur	39	word	2022-04-05 20:18:57.689274
1139	los rascacielos	drapacze chmur	39	word	2022-04-05 20:18:57.689274
1140	las afueras	przedmie??cie	39	word	2022-04-05 20:18:57.689274
1141	la ventaja	zaleta, korzy????	39	word	2022-04-05 20:18:57.689274
1142	ventajoso	korzystny	39	word	2022-04-05 20:18:57.689274
1143	la desventaja	wada, niekorzy????	39	word	2022-04-05 20:18:57.689274
1144	desventajoso	niekorzystny	39	word	2022-04-05 20:18:57.689274
1145	la aldea	wie??, wioska	39	word	2022-04-05 20:18:57.689274
1146	el aldeano	wie??niak (a)	39	word	2022-04-05 20:18:57.689274
1147	aldeano	wiejski	39	word	2022-04-05 20:18:57.689274
1148	rural	wiejski, rolniczy	39	word	2022-04-05 20:18:57.689274
1149	criar	hodowa?? (zwierz??ta)	39	word	2022-04-05 20:18:57.689274
1150	la cr??a	hodowla (zwierz??t)	39	word	2022-04-05 20:18:57.689274
1151	el criador	hodowca (zwierz??t)	39	word	2022-04-05 20:18:57.689274
1152	cultivar	uprawia??, hodowa?? (ro??liny)	39	word	2022-04-05 20:18:57.689274
1153	el cultivo	uprawa, hodowla (ro??lin)	39	word	2022-04-05 20:18:57.689274
1154	la agricultura	rolnictwo	39	word	2022-04-05 20:18:57.689274
1155	el agricultor	rolnik	39	word	2022-04-05 20:18:57.689274
1156	el molino	m??yn	39	word	2022-04-05 20:18:57.689274
1157	el molinero	m??ynarz	39	word	2022-04-05 20:18:57.689274
1158	el molino de viento	wiatrak	39	word	2022-04-05 20:18:57.689274
1159	la granja	gospodarstwo rolne, farma	39	word	2022-04-05 20:18:57.689274
1160	la caba??a	chata	39	word	2022-04-05 20:18:57.689274
1161	el pozo	studnia	39	word	2022-04-05 20:18:57.689274
1162	la senda	??cie??ka	39	word	2022-04-05 20:18:57.689274
1163	coger	zrywa??	39	word	2022-04-05 20:18:57.689274
1164	pescar	??owi?? ryby	39	word	2022-04-05 20:18:57.689274
1165	el pescador	rybak	39	word	2022-04-05 20:18:57.689274
1166	el bocadillo	kanapka	40	word	2022-04-05 20:20:05.703194
1167	la margarina	margaryna	40	word	2022-04-05 20:20:05.703194
1168	el chorizo	kie??basa (hiszpa??ska)	40	word	2022-04-05 20:20:05.703194
1169	la confitura	konfitura	40	word	2022-04-05 20:20:05.703194
1170	revolver	miesza?? (o/ue)	40	word	2022-04-05 20:20:05.703194
1171	huevos revueltos	jajecznica	40	word	2022-04-05 20:20:05.703194
1172	la harina	m??ka	40	word	2022-04-05 20:20:05.703194
1173	oler	pachnie??, w??cha?? (o/ue)	40	word	2022-04-05 20:20:05.703194
1174	el olor	zapach	40	word	2022-04-05 20:20:05.703194
1175	huele	pow??chaj	40	word	2022-04-05 20:20:05.703194
1176	probar	pr??bowa??, kosztowa?? (o/ue)	40	word	2022-04-05 20:20:05.703194
1177	prueba	skosztuj	40	word	2022-04-05 20:20:05.703194
1178	el apetito	apetyt	40	word	2022-04-05 20:20:05.703194
1179	apetitoso	apetyczny	40	word	2022-04-05 20:20:05.703194
1180	almorzar	je???? obiad (o/ue)	40	word	2022-04-05 20:20:05.703194
1181	el almuerzo	obiad	40	word	2022-04-05 20:20:05.703194
1182	servir	obs??ugiwa??, podawa?? (do sto??u) (e/i)	40	word	2022-04-05 20:20:05.703194
1183	el servicio	obs??uga	40	word	2022-04-05 20:20:05.703194
1184	el autoservicio	samoobs??uga	40	word	2022-04-05 20:20:05.703194
1185	el camarero	kelner	40	word	2022-04-05 20:20:05.703194
2203	matar	zabija??	67	word	2022-04-05 20:40:15.098647
1186	la carta	karta da??	40	word	2022-04-05 20:20:05.703194
1187	servir	serwowa??, nak??ada??	40	word	2022-04-05 20:20:05.703194
1188	la especialidad	specjalno????, specja??	40	word	2022-04-05 20:20:05.703194
1189	el plato	potrawa, danie	40	word	2022-04-05 20:20:05.703194
1190	frito	sma??ony	40	word	2022-04-05 20:20:05.703194
1191	el calamar	kalmar	40	word	2022-04-05 20:20:05.703194
1192	la gamba	krewetka	40	word	2022-04-05 20:20:05.703194
1193	el sabor	smak	40	word	2022-04-05 20:20:05.703194
1194	sabroso	smaczny	40	word	2022-04-05 20:20:05.703194
1195	la carne de ternera	ciel??cina	40	word	2022-04-05 20:20:05.703194
1196	la carne de cordero	mi??so jagni??ce	40	word	2022-04-05 20:20:05.703194
1197	la chuleta	kotlet	40	word	2022-04-05 20:20:05.703194
1198	crudo	surowy	40	word	2022-04-05 20:20:05.703194
1199	el filete	filet	40	word	2022-04-05 20:20:05.703194
1200	asar	piec, sma??y??	40	word	2022-04-05 20:20:05.703194
1201	el asado	piecze??	40	word	2022-04-05 20:20:05.703194
1202	la grasa	t??uszcz	40	word	2022-04-05 20:20:05.703194
1203	graso	t??usty	40	word	2022-04-05 20:20:05.703194
1204	magro	chudy	40	word	2022-04-05 20:20:05.703194
1205	picante	ostry	40	word	2022-04-05 20:20:05.703194
1206	suave	??agodny	40	word	2022-04-05 20:20:05.703194
1207	el postre	deser	40	word	2022-04-05 20:20:05.703194
1208	la macedonia	sa??atka owocowa	40	word	2022-04-05 20:20:05.703194
1209	el flan	budy??	40	word	2022-04-05 20:20:05.703194
1210	merendar	je???? podwieczorek (e/ie)	40	word	2022-04-05 20:20:05.703194
1211	la merienda	podwieczorek	40	word	2022-04-05 20:20:05.703194
1212	los dulces	s??odycze	40	word	2022-04-05 20:20:05.703194
1213	el bomb??n	czekoladka, pralinka	40	word	2022-04-05 20:20:05.703194
1214	la caja con bombones	bombonierka	40	word	2022-04-05 20:20:05.703194
1215	amargo	gorzki	40	word	2022-04-05 20:20:05.703194
1216	delicioso	pyszny, wy??mienity	40	word	2022-04-05 20:20:05.703194
1217	lleno	najedzony, syty	40	word	2022-04-05 20:20:05.703194
1218	la propina	napiwek	40	word	2022-04-05 20:20:05.703194
1219	la bodega	winiarnia	40	word	2022-04-05 20:20:05.703194
1220	alcoh??lico	alkoholowy	40	word	2022-04-05 20:20:05.703194
1221	refrescar	orze??wia??	40	word	2022-04-05 20:20:05.703194
1222	el refresco	nap??j orze??wiaj??cy	40	word	2022-04-05 20:20:05.703194
1223	refrescante	orze??wiaj??cy	40	word	2022-04-05 20:20:05.703194
1224	el vodka	w??dka	40	word	2022-04-05 20:20:05.703194
1225	el champ??n	szampan	40	word	2022-04-05 20:20:05.703194
1228	el empleo	zatrudnienie	41	word	2022-04-05 20:21:24.199495
1229	el empleado	pracownik	41	word	2022-04-05 20:21:24.199495
1230	el obrero	robotnik	41	word	2022-04-05 20:21:24.199495
1231	obrero	robotniczy	41	word	2022-04-05 20:21:24.199495
1232	el especialista	specjalista	41	word	2022-04-05 20:21:24.199495
1233	el puesto	posada	41	word	2022-04-05 20:21:24.199495
1234	el contrato	umowa	41	word	2022-04-05 20:21:24.199495
1235	la condici??n	warunek	41	word	2022-04-05 20:21:24.199495
1236	la experiencia	do??wiadczenie	41	word	2022-04-05 20:21:24.199495
1237	experimentado	do??wiadczony	41	word	2022-04-05 20:21:24.199495
1238	el deber	obowi??zek	41	word	2022-04-05 20:21:24.199495
1239	la responsabilidad	odpowiedzialno????	41	word	2022-04-05 20:21:24.199495
1240	responsable	odpowiedzialny	41	word	2022-04-05 20:21:24.199495
1241	la tarea	zadanie	41	word	2022-04-05 20:21:24.199495
1242	capaz	zdolny, gotowy	41	word	2022-04-05 20:21:24.199495
1243	la capacidad	zdolno????, gotowo????	41	word	2022-04-05 20:21:24.199495
1244	el sueldo	pensja	41	word	2022-04-05 20:21:24.199495
1245	la carrera	kariera	41	word	2022-04-05 20:21:24.199495
1246	dirigir	kierowa??	41	word	2022-04-05 20:21:24.199495
1247	la direcci??n	kierownictwo	41	word	2022-04-05 20:21:24.199495
1248	el departamento	dzia??	41	word	2022-04-05 20:21:24.199495
1249	el equipo	zesp????	41	word	2022-04-05 20:21:24.199495
1250	reunirse	spotyka?? si??, gromadzi?? si??	41	word	2022-04-05 20:21:24.199495
1251	la reuni??n	spotkanie, zgromadzenie	41	word	2022-04-05 20:21:24.199495
1252	participar	uczestniczy??	41	word	2022-04-05 20:21:24.199495
1253	la participaci??n	uczestnictwo	41	word	2022-04-05 20:21:24.199495
1254	el participante	uczestnik	41	word	2022-04-05 20:21:24.199495
1255	el proyecto	projekt	41	word	2022-04-05 20:21:24.199495
1256	concentrarse	koncentrowa?? si??	41	word	2022-04-05 20:21:24.199495
1257	la concentraci??n	koncentracja	41	word	2022-04-05 20:21:24.199495
1258	el detalle	szczeg????	41	word	2022-04-05 20:21:24.199495
1259	ocuparse	zajmowa?? si??	41	word	2022-04-05 20:21:24.199495
1260	la ocupaci??n	zaj??cie	41	word	2022-04-05 20:21:24.199495
1261	dejar	zostawia??, porzuca??	41	word	2022-04-05 20:21:24.199495
1262	despedir	zwalnia?? (z pracy) (e/i)	41	word	2022-04-05 20:21:24.199495
1263	el despido	zwolnienie	41	word	2022-04-05 20:21:24.199495
1264	el desempleo	bezrobocie	41	word	2022-04-05 20:21:24.199495
1265	el desempleado	bezrobotny (osoba)	41	word	2022-04-05 20:21:24.199495
1266	desempleado	bezrobotny	41	word	2022-04-05 20:21:24.199495
1267	regar	podlewa?? (e/ie)	42	word	2022-04-05 20:21:59.587533
1268	el tulip??n	tulipan	42	word	2022-04-05 20:21:59.587533
1269	el girasol	s??onecznik	42	word	2022-04-05 20:21:59.587533
1270	el cactus	kaktus, kaktusy	42	word	2022-04-05 20:21:59.587533
1271	la hoja	li????	42	word	2022-04-05 20:21:59.587533
1272	el roble	d??b	42	word	2022-04-05 20:21:59.587533
1273	el pino	sosna	42	word	2022-04-05 20:21:59.587533
1274	la seta	grzyb	42	word	2022-04-05 20:21:59.587533
1275	la nuez	orzech (owoc), orzech w??oski	42	word	2022-04-05 20:21:59.587533
1276	madurar	dojrzewa??	42	word	2022-04-05 20:21:59.587533
1277	maduro	dojrza??y	42	word	2022-04-05 20:21:59.587533
1278	la ciruela	??liwka	42	word	2022-04-05 20:21:59.587533
1279	la cereza	czere??nia	42	word	2022-04-05 20:21:59.587533
1280	la frambuesa	malina	42	word	2022-04-05 20:21:59.587533
1281	el melocot??n	brzoskwinia	42	word	2022-04-05 20:21:59.587533
1282	el mel??n	melon	42	word	2022-04-05 20:21:59.587533
1283	la pi??a	ananas	42	word	2022-04-05 20:21:59.587533
1284	la aceituna	oliwka	42	word	2022-04-05 20:21:59.587533
1285	el ajo	czosnek	42	word	2022-04-05 20:21:59.587533
1286	la remolacha	burak	42	word	2022-04-05 20:21:59.587533
1287	la lechuga	sa??ata	42	word	2022-04-05 20:21:59.587533
1288	la col	kapusta	42	word	2022-04-05 20:21:59.587533
1289	la col china	kapusta peki??ska	42	word	2022-04-05 20:21:59.587533
1290	el champi????n	pieczarka	42	word	2022-04-05 20:21:59.587533
1291	las jud??as	fasola	42	word	2022-04-05 20:21:59.587533
1292	los guisantes	groch	42	word	2022-04-05 20:21:59.587533
1293	el ma??z	kukurydza	42	word	2022-04-05 20:21:59.587533
1294	el petr??leo	ropa naftowa	43	word	2022-04-05 20:22:54.471205
1295	la corriente	pr??d	43	word	2022-04-05 20:22:54.471205
1296	el material	materia??	43	word	2022-04-05 20:22:54.471205
1297	la sustancia	substancja	43	word	2022-04-05 20:22:54.471205
1298	el polvo	proszek	43	word	2022-04-05 20:22:54.471205
1299	la mina	kopalnia	43	word	2022-04-05 20:22:54.471205
1300	el minero	g??rnik	43	word	2022-04-05 20:22:54.471205
1301	el carb??n	w??giel	43	word	2022-04-05 20:22:54.471205
1302	el diamante	diament	43	word	2022-04-05 20:22:54.471205
1303	la perla	per??a	43	word	2022-04-05 20:22:54.471205
1304	artificial	sztuczny	43	word	2022-04-05 20:22:54.471205
1305	aut??ntico	prawdziwy	43	word	2022-04-05 20:22:54.471205
1306	la lana	we??na	43	word	2022-04-05 20:22:54.471205
1307	el algod??n	bawe??na	43	word	2022-04-05 20:22:54.471205
1308	la seda	jedwab	43	word	2022-04-05 20:22:54.471205
1309	natural	naturalny	43	word	2022-04-05 20:22:54.471205
1310	la porcelana	porcelana	43	word	2022-04-05 20:22:54.471205
1311	fr??gil	kruchy, delikatny	43	word	2022-04-05 20:22:54.471205
1312	fuerte	mocny, solidny	43	word	2022-04-05 20:22:54.471205
1313	componerse	sk??ada?? si?? (1g)	43	word	2022-04-05 20:22:54.471205
1314	el cari??o	czu??o????, serdeczno????	44	word	2022-04-05 20:23:29.133525
1315	cari??oso	czu??y, serdeczny	44	word	2022-04-05 20:23:29.133525
1316	la amistad	przyja????	44	word	2022-04-05 20:23:29.133525
1317	amistoso	przyjacielski	44	word	2022-04-05 20:23:29.133525
1318	respetar	respektowa??, szanowa??	44	word	2022-04-05 20:23:29.133525
1319	el respeto	respekt, szacunek	44	word	2022-04-05 20:23:29.133525
1320	el novio	narzeczony, ch??opak	44	word	2022-04-05 20:23:29.133525
1321	la novia	narzeczona, dziewczyna	44	word	2022-04-05 20:23:29.133525
1322	enamorarse	zakocha?? si??	44	word	2022-04-05 20:23:29.133525
1323	enamorado	zakochany	44	word	2022-04-05 20:23:29.133525
1324	confiar	ufa??	44	word	2022-04-05 20:23:29.133525
1325	la confianza	zaufanie	44	word	2022-04-05 20:23:29.133525
1326	desconfiar	nie ufa??	44	word	2022-04-05 20:23:29.133525
1327	la desconfianza	nieufno????	44	word	2022-04-05 20:23:29.133525
1328	los celos	zazdro????	44	word	2022-04-05 20:23:29.133525
1329	celoso	zazdrosny	44	word	2022-04-05 20:23:29.133525
1330	echar de menos	t??skni??	44	word	2022-04-05 20:23:29.133525
1331	la l??grima	??za	44	word	2022-04-05 20:23:29.133525
1332	la soledad	samotno????	44	word	2022-04-05 20:23:29.133525
1333	solo	sam, samotny	44	word	2022-04-05 20:23:29.133525
1334	el sentimiento	uczucie	44	word	2022-04-05 20:23:29.133525
1335	sentimental	uczuciowy	44	word	2022-04-05 20:23:29.133525
1336	el orgullo	duma	44	word	2022-04-05 20:23:29.133525
1337	orgulloso	dumny	44	word	2022-04-05 20:23:29.133525
1338	ofender	obra??a??, zniewa??a??	44	word	2022-04-05 20:23:29.133525
1339	la ofensa	obraza, zniewaga	44	word	2022-04-05 20:23:29.133525
1340	ofensivo	obra??liwy	44	word	2022-04-05 20:23:29.133525
1341	enfadarse	z??o??ci?? si??, gniewa?? si??	44	word	2022-04-05 20:23:29.133525
1342	el enfado	z??o????, gniew	44	word	2022-04-05 20:23:29.133525
1343	estresarse	stresowa?? si??	44	word	2022-04-05 20:23:29.133525
1344	el estr??s	stres	44	word	2022-04-05 20:23:29.133525
1345	estresante	stresuj??cy	44	word	2022-04-05 20:23:29.133525
1346	terrible	straszny	44	word	2022-04-05 20:23:29.133525
1347	asustar	przestraszy??	44	word	2022-04-05 20:23:29.133525
1348	asustarse	przestraszy?? si??	44	word	2022-04-05 20:23:29.133525
1349	sorprender	zaskakiwa??, dziwi??	44	word	2022-04-05 20:23:29.133525
1350	la sorpresa	zaskoczenie	44	word	2022-04-05 20:23:29.133525
1351	raro	dziwny	44	word	2022-04-05 20:23:29.133525
1352	preocuparse	niepokoi?? si??, martwi?? si??	44	word	2022-04-05 20:23:29.133525
1353	la preocupaci??n	zmartwienie	44	word	2022-04-05 20:23:29.133525
1354	la suerte	szcz????cie	44	word	2022-04-05 20:23:29.133525
1355	la mala suerte	pech	44	word	2022-04-05 20:23:29.133525
1356	la ilusi??n	z??udna nadzieja, iluzja	44	word	2022-04-05 20:23:29.133525
1357	las ganas	ochota	44	word	2022-04-05 20:23:29.133525
1358	el humor	nastr??j, humor	44	word	2022-04-05 20:23:29.133525
1359	el chiste	dowcip	44	word	2022-04-05 20:23:29.133525
1360	chistoso	dowcipny	44	word	2022-04-05 20:23:29.133525
1361	el cordero	jagni??	45	word	2022-04-05 20:24:21.415385
1362	el ternero	ciel??	45	word	2022-04-05 20:24:21.415385
1363	la cabra	koza	45	word	2022-04-05 20:24:21.415385
1364	el burro	osio??	45	word	2022-04-05 20:24:21.415385
1365	el conejo	kr??lik	45	word	2022-04-05 20:24:21.415385
1366	el gallo	kogut	45	word	2022-04-05 20:24:21.415385
1367	la gallina	kura	45	word	2022-04-05 20:24:21.415385
1368	el pato	kaczor	45	word	2022-04-05 20:24:21.415385
1369	la pata	kaczka	45	word	2022-04-05 20:24:21.415385
1370	el ganso	g????	45	word	2022-04-05 20:24:21.415385
1371	el p??jaro	ptak (potrafi??cy lata??)	45	word	2022-04-05 20:24:21.415385
1372	la paloma	go????b	45	word	2022-04-05 20:24:21.415385
1373	el ??guila	orze?? (rodzaj ??e??ski)	45	word	2022-04-05 20:24:21.415385
1374	el nido	gniazdo	45	word	2022-04-05 20:24:21.415385
1375	el insecto	owad	45	word	2022-04-05 20:24:21.415385
1376	la abeja	pszczo??a	45	word	2022-04-05 20:24:21.415385
1377	la mosca	mucha	45	word	2022-04-05 20:24:21.415385
1378	la mariposa	motyl	45	word	2022-04-05 20:24:21.415385
1379	la ara??a	paj??k	45	word	2022-04-05 20:24:21.415385
1380	la rata	szczur	45	word	2022-04-05 20:24:21.415385
1381	el caracol	??limak	45	word	2022-04-05 20:24:21.415385
1382	el bacalao	dorsz	45	word	2022-04-05 20:24:21.415385
1383	el at??n	tu??czyk	45	word	2022-04-05 20:24:21.415385
1384	el delf??n	delfin	45	word	2022-04-05 20:24:21.415385
1385	el cangrejo	rak	45	word	2022-04-05 20:24:21.415385
1386	la serpiente	w????	45	word	2022-04-05 20:24:21.415385
1387	el canguro	kangur	45	word	2022-04-05 20:24:21.415385
1388	el camello	wielb????d	45	word	2022-04-05 20:24:21.415385
1389	cazar	polowa??	45	word	2022-04-05 20:24:21.415385
1390	la caza	polowanie	45	word	2022-04-05 20:24:21.415385
1391	el cazador	my??liwy	45	word	2022-04-05 20:24:21.415385
1392	el veterinario	weterynarz	45	word	2022-04-05 20:24:21.415385
1393	el apartamento	mieszkanie (zwykle dwupokojowe)	46	word	2022-04-05 20:25:23.973659
1394	interior	wewn??trzny	46	word	2022-04-05 20:25:23.973659
1395	la ropa interior	bielizna	46	word	2022-04-05 20:25:23.973659
1396	exterior	zewn??trzny	46	word	2022-04-05 20:25:23.973659
1397	precioso	??liczny, pi??kny	46	word	2022-04-05 20:25:23.973659
1398	mudarse	przeprowadza?? si??	46	word	2022-04-05 20:25:23.973659
1399	la mudanza	przeprowadzka	46	word	2022-04-05 20:25:23.973659
1400	alquilar	wynajmowa??	46	word	2022-04-05 20:25:23.973659
1401	el alquiler	czynsz	46	word	2022-04-05 20:25:23.973659
1402	el dep??sito	kaucja	46	word	2022-04-05 20:25:23.973659
1403	el portero	portier, dozorca	46	word	2022-04-05 20:25:23.973659
1404	la puerta	brama	46	word	2022-04-05 20:25:23.973659
1405	el garaje	gara??	46	word	2022-04-05 20:25:23.973659
1406	el s??tano	piwnica	46	word	2022-04-05 20:25:23.973659
1407	el piso	pi??tro	46	word	2022-04-05 20:25:23.973659
1408	el recibidor	przedpok??j	46	word	2022-04-05 20:25:23.973659
1409	la luz	??wiat??o	46	word	2022-04-05 20:25:23.973659
1410	la cortina	zas??ona	46	word	2022-04-05 20:25:23.973659
1411	amueblar	meblowa??	46	word	2022-04-05 20:25:23.973659
1412	el mueble	mebel	46	word	2022-04-05 20:25:23.973659
1413	el despacho	gabinet	46	word	2022-04-05 20:25:23.973659
1414	el escritorio	biurko	46	word	2022-04-05 20:25:23.973659
1415	la c??moda	komoda	46	word	2022-04-05 20:25:23.973659
1416	el caj??n	szuflada	46	word	2022-04-05 20:25:23.973659
1417	el lavabo	umywalka	46	word	2022-04-05 20:25:23.973659
1418	amplio	obszerny, przestronny	46	word	2022-04-05 20:25:23.973659
1419	la terraza	taras	46	word	2022-04-05 20:25:23.973659
1420	el jarr??n	wazon	46	word	2022-04-05 20:25:23.973659
1421	el ama de casa	gospodyni domowa (rodzaj ??e??ski)	46	word	2022-04-05 20:25:23.973659
1422	diario	codzienny	46	word	2022-04-05 20:25:23.973659
1423	diariamente	codziennie	46	word	2022-04-05 20:25:23.973659
1424	la costumbre	przyzwyczajenie	46	word	2022-04-05 20:25:23.973659
1425	la limpieza	czysto????, czyszczenie	46	word	2022-04-05 20:25:23.973659
1426	el polvo	kurz	46	word	2022-04-05 20:25:23.973659
1427	polvoriento	zakurzony	46	word	2022-04-05 20:25:23.973659
1428	la aspiradora	odkurzacz	46	word	2022-04-05 20:25:23.973659
1429	el cubo	wiadro	46	word	2022-04-05 20:25:23.973659
1430	arreglar	posprz??ta??	46	word	2022-04-05 20:25:23.973659
1431	el arreglo	porz??dek	46	word	2022-04-05 20:25:23.973659
1432	fregar	zmywa?? (e/ie)	46	word	2022-04-05 20:25:23.973659
1433	la taza	kubek	46	word	2022-04-05 20:25:23.973659
1434	hervir	gotowa?? si??, wrze?? (e/ie)	46	word	2022-04-05 20:25:23.973659
1435	el hervidor	czajnik	46	word	2022-04-05 20:25:23.973659
1436	cubrir	przykrywa??	46	word	2022-04-05 20:25:23.973659
1437	la cesta	kosz, koszyk	46	word	2022-04-05 20:25:23.973659
1438	la tetera	czajnik do herbaty	46	word	2022-04-05 20:25:23.973659
1439	la cafetera	ekspres do kawy	46	word	2022-04-05 20:25:23.973659
1440	el frigor??fico	lod??wka	46	word	2022-04-05 20:25:23.973659
1441	la cocina	kuchenka	46	word	2022-04-05 20:25:23.973659
1442	el horno	piekarnik	46	word	2022-04-05 20:25:23.973659
1443	la servilleta	serwetka	46	word	2022-04-05 20:25:23.973659
1444	la mancha	plama	46	word	2022-04-05 20:25:23.973659
1445	manchado	poplamiony	46	word	2022-04-05 20:25:23.973659
1446	la lavander??a	pralnia	46	word	2022-04-05 20:25:23.973659
1447	el detergente	detergent, ??rodek czyszcz??cy	46	word	2022-04-05 20:25:23.973659
1448	secar	suszy??	46	word	2022-04-05 20:25:23.973659
1449	el secador	suszarka (do w??os??w)	46	word	2022-04-05 20:25:23.973659
1450	la secadora	suszarka (do ubra??)	46	word	2022-04-05 20:25:23.973659
1451	planchar	prasowa??	46	word	2022-04-05 20:25:23.973659
1452	la plancha	??elazko	46	word	2022-04-05 20:25:23.973659
1453	comportarse	zachowywa?? si??	47	word	2022-04-05 20:26:07.776925
1454	el comportamiento	zachowanie	47	word	2022-04-05 20:26:07.776925
1455	la personalidad	osobowo????	47	word	2022-04-05 20:26:07.776925
1456	el rasgo	cecha	47	word	2022-04-05 20:26:07.776925
1457	travieso	niegrzeczny, psotny	47	word	2022-04-05 20:26:07.776925
1458	delicado	delikatny	47	word	2022-04-05 20:26:07.776925
1459	poco delicado	niedelikatny	47	word	2022-04-05 20:26:07.776925
1460	modesto	skromny	47	word	2022-04-05 20:26:07.776925
1461	la modestia	skromno????	47	word	2022-04-05 20:26:07.776925
1462	ambicioso	ambitny	47	word	2022-04-05 20:26:07.776925
1463	la ambici??n	ambicja	47	word	2022-04-05 20:26:07.776925
1464	trabajador	pracowity	47	word	2022-04-05 20:26:07.776925
1465	perezoso	leniwy	47	word	2022-04-05 20:26:07.776925
1466	la pereza	lenistwo	47	word	2022-04-05 20:26:07.776925
1467	obstinado	uparty	47	word	2022-04-05 20:26:07.776925
1468	ego??sta	egoistyczny	47	word	2022-04-05 20:26:07.776925
1469	el ego??sta	egoista	47	word	2022-04-05 20:26:07.776925
1470	el ego??smo	egoizm	47	word	2022-04-05 20:26:07.776925
1471	valiente	odwa??ny	47	word	2022-04-05 20:26:07.776925
1472	el valor	odwaga	47	word	2022-04-05 20:26:07.776925
1473	cobarde	tch??rzliwy	47	word	2022-04-05 20:26:07.776925
1474	el cobarde	tch??rz	47	word	2022-04-05 20:26:07.776925
1475	la cobard??a	tch??rzostwo	47	word	2022-04-05 20:26:07.776925
1476	loco	szalony	47	word	2022-04-05 20:26:07.776925
1477	el loco	szaleniec	47	word	2022-04-05 20:26:07.776925
1478	el sentido	poczucie	47	word	2022-04-05 20:26:07.776925
1479	severo	surowy, srogi	47	word	2022-04-05 20:26:07.776925
1480	honesto	uczciwy	47	word	2022-04-05 20:26:07.776925
1481	la honestidad	uczciwo????	47	word	2022-04-05 20:26:07.776925
1482	sensible	wra??liwy	47	word	2022-04-05 20:26:07.776925
1483	la sensibilidad	wra??liwo????	47	word	2022-04-05 20:26:07.776925
1484	ben??volo	??yczliwy	47	word	2022-04-05 20:26:07.776925
1485	la benevolencia	??yczliwo????	47	word	2022-04-05 20:26:07.776925
1486	sincero	szczery	47	word	2022-04-05 20:26:07.776925
1487	la sinceridad	szczero????	47	word	2022-04-05 20:26:07.776925
1488	curioso	ciekawy	47	word	2022-04-05 20:26:07.776925
1489	la curiosidad	ciekawo????	47	word	2022-04-05 20:26:07.776925
1490	sociable	towarzyski	47	word	2022-04-05 20:26:07.776925
1491	insociable	nietowarzyski	47	word	2022-04-05 20:26:07.776925
1492	en??rgico	energiczny	47	word	2022-04-05 20:26:07.776925
1493	la energ??a	energia	47	word	2022-04-05 20:26:07.776925
1494	activo	czynny, aktywny	47	word	2022-04-05 20:26:07.776925
1495	pasivo	bierny, pasywny	47	word	2022-04-05 20:26:07.776925
1496	el cabello	w??osy (na g??owie)	48	word	2022-04-05 20:27:23.539431
1497	la frente	czo??o	48	word	2022-04-05 20:27:23.539431
1498	la mejilla	policzek	48	word	2022-04-05 20:27:23.539431
1499	el labio	warga	48	word	2022-04-05 20:27:23.539431
1500	el cuello	szyja	48	word	2022-04-05 20:27:23.539431
1501	el hombro	bark	48	word	2022-04-05 20:27:23.539431
1502	la espalda	plecy	48	word	2022-04-05 20:27:23.539431
1503	el hueso	ko????	48	word	2022-04-05 20:27:23.539431
1504	el m??sculo	mi??sie??	48	word	2022-04-05 20:27:23.539431
1505	el nervio	nerw	48	word	2022-04-05 20:27:23.539431
1506	el cerebro	m??zg	48	word	2022-04-05 20:27:23.539431
1507	el pulm??n	p??uco	48	word	2022-04-05 20:27:23.539431
1508	respirar	oddycha??	48	word	2022-04-05 20:27:23.539431
1509	la respiraci??n	oddychanie	48	word	2022-04-05 20:27:23.539431
1510	tocar	dotyka??	48	word	2022-04-05 20:27:23.539431
1511	el pulgar	kciuk	48	word	2022-04-05 20:27:23.539431
1512	la u??a	paznokie??	48	word	2022-04-05 20:27:23.539431
1513	el cr??dito	kredyt	49	word	2022-04-05 20:28:11.30031
1514	comprar a cr??dito	kupowa?? na kredyt	49	word	2022-04-05 20:28:11.30031
1515	la tarjeta de cr??dito	karta kredytowa	49	word	2022-04-05 20:28:11.30031
1516	el efectivo	got??wka	49	word	2022-04-05 20:28:11.30031
1517	el aut??mata	automat	49	word	2022-04-05 20:28:11.30031
1518	autom??tico	automatyczny	49	word	2022-04-05 20:28:11.30031
1519	el billete de banco	banknot	49	word	2022-04-05 20:28:11.30031
1520	la moneda	moneta	49	word	2022-04-05 20:28:11.30031
1521	la vuelta	reszta	49	word	2022-04-05 20:28:11.30031
1522	la cuenta	konto	49	word	2022-04-05 20:28:11.30031
1523	ingresar	wp??aca??	49	word	2022-04-05 20:28:11.30031
1524	el ingreso	wp??ata	49	word	2022-04-05 20:28:11.30031
1525	retirar	podejmowa?? (pieni??dze)	49	word	2022-04-05 20:28:11.30031
1526	el cheque	czek	49	word	2022-04-05 20:28:11.30031
1527	la factura	rachunek, faktura	49	word	2022-04-05 20:28:11.30031
1528	valer	kosztowa??, mie?? warto???? (1g)	49	word	2022-04-05 20:28:11.30031
1529	el valor	warto????	49	word	2022-04-05 20:28:11.30031
1530	valioso	warto??ciowy	49	word	2022-04-05 20:28:11.30031
1531	suficiente	wystarczaj??cy	49	word	2022-04-05 20:28:11.30031
1532	faltar	brakowa??	49	word	2022-04-05 20:28:11.30031
1533	la falta	brak	49	word	2022-04-05 20:28:11.30031
1534	deber	by?? d??u??nym	49	word	2022-04-05 20:28:11.30031
1535	la deuda	d??ug	49	word	2022-04-05 20:28:11.30031
1536	devolver	oddawa??, zwraca??	49	word	2022-04-05 20:28:11.30031
1537	la devoluci??n	oddanie, zwrot	49	word	2022-04-05 20:28:11.30031
1538	el riesgo	ryzyko	49	word	2022-04-05 20:28:11.30031
1539	la econom??a	gospodarka, ekonomia	49	word	2022-04-05 20:28:11.30031
1540	el economista	ekonomista	49	word	2022-04-05 20:28:11.30031
1541	econ??mico	gospodarczy, ekonomiczny	49	word	2022-04-05 20:28:11.30031
1542	el mercado	rynek	49	word	2022-04-05 20:28:11.30031
1543	la propiedad	w??asno????	49	word	2022-04-05 20:28:11.30031
1544	el propietario	w??a??ciciel	49	word	2022-04-05 20:28:11.30031
1545	propio	w??asny	49	word	2022-04-05 20:28:11.30031
1546	producir	produkowa?? (c/zc)	49	word	2022-04-05 20:28:11.30031
1547	el producto	produkt	49	word	2022-04-05 20:28:11.30031
1548	la producci??n	produkcja	49	word	2022-04-05 20:28:11.30031
1549	desarrollar	rozwija??	49	word	2022-04-05 20:28:11.30031
1550	el desarrollo	rozw??j	49	word	2022-04-05 20:28:11.30031
1551	subir	zwi??ksza??, podnosi??, rosn????	49	word	2022-04-05 20:28:11.30031
1552	la subida	wzrost (cen)	49	word	2022-04-05 20:28:11.30031
1553	bajar	zmniejsza??, obni??a??	49	word	2022-04-05 20:28:11.30031
1554	la bajada	spadek	49	word	2022-04-05 20:28:11.30031
1555	la crisis	kryzys	49	word	2022-04-05 20:28:11.30031
1556	el impuesto	podatek	49	word	2022-04-05 20:28:11.30031
1557	exportar	eksportowa??	49	word	2022-04-05 20:28:11.30031
1558	la exportaci??n	eksport	49	word	2022-04-05 20:28:11.30031
1559	el exportador	eksporter	49	word	2022-04-05 20:28:11.30031
1560	importar	importowa??	49	word	2022-04-05 20:28:11.30031
1561	la importaci??n	import	49	word	2022-04-05 20:28:11.30031
1562	el importador	importer	49	word	2022-04-05 20:28:11.30031
1563	Europa	Europa	50	word	2022-04-05 20:29:09.055817
1564	el europeo	Europejczyk	50	word	2022-04-05 20:29:09.055817
1565	Suecia	Szwecja	50	word	2022-04-05 20:29:09.055817
1566	el sueco	Szwed	50	word	2022-04-05 20:29:09.055817
1567	Finlandia	Finlandia	50	word	2022-04-05 20:29:09.055817
1568	el finland??s	Fin	50	word	2022-04-05 20:29:09.055817
1569	Noruega	Norwegia	50	word	2022-04-05 20:29:09.055817
1570	el noruego	Norweg	50	word	2022-04-05 20:29:09.055817
1571	Suiza	Szwajcaria	50	word	2022-04-05 20:29:09.055817
1572	el suizo	Szwajcar	50	word	2022-04-05 20:29:09.055817
1573	Austria	Austria	50	word	2022-04-05 20:29:09.055817
1574	el austriaco	Austriak	50	word	2022-04-05 20:29:09.055817
1575	Hungr??a	W??gry	50	word	2022-04-05 20:29:09.055817
1576	el h??ngaro	W??gier	50	word	2022-04-05 20:29:09.055817
1577	Portugal	Portugalia	50	word	2022-04-05 20:29:09.055817
1578	el portugu??s	Portugalczyk	50	word	2022-04-05 20:29:09.055817
1579	la portuguesa	Portugalka	50	word	2022-04-05 20:29:09.055817
1580	Marruecos	Maroko	50	word	2022-04-05 20:29:09.055817
1581	el marroqu??	Maroka??czyk	50	word	2022-04-05 20:29:09.055817
1582	limitar	graniczy??	50	word	2022-04-05 20:29:09.055817
1583	Am??rica del Norte	Ameryka P????nocna	50	word	2022-04-05 20:29:09.055817
1584	Canad??	Kanada	50	word	2022-04-05 20:29:09.055817
1585	el canadiense	Kanadyjczyk	50	word	2022-04-05 20:29:09.055817
1586	Centroam??rica	Ameryka ??rodkowa	50	word	2022-04-05 20:29:09.055817
1587	Am??rica del Sur	Ameryka Po??udniowa	50	word	2022-04-05 20:29:09.055817
1588	Asia	Azja	50	word	2022-04-05 20:29:09.055817
1589	el asi??tico	Azjata	50	word	2022-04-05 20:29:09.055817
1590	Jap??n	Japonia	50	word	2022-04-05 20:29:09.055817
1591	el japon??s	Japo??czyk	50	word	2022-04-05 20:29:09.055817
1592	la japonesa	Japonka	50	word	2022-04-05 20:29:09.055817
1593	China	Chiny	50	word	2022-04-05 20:29:09.055817
1594	el chino	Chi??czyk	50	word	2022-04-05 20:29:09.055817
1595	??frica	Afryka	50	word	2022-04-05 20:29:09.055817
1596	el africano	Afrykanin	50	word	2022-04-05 20:29:09.055817
1597	Australia	Australia	50	word	2022-04-05 20:29:09.055817
1598	el australiano	Australijczyk	50	word	2022-04-05 20:29:09.055817
1599	la literatura	literatura	51	word	2022-04-05 20:29:41.874472
1600	el escritor	pisarz	51	word	2022-04-05 20:29:41.874472
1601	la novela	powie????	51	word	2022-04-05 20:29:41.874472
1602	la poes??a	poezja	51	word	2022-04-05 20:29:41.874472
1603	el poeta	poeta	51	word	2022-04-05 20:29:41.874472
1604	el poema	wiersz	51	word	2022-04-05 20:29:41.874472
1605	el autor	autor	51	word	2022-04-05 20:29:41.874472
1606	el t??tulo	tytu??	51	word	2022-04-05 20:29:41.874472
1609	el espect??culo	przedstawienie, spektakl	51	word	2022-04-05 20:29:41.874472
1610	tener lugar	odbywa?? si?? (nr)	51	word	2022-04-05 20:29:41.874472
1611	espl??ndido	??wietny, znakomity	51	word	2022-04-05 20:29:41.874472
1612	obtener	otrzymywa?? (nr)	51	word	2022-04-05 20:29:41.874472
1613	el p??blico	publiczno????	51	word	2022-04-05 20:29:41.874472
1614	la popularidad	popularno????	51	word	2022-04-05 20:29:41.874472
1615	popular	popularny	51	word	2022-04-05 20:29:41.874472
1616	la ??pera	opera	51	word	2022-04-05 20:29:41.874472
1617	el ballet	balet	51	word	2022-04-05 20:29:41.874472
1618	el festival	festiwal	51	word	2022-04-05 20:29:41.874472
1619	el instrumento	instrument	51	word	2022-04-05 20:29:41.874472
1620	el viol??n	skrzypce	51	word	2022-04-05 20:29:41.874472
1621	el carnaval	karnawa??	51	word	2022-04-05 20:29:41.874472
1622	la feria	jarmark	51	word	2022-04-05 20:29:41.874472
1623	el artista	artysta	51	word	2022-04-05 20:29:41.874472
1624	art??stico	artystyczny	51	word	2022-04-05 20:29:41.874472
1625	la pintura	malarstwo	51	word	2022-04-05 20:29:41.874472
1626	la escultura	rze??ba	51	word	2022-04-05 20:29:41.874472
1627	el escultor	rze??biarz	51	word	2022-04-05 20:29:41.874472
1628	la arquitectura	architektura	51	word	2022-04-05 20:29:41.874472
1629	arquitect??nico	architektoniczny	51	word	2022-04-05 20:29:41.874472
1630	fotografiar	fotografowa??	51	word	2022-04-05 20:29:41.874472
1631	el fot??grafo	fotograf	51	word	2022-04-05 20:29:41.874472
1632	la galer??a	galeria	51	word	2022-04-05 20:29:41.874472
1633	exponer	wystawia?? (1g)	51	word	2022-04-05 20:29:41.874472
1634	la exposici??n	wystawa	51	word	2022-04-05 20:29:41.874472
1635	el ??xito	sukces, powodzenie	51	word	2022-04-05 20:29:41.874472
1636	el paquete	paczka	52	word	2022-04-05 20:30:23.757045
1637	el sobre	koperta	52	word	2022-04-05 20:30:23.757045
1638	el buz??n	skrzynka na listy	52	word	2022-04-05 20:30:23.757045
1639	m??vil	ruchomy	52	word	2022-04-05 20:30:23.757045
1640	el m??vil	kom??rka (telefon)	52	word	2022-04-05 20:30:23.757045
1641	coger el tel??fono	odbiera?? telefon	52	word	2022-04-05 20:30:23.757045
1642	colgar el tel??fono	odk??ada?? s??uchawk?? (o/ue)	52	word	2022-04-05 20:30:23.757045
1643	equivocarse	myli?? si??	52	word	2022-04-05 20:30:23.757045
1644	el recado	wiadomo???? (r )	52	word	2022-04-05 20:30:23.757045
1645	mandar	wysy??a??, przekazywa??	52	word	2022-04-05 20:30:23.757045
1646	el disco compacto	p??yta kompaktowa	52	word	2022-04-05 20:30:23.757045
1647	la casete	kaseta	52	word	2022-04-05 20:30:23.757045
1648	encender	zapala??, w????cza?? (e/ie)	52	word	2022-04-05 20:30:23.757045
1649	apagar	gasi??, wy????cza??	52	word	2022-04-05 20:30:23.757045
1650	comunicar	komunikowa??	52	word	2022-04-05 20:30:23.757045
1651	la comunicaci??n	komunikacja	52	word	2022-04-05 20:30:23.757045
1652	los medios	media	52	word	2022-04-05 20:30:23.757045
1653	la prensa	prasa	52	word	2022-04-05 20:30:23.757045
1654	el periodismo	dziennikarstwo	52	word	2022-04-05 20:30:23.757045
1655	el periodista	dziennikarz	52	word	2022-04-05 20:30:23.757045
1656	el reportaje	reporta??	52	word	2022-04-05 20:30:23.757045
1657	el reportero	reporter	52	word	2022-04-05 20:30:23.757045
1658	el art??culo	artyku??	52	word	2022-04-05 20:30:23.757045
1659	entrevistar	przeprowadza?? wywiad	52	word	2022-04-05 20:30:23.757045
1660	la entrevista	wywiad	52	word	2022-04-05 20:30:23.757045
1661	el anuncio	og??oszenie	52	word	2022-04-05 20:30:23.757045
1662	el anuncio comercial	reklama (a)	52	word	2022-04-05 20:30:23.757045
1663	la t??cnica	technika	52	word	2022-04-05 20:30:23.757045
1664	t??cnico	techniczny	52	word	2022-04-05 20:30:23.757045
1665	usar	u??ywa??	52	word	2022-04-05 20:30:23.757045
1666	el uso	u??ywanie	52	word	2022-04-05 20:30:23.757045
1667	el usuario	u??ytkownik	52	word	2022-04-05 20:30:23.757045
1668	fotocopiar	kopiowa??	52	word	2022-04-05 20:30:23.757045
1669	la fotocopia	kopia	52	word	2022-04-05 20:30:23.757045
1670	la fotocopiadora	kopiarka	52	word	2022-04-05 20:30:23.757045
1671	imprimir	drukowa??	52	word	2022-04-05 20:30:23.757045
1672	la impresora	drukarka	52	word	2022-04-05 20:30:23.757045
1673	port??til	przeno??ny	52	word	2022-04-05 20:30:23.757045
1674	el port??til	laptop	52	word	2022-04-05 20:30:23.757045
1675	electr??nico	elektroniczny	52	word	2022-04-05 20:30:23.757045
1676	la prenda de vestir	cz?????? garderoby	53	word	2022-04-05 20:31:03.973449
1677	la gorra	czapka z daszkiem	53	word	2022-04-05 20:31:03.973449
1678	la bufanda	szalik	53	word	2022-04-05 20:31:03.973449
1679	el guante	r??kawiczka	53	word	2022-04-05 20:31:03.973449
1680	poner	wk??ada??, zak??ada??	53	word	2022-04-05 20:31:03.973449
1681	quitar	zdejmowa??	53	word	2022-04-05 20:31:03.973449
1682	desnudo	nagi	53	word	2022-04-05 20:31:03.973449
1683	el traje	garnitur	53	word	2022-04-05 20:31:03.973449
1684	la chaqueta	marynarka	53	word	2022-04-05 20:31:03.973449
1685	la corbata	krawat	53	word	2022-04-05 20:31:03.973449
1686	el cuadro	kratka (wz??r)	53	word	2022-04-05 20:31:03.973449
1687	la raya	pasek (wz??r)	53	word	2022-04-05 20:31:03.973449
1688	estampado	wzorzysty, we wzory	53	word	2022-04-05 20:31:03.973449
1689	el pijama	pi??ama	53	word	2022-04-05 20:31:03.973449
1690	el bot??n	guzik	53	word	2022-04-05 20:31:03.973449
1691	la media	po??czocha	53	word	2022-04-05 20:31:03.973449
1692	los leotardos	rajstopy	53	word	2022-04-05 20:31:03.973449
1693	probar	przymierza?? (o/ue)	53	word	2022-04-05 20:31:03.973449
1694	el probador	przymierzalnia	53	word	2022-04-05 20:31:03.973449
1695	la talla	rozmiar	53	word	2022-04-05 20:31:03.973449
1696	quedar	pasowa??	53	word	2022-04-05 20:31:03.973449
1697	el modelo	model	53	word	2022-04-05 20:31:03.973449
1698	la modelo	modelka	53	word	2022-04-05 20:31:03.973449
1699	dise??ar	projektowa??	53	word	2022-04-05 20:31:03.973449
1700	el dise??o	wz??r	53	word	2022-04-05 20:31:03.973449
1701	el dise??ador	projektant	53	word	2022-04-05 20:31:03.973449
1702	el vestido	ubranie; suknia	53	word	2022-04-05 20:31:03.973449
1703	elegante	elegancki	53	word	2022-04-05 20:31:03.973449
1704	el collar	naszyjnik	53	word	2022-04-05 20:31:03.973449
1705	el pendiente	kolczyk	53	word	2022-04-05 20:31:03.973449
1706	acordarse	pami??ta??, przypomina?? sobie (o/ue)	54	word	2022-04-05 20:31:40.326559
1707	charlar	potocznie: rozmawia??, gaw??dzi??	54	word	2022-04-05 20:31:40.326559
1708	conversar	rozmawia??	54	word	2022-04-05 20:31:40.326559
1709	la conversaci??n	rozmowa	54	word	2022-04-05 20:31:40.326559
1710	salud	na zdrowie (toast; po kichni??ciu)	54	word	2022-04-05 20:31:40.326559
1711	quedar	umawia?? si??	54	word	2022-04-05 20:31:40.326559
1712	despedirse	??egna?? si?? (e/i)	54	word	2022-04-05 20:31:40.326559
1713	la despedida	po??egnanie	54	word	2022-04-05 20:31:40.326559
1714	cordial	serdeczny	54	word	2022-04-05 20:31:40.326559
1715	igualmente	nawzajem	54	word	2022-04-05 20:31:40.326559
1716	mentir	k??ama??	54	word	2022-04-05 20:31:40.326559
1717	la mentira	k??amstwo	54	word	2022-04-05 20:31:40.326559
1718	disculparse	usprawiedliwia?? si??	54	word	2022-04-05 20:31:40.326559
1719	la disculpa	usprawiedliwienie	54	word	2022-04-05 20:31:40.326559
1720	la excepci??n	wyj??tek	54	word	2022-04-05 20:31:40.326559
1721	excepcional	wyj??tkowy	54	word	2022-04-05 20:31:40.326559
1722	el favor	przys??uga	54	word	2022-04-05 20:31:40.326559
1723	las gracias	podzi??kowanie	54	word	2022-04-05 20:31:40.326559
1724	no hay de qu??	nie ma za co	54	word	2022-04-05 20:31:40.326559
1725	interpretar	t??umaczy?? (rozmow??)	54	word	2022-04-05 20:31:40.326559
1726	el int??rprete	t??umacz (w rozmowie)	54	word	2022-04-05 20:31:40.326559
1727	perfecto	doskona??y	54	word	2022-04-05 20:31:40.326559
1728	perfectamente	doskonale	54	word	2022-04-05 20:31:40.326559
1729	el nivel	poziom	54	word	2022-04-05 20:31:40.326559
1730	elemental	podstawowy	54	word	2022-04-05 20:31:40.326559
1731	intermedio	??rednio zaawansowany	54	word	2022-04-05 20:31:40.326559
1732	avanzado	zaawansowany	54	word	2022-04-05 20:31:40.326559
1733	la tierra	ziemia, l??d	55	word	2022-04-05 20:32:12.642644
1734	cultivar	uprawia??	55	word	2022-04-05 20:32:12.642644
1735	la tierra firme	sta??y l??d	55	word	2022-04-05 20:32:12.642644
1736	el territorio	obszar, terytorium	55	word	2022-04-05 20:32:12.642644
1737	la jungla	d??ungla	55	word	2022-04-05 20:32:12.642644
1738	el prado	????ka	55	word	2022-04-05 20:32:12.642644
1739	el valle	dolina	55	word	2022-04-05 20:32:12.642644
1740	la cumbre	wierzcho??ek, szczyt	55	word	2022-04-05 20:32:12.642644
1741	el desierto	pustynia	55	word	2022-04-05 20:32:12.642644
1742	la arena	piasek	55	word	2022-04-05 20:32:12.642644
1743	arenoso	piaszczysty	55	word	2022-04-05 20:32:12.642644
1744	la piedra	kamie??	55	word	2022-04-05 20:32:12.642644
1745	pedregoso	kamienisty	55	word	2022-04-05 20:32:12.642644
1746	la costa	wybrze??e	55	word	2022-04-05 20:32:12.642644
1747	la ola	fala	55	word	2022-04-05 20:32:12.642644
1748	la concha	muszla	55	word	2022-04-05 20:32:12.642644
1749	profundo	g????boki	55	word	2022-04-05 20:32:12.642644
1750	poco profundo	p??ytki	55	word	2022-04-05 20:32:12.642644
1751	salir	wschodzi?? (o s??o??cu) (1g)	55	word	2022-04-05 20:32:12.642644
1752	la salida	wsch??d	55	word	2022-04-05 20:32:12.642644
1753	ponerse	zachodzi?? (o s??o??cu) (1g)	55	word	2022-04-05 20:32:12.642644
1754	la puesta	zach??d	55	word	2022-04-05 20:32:12.642644
1755	observar	obserwowa??	55	word	2022-04-05 20:32:12.642644
1756	la observaci??n	obserwacja	55	word	2022-04-05 20:32:12.642644
1757	el paisaje	krajobraz	55	word	2022-04-05 20:32:12.642644
1758	los alrededores	okolice	55	word	2022-04-05 20:32:12.642644
1759	la ecolog??a	ekologia	55	word	2022-04-05 20:32:12.642644
1760	ecol??gico	ekologiczny	55	word	2022-04-05 20:32:12.642644
1761	perjudicar	szkodzi??, krzywdzi??	55	word	2022-04-05 20:32:12.642644
1762	el perjuicio	szkoda, krzywda	55	word	2022-04-05 20:32:12.642644
1763	perjudicial	szkodliwy, krzywdz??cy	55	word	2022-04-05 20:32:12.642644
1764	contaminar	zanieczyszcza??	55	word	2022-04-05 20:32:12.642644
1765	la contaminaci??n	zanieczyszczenie	55	word	2022-04-05 20:32:12.642644
1766	el contaminante	substancja zanieczyszczaj??ca	55	word	2022-04-05 20:32:12.642644
1767	la atm??sfera	atmosfera	55	word	2022-04-05 20:32:12.642644
1768	el gas	gaz	55	word	2022-04-05 20:32:12.642644
1769	el gas de escape	spaliny	55	word	2022-04-05 20:32:12.642644
1770	el residuo	odpad	55	word	2022-04-05 20:32:12.642644
1771	las aguas residuales	??cieki	55	word	2022-04-05 20:32:12.642644
1772	el agujero	dziura	55	word	2022-04-05 20:32:12.642644
1773	la selva	puszcza	55	word	2022-04-05 20:32:12.642644
1774	la selva tropical	las tropikalny	55	word	2022-04-05 20:32:12.642644
1775	destruir	niszczy??	55	word	2022-04-05 20:32:12.642644
1776	la destrucci??n	zniszczenie	55	word	2022-04-05 20:32:12.642644
1777	el colegio	szko??a podstawowa, gimnazjum	56	word	2022-04-05 20:32:49.143122
1778	el instituto	liceum	56	word	2022-04-05 20:32:49.143122
1779	la universidad polit??cnica	politechnika	56	word	2022-04-05 20:32:49.143122
1780	ense??ar	uczy??, naucza??	56	word	2022-04-05 20:32:49.143122
1781	la ense??anza	nauczanie, wykszta??cenie	56	word	2022-04-05 20:32:49.143122
1782	la ense??anza primaria	wykszta??cenie podstawowe	56	word	2022-04-05 20:32:49.143122
1783	la ense??anza secundaria	wykszta??cenie ??rednie	56	word	2022-04-05 20:32:49.143122
1784	la ense??anza superior	wykszta??cenie wy??sze	56	word	2022-04-05 20:32:49.143122
1785	el m??todo	metoda	56	word	2022-04-05 20:32:49.143122
1786	exigir	wymaga??	56	word	2022-04-05 20:32:49.143122
1787	exigente	wymagaj??cy	56	word	2022-04-05 20:32:49.143122
1788	molestar	przeszkadza??	56	word	2022-04-05 20:32:49.143122
1789	atender	uwa??a??, uwa??nie s??ucha?? (e/ie)	56	word	2022-04-05 20:32:49.143122
1790	la atenci??n	uwaga	56	word	2022-04-05 20:32:49.143122
1791	atento	uwa??ny	56	word	2022-04-05 20:32:49.143122
1792	explicar	wyja??nia??, t??umaczy??	56	word	2022-04-05 20:32:49.143122
1793	la explicaci??n	wyja??nienie, t??umaczenie	56	word	2022-04-05 20:32:49.143122
1794	comparar	por??wnywa??	56	word	2022-04-05 20:32:49.143122
1795	la comparaci??n	por??wnanie	56	word	2022-04-05 20:32:49.143122
1796	sistem??tico	systematyczny	56	word	2022-04-05 20:32:49.143122
1797	sistem??ticamente	systematycznie	56	word	2022-04-05 20:32:49.143122
1798	anotar	notowa??	56	word	2022-04-05 20:32:49.143122
1799	la nota	notatka, adnotacja	56	word	2022-04-05 20:32:49.143122
1800	tomar notas	robi?? notatki	56	word	2022-04-05 20:32:49.143122
1801	prepararse	przygotowywa?? si??	56	word	2022-04-05 20:32:49.143122
1802	la memoria	pami????	56	word	2022-04-05 20:32:49.143122
1803	el vocabulario	s??ownictwo	56	word	2022-04-05 20:32:49.143122
1804	el cap??tulo	rozdzia??	56	word	2022-04-05 20:32:49.143122
1805	la sala	sala	56	word	2022-04-05 20:32:49.143122
1806	la sala de lectura	czytelnia	56	word	2022-04-05 20:32:49.143122
1807	la sala de espera	poczekalnia	56	word	2022-04-05 20:32:49.143122
1808	contestar	odpowiada??	56	word	2022-04-05 20:32:49.143122
1809	subrayar	podkre??la??	56	word	2022-04-05 20:32:49.143122
1810	aprobar	zda?? (o egzaminie) (o/ue)	56	word	2022-04-05 20:32:49.143122
1811	el bachillerato	matura	56	word	2022-04-05 20:32:49.143122
1812	corregir	poprawia?? (e/i)	56	word	2022-04-05 20:32:49.143122
1813	la correcci??n	poprawka	56	word	2022-04-05 20:32:49.143122
1814	la dificultad	trudno????	56	word	2022-04-05 20:32:49.143122
1815	la estupidez	g??upota, t??pota	56	word	2022-04-05 20:32:49.143122
1816	est??pido	g??upi	56	word	2022-04-05 20:32:49.143122
1817	la raz??n	rozum, rozs??dek	56	word	2022-04-05 20:32:49.143122
1818	la sabidur??a	m??dro????	56	word	2022-04-05 20:32:49.143122
1819	el sabio	m??drzec	56	word	2022-04-05 20:32:49.143122
1820	sabio	uczony, m??dry	56	word	2022-04-05 20:32:49.143122
1821	inventar	wynale????	56	word	2022-04-05 20:32:49.143122
1822	la invenci??n	wynalazek	56	word	2022-04-05 20:32:49.143122
1823	el inventor	wynalazca	56	word	2022-04-05 20:32:49.143122
1824	descubrir	odkrywa??	56	word	2022-04-05 20:32:49.143122
1825	el descubrimiento	odkrycie	56	word	2022-04-05 20:32:49.143122
1826	el descubridor	odkrywca	56	word	2022-04-05 20:32:49.143122
1827	si	je??eli	57	word	2022-04-05 20:34:10.341997
1828	quiz??s	mo??e	57	word	2022-04-05 20:34:10.341997
1829	por supuesto	oczywi??cie	57	word	2022-04-05 20:34:10.341997
1830	pues	zatem, wi??c	57	word	2022-04-05 20:34:10.341997
1831	entonces	wobec tego	57	word	2022-04-05 20:34:10.341997
1832	exacto	dok??adny, ??cis??y	57	word	2022-04-05 20:34:10.341997
1833	referirse	dotyczy?? (e/ie)	57	word	2022-04-05 20:34:10.341997
1834	ante todo	przede wszystkim	57	word	2022-04-05 20:34:10.341997
1835	el sentido	sens	57	word	2022-04-05 20:34:10.341997
1836	comprender	rozumie??, pojmowa??	57	word	2022-04-05 20:34:10.341997
1837	adem??s	poza tym, opr??cz tego	57	word	2022-04-05 20:34:10.341997
1838	sin embargo	pomimo to, niemniej jednak	57	word	2022-04-05 20:34:10.341997
1839	dudar	w??tpi??	57	word	2022-04-05 20:34:10.341997
1840	la duda	w??tpliwo????	57	word	2022-04-05 20:34:10.341997
1841	sin duda	niew??tpliwie	57	word	2022-04-05 20:34:10.341997
1842	cierto	pewny	57	word	2022-04-05 20:34:10.341997
1843	la posibilidad	mo??liwo????	57	word	2022-04-05 20:34:10.341997
1844	l??gico	logiczny	57	word	2022-04-05 20:34:10.341997
1845	il??gico	nielogiczny	57	word	2022-04-05 20:34:10.341997
1846	etc??tera	i tak dalej	57	word	2022-04-05 20:34:10.341997
1847	probable	prawdopodobny	57	word	2022-04-05 20:34:10.341997
1848	improbable	nieprawdopodobny	57	word	2022-04-05 20:34:10.341997
1849	probablemente	prawdopodobnie	57	word	2022-04-05 20:34:10.341997
1850	la raz??n	racja	57	word	2022-04-05 20:34:10.341997
1851	el acuerdo	porozumienie	57	word	2022-04-05 20:34:10.341997
1852	distinguir	rozr????nia??	57	word	2022-04-05 20:34:10.341997
1853	la distinci??n	rozr????nienie	57	word	2022-04-05 20:34:10.341997
1854	distinto	r????ny, odmienny	57	word	2022-04-05 20:34:10.341997
1855	la manera	spos??b	57	word	2022-04-05 20:34:10.341997
1856	de esta manera	w ten spos??b	57	word	2022-04-05 20:34:10.341997
1857	de otra manera	inaczej, w inny spos??b	57	word	2022-04-05 20:34:10.341997
1858	debido	z powodu	57	word	2022-04-05 20:34:10.341997
1859	incluso	nawet	57	word	2022-04-05 20:34:10.341997
1860	parecer	wydawa?? si??, zdawa?? si?? (c/zc)	57	word	2022-04-05 20:34:10.341997
1861	suponer	przypuszcza?? (1g)	57	word	2022-04-05 20:34:10.341997
1862	la suposici??n	przypuszczenie	57	word	2022-04-05 20:34:10.341997
1863	la seguridad	pewno????	57	word	2022-04-05 20:34:10.341997
1864	seguramente	z pewno??ci??	57	word	2022-04-05 20:34:10.341997
1865	seg??n	wed??ug, zgodnie z	57	word	2022-04-05 20:34:10.341997
1866	adecuado	odpowiedni, w??a??ciwy	57	word	2022-04-05 20:34:10.341997
1867	intentar	zamierza??	58	word	2022-04-05 20:34:43.251216
1868	la intenci??n	zamiar	58	word	2022-04-05 20:34:43.251216
1869	ofrecer	oferowa?? (c/zc)	58	word	2022-04-05 20:34:43.251216
1870	la oferta	oferta	58	word	2022-04-05 20:34:43.251216
1871	el visado	wiza	58	word	2022-04-05 20:34:43.251216
1872	el paso	przej??cie	58	word	2022-04-05 20:34:43.251216
1873	fronterizo	graniczny	58	word	2022-04-05 20:34:43.251216
1874	controlar	kontrolowa??	58	word	2022-04-05 20:34:43.251216
1875	el control	kontrola	58	word	2022-04-05 20:34:43.251216
1876	el prop??sito	cel	58	word	2022-04-05 20:34:43.251216
1877	la aduana	c??o, urz??d celny	58	word	2022-04-05 20:34:43.251216
1878	el aduanero	celnik	58	word	2022-04-05 20:34:43.251216
1879	declarar	deklarowa??, zg??asza??	58	word	2022-04-05 20:34:43.251216
1880	la declaraci??n	deklaracja, zg??oszenie	58	word	2022-04-05 20:34:43.251216
1881	alojar	zakwaterowa??	58	word	2022-04-05 20:34:43.251216
1882	el alojamiento	zakwaterowanie	58	word	2022-04-05 20:34:43.251216
1883	el albergue	schronisko	58	word	2022-04-05 20:34:43.251216
1884	la posada	hotel, pensjonat; karczma, gospoda	58	word	2022-04-05 20:34:43.251216
1885	la pensi??n	pensjonat, hotelik	58	word	2022-04-05 20:34:43.251216
1886	la recepci??n	recepcja	58	word	2022-04-05 20:34:43.251216
1887	el recepcionista	recepcjonista	58	word	2022-04-05 20:34:43.251216
1888	la habitaci??n individual	pok??j jednoosobowy	58	word	2022-04-05 20:34:43.251216
1889	la habitaci??n doble	pok??j dwuosobowy	58	word	2022-04-05 20:34:43.251216
1890	la vista	widok	58	word	2022-04-05 20:34:43.251216
1891	fenomenal	wspania??y, genialny	58	word	2022-04-05 20:34:43.251216
1892	admirar	podziwia??	58	word	2022-04-05 20:34:43.251216
1893	la admiraci??n	podziw	58	word	2022-04-05 20:34:43.251216
1894	encantar	zachwyca??, urzeka??	58	word	2022-04-05 20:34:43.251216
1895	el folleto	folder, prospekt	58	word	2022-04-05 20:34:43.251216
1896	el castillo	zamek	58	word	2022-04-05 20:34:43.251216
1897	la entrada	wst??p, bilet wst??pu	58	word	2022-04-05 20:34:43.251216
1898	relajarse	relaksowa?? si??	58	word	2022-04-05 20:34:43.251216
1899	la relajaci??n	relaks	58	word	2022-04-05 20:34:43.251216
1900	hermoso	pi??kny	58	word	2022-04-05 20:34:43.251216
1901	la aventura	przygoda	58	word	2022-04-05 20:34:43.251216
1902	regresar	wraca??	58	word	2022-04-05 20:34:43.251216
1903	el regreso	powr??t	58	word	2022-04-05 20:34:43.251216
1904	pronosticar	prognozowa??, przepowiada??	59	word	2022-04-05 20:35:17.009141
1905	el pron??stico	prognoza, przepowiednia	59	word	2022-04-05 20:35:17.009141
1906	la helada	mr??z, przymrozek	59	word	2022-04-05 20:35:17.009141
1907	helado	mro??ny, lodowaty	59	word	2022-04-05 20:35:17.009141
1908	la niebla	mg??a	59	word	2022-04-05 20:35:17.009141
1909	nebuloso	mglisty	59	word	2022-04-05 20:35:17.009141
1910	caluroso	gor??cy, upalny	59	word	2022-04-05 20:35:17.009141
1911	la sombra	cie??	59	word	2022-04-05 20:35:17.009141
1912	la sombrilla	parasolka od s??o??ca	59	word	2022-04-05 20:35:17.009141
1913	la nubosidad	zachmurzenie	59	word	2022-04-05 20:35:17.009141
1914	nuboso	zachmurzony	59	word	2022-04-05 20:35:17.009141
1915	soplar	wia??	59	word	2022-04-05 20:35:17.009141
1916	fresco	ch??odny	59	word	2022-04-05 20:35:17.009141
1917	el hurac??n	huragan	59	word	2022-04-05 20:35:17.009141
1918	la tormenta	burza	59	word	2022-04-05 20:35:17.009141
1919	tronar	grzmie?? (o/ue)	59	word	2022-04-05 20:35:17.009141
1920	el trueno	grzmot	59	word	2022-04-05 20:35:17.009141
1921	relampaguear	b??yska?? si??	59	word	2022-04-05 20:35:17.009141
1922	el rel??mpago	b??yskawica, piorun	59	word	2022-04-05 20:35:17.009141
1923	el rayo	promie??, b??yskawica	59	word	2022-04-05 20:35:17.009141
1924	el arco	??uk	59	word	2022-04-05 20:35:17.009141
1925	el arco iris	t??cza	59	word	2022-04-05 20:35:17.009141
1926	inundar	zalewa??	59	word	2022-04-05 20:35:17.009141
1927	la inundaci??n	pow??d??	59	word	2022-04-05 20:35:17.009141
1928	soltero	stanu wolnego	60	word	2022-04-05 20:35:55.677387
1929	el viudo	wdowiec	60	word	2022-04-05 20:35:55.677387
1930	viudo	owdowia??y	60	word	2022-04-05 20:35:55.677387
1931	casarse	??eni?? si??, wychodzi?? za m????	60	word	2022-04-05 20:35:55.677387
1932	casado	??onaty	60	word	2022-04-05 20:35:55.677387
1933	el matrimonio	ma????e??stwo	60	word	2022-04-05 20:35:55.677387
1934	matrimonial	ma????e??ski	60	word	2022-04-05 20:35:55.677387
1935	la boda	??lub	60	word	2022-04-05 20:35:55.677387
1936	especial	szczeg??lny	60	word	2022-04-05 20:35:55.677387
1937	especialmente	zw??aszcza, szczeg??lnie	60	word	2022-04-05 20:35:55.677387
1938	celebrar	??wi??towa??, obchodzi??	60	word	2022-04-05 20:35:55.677387
1939	la ceremonia	uroczysto????	60	word	2022-04-05 20:35:55.677387
1940	ceremonial	uroczysty	60	word	2022-04-05 20:35:55.677387
1941	bienvenido	serdecznie witamy (jedn?? osob??)	60	word	2022-04-05 20:35:55.677387
1942	la enhorabuena	gratulacje	60	word	2022-04-05 20:35:55.677387
1943	el esposo	ma????onek	60	word	2022-04-05 20:35:55.677387
1944	formar	formowa??, tworzy??	60	word	2022-04-05 20:35:55.677387
1945	la formaci??n	formowanie, tworzenie	60	word	2022-04-05 20:35:55.677387
1946	el hogar	dom (miejsce, w kt??rym czujemy si?? u siebie)	60	word	2022-04-05 20:35:55.677387
1947	el embarazo	ci????a	60	word	2022-04-05 20:35:55.677387
1948	embarazada	w ci????y	60	word	2022-04-05 20:35:55.677387
1949	el gemelo	bli??niak	60	word	2022-04-05 20:35:55.677387
1950	??nico	jedyny	60	word	2022-04-05 20:35:55.677387
1951	el hijo ??nico	jedynak	60	word	2022-04-05 20:35:55.677387
1952	cuidar	troszczy?? si??	60	word	2022-04-05 20:35:55.677387
1953	la guarder??a	????obek	60	word	2022-04-05 20:35:55.677387
1954	la infancia	dzieci??stwo	60	word	2022-04-05 20:35:55.677387
1955	infantil	dzieci??cy	60	word	2022-04-05 20:35:55.677387
1956	el jard??n de la infancia	przedszkole	60	word	2022-04-05 20:35:55.677387
1957	la juventud	m??odzie??	60	word	2022-04-05 20:35:55.677387
1958	juvenil	m??odzie??owy	60	word	2022-04-05 20:35:55.677387
1959	el adulto	doros??y (o osobie)	60	word	2022-04-05 20:35:55.677387
1960	adulto	doros??y	60	word	2022-04-05 20:35:55.677387
1961	el primo	kuzyn	60	word	2022-04-05 20:35:55.677387
1962	la prima	kuzynka	60	word	2022-04-05 20:35:55.677387
1963	el sobrino	bratanek, siostrzeniec	60	word	2022-04-05 20:35:55.677387
1964	la sobrina	bratanica, siostrzenica	60	word	2022-04-05 20:35:55.677387
1965	el cu??ado	szwagier	60	word	2022-04-05 20:35:55.677387
1966	el bisabuelo	pradziadek	60	word	2022-04-05 20:35:55.677387
1967	la bisabuela	prababcia	60	word	2022-04-05 20:35:55.677387
1968	la generaci??n	pokolenie	60	word	2022-04-05 20:35:55.677387
1969	la relaci??n	stosunek, relacja	60	word	2022-04-05 20:35:55.677387
1970	com??n	wsp??lny	60	word	2022-04-05 20:35:55.677387
1971	divorciarse	rozwodzi?? si??	60	word	2022-04-05 20:35:55.677387
1972	el divorcio	rozw??d	60	word	2022-04-05 20:35:55.677387
1973	tirar	ci??gn????	61	word	2022-04-05 20:36:36.912067
1974	empujar	pcha??	61	word	2022-04-05 20:36:36.912067
1975	colocar	stawia??, umieszcza??	61	word	2022-04-05 20:36:36.912067
1976	junto a	przy	61	word	2022-04-05 20:36:36.912067
1977	el fondo	dno, sp??d, t??o	61	word	2022-04-05 20:36:36.912067
1978	la esquina	r??g	61	word	2022-04-05 20:36:36.912067
1979	alrededor	wok????	61	word	2022-04-05 20:36:36.912067
1980	los alrededores	okolice	61	word	2022-04-05 20:36:36.912067
1981	andar	chodzi??	61	word	2022-04-05 20:36:36.912067
1982	caer	upada?? (nr)	61	word	2022-04-05 20:36:36.912067
1983	la ca??da	upadek	61	word	2022-04-05 20:36:36.912067
1984	levantar	podnosi??	61	word	2022-04-05 20:36:36.912067
1985	levantarse	podnosi?? si??	61	word	2022-04-05 20:36:36.912067
1986	para	do (wskazuje na punkt docelowy)	61	word	2022-04-05 20:36:36.912067
1987	hacia	do, w stron??	61	word	2022-04-05 20:36:36.912067
1988	encontrarse	znajdowa?? si?? (o/ue)	61	word	2022-04-05 20:36:36.912067
1989	dirigirse	kierowa?? si??	61	word	2022-04-05 20:36:36.912067
1990	la direcci??n	kierunek	61	word	2022-04-05 20:36:36.912067
1991	adelante	naprz??d	61	word	2022-04-05 20:36:36.912067
1992	torcer	skr??ca?? (c/zc) (o/ue)	61	word	2022-04-05 20:36:36.912067
1993	seguir	i???? za, jecha?? za (nr)	61	word	2022-04-05 20:36:36.912067
1994	mover	porusza?? (o/ue)	61	word	2022-04-05 20:36:36.912067
1995	moverse	porusza?? si?? (o/ue)	61	word	2022-04-05 20:36:36.912067
1996	el movimiento	ruch	61	word	2022-04-05 20:36:36.912067
1997	parar	zatrzyma??	61	word	2022-04-05 20:36:36.912067
1998	pararse	zatrzyma?? si??	61	word	2022-04-05 20:36:36.912067
1999	sin parar	nieustannie, bez przerwy	61	word	2022-04-05 20:36:36.912067
2000	el paso	krok	61	word	2022-04-05 20:36:36.912067
2001	paso a paso	stopniowo, krok po kroku	61	word	2022-04-05 20:36:36.912067
2002	a cada paso	na ka??dym kroku	61	word	2022-04-05 20:36:36.912067
2003	el punto	punkt, miejsce	61	word	2022-04-05 20:36:36.912067
2004	la distancia	odleg??o????	61	word	2022-04-05 20:36:36.912067
2005	dentro	wewn??trz, w ??rodku	61	word	2022-04-05 20:36:36.912067
2006	fuera	na zewn??trz, na dworze	61	word	2022-04-05 20:36:36.912067
2007	transportar	transportowa??	62	word	2022-04-05 20:37:08.662257
2008	el transporte	transport	62	word	2022-04-05 20:37:08.662257
2009	el medio de transporte	??rodek transportu	62	word	2022-04-05 20:37:08.662257
2010	el viaje	podr????, jazda	62	word	2022-04-05 20:37:08.662257
2011	el autocar	autokar	62	word	2022-04-05 20:37:08.662257
2012	la autopista	autostrada	62	word	2022-04-05 20:37:08.662257
2013	la gasolina	benzyna	62	word	2022-04-05 20:37:08.662257
2014	la gasolinera	stacja benzynowa	62	word	2022-04-05 20:37:08.662257
2015	el cami??n	samoch??d ci????arowy	62	word	2022-04-05 20:37:08.662257
2016	el camionero	kierowca samochodu ci????arowego	62	word	2022-04-05 20:37:08.662257
2017	prohibir	zakazywa??, zabrania??	62	word	2022-04-05 20:37:08.662257
2018	la prohibici??n	zakaz	62	word	2022-04-05 20:37:08.662257
2019	el accidente	wypadek	62	word	2022-04-05 20:37:08.662257
2020	chocar	uderza??, zderza?? si??	62	word	2022-04-05 20:37:08.662257
2021	el choque	uderzenie, zderzenie	62	word	2022-04-05 20:37:08.662257
2022	estropear	uszkodzi??, niszczy??	62	word	2022-04-05 20:37:08.662257
2023	estropeado	zepsuty	62	word	2022-04-05 20:37:08.662257
2024	el taller	warsztat, pracownia	62	word	2022-04-05 20:37:08.662257
2025	el mec??nico	mechanik	62	word	2022-04-05 20:37:08.662257
2026	reparar	naprawia??	62	word	2022-04-05 20:37:08.662257
2027	la reparaci??n	naprawa	62	word	2022-04-05 20:37:08.662257
2028	el ferrocarril	kolej	62	word	2022-04-05 20:37:08.662257
2029	la taquilla	okienko (kasowe)	62	word	2022-04-05 20:37:08.662257
2030	directo	bezpo??redni	62	word	2022-04-05 20:37:08.662257
2031	el expreso	poci??g po??pieszny	62	word	2022-04-05 20:37:08.662257
2032	el r??pido	poci??g ekspresowy	62	word	2022-04-05 20:37:08.662257
2033	el and??n	peron	62	word	2022-04-05 20:37:08.662257
2034	la v??a	tor	62	word	2022-04-05 20:37:08.662257
2035	llegar	przybywa??, przyje??d??a??	62	word	2022-04-05 20:37:08.662257
2036	la llegada	przybycie, przyjazd	62	word	2022-04-05 20:37:08.662257
2037	retrasarse	sp????nia?? si??, op????nia?? si??	62	word	2022-04-05 20:37:08.662257
2038	el retraso	sp????nienie, op????nienie	62	word	2022-04-05 20:37:08.662257
2039	el compartimento	przedzia??	62	word	2022-04-05 20:37:08.662257
2040	el asiento	miejsce siedz??ce	62	word	2022-04-05 20:37:08.662257
2041	el transbordo	przesiadka	62	word	2022-04-05 20:37:08.662257
2042	cobrar	pobiera?? nale??no????	62	word	2022-04-05 20:37:08.662257
2043	el revisor	konduktor	62	word	2022-04-05 20:37:08.662257
2044	el vuelo	lot	62	word	2022-04-05 20:37:08.662257
2045	la azafata	stewardesa	62	word	2022-04-05 20:37:08.662257
2046	el horario	rozk??ad (plan)	62	word	2022-04-05 20:37:08.662257
2047	la terminal	terminal	62	word	2022-04-05 20:37:08.662257
2048	el transbordador	prom (r??wnie?? kosmiczny)	62	word	2022-04-05 20:37:08.662257
2049	la barca	????dka, ????d??	62	word	2022-04-05 20:37:08.662257
2050	el almac??n	magazyn	63	word	2022-04-05 20:37:42.033559
2051	grandes almacenes	dom handlowy	63	word	2022-04-05 20:37:42.033559
2052	la florister??a	kwiaciarnia	63	word	2022-04-05 20:37:42.033559
2053	la florista	kwiaciarka	63	word	2022-04-05 20:37:42.033559
2054	la fruter??a	sklep z owocami	63	word	2022-04-05 20:37:42.033559
2055	la verduler??a	sklep z warzywami	63	word	2022-04-05 20:37:42.033559
2056	la charcuter??a	sklep z w??dlinami	63	word	2022-04-05 20:37:42.033559
2057	la droguer??a	drogeria	63	word	2022-04-05 20:37:42.033559
2058	comercial	handlowy	63	word	2022-04-05 20:37:42.033559
2059	rebajar	obni??a?? (ceny)	63	word	2022-04-05 20:37:42.033559
2060	las rebajas	obni??ka (cen)	63	word	2022-04-05 20:37:42.033559
2061	el escaparate	wystawa sklepowa	63	word	2022-04-05 20:37:42.033559
2062	el mostrador	lada sklepowa	63	word	2022-04-05 20:37:42.033559
2063	la lista	lista	63	word	2022-04-05 20:37:42.033559
2064	el art??culo	artyku??	63	word	2022-04-05 20:37:42.033559
2065	la publicidad	reklama (p)	63	word	2022-04-05 20:37:42.033559
2066	atender	obs??ugiwa?? (e/ie)	63	word	2022-04-05 20:37:42.033559
2067	el cat??logo	katalog	63	word	2022-04-05 20:37:42.033559
2068	aconsejar	doradza??	63	word	2022-04-05 20:37:42.033559
2069	el consejo	rada	63	word	2022-04-05 20:37:42.033559
2070	recomendar	poleca??, rekomendowa?? (e/ie)	63	word	2022-04-05 20:37:42.033559
2071	la recomendaci??n	zalecenie, rekomendacja	63	word	2022-04-05 20:37:42.033559
2072	decidirse	decydowa?? si??	63	word	2022-04-05 20:37:42.033559
2073	la decisi??n	decyzja	63	word	2022-04-05 20:37:42.033559
2074	pedir	zamawia?? (e/i)	63	word	2022-04-05 20:37:42.033559
2075	el pedido	zam??wienie	63	word	2022-04-05 20:37:42.033559
2076	el recibo	kwit, pokwitowanie	63	word	2022-04-05 20:37:42.033559
2077	la peluquer??a	salon fryzjerski	63	word	2022-04-05 20:37:42.033559
2078	el peluquero	fryzjer	63	word	2022-04-05 20:37:42.033559
2079	la sastrer??a	zak??ad krawiecki	63	word	2022-04-05 20:37:42.033559
2080	el sastre	krawiec	63	word	2022-04-05 20:37:42.033559
2081	la modista	krawcowa	63	word	2022-04-05 20:37:42.033559
2082	la electricidad	elektryczno????	63	word	2022-04-05 20:37:42.033559
2083	el electricista	elektryk	63	word	2022-04-05 20:37:42.033559
2084	el??ctrico	elektryczny	63	word	2022-04-05 20:37:42.033559
2085	la medicina	medycyna	64	word	2022-04-05 20:38:13.441829
2086	m??dico	medyczny, lekarski	64	word	2022-04-05 20:38:13.441829
2087	deber	by?? zobowi??zanym, musie??	64	word	2022-04-05 20:38:13.441829
2088	la consulta	wizyta u lekarza	64	word	2022-04-05 20:38:13.441829
2089	el consultorio	gabinet lekarski	64	word	2022-04-05 20:38:13.441829
2090	el oculista	okulista	64	word	2022-04-05 20:38:13.441829
2091	examinar	bada??	64	word	2022-04-05 20:38:13.441829
2092	el examen	badanie	64	word	2022-04-05 20:38:13.441829
2093	el paciente	pacjent	64	word	2022-04-05 20:38:13.441829
2094	el sordo	g??uchy (osoba)	64	word	2022-04-05 20:38:13.441829
2095	sordo	g??uchy	64	word	2022-04-05 20:38:13.441829
2096	el ciego	niewidomy, ??lepiec	64	word	2022-04-05 20:38:13.441829
2097	ciego	niewidomy, ??lepy	64	word	2022-04-05 20:38:13.441829
2098	p??lido	blady	64	word	2022-04-05 20:38:13.441829
2099	enfermar	zachorowa??	64	word	2022-04-05 20:38:13.441829
2100	resfriarse	przezi??bia?? si??	64	word	2022-04-05 20:38:13.441829
2101	el resfriado	przezi??bienie	64	word	2022-04-05 20:38:13.441829
2102	la angina	angina	64	word	2022-04-05 20:38:13.441829
2103	vomitar	wymiotowa??	64	word	2022-04-05 20:38:13.441829
2104	el v??mito	wymioty	64	word	2022-04-05 20:38:13.441829
2105	la diarrea	biegunka	64	word	2022-04-05 20:38:13.441829
2106	la alergia	alergia	64	word	2022-04-05 20:38:13.441829
2107	recetar	przepisywa?? (lek)	64	word	2022-04-05 20:38:13.441829
2108	la receta	recepta	64	word	2022-04-05 20:38:13.441829
2109	la tableta	tabletka	64	word	2022-04-05 20:38:13.441829
2110	las gotas	krople	64	word	2022-04-05 20:38:13.441829
2111	el jarabe	syrop	64	word	2022-04-05 20:38:13.441829
2112	el antibi??tico	antybiotyk	64	word	2022-04-05 20:38:13.441829
2113	la vitamina	witamina	64	word	2022-04-05 20:38:13.441829
2114	herirse	zrani?? si?? (e/ie)	64	word	2022-04-05 20:38:13.441829
2115	la herida	zranienie, rana	64	word	2022-04-05 20:38:13.441829
2116	quemarse	oparzy?? si??	64	word	2022-04-05 20:38:13.441829
2117	la quemadura	oparzenie	64	word	2022-04-05 20:38:13.441829
2118	salvar	ratowa??	64	word	2022-04-05 20:38:13.441829
2119	la salvaci??n	ratunek	64	word	2022-04-05 20:38:13.441829
2120	la ambulancia	karetka (pogotowia)	64	word	2022-04-05 20:38:13.441829
2121	sufrir	cierpie??	64	word	2022-04-05 20:38:13.441829
2122	el sufrimiento	cierpienie	64	word	2022-04-05 20:38:13.441829
2123	la inyecci??n	zastrzyk	64	word	2022-04-05 20:38:13.441829
2124	el cirujano	chirurg	64	word	2022-04-05 20:38:13.441829
2125	operar	operowa??	64	word	2022-04-05 20:38:13.441829
2126	la operaci??n	operacja	64	word	2022-04-05 20:38:13.441829
2127	mejorar	wraca?? do zdrowia	64	word	2022-04-05 20:38:13.441829
2128	curarse	wyzdrowie??, wyleczy?? si??	64	word	2022-04-05 20:38:13.441829
2129	la esponja	g??bka	65	word	2022-04-05 20:38:56.156692
2130	el cepillo	szczotka	65	word	2022-04-05 20:38:56.156692
2131	el cepillo de dientes	szczoteczka do z??b??w	65	word	2022-04-05 20:38:56.156692
2132	el gel	??el	65	word	2022-04-05 20:38:56.156692
2133	el desodorante	dezodorant	65	word	2022-04-05 20:38:56.156692
2134	el perfume	perfumy	65	word	2022-04-05 20:38:56.156692
2135	la perfumer??a	perfumeria	65	word	2022-04-05 20:38:56.156692
2136	la higiene	higiena	65	word	2022-04-05 20:38:56.156692
2137	higi??nico	higieniczny	65	word	2022-04-05 20:38:56.156692
2138	el papel higi??nico	papier toaletowy	65	word	2022-04-05 20:38:56.156692
2139	el pa??uelo	chusteczka	65	word	2022-04-05 20:38:56.156692
2140	dormirse	zasypia?? (o/ue)	65	word	2022-04-05 20:38:56.156692
2141	so??ar	??ni??, marzy?? (o/ue)	65	word	2022-04-05 20:38:56.156692
2142	el sue??o	sen, marzenie	65	word	2022-04-05 20:38:56.156692
2143	el despertador	budzik	65	word	2022-04-05 20:38:56.156692
2144	el pueblo	lud, nar??d	66	word	2022-04-05 20:39:32.760713
2145	la patria	ojczyzna	66	word	2022-04-05 20:39:32.760713
2146	el ciudadano	obywatel	66	word	2022-04-05 20:39:32.760713
2147	ciudadano	obywatelski	66	word	2022-04-05 20:39:32.760713
2148	el principado	ksi??stwo	66	word	2022-04-05 20:39:32.760713
2149	el regi??n	region	66	word	2022-04-05 20:39:32.760713
2150	depender	zale??e??	66	word	2022-04-05 20:39:32.760713
2151	la dependencia	zale??no????	66	word	2022-04-05 20:39:32.760713
2152	la independencia	niezale??no????	66	word	2022-04-05 20:39:32.760713
2153	independiente	niezale??ny	66	word	2022-04-05 20:39:32.760713
2154	la diplomacia	dyplomacja	66	word	2022-04-05 20:39:32.760713
2155	el diplom??tico	dyplomata	66	word	2022-04-05 20:39:32.760713
2156	diplom??tico	dyplomatyczny	66	word	2022-04-05 20:39:32.760713
2157	la embajada	ambasada	66	word	2022-04-05 20:39:32.760713
2158	el embajador	ambasador	66	word	2022-04-05 20:39:32.760713
2159	el poder	w??adza, pot??ga	66	word	2022-04-05 20:39:32.760713
2160	poderoso	pot????ny	66	word	2022-04-05 20:39:32.760713
2161	el cargo	urz??d, stanowisko	66	word	2022-04-05 20:39:32.760713
2162	el ministerio	ministerstwo	66	word	2022-04-05 20:39:32.760713
2163	el diputado	pose??	66	word	2022-04-05 20:39:32.760713
2164	la democracia	demokracja	66	word	2022-04-05 20:39:32.760713
2165	democr??tico	demokratyczny	66	word	2022-04-05 20:39:32.760713
2166	el sistema	system	66	word	2022-04-05 20:39:32.760713
2167	el capitalismo	kapitalizm	66	word	2022-04-05 20:39:32.760713
2168	capitalista	kapitalistyczny	66	word	2022-04-05 20:39:32.760713
2169	elegir	wybiera?? (e/i)	66	word	2022-04-05 20:39:32.760713
2170	las elecciones	wybory	66	word	2022-04-05 20:39:32.760713
2171	el candidato	kandydat	66	word	2022-04-05 20:39:32.760713
2172	la candidatura	kandydatura	66	word	2022-04-05 20:39:32.760713
2173	votar	g??osowa??	66	word	2022-04-05 20:39:32.760713
2174	el voto	g??os (w g??osowaniu)	66	word	2022-04-05 20:39:32.760713
2175	la mayor??a	wi??kszo????	66	word	2022-04-05 20:39:32.760713
2176	la minor??a	mniejszo????	66	word	2022-04-05 20:39:32.760713
2177	el l??der	przyw??dca, lider	66	word	2022-04-05 20:39:32.760713
2178	la conferencia	konferencja	66	word	2022-04-05 20:39:32.760713
2179	prometer	obiecywa??	66	word	2022-04-05 20:39:32.760713
2180	la promesa	obietnica	66	word	2022-04-05 20:39:32.760713
2181	reformar	reformowa??	66	word	2022-04-05 20:39:32.760713
2182	la reforma	reforma	66	word	2022-04-05 20:39:32.760713
2183	limitar	ogranicza??	66	word	2022-04-05 20:39:32.760713
2184	la limitaci??n	ograniczenie	66	word	2022-04-05 20:39:32.760713
2185	influir	wp??ywa??	66	word	2022-04-05 20:39:32.760713
2186	la influencia	wp??yw	66	word	2022-04-05 20:39:32.760713
2187	realizar	realizowa??	66	word	2022-04-05 20:39:32.760713
2188	la realizaci??n	realizacja	66	word	2022-04-05 20:39:32.760713
2189	la comisi??n	komisja	66	word	2022-04-05 20:39:32.760713
2190	el miembro	cz??onek	66	word	2022-04-05 20:39:32.760713
2191	proponer	proponowa?? (1g)	66	word	2022-04-05 20:39:32.760713
2192	la propuesta	propozycja	66	word	2022-04-05 20:39:32.760713
2193	oficial	oficjalny, urz??dowy	66	word	2022-04-05 20:39:32.760713
2194	extraoficial	nieoficjalny	66	word	2022-04-05 20:39:32.760713
2195	cooperar	wsp????pracowa??	66	word	2022-04-05 20:39:32.760713
2196	la cooperaci??n	wsp????praca	66	word	2022-04-05 20:39:32.760713
2197	fundar	zak??ada??	66	word	2022-04-05 20:39:32.760713
2198	la fundaci??n	za??o??enie	66	word	2022-04-05 20:39:32.760713
2199	el fundador	za??o??yciel	66	word	2022-04-05 20:39:32.760713
2200	la instituci??n	instytucja	66	word	2022-04-05 20:39:32.760713
2201	unir	????czy??, jednoczy??	66	word	2022-04-05 20:39:32.760713
2202	la uni??n	unia	66	word	2022-04-05 20:39:32.760713
2746	la emoci??n	emocja	82	word	2022-04-07 20:45:10.006344
2747	emocional	emocjonalny	82	word	2022-04-07 20:45:10.006344
2748	la intuici??n	intuicja, przeczucie	82	word	2022-04-07 20:45:10.006344
2749	intuitivo	intuicyjny	82	word	2022-04-07 20:45:10.006344
2750	la voluntad	wola	82	word	2022-04-07 20:45:10.006344
2751	la locura	szale??stwo	82	word	2022-04-07 20:45:10.006344
2752	el romance	romans	82	word	2022-04-07 20:45:10.006344
2753	el amante	kochanek	82	word	2022-04-07 20:45:10.006344
2754	abrazar	??ciska??, obejmowa??	82	word	2022-04-07 20:45:10.006344
2755	el abrazo	u??cisk, obj??cie	82	word	2022-04-07 20:45:10.006344
2756	fiel	wierny	82	word	2022-04-07 20:45:10.006344
2757	merecer	zas??ugiwa??, by?? godnym (c/zc)	82	word	2022-04-07 20:45:10.006344
2758	envidiar	zazdro??ci??	82	word	2022-04-07 20:45:10.006344
2759	la envidia	zazdro????, zawi????	82	word	2022-04-07 20:45:10.006344
2760	envidioso	zazdrosny, zawistny	82	word	2022-04-07 20:45:10.006344
2204	asesinar	mordowa??	67	word	2022-04-05 20:40:15.098647
2205	el asesinato	morderstwo, zab??jstwo	67	word	2022-04-05 20:40:15.098647
2206	el asesino	morderca, zab??jca	67	word	2022-04-05 20:40:15.098647
2207	muerto	martwy	67	word	2022-04-05 20:40:15.098647
2208	vivo	??ywy	67	word	2022-04-05 20:40:15.098647
2209	suicidarse	pope??nia?? samob??jstwo	67	word	2022-04-05 20:40:15.098647
2210	el suicidio	samob??jstwo	67	word	2022-04-05 20:40:15.098647
2211	el suicida	samob??jca	67	word	2022-04-05 20:40:15.098647
2212	forzar	zmusza?? (o/ue)	67	word	2022-04-05 20:40:15.098647
2213	el carterista	z??odziej kieszonkowy	67	word	2022-04-05 20:40:15.098647
2214	el contrabando	przemyt	67	word	2022-04-05 20:40:15.098647
2215	el contrabandista	przemytnik	67	word	2022-04-05 20:40:15.098647
2216	el delito	przest??pstwo	67	word	2022-04-05 20:40:15.098647
2217	el delincuente	przest??pca	67	word	2022-04-05 20:40:15.098647
2218	cometer	pope??nia??	67	word	2022-04-05 20:40:15.098647
2219	sospechar	podejrzewa??	67	word	2022-04-05 20:40:15.098647
2220	el sospechoso	podejrzany (osoba)	67	word	2022-04-05 20:40:15.098647
2221	sospechoso	podejrzany	67	word	2022-04-05 20:40:15.098647
2222	detener	aresztowa?? (1g)	67	word	2022-04-05 20:40:15.098647
2223	la detenci??n	aresztowanie	67	word	2022-04-05 20:40:15.098647
2224	la c??rcel	wi??zienie	67	word	2022-04-05 20:40:15.098647
2225	el preso	wi??zie??	67	word	2022-04-05 20:40:15.098647
2226	huir	ucieka??, zbiega??	67	word	2022-04-05 20:40:15.098647
2227	el jurista	prawnik (j)	67	word	2022-04-05 20:40:15.098647
2228	el abogado	prawnik (a)	67	word	2022-04-05 20:40:15.098647
2229	el abogado de defensa	adwokat	67	word	2022-04-05 20:40:15.098647
2230	la ley	ustawa, prawo	67	word	2022-04-05 20:40:15.098647
2231	el reglamento	przepisy, regulamin	67	word	2022-04-05 20:40:15.098647
2232	el caso	przypadek	67	word	2022-04-05 20:40:15.098647
2233	la culpa	wina	67	word	2022-04-05 20:40:15.098647
2234	culpable	winny	67	word	2022-04-05 20:40:15.098647
2235	la inocencia	niewinno????	67	word	2022-04-05 20:40:15.098647
2236	inocente	niewinny	67	word	2022-04-05 20:40:15.098647
2237	castigar	ukara??	67	word	2022-04-05 20:40:15.098647
2238	el castigo	kara	67	word	2022-04-05 20:40:15.098647
2239	justo	sprawiedliwy	67	word	2022-04-05 20:40:15.098647
2240	injusto	niesprawiedliwy	67	word	2022-04-05 20:40:15.098647
2241	la multa	grzywna, mandat	67	word	2022-04-05 20:40:15.098647
2242	evitar	unika??	67	word	2022-04-05 20:40:15.098647
2243	la sociedad	spo??ecze??stwo	67	word	2022-04-05 20:40:15.098647
2244	la miseria	n??dza, bieda	67	word	2022-04-05 20:40:15.098647
2245	principal	g????wny	67	word	2022-04-05 20:40:15.098647
2246	social	socjalny	67	word	2022-04-05 20:40:15.098647
2247	la diferencia	r????nica	67	word	2022-04-05 20:40:15.098647
2248	diferente	r????ny	67	word	2022-04-05 20:40:15.098647
2249	la vivienda	mieszkanie	67	word	2022-04-05 20:40:15.098647
2250	la adicci??n	uzale??nienie	67	word	2022-04-05 20:40:15.098647
2251	adicto	uzale??niony	67	word	2022-04-05 20:40:15.098647
2252	el alcoholismo	alkoholizm	67	word	2022-04-05 20:40:15.098647
2253	el alcoh??lico	alkoholik	67	word	2022-04-05 20:40:15.098647
2254	la drogadicci??n	narkomania	67	word	2022-04-05 20:40:15.098647
2255	el drogadicto	narkoman	67	word	2022-04-05 20:40:15.098647
2256	drogadicto	uzale??niony od narkotyk??w	67	word	2022-04-05 20:40:15.098647
2257	tolerar	tolerowa??	67	word	2022-04-05 20:40:15.098647
2258	la tolerancia	tolerancja	67	word	2022-04-05 20:40:15.098647
2259	tolerante	tolerancyjny	67	word	2022-04-05 20:40:15.098647
2260	la intolerancia	nietolerancja	67	word	2022-04-05 20:40:15.098647
2261	intolerante	nietolerancyjny	67	word	2022-04-05 20:40:15.098647
2262	discriminar	dyskryminowa??	67	word	2022-04-05 20:40:15.098647
2263	la discriminaci??n	dyskryminacja	67	word	2022-04-05 20:40:15.098647
2264	la igualdad	r??wno????	67	word	2022-04-05 20:40:15.098647
2265	igual	r??wny	67	word	2022-04-05 20:40:15.098647
2266	la realidad	rzeczywisto????	67	word	2022-04-05 20:40:15.098647
2267	real	realny, rzeczywisty	67	word	2022-04-05 20:40:15.098647
2268	protestar	protestowa??	67	word	2022-04-05 20:40:15.098647
2269	la protesta	protest	67	word	2022-04-05 20:40:15.098647
2270	grave	powa??ny, niebezpieczny	67	word	2022-04-05 20:40:15.098647
2271	la huelga	strajk	67	word	2022-04-05 20:40:15.098647
2272	causar	powodowa??	67	word	2022-04-05 20:40:15.098647
2273	la causa	pow??d, przyczyna	67	word	2022-04-05 20:40:15.098647
2274	la consecuencia	konsekwencja, rezultat	67	word	2022-04-05 20:40:15.098647
2275	consecuente	konsekwentny	67	word	2022-04-05 20:40:15.098647
2276	resolver	rozwi??zywa?? (zadanie, problem) (o/ue)	67	word	2022-04-05 20:40:15.098647
2277	actuar	dzia??a??, post??powa??	67	word	2022-04-05 20:40:15.098647
2278	la acci??n	dzia??anie, post??pek	67	word	2022-04-05 20:40:15.098647
2279	la soluci??n	rozwi??zanie	67	word	2022-04-05 20:40:15.098647
2280	el modo	spos??b (m)	67	word	2022-04-05 20:40:15.098647
2281	la hoja	kartka	68	word	2022-04-05 20:40:48.272551
2282	el portafolios	teczka, akt??wka	68	word	2022-04-05 20:40:48.272551
2283	los portafolios	teczki, akt??wki	68	word	2022-04-05 20:40:48.272551
2284	el monedero	portmonetka	68	word	2022-04-05 20:40:48.272551
2285	el objeto	przedmiot	68	word	2022-04-05 20:40:48.272551
2286	la cerilla	zapa??ka	68	word	2022-04-05 20:40:48.272551
2287	el encendedor	zapalniczka	68	word	2022-04-05 20:40:48.272551
2288	el abrebotellas	otwieracz do butelek	68	word	2022-04-05 20:40:48.272551
2289	los abrebotellas	otwieracze do butelek	68	word	2022-04-05 20:40:48.272551
2290	el abrelatas	otwieracz do puszek	68	word	2022-04-05 20:40:48.272551
2291	los abrelatas	otwieracze do puszek	68	word	2022-04-05 20:40:48.272551
2292	el sacacorchos	korkoci??g	68	word	2022-04-05 20:40:48.272551
2293	los sacacorchos	korkoci??gi	68	word	2022-04-05 20:40:48.272551
2294	la pila	bateria	68	word	2022-04-05 20:40:48.272551
2295	funcionar	funkcjonowa??, dzia??a??	68	word	2022-04-05 20:40:48.272551
2296	la funci??n	funkcja	68	word	2022-04-05 20:40:48.272551
2297	funcional	funkcjonalny	68	word	2022-04-05 20:40:48.272551
2298	la cadena	??a??cuch, ??a??cuszek	68	word	2022-04-05 20:40:48.272551
2299	la navaja	n???? sk??adany, scyzoryk	68	word	2022-04-05 20:40:48.272551
2300	pr??ctico	praktyczny	68	word	2022-04-05 20:40:48.272551
2301	el cord??n	sznurek	68	word	2022-04-05 20:40:48.272551
2302	la aguja	ig??a	68	word	2022-04-05 20:40:48.272551
2303	el hilo	ni??, nitka	68	word	2022-04-05 20:40:48.272551
2304	el monasterio	klasztor	69	word	2022-04-05 20:41:25.295831
2305	el monje	mnich, zakonnik	69	word	2022-04-05 20:41:25.295831
2306	la monja	mniszka, zakonnica	69	word	2022-04-05 20:41:25.295831
2307	el sacerdote	ksi??dz, kap??an	69	word	2022-04-05 20:41:25.295831
2308	el alma	dusza (rodzaj ??e??ski)	69	word	2022-04-05 20:41:25.295831
2309	la Biblia	Biblia	69	word	2022-04-05 20:41:25.295831
2310	el cementerio	cmentarz	69	word	2022-04-05 20:41:25.295831
2311	la catedral	katedra	69	word	2022-04-05 20:41:25.295831
2312	el milagro	cud	69	word	2022-04-05 20:41:25.295831
2313	milagroso	cudowny	69	word	2022-04-05 20:41:25.295831
2314	el santo	??wi??ty (osoba)	69	word	2022-04-05 20:41:25.295831
2315	santo	??wi??ty	69	word	2022-04-05 20:41:25.295831
2316	el para??so	raj	69	word	2022-04-05 20:41:25.295831
2317	paradis??aco	rajski	69	word	2022-04-05 20:41:25.295831
2318	el infierno	piek??o	69	word	2022-04-05 20:41:25.295831
2319	el cielo	niebo	69	word	2022-04-05 20:41:25.295831
2320	el cristianismo	chrze??cija??stwo	69	word	2022-04-05 20:41:25.295831
2321	el cristiano	chrze??cijanin	69	word	2022-04-05 20:41:25.295831
2322	cristiano	chrze??cija??ski	69	word	2022-04-05 20:41:25.295831
2323	el catolicismo	katolicyzm	69	word	2022-04-05 20:41:25.295831
2324	el cat??lico	katolik	69	word	2022-04-05 20:41:25.295831
2325	cat??lico	katolicki	69	word	2022-04-05 20:41:25.295831
2326	la tradici??n	tradycja	69	word	2022-04-05 20:41:25.295831
2327	tradicional	tradycyjny	69	word	2022-04-05 20:41:25.295831
2328	la costumbre	zwyczaj, obyczaj	69	word	2022-04-05 20:41:25.295831
2329	la vela	??wieczka	69	word	2022-04-05 20:41:25.295831
2330	la corona	wieniec	69	word	2022-04-05 20:41:25.295831
2331	el adviento	adwent	69	word	2022-04-05 20:41:25.295831
2332	la afici??n	hobby	70	word	2022-04-05 20:41:59.595414
2333	el aficionado	mi??o??nik, fan	70	word	2022-04-05 20:41:59.595414
2334	patinar	je??dzi?? na ??y??wach	70	word	2022-04-05 20:41:59.595414
2335	el patinador	??y??wiarz	70	word	2022-04-05 20:41:59.595414
2336	el pat??n	??y??wa	70	word	2022-04-05 20:41:59.595414
2337	el patinaja	??y??wiarstwo	70	word	2022-04-05 20:41:59.595414
2338	montar	je??dzi?? konno, dosiada??	70	word	2022-04-05 20:41:59.595414
2339	la vela	??eglarstwo	70	word	2022-04-05 20:41:59.595414
2340	el velero	??agl??wka	70	word	2022-04-05 20:41:59.595414
2341	el ciclismo	kolarstwo	70	word	2022-04-05 20:41:59.595414
2342	el ciclista	kolarz	70	word	2022-04-05 20:41:59.595414
2343	la gimnasia	gimnastyka	70	word	2022-04-05 20:41:59.595414
2344	el gimnasio	si??ownia	70	word	2022-04-05 20:41:59.595414
2345	el footing	jogging	70	word	2022-04-05 20:41:59.595414
2346	la forma	forma, kondycja	70	word	2022-04-05 20:41:59.595414
2347	el club	klub	70	word	2022-04-05 20:41:59.595414
2348	el seguidor	kibic	70	word	2022-04-05 20:41:59.595414
2349	entrenar	trenowa??	70	word	2022-04-05 20:41:59.595414
2350	el entrenamiento	trening	70	word	2022-04-05 20:41:59.595414
2351	el entrenador	trener	70	word	2022-04-05 20:41:59.595414
2352	saltar	skaka??	70	word	2022-04-05 20:41:59.595414
2353	el salto	skok	70	word	2022-04-05 20:41:59.595414
2354	el saltador	skoczek	70	word	2022-04-05 20:41:59.595414
2355	competir	wsp????zawodniczy?? (e/i)	70	word	2022-04-05 20:41:59.595414
2356	la competici??n	zawody	70	word	2022-04-05 20:41:59.595414
2357	el campeonato	mistrzostwo	70	word	2022-04-05 20:41:59.595414
2358	el campe??n	mistrz	70	word	2022-04-05 20:41:59.595414
2359	ganar	wygrywa??	70	word	2022-04-05 20:41:59.595414
2360	el ganador	zwyci??zca	70	word	2022-04-05 20:41:59.595414
2361	premiar	nagradza??	70	word	2022-04-05 20:41:59.595414
2362	el premio	nagroda	70	word	2022-04-05 20:41:59.595414
2363	conseguir	zdobywa??, osi??ga?? (nr)	70	word	2022-04-05 20:41:59.595414
2364	perder	przegrywa?? (e/ie)	70	word	2022-04-05 20:41:59.595414
2365	el perdedor	przegrywaj??cy	70	word	2022-04-05 20:41:59.595414
2366	el billar	bilard	70	word	2022-04-05 20:41:59.595414
2367	coleccionar	kolekcjonowa??	70	word	2022-04-05 20:41:59.595414
2368	la colecci??n	kolekcja	70	word	2022-04-05 20:41:59.595414
2369	el coleccionista	kolekcjoner	70	word	2022-04-05 20:41:59.595414
2370	el circo	cyrk	70	word	2022-04-05 20:41:59.595414
2371	el funcionario	urz??dnik	71	word	2022-04-05 20:42:31.224865
2372	personal	osobisty	71	word	2022-04-05 20:42:31.224865
2373	personalmente	osobi??cie	71	word	2022-04-05 20:42:31.224865
2374	los datos	dane	71	word	2022-04-05 20:42:31.224865
2375	rellenar	wype??nia??	71	word	2022-04-05 20:42:31.224865
2376	indicar	wskazywa??	71	word	2022-04-05 20:42:31.224865
2377	la edad	wiek	71	word	2022-04-05 20:42:31.224865
2378	civil	cywilny	71	word	2022-04-05 20:42:31.224865
2379	el domicilio	miejsce zamieszkania	71	word	2022-04-05 20:42:31.224865
2380	el domicilio fijo	sta??e miejsce zamieszkania	71	word	2022-04-05 20:42:31.224865
2381	el carn??	dow??d, legitymacja	71	word	2022-04-05 20:42:31.224865
2382	el carn?? de identidad	dow??d osobisty	71	word	2022-04-05 20:42:31.224865
2383	actual	aktualny	71	word	2022-04-05 20:42:31.224865
2384	actualmente	aktualnie, obecnie	71	word	2022-04-05 20:42:31.224865
2385	el original	orygina??	71	word	2022-04-05 20:42:31.224865
2386	original	oryginalny	71	word	2022-04-05 20:42:31.224865
2387	v??lido	wa??ny	71	word	2022-04-05 20:42:31.224865
2388	sellar	stemplowa??, piecz??towa??	71	word	2022-04-05 20:42:31.224865
2389	el sello	stempel, piecz??tka	71	word	2022-04-05 20:42:31.224865
2390	firmar	podpisywa??	71	word	2022-04-05 20:42:31.224865
2391	la firma	podpis	71	word	2022-04-05 20:42:31.224865
2392	permitir	zezwala??, pozwala??	71	word	2022-04-05 20:42:31.224865
2393	el permiso	zezwolenie, pozwolenie	71	word	2022-04-05 20:42:31.224865
2394	urgente	pilny	71	word	2022-04-05 20:42:31.224865
2395	urgentemente	pilnie	71	word	2022-04-05 20:42:31.224865
2396	el asunto	sprawa	71	word	2022-04-05 20:42:31.224865
2397	la fecha	termin	71	word	2022-04-05 20:42:31.224865
2398	entregar	oddawa??, dostarcza??	71	word	2022-04-05 20:42:31.224865
2399	la entrega	oddanie, dostarczenie	71	word	2022-04-05 20:42:31.224865
2400	recoger	odbiera??	71	word	2022-04-05 20:42:31.224865
2401	positivo	pozytywny	71	word	2022-04-05 20:42:31.224865
2402	negativo	negatywny	71	word	2022-04-05 20:42:31.224865
2403	el desastre	katastrofa, nieszcz????cie	72	word	2022-04-05 20:43:10.296184
2404	explotar	eksplodowa??	72	word	2022-04-05 20:43:10.296184
2405	la explosi??n	eksplozja	72	word	2022-04-05 20:43:10.296184
2406	la mina	mina	72	word	2022-04-05 20:43:10.296184
2407	el p??nico	panika, strach	72	word	2022-04-05 20:43:10.296184
2408	la emergencia	nag??y wypadek	72	word	2022-04-05 20:43:10.296184
2409	prudente	ostro??ny	72	word	2022-04-05 20:43:10.296184
2410	imprudente	nieostro??ny	72	word	2022-04-05 20:43:10.296184
2411	el incendio	po??ar	72	word	2022-04-05 20:43:10.296184
2412	el bombero	stra??ak	72	word	2022-04-05 20:43:10.296184
2413	el cuerpo de bomberos	stra?? po??arna	72	word	2022-04-05 20:43:10.296184
2414	el h??roe	bohater	72	word	2022-04-05 20:43:10.296184
2415	la hero??na	bohaterka	72	word	2022-04-05 20:43:10.296184
2416	heroico	bohaterski	72	word	2022-04-05 20:43:10.296184
2417	el marinero	marynarz	72	word	2022-04-05 20:43:10.296184
2418	el submarino	????d?? podwodna	72	word	2022-04-05 20:43:10.296184
2419	espiar	szpiegowa??	72	word	2022-04-05 20:43:10.296184
2420	el espionaje	szpiegostwo	72	word	2022-04-05 20:43:10.296184
2421	el esp??a	szpieg	72	word	2022-04-05 20:43:10.296184
2422	el enemigo	wr??g	72	word	2022-04-05 20:43:10.296184
2423	enemigo	wrogi	72	word	2022-04-05 20:43:10.296184
2424	atacar	atakowa??	72	word	2022-04-05 20:43:10.296184
2425	el ataque	atak	72	word	2022-04-05 20:43:10.296184
2426	el agresor	napastnik, agresor	72	word	2022-04-05 20:43:10.296184
2427	la crueldad	okrucie??stwo	72	word	2022-04-05 20:43:10.296184
2428	cruel	okrutny	72	word	2022-04-05 20:43:10.296184
2429	el ej??rcito	armia, wojsko	72	word	2022-04-05 20:43:10.296184
2430	marchar	maszerowa??	72	word	2022-04-05 20:43:10.296184
2431	la marcha	marsz	72	word	2022-04-05 20:43:10.296184
2432	luchar	walczy??	72	word	2022-04-05 20:43:10.296184
2433	la lucha	walka	72	word	2022-04-05 20:43:10.296184
2434	el arma	bro?? (rodzaj ??e??ski)	72	word	2022-04-05 20:43:10.296184
2435	el arma de fuego	bro?? palna	72	word	2022-04-05 20:43:10.296184
2436	el arma blanca	bro?? bia??a	72	word	2022-04-05 20:43:10.296184
2437	el conflicto	konflikt	72	word	2022-04-05 20:43:10.296184
2438	golpear	uderza??, bi??	72	word	2022-04-05 20:43:10.296184
2439	el golpe	uderzenie, cios	72	word	2022-04-05 20:43:10.296184
2440	defenderse	broni?? si?? (e/ie)	72	word	2022-04-05 20:43:10.296184
2441	la defensa	obrona	72	word	2022-04-05 20:43:10.296184
2442	el defensor	obro??ca	72	word	2022-04-05 20:43:10.296184
2443	la v??ctima	ofiara (cz??owiek)	72	word	2022-04-05 20:43:10.296184
2444	mortal	??miertelny	72	word	2022-04-05 20:43:10.296184
2445	sobrevivir	prze??y??, ocale??	72	word	2022-04-05 20:43:10.296184
2446	el aspecto	wygl??d	73	word	2022-04-05 20:43:50.479287
2447	el aspecto f??sico	wygl??d zewn??trzny	73	word	2022-04-05 20:43:50.479287
2448	atractivo	atrakcyjny	73	word	2022-04-05 20:43:50.479287
2449	guapo	przystojny, pi??kny	73	word	2022-04-05 20:43:50.479287
2450	la belleza	pi??kno	73	word	2022-04-05 20:43:50.479287
2451	la fealdad	brzydota	73	word	2022-04-05 20:43:50.479287
2452	el peinado	fryzura	73	word	2022-04-05 20:43:50.479287
2453	liso	prosty	73	word	2022-04-05 20:43:50.479287
2454	rizado	kr??cony	73	word	2022-04-05 20:43:50.479287
2455	cano	siwy	73	word	2022-04-05 20:43:50.479287
2456	el rubio	blondyn	73	word	2022-04-05 20:43:50.479287
2457	el moreno	brunet	73	word	2022-04-05 20:43:50.479287
2458	el tipo	typ	73	word	2022-04-05 20:43:50.479287
2459	t??pico	typowy	73	word	2022-04-05 20:43:50.479287
2460	at??pico	nietypowy	73	word	2022-04-05 20:43:50.479287
2461	la f??bula	ba????	74	word	2022-04-05 20:44:39.112174
2462	fabuloso	ba??niowy	74	word	2022-04-05 20:44:39.112174
2463	el caballero	rycerz	74	word	2022-04-05 20:44:39.112174
2464	el drag??n	smok	74	word	2022-04-05 20:44:39.112174
2465	el monstruo	potw??r	74	word	2022-04-05 20:44:39.112174
2466	monstruoso	potworny	74	word	2022-04-05 20:44:39.112174
2467	la espada	miecz	74	word	2022-04-05 20:44:39.112174
2468	hechizar	zaczarowa??	74	word	2022-04-05 20:44:39.112174
2469	la hechicer??a	czary, magia	74	word	2022-04-05 20:44:39.112174
2470	el hechicero	czarodziej	74	word	2022-04-05 20:44:39.112174
2471	la magia	magia	74	word	2022-04-05 20:44:39.112174
2472	m??gico	magiczny	74	word	2022-04-05 20:44:39.112174
2473	aparecerse	zjawia?? si??, ukazywa?? si?? (c/zc)	74	word	2022-04-05 20:44:39.112174
2474	desaparecer	znika?? (c/zc)	74	word	2022-04-05 20:44:39.112174
2475	el fantasma	duch	74	word	2022-04-05 20:44:39.112174
2476	existir	istnie??	74	word	2022-04-05 20:44:39.112174
2477	la existencia	istnienie, egzystencja	74	word	2022-04-05 20:44:39.112174
2478	el enano	krasnal, karze??	74	word	2022-04-05 20:44:39.112174
2479	imaginarse	wyobra??a?? sobie	74	word	2022-04-05 20:44:39.112174
2480	la imaginaci??n	wyobra??nia	74	word	2022-04-05 20:44:39.112174
2481	el secreto	tajemnica, sekret	74	word	2022-04-05 20:44:39.112174
2482	secreto	tajemny, sekretny	74	word	2022-04-05 20:44:39.112174
2483	el tesoro	skarb	74	word	2022-04-05 20:44:39.112174
2484	la voz	g??os (mowa)	75	word	2022-04-05 20:45:39.277893
2485	sonar	brzmie??, d??wi??cze?? (o/ue)	75	word	2022-04-05 20:45:39.277893
2486	el sonido	brzmienie, d??wi??k	75	word	2022-04-05 20:45:39.277893
2487	el timbre	dzwonek (u drzwi)	75	word	2022-04-05 20:45:39.277893
2488	la campana	dzwon	75	word	2022-04-05 20:45:39.277893
2489	la campanada	uderzenie dzwonu	75	word	2022-04-05 20:45:39.277893
2490	silbar	gwizda??	75	word	2022-04-05 20:45:39.277893
2491	el silbido	gwizd	75	word	2022-04-05 20:45:39.277893
2492	gritar	krzycze??	75	word	2022-04-05 20:45:39.277893
2493	el grito	krzyk	75	word	2022-04-05 20:45:39.277893
2494	callar	milcze??	75	word	2022-04-05 20:45:39.277893
2495	callado	cichy, milcz??cy	75	word	2022-04-05 20:45:39.277893
2496	el siglo	wiek, stulecie	75	word	2022-04-05 20:45:39.277893
2497	el milenio	tysi??clecie	75	word	2022-04-05 20:45:39.277893
2498	el d??a laborable	dzie?? roboczy	75	word	2022-04-05 20:45:39.277893
2499	festivo	??wi??teczny	75	word	2022-04-05 20:45:39.277893
2500	la Nochevieja	sylwester	75	word	2022-04-05 20:45:39.277893
2501	el aniversario	rocznica	75	word	2022-04-05 20:45:39.277893
2502	naranja	pomara??czowy	75	word	2022-04-05 20:45:39.277893
2503	rosa	r????owy	75	word	2022-04-05 20:45:39.277893
2504	violeta	fioletowy	75	word	2022-04-05 20:45:39.277893
2505	brillar	b??yszcze??, l??ni??	75	word	2022-04-05 20:45:39.277893
2506	brillante	b??yszcz??cy, l??ni??cy	75	word	2022-04-05 20:45:39.277893
2507	mate	matowy	75	word	2022-04-05 20:45:39.277893
2508	la bola	kula, kulka	75	word	2022-04-05 20:45:39.277893
2509	el ??ngulo	k??t	75	word	2022-04-05 20:45:39.277893
2510	el tri??ngulo	tr??jk??t	75	word	2022-04-05 20:45:39.277893
2511	triangular	tr??jk??tny	75	word	2022-04-05 20:45:39.277893
2512	el rect??ngulo	prostok??t	75	word	2022-04-05 20:45:39.277893
2513	rectangular	prostok??tny	75	word	2022-04-05 20:45:39.277893
2514	la l??nea	linia	75	word	2022-04-05 20:45:39.277893
2515	vertical	pionowy	75	word	2022-04-05 20:45:39.277893
2516	el horizonte	horyzont	75	word	2022-04-05 20:45:39.277893
2517	horizontal	poziomy	75	word	2022-04-05 20:45:39.277893
2518	llano	p??aski, r??wny	75	word	2022-04-05 20:45:39.277893
2519	el muchacho	ch??opak	75	word	2022-04-05 20:45:39.277893
2520	la muchacha	dziewczyna	75	word	2022-04-05 20:45:39.277893
2521	ambos	obaj	75	word	2022-04-05 20:45:39.277893
2522	mismo	sam	75	word	2022-04-05 20:45:39.277893
2523	??Sabes qu?? hora es?	Wiesz, kt??ra jest godzina?	36	sentence	2022-04-05 21:07:40.326245
2524	??Hasta qu?? hora?	Do kt??rej godziny?	36	sentence	2022-04-05 21:11:21.522155
2525	Es la una	Jest pierwsza	36	sentence	2022-04-05 21:13:09.171079
2526	Son las nueve de la ma??ana	Jest dziewi??ta rano	36	sentence	2022-04-05 21:13:29.138732
2527	Son las tres y cuarto	Jest kwadrans po trzeciej	36	sentence	2022-04-05 21:14:05.208987
2528	Son las tres y media	jest w p???? do czwartej	36	sentence	2022-04-05 21:14:32.922162
2529	Son las cuatro menos veinte	Jest za dwadzie??cia czwarta	36	sentence	2022-04-05 21:15:08.055576
2530	Son las tres de la madrugada	Jest trzecia w nocy	36	sentence	2022-04-05 21:15:43.122276
2531	??A qu?? hora empieza la clase de inform??tica?	O kt??rej godzinie zaczyna si?? lekcja informatyki?	36	sentence	2022-04-05 21:18:56.776694
2532	finalizar	zako??czy??, zako??czy?? si??	76	word	2022-04-07 20:38:11.66129
2533	nunca	kiedykolwiek (w wyra??eniach por??wnawczych)	76	word	2022-04-07 20:38:11.66129
2534	jam??s	nigdy	76	word	2022-04-07 20:38:11.66129
2535	nunca jam??s	przenigdy	76	word	2022-04-07 20:38:11.66129
2536	dentro de	w ci??gu, za	76	word	2022-04-07 20:38:11.66129
2537	dentro de poco	wkr??tce	76	word	2022-04-07 20:38:11.66129
2538	a partir de	od (w odniesieniu do czasu)	76	word	2022-04-07 20:38:11.66129
2539	de nuevo	znowu	76	word	2022-04-07 20:38:11.66129
2540	de antemano	uprzednio, z g??ry	76	word	2022-04-07 20:38:11.66129
2541	breve	kr??tki, zwi??z??y	76	word	2022-04-07 20:38:11.66129
2542	brevemente	kr??tko, zwi????le	76	word	2022-04-07 20:38:11.66129
2543	en breve	wkr??tce, niebawem	76	word	2022-04-07 20:38:11.66129
2544	hace poco	niedawno	76	word	2022-04-07 20:38:11.66129
2545	entonces	wtedy	76	word	2022-04-07 20:38:11.66129
2546	desde entonces	odt??d, od tego czasu	76	word	2022-04-07 20:38:11.66129
2547	hoy en d??a	obecnie	76	word	2022-04-07 20:38:11.66129
2548	al mismo tiempo	jednocze??nie	76	word	2022-04-07 20:38:11.66129
2549	el instante	chwila	76	word	2022-04-07 20:38:11.66129
2550	temporal	tymczasowy, chwilowy	76	word	2022-04-07 20:38:11.66129
2551	temporalmente	tymczasowo, chwilowo	76	word	2022-04-07 20:38:11.66129
2552	corriente	bie????cy	76	word	2022-04-07 20:38:11.66129
2553	anterior	wcze??niejszy, poprzedni	76	word	2022-04-07 20:38:11.66129
2554	la anterioridad	wyprzedzenie	76	word	2022-04-07 20:38:11.66129
2555	reciente	ostatni, niedawny	76	word	2022-04-07 20:38:11.66129
2556	recientemente	ostatnio, niedawno	76	word	2022-04-07 20:38:11.66129
2557	adelantarse	??pieszy?? si?? (o zegarze)	76	word	2022-04-07 20:38:11.66129
2558	atrasar	op????nia??	76	word	2022-04-07 20:38:11.66129
2559	atrasado	op????niony	76	word	2022-04-07 20:38:11.66129
2560	la exactitud	dok??adno????	76	word	2022-04-07 20:38:11.66129
2561	contempor??neo	wsp????czesny	76	word	2022-04-07 20:38:11.66129
2562	la cifra	cyfra	77	word	2022-04-07 20:39:28.294037
2563	el centenar	setka	77	word	2022-04-07 20:39:28.294037
2564	el millar	tysi??c	77	word	2022-04-07 20:39:28.294037
2565	por lo menos	przynajmniej	77	word	2022-04-07 20:39:28.294037
2566	a lo sumo	najwy??ej	77	word	2022-04-07 20:39:28.294037
2567	alrededor	oko??o	77	word	2022-04-07 20:39:28.294037
2568	el total	suma	77	word	2022-04-07 20:39:28.294037
2569	total	ca??kowity, zupe??ny	77	word	2022-04-07 20:39:28.294037
2570	doble	podw??jny	77	word	2022-04-07 20:39:28.294037
2571	triple	potr??jny	77	word	2022-04-07 20:39:28.294037
2572	el barril	beczka	77	word	2022-04-07 20:39:28.294037
2573	el peso	waga	77	word	2022-04-07 20:39:28.294037
2574	la falta de peso	niedowaga	77	word	2022-04-07 20:39:28.294037
2575	el exceso	nadmiar	77	word	2022-04-07 20:39:28.294037
2576	el exceso de peso	nadwaga	77	word	2022-04-07 20:39:28.294037
2577	la medida	miara	77	word	2022-04-07 20:39:28.294037
2578	agrandar	zwi??ksza??, powi??ksza??	77	word	2022-04-07 20:39:28.294037
2579	agrandarse	zwi??ksza?? si??, powi??ksza?? si??	77	word	2022-04-07 20:39:28.294037
2580	el agrandamiento	zwi??kszenie, powi??kszenie	77	word	2022-04-07 20:39:28.294037
2581	reducir	zmniejsza?? (c/zc)	77	word	2022-04-07 20:39:28.294037
2582	la reducci??n	zmniejszenie	77	word	2022-04-07 20:39:28.294037
2583	la relaci??n	stosunek	77	word	2022-04-07 20:39:28.294037
2584	relativamente	stosunkowo	77	word	2022-04-07 20:39:28.294037
2585	corresponder	odpowiada??, by?? zgodnym	77	word	2022-04-07 20:39:28.294037
2586	correspondiente	odpowiedni	77	word	2022-04-07 20:39:28.294037
2587	la extensi??n	zakres	77	word	2022-04-07 20:39:28.294037
2588	extenso	obszerny, rozleg??y	77	word	2022-04-07 20:39:28.294037
2589	la superficie	powierzchnia	77	word	2022-04-07 20:39:28.294037
2590	el promedio	przeci??tna, ??rednia	77	word	2022-04-07 20:39:28.294037
2591	la cantidad	liczba, ilo????	77	word	2022-04-07 20:39:28.294037
2592	caber	mie??ci?? si?? (nr)	77	word	2022-04-07 20:39:28.294037
2593	la mitad	po??owa	77	word	2022-04-07 20:39:28.294037
2594	acortar	skraca??	77	word	2022-04-07 20:39:28.294037
2595	el acortamiento	skr??cenie	77	word	2022-04-07 20:39:28.294037
2596	alargar	przed??u??a??, wyd??u??a??	77	word	2022-04-07 20:39:28.294037
2597	el alargamiento	przed??u??enie, wyd??u??enie	77	word	2022-04-07 20:39:28.294037
2598	la unidad	ca??o????, jedno????	77	word	2022-04-07 20:39:28.294037
2599	unitario	jednolity, jednakowy	77	word	2022-04-07 20:39:28.294037
2600	el equilibrio	r??wnowaga	77	word	2022-04-07 20:39:28.294037
2601	la vivienda	mieszkanie	78	word	2022-04-07 20:40:11.219463
2602	el due??o	w??a??ciciel	78	word	2022-04-07 20:40:11.219463
2603	mudarse	wprowadza?? si??, wyprowadza?? si??	78	word	2022-04-07 20:40:11.219463
2604	instalarse	osiedla?? si??, urz??dza?? si??	78	word	2022-04-07 20:40:11.219463
2605	el desv??n	strych, poddasze	78	word	2022-04-07 20:40:11.219463
2606	el techo	dach	78	word	2022-04-07 20:40:11.219463
2607	el alba??il	murarz	78	word	2022-04-07 20:40:11.219463
2608	la chimenea	komin, kominek	78	word	2022-04-07 20:40:11.219463
2609	la le??a	drewno opa??owe	78	word	2022-04-07 20:40:11.219463
2610	acogedor	przytulny	78	word	2022-04-07 20:40:11.219463
2611	la calefacci??n	ogrzewanie	78	word	2022-04-07 20:40:11.219463
2612	el espacio	przestrze??, obszar	78	word	2022-04-07 20:40:11.219463
2613	espacioso	obszerny, przestrzenny	78	word	2022-04-07 20:40:11.219463
2614	el equipamiento	wyposa??enie	78	word	2022-04-07 20:40:11.219463
2615	equipado	wyposa??ony, umeblowany	78	word	2022-04-07 20:40:11.219463
2616	la ba??era	wanna	78	word	2022-04-07 20:40:11.219463
2617	el lavabo	umywalka	78	word	2022-04-07 20:40:11.219463
2618	el anaquel	p????ka	78	word	2022-04-07 20:40:11.219463
2619	el florero	wazon	78	word	2022-04-07 20:40:11.219463
2620	el vest??bulo	hol	78	word	2022-04-07 20:40:11.219463
2621	enorme	ogromny, olbrzymi	78	word	2022-04-07 20:40:11.219463
2622	chiquito	malutki, male??ki	78	word	2022-04-07 20:40:11.219463
2623	el corredor	korytarz	78	word	2022-04-07 20:40:11.219463
2624	iluminar	o??wietla??	78	word	2022-04-07 20:40:11.219463
2625	la iluminaci??n	o??wietlenie	78	word	2022-04-07 20:40:11.219463
2626	el colch??n	materac	78	word	2022-04-07 20:40:11.219463
2627	la manta	koc, ko??dra	78	word	2022-04-07 20:40:11.219463
2628	la almohada	poduszka	78	word	2022-04-07 20:40:11.219463
2629	la s??bana	prze??cierad??o	78	word	2022-04-07 20:40:11.219463
2630	el mantel	obrus	78	word	2022-04-07 20:40:11.219463
2631	los cubiertos	sztu??ce	78	word	2022-04-07 20:40:11.219463
2632	la jarra	dzban, dzbanek	78	word	2022-04-07 20:40:11.219463
2633	la copa	kieliszek	78	word	2022-04-07 20:40:11.219463
2634	tapar	przykrywa?? (pokrywk??)	78	word	2022-04-07 20:40:11.219463
2635	la tapa	pokrywka, przykrywka	78	word	2022-04-07 20:40:11.219463
2636	guardar	przechowywa??	78	word	2022-04-07 20:40:11.219463
2637	la tostada	tost	78	word	2022-04-07 20:40:11.219463
2638	el tostador	toster	78	word	2022-04-07 20:40:11.219463
2639	el microondas	kuchenka mikrofalowa	78	word	2022-04-07 20:40:11.219463
2640	los microondas	kuchenki mikrofalowe	78	word	2022-04-07 20:40:11.219463
2641	el lavaplatos	zmywarka	78	word	2022-04-07 20:40:11.219463
2642	los lavaplatos	zmywarki	78	word	2022-04-07 20:40:11.219463
2643	cotidiano	codzienny	78	word	2022-04-07 20:40:11.219463
2644	acostumbrarse	przyzwyczaja?? si??	78	word	2022-04-07 20:40:11.219463
2645	dom??stico	domowy (d)	78	word	2022-04-07 20:40:11.219463
2646	recoger	uprz??ta??, zbiera??	78	word	2022-04-07 20:40:11.219463
2647	la asistenta	sprz??taczka (w domu)	78	word	2022-04-07 20:40:11.219463
2648	cuidadoso	uwa??ny	78	word	2022-04-07 20:40:11.219463
2649	la escoba	miot??a	78	word	2022-04-07 20:40:11.219463
2650	barrer	zmiata??	78	word	2022-04-07 20:40:11.219463
2651	el trapo	??cierka	78	word	2022-04-07 20:40:11.219463
2652	la especie	gatunek	79	word	2022-04-07 20:41:10.707633
2653	la raza	rasa	79	word	2022-04-07 20:41:10.707633
2654	la agresi??n	agresja	79	word	2022-04-07 20:41:10.707633
2655	agresivo	agresywny	79	word	2022-04-07 20:41:10.707633
2656	la garra	pazur	79	word	2022-04-07 20:41:10.707633
2657	ara??ar	drapa??	79	word	2022-04-07 20:41:10.707633
2658	el ara??azo	zadrapanie	79	word	2022-04-07 20:41:10.707633
2659	el carnero	baran	79	word	2022-04-07 20:41:10.707633
2660	la liebre	zaj??c	79	word	2022-04-07 20:41:10.707633
2661	la pata	??apa, noga (u zwierz??cia)	79	word	2022-04-07 20:41:10.707633
2662	el gusano	robak	79	word	2022-04-07 20:41:10.707633
2663	la lombriz	d??d??ownica	79	word	2022-04-07 20:41:10.707633
2664	la hormiga	mr??wka	79	word	2022-04-07 20:41:10.707633
2665	el hormiguero	mrowisko	79	word	2022-04-07 20:41:10.707633
2666	el pavo	indyk	79	word	2022-04-07 20:41:10.707633
2667	el pavo real	paw	79	word	2022-04-07 20:41:10.707633
2668	la cig??e??a	bocian	79	word	2022-04-07 20:41:10.707633
2669	la lechuza	sowa	79	word	2022-04-07 20:41:10.707633
2670	el loro	papuga	79	word	2022-04-07 20:41:10.707633
2671	la gaviota	mewa	79	word	2022-04-07 20:41:10.707633
2672	el cisne	??ab??d??	79	word	2022-04-07 20:41:10.707633
2673	el ping??ino	pingwin	79	word	2022-04-07 20:41:10.707633
2674	el ala	skrzyd??o (rodzaj ??e??ski)	79	word	2022-04-07 20:41:10.707633
2675	batir las alas	macha?? skrzyd??ami	79	word	2022-04-07 20:41:10.707633
2676	el murci??lago	nietoperz	79	word	2022-04-07 20:41:10.707633
2677	picar	k??sa??, k??u??	79	word	2022-04-07 20:41:10.707633
2678	la picadura	uk??szenie, uk??ucie	79	word	2022-04-07 20:41:10.707633
2679	la avispa	osa	79	word	2022-04-07 20:41:10.707633
2680	el mosquito	komar	79	word	2022-04-07 20:41:10.707633
2681	la tortuga	??????w	79	word	2022-04-07 20:41:10.707633
2682	el hipop??tamo	hipopotam	79	word	2022-04-07 20:41:10.707633
2683	el tibur??n	rekin	79	word	2022-04-07 20:41:10.707633
2684	devorar	??re??, po??era??	79	word	2022-04-07 20:41:10.707633
2685	voraz	??ar??oczny	79	word	2022-04-07 20:41:10.707633
2686	la ballena	wieloryb	79	word	2022-04-07 20:41:10.707633
2687	el salm??n	??oso??	79	word	2022-04-07 20:41:10.707633
2688	la trucha	pstr??g	79	word	2022-04-07 20:41:10.707633
2689	municipal	miejski	80	word	2022-04-07 20:41:45.90087
2690	circular	by?? w ruchu, kr????y??	80	word	2022-04-07 20:41:45.90087
2691	la circulaci??n	ruch uliczny	80	word	2022-04-07 20:41:45.90087
2692	el atasco	zator, korek (uliczny)	80	word	2022-04-07 20:41:45.90087
2693	la hora punta	godziny szczytu	80	word	2022-04-07 20:41:45.90087
2694	atravesar	przechodzi?? (e/ie)	80	word	2022-04-07 20:41:45.90087
2695	la acera	chodnik	80	word	2022-04-07 20:41:45.90087
2696	el carril	pas ruchu	80	word	2022-04-07 20:41:45.90087
2697	la fuente	fontanna	80	word	2022-04-07 20:41:45.90087
2698	vigilar	strzec, czuwa??	80	word	2022-04-07 20:41:45.90087
2699	la vigilancia	stra??, czuwanie	80	word	2022-04-07 20:41:45.90087
2700	el vigilante	stra??nik	80	word	2022-04-07 20:41:45.90087
2701	el chal??	dom (jednorodzinny), domek	80	word	2022-04-07 20:41:45.90087
2702	el chal?? adosado	dom szeregowy	80	word	2022-04-07 20:41:45.90087
2703	la parcela	dzia??ka	80	word	2022-04-07 20:41:45.90087
2704	abundar	obfitowa??	80	word	2022-04-07 20:41:45.90087
2705	la abundancia	obfito????, dostatek	80	word	2022-04-07 20:41:45.90087
2706	abundante	obfity	80	word	2022-04-07 20:41:45.90087
2707	escasear	brakowa??, ko??czy?? si??	80	word	2022-04-07 20:41:45.90087
2708	la escasez	brak, niedob??r	80	word	2022-04-07 20:41:45.90087
2709	escaso	rzadki, nieliczny	80	word	2022-04-07 20:41:45.90087
2710	cosechar	zbiera?? plon	80	word	2022-04-07 20:41:45.90087
2711	la cosecha	zbiory, ??niwa	80	word	2022-04-07 20:41:45.90087
2712	el grano	ziarno	80	word	2022-04-07 20:41:45.90087
2713	el trigo	pszenica	80	word	2022-04-07 20:41:45.90087
2714	el ganado	byd??o	80	word	2022-04-07 20:41:45.90087
2715	el estable	obora, stajnia	80	word	2022-04-07 20:41:45.90087
2716	la pala	??opata	80	word	2022-04-07 20:41:45.90087
2717	cavar	kopa??	80	word	2022-04-07 20:41:45.90087
2718	la escalera	drabina	80	word	2022-04-07 20:41:45.90087
2719	plateado	srebrny (w kolorze srebra), srebrzysty	81	word	2022-04-07 20:42:48.073611
2720	dorado	z??oty (w kolorze z??ota), z??ocisty	81	word	2022-04-07 20:42:48.073611
2721	burdeos	bordowy	81	word	2022-04-07 20:42:48.073611
2722	celeste	lazurowy, b????kitny	81	word	2022-04-07 20:42:48.073611
2723	beige	be??owy	81	word	2022-04-07 20:42:48.073611
2724	el matiz	odcie??	81	word	2022-04-07 20:42:48.073611
2725	el contraste	kontrast	81	word	2022-04-07 20:42:48.073611
2726	el ??valo	owal	81	word	2022-04-07 20:42:48.073611
2727	ovalado	owalny	81	word	2022-04-07 20:42:48.073611
2728	el cubo	sze??cian	81	word	2022-04-07 20:42:48.073611
2729	el cubito de hielo	kostka lodu	81	word	2022-04-07 20:42:48.073611
2730	perpendicular	prostopad??y	81	word	2022-04-07 20:42:48.073611
2731	paralelo	r??wnoleg??y	81	word	2022-04-07 20:42:48.073611
2732	torcido	krzywy, przekrzywiony	81	word	2022-04-07 20:42:48.073611
2733	el tono	ton, d??wi??k	81	word	2022-04-07 20:42:48.073611
2734	el tono de la voz	ton g??osu	81	word	2022-04-07 20:42:48.073611
2735	sonoro	d??wi??czny	81	word	2022-04-07 20:42:48.073611
2736	doblar	bi?? (o dzwonach)	81	word	2022-04-07 20:42:48.073611
2737	susurrar	szepta??	81	word	2022-04-07 20:42:48.073611
2738	el susurro	szept	81	word	2022-04-07 20:42:48.073611
2739	murmurar	szumie??, mamrota??	81	word	2022-04-07 20:42:48.073611
2740	roncar	chrapa??	81	word	2022-04-07 20:42:48.073611
2741	el ronquido	chrapanie	81	word	2022-04-07 20:42:48.073611
2742	estallar	hucze??, wybucha??	81	word	2022-04-07 20:42:48.073611
2743	el estallido	huk, wybuch	81	word	2022-04-07 20:42:48.073611
2744	crujir	trzeszcze??, skrzypie??	81	word	2022-04-07 20:42:48.073611
2745	sisear	sycze??	81	word	2022-04-07 20:42:48.073611
2761	la indiferencia	oboj??tno????, nieczu??o????	82	word	2022-04-07 20:45:10.006344
2762	indiferente	oboj??tny, nieczu??y	82	word	2022-04-07 20:45:10.006344
2763	despreciar	lekcewa??y??, pogardza??	82	word	2022-04-07 20:45:10.006344
2764	el desprecio	lekcewa??enie, pogarda	82	word	2022-04-07 20:45:10.006344
2765	deprimir	przygn??bia??	82	word	2022-04-07 20:45:10.006344
2766	deprimido	przygn??biony	82	word	2022-04-07 20:45:10.006344
2767	irritar	denerwowa??, irytowa??	82	word	2022-04-07 20:45:10.006344
2768	irritarse	denerwowa?? si??, irytowa?? si??	82	word	2022-04-07 20:45:10.006344
2769	la irritaci??n	zdenerwowanie, irytacja	82	word	2022-04-07 20:45:10.006344
2770	la furia	furia, w??ciek??o????	82	word	2022-04-07 20:45:10.006344
2771	furioso	w??ciek??y	82	word	2022-04-07 20:45:10.006344
2772	la calma	spok??j, cisza	82	word	2022-04-07 20:45:10.006344
2773	insultar	obra??a??, zniewa??a??	82	word	2022-04-07 20:45:10.006344
2774	el insulto	obelga, zniewaga	82	word	2022-04-07 20:45:10.006344
2775	aguantar	wytrzymywa??	82	word	2022-04-07 20:45:10.006344
2776	vengarse	m??ci?? si??	82	word	2022-04-07 20:45:10.006344
2777	la venganza	zemsta	82	word	2022-04-07 20:45:10.006344
2778	vengativo	m??ciwy	82	word	2022-04-07 20:45:10.006344
2779	temer	ba?? si??, l??ka?? si??	82	word	2022-04-07 20:45:10.006344
2780	el temor	strach, l??k	82	word	2022-04-07 20:45:10.006344
2781	tremendo	straszny, okropny	82	word	2022-04-07 20:45:10.006344
2782	avergonzarse	wstydzi?? si?? (o/??e)	82	word	2022-04-07 20:45:10.006344
2783	la verg??enza	wstyd	82	word	2022-04-07 20:45:10.006344
2784	embarazarse	zak??opota?? si??	82	word	2022-04-07 20:45:10.006344
2785	embarazoso	k??opotliwy	82	word	2022-04-07 20:45:10.006344
2786	la compasi??n	wsp????czucie	82	word	2022-04-07 20:45:10.006344
2787	extra??ar	zadziwia??, dziwi??	82	word	2022-04-07 20:45:10.006344
2788	la extra??eza	zdziwienie	82	word	2022-04-07 20:45:10.006344
2789	extra??o	dziwny	82	word	2022-04-07 20:45:10.006344
2790	entusiasmarse	zachwyca?? si??	82	word	2022-04-07 20:45:10.006344
2791	el entusiasmo	zachwyt	82	word	2022-04-07 20:45:10.006344
2792	entusiasmado	zachwycony	82	word	2022-04-07 20:45:10.006344
2793	la satisfacci??n	zadowolenie	82	word	2022-04-07 20:45:10.006344
2794	satisfecho	zadowolony, rad	82	word	2022-04-07 20:45:10.006344
2795	la desgracia	nieszcz????cie, pech	82	word	2022-04-07 20:45:10.006344
2796	desgraciado	nieszcz????liwy, pechowy	82	word	2022-04-07 20:45:10.006344
2797	quejarse	narzeka??, skar??y?? si??	82	word	2022-04-07 20:45:10.006344
2798	la queja	narzekanie, skarga	82	word	2022-04-07 20:45:10.006344
2799	desilusionar	rozczarowa??	82	word	2022-04-07 20:45:10.006344
2800	desilusionarse	rozczarowa?? si??	82	word	2022-04-07 20:45:10.006344
2801	la desilusi??n	rozczarowanie	82	word	2022-04-07 20:45:10.006344
2802	desilusionado	rozczarowany	82	word	2022-04-07 20:45:10.006344
2803	el destinatario	adresat	83	word	2022-04-07 20:47:16.440156
2804	el remitente	nadawca	83	word	2022-04-07 20:47:16.440156
2805	el c??digo	kod	83	word	2022-04-07 20:47:16.440156
2806	el c??digo postal	kod pocztowy	83	word	2022-04-07 20:47:16.440156
2807	el auricular	s??uchawka	83	word	2022-04-07 20:47:16.440156
2808	el prefijo	numer kierunkowy	83	word	2022-04-07 20:47:16.440156
2809	informar	relacjonowa??	83	word	2022-04-07 20:47:16.440156
2810	el informe	relacja, sprawozdanie	83	word	2022-04-07 20:47:16.440156
2811	el hecho	fakt	83	word	2022-04-07 20:47:16.440156
2812	de hecho	faktycznie	83	word	2022-04-07 20:47:16.440156
2813	la redacci??n	redakcja	83	word	2022-04-07 20:47:16.440156
2814	el redactor	redaktor	83	word	2022-04-07 20:47:16.440156
2815	la l??nea	wiersz, linijka	83	word	2022-04-07 20:47:16.440156
2816	el titular	nag??wek	83	word	2022-04-07 20:47:16.440156
2817	??til	u??yteczny	83	word	2022-04-07 20:47:16.440156
2818	in??til	nieu??yteczny	83	word	2022-04-07 20:47:16.440156
2819	la pantalla	ekran	83	word	2022-04-07 20:47:16.440156
2820	apretar	naciska??, uciska?? (e/ie)	83	word	2022-04-07 20:47:16.440156
2821	la tecla	klawisz	83	word	2022-04-07 20:47:16.440156
2822	almacenar	zapisywa??, zachowywa??	83	word	2022-04-07 20:47:16.440156
2823	borrar	kasowa??, usuwa??	83	word	2022-04-07 20:47:16.440156
2824	grabar	nagrywa??	83	word	2022-04-07 20:47:16.440156
2825	la grabaci??n	nagranie	83	word	2022-04-07 20:47:16.440156
2826	la grabadora	magnetofon	83	word	2022-04-07 20:47:16.440156
2827	la carpinter??a	zak??ad stolarski	84	word	2022-04-07 20:47:55.038796
2828	el carpintero	stolarz	84	word	2022-04-07 20:47:55.038796
2829	el fontanero	hydraulik	84	word	2022-04-07 20:47:55.038796
2830	la tintorer??a	pralnia	84	word	2022-04-07 20:47:55.038796
2831	el estanco	kiosk z tytoniem	84	word	2022-04-07 20:47:55.038796
2832	la pipa	fajka	84	word	2022-04-07 20:47:55.038796
2833	la papeler??a	sklep papierniczy	84	word	2022-04-07 20:47:55.038796
2834	la jugueter??a	sklep z zabawkami	84	word	2022-04-07 20:47:55.038796
2835	la secci??n	dzia??, sekcja	84	word	2022-04-07 20:47:55.038796
2836	la mercanc??a	towar	84	word	2022-04-07 20:47:55.038796
2837	la oferta	oferta (korzystna)	84	word	2022-04-07 20:47:55.038796
2838	favorable	korzystny, preferencyjny	84	word	2022-04-07 20:47:55.038796
2839	desfavorable	niekorzystny	84	word	2022-04-07 20:47:55.038796
2840	la cola	kolejka	84	word	2022-04-07 20:47:55.038796
2841	el vistazo	spojrzenie	84	word	2022-04-07 20:47:55.038796
2842	consultar	radzi?? si??, zasi??ga?? opinii	84	word	2022-04-07 20:47:55.038796
2843	la consulta	porada, opinia	84	word	2022-04-07 20:47:55.038796
2844	escoger	wybiera??	84	word	2022-04-07 20:47:55.038796
2845	adquirir	nabywa??, zdobywa?? (i/ie)	84	word	2022-04-07 20:47:55.038796
2846	la adquisici??n	nabycie, nabytek	84	word	2022-04-07 20:47:55.038796
2847	embalar	opakowywa??	84	word	2022-04-07 20:47:55.038796
2848	el embalaje	opakowanie	84	word	2022-04-07 20:47:55.038796
2849	garantizar	gwarantowa??	84	word	2022-04-07 20:47:55.038796
2850	la garant??a	gwarancja	84	word	2022-04-07 20:47:55.038796
2851	la calidad	jako????	84	word	2022-04-07 20:47:55.038796
2852	el defecto	wada	84	word	2022-04-07 20:47:55.038796
2853	defectuoso	wadliwy	84	word	2022-04-07 20:47:55.038796
2854	reclamar	reklamowa?? (zg??asza?? reklamacj??)	84	word	2022-04-07 20:47:55.038796
2855	la reclamaci??n	reklamacja	84	word	2022-04-07 20:47:55.038796
2856	pertenecer	nale??e?? (c/zc)	85	word	2022-04-07 20:48:30.506113
2857	el pincel	p??dzel	85	word	2022-04-07 20:48:30.506113
2858	pegar	klei??	85	word	2022-04-07 20:48:30.506113
2859	el pegamento	klej	85	word	2022-04-07 20:48:30.506113
2860	resistente	trwa??y, wytrzyma??y	85	word	2022-04-07 20:48:30.506113
2861	sujetar	przymocowywa??, przytwierdza??	85	word	2022-04-07 20:48:30.506113
2862	extender	rozci??ga?? (e/ie)	85	word	2022-04-07 20:48:30.506113
2863	extenderse	rozci??ga?? si?? (e/ie)	85	word	2022-04-07 20:48:30.506113
2864	la cuerda	sznur, lina	85	word	2022-04-07 20:48:30.506113
2865	la correa	pasek, smycz	85	word	2022-04-07 20:48:30.506113
2866	atar	wi??za??, kr??powa??	85	word	2022-04-07 20:48:30.506113
2867	desatar	rozwi??zywa??	85	word	2022-04-07 20:48:30.506113
2868	soltar	rozlu??nia??, rozwi??zywa?? (o/ue)	85	word	2022-04-07 20:48:30.506113
2869	separar	rozdziela??	85	word	2022-04-07 20:48:30.506113
2870	separable	rozdzielny	85	word	2022-04-07 20:48:30.506113
2871	inseparable	nierozdzielny	85	word	2022-04-07 20:48:30.506113
2872	el utensilio	przyrz??d, narz??dzie	85	word	2022-04-07 20:48:30.506113
2873	utilizar	u??ywa??	85	word	2022-04-07 20:48:30.506113
2874	??til	u??yteczny	85	word	2022-04-07 20:48:30.506113
2875	in??til	bezu??yteczny	85	word	2022-04-07 20:48:30.506113
2876	el hacha	siekiera (rodzaj ??e??ski)	85	word	2022-04-07 20:48:30.506113
2877	el martillo	m??otek	85	word	2022-04-07 20:48:30.506113
2878	clavar	wbija?? (gw????d??, pinezk??)	85	word	2022-04-07 20:48:30.506113
2879	el clavo	gw????d??	85	word	2022-04-07 20:48:30.506113
2880	el tornillo	??ruba	85	word	2022-04-07 20:48:30.506113
2881	el destornillador	??rubokr??t	85	word	2022-04-07 20:48:30.506113
2882	girar	kr??ci??, obraca??	85	word	2022-04-07 20:48:30.506113
2883	girarse	kr??ci?? si??, obraca?? si??	85	word	2022-04-07 20:48:30.506113
2884	instalar	instalowa??	85	word	2022-04-07 20:48:30.506113
2885	la instalaci??n	instalacja	85	word	2022-04-07 20:48:30.506113
2886	el enchufe	kontakt (gniazdko)	85	word	2022-04-07 20:48:30.506113
2887	la bombilla	??ar??wka	85	word	2022-04-07 20:48:30.506113
2888	la linterna	latarka	85	word	2022-04-07 20:48:30.506113
2889	conservar	zachowywa??, trzyma??	85	word	2022-04-07 20:48:30.506113
\.


--
-- Name: lessons_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_lesson_id_seq', 85, true);


--
-- Name: words_word_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_word_id_seq', 2889, true);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lesson_id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: words words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_pkey PRIMARY KEY (word_id);


--
-- Name: words words_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(lesson_id);


--
-- PostgreSQL database dump complete
--

