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
3	Miasto i wieś	Spanish	A1	2022-04-05 12:19:21.021122
4	Anatomia	Spanish	A1	2022-04-05 12:26:16.047068
5	Poczta	Spanish	A1	2022-04-05 12:28:19.812105
6	Media i komunikacja	Spanish	A1	2022-04-05 12:30:07.296564
7	Cechy charakteru	Spanish	A1	2022-04-05 12:31:43.145974
8	Podróże	Spanish	A1	2022-04-05 12:32:51.405835
9	Odżywianie	Spanish	A1	2022-04-05 12:35:25.219229
10	Nauka i edukacja	Spanish	A1	2022-04-05 12:42:27.898394
11	Natura i pogoda	Spanish	A1	2022-04-05 12:50:29.875982
12	Wygląd	Spanish	A1	2022-04-05 12:52:03.544611
13	Ubiór	Spanish	A1	2022-04-05 12:52:54.060398
14	Kolory	Spanish	A1	2022-04-05 12:53:40.684809
15	Kalendarz	Spanish	A1	2022-04-05 12:54:42.345141
16	Rodzina	Spanish	A1	2022-04-05 12:55:35.060501
17	Rośliny	Spanish	A1	2022-04-05 12:57:04.614507
18	Uczucia	Spanish	A1	2022-04-05 12:57:37.668794
19	Dane osobowe	Spanish	A1	2022-04-05 12:58:41.631995
20	Zdrowie	Spanish	A1	2022-04-05 12:59:29.480201
21	Zwierzęta	Spanish	A1	2022-04-05 13:00:37.734819
22	Praca	Spanish	A1	2022-04-05 13:01:11.497668
23	Zakupy	Spanish	A1	2022-04-05 13:01:42.898723
24	Higiena	Spanish	A1	2022-04-05 13:03:37.703442
25	Położenie	Spanish	A1	2022-04-05 13:04:42.56757
26	Transport	Spanish	A1	2022-04-05 13:05:19.639027
27	Kraje	Spanish	A1	2022-04-05 13:06:43.519919
28	Państwo i prawo	Spanish	A1	2022-04-05 13:07:12.382454
29	Sport i rozrywka	Spanish	A1	2022-04-05 13:07:50.989929
30	Religia	Spanish	A1	2022-04-05 13:08:43.186581
31	Kultura i sztuka	Spanish	A1	2022-04-05 13:09:28.676142
32	Substancje	Spanish	A1	2022-04-05 13:11:48.373879
33	Gospodarka i finanse	Spanish	A1	2022-04-05 13:12:41.186643
34	Wojna	Spanish	A1	2022-04-05 13:13:16.491823
35	Różne	Spanish	A1	2022-04-05 13:14:04.64222
36	Czas	Spanish	A2	2022-04-05 16:35:42.303029
37	Liczby	Spanish	A2	2022-04-05 20:16:00.954682
38	Miary	Spanish	A2	2022-04-05 20:16:54.108631
39	Miasto i wieś	Spanish	A2	2022-04-05 20:18:25.342683
40	Odżywianie	Spanish	A2	2022-04-05 20:19:09.042499
41	Praca	Spanish	A2	2022-04-05 20:20:58.478437
42	Rośliny	Spanish	A2	2022-04-05 20:21:37.525718
43	Substancje i materiały	Spanish	A2	2022-04-05 20:22:35.241603
44	Uczucia	Spanish	A2	2022-04-05 20:23:04.360403
45	Zwierzęta	Spanish	A2	2022-04-05 20:23:54.858793
46	Dom	Spanish	A2	2022-04-05 20:24:56.730064
47	Charakter i osobowość	Spanish	A2	2022-04-05 20:25:37.546445
48	Anatomia	Spanish	A2	2022-04-05 20:27:03.625523
49	Gospodarka i finanse	Spanish	A2	2022-04-05 20:27:40.177258
50	Kraje	Spanish	A2	2022-04-05 20:28:44.92811
51	Kultura i sztuka	Spanish	A2	2022-04-05 20:29:20.144851
52	Media i technologia	Spanish	A2	2022-04-05 20:30:05.244893
53	Moda i ubiór	Spanish	A2	2022-04-05 20:30:35.74524
54	Porozumiewanie się	Spanish	A2	2022-04-05 20:31:19.327343
55	Natura i ekologia	Spanish	A2	2022-04-05 20:31:51.083911
56	Nauka i edukacja	Spanish	A2	2022-04-05 20:32:25.645666
57	Opinie	Spanish	A2	2022-04-05 20:33:50.229259
58	Podróże	Spanish	A2	2022-04-05 20:34:19.148659
59	Pogoda	Spanish	A2	2022-04-05 20:34:55.313006
60	Rodzina	Spanish	A2	2022-04-05 20:35:31.59697
61	Położenie	Spanish	A2	2022-04-05 20:36:11.331816
62	Transport	Spanish	A2	2022-04-05 20:36:46.514297
63	Zakupy	Spanish	A2	2022-04-05 20:37:18.983899
64	Zdrowie	Spanish	A2	2022-04-05 20:37:52.383658
65	Higiena	Spanish	A2	2022-04-05 20:38:35.983206
66	Państwo i polityka	Spanish	A2	2022-04-05 20:39:07.865738
67	Prawo i problemy społeczne	Spanish	A2	2022-04-05 20:39:48.167375
68	Przedmioty	Spanish	A2	2022-04-05 20:40:27.001263
69	Religia	Spanish	A2	2022-04-05 20:40:59.901007
70	Sport i czas wolny	Spanish	A2	2022-04-05 20:41:35.78251
71	Urzędy	Spanish	A2	2022-04-05 20:42:09.050219
72	Wojny i katastrofy	Spanish	A2	2022-04-05 20:42:41.552927
73	Wygląd zewnętrzny	Spanish	A2	2022-04-05 20:43:28.836456
74	Świat fantazji	Spanish	A2	2022-04-05 20:44:15.885397
75	Różne	Spanish	A2	2022-04-05 20:45:14.305693
76	Czas	Spanish	B1	2022-04-07 20:35:58.005442
77	Miary	Spanish	B1	2022-04-07 20:39:02.885164
78	Dom	Spanish	B1	2022-04-07 20:39:40.97773
79	Zwierzęta	Spanish	B1	2022-04-07 20:40:29.979273
80	Miasto i wieś	Spanish	B1	2022-04-07 20:41:23.762887
81	Kolory, kształty i dźwięki	Spanish	B1	2022-04-07 20:42:18.696233
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
1226	el patrón	pracodawca	41	word	2022-04-05 20:21:24.199495
1227	emplear	zatrudniać	41	word	2022-04-05 20:21:24.199495
4	la casa	dom	2	word	2022-04-05 12:17:07.182851
5	vivir	mieszkać	2	word	2022-04-05 12:17:07.182851
6	el vecino	sąsiad	2	word	2022-04-05 12:17:07.182851
7	el piso	mieszkanie	2	word	2022-04-05 12:17:07.182851
8	la planta	piętro	2	word	2022-04-05 12:17:07.182851
9	la planta baja	parter	2	word	2022-04-05 12:17:07.182851
10	la escalera	schody	2	word	2022-04-05 12:17:07.182851
11	el ascensor	winda	2	word	2022-04-05 12:17:07.182851
12	la puerta	drzwi	2	word	2022-04-05 12:17:07.182851
13	la llave	klucz	2	word	2022-04-05 12:17:07.182851
14	el pasillo	korytarz	2	word	2022-04-05 12:17:07.182851
15	la cocina	kuchnia	2	word	2022-04-05 12:17:07.182851
16	el cuarto	pokój (w rodzaju męskim)	2	word	2022-04-05 12:17:07.182851
17	el cuarto de baño	łazienka	2	word	2022-04-05 12:17:07.182851
18	el servicio	toaleta	2	word	2022-04-05 12:17:07.182851
19	el espejo	lustro	2	word	2022-04-05 12:17:07.182851
20	la habitación	pokój (w rodzaju żeńskim)	2	word	2022-04-05 12:17:07.182851
21	el salón	salon	2	word	2022-04-05 12:17:07.182851
22	el estante	półka	2	word	2022-04-05 12:17:07.182851
23	la estantería	regał	2	word	2022-04-05 12:17:07.182851
24	el sillón	fotel	2	word	2022-04-05 12:17:07.182851
25	cómodo	wygodny	2	word	2022-04-05 12:17:07.182851
26	incómodo	niewygodny	2	word	2022-04-05 12:17:07.182851
27	el sofá	sofa	2	word	2022-04-05 12:17:07.182851
28	el suelo	podłoga	2	word	2022-04-05 12:17:07.182851
29	la alfombra	dywan	2	word	2022-04-05 12:17:07.182851
30	el comedor	jadalnia	2	word	2022-04-05 12:17:07.182851
31	la silla	krzesło	2	word	2022-04-05 12:17:07.182851
32	la mesa	stół	2	word	2022-04-05 12:17:07.182851
33	la lámpara	lampa	2	word	2022-04-05 12:17:07.182851
34	el techo	sufit	2	word	2022-04-05 12:17:07.182851
35	el dormitorio	sypialnia	2	word	2022-04-05 12:17:07.182851
36	la cama	łóżko	2	word	2022-04-05 12:17:07.182851
37	el armario	szafa	2	word	2022-04-05 12:17:07.182851
38	la pared	ściana	2	word	2022-04-05 12:17:07.182851
39	la ventana	okno	2	word	2022-04-05 12:17:07.182851
40	el balcón	balkon	2	word	2022-04-05 12:17:07.182851
41	el patio	podwórze, dziedziniec	2	word	2022-04-05 12:17:07.182851
42	el plato	talerz	2	word	2022-04-05 12:17:07.182851
43	el platillo	spodek	2	word	2022-04-05 12:17:07.182851
44	la cuchara	łyżka	2	word	2022-04-05 12:17:07.182851
45	el tenedor	widelec	2	word	2022-04-05 12:17:07.182851
46	el cuchillo	nóż	2	word	2022-04-05 12:17:07.182851
47	el vaso	szklanka	2	word	2022-04-05 12:17:07.182851
48	la taza	filiżanka	2	word	2022-04-05 12:17:07.182851
49	la olla	garnek	2	word	2022-04-05 12:17:07.182851
50	la sartén	patelnia	2	word	2022-04-05 12:17:07.182851
51	preparar	przygotowywać	2	word	2022-04-05 12:17:07.182851
52	la preparación	przygotowanie	2	word	2022-04-05 12:17:07.182851
53	el orden	porządek	2	word	2022-04-05 12:17:07.182851
54	el desorden	nieporządek	2	word	2022-04-05 12:17:07.182851
55	la suciedad	brud	2	word	2022-04-05 12:17:07.182851
56	sucio	brudny	2	word	2022-04-05 12:17:07.182851
57	la basura	śmieci	2	word	2022-04-05 12:17:07.182851
58	limpiar	czyścić	2	word	2022-04-05 12:17:07.182851
59	limpio	czysty	2	word	2022-04-05 12:17:07.182851
60	lavar	prać, zmywać	2	word	2022-04-05 12:17:07.182851
61	la lavadora	pralka	2	word	2022-04-05 12:17:07.182851
62	la nevera	lodówka	2	word	2022-04-05 12:17:07.182851
63	la ciudad	miasto	3	word	2022-04-05 12:20:01.728215
64	la capital	stolica	3	word	2022-04-05 12:20:01.728215
65	la calle	ulica	3	word	2022-04-05 12:20:01.728215
66	la plaza	plac	3	word	2022-04-05 12:20:01.728215
67	el centro	centrum	3	word	2022-04-05 12:20:01.728215
68	el barrio	dzielnica	3	word	2022-04-05 12:20:01.728215
69	el parque	park	3	word	2022-04-05 12:20:01.728215
70	el banco	ławka	3	word	2022-04-05 12:20:01.728215
71	el autobús	autobus	3	word	2022-04-05 12:20:01.728215
72	el tranvía	tramwaj	3	word	2022-04-05 12:20:01.728215
73	la parada	przystanek	3	word	2022-04-05 12:20:01.728215
74	el metro	metro	3	word	2022-04-05 12:20:01.728215
75	el taxi	taksówka	3	word	2022-04-05 12:20:01.728215
76	el taxista	taksówkarz	3	word	2022-04-05 12:20:01.728215
77	aparcar	parkować	3	word	2022-04-05 12:20:01.728215
78	el aparcamiento	parking	3	word	2022-04-05 12:20:01.728215
79	el puente	most	3	word	2022-04-05 12:20:01.728215
80	construir	budować	3	word	2022-04-05 12:20:01.728215
81	el edificio	budynek	3	word	2022-04-05 12:20:01.728215
82	moderno	nowoczesny	3	word	2022-04-05 12:20:01.728215
83	antiguo	stary, zabytkowy	3	word	2022-04-05 12:20:01.728215
84	el campo	wieś (tereny pozamiejskie)	3	word	2022-04-05 12:20:01.728215
85	el campesino	chłop, wieśniak	3	word	2022-04-05 12:20:01.728215
86	campesino	wiejski	3	word	2022-04-05 12:20:01.728215
87	el pueblo	wieś, mała miejscowość	3	word	2022-04-05 12:20:01.728215
88	el campo	pole	3	word	2022-04-05 12:20:01.728215
89	el tractor	traktor	3	word	2022-04-05 12:20:01.728215
90	el camino	droga	3	word	2022-04-05 12:20:01.728215
91	la anatomía	anatomia	4	word	2022-04-05 12:26:55.063594
92	el cuerpo	ciało	4	word	2022-04-05 12:26:55.063594
93	la cabeza	głowa	4	word	2022-04-05 12:26:55.063594
94	la cara	twarz	4	word	2022-04-05 12:26:55.063594
95	el ojo	oko	4	word	2022-04-05 12:26:55.063594
96	ver	widzieć	4	word	2022-04-05 12:26:55.063594
97	la oreja	ucho	4	word	2022-04-05 12:26:55.063594
98	oír	słyszeć (1g)	4	word	2022-04-05 12:26:55.063594
99	la nariz	nos	4	word	2022-04-05 12:26:55.063594
100	la boca	usta	4	word	2022-04-05 12:26:55.063594
101	la lengua	język	4	word	2022-04-05 12:26:55.063594
102	el diente	ząb	4	word	2022-04-05 12:26:55.063594
103	la garganta	gardło	4	word	2022-04-05 12:26:55.063594
104	el pecho	klatka piersiowa	4	word	2022-04-05 12:26:55.063594
105	el corazón	serce	4	word	2022-04-05 12:26:55.063594
106	la sangre	krew	4	word	2022-04-05 12:26:55.063594
107	el brazo	ramię, ręka	4	word	2022-04-05 12:26:55.063594
108	el codo	łokieć	4	word	2022-04-05 12:26:55.063594
109	la mano	ręka, dłoń	4	word	2022-04-05 12:26:55.063594
110	el dedo	palec	4	word	2022-04-05 12:26:55.063594
111	el vientre	brzuch	4	word	2022-04-05 12:26:55.063594
112	el estómago	żołądek	4	word	2022-04-05 12:26:55.063594
113	la pierna	noga	4	word	2022-04-05 12:26:55.063594
114	la rodilla	kolano	4	word	2022-04-05 12:26:55.063594
115	el pie	stopa	4	word	2022-04-05 12:26:55.063594
116	la piel	skóra	4	word	2022-04-05 12:26:55.063594
117	el correo	korespondencja, poczta	5	word	2022-04-05 12:28:45.428327
118	la oficina de correos	urząd pocztowy	5	word	2022-04-05 12:28:45.428327
119	la carta	list	5	word	2022-04-05 12:28:45.428327
120	la tarjeta	karta	5	word	2022-04-05 12:28:45.428327
121	postal	pocztowy	5	word	2022-04-05 12:28:45.428327
122	el sello	znaczek pocztowy	5	word	2022-04-05 12:28:45.428327
123	la dirección	adres	5	word	2022-04-05 12:28:45.428327
124	enviar	wysyłać	5	word	2022-04-05 12:28:45.428327
125	el cartero	listonosz	5	word	2022-04-05 12:28:45.428327
126	el teléfono	telefon	6	word	2022-04-05 12:30:55.375338
127	telefónico	telefoniczny	6	word	2022-04-05 12:30:55.375338
128	llamar	dzwonić	6	word	2022-04-05 12:30:55.375338
129	la llamada	połączenie (telefoniczne)	6	word	2022-04-05 12:30:55.375338
130	diga	halo, słucham	6	word	2022-04-05 12:30:55.375338
131	el periódico	gazeta	6	word	2022-04-05 12:30:55.375338
132	la revista	czasopismo	6	word	2022-04-05 12:30:55.375338
133	la radio	radio	6	word	2022-04-05 12:30:55.375338
134	el televisor	telewizor	6	word	2022-04-05 12:30:55.375338
135	la televisión	telewizja	6	word	2022-04-05 12:30:55.375338
136	el programa	program	6	word	2022-04-05 12:30:55.375338
137	el ordenador	komputer	6	word	2022-04-05 12:30:55.375338
138	el Internet	internet	6	word	2022-04-05 12:30:55.375338
139	la noticia	wiadomość	6	word	2022-04-05 12:30:55.375338
140	electrónico	elektroniczny	6	word	2022-04-05 12:30:55.375338
141	el carácter	charakter	7	word	2022-04-05 12:32:14.527892
142	característico	charakterystyczny	7	word	2022-04-05 12:32:14.527892
143	bueno	dobry	7	word	2022-04-05 12:32:14.527892
144	malo	zły	7	word	2022-04-05 12:32:14.527892
145	amable	miły, uprzejmy	7	word	2022-04-05 12:32:14.527892
146	grosero	ordynarny, grubiański	7	word	2022-04-05 12:32:14.527892
147	simpático	sympatyczny	7	word	2022-04-05 12:32:14.527892
148	antipático	niesympatyczny	7	word	2022-04-05 12:32:14.527892
149	serio	poważny	7	word	2022-04-05 12:32:14.527892
150	divertido	śmieszny, zabawny	7	word	2022-04-05 12:32:14.527892
151	paciente	cierpliwy	7	word	2022-04-05 12:32:14.527892
152	impaciente	niecierpliwy	7	word	2022-04-05 12:32:14.527892
153	nervioso	nerwowy	7	word	2022-04-05 12:32:14.527892
154	tímido	nieśmiały	7	word	2022-04-05 12:32:14.527892
155	riguroso	surowy	7	word	2022-04-05 12:32:14.527892
156	viajar	podróżować	8	word	2022-04-05 12:33:20.875123
157	el viaje	podróż	8	word	2022-04-05 12:33:20.875123
158	el viajero	podróżnik	8	word	2022-04-05 12:33:20.875123
159	las vacaciones	wakacje	8	word	2022-04-05 12:33:20.875123
160	la agencia	agencja, biuro	8	word	2022-04-05 12:33:20.875123
161	reservar	rezerwować	8	word	2022-04-05 12:33:20.875123
162	la reserva	rezerwacja	8	word	2022-04-05 12:33:20.875123
163	el hotel	hotel	8	word	2022-04-05 12:33:20.875123
164	pasar	spędzać	8	word	2022-04-05 12:33:20.875123
165	la mochila	plecak	8	word	2022-04-05 12:33:20.875123
166	la bolsa	torba	8	word	2022-04-05 12:33:20.875123
167	la maleta	walizka	8	word	2022-04-05 12:33:20.875123
168	el equipaje	bagaż	8	word	2022-04-05 12:33:20.875123
169	listo	gotowy	8	word	2022-04-05 12:33:20.875123
170	la frontera	granica	8	word	2022-04-05 12:33:20.875123
171	el pasaporte	paszport	8	word	2022-04-05 12:33:20.875123
172	el mapa	mapa	8	word	2022-04-05 12:33:20.875123
173	la excursión	wycieczka	8	word	2022-04-05 12:33:20.875123
174	el camping	kemping, pole namiotowe	8	word	2022-04-05 12:33:20.875123
175	la tienda de campaña	namiot	8	word	2022-04-05 12:33:20.875123
176	el turismo	turystyka	8	word	2022-04-05 12:33:20.875123
177	el turista	turysta	8	word	2022-04-05 12:33:20.875123
178	turístico	turystyczny	8	word	2022-04-05 12:33:20.875123
179	la información	informacja	8	word	2022-04-05 12:33:20.875123
180	planear	planować	8	word	2022-04-05 12:33:20.875123
181	el plano	plan	8	word	2022-04-05 12:33:20.875123
182	visitar	zwiedzać	8	word	2022-04-05 12:33:20.875123
183	el guía	przewodnik (osoba)	8	word	2022-04-05 12:33:20.875123
184	el monumento	pomnik, zabytek	8	word	2022-04-05 12:33:20.875123
185	famoso	sławny	8	word	2022-04-05 12:33:20.875123
186	descansar	odpoczywać	8	word	2022-04-05 12:33:20.875123
187	el descanso	odpoczynek	8	word	2022-04-05 12:33:20.875123
188	la playa	plaża	8	word	2022-04-05 12:33:20.875123
189	tomar	brać	8	word	2022-04-05 12:33:20.875123
190	la tranquilidad	spokój	8	word	2022-04-05 12:33:20.875123
191	tranquilo	spokojny	8	word	2022-04-05 12:33:20.875123
192	bañar	kąpać	8	word	2022-04-05 12:33:20.875123
193	agradable	przyjemny	8	word	2022-04-05 12:33:20.875123
194	desagradable	nieprzyjemny	8	word	2022-04-05 12:33:20.875123
195	saludar	witać	8	word	2022-04-05 12:33:20.875123
196	el saludo	powitanie	8	word	2022-04-05 12:33:20.875123
197	volver	wracać (o/ue)	8	word	2022-04-05 12:33:20.875123
198	la vuelta	powrót	8	word	2022-04-05 12:33:20.875123
199	desayunar	jeść śniadanie	9	word	2022-04-05 12:36:17.848528
200	el desayuno	śniadanie	9	word	2022-04-05 12:36:17.848528
201	el hambre	głód (rodzaj żeński)	9	word	2022-04-05 12:36:17.848528
202	el alimento	pokarm	9	word	2022-04-05 12:36:17.848528
203	el pan	chleb	9	word	2022-04-05 12:36:17.848528
204	el panecillo	bułka	9	word	2022-04-05 12:36:17.848528
205	cortar	kroić	9	word	2022-04-05 12:36:17.848528
206	la mantequilla	masło	9	word	2022-04-05 12:36:17.848528
207	la miel	miód	9	word	2022-04-05 12:36:17.848528
208	la marmelada	dżem	9	word	2022-04-05 12:36:17.848528
209	la leche	mleko	9	word	2022-04-05 12:36:17.848528
210	el cacao	kakao	9	word	2022-04-05 12:36:17.848528
211	el yogur	jogurt	9	word	2022-04-05 12:36:17.848528
212	el queso	ser	9	word	2022-04-05 12:36:17.848528
213	el requesón	twaróg	9	word	2022-04-05 12:36:17.848528
214	fresco	świeży	9	word	2022-04-05 12:36:17.848528
215	la nata	śmietana	9	word	2022-04-05 12:36:17.848528
216	el huevo	jajko	9	word	2022-04-05 12:36:17.848528
217	el jamón	szynka	9	word	2022-04-05 12:36:17.848528
218	la salchicha	kiełbasa	9	word	2022-04-05 12:36:17.848528
219	cocinar	gotować	9	word	2022-04-05 12:36:17.848528
220	el cocinero	kucharz	9	word	2022-04-05 12:36:17.848528
221	el restaurante	restauracja	9	word	2022-04-05 12:36:17.848528
222	comer	jeść	9	word	2022-04-05 12:36:17.848528
223	la comida	jedzenie	9	word	2022-04-05 12:36:17.848528
224	cenar	jeść kolację	9	word	2022-04-05 12:36:17.848528
225	la cena	kolacja	9	word	2022-04-05 12:36:17.848528
226	la sopa	zupa	9	word	2022-04-05 12:36:17.848528
227	el arroz	ryż	9	word	2022-04-05 12:36:17.848528
228	los macarrones	makaron	9	word	2022-04-05 12:36:17.848528
229	las patatas fritas	frytki	9	word	2022-04-05 12:36:17.848528
230	el aceite	olej	9	word	2022-04-05 12:36:17.848528
231	el pescado	ryba (potrawa)	9	word	2022-04-05 12:36:17.848528
232	freír	smażyć	9	word	2022-04-05 12:36:17.848528
233	la carne	mięso	9	word	2022-04-05 12:36:17.848528
234	la carne de vaca	wołowina	9	word	2022-04-05 12:36:17.848528
235	la carne de cerdo	wieprzowina	9	word	2022-04-05 12:36:17.848528
236	el marisco	owoce morza	9	word	2022-04-05 12:36:17.848528
237	la salsa	sos	9	word	2022-04-05 12:36:17.848528
238	la sal	sól	9	word	2022-04-05 12:36:17.848528
239	salado	słony	9	word	2022-04-05 12:36:17.848528
240	la pimienta	pieprz	9	word	2022-04-05 12:36:17.848528
241	rico	pyszny, wyśmienity	9	word	2022-04-05 12:36:17.848528
242	la ensalada	sałatka	9	word	2022-04-05 12:36:17.848528
243	la ensaladilla rusa	sałatka warzywna	9	word	2022-04-05 12:36:17.848528
244	qué aproveche	smacznego	9	word	2022-04-05 12:36:17.848528
245	la sed	pragnienie	9	word	2022-04-05 12:36:17.848528
246	beber	pić	9	word	2022-04-05 12:36:17.848528
247	la bebida	napój	9	word	2022-04-05 12:36:17.848528
248	el zumo	sok	9	word	2022-04-05 12:36:17.848528
249	mineral	mineralny	9	word	2022-04-05 12:36:17.848528
250	la cafetería	kawiarnia	9	word	2022-04-05 12:36:17.848528
251	el chocolate	czekolada	9	word	2022-04-05 12:36:17.848528
252	la tarta	tort	9	word	2022-04-05 12:36:17.848528
253	dulce	słodki	9	word	2022-04-05 12:36:17.848528
254	el pastel	ciasto	9	word	2022-04-05 12:36:17.848528
255	la galleta	ciasteczko, herbatnik	9	word	2022-04-05 12:36:17.848528
256	el helado	lody	9	word	2022-04-05 12:36:17.848528
257	el café	kawa	9	word	2022-04-05 12:36:17.848528
258	el café solo	kawa czarna	9	word	2022-04-05 12:36:17.848528
259	el té	herbata	9	word	2022-04-05 12:36:17.848528
260	el azúcar	cukier	9	word	2022-04-05 12:36:17.848528
261	el bar	bar	9	word	2022-04-05 12:36:17.848528
262	la tapa	przekąska	9	word	2022-04-05 12:36:17.848528
263	la tortilla	omlet	9	word	2022-04-05 12:36:17.848528
264	la cerveza	piwo	9	word	2022-04-05 12:36:17.848528
265	el vino	wino	9	word	2022-04-05 12:36:17.848528
266	la escuela	szkoła	10	word	2022-04-05 12:49:42.89867
267	la clase	klasa, sala lekcyjna	10	word	2022-04-05 12:49:42.89867
268	el maestro	nauczyciel (w szkole podstawowej i gimnazjum)	10	word	2022-04-05 12:49:42.89867
269	el alumno	uczeń	10	word	2022-04-05 12:49:42.89867
270	aplicado	pilny	10	word	2022-04-05 12:49:42.89867
271	vago	leniwy	10	word	2022-04-05 12:49:42.89867
272	estudiar	studiować, uczyć się	10	word	2022-04-05 12:49:42.89867
273	el estudiante	student	10	word	2022-04-05 12:49:42.89867
274	la estudiante	studentka	10	word	2022-04-05 12:49:42.89867
275	la universidad	uniwersytet	10	word	2022-04-05 12:49:42.89867
276	el profesor	nauczyciel, profesor	10	word	2022-04-05 12:49:42.89867
277	la clase	lekcja ( c)	10	word	2022-04-05 12:49:42.89867
278	el recreo	przerwa w szkole	10	word	2022-04-05 12:49:42.89867
279	asistir	uczęszczać	10	word	2022-04-05 12:49:42.89867
280	el curso	kurs	10	word	2022-04-05 12:49:42.89867
281	la lección	lekcja (l)	10	word	2022-04-05 12:49:42.89867
282	el tema	temat	10	word	2022-04-05 12:49:42.89867
283	escribir	pisać	10	word	2022-04-05 12:49:42.89867
284	la pizarra	tablica	10	word	2022-04-05 12:49:42.89867
285	la tiza	kreda	10	word	2022-04-05 12:49:42.89867
286	el libro	książka	10	word	2022-04-05 12:49:42.89867
287	leer	czytać	10	word	2022-04-05 12:49:42.89867
288	el texto	tekst	10	word	2022-04-05 12:49:42.89867
289	el libro de texto	podręcznik	10	word	2022-04-05 12:49:42.89867
290	sobre	o	10	word	2022-04-05 12:49:42.89867
291	la página	strona	10	word	2022-04-05 12:49:42.89867
292	la biblioteca	biblioteka	10	word	2022-04-05 12:49:42.89867
293	el bibliotecario	bibliotekarz	10	word	2022-04-05 12:49:42.89867
294	aprender	uczyć się	10	word	2022-04-05 12:49:42.89867
295	fácil	łatwy	10	word	2022-04-05 12:49:42.89867
296	difícil	trudny	10	word	2022-04-05 12:49:42.89867
297	entender	rozumieć (e/ie)	10	word	2022-04-05 12:49:42.89867
298	repetir	powtarzać (e/i)	10	word	2022-04-05 12:49:42.89867
299	la repetición	powtórka	10	word	2022-04-05 12:49:42.89867
300	los deberes	praca domowa	10	word	2022-04-05 12:49:42.89867
301	el cuaderno	zeszyt	10	word	2022-04-05 12:49:42.89867
302	mostrar	pokazywać (o/ue)	10	word	2022-04-05 12:49:42.89867
303	preguntar	pytać	10	word	2022-04-05 12:49:42.89867
304	la pregunta	pytanie	10	word	2022-04-05 12:49:42.89867
305	responder	odpowiadać	10	word	2022-04-05 12:49:42.89867
306	la respuesta	odpowiedź	10	word	2022-04-05 12:49:42.89867
307	saber	wiedzieć (nr)	10	word	2022-04-05 12:49:42.89867
308	olvidar	zapominać	10	word	2022-04-05 12:49:42.89867
309	preparado	przygotowany	10	word	2022-04-05 12:49:42.89867
310	el examen	egzamin	10	word	2022-04-05 12:49:42.89867
311	los exámenes	egzaminy	10	word	2022-04-05 12:49:42.89867
312	el error	błąd	10	word	2022-04-05 12:49:42.89867
313	discutir	dyskutować	10	word	2022-04-05 12:49:42.89867
314	la discusión	dyskusja	10	word	2022-04-05 12:49:42.89867
315	la nota	ocena, stopień	10	word	2022-04-05 12:49:42.89867
316	la asignatura	przedmiot (w szkole)	10	word	2022-04-05 12:49:42.89867
317	favorito	ulubiony (f)	10	word	2022-04-05 12:49:42.89867
318	las matemáticas	matematyka	10	word	2022-04-05 12:49:42.89867
319	la geografía	geografia	10	word	2022-04-05 12:49:42.89867
320	la química	chemia	10	word	2022-04-05 12:49:42.89867
321	la física	fizyka	10	word	2022-04-05 12:49:42.89867
322	la historia	historia	10	word	2022-04-05 12:49:42.89867
323	la biología	biologia	10	word	2022-04-05 12:49:42.89867
324	el compañero	kolega	10	word	2022-04-05 12:49:42.89867
325	la inteligencia	inteligencja	10	word	2022-04-05 12:49:42.89867
326	inteligente	inteligentny	10	word	2022-04-05 12:49:42.89867
327	la tontería	głupota	10	word	2022-04-05 12:49:42.89867
328	el tonto	głupiec	10	word	2022-04-05 12:49:42.89867
329	tonto	głupi	10	word	2022-04-05 12:49:42.89867
330	tener que	musieć (nr)	10	word	2022-04-05 12:49:42.89867
331	hay que	trzeba	10	word	2022-04-05 12:49:42.89867
332	la naturaleza	natura, przyroda	11	word	2022-04-05 12:50:57.851839
333	el mundo	świat	11	word	2022-04-05 12:50:57.851839
334	la estrella	gwiazda	11	word	2022-04-05 12:50:57.851839
335	la luna	księżyc	11	word	2022-04-05 12:50:57.851839
336	la tierra	ziemia	11	word	2022-04-05 12:50:57.851839
337	el agua	woda	11	word	2022-04-05 12:50:57.851839
338	el océano	ocean	11	word	2022-04-05 12:50:57.851839
339	la isla	wyspa	11	word	2022-04-05 12:50:57.851839
340	el mar	morze	11	word	2022-04-05 12:50:57.851839
341	el río	rzeka	11	word	2022-04-05 12:50:57.851839
342	el lago	jezioro	11	word	2022-04-05 12:50:57.851839
343	la montaña	góra	11	word	2022-04-05 12:50:57.851839
344	el bosque	las	11	word	2022-04-05 12:50:57.851839
345	dañar	krzywdzić, szkodzić	11	word	2022-04-05 12:50:57.851839
346	el daño	krzywda	11	word	2022-04-05 12:50:57.851839
347	proteger	chronić	11	word	2022-04-05 12:50:57.851839
348	la protección	ochrona	11	word	2022-04-05 12:50:57.851839
349	el medio ambiente	środowisko	11	word	2022-04-05 12:50:57.851839
350	el tiempo	pogoda	11	word	2022-04-05 12:50:57.851839
351	el sol	słońce	11	word	2022-04-05 12:50:57.851839
352	el calor	upał	11	word	2022-04-05 12:50:57.851839
353	caliente	gorący, ciepły	11	word	2022-04-05 12:50:57.851839
354	frío	zimny	11	word	2022-04-05 12:50:57.851839
355	llover	padać (o deszczu) (o/ue)	11	word	2022-04-05 12:50:57.851839
356	la lluvia	deszcz	11	word	2022-04-05 12:50:57.851839
357	lluvioso	deszczowy	11	word	2022-04-05 12:50:57.851839
358	nevar	padać (o śniegu) (e/ie)	11	word	2022-04-05 12:50:57.851839
359	la nieve	śnieg	11	word	2022-04-05 12:50:57.851839
360	el hielo	lód	11	word	2022-04-05 12:50:57.851839
361	el viento	wiatr	11	word	2022-04-05 12:50:57.851839
362	el aire	powietrze	11	word	2022-04-05 12:50:57.851839
363	el cielo	niebo	11	word	2022-04-05 12:50:57.851839
364	la nube	chmura	11	word	2022-04-05 12:50:57.851839
365	nublado	zachmurzony, pochmurny	11	word	2022-04-05 12:50:57.851839
366	la temperatura	temperatura	11	word	2022-04-05 12:50:57.851839
367	el grado	stopień	11	word	2022-04-05 12:50:57.851839
368	alto	wysoki	12	word	2022-04-05 12:52:29.753206
369	bajo	niski	12	word	2022-04-05 12:52:29.753206
370	que	niż, od	12	word	2022-04-05 12:52:29.753206
371	joven	młody	12	word	2022-04-05 12:52:29.753206
372	viejo	stary	12	word	2022-04-05 12:52:29.753206
373	bonito	piękny	12	word	2022-04-05 12:52:29.753206
374	feo	brzydki	12	word	2022-04-05 12:52:29.753206
375	la figura	figura	12	word	2022-04-05 12:52:29.753206
376	gordo	gruby, otyły	12	word	2022-04-05 12:52:29.753206
377	delgado	cienki, chudy	12	word	2022-04-05 12:52:29.753206
378	el pelo	włos	12	word	2022-04-05 12:52:29.753206
379	rubio	blond	12	word	2022-04-05 12:52:29.753206
380	moreno	brunet, ciemnowłosy	12	word	2022-04-05 12:52:29.753206
381	castaño	brązowy (o włosach), piwny (o oczach)	12	word	2022-04-05 12:52:29.753206
382	pelirrojo	rudowłosy, rudy	12	word	2022-04-05 12:52:29.753206
383	calvo	łysy	12	word	2022-04-05 12:52:29.753206
384	la barba	broda	12	word	2022-04-05 12:52:29.753206
385	el bigote	wąsy	12	word	2022-04-05 12:52:29.753206
386	la ropa	ubranie	13	word	2022-04-05 12:53:20.560115
387	llevar	nosić, mieć na sobie	13	word	2022-04-05 12:53:20.560115
388	el jersey	sweter	13	word	2022-04-05 12:53:20.560115
389	la camisa	koszula	13	word	2022-04-05 12:53:20.560115
390	la camiseta	koszulka	13	word	2022-04-05 12:53:20.560115
391	los pantalones	spodnie	13	word	2022-04-05 12:53:20.560115
392	el calcetín	skarpetka	13	word	2022-04-05 12:53:20.560115
393	los calcetines	skarpetki	13	word	2022-04-05 12:53:20.560115
394	los vaqueros	spodnie dżinsowe	13	word	2022-04-05 12:53:20.560115
395	la cazadora	kurtka	13	word	2022-04-05 12:53:20.560115
396	el bolsillo	kieszeń	13	word	2022-04-05 12:53:20.560115
397	la blusa	bluzka	13	word	2022-04-05 12:53:20.560115
398	la falda	spódnica	13	word	2022-04-05 12:53:20.560115
399	el vestido	suknia, sukienka	13	word	2022-04-05 12:53:20.560115
400	el abrigo	płaszcz	13	word	2022-04-05 12:53:20.560115
401	el paraguas	parasol	13	word	2022-04-05 12:53:20.560115
402	el sombrero	kapelusz	13	word	2022-04-05 12:53:20.560115
403	el zapato	but	13	word	2022-04-05 12:53:20.560115
404	la bota	wysoki but, kozak	13	word	2022-04-05 12:53:20.560115
405	elegante	elegancki	13	word	2022-04-05 12:53:20.560115
406	vestirse	ubierać się (e/i)	13	word	2022-04-05 12:53:20.560115
407	vestir	ubierać (e/i)	13	word	2022-04-05 12:53:20.560115
408	la moda	moda	13	word	2022-04-05 12:53:20.560115
409	de moda	modny	13	word	2022-04-05 12:53:20.560115
410	pasado de moda	niemodny	13	word	2022-04-05 12:53:20.560115
411	el bolso	torebka damska	13	word	2022-04-05 12:53:20.560115
412	el anillo	pierścionek	13	word	2022-04-05 12:53:20.560115
413	las gafas	okulary	13	word	2022-04-05 12:53:20.560115
414	el reloj	zegarek, zegar	13	word	2022-04-05 12:53:20.560115
415	estupendo	fantastyczny, świetny	13	word	2022-04-05 12:53:20.560115
416	demasiado	za, zbyt	13	word	2022-04-05 12:53:20.560115
417	el color	kolor	14	word	2022-04-05 12:54:08.976201
418	de colores	kolorowy	14	word	2022-04-05 12:54:08.976201
419	blanco	biały	14	word	2022-04-05 12:54:08.976201
420	negro	czarny	14	word	2022-04-05 12:54:08.976201
421	rojo	czerwony	14	word	2022-04-05 12:54:08.976201
422	amarillo	żółty	14	word	2022-04-05 12:54:08.976201
423	verde	zielony	14	word	2022-04-05 12:54:08.976201
424	azul	niebieski	14	word	2022-04-05 12:54:08.976201
425	azul marino	granatowy	14	word	2022-04-05 12:54:08.976201
426	gris	szary	14	word	2022-04-05 12:54:08.976201
427	marrón	brązowy	14	word	2022-04-05 12:54:08.976201
428	claro	jasny	14	word	2022-04-05 12:54:08.976201
429	oscuro	ciemny	14	word	2022-04-05 12:54:08.976201
430	el calendario	kalendarz	15	word	2022-04-05 12:55:06.007015
431	el día	dzień	15	word	2022-04-05 12:55:06.007015
432	el lunes	poniedziałek	15	word	2022-04-05 12:55:06.007015
433	el martes	wtorek	15	word	2022-04-05 12:55:06.007015
434	el miércoles	środa	15	word	2022-04-05 12:55:06.007015
435	el jueves	czwartek	15	word	2022-04-05 12:55:06.007015
436	el viernes	piątek	15	word	2022-04-05 12:55:06.007015
437	el sábado	sobota	15	word	2022-04-05 12:55:06.007015
438	el domingo	niedziela	15	word	2022-04-05 12:55:06.007015
439	la semana	tydzień	15	word	2022-04-05 12:55:06.007015
440	el mes	miesiąc	15	word	2022-04-05 12:55:06.007015
441	enero	styczeń	15	word	2022-04-05 12:55:06.007015
442	febrero	luty	15	word	2022-04-05 12:55:06.007015
443	marzo	marzec	15	word	2022-04-05 12:55:06.007015
444	abril	kwiecień	15	word	2022-04-05 12:55:06.007015
445	mayo	maj	15	word	2022-04-05 12:55:06.007015
446	junio	czerwiec	15	word	2022-04-05 12:55:06.007015
447	julio	lipiec	15	word	2022-04-05 12:55:06.007015
448	agosto	sierpień	15	word	2022-04-05 12:55:06.007015
449	septiembre	wrzesień	15	word	2022-04-05 12:55:06.007015
450	octubre	październik	15	word	2022-04-05 12:55:06.007015
451	noviembre	listopad	15	word	2022-04-05 12:55:06.007015
452	diciembre	grudzień	15	word	2022-04-05 12:55:06.007015
453	el año	rok	15	word	2022-04-05 12:55:06.007015
454	la estación del año	pora roku	15	word	2022-04-05 12:55:06.007015
455	la primavera	wiosna	15	word	2022-04-05 12:55:06.007015
456	el verano	lato	15	word	2022-04-05 12:55:06.007015
457	el otoño	jesień	15	word	2022-04-05 12:55:06.007015
458	el invierno	zima	15	word	2022-04-05 12:55:06.007015
459	la familia	rodzina	16	word	2022-04-05 12:56:31.904282
460	el padre	ojciec	16	word	2022-04-05 12:56:31.904282
461	el papá	tata	16	word	2022-04-05 12:56:31.904282
462	la madre	matka	16	word	2022-04-05 12:56:31.904282
463	la mamá	mama	16	word	2022-04-05 12:56:31.904282
464	los padres	rodzice	16	word	2022-04-05 12:56:31.904282
465	el hermano	brat	16	word	2022-04-05 12:56:31.904282
466	la hermana	siostra	16	word	2022-04-05 12:56:31.904282
467	los hermanos	rodzeństwo	16	word	2022-04-05 12:56:31.904282
468	el niño	dziecko (chłopiec)	16	word	2022-04-05 12:56:31.904282
469	la niña	dziecko (dziewczynka)	16	word	2022-04-05 12:56:31.904282
470	el hijo	syn	16	word	2022-04-05 12:56:31.904282
471	la hija	córka	16	word	2022-04-05 12:56:31.904282
472	los hijos	dzieci (potomstwo)	16	word	2022-04-05 12:56:31.904282
473	mayor	starszy	16	word	2022-04-05 12:56:31.904282
474	menor	młodszy	16	word	2022-04-05 12:56:31.904282
475	el abuelo	dziadek	16	word	2022-04-05 12:56:31.904282
476	la abuela	babcia	16	word	2022-04-05 12:56:31.904282
477	el nieto	wnuk	16	word	2022-04-05 12:56:31.904282
478	la nieta	wnuczka	16	word	2022-04-05 12:56:31.904282
479	el tío	wujek	16	word	2022-04-05 12:56:31.904282
480	la tía	ciocia	16	word	2022-04-05 12:56:31.904282
481	el marido	mąż	16	word	2022-04-05 12:56:31.904282
482	la mujer	żona	16	word	2022-04-05 12:56:31.904282
483	cumplir	kończyć (o latach)	16	word	2022-04-05 12:56:31.904282
484	el cumpleaños	urodziny	16	word	2022-04-05 12:56:31.904282
485	el santo	imieniny	16	word	2022-04-05 12:56:31.904282
486	la fiesta	przyjęcie	16	word	2022-04-05 12:56:31.904282
487	invitar	zapraszać	16	word	2022-04-05 12:56:31.904282
488	la invitación	zaproszenie	16	word	2022-04-05 12:56:31.904282
489	visitar	odwiedzać	16	word	2022-04-05 12:56:31.904282
490	la visita	odwiedziny	16	word	2022-04-05 12:56:31.904282
491	el huésped	gość	16	word	2022-04-05 12:56:31.904282
492	desear	życzyć	16	word	2022-04-05 12:56:31.904282
493	el deseo	życzenie	16	word	2022-04-05 12:56:31.904282
494	felicitar	winszować	16	word	2022-04-05 12:56:31.904282
495	la felicidad	szczęście	16	word	2022-04-05 12:56:31.904282
496	la sorpresa	niespodzianka	16	word	2022-04-05 12:56:31.904282
497	regalar	dawać w prezencie	16	word	2022-04-05 12:56:31.904282
498	el regalo	prezent	16	word	2022-04-05 12:56:31.904282
499	dar	dawać (nr)	16	word	2022-04-05 12:56:31.904282
500	recibir	dostawać	16	word	2022-04-05 12:56:31.904282
501	de	od	16	word	2022-04-05 12:56:31.904282
502	para	dla	16	word	2022-04-05 12:56:31.904282
503	junto	łączny, złączony	16	word	2022-04-05 12:56:31.904282
504	el árbol	drzewo	17	word	2022-04-05 12:57:26.223854
505	la palma	palma	17	word	2022-04-05 12:57:26.223854
506	la flor	kwiat	17	word	2022-04-05 12:57:26.223854
507	la rosa	róża	17	word	2022-04-05 12:57:26.223854
508	plantar	sadzić	17	word	2022-04-05 12:57:26.223854
509	la planta	roślina	17	word	2022-04-05 12:57:26.223854
510	crecer	rosnąć (c/zc)	17	word	2022-04-05 12:57:26.223854
511	la hierba	trawa	17	word	2022-04-05 12:57:26.223854
512	el jardín	ogród	17	word	2022-04-05 12:57:26.223854
513	el jardinero	ogrodnik	17	word	2022-04-05 12:57:26.223854
514	la verdura	warzywo	17	word	2022-04-05 12:57:26.223854
515	la patata	ziemniak	17	word	2022-04-05 12:57:26.223854
516	la zanahoria	marchewka	17	word	2022-04-05 12:57:26.223854
517	el pepino	ogórek	17	word	2022-04-05 12:57:26.223854
518	el tomate	pomidor	17	word	2022-04-05 12:57:26.223854
519	la cebolla	cebula	17	word	2022-04-05 12:57:26.223854
520	el pimiento	papryka	17	word	2022-04-05 12:57:26.223854
521	la fruta	owoc	17	word	2022-04-05 12:57:26.223854
522	la manzana	jabłko	17	word	2022-04-05 12:57:26.223854
523	la pera	gruszka	17	word	2022-04-05 12:57:26.223854
524	la fresa	truskawka	17	word	2022-04-05 12:57:26.223854
525	la fresa del bosque	poziomka	17	word	2022-04-05 12:57:26.223854
526	la uva	winogrono	17	word	2022-04-05 12:57:26.223854
527	la naranja	pomarańcza	17	word	2022-04-05 12:57:26.223854
528	el limón	cytryna	17	word	2022-04-05 12:57:26.223854
529	el plátano	banan	17	word	2022-04-05 12:57:26.223854
530	el amigo	przyjaciel	18	word	2022-04-05 12:57:58.275763
531	querer	lubić, kochać (e/ie)	18	word	2022-04-05 12:57:58.275763
532	querido	kochany	18	word	2022-04-05 12:57:58.275763
533	amar	kochać	18	word	2022-04-05 12:57:58.275763
534	el amor	miłość	18	word	2022-04-05 12:57:58.275763
535	besar	całować	18	word	2022-04-05 12:57:58.275763
536	el beso	pocałunek	18	word	2022-04-05 12:57:58.275763
537	odiar	nienawidzić	18	word	2022-04-05 12:57:58.275763
538	el odio	nienawiść	18	word	2022-04-05 12:57:58.275763
539	alegrarse	cieszyć się	18	word	2022-04-05 12:57:58.275763
540	la alegría	radość	18	word	2022-04-05 12:57:58.275763
541	alegre	wesoły	18	word	2022-04-05 12:57:58.275763
542	feliz	szczęśliwy	18	word	2022-04-05 12:57:58.275763
543	infeliz	nieszczęśliwy	18	word	2022-04-05 12:57:58.275763
544	la broma	żart	18	word	2022-04-05 12:57:58.275763
545	reír	śmiać się (nr)	18	word	2022-04-05 12:57:58.275763
546	la risa	śmiech	18	word	2022-04-05 12:57:58.275763
547	llorar	płakać	18	word	2022-04-05 12:57:58.275763
548	triste	smutny	18	word	2022-04-05 12:57:58.275763
549	esperar	mieć nadzieję	18	word	2022-04-05 12:57:58.275763
550	la esperanza	nadzieja	18	word	2022-04-05 12:57:58.275763
551	el miedo	strach	18	word	2022-04-05 12:57:58.275763
552	horrible	straszny	18	word	2022-04-05 12:57:58.275763
553	el nombre	imię, nazwa	19	word	2022-04-05 12:59:02.686929
554	el apellido	nazwisko	19	word	2022-04-05 12:59:02.686929
555	la nacionalidad	narodowość	19	word	2022-04-05 12:59:02.686929
556	el sexo	płeć	19	word	2022-04-05 12:59:02.686929
557	nacer	urodzić się (c/zc)	19	word	2022-04-05 12:59:02.686929
558	el nacimiento	narodziny	19	word	2022-04-05 12:59:02.686929
559	el lugar	miejsce (l)	19	word	2022-04-05 12:59:02.686929
560	morir	umierać (o/ue)	19	word	2022-04-05 12:59:02.686929
561	la muerte	śmierć	19	word	2022-04-05 12:59:02.686929
562	la fecha	data	19	word	2022-04-05 12:59:02.686929
563	correcto	poprawny	19	word	2022-04-05 12:59:02.686929
564	falso	błędny	19	word	2022-04-05 12:59:02.686929
565	el documento	dokument	19	word	2022-04-05 12:59:02.686929
566	el formulario	formularz	19	word	2022-04-05 12:59:02.686929
567	necesario	konieczny	19	word	2022-04-05 12:59:02.686929
568	desgraciadamente	niestety	19	word	2022-04-05 12:59:02.686929
569	vivir	żyć	20	word	2022-04-05 13:00:11.408633
570	la vida	życie	20	word	2022-04-05 13:00:11.408633
571	sano	zdrowy	20	word	2022-04-05 13:00:11.408633
572	la salud	zdrowie	20	word	2022-04-05 13:00:11.408633
573	enfermo	chory	20	word	2022-04-05 13:00:11.408633
574	la enfermedad	choroba	20	word	2022-04-05 13:00:11.408633
575	romper	łamać	20	word	2022-04-05 13:00:11.408633
576	el médico	doktor	20	word	2022-04-05 13:00:11.408633
577	llamar	wołać, wzywać	20	word	2022-04-05 13:00:11.408633
578	el socorro	ratunek, pomoc	20	word	2022-04-05 13:00:11.408633
579	el hospital	szpital	20	word	2022-04-05 13:00:11.408633
580	la enfermera	pielęgniarka	20	word	2022-04-05 13:00:11.408633
581	ayudar	pomagać	20	word	2022-04-05 13:00:11.408633
582	la ayuda	pomoc	20	word	2022-04-05 13:00:11.408633
583	el dentista	dentysta	20	word	2022-04-05 13:00:11.408633
584	poder	móc (o/ue)	20	word	2022-04-05 13:00:11.408633
585	pasar	zdarzać się	20	word	2022-04-05 13:00:11.408633
586	bien	dobrze	20	word	2022-04-05 13:00:11.408633
587	mal	źle	20	word	2022-04-05 13:00:11.408633
588	sentir	czuć	20	word	2022-04-05 13:00:11.408633
589	doler	boleć (o/ue)	20	word	2022-04-05 13:00:11.408633
590	el dolor	ból	20	word	2022-04-05 13:00:11.408633
591	toser	kaszleć	20	word	2022-04-05 13:00:11.408633
592	la tos	kaszel	20	word	2022-04-05 13:00:11.408633
593	el catarro	katar	20	word	2022-04-05 13:00:11.408633
594	la fiebre	gorączka	20	word	2022-04-05 13:00:11.408633
595	el termómetro	termometr	20	word	2022-04-05 13:00:11.408633
596	la gripe	grypa	20	word	2022-04-05 13:00:11.408633
597	el medicamento	lekarstwo	20	word	2022-04-05 13:00:11.408633
598	la pastilla	tabletka	20	word	2022-04-05 13:00:11.408633
599	la aspirina	aspiryna	20	word	2022-04-05 13:00:11.408633
600	fumar	palić	20	word	2022-04-05 13:00:11.408633
601	el cigarrillo	papieros	20	word	2022-04-05 13:00:11.408633
602	el animal	zwierzę	21	word	2022-04-05 13:00:57.441064
603	el perro	pies	21	word	2022-04-05 13:00:57.441064
604	el gato	kot	21	word	2022-04-05 13:00:57.441064
605	la vaca	krowa	21	word	2022-04-05 13:00:57.441064
606	el toro	byk	21	word	2022-04-05 13:00:57.441064
607	el caballo	koń	21	word	2022-04-05 13:00:57.441064
608	la oveja	owca	21	word	2022-04-05 13:00:57.441064
609	el cerdo	świnia	21	word	2022-04-05 13:00:57.441064
610	el ratón	mysz	21	word	2022-04-05 13:00:57.441064
611	el pez	ryba	21	word	2022-04-05 13:00:57.441064
612	los peces	ryby	21	word	2022-04-05 13:00:57.441064
613	la rana	żaba	21	word	2022-04-05 13:00:57.441064
614	el pájaro	ptak	21	word	2022-04-05 13:00:57.441064
615	el papagayo	papuga	21	word	2022-04-05 13:00:57.441064
616	el pollo	kurczak	21	word	2022-04-05 13:00:57.441064
617	la pata	kaczka	21	word	2022-04-05 13:00:57.441064
618	el zorro	lis	21	word	2022-04-05 13:00:57.441064
619	el lobo	wilk	21	word	2022-04-05 13:00:57.441064
620	el oso	niedźwiedź	21	word	2022-04-05 13:00:57.441064
621	el zoológico	ogród zoologiczny	21	word	2022-04-05 13:00:57.441064
622	salvaje	dziki	21	word	2022-04-05 13:00:57.441064
623	el león	lew	21	word	2022-04-05 13:00:57.441064
624	el tigre	tygrys	21	word	2022-04-05 13:00:57.441064
625	el elefante	słoń	21	word	2022-04-05 13:00:57.441064
626	la jirafa	żyrafa	21	word	2022-04-05 13:00:57.441064
627	el cocodrilo	krokodyl	21	word	2022-04-05 13:00:57.441064
628	el mono	małpa	21	word	2022-04-05 13:00:57.441064
629	trabajar	pracować	22	word	2022-04-05 13:01:31.503793
630	el trabajo	praca	22	word	2022-04-05 13:01:31.503793
631	el trabajador	pracownik	22	word	2022-04-05 13:01:31.503793
632	la profesión	zawód	22	word	2022-04-05 13:01:31.503793
633	profesional	zawodowy	22	word	2022-04-05 13:01:31.503793
634	hacer	robić (1g)	22	word	2022-04-05 13:01:31.503793
635	la secretaría	sekretariat	22	word	2022-04-05 13:01:31.503793
636	la secretaria	sekretarka	22	word	2022-04-05 13:01:31.503793
637	la oficina	biuro	22	word	2022-04-05 13:01:31.503793
638	el jefe	szef	22	word	2022-04-05 13:01:31.503793
639	el director	dyrektor	22	word	2022-04-05 13:01:31.503793
640	el ingeniero	inżynier	22	word	2022-04-05 13:01:31.503793
641	ganar	zarabiać	22	word	2022-04-05 13:01:31.503793
642	cansado	zmęczony	22	word	2022-04-05 13:01:31.503793
643	la azafata	stewardesa	22	word	2022-04-05 13:01:31.503793
644	el camarero	kelner	22	word	2022-04-05 13:01:31.503793
645	el peluquero	fryzjer	22	word	2022-04-05 13:01:31.503793
646	el arquitecto	architekt	22	word	2022-04-05 13:01:31.503793
647	el bombero	strażak	22	word	2022-04-05 13:01:31.503793
648	el mecánico	mechanik	22	word	2022-04-05 13:01:31.503793
649	el abogado	adwokat	22	word	2022-04-05 13:01:31.503793
650	la tienda	sklep	23	word	2022-04-05 13:02:08.294458
651	el quiosco	kiosk	23	word	2022-04-05 13:02:08.294458
652	la farmacia	apteka	23	word	2022-04-05 13:02:08.294458
653	la librería	księgarnia	23	word	2022-04-05 13:02:08.294458
654	la carnicería	sklep mięsny	23	word	2022-04-05 13:02:08.294458
655	la pescadería	sklep rybny	23	word	2022-04-05 13:02:08.294458
656	la panadería	piekarnia	23	word	2022-04-05 13:02:08.294458
657	el panadero	piekarz	23	word	2022-04-05 13:02:08.294458
658	la pastelería	cukiernia	23	word	2022-04-05 13:02:08.294458
659	el pastelero	cukiernik	23	word	2022-04-05 13:02:08.294458
660	la zapatería	zakład szewski	23	word	2022-04-05 13:02:08.294458
661	el zapatero	szewc	23	word	2022-04-05 13:02:08.294458
662	la relojería	zakład zegarmistrzowski	23	word	2022-04-05 13:02:08.294458
663	el relojero	zegarmistrz	23	word	2022-04-05 13:02:08.294458
664	abrir	otwierać	23	word	2022-04-05 13:02:08.294458
665	cerrar	zamykać (e/ie)	23	word	2022-04-05 13:02:08.294458
666	el mercado	targ	23	word	2022-04-05 13:02:08.294458
667	comprar	kupować	23	word	2022-04-05 13:02:08.294458
668	las compras	zakupy	23	word	2022-04-05 13:02:08.294458
669	vender	sprzedawać	23	word	2022-04-05 13:02:08.294458
670	el vendedor	sprzedawca	23	word	2022-04-05 13:02:08.294458
671	la caja	kasa	23	word	2022-04-05 13:02:08.294458
672	el cajero	kasjer	23	word	2022-04-05 13:02:08.294458
673	el dependiente	ekspedient	23	word	2022-04-05 13:02:08.294458
674	el cliente	klient	23	word	2022-04-05 13:02:08.294458
675	necesitar	potrzebować	23	word	2022-04-05 13:02:08.294458
676	querer	chcieć (e/ie)	23	word	2022-04-05 13:02:08.294458
677	cuál	który?	23	word	2022-04-05 13:02:08.294458
678	mirar	patrzeć	23	word	2022-04-05 13:02:08.294458
679	gustar	podobać się	23	word	2022-04-05 13:02:08.294458
680	mucho	bardzo	23	word	2022-04-05 13:02:08.294458
681	muy	bardzo (przed przymiotnikiem i przysłówkiem)	23	word	2022-04-05 13:02:08.294458
682	contento	zadowolony	23	word	2022-04-05 13:02:08.294458
683	descontento	niezadowolony	23	word	2022-04-05 13:02:08.294458
684	cambiar	zmieniać, zamieniać	23	word	2022-04-05 13:02:08.294458
685	el cambio	zmiana, zamiana	23	word	2022-04-05 13:02:08.294458
686	la higiene	higiena	24	word	2022-04-05 13:03:54.360375
687	la pasta de dientes	pasta do zębów	24	word	2022-04-05 13:03:54.360375
688	lavar	myć	24	word	2022-04-05 13:03:54.360375
689	el jabón	mydło	24	word	2022-04-05 13:03:54.360375
690	el champú	szampon	24	word	2022-04-05 13:03:54.360375
691	peinar	czesać	24	word	2022-04-05 13:03:54.360375
692	el peine	grzebień	24	word	2022-04-05 13:03:54.360375
693	la crema	krem	24	word	2022-04-05 13:03:54.360375
694	afeitarse	golić się	24	word	2022-04-05 13:03:54.360375
695	la ducha	prysznic	24	word	2022-04-05 13:03:54.360375
696	la toalla	ręcznik	24	word	2022-04-05 13:03:54.360375
697	mojado	mokry	24	word	2022-04-05 13:03:54.360375
698	seco	suchy	24	word	2022-04-05 13:03:54.360375
699	acostarse	kłaść się (o/ue)	24	word	2022-04-05 13:03:54.360375
700	dormir	spać (o/ue)	24	word	2022-04-05 13:03:54.360375
701	despertar	budzić (e/ie)	24	word	2022-04-05 13:03:54.360375
702	levantarse	wstawać	24	word	2022-04-05 13:03:54.360375
703	la siesta	sjesta	24	word	2022-04-05 13:03:54.360375
704	ir	iść, jechać (nr)	25	word	2022-04-05 13:05:01.453952
705	donde	gdzie	25	word	2022-04-05 13:05:01.453952
706	dónde	gdzie?	25	word	2022-04-05 13:05:01.453952
707	adónde	dokąd?	25	word	2022-04-05 13:05:01.453952
708	a	do (położenie)	25	word	2022-04-05 13:05:01.453952
709	aquí	tutaj	25	word	2022-04-05 13:05:01.453952
710	allí	tam	25	word	2022-04-05 13:05:01.453952
711	cercano	bliski	25	word	2022-04-05 13:05:01.453952
712	cerca	blisko	25	word	2022-04-05 13:05:01.453952
713	lejano	daleki	25	word	2022-04-05 13:05:01.453952
714	lejos	daleko	25	word	2022-04-05 13:05:01.453952
715	detrás	za	25	word	2022-04-05 13:05:01.453952
716	delante	przed (d) (odnośnie położenia)	25	word	2022-04-05 13:05:01.453952
717	al lado	obok	25	word	2022-04-05 13:05:01.453952
718	enfrente	naprzeciwko	25	word	2022-04-05 13:05:01.453952
719	entre	pomiędzy	25	word	2022-04-05 13:05:01.453952
720	el centro	środek	25	word	2022-04-05 13:05:01.453952
721	derecho	prawy	25	word	2022-04-05 13:05:01.453952
722	izquierdo	lewy	25	word	2022-04-05 13:05:01.453952
723	entrar	wchodzić	25	word	2022-04-05 13:05:01.453952
724	la entrada	wejście	25	word	2022-04-05 13:05:01.453952
725	salir	wychodzić (1g)	25	word	2022-04-05 13:05:01.453952
726	la salida	wyjście	25	word	2022-04-05 13:05:01.453952
727	venir	przychodzić (1g)	25	word	2022-04-05 13:05:01.453952
728	en	w	25	word	2022-04-05 13:05:01.453952
729	quedar	zostawać	25	word	2022-04-05 13:05:01.453952
730	sentar	sadzać (e/ie)	25	word	2022-04-05 13:05:01.453952
731	estar sentado	siedzieć	25	word	2022-04-05 13:05:01.453952
732	sentarse	siadać (e/ie)	25	word	2022-04-05 13:05:01.453952
733	poner	kłaść (1g)	25	word	2022-04-05 13:05:01.453952
734	encima	nad, na	25	word	2022-04-05 13:05:01.453952
735	debajo	pod	25	word	2022-04-05 13:05:01.453952
736	meter	wkładać	25	word	2022-04-05 13:05:01.453952
737	sacar	wyjmować, wyciągać	25	word	2022-04-05 13:05:01.453952
738	colgar	wieszać, wisieć (o/ue)	25	word	2022-04-05 13:05:01.453952
739	por	przez	25	word	2022-04-05 13:05:01.453952
740	subir	wspinać się, wchodzić	25	word	2022-04-05 13:05:01.453952
741	bajar	schodzić	25	word	2022-04-05 13:05:01.453952
742	arriba	w górze, na górze	25	word	2022-04-05 13:05:01.453952
743	abajo	na dole	25	word	2022-04-05 13:05:01.453952
744	el este	wschód (kierunek)	25	word	2022-04-05 13:05:01.453952
745	el oeste	zachód (kierunek)	25	word	2022-04-05 13:05:01.453952
746	el norte	północ (kierunek)	25	word	2022-04-05 13:05:01.453952
747	el sur	południe (kierunek)	25	word	2022-04-05 13:05:01.453952
748	conducir	kierować (c/zc)	26	word	2022-04-05 13:05:54.494618
749	el conductor	kierowca	26	word	2022-04-05 13:05:54.494618
750	despacio	wolno	26	word	2022-04-05 13:05:54.494618
751	deprisa	szybko	26	word	2022-04-05 13:05:54.494618
752	el coche	samochód	26	word	2022-04-05 13:05:54.494618
753	la motocicleta	motocykl	26	word	2022-04-05 13:05:54.494618
754	lento	wolny, powolny	26	word	2022-04-05 13:05:54.494618
755	rápido	szybki	26	word	2022-04-05 13:05:54.494618
756	la carretera	szosa	26	word	2022-04-05 13:05:54.494618
757	a pie	pieszo	26	word	2022-04-05 13:05:54.494618
758	la estación	stacja, dworzec	26	word	2022-04-05 13:05:54.494618
759	el billete	bilet	26	word	2022-04-05 13:05:54.494618
760	el tren	pociąg	26	word	2022-04-05 13:05:54.494618
761	esperar	czekać	26	word	2022-04-05 13:05:54.494618
762	puntual	punktualny	26	word	2022-04-05 13:05:54.494618
763	el sitio	miejsce (s)	26	word	2022-04-05 13:05:54.494618
764	libre	wolny (o miejscu)	26	word	2022-04-05 13:05:54.494618
765	ocupado	zajęty (o miejscu)	26	word	2022-04-05 13:05:54.494618
766	atención	uwaga	26	word	2022-04-05 13:05:54.494618
767	el barco	statek	26	word	2022-04-05 13:05:54.494618
768	el puerto	port	26	word	2022-04-05 13:05:54.494618
769	volar	latać (o/ue)	26	word	2022-04-05 13:05:54.494618
770	el vuelo	lot	26	word	2022-04-05 13:05:54.494618
771	el avión	samolot	26	word	2022-04-05 13:05:54.494618
772	el piloto	pilot	26	word	2022-04-05 13:05:54.494618
773	el aeropuerto	lotnisko	26	word	2022-04-05 13:05:54.494618
774	el país	kraj	27	word	2022-04-05 13:07:01.540044
775	ser de	pochodzić z (nr)	27	word	2022-04-05 13:07:01.540044
776	hablar	mówić	27	word	2022-04-05 13:07:01.540044
777	saber	znać, umieć (nr)	27	word	2022-04-05 13:07:01.540044
778	traducir	tłumaczyć (c/zc)	27	word	2022-04-05 13:07:01.540044
779	la traducción	tłumaczenie	27	word	2022-04-05 13:07:01.540044
780	el traductor	tłumacz	27	word	2022-04-05 13:07:01.540044
781	el español	hiszpański (język)	27	word	2022-04-05 13:07:01.540044
782	el polaco	polski (język)	27	word	2022-04-05 13:07:01.540044
783	el inglés	angielski (język)	27	word	2022-04-05 13:07:01.540044
784	el alemán	niemiecki (język)	27	word	2022-04-05 13:07:01.540044
785	el francés	francuski (język)	27	word	2022-04-05 13:07:01.540044
786	el italiano	włoski (język)	27	word	2022-04-05 13:07:01.540044
787	el ruso	rosyjski (język)	27	word	2022-04-05 13:07:01.540044
788	el diccionario	słownik	27	word	2022-04-05 13:07:01.540044
789	la lengua	język, mowa	27	word	2022-04-05 13:07:01.540044
790	la lengua materna	język ojczysty	27	word	2022-04-05 13:07:01.540044
791	el idioma	język	27	word	2022-04-05 13:07:01.540044
792	el extranjero	zagranica	27	word	2022-04-05 13:07:01.540044
793	el extranjero	cudzoziemiec	27	word	2022-04-05 13:07:01.540044
794	extranjero	zagraniczny	27	word	2022-04-05 13:07:01.540044
795	Polonia	Polska	27	word	2022-04-05 13:07:01.540044
796	España	Hiszpania	27	word	2022-04-05 13:07:01.540044
797	Inglaterra	Anglia	27	word	2022-04-05 13:07:01.540044
798	Alemania	Niemcy	27	word	2022-04-05 13:07:01.540044
799	Francia	Francja	27	word	2022-04-05 13:07:01.540044
800	Italia	Włochy	27	word	2022-04-05 13:07:01.540044
801	Rusia	Rosja	27	word	2022-04-05 13:07:01.540044
802	los Estados Unidos de América	Stany Zjednoczone Ameryki (USA)	27	word	2022-04-05 13:07:01.540044
803	el estado	państwo	28	word	2022-04-05 13:07:30.426962
804	estatal	państwowy	28	word	2022-04-05 13:07:30.426962
805	la libertad	wolność	28	word	2022-04-05 13:07:30.426962
806	libre	wolny	28	word	2022-04-05 13:07:30.426962
807	el presidente	prezydent	28	word	2022-04-05 13:07:30.426962
808	el parlamento	parlament	28	word	2022-04-05 13:07:30.426962
809	el ministro	minister	28	word	2022-04-05 13:07:30.426962
810	gobernar	rządzić (e/ie)	28	word	2022-04-05 13:07:30.426962
811	el gobierno	rząd	28	word	2022-04-05 13:07:30.426962
812	la nación	naród	28	word	2022-04-05 13:07:30.426962
813	nacional	narodowy	28	word	2022-04-05 13:07:30.426962
814	internacional	międzynarodowy	28	word	2022-04-05 13:07:30.426962
815	la política	polityka	28	word	2022-04-05 13:07:30.426962
816	el político	polityk	28	word	2022-04-05 13:07:30.426962
817	político	polityczny	28	word	2022-04-05 13:07:30.426962
818	el partido	partia	28	word	2022-04-05 13:07:30.426962
819	organizar	organizować	28	word	2022-04-05 13:07:30.426962
820	la organización	organizacja	28	word	2022-04-05 13:07:30.426962
821	robar	kraść	28	word	2022-04-05 13:07:30.426962
822	el robo	kradzież	28	word	2022-04-05 13:07:30.426962
823	el ladrón	złodziej	28	word	2022-04-05 13:07:30.426962
824	la policía	policja	28	word	2022-04-05 13:07:30.426962
825	el policía	policjant	28	word	2022-04-05 13:07:30.426962
826	el tribunal	sąd	28	word	2022-04-05 13:07:30.426962
827	el juez	sędzia	28	word	2022-04-05 13:07:30.426962
828	el derecho	prawo	28	word	2022-04-05 13:07:30.426962
829	el problema	problem	28	word	2022-04-05 13:07:30.426962
830	el alcohol	alkohol	28	word	2022-04-05 13:07:30.426962
831	el tabaco	tytoń	28	word	2022-04-05 13:07:30.426962
832	la droga	narkotyk	28	word	2022-04-05 13:07:30.426962
833	la situación	sytuacja	28	word	2022-04-05 13:07:30.426962
834	la pobreza	bieda	28	word	2022-04-05 13:07:30.426962
835	pobre	biedny	28	word	2022-04-05 13:07:30.426962
836	la riqueza	bogactwo	28	word	2022-04-05 13:07:30.426962
837	rico	bogaty	28	word	2022-04-05 13:07:30.426962
838	el deporte	sport	29	word	2022-04-05 13:08:13.39932
839	el deportista	sportowiec	29	word	2022-04-05 13:08:13.39932
840	la pelota	piłka (p)	29	word	2022-04-05 13:08:13.39932
841	echar	rzucać	29	word	2022-04-05 13:08:13.39932
842	coger	łapać, chwytać	29	word	2022-04-05 13:08:13.39932
843	jugar	grać (u/ue)	29	word	2022-04-05 13:08:13.39932
844	el juego	gra	29	word	2022-04-05 13:08:13.39932
845	el jugador	gracz	29	word	2022-04-05 13:08:13.39932
846	el fútbol	piłka nożna (gra)	29	word	2022-04-05 13:08:13.39932
847	el futbolista	piłkarz	29	word	2022-04-05 13:08:13.39932
848	el balón	piłka (b)	29	word	2022-04-05 13:08:13.39932
849	el voleibol	siatkówka	29	word	2022-04-05 13:08:13.39932
850	el baloncesto	koszykówka	29	word	2022-04-05 13:08:13.39932
851	el equipo	drużyna	29	word	2022-04-05 13:08:13.39932
852	el partido	mecz	29	word	2022-04-05 13:08:13.39932
853	el estadio	stadion	29	word	2022-04-05 13:08:13.39932
854	correr	biegać	29	word	2022-04-05 13:08:13.39932
855	el ejercicio	ćwiczenie	29	word	2022-04-05 13:08:13.39932
856	débil	słaby	29	word	2022-04-05 13:08:13.39932
857	la fuerza	siła	29	word	2022-04-05 13:08:13.39932
858	fuerte	silny	29	word	2022-04-05 13:08:13.39932
859	esquiar	jeździć na nartach	29	word	2022-04-05 13:08:13.39932
860	el esquí	narta, narciarstwo	29	word	2022-04-05 13:08:13.39932
861	el tenis	tenis	29	word	2022-04-05 13:08:13.39932
862	el tenista	tenisista	29	word	2022-04-05 13:08:13.39932
863	nadar	pływać	29	word	2022-04-05 13:08:13.39932
864	la natación	pływanie	29	word	2022-04-05 13:08:13.39932
865	la piscina	basen	29	word	2022-04-05 13:08:13.39932
866	la bicicleta	rower	29	word	2022-04-05 13:08:13.39932
867	interesarse	interesować się	29	word	2022-04-05 13:08:13.39932
868	interesante	interesujący	29	word	2022-04-05 13:08:13.39932
1607	la obra	sztuka	51	word	2022-04-05 20:29:41.874472
869	pasear	spacerować	29	word	2022-04-05 13:08:13.39932
870	el paseo	spacer	29	word	2022-04-05 13:08:13.39932
871	aburrirse	nudzić się	29	word	2022-04-05 13:08:13.39932
872	aburrido	nudny, znudzony	29	word	2022-04-05 13:08:13.39932
873	la carta	karta (c )	29	word	2022-04-05 13:08:13.39932
874	el ajedrez	szachy	29	word	2022-04-05 13:08:13.39932
875	gustar	lubić	29	word	2022-04-05 13:08:13.39932
876	la discoteca	dyskoteka	29	word	2022-04-05 13:08:13.39932
877	divertirse	bawić się, oddawać się rozrywce	29	word	2022-04-05 13:08:13.39932
878	la diversión	rozrywka	29	word	2022-04-05 13:08:13.39932
879	la religión	religia	30	word	2022-04-05 13:09:16.197338
880	religioso	religijny	30	word	2022-04-05 13:09:16.197338
881	creer	wierzyć	30	word	2022-04-05 13:09:16.197338
882	Dios	Bóg	30	word	2022-04-05 13:09:16.197338
883	la fiesta	święto	30	word	2022-04-05 13:09:16.197338
884	la Navidad	Boże Narodzenie	30	word	2022-04-05 13:09:16.197338
885	decorar	ozdabiać, dekorować	30	word	2022-04-05 13:09:16.197338
886	Papa Noel	Święty Mikołaj	30	word	2022-04-05 13:09:16.197338
887	la Nochebuena	Wigilia	30	word	2022-04-05 13:09:16.197338
888	el villancico	kolęda	30	word	2022-04-05 13:09:16.197338
889	el ángel	anioł	30	word	2022-04-05 13:09:16.197338
890	el diablo	diabeł	30	word	2022-04-05 13:09:16.197338
891	el belén	szopka	30	word	2022-04-05 13:09:16.197338
892	la iglesia	kościół	30	word	2022-04-05 13:09:16.197338
893	la cruz	krzyż	30	word	2022-04-05 13:09:16.197338
894	la misa	msza	30	word	2022-04-05 13:09:16.197338
895	el cura	ksiądz	30	word	2022-04-05 13:09:16.197338
896	el rey	król	30	word	2022-04-05 13:09:16.197338
897	la reina	królowa	30	word	2022-04-05 13:09:16.197338
898	la Pascua	Wielkanoc	30	word	2022-04-05 13:09:16.197338
899	la cultura	kultura	31	word	2022-04-05 13:09:49.740845
900	cultural	kulturalny	31	word	2022-04-05 13:09:49.740845
901	el museo	muzeum	31	word	2022-04-05 13:09:49.740845
902	el cuadro	obraz	31	word	2022-04-05 13:09:49.740845
903	pintar	malować	31	word	2022-04-05 13:09:49.740845
904	el pintor	malarz	31	word	2022-04-05 13:09:49.740845
905	el arte	sztuka	31	word	2022-04-05 13:09:49.740845
906	dibujar	rysować	31	word	2022-04-05 13:09:49.740845
907	el dibujo	rysunek	31	word	2022-04-05 13:09:49.740845
908	la fotografía	zdjęcie, fotografia	31	word	2022-04-05 13:09:49.740845
909	la cámara	kamera	31	word	2022-04-05 13:09:49.740845
910	el cine	kino	31	word	2022-04-05 13:09:49.740845
911	la película	film	31	word	2022-04-05 13:09:49.740845
912	el teatro	teatr	31	word	2022-04-05 13:09:49.740845
913	el actor	aktor	31	word	2022-04-05 13:09:49.740845
914	la actriz	aktorka	31	word	2022-04-05 13:09:49.740845
915	bailar	tańczyć	31	word	2022-04-05 13:09:49.740845
916	el baile	taniec	31	word	2022-04-05 13:09:49.740845
917	el bailarín	tancerz	31	word	2022-04-05 13:09:49.740845
918	la bailarina	tancerka	31	word	2022-04-05 13:09:49.740845
919	la música	muzyka	31	word	2022-04-05 13:09:49.740845
920	el músico	muzyk	31	word	2022-04-05 13:09:49.740845
921	clásico	klasyczny	31	word	2022-04-05 13:09:49.740845
922	escuchar	słuchać	31	word	2022-04-05 13:09:49.740845
923	tocar	grać na instrumencie	31	word	2022-04-05 13:09:49.740845
924	el piano	pianino	31	word	2022-04-05 13:09:49.740845
925	la guitarra	gitara	31	word	2022-04-05 13:09:49.740845
926	el grupo	grupa	31	word	2022-04-05 13:09:49.740845
927	el concierto	koncert	31	word	2022-04-05 13:09:49.740845
928	cantar	śpiewać	31	word	2022-04-05 13:09:49.740845
929	la canción	piosenka	31	word	2022-04-05 13:09:49.740845
930	la cantante	piosenkarka	31	word	2022-04-05 13:09:49.740845
931	el cantante	piosenkarz	31	word	2022-04-05 13:09:49.740845
932	la maravilla	cud	31	word	2022-04-05 13:09:49.740845
933	maravilloso	cudowny	31	word	2022-04-05 13:09:49.740845
934	la madera	drewno	32	word	2022-04-05 13:12:07.624276
935	el cristal	szkło	32	word	2022-04-05 13:12:07.624276
936	el metal	metal	32	word	2022-04-05 13:12:07.624276
937	la plata	srebro	32	word	2022-04-05 13:12:07.624276
938	el oro	złoto	32	word	2022-04-05 13:12:07.624276
939	el cuero	skóra (materiał)	32	word	2022-04-05 13:12:07.624276
940	el papel	papier	32	word	2022-04-05 13:12:07.624276
941	el plástico	plastik	32	word	2022-04-05 13:12:07.624276
942	duro	twardy	32	word	2022-04-05 13:12:07.624276
943	blando	miękki	32	word	2022-04-05 13:12:07.624276
944	las finanzas	finanse	33	word	2022-04-05 13:13:05.998821
945	el dinero	pieniądze	33	word	2022-04-05 13:13:05.998821
946	tener	mieć (nr)	33	word	2022-04-05 13:13:05.998821
947	costar	kosztować (o/ue)	33	word	2022-04-05 13:13:05.998821
948	el precio	cena	33	word	2022-04-05 13:13:05.998821
949	barato	tani	33	word	2022-04-05 13:13:05.998821
950	caro	drogi	33	word	2022-04-05 13:13:05.998821
951	bastante	dosyć	33	word	2022-04-05 13:13:05.998821
952	gratuito	darmowy, bezpłatny	33	word	2022-04-05 13:13:05.998821
953	la cuenta	rachunek	33	word	2022-04-05 13:13:05.998821
954	pagar	płacić	33	word	2022-04-05 13:13:05.998821
955	gastar	wydawać	33	word	2022-04-05 13:13:05.998821
956	el gasto	wydatek	33	word	2022-04-05 13:13:05.998821
957	casi	prawie	33	word	2022-04-05 13:13:05.998821
958	prestar	pożyczać	33	word	2022-04-05 13:13:05.998821
959	ahorrar	oszczędzać	33	word	2022-04-05 13:13:05.998821
960	los ahorros	oszczędności	33	word	2022-04-05 13:13:05.998821
961	el banco	bank	33	word	2022-04-05 13:13:05.998821
962	bancario	bankowy	33	word	2022-04-05 13:13:05.998821
963	cambiar dinero	wymieniać pieniądze	33	word	2022-04-05 13:13:05.998821
964	la industria	przemysł	33	word	2022-04-05 13:13:05.998821
965	industrial	przemysłowy	33	word	2022-04-05 13:13:05.998821
966	fabricar	produkować	33	word	2022-04-05 13:13:05.998821
967	la fábrica	fabryka	33	word	2022-04-05 13:13:05.998821
968	la empresa	firma, przedsiębiorstwo	33	word	2022-04-05 13:13:05.998821
969	el empresario	przedsiębiorca	33	word	2022-04-05 13:13:05.998821
970	privado	prywatny	33	word	2022-04-05 13:13:05.998821
971	público	publiczny	33	word	2022-04-05 13:13:05.998821
972	el negocio	biznes, interes	33	word	2022-04-05 13:13:05.998821
973	comerciar	handlować	33	word	2022-04-05 13:13:05.998821
974	el comercio	handel	33	word	2022-04-05 13:13:05.998821
975	la guerra	wojna	34	word	2022-04-05 13:13:37.612712
976	la paz	pokój	34	word	2022-04-05 13:13:37.612712
977	el soldado	żołnierz	34	word	2022-04-05 13:13:37.612712
978	disparar	strzelać	34	word	2022-04-05 13:13:37.612712
979	el disparo	strzał	34	word	2022-04-05 13:13:37.612712
980	la pistola	pistolet	34	word	2022-04-05 13:13:37.612712
981	la bomba	bomba	34	word	2022-04-05 13:13:37.612712
982	el fuego	ogień	34	word	2022-04-05 13:13:37.612712
983	la catástrofe	katastrofa	34	word	2022-04-05 13:13:37.612712
984	el peligro	niebezpieczeństwo	34	word	2022-04-05 13:13:37.612712
985	peligroso	niebezpieczny	34	word	2022-04-05 13:13:37.612712
986	la seguridad	bezpieczeństwo	34	word	2022-04-05 13:13:37.612712
987	seguro	bezpieczny	34	word	2022-04-05 13:13:37.612712
988	el cuidado	ostrożność	34	word	2022-04-05 13:13:37.612712
989	el silencio	cisza	35	word	2022-04-05 13:14:34.389124
990	bajo	cichy	35	word	2022-04-05 13:14:34.389124
991	el ruido	hałas	35	word	2022-04-05 13:14:34.389124
992	alto	głośny	35	word	2022-04-05 13:14:34.389124
993	llamar	dzwonić, pukać do drzwi	35	word	2022-04-05 13:14:34.389124
994	la forma	kształt	35	word	2022-04-05 13:14:34.389124
995	el cuadrado	kwadrat	35	word	2022-04-05 13:14:34.389124
996	cuadrado	kwadratowy	35	word	2022-04-05 13:14:34.389124
997	el círculo	koło	35	word	2022-04-05 13:14:34.389124
998	redondo	okrągły	35	word	2022-04-05 13:14:34.389124
999	recto	prosty	35	word	2022-04-05 13:14:34.389124
1000	la cosa	rzecz	35	word	2022-04-05 13:14:34.389124
1001	el lápiz	ołówek	35	word	2022-04-05 13:14:34.389124
1002	el bolígrafo	długopis	35	word	2022-04-05 13:14:34.389124
1003	la pluma	pióro	35	word	2022-04-05 13:14:34.389124
1004	borrar	zmazywać, ścierać	35	word	2022-04-05 13:14:34.389124
1005	la regla	linijka	35	word	2022-04-05 13:14:34.389124
1006	la cartera	portfel	35	word	2022-04-05 13:14:34.389124
1007	dejar	zostawiać	35	word	2022-04-05 13:14:34.389124
1008	perder	gubić (e/ie)	35	word	2022-04-05 13:14:34.389124
1009	buscar	szukać	35	word	2022-04-05 13:14:34.389124
1010	encontrar	znajdować (o/ue)	35	word	2022-04-05 13:14:34.389124
1011	traer	przynosić (1g)	35	word	2022-04-05 13:14:34.389124
1012	nuevo	nowy	35	word	2022-04-05 13:14:34.389124
1013	viejo	stary	35	word	2022-04-05 13:14:34.389124
1014	jugar	bawić się, grać (u/ue)	35	word	2022-04-05 13:14:34.389124
1015	el juguete	zabawka	35	word	2022-04-05 13:14:34.389124
1016	la muñeca	lalka	35	word	2022-04-05 13:14:34.389124
1017	con	z	35	word	2022-04-05 13:14:34.389124
1018	sin	bez	35	word	2022-04-05 13:14:34.389124
1019	contar	opowiadać (o/ue)	35	word	2022-04-05 13:14:34.389124
1020	el cuento	opowiadanie	35	word	2022-04-05 13:14:34.389124
1021	raro	dziwny, niespotykany	35	word	2022-04-05 13:14:34.389124
1022	la bruja	czarownica	35	word	2022-04-05 13:14:34.389124
1023	el príncipe	królewicz	35	word	2022-04-05 13:14:34.389124
1024	la princesa	królewna	35	word	2022-04-05 13:14:34.389124
1025	la fantasía	fantazja	35	word	2022-04-05 13:14:34.389124
1026	fantástico	fantastyczny	35	word	2022-04-05 13:14:34.389124
1027	comenzar	zaczynać, rozpoczynać (e/ie)	36	word	2022-04-05 20:15:27.464727
1028	el comienzo	początek	36	word	2022-04-05 20:15:27.464727
1029	acabar	kończyć, skończyć	36	word	2022-04-05 20:15:27.464727
1030	el fin	koniec	36	word	2022-04-05 20:15:27.464727
1031	final	końcowy	36	word	2022-04-05 20:15:27.464727
1032	por fin	w końcu, wreszcie	36	word	2022-04-05 20:15:27.464727
1033	durar	trwać	36	word	2022-04-05 20:15:27.464727
1034	la duración	czas trwania	36	word	2022-04-05 20:15:27.464727
1035	continuar	kontynuować	36	word	2022-04-05 20:15:27.464727
1036	la continuación	kontynuacja	36	word	2022-04-05 20:15:27.464727
1037	la medianoche	północ	36	word	2022-04-05 20:15:27.464727
1038	a medianoche	o północy	36	word	2022-04-05 20:15:27.464727
1039	anoche	ubiegłej nocy, ubiegłego wieczoru	36	word	2022-04-05 20:15:27.464727
1040	la madrugada	świt	36	word	2022-04-05 20:15:27.464727
1041	desde	od (punktu w czasie)	36	word	2022-04-05 20:15:27.464727
1042	hace	od, przed (przedział czasu)	36	word	2022-04-05 20:15:27.464727
1043	desde hace	od (przedział czasu)	36	word	2022-04-05 20:15:27.464727
1044	desde hace tiempo	od dawna	36	word	2022-04-05 20:15:27.464727
1045	desde hace poco	od niedawna	36	word	2022-04-05 20:15:27.464727
1046	aún	jeszcze	36	word	2022-04-05 20:15:27.464727
1047	durante	podczas	36	word	2022-04-05 20:15:27.464727
1048	mientras que	podczas gdy	36	word	2022-04-05 20:15:27.464727
1049	hacia	około	36	word	2022-04-05 20:15:27.464727
1050	sólo	dopiero	36	word	2022-04-05 20:15:27.464727
1051	en	za (w odniesieniu do czasu)	36	word	2022-04-05 20:15:27.464727
1052	de repente	nagle	36	word	2022-04-05 20:15:27.464727
1053	inmediatamente	natychmiast	36	word	2022-04-05 20:15:27.464727
1054	pronto	szybko, prędko	36	word	2022-04-05 20:15:27.464727
1055	general	ogólny, główny	36	word	2022-04-05 20:15:27.464727
1056	generalmente	ogólnie, głównie	36	word	2022-04-05 20:15:27.464727
1057	frecuente	częsty	36	word	2022-04-05 20:15:27.464727
1058	frecuentemente	często	36	word	2022-04-05 20:15:27.464727
1059	regular	regularny	36	word	2022-04-05 20:15:27.464727
1060	regularmente	regularnie	36	word	2022-04-05 20:15:27.464727
1061	irregular	nieregularny	36	word	2022-04-05 20:15:27.464727
1062	irregularmente	nieregularnie	36	word	2022-04-05 20:15:27.464727
1063	raramente	rzadko	36	word	2022-04-05 20:15:27.464727
1064	una vez	raz	36	word	2022-04-05 20:15:27.464727
1065	de vez en cuando	od czasu do czasu	36	word	2022-04-05 20:15:27.464727
1066	el futuro	przyszłość	36	word	2022-04-05 20:15:27.464727
1067	futuro	przyszły	36	word	2022-04-05 20:15:27.464727
1068	el presente	teraźniejszość	36	word	2022-04-05 20:15:27.464727
1069	presente	obecny	36	word	2022-04-05 20:15:27.464727
1070	el pasado	przeszłość	36	word	2022-04-05 20:15:27.464727
1071	pasado	przeszły, miniony	36	word	2022-04-05 20:15:27.464727
1072	próximo	następny, przyszły	36	word	2022-04-05 20:15:27.464727
1073	próximamente	w najbliższym czasie	36	word	2022-04-05 20:15:27.464727
1074	último	ostatni	36	word	2022-04-05 20:15:27.464727
1075	últimamente	ostatnio	36	word	2022-04-05 20:15:27.464727
1076	un rato	chwila	36	word	2022-04-05 20:15:27.464727
1077	la prisa	pośpiech	36	word	2022-04-05 20:15:27.464727
1078	calcular	liczyć, rachować	37	word	2022-04-05 20:16:42.145777
1079	más	plus	37	word	2022-04-05 20:16:42.145777
1080	menos	minus	37	word	2022-04-05 20:16:42.145777
1081	por	razy	37	word	2022-04-05 20:16:42.145777
1608	el papel	rola	51	word	2022-04-05 20:29:41.874472
1082	dividir	dzielić	37	word	2022-04-05 20:16:42.145777
1083	aproximadamente	w przybliżeniu	37	word	2022-04-05 20:16:42.145777
1084	primero	pierwszy	37	word	2022-04-05 20:16:42.145777
1085	segundo	drugi	37	word	2022-04-05 20:16:42.145777
1086	tercero	trzeci	37	word	2022-04-05 20:16:42.145777
1087	cuarto	czwarty	37	word	2022-04-05 20:16:42.145777
1088	quinto	piąty	37	word	2022-04-05 20:16:42.145777
1089	sexto	szósty	37	word	2022-04-05 20:16:42.145777
1090	séptimo	siódmy	37	word	2022-04-05 20:16:42.145777
1091	octavo	ósmy	37	word	2022-04-05 20:16:42.145777
1092	noveno	dziewiąty	37	word	2022-04-05 20:16:42.145777
1093	décimo	dziesiąty	37	word	2022-04-05 20:16:42.145777
1094	numeroso	liczny	37	word	2022-04-05 20:16:42.145777
1095	la caja	pudełko, skrzynka	38	word	2022-04-05 20:17:26.435162
1096	la caja fuerte	sejf	38	word	2022-04-05 20:17:26.435162
1097	el saco	worek	38	word	2022-04-05 20:17:26.435162
1098	el saco de dormir	śpiwór	38	word	2022-04-05 20:17:26.435162
1099	el tarro	słoik	38	word	2022-04-05 20:17:26.435162
1100	el tamaño	wielkość, rozmiar	38	word	2022-04-05 20:17:26.435162
1101	la docena	tuzin	38	word	2022-04-05 20:17:26.435162
1102	medir	mierzyć (e/i)	38	word	2022-04-05 20:17:26.435162
1103	pesar	ważyć	38	word	2022-04-05 20:17:26.435162
1104	grueso	gruby (też o osobie)	38	word	2022-04-05 20:17:26.435162
1105	fino	cienki	38	word	2022-04-05 20:17:26.435162
1106	solo	jedyny (s)	38	word	2022-04-05 20:17:26.435162
1107	sobrar	pozostawać, być w nadmiarze	38	word	2022-04-05 20:17:26.435162
1108	entero	cały, pełny	38	word	2022-04-05 20:17:26.435162
1109	partir	dzielić, rozdzielać	38	word	2022-04-05 20:17:26.435162
1110	la parte	część	38	word	2022-04-05 20:17:26.435162
1111	en parte	częściowo	38	word	2022-04-05 20:17:26.435162
1112	por	na	38	word	2022-04-05 20:17:26.435162
1113	tanto	tym...	38	word	2022-04-05 20:17:26.435162
1114	llenar	napełniać	38	word	2022-04-05 20:17:26.435162
1115	contener	zawierać (nr)	38	word	2022-04-05 20:17:26.435162
1116	el contenido	zawartość	38	word	2022-04-05 20:17:26.435162
1117	un montón	duża ilość, mnóstwo	38	word	2022-04-05 20:17:26.435162
1118	el par	para	38	word	2022-04-05 20:17:26.435162
1119	bastante	dość, dosyć	38	word	2022-04-05 20:17:26.435162
1120	casi	prawie	38	word	2022-04-05 20:17:26.435162
1121	la localidad	miejscowość	39	word	2022-04-05 20:18:57.689274
1122	habitar	mieszkać, zamieszkiwać	39	word	2022-04-05 20:18:57.689274
1123	el habitante	mieszkaniec	39	word	2022-04-05 20:18:57.689274
1124	el alcalde	burmistrz	39	word	2022-04-05 20:18:57.689274
1125	el ayuntamiento	ratusz	39	word	2022-04-05 20:18:57.689274
1126	la avenida	aleja	39	word	2022-04-05 20:18:57.689274
1127	el peatón	pieszy	39	word	2022-04-05 20:18:57.689274
1128	peatonal	dla pieszych	39	word	2022-04-05 20:18:57.689274
1129	la zona	strefa, obszar	39	word	2022-04-05 20:18:57.689274
1130	pasar	przechodzić, przejeżdżać	39	word	2022-04-05 20:18:57.689274
1131	cruzarse	krzyżować się	39	word	2022-04-05 20:18:57.689274
1132	el cruce	skrzyżowanie	39	word	2022-04-05 20:18:57.689274
1133	el semáforo	sygnalizacja świetlna	39	word	2022-04-05 20:18:57.689274
1134	el tráfico	ruch (uliczny), komunikacja	39	word	2022-04-05 20:18:57.689274
1135	subir	wsiadać	39	word	2022-04-05 20:18:57.689274
1136	bajar	wysiadać	39	word	2022-04-05 20:18:57.689274
1137	el bloque	blok	39	word	2022-04-05 20:18:57.689274
1138	el rascacielos	drapacz chmur	39	word	2022-04-05 20:18:57.689274
1139	los rascacielos	drapacze chmur	39	word	2022-04-05 20:18:57.689274
1140	las afueras	przedmieście	39	word	2022-04-05 20:18:57.689274
1141	la ventaja	zaleta, korzyść	39	word	2022-04-05 20:18:57.689274
1142	ventajoso	korzystny	39	word	2022-04-05 20:18:57.689274
1143	la desventaja	wada, niekorzyść	39	word	2022-04-05 20:18:57.689274
1144	desventajoso	niekorzystny	39	word	2022-04-05 20:18:57.689274
1145	la aldea	wieś, wioska	39	word	2022-04-05 20:18:57.689274
1146	el aldeano	wieśniak (a)	39	word	2022-04-05 20:18:57.689274
1147	aldeano	wiejski	39	word	2022-04-05 20:18:57.689274
1148	rural	wiejski, rolniczy	39	word	2022-04-05 20:18:57.689274
1149	criar	hodować (zwierzęta)	39	word	2022-04-05 20:18:57.689274
1150	la cría	hodowla (zwierząt)	39	word	2022-04-05 20:18:57.689274
1151	el criador	hodowca (zwierząt)	39	word	2022-04-05 20:18:57.689274
1152	cultivar	uprawiać, hodować (rośliny)	39	word	2022-04-05 20:18:57.689274
1153	el cultivo	uprawa, hodowla (roślin)	39	word	2022-04-05 20:18:57.689274
1154	la agricultura	rolnictwo	39	word	2022-04-05 20:18:57.689274
1155	el agricultor	rolnik	39	word	2022-04-05 20:18:57.689274
1156	el molino	młyn	39	word	2022-04-05 20:18:57.689274
1157	el molinero	młynarz	39	word	2022-04-05 20:18:57.689274
1158	el molino de viento	wiatrak	39	word	2022-04-05 20:18:57.689274
1159	la granja	gospodarstwo rolne, farma	39	word	2022-04-05 20:18:57.689274
1160	la cabaña	chata	39	word	2022-04-05 20:18:57.689274
1161	el pozo	studnia	39	word	2022-04-05 20:18:57.689274
1162	la senda	ścieżka	39	word	2022-04-05 20:18:57.689274
1163	coger	zrywać	39	word	2022-04-05 20:18:57.689274
1164	pescar	łowić ryby	39	word	2022-04-05 20:18:57.689274
1165	el pescador	rybak	39	word	2022-04-05 20:18:57.689274
1166	el bocadillo	kanapka	40	word	2022-04-05 20:20:05.703194
1167	la margarina	margaryna	40	word	2022-04-05 20:20:05.703194
1168	el chorizo	kiełbasa (hiszpańska)	40	word	2022-04-05 20:20:05.703194
1169	la confitura	konfitura	40	word	2022-04-05 20:20:05.703194
1170	revolver	mieszać (o/ue)	40	word	2022-04-05 20:20:05.703194
1171	huevos revueltos	jajecznica	40	word	2022-04-05 20:20:05.703194
1172	la harina	mąka	40	word	2022-04-05 20:20:05.703194
1173	oler	pachnieć, wąchać (o/ue)	40	word	2022-04-05 20:20:05.703194
1174	el olor	zapach	40	word	2022-04-05 20:20:05.703194
1175	huele	powąchaj	40	word	2022-04-05 20:20:05.703194
1176	probar	próbować, kosztować (o/ue)	40	word	2022-04-05 20:20:05.703194
1177	prueba	skosztuj	40	word	2022-04-05 20:20:05.703194
1178	el apetito	apetyt	40	word	2022-04-05 20:20:05.703194
1179	apetitoso	apetyczny	40	word	2022-04-05 20:20:05.703194
1180	almorzar	jeść obiad (o/ue)	40	word	2022-04-05 20:20:05.703194
1181	el almuerzo	obiad	40	word	2022-04-05 20:20:05.703194
1182	servir	obsługiwać, podawać (do stołu) (e/i)	40	word	2022-04-05 20:20:05.703194
1183	el servicio	obsługa	40	word	2022-04-05 20:20:05.703194
1184	el autoservicio	samoobsługa	40	word	2022-04-05 20:20:05.703194
1185	el camarero	kelner	40	word	2022-04-05 20:20:05.703194
2203	matar	zabijać	67	word	2022-04-05 20:40:15.098647
1186	la carta	karta dań	40	word	2022-04-05 20:20:05.703194
1187	servir	serwować, nakładać	40	word	2022-04-05 20:20:05.703194
1188	la especialidad	specjalność, specjał	40	word	2022-04-05 20:20:05.703194
1189	el plato	potrawa, danie	40	word	2022-04-05 20:20:05.703194
1190	frito	smażony	40	word	2022-04-05 20:20:05.703194
1191	el calamar	kalmar	40	word	2022-04-05 20:20:05.703194
1192	la gamba	krewetka	40	word	2022-04-05 20:20:05.703194
1193	el sabor	smak	40	word	2022-04-05 20:20:05.703194
1194	sabroso	smaczny	40	word	2022-04-05 20:20:05.703194
1195	la carne de ternera	cielęcina	40	word	2022-04-05 20:20:05.703194
1196	la carne de cordero	mięso jagnięce	40	word	2022-04-05 20:20:05.703194
1197	la chuleta	kotlet	40	word	2022-04-05 20:20:05.703194
1198	crudo	surowy	40	word	2022-04-05 20:20:05.703194
1199	el filete	filet	40	word	2022-04-05 20:20:05.703194
1200	asar	piec, smażyć	40	word	2022-04-05 20:20:05.703194
1201	el asado	pieczeń	40	word	2022-04-05 20:20:05.703194
1202	la grasa	tłuszcz	40	word	2022-04-05 20:20:05.703194
1203	graso	tłusty	40	word	2022-04-05 20:20:05.703194
1204	magro	chudy	40	word	2022-04-05 20:20:05.703194
1205	picante	ostry	40	word	2022-04-05 20:20:05.703194
1206	suave	łagodny	40	word	2022-04-05 20:20:05.703194
1207	el postre	deser	40	word	2022-04-05 20:20:05.703194
1208	la macedonia	sałatka owocowa	40	word	2022-04-05 20:20:05.703194
1209	el flan	budyń	40	word	2022-04-05 20:20:05.703194
1210	merendar	jeść podwieczorek (e/ie)	40	word	2022-04-05 20:20:05.703194
1211	la merienda	podwieczorek	40	word	2022-04-05 20:20:05.703194
1212	los dulces	słodycze	40	word	2022-04-05 20:20:05.703194
1213	el bombón	czekoladka, pralinka	40	word	2022-04-05 20:20:05.703194
1214	la caja con bombones	bombonierka	40	word	2022-04-05 20:20:05.703194
1215	amargo	gorzki	40	word	2022-04-05 20:20:05.703194
1216	delicioso	pyszny, wyśmienity	40	word	2022-04-05 20:20:05.703194
1217	lleno	najedzony, syty	40	word	2022-04-05 20:20:05.703194
1218	la propina	napiwek	40	word	2022-04-05 20:20:05.703194
1219	la bodega	winiarnia	40	word	2022-04-05 20:20:05.703194
1220	alcohólico	alkoholowy	40	word	2022-04-05 20:20:05.703194
1221	refrescar	orzeźwiać	40	word	2022-04-05 20:20:05.703194
1222	el refresco	napój orzeźwiający	40	word	2022-04-05 20:20:05.703194
1223	refrescante	orzeźwiający	40	word	2022-04-05 20:20:05.703194
1224	el vodka	wódka	40	word	2022-04-05 20:20:05.703194
1225	el champán	szampan	40	word	2022-04-05 20:20:05.703194
1228	el empleo	zatrudnienie	41	word	2022-04-05 20:21:24.199495
1229	el empleado	pracownik	41	word	2022-04-05 20:21:24.199495
1230	el obrero	robotnik	41	word	2022-04-05 20:21:24.199495
1231	obrero	robotniczy	41	word	2022-04-05 20:21:24.199495
1232	el especialista	specjalista	41	word	2022-04-05 20:21:24.199495
1233	el puesto	posada	41	word	2022-04-05 20:21:24.199495
1234	el contrato	umowa	41	word	2022-04-05 20:21:24.199495
1235	la condición	warunek	41	word	2022-04-05 20:21:24.199495
1236	la experiencia	doświadczenie	41	word	2022-04-05 20:21:24.199495
1237	experimentado	doświadczony	41	word	2022-04-05 20:21:24.199495
1238	el deber	obowiązek	41	word	2022-04-05 20:21:24.199495
1239	la responsabilidad	odpowiedzialność	41	word	2022-04-05 20:21:24.199495
1240	responsable	odpowiedzialny	41	word	2022-04-05 20:21:24.199495
1241	la tarea	zadanie	41	word	2022-04-05 20:21:24.199495
1242	capaz	zdolny, gotowy	41	word	2022-04-05 20:21:24.199495
1243	la capacidad	zdolność, gotowość	41	word	2022-04-05 20:21:24.199495
1244	el sueldo	pensja	41	word	2022-04-05 20:21:24.199495
1245	la carrera	kariera	41	word	2022-04-05 20:21:24.199495
1246	dirigir	kierować	41	word	2022-04-05 20:21:24.199495
1247	la dirección	kierownictwo	41	word	2022-04-05 20:21:24.199495
1248	el departamento	dział	41	word	2022-04-05 20:21:24.199495
1249	el equipo	zespół	41	word	2022-04-05 20:21:24.199495
1250	reunirse	spotykać się, gromadzić się	41	word	2022-04-05 20:21:24.199495
1251	la reunión	spotkanie, zgromadzenie	41	word	2022-04-05 20:21:24.199495
1252	participar	uczestniczyć	41	word	2022-04-05 20:21:24.199495
1253	la participación	uczestnictwo	41	word	2022-04-05 20:21:24.199495
1254	el participante	uczestnik	41	word	2022-04-05 20:21:24.199495
1255	el proyecto	projekt	41	word	2022-04-05 20:21:24.199495
1256	concentrarse	koncentrować się	41	word	2022-04-05 20:21:24.199495
1257	la concentración	koncentracja	41	word	2022-04-05 20:21:24.199495
1258	el detalle	szczegół	41	word	2022-04-05 20:21:24.199495
1259	ocuparse	zajmować się	41	word	2022-04-05 20:21:24.199495
1260	la ocupación	zajęcie	41	word	2022-04-05 20:21:24.199495
1261	dejar	zostawiać, porzucać	41	word	2022-04-05 20:21:24.199495
1262	despedir	zwalniać (z pracy) (e/i)	41	word	2022-04-05 20:21:24.199495
1263	el despido	zwolnienie	41	word	2022-04-05 20:21:24.199495
1264	el desempleo	bezrobocie	41	word	2022-04-05 20:21:24.199495
1265	el desempleado	bezrobotny (osoba)	41	word	2022-04-05 20:21:24.199495
1266	desempleado	bezrobotny	41	word	2022-04-05 20:21:24.199495
1267	regar	podlewać (e/ie)	42	word	2022-04-05 20:21:59.587533
1268	el tulipán	tulipan	42	word	2022-04-05 20:21:59.587533
1269	el girasol	słonecznik	42	word	2022-04-05 20:21:59.587533
1270	el cactus	kaktus, kaktusy	42	word	2022-04-05 20:21:59.587533
1271	la hoja	liść	42	word	2022-04-05 20:21:59.587533
1272	el roble	dąb	42	word	2022-04-05 20:21:59.587533
1273	el pino	sosna	42	word	2022-04-05 20:21:59.587533
1274	la seta	grzyb	42	word	2022-04-05 20:21:59.587533
1275	la nuez	orzech (owoc), orzech włoski	42	word	2022-04-05 20:21:59.587533
1276	madurar	dojrzewać	42	word	2022-04-05 20:21:59.587533
1277	maduro	dojrzały	42	word	2022-04-05 20:21:59.587533
1278	la ciruela	śliwka	42	word	2022-04-05 20:21:59.587533
1279	la cereza	czereśnia	42	word	2022-04-05 20:21:59.587533
1280	la frambuesa	malina	42	word	2022-04-05 20:21:59.587533
1281	el melocotón	brzoskwinia	42	word	2022-04-05 20:21:59.587533
1282	el melón	melon	42	word	2022-04-05 20:21:59.587533
1283	la piña	ananas	42	word	2022-04-05 20:21:59.587533
1284	la aceituna	oliwka	42	word	2022-04-05 20:21:59.587533
1285	el ajo	czosnek	42	word	2022-04-05 20:21:59.587533
1286	la remolacha	burak	42	word	2022-04-05 20:21:59.587533
1287	la lechuga	sałata	42	word	2022-04-05 20:21:59.587533
1288	la col	kapusta	42	word	2022-04-05 20:21:59.587533
1289	la col china	kapusta pekińska	42	word	2022-04-05 20:21:59.587533
1290	el champiñón	pieczarka	42	word	2022-04-05 20:21:59.587533
1291	las judías	fasola	42	word	2022-04-05 20:21:59.587533
1292	los guisantes	groch	42	word	2022-04-05 20:21:59.587533
1293	el maíz	kukurydza	42	word	2022-04-05 20:21:59.587533
1294	el petróleo	ropa naftowa	43	word	2022-04-05 20:22:54.471205
1295	la corriente	prąd	43	word	2022-04-05 20:22:54.471205
1296	el material	materiał	43	word	2022-04-05 20:22:54.471205
1297	la sustancia	substancja	43	word	2022-04-05 20:22:54.471205
1298	el polvo	proszek	43	word	2022-04-05 20:22:54.471205
1299	la mina	kopalnia	43	word	2022-04-05 20:22:54.471205
1300	el minero	górnik	43	word	2022-04-05 20:22:54.471205
1301	el carbón	węgiel	43	word	2022-04-05 20:22:54.471205
1302	el diamante	diament	43	word	2022-04-05 20:22:54.471205
1303	la perla	perła	43	word	2022-04-05 20:22:54.471205
1304	artificial	sztuczny	43	word	2022-04-05 20:22:54.471205
1305	auténtico	prawdziwy	43	word	2022-04-05 20:22:54.471205
1306	la lana	wełna	43	word	2022-04-05 20:22:54.471205
1307	el algodón	bawełna	43	word	2022-04-05 20:22:54.471205
1308	la seda	jedwab	43	word	2022-04-05 20:22:54.471205
1309	natural	naturalny	43	word	2022-04-05 20:22:54.471205
1310	la porcelana	porcelana	43	word	2022-04-05 20:22:54.471205
1311	frágil	kruchy, delikatny	43	word	2022-04-05 20:22:54.471205
1312	fuerte	mocny, solidny	43	word	2022-04-05 20:22:54.471205
1313	componerse	składać się (1g)	43	word	2022-04-05 20:22:54.471205
1314	el cariño	czułość, serdeczność	44	word	2022-04-05 20:23:29.133525
1315	cariñoso	czuły, serdeczny	44	word	2022-04-05 20:23:29.133525
1316	la amistad	przyjaźń	44	word	2022-04-05 20:23:29.133525
1317	amistoso	przyjacielski	44	word	2022-04-05 20:23:29.133525
1318	respetar	respektować, szanować	44	word	2022-04-05 20:23:29.133525
1319	el respeto	respekt, szacunek	44	word	2022-04-05 20:23:29.133525
1320	el novio	narzeczony, chłopak	44	word	2022-04-05 20:23:29.133525
1321	la novia	narzeczona, dziewczyna	44	word	2022-04-05 20:23:29.133525
1322	enamorarse	zakochać się	44	word	2022-04-05 20:23:29.133525
1323	enamorado	zakochany	44	word	2022-04-05 20:23:29.133525
1324	confiar	ufać	44	word	2022-04-05 20:23:29.133525
1325	la confianza	zaufanie	44	word	2022-04-05 20:23:29.133525
1326	desconfiar	nie ufać	44	word	2022-04-05 20:23:29.133525
1327	la desconfianza	nieufność	44	word	2022-04-05 20:23:29.133525
1328	los celos	zazdrość	44	word	2022-04-05 20:23:29.133525
1329	celoso	zazdrosny	44	word	2022-04-05 20:23:29.133525
1330	echar de menos	tęsknić	44	word	2022-04-05 20:23:29.133525
1331	la lágrima	łza	44	word	2022-04-05 20:23:29.133525
1332	la soledad	samotność	44	word	2022-04-05 20:23:29.133525
1333	solo	sam, samotny	44	word	2022-04-05 20:23:29.133525
1334	el sentimiento	uczucie	44	word	2022-04-05 20:23:29.133525
1335	sentimental	uczuciowy	44	word	2022-04-05 20:23:29.133525
1336	el orgullo	duma	44	word	2022-04-05 20:23:29.133525
1337	orgulloso	dumny	44	word	2022-04-05 20:23:29.133525
1338	ofender	obrażać, znieważać	44	word	2022-04-05 20:23:29.133525
1339	la ofensa	obraza, zniewaga	44	word	2022-04-05 20:23:29.133525
1340	ofensivo	obraźliwy	44	word	2022-04-05 20:23:29.133525
1341	enfadarse	złościć się, gniewać się	44	word	2022-04-05 20:23:29.133525
1342	el enfado	złość, gniew	44	word	2022-04-05 20:23:29.133525
1343	estresarse	stresować się	44	word	2022-04-05 20:23:29.133525
1344	el estrés	stres	44	word	2022-04-05 20:23:29.133525
1345	estresante	stresujący	44	word	2022-04-05 20:23:29.133525
1346	terrible	straszny	44	word	2022-04-05 20:23:29.133525
1347	asustar	przestraszyć	44	word	2022-04-05 20:23:29.133525
1348	asustarse	przestraszyć się	44	word	2022-04-05 20:23:29.133525
1349	sorprender	zaskakiwać, dziwić	44	word	2022-04-05 20:23:29.133525
1350	la sorpresa	zaskoczenie	44	word	2022-04-05 20:23:29.133525
1351	raro	dziwny	44	word	2022-04-05 20:23:29.133525
1352	preocuparse	niepokoić się, martwić się	44	word	2022-04-05 20:23:29.133525
1353	la preocupación	zmartwienie	44	word	2022-04-05 20:23:29.133525
1354	la suerte	szczęście	44	word	2022-04-05 20:23:29.133525
1355	la mala suerte	pech	44	word	2022-04-05 20:23:29.133525
1356	la ilusión	złudna nadzieja, iluzja	44	word	2022-04-05 20:23:29.133525
1357	las ganas	ochota	44	word	2022-04-05 20:23:29.133525
1358	el humor	nastrój, humor	44	word	2022-04-05 20:23:29.133525
1359	el chiste	dowcip	44	word	2022-04-05 20:23:29.133525
1360	chistoso	dowcipny	44	word	2022-04-05 20:23:29.133525
1361	el cordero	jagnię	45	word	2022-04-05 20:24:21.415385
1362	el ternero	cielę	45	word	2022-04-05 20:24:21.415385
1363	la cabra	koza	45	word	2022-04-05 20:24:21.415385
1364	el burro	osioł	45	word	2022-04-05 20:24:21.415385
1365	el conejo	królik	45	word	2022-04-05 20:24:21.415385
1366	el gallo	kogut	45	word	2022-04-05 20:24:21.415385
1367	la gallina	kura	45	word	2022-04-05 20:24:21.415385
1368	el pato	kaczor	45	word	2022-04-05 20:24:21.415385
1369	la pata	kaczka	45	word	2022-04-05 20:24:21.415385
1370	el ganso	gęś	45	word	2022-04-05 20:24:21.415385
1371	el pájaro	ptak (potrafiący latać)	45	word	2022-04-05 20:24:21.415385
1372	la paloma	gołąb	45	word	2022-04-05 20:24:21.415385
1373	el águila	orzeł (rodzaj żeński)	45	word	2022-04-05 20:24:21.415385
1374	el nido	gniazdo	45	word	2022-04-05 20:24:21.415385
1375	el insecto	owad	45	word	2022-04-05 20:24:21.415385
1376	la abeja	pszczoła	45	word	2022-04-05 20:24:21.415385
1377	la mosca	mucha	45	word	2022-04-05 20:24:21.415385
1378	la mariposa	motyl	45	word	2022-04-05 20:24:21.415385
1379	la araña	pająk	45	word	2022-04-05 20:24:21.415385
1380	la rata	szczur	45	word	2022-04-05 20:24:21.415385
1381	el caracol	ślimak	45	word	2022-04-05 20:24:21.415385
1382	el bacalao	dorsz	45	word	2022-04-05 20:24:21.415385
1383	el atún	tuńczyk	45	word	2022-04-05 20:24:21.415385
1384	el delfín	delfin	45	word	2022-04-05 20:24:21.415385
1385	el cangrejo	rak	45	word	2022-04-05 20:24:21.415385
1386	la serpiente	wąż	45	word	2022-04-05 20:24:21.415385
1387	el canguro	kangur	45	word	2022-04-05 20:24:21.415385
1388	el camello	wielbłąd	45	word	2022-04-05 20:24:21.415385
1389	cazar	polować	45	word	2022-04-05 20:24:21.415385
1390	la caza	polowanie	45	word	2022-04-05 20:24:21.415385
1391	el cazador	myśliwy	45	word	2022-04-05 20:24:21.415385
1392	el veterinario	weterynarz	45	word	2022-04-05 20:24:21.415385
1393	el apartamento	mieszkanie (zwykle dwupokojowe)	46	word	2022-04-05 20:25:23.973659
1394	interior	wewnętrzny	46	word	2022-04-05 20:25:23.973659
1395	la ropa interior	bielizna	46	word	2022-04-05 20:25:23.973659
1396	exterior	zewnętrzny	46	word	2022-04-05 20:25:23.973659
1397	precioso	śliczny, piękny	46	word	2022-04-05 20:25:23.973659
1398	mudarse	przeprowadzać się	46	word	2022-04-05 20:25:23.973659
1399	la mudanza	przeprowadzka	46	word	2022-04-05 20:25:23.973659
1400	alquilar	wynajmować	46	word	2022-04-05 20:25:23.973659
1401	el alquiler	czynsz	46	word	2022-04-05 20:25:23.973659
1402	el depósito	kaucja	46	word	2022-04-05 20:25:23.973659
1403	el portero	portier, dozorca	46	word	2022-04-05 20:25:23.973659
1404	la puerta	brama	46	word	2022-04-05 20:25:23.973659
1405	el garaje	garaż	46	word	2022-04-05 20:25:23.973659
1406	el sótano	piwnica	46	word	2022-04-05 20:25:23.973659
1407	el piso	piętro	46	word	2022-04-05 20:25:23.973659
1408	el recibidor	przedpokój	46	word	2022-04-05 20:25:23.973659
1409	la luz	światło	46	word	2022-04-05 20:25:23.973659
1410	la cortina	zasłona	46	word	2022-04-05 20:25:23.973659
1411	amueblar	meblować	46	word	2022-04-05 20:25:23.973659
1412	el mueble	mebel	46	word	2022-04-05 20:25:23.973659
1413	el despacho	gabinet	46	word	2022-04-05 20:25:23.973659
1414	el escritorio	biurko	46	word	2022-04-05 20:25:23.973659
1415	la cómoda	komoda	46	word	2022-04-05 20:25:23.973659
1416	el cajón	szuflada	46	word	2022-04-05 20:25:23.973659
1417	el lavabo	umywalka	46	word	2022-04-05 20:25:23.973659
1418	amplio	obszerny, przestronny	46	word	2022-04-05 20:25:23.973659
1419	la terraza	taras	46	word	2022-04-05 20:25:23.973659
1420	el jarrón	wazon	46	word	2022-04-05 20:25:23.973659
1421	el ama de casa	gospodyni domowa (rodzaj żeński)	46	word	2022-04-05 20:25:23.973659
1422	diario	codzienny	46	word	2022-04-05 20:25:23.973659
1423	diariamente	codziennie	46	word	2022-04-05 20:25:23.973659
1424	la costumbre	przyzwyczajenie	46	word	2022-04-05 20:25:23.973659
1425	la limpieza	czystość, czyszczenie	46	word	2022-04-05 20:25:23.973659
1426	el polvo	kurz	46	word	2022-04-05 20:25:23.973659
1427	polvoriento	zakurzony	46	word	2022-04-05 20:25:23.973659
1428	la aspiradora	odkurzacz	46	word	2022-04-05 20:25:23.973659
1429	el cubo	wiadro	46	word	2022-04-05 20:25:23.973659
1430	arreglar	posprzątać	46	word	2022-04-05 20:25:23.973659
1431	el arreglo	porządek	46	word	2022-04-05 20:25:23.973659
1432	fregar	zmywać (e/ie)	46	word	2022-04-05 20:25:23.973659
1433	la taza	kubek	46	word	2022-04-05 20:25:23.973659
1434	hervir	gotować się, wrzeć (e/ie)	46	word	2022-04-05 20:25:23.973659
1435	el hervidor	czajnik	46	word	2022-04-05 20:25:23.973659
1436	cubrir	przykrywać	46	word	2022-04-05 20:25:23.973659
1437	la cesta	kosz, koszyk	46	word	2022-04-05 20:25:23.973659
1438	la tetera	czajnik do herbaty	46	word	2022-04-05 20:25:23.973659
1439	la cafetera	ekspres do kawy	46	word	2022-04-05 20:25:23.973659
1440	el frigorífico	lodówka	46	word	2022-04-05 20:25:23.973659
1441	la cocina	kuchenka	46	word	2022-04-05 20:25:23.973659
1442	el horno	piekarnik	46	word	2022-04-05 20:25:23.973659
1443	la servilleta	serwetka	46	word	2022-04-05 20:25:23.973659
1444	la mancha	plama	46	word	2022-04-05 20:25:23.973659
1445	manchado	poplamiony	46	word	2022-04-05 20:25:23.973659
1446	la lavandería	pralnia	46	word	2022-04-05 20:25:23.973659
1447	el detergente	detergent, środek czyszczący	46	word	2022-04-05 20:25:23.973659
1448	secar	suszyć	46	word	2022-04-05 20:25:23.973659
1449	el secador	suszarka (do włosów)	46	word	2022-04-05 20:25:23.973659
1450	la secadora	suszarka (do ubrań)	46	word	2022-04-05 20:25:23.973659
1451	planchar	prasować	46	word	2022-04-05 20:25:23.973659
1452	la plancha	żelazko	46	word	2022-04-05 20:25:23.973659
1453	comportarse	zachowywać się	47	word	2022-04-05 20:26:07.776925
1454	el comportamiento	zachowanie	47	word	2022-04-05 20:26:07.776925
1455	la personalidad	osobowość	47	word	2022-04-05 20:26:07.776925
1456	el rasgo	cecha	47	word	2022-04-05 20:26:07.776925
1457	travieso	niegrzeczny, psotny	47	word	2022-04-05 20:26:07.776925
1458	delicado	delikatny	47	word	2022-04-05 20:26:07.776925
1459	poco delicado	niedelikatny	47	word	2022-04-05 20:26:07.776925
1460	modesto	skromny	47	word	2022-04-05 20:26:07.776925
1461	la modestia	skromność	47	word	2022-04-05 20:26:07.776925
1462	ambicioso	ambitny	47	word	2022-04-05 20:26:07.776925
1463	la ambición	ambicja	47	word	2022-04-05 20:26:07.776925
1464	trabajador	pracowity	47	word	2022-04-05 20:26:07.776925
1465	perezoso	leniwy	47	word	2022-04-05 20:26:07.776925
1466	la pereza	lenistwo	47	word	2022-04-05 20:26:07.776925
1467	obstinado	uparty	47	word	2022-04-05 20:26:07.776925
1468	egoísta	egoistyczny	47	word	2022-04-05 20:26:07.776925
1469	el egoísta	egoista	47	word	2022-04-05 20:26:07.776925
1470	el egoísmo	egoizm	47	word	2022-04-05 20:26:07.776925
1471	valiente	odważny	47	word	2022-04-05 20:26:07.776925
1472	el valor	odwaga	47	word	2022-04-05 20:26:07.776925
1473	cobarde	tchórzliwy	47	word	2022-04-05 20:26:07.776925
1474	el cobarde	tchórz	47	word	2022-04-05 20:26:07.776925
1475	la cobardía	tchórzostwo	47	word	2022-04-05 20:26:07.776925
1476	loco	szalony	47	word	2022-04-05 20:26:07.776925
1477	el loco	szaleniec	47	word	2022-04-05 20:26:07.776925
1478	el sentido	poczucie	47	word	2022-04-05 20:26:07.776925
1479	severo	surowy, srogi	47	word	2022-04-05 20:26:07.776925
1480	honesto	uczciwy	47	word	2022-04-05 20:26:07.776925
1481	la honestidad	uczciwość	47	word	2022-04-05 20:26:07.776925
1482	sensible	wrażliwy	47	word	2022-04-05 20:26:07.776925
1483	la sensibilidad	wrażliwość	47	word	2022-04-05 20:26:07.776925
1484	benévolo	życzliwy	47	word	2022-04-05 20:26:07.776925
1485	la benevolencia	życzliwość	47	word	2022-04-05 20:26:07.776925
1486	sincero	szczery	47	word	2022-04-05 20:26:07.776925
1487	la sinceridad	szczerość	47	word	2022-04-05 20:26:07.776925
1488	curioso	ciekawy	47	word	2022-04-05 20:26:07.776925
1489	la curiosidad	ciekawość	47	word	2022-04-05 20:26:07.776925
1490	sociable	towarzyski	47	word	2022-04-05 20:26:07.776925
1491	insociable	nietowarzyski	47	word	2022-04-05 20:26:07.776925
1492	enérgico	energiczny	47	word	2022-04-05 20:26:07.776925
1493	la energía	energia	47	word	2022-04-05 20:26:07.776925
1494	activo	czynny, aktywny	47	word	2022-04-05 20:26:07.776925
1495	pasivo	bierny, pasywny	47	word	2022-04-05 20:26:07.776925
1496	el cabello	włosy (na głowie)	48	word	2022-04-05 20:27:23.539431
1497	la frente	czoło	48	word	2022-04-05 20:27:23.539431
1498	la mejilla	policzek	48	word	2022-04-05 20:27:23.539431
1499	el labio	warga	48	word	2022-04-05 20:27:23.539431
1500	el cuello	szyja	48	word	2022-04-05 20:27:23.539431
1501	el hombro	bark	48	word	2022-04-05 20:27:23.539431
1502	la espalda	plecy	48	word	2022-04-05 20:27:23.539431
1503	el hueso	kość	48	word	2022-04-05 20:27:23.539431
1504	el músculo	mięsień	48	word	2022-04-05 20:27:23.539431
1505	el nervio	nerw	48	word	2022-04-05 20:27:23.539431
1506	el cerebro	mózg	48	word	2022-04-05 20:27:23.539431
1507	el pulmón	płuco	48	word	2022-04-05 20:27:23.539431
1508	respirar	oddychać	48	word	2022-04-05 20:27:23.539431
1509	la respiración	oddychanie	48	word	2022-04-05 20:27:23.539431
1510	tocar	dotykać	48	word	2022-04-05 20:27:23.539431
1511	el pulgar	kciuk	48	word	2022-04-05 20:27:23.539431
1512	la uña	paznokieć	48	word	2022-04-05 20:27:23.539431
1513	el crédito	kredyt	49	word	2022-04-05 20:28:11.30031
1514	comprar a crédito	kupować na kredyt	49	word	2022-04-05 20:28:11.30031
1515	la tarjeta de crédito	karta kredytowa	49	word	2022-04-05 20:28:11.30031
1516	el efectivo	gotówka	49	word	2022-04-05 20:28:11.30031
1517	el autómata	automat	49	word	2022-04-05 20:28:11.30031
1518	automático	automatyczny	49	word	2022-04-05 20:28:11.30031
1519	el billete de banco	banknot	49	word	2022-04-05 20:28:11.30031
1520	la moneda	moneta	49	word	2022-04-05 20:28:11.30031
1521	la vuelta	reszta	49	word	2022-04-05 20:28:11.30031
1522	la cuenta	konto	49	word	2022-04-05 20:28:11.30031
1523	ingresar	wpłacać	49	word	2022-04-05 20:28:11.30031
1524	el ingreso	wpłata	49	word	2022-04-05 20:28:11.30031
1525	retirar	podejmować (pieniądze)	49	word	2022-04-05 20:28:11.30031
1526	el cheque	czek	49	word	2022-04-05 20:28:11.30031
1527	la factura	rachunek, faktura	49	word	2022-04-05 20:28:11.30031
1528	valer	kosztować, mieć wartość (1g)	49	word	2022-04-05 20:28:11.30031
1529	el valor	wartość	49	word	2022-04-05 20:28:11.30031
1530	valioso	wartościowy	49	word	2022-04-05 20:28:11.30031
1531	suficiente	wystarczający	49	word	2022-04-05 20:28:11.30031
1532	faltar	brakować	49	word	2022-04-05 20:28:11.30031
1533	la falta	brak	49	word	2022-04-05 20:28:11.30031
1534	deber	być dłużnym	49	word	2022-04-05 20:28:11.30031
1535	la deuda	dług	49	word	2022-04-05 20:28:11.30031
1536	devolver	oddawać, zwracać	49	word	2022-04-05 20:28:11.30031
1537	la devolución	oddanie, zwrot	49	word	2022-04-05 20:28:11.30031
1538	el riesgo	ryzyko	49	word	2022-04-05 20:28:11.30031
1539	la economía	gospodarka, ekonomia	49	word	2022-04-05 20:28:11.30031
1540	el economista	ekonomista	49	word	2022-04-05 20:28:11.30031
1541	económico	gospodarczy, ekonomiczny	49	word	2022-04-05 20:28:11.30031
1542	el mercado	rynek	49	word	2022-04-05 20:28:11.30031
1543	la propiedad	własność	49	word	2022-04-05 20:28:11.30031
1544	el propietario	właściciel	49	word	2022-04-05 20:28:11.30031
1545	propio	własny	49	word	2022-04-05 20:28:11.30031
1546	producir	produkować (c/zc)	49	word	2022-04-05 20:28:11.30031
1547	el producto	produkt	49	word	2022-04-05 20:28:11.30031
1548	la producción	produkcja	49	word	2022-04-05 20:28:11.30031
1549	desarrollar	rozwijać	49	word	2022-04-05 20:28:11.30031
1550	el desarrollo	rozwój	49	word	2022-04-05 20:28:11.30031
1551	subir	zwiększać, podnosić, rosnąć	49	word	2022-04-05 20:28:11.30031
1552	la subida	wzrost (cen)	49	word	2022-04-05 20:28:11.30031
1553	bajar	zmniejszać, obniżać	49	word	2022-04-05 20:28:11.30031
1554	la bajada	spadek	49	word	2022-04-05 20:28:11.30031
1555	la crisis	kryzys	49	word	2022-04-05 20:28:11.30031
1556	el impuesto	podatek	49	word	2022-04-05 20:28:11.30031
1557	exportar	eksportować	49	word	2022-04-05 20:28:11.30031
1558	la exportación	eksport	49	word	2022-04-05 20:28:11.30031
1559	el exportador	eksporter	49	word	2022-04-05 20:28:11.30031
1560	importar	importować	49	word	2022-04-05 20:28:11.30031
1561	la importación	import	49	word	2022-04-05 20:28:11.30031
1562	el importador	importer	49	word	2022-04-05 20:28:11.30031
1563	Europa	Europa	50	word	2022-04-05 20:29:09.055817
1564	el europeo	Europejczyk	50	word	2022-04-05 20:29:09.055817
1565	Suecia	Szwecja	50	word	2022-04-05 20:29:09.055817
1566	el sueco	Szwed	50	word	2022-04-05 20:29:09.055817
1567	Finlandia	Finlandia	50	word	2022-04-05 20:29:09.055817
1568	el finlandés	Fin	50	word	2022-04-05 20:29:09.055817
1569	Noruega	Norwegia	50	word	2022-04-05 20:29:09.055817
1570	el noruego	Norweg	50	word	2022-04-05 20:29:09.055817
1571	Suiza	Szwajcaria	50	word	2022-04-05 20:29:09.055817
1572	el suizo	Szwajcar	50	word	2022-04-05 20:29:09.055817
1573	Austria	Austria	50	word	2022-04-05 20:29:09.055817
1574	el austriaco	Austriak	50	word	2022-04-05 20:29:09.055817
1575	Hungría	Węgry	50	word	2022-04-05 20:29:09.055817
1576	el húngaro	Węgier	50	word	2022-04-05 20:29:09.055817
1577	Portugal	Portugalia	50	word	2022-04-05 20:29:09.055817
1578	el portugués	Portugalczyk	50	word	2022-04-05 20:29:09.055817
1579	la portuguesa	Portugalka	50	word	2022-04-05 20:29:09.055817
1580	Marruecos	Maroko	50	word	2022-04-05 20:29:09.055817
1581	el marroquí	Marokańczyk	50	word	2022-04-05 20:29:09.055817
1582	limitar	graniczyć	50	word	2022-04-05 20:29:09.055817
1583	América del Norte	Ameryka Północna	50	word	2022-04-05 20:29:09.055817
1584	Canadá	Kanada	50	word	2022-04-05 20:29:09.055817
1585	el canadiense	Kanadyjczyk	50	word	2022-04-05 20:29:09.055817
1586	Centroamérica	Ameryka Środkowa	50	word	2022-04-05 20:29:09.055817
1587	América del Sur	Ameryka Południowa	50	word	2022-04-05 20:29:09.055817
1588	Asia	Azja	50	word	2022-04-05 20:29:09.055817
1589	el asiático	Azjata	50	word	2022-04-05 20:29:09.055817
1590	Japón	Japonia	50	word	2022-04-05 20:29:09.055817
1591	el japonés	Japończyk	50	word	2022-04-05 20:29:09.055817
1592	la japonesa	Japonka	50	word	2022-04-05 20:29:09.055817
1593	China	Chiny	50	word	2022-04-05 20:29:09.055817
1594	el chino	Chińczyk	50	word	2022-04-05 20:29:09.055817
1595	África	Afryka	50	word	2022-04-05 20:29:09.055817
1596	el africano	Afrykanin	50	word	2022-04-05 20:29:09.055817
1597	Australia	Australia	50	word	2022-04-05 20:29:09.055817
1598	el australiano	Australijczyk	50	word	2022-04-05 20:29:09.055817
1599	la literatura	literatura	51	word	2022-04-05 20:29:41.874472
1600	el escritor	pisarz	51	word	2022-04-05 20:29:41.874472
1601	la novela	powieść	51	word	2022-04-05 20:29:41.874472
1602	la poesía	poezja	51	word	2022-04-05 20:29:41.874472
1603	el poeta	poeta	51	word	2022-04-05 20:29:41.874472
1604	el poema	wiersz	51	word	2022-04-05 20:29:41.874472
1605	el autor	autor	51	word	2022-04-05 20:29:41.874472
1606	el título	tytuł	51	word	2022-04-05 20:29:41.874472
1609	el espectáculo	przedstawienie, spektakl	51	word	2022-04-05 20:29:41.874472
1610	tener lugar	odbywać się (nr)	51	word	2022-04-05 20:29:41.874472
1611	espléndido	świetny, znakomity	51	word	2022-04-05 20:29:41.874472
1612	obtener	otrzymywać (nr)	51	word	2022-04-05 20:29:41.874472
1613	el público	publiczność	51	word	2022-04-05 20:29:41.874472
1614	la popularidad	popularność	51	word	2022-04-05 20:29:41.874472
1615	popular	popularny	51	word	2022-04-05 20:29:41.874472
1616	la ópera	opera	51	word	2022-04-05 20:29:41.874472
1617	el ballet	balet	51	word	2022-04-05 20:29:41.874472
1618	el festival	festiwal	51	word	2022-04-05 20:29:41.874472
1619	el instrumento	instrument	51	word	2022-04-05 20:29:41.874472
1620	el violín	skrzypce	51	word	2022-04-05 20:29:41.874472
1621	el carnaval	karnawał	51	word	2022-04-05 20:29:41.874472
1622	la feria	jarmark	51	word	2022-04-05 20:29:41.874472
1623	el artista	artysta	51	word	2022-04-05 20:29:41.874472
1624	artístico	artystyczny	51	word	2022-04-05 20:29:41.874472
1625	la pintura	malarstwo	51	word	2022-04-05 20:29:41.874472
1626	la escultura	rzeźba	51	word	2022-04-05 20:29:41.874472
1627	el escultor	rzeźbiarz	51	word	2022-04-05 20:29:41.874472
1628	la arquitectura	architektura	51	word	2022-04-05 20:29:41.874472
1629	arquitectónico	architektoniczny	51	word	2022-04-05 20:29:41.874472
1630	fotografiar	fotografować	51	word	2022-04-05 20:29:41.874472
1631	el fotógrafo	fotograf	51	word	2022-04-05 20:29:41.874472
1632	la galería	galeria	51	word	2022-04-05 20:29:41.874472
1633	exponer	wystawiać (1g)	51	word	2022-04-05 20:29:41.874472
1634	la exposición	wystawa	51	word	2022-04-05 20:29:41.874472
1635	el éxito	sukces, powodzenie	51	word	2022-04-05 20:29:41.874472
1636	el paquete	paczka	52	word	2022-04-05 20:30:23.757045
1637	el sobre	koperta	52	word	2022-04-05 20:30:23.757045
1638	el buzón	skrzynka na listy	52	word	2022-04-05 20:30:23.757045
1639	móvil	ruchomy	52	word	2022-04-05 20:30:23.757045
1640	el móvil	komórka (telefon)	52	word	2022-04-05 20:30:23.757045
1641	coger el teléfono	odbierać telefon	52	word	2022-04-05 20:30:23.757045
1642	colgar el teléfono	odkładać słuchawkę (o/ue)	52	word	2022-04-05 20:30:23.757045
1643	equivocarse	mylić się	52	word	2022-04-05 20:30:23.757045
1644	el recado	wiadomość (r )	52	word	2022-04-05 20:30:23.757045
1645	mandar	wysyłać, przekazywać	52	word	2022-04-05 20:30:23.757045
1646	el disco compacto	płyta kompaktowa	52	word	2022-04-05 20:30:23.757045
1647	la casete	kaseta	52	word	2022-04-05 20:30:23.757045
1648	encender	zapalać, włączać (e/ie)	52	word	2022-04-05 20:30:23.757045
1649	apagar	gasić, wyłączać	52	word	2022-04-05 20:30:23.757045
1650	comunicar	komunikować	52	word	2022-04-05 20:30:23.757045
1651	la comunicación	komunikacja	52	word	2022-04-05 20:30:23.757045
1652	los medios	media	52	word	2022-04-05 20:30:23.757045
1653	la prensa	prasa	52	word	2022-04-05 20:30:23.757045
1654	el periodismo	dziennikarstwo	52	word	2022-04-05 20:30:23.757045
1655	el periodista	dziennikarz	52	word	2022-04-05 20:30:23.757045
1656	el reportaje	reportaż	52	word	2022-04-05 20:30:23.757045
1657	el reportero	reporter	52	word	2022-04-05 20:30:23.757045
1658	el artículo	artykuł	52	word	2022-04-05 20:30:23.757045
1659	entrevistar	przeprowadzać wywiad	52	word	2022-04-05 20:30:23.757045
1660	la entrevista	wywiad	52	word	2022-04-05 20:30:23.757045
1661	el anuncio	ogłoszenie	52	word	2022-04-05 20:30:23.757045
1662	el anuncio comercial	reklama (a)	52	word	2022-04-05 20:30:23.757045
1663	la técnica	technika	52	word	2022-04-05 20:30:23.757045
1664	técnico	techniczny	52	word	2022-04-05 20:30:23.757045
1665	usar	używać	52	word	2022-04-05 20:30:23.757045
1666	el uso	używanie	52	word	2022-04-05 20:30:23.757045
1667	el usuario	użytkownik	52	word	2022-04-05 20:30:23.757045
1668	fotocopiar	kopiować	52	word	2022-04-05 20:30:23.757045
1669	la fotocopia	kopia	52	word	2022-04-05 20:30:23.757045
1670	la fotocopiadora	kopiarka	52	word	2022-04-05 20:30:23.757045
1671	imprimir	drukować	52	word	2022-04-05 20:30:23.757045
1672	la impresora	drukarka	52	word	2022-04-05 20:30:23.757045
1673	portátil	przenośny	52	word	2022-04-05 20:30:23.757045
1674	el portátil	laptop	52	word	2022-04-05 20:30:23.757045
1675	electrónico	elektroniczny	52	word	2022-04-05 20:30:23.757045
1676	la prenda de vestir	część garderoby	53	word	2022-04-05 20:31:03.973449
1677	la gorra	czapka z daszkiem	53	word	2022-04-05 20:31:03.973449
1678	la bufanda	szalik	53	word	2022-04-05 20:31:03.973449
1679	el guante	rękawiczka	53	word	2022-04-05 20:31:03.973449
1680	poner	wkładać, zakładać	53	word	2022-04-05 20:31:03.973449
1681	quitar	zdejmować	53	word	2022-04-05 20:31:03.973449
1682	desnudo	nagi	53	word	2022-04-05 20:31:03.973449
1683	el traje	garnitur	53	word	2022-04-05 20:31:03.973449
1684	la chaqueta	marynarka	53	word	2022-04-05 20:31:03.973449
1685	la corbata	krawat	53	word	2022-04-05 20:31:03.973449
1686	el cuadro	kratka (wzór)	53	word	2022-04-05 20:31:03.973449
1687	la raya	pasek (wzór)	53	word	2022-04-05 20:31:03.973449
1688	estampado	wzorzysty, we wzory	53	word	2022-04-05 20:31:03.973449
1689	el pijama	piżama	53	word	2022-04-05 20:31:03.973449
1690	el botón	guzik	53	word	2022-04-05 20:31:03.973449
1691	la media	pończocha	53	word	2022-04-05 20:31:03.973449
1692	los leotardos	rajstopy	53	word	2022-04-05 20:31:03.973449
1693	probar	przymierzać (o/ue)	53	word	2022-04-05 20:31:03.973449
1694	el probador	przymierzalnia	53	word	2022-04-05 20:31:03.973449
1695	la talla	rozmiar	53	word	2022-04-05 20:31:03.973449
1696	quedar	pasować	53	word	2022-04-05 20:31:03.973449
1697	el modelo	model	53	word	2022-04-05 20:31:03.973449
1698	la modelo	modelka	53	word	2022-04-05 20:31:03.973449
1699	diseñar	projektować	53	word	2022-04-05 20:31:03.973449
1700	el diseño	wzór	53	word	2022-04-05 20:31:03.973449
1701	el diseñador	projektant	53	word	2022-04-05 20:31:03.973449
1702	el vestido	ubranie; suknia	53	word	2022-04-05 20:31:03.973449
1703	elegante	elegancki	53	word	2022-04-05 20:31:03.973449
1704	el collar	naszyjnik	53	word	2022-04-05 20:31:03.973449
1705	el pendiente	kolczyk	53	word	2022-04-05 20:31:03.973449
1706	acordarse	pamiętać, przypominać sobie (o/ue)	54	word	2022-04-05 20:31:40.326559
1707	charlar	potocznie: rozmawiać, gawędzić	54	word	2022-04-05 20:31:40.326559
1708	conversar	rozmawiać	54	word	2022-04-05 20:31:40.326559
1709	la conversación	rozmowa	54	word	2022-04-05 20:31:40.326559
1710	salud	na zdrowie (toast; po kichnięciu)	54	word	2022-04-05 20:31:40.326559
1711	quedar	umawiać się	54	word	2022-04-05 20:31:40.326559
1712	despedirse	żegnać się (e/i)	54	word	2022-04-05 20:31:40.326559
1713	la despedida	pożegnanie	54	word	2022-04-05 20:31:40.326559
1714	cordial	serdeczny	54	word	2022-04-05 20:31:40.326559
1715	igualmente	nawzajem	54	word	2022-04-05 20:31:40.326559
1716	mentir	kłamać	54	word	2022-04-05 20:31:40.326559
1717	la mentira	kłamstwo	54	word	2022-04-05 20:31:40.326559
1718	disculparse	usprawiedliwiać się	54	word	2022-04-05 20:31:40.326559
1719	la disculpa	usprawiedliwienie	54	word	2022-04-05 20:31:40.326559
1720	la excepción	wyjątek	54	word	2022-04-05 20:31:40.326559
1721	excepcional	wyjątkowy	54	word	2022-04-05 20:31:40.326559
1722	el favor	przysługa	54	word	2022-04-05 20:31:40.326559
1723	las gracias	podziękowanie	54	word	2022-04-05 20:31:40.326559
1724	no hay de qué	nie ma za co	54	word	2022-04-05 20:31:40.326559
1725	interpretar	tłumaczyć (rozmowę)	54	word	2022-04-05 20:31:40.326559
1726	el intérprete	tłumacz (w rozmowie)	54	word	2022-04-05 20:31:40.326559
1727	perfecto	doskonały	54	word	2022-04-05 20:31:40.326559
1728	perfectamente	doskonale	54	word	2022-04-05 20:31:40.326559
1729	el nivel	poziom	54	word	2022-04-05 20:31:40.326559
1730	elemental	podstawowy	54	word	2022-04-05 20:31:40.326559
1731	intermedio	średnio zaawansowany	54	word	2022-04-05 20:31:40.326559
1732	avanzado	zaawansowany	54	word	2022-04-05 20:31:40.326559
1733	la tierra	ziemia, ląd	55	word	2022-04-05 20:32:12.642644
1734	cultivar	uprawiać	55	word	2022-04-05 20:32:12.642644
1735	la tierra firme	stały ląd	55	word	2022-04-05 20:32:12.642644
1736	el territorio	obszar, terytorium	55	word	2022-04-05 20:32:12.642644
1737	la jungla	dżungla	55	word	2022-04-05 20:32:12.642644
1738	el prado	łąka	55	word	2022-04-05 20:32:12.642644
1739	el valle	dolina	55	word	2022-04-05 20:32:12.642644
1740	la cumbre	wierzchołek, szczyt	55	word	2022-04-05 20:32:12.642644
1741	el desierto	pustynia	55	word	2022-04-05 20:32:12.642644
1742	la arena	piasek	55	word	2022-04-05 20:32:12.642644
1743	arenoso	piaszczysty	55	word	2022-04-05 20:32:12.642644
1744	la piedra	kamień	55	word	2022-04-05 20:32:12.642644
1745	pedregoso	kamienisty	55	word	2022-04-05 20:32:12.642644
1746	la costa	wybrzeże	55	word	2022-04-05 20:32:12.642644
1747	la ola	fala	55	word	2022-04-05 20:32:12.642644
1748	la concha	muszla	55	word	2022-04-05 20:32:12.642644
1749	profundo	głęboki	55	word	2022-04-05 20:32:12.642644
1750	poco profundo	płytki	55	word	2022-04-05 20:32:12.642644
1751	salir	wschodzić (o słońcu) (1g)	55	word	2022-04-05 20:32:12.642644
1752	la salida	wschód	55	word	2022-04-05 20:32:12.642644
1753	ponerse	zachodzić (o słońcu) (1g)	55	word	2022-04-05 20:32:12.642644
1754	la puesta	zachód	55	word	2022-04-05 20:32:12.642644
1755	observar	obserwować	55	word	2022-04-05 20:32:12.642644
1756	la observación	obserwacja	55	word	2022-04-05 20:32:12.642644
1757	el paisaje	krajobraz	55	word	2022-04-05 20:32:12.642644
1758	los alrededores	okolice	55	word	2022-04-05 20:32:12.642644
1759	la ecología	ekologia	55	word	2022-04-05 20:32:12.642644
1760	ecológico	ekologiczny	55	word	2022-04-05 20:32:12.642644
1761	perjudicar	szkodzić, krzywdzić	55	word	2022-04-05 20:32:12.642644
1762	el perjuicio	szkoda, krzywda	55	word	2022-04-05 20:32:12.642644
1763	perjudicial	szkodliwy, krzywdzący	55	word	2022-04-05 20:32:12.642644
1764	contaminar	zanieczyszczać	55	word	2022-04-05 20:32:12.642644
1765	la contaminación	zanieczyszczenie	55	word	2022-04-05 20:32:12.642644
1766	el contaminante	substancja zanieczyszczająca	55	word	2022-04-05 20:32:12.642644
1767	la atmósfera	atmosfera	55	word	2022-04-05 20:32:12.642644
1768	el gas	gaz	55	word	2022-04-05 20:32:12.642644
1769	el gas de escape	spaliny	55	word	2022-04-05 20:32:12.642644
1770	el residuo	odpad	55	word	2022-04-05 20:32:12.642644
1771	las aguas residuales	ścieki	55	word	2022-04-05 20:32:12.642644
1772	el agujero	dziura	55	word	2022-04-05 20:32:12.642644
1773	la selva	puszcza	55	word	2022-04-05 20:32:12.642644
1774	la selva tropical	las tropikalny	55	word	2022-04-05 20:32:12.642644
1775	destruir	niszczyć	55	word	2022-04-05 20:32:12.642644
1776	la destrucción	zniszczenie	55	word	2022-04-05 20:32:12.642644
1777	el colegio	szkoła podstawowa, gimnazjum	56	word	2022-04-05 20:32:49.143122
1778	el instituto	liceum	56	word	2022-04-05 20:32:49.143122
1779	la universidad politécnica	politechnika	56	word	2022-04-05 20:32:49.143122
1780	enseñar	uczyć, nauczać	56	word	2022-04-05 20:32:49.143122
1781	la enseñanza	nauczanie, wykształcenie	56	word	2022-04-05 20:32:49.143122
1782	la enseñanza primaria	wykształcenie podstawowe	56	word	2022-04-05 20:32:49.143122
1783	la enseñanza secundaria	wykształcenie średnie	56	word	2022-04-05 20:32:49.143122
1784	la enseñanza superior	wykształcenie wyższe	56	word	2022-04-05 20:32:49.143122
1785	el método	metoda	56	word	2022-04-05 20:32:49.143122
1786	exigir	wymagać	56	word	2022-04-05 20:32:49.143122
1787	exigente	wymagający	56	word	2022-04-05 20:32:49.143122
1788	molestar	przeszkadzać	56	word	2022-04-05 20:32:49.143122
1789	atender	uważać, uważnie słuchać (e/ie)	56	word	2022-04-05 20:32:49.143122
1790	la atención	uwaga	56	word	2022-04-05 20:32:49.143122
1791	atento	uważny	56	word	2022-04-05 20:32:49.143122
1792	explicar	wyjaśniać, tłumaczyć	56	word	2022-04-05 20:32:49.143122
1793	la explicación	wyjaśnienie, tłumaczenie	56	word	2022-04-05 20:32:49.143122
1794	comparar	porównywać	56	word	2022-04-05 20:32:49.143122
1795	la comparación	porównanie	56	word	2022-04-05 20:32:49.143122
1796	sistemático	systematyczny	56	word	2022-04-05 20:32:49.143122
1797	sistemáticamente	systematycznie	56	word	2022-04-05 20:32:49.143122
1798	anotar	notować	56	word	2022-04-05 20:32:49.143122
1799	la nota	notatka, adnotacja	56	word	2022-04-05 20:32:49.143122
1800	tomar notas	robić notatki	56	word	2022-04-05 20:32:49.143122
1801	prepararse	przygotowywać się	56	word	2022-04-05 20:32:49.143122
1802	la memoria	pamięć	56	word	2022-04-05 20:32:49.143122
1803	el vocabulario	słownictwo	56	word	2022-04-05 20:32:49.143122
1804	el capítulo	rozdział	56	word	2022-04-05 20:32:49.143122
1805	la sala	sala	56	word	2022-04-05 20:32:49.143122
1806	la sala de lectura	czytelnia	56	word	2022-04-05 20:32:49.143122
1807	la sala de espera	poczekalnia	56	word	2022-04-05 20:32:49.143122
1808	contestar	odpowiadać	56	word	2022-04-05 20:32:49.143122
1809	subrayar	podkreślać	56	word	2022-04-05 20:32:49.143122
1810	aprobar	zdać (o egzaminie) (o/ue)	56	word	2022-04-05 20:32:49.143122
1811	el bachillerato	matura	56	word	2022-04-05 20:32:49.143122
1812	corregir	poprawiać (e/i)	56	word	2022-04-05 20:32:49.143122
1813	la corrección	poprawka	56	word	2022-04-05 20:32:49.143122
1814	la dificultad	trudność	56	word	2022-04-05 20:32:49.143122
1815	la estupidez	głupota, tępota	56	word	2022-04-05 20:32:49.143122
1816	estúpido	głupi	56	word	2022-04-05 20:32:49.143122
1817	la razón	rozum, rozsądek	56	word	2022-04-05 20:32:49.143122
1818	la sabiduría	mądrość	56	word	2022-04-05 20:32:49.143122
1819	el sabio	mędrzec	56	word	2022-04-05 20:32:49.143122
1820	sabio	uczony, mądry	56	word	2022-04-05 20:32:49.143122
1821	inventar	wynaleźć	56	word	2022-04-05 20:32:49.143122
1822	la invención	wynalazek	56	word	2022-04-05 20:32:49.143122
1823	el inventor	wynalazca	56	word	2022-04-05 20:32:49.143122
1824	descubrir	odkrywać	56	word	2022-04-05 20:32:49.143122
1825	el descubrimiento	odkrycie	56	word	2022-04-05 20:32:49.143122
1826	el descubridor	odkrywca	56	word	2022-04-05 20:32:49.143122
1827	si	jeżeli	57	word	2022-04-05 20:34:10.341997
1828	quizás	może	57	word	2022-04-05 20:34:10.341997
1829	por supuesto	oczywiście	57	word	2022-04-05 20:34:10.341997
1830	pues	zatem, więc	57	word	2022-04-05 20:34:10.341997
1831	entonces	wobec tego	57	word	2022-04-05 20:34:10.341997
1832	exacto	dokładny, ścisły	57	word	2022-04-05 20:34:10.341997
1833	referirse	dotyczyć (e/ie)	57	word	2022-04-05 20:34:10.341997
1834	ante todo	przede wszystkim	57	word	2022-04-05 20:34:10.341997
1835	el sentido	sens	57	word	2022-04-05 20:34:10.341997
1836	comprender	rozumieć, pojmować	57	word	2022-04-05 20:34:10.341997
1837	además	poza tym, oprócz tego	57	word	2022-04-05 20:34:10.341997
1838	sin embargo	pomimo to, niemniej jednak	57	word	2022-04-05 20:34:10.341997
1839	dudar	wątpić	57	word	2022-04-05 20:34:10.341997
1840	la duda	wątpliwość	57	word	2022-04-05 20:34:10.341997
1841	sin duda	niewątpliwie	57	word	2022-04-05 20:34:10.341997
1842	cierto	pewny	57	word	2022-04-05 20:34:10.341997
1843	la posibilidad	możliwość	57	word	2022-04-05 20:34:10.341997
1844	lógico	logiczny	57	word	2022-04-05 20:34:10.341997
1845	ilógico	nielogiczny	57	word	2022-04-05 20:34:10.341997
1846	etcétera	i tak dalej	57	word	2022-04-05 20:34:10.341997
1847	probable	prawdopodobny	57	word	2022-04-05 20:34:10.341997
1848	improbable	nieprawdopodobny	57	word	2022-04-05 20:34:10.341997
1849	probablemente	prawdopodobnie	57	word	2022-04-05 20:34:10.341997
1850	la razón	racja	57	word	2022-04-05 20:34:10.341997
1851	el acuerdo	porozumienie	57	word	2022-04-05 20:34:10.341997
1852	distinguir	rozróżniać	57	word	2022-04-05 20:34:10.341997
1853	la distinción	rozróżnienie	57	word	2022-04-05 20:34:10.341997
1854	distinto	różny, odmienny	57	word	2022-04-05 20:34:10.341997
1855	la manera	sposób	57	word	2022-04-05 20:34:10.341997
1856	de esta manera	w ten sposób	57	word	2022-04-05 20:34:10.341997
1857	de otra manera	inaczej, w inny sposób	57	word	2022-04-05 20:34:10.341997
1858	debido	z powodu	57	word	2022-04-05 20:34:10.341997
1859	incluso	nawet	57	word	2022-04-05 20:34:10.341997
1860	parecer	wydawać się, zdawać się (c/zc)	57	word	2022-04-05 20:34:10.341997
1861	suponer	przypuszczać (1g)	57	word	2022-04-05 20:34:10.341997
1862	la suposición	przypuszczenie	57	word	2022-04-05 20:34:10.341997
1863	la seguridad	pewność	57	word	2022-04-05 20:34:10.341997
1864	seguramente	z pewnością	57	word	2022-04-05 20:34:10.341997
1865	según	według, zgodnie z	57	word	2022-04-05 20:34:10.341997
1866	adecuado	odpowiedni, właściwy	57	word	2022-04-05 20:34:10.341997
1867	intentar	zamierzać	58	word	2022-04-05 20:34:43.251216
1868	la intención	zamiar	58	word	2022-04-05 20:34:43.251216
1869	ofrecer	oferować (c/zc)	58	word	2022-04-05 20:34:43.251216
1870	la oferta	oferta	58	word	2022-04-05 20:34:43.251216
1871	el visado	wiza	58	word	2022-04-05 20:34:43.251216
1872	el paso	przejście	58	word	2022-04-05 20:34:43.251216
1873	fronterizo	graniczny	58	word	2022-04-05 20:34:43.251216
1874	controlar	kontrolować	58	word	2022-04-05 20:34:43.251216
1875	el control	kontrola	58	word	2022-04-05 20:34:43.251216
1876	el propósito	cel	58	word	2022-04-05 20:34:43.251216
1877	la aduana	cło, urząd celny	58	word	2022-04-05 20:34:43.251216
1878	el aduanero	celnik	58	word	2022-04-05 20:34:43.251216
1879	declarar	deklarować, zgłaszać	58	word	2022-04-05 20:34:43.251216
1880	la declaración	deklaracja, zgłoszenie	58	word	2022-04-05 20:34:43.251216
1881	alojar	zakwaterować	58	word	2022-04-05 20:34:43.251216
1882	el alojamiento	zakwaterowanie	58	word	2022-04-05 20:34:43.251216
1883	el albergue	schronisko	58	word	2022-04-05 20:34:43.251216
1884	la posada	hotel, pensjonat; karczma, gospoda	58	word	2022-04-05 20:34:43.251216
1885	la pensión	pensjonat, hotelik	58	word	2022-04-05 20:34:43.251216
1886	la recepción	recepcja	58	word	2022-04-05 20:34:43.251216
1887	el recepcionista	recepcjonista	58	word	2022-04-05 20:34:43.251216
1888	la habitación individual	pokój jednoosobowy	58	word	2022-04-05 20:34:43.251216
1889	la habitación doble	pokój dwuosobowy	58	word	2022-04-05 20:34:43.251216
1890	la vista	widok	58	word	2022-04-05 20:34:43.251216
1891	fenomenal	wspaniały, genialny	58	word	2022-04-05 20:34:43.251216
1892	admirar	podziwiać	58	word	2022-04-05 20:34:43.251216
1893	la admiración	podziw	58	word	2022-04-05 20:34:43.251216
1894	encantar	zachwycać, urzekać	58	word	2022-04-05 20:34:43.251216
1895	el folleto	folder, prospekt	58	word	2022-04-05 20:34:43.251216
1896	el castillo	zamek	58	word	2022-04-05 20:34:43.251216
1897	la entrada	wstęp, bilet wstępu	58	word	2022-04-05 20:34:43.251216
1898	relajarse	relaksować się	58	word	2022-04-05 20:34:43.251216
1899	la relajación	relaks	58	word	2022-04-05 20:34:43.251216
1900	hermoso	piękny	58	word	2022-04-05 20:34:43.251216
1901	la aventura	przygoda	58	word	2022-04-05 20:34:43.251216
1902	regresar	wracać	58	word	2022-04-05 20:34:43.251216
1903	el regreso	powrót	58	word	2022-04-05 20:34:43.251216
1904	pronosticar	prognozować, przepowiadać	59	word	2022-04-05 20:35:17.009141
1905	el pronóstico	prognoza, przepowiednia	59	word	2022-04-05 20:35:17.009141
1906	la helada	mróz, przymrozek	59	word	2022-04-05 20:35:17.009141
1907	helado	mroźny, lodowaty	59	word	2022-04-05 20:35:17.009141
1908	la niebla	mgła	59	word	2022-04-05 20:35:17.009141
1909	nebuloso	mglisty	59	word	2022-04-05 20:35:17.009141
1910	caluroso	gorący, upalny	59	word	2022-04-05 20:35:17.009141
1911	la sombra	cień	59	word	2022-04-05 20:35:17.009141
1912	la sombrilla	parasolka od słońca	59	word	2022-04-05 20:35:17.009141
1913	la nubosidad	zachmurzenie	59	word	2022-04-05 20:35:17.009141
1914	nuboso	zachmurzony	59	word	2022-04-05 20:35:17.009141
1915	soplar	wiać	59	word	2022-04-05 20:35:17.009141
1916	fresco	chłodny	59	word	2022-04-05 20:35:17.009141
1917	el huracán	huragan	59	word	2022-04-05 20:35:17.009141
1918	la tormenta	burza	59	word	2022-04-05 20:35:17.009141
1919	tronar	grzmieć (o/ue)	59	word	2022-04-05 20:35:17.009141
1920	el trueno	grzmot	59	word	2022-04-05 20:35:17.009141
1921	relampaguear	błyskać się	59	word	2022-04-05 20:35:17.009141
1922	el relámpago	błyskawica, piorun	59	word	2022-04-05 20:35:17.009141
1923	el rayo	promień, błyskawica	59	word	2022-04-05 20:35:17.009141
1924	el arco	łuk	59	word	2022-04-05 20:35:17.009141
1925	el arco iris	tęcza	59	word	2022-04-05 20:35:17.009141
1926	inundar	zalewać	59	word	2022-04-05 20:35:17.009141
1927	la inundación	powódź	59	word	2022-04-05 20:35:17.009141
1928	soltero	stanu wolnego	60	word	2022-04-05 20:35:55.677387
1929	el viudo	wdowiec	60	word	2022-04-05 20:35:55.677387
1930	viudo	owdowiały	60	word	2022-04-05 20:35:55.677387
1931	casarse	żenić się, wychodzić za mąż	60	word	2022-04-05 20:35:55.677387
1932	casado	żonaty	60	word	2022-04-05 20:35:55.677387
1933	el matrimonio	małżeństwo	60	word	2022-04-05 20:35:55.677387
1934	matrimonial	małżeński	60	word	2022-04-05 20:35:55.677387
1935	la boda	ślub	60	word	2022-04-05 20:35:55.677387
1936	especial	szczególny	60	word	2022-04-05 20:35:55.677387
1937	especialmente	zwłaszcza, szczególnie	60	word	2022-04-05 20:35:55.677387
1938	celebrar	świętować, obchodzić	60	word	2022-04-05 20:35:55.677387
1939	la ceremonia	uroczystość	60	word	2022-04-05 20:35:55.677387
1940	ceremonial	uroczysty	60	word	2022-04-05 20:35:55.677387
1941	bienvenido	serdecznie witamy (jedną osobę)	60	word	2022-04-05 20:35:55.677387
1942	la enhorabuena	gratulacje	60	word	2022-04-05 20:35:55.677387
1943	el esposo	małżonek	60	word	2022-04-05 20:35:55.677387
1944	formar	formować, tworzyć	60	word	2022-04-05 20:35:55.677387
1945	la formación	formowanie, tworzenie	60	word	2022-04-05 20:35:55.677387
1946	el hogar	dom (miejsce, w którym czujemy się u siebie)	60	word	2022-04-05 20:35:55.677387
1947	el embarazo	ciąża	60	word	2022-04-05 20:35:55.677387
1948	embarazada	w ciąży	60	word	2022-04-05 20:35:55.677387
1949	el gemelo	bliźniak	60	word	2022-04-05 20:35:55.677387
1950	único	jedyny	60	word	2022-04-05 20:35:55.677387
1951	el hijo único	jedynak	60	word	2022-04-05 20:35:55.677387
1952	cuidar	troszczyć się	60	word	2022-04-05 20:35:55.677387
1953	la guardería	żłobek	60	word	2022-04-05 20:35:55.677387
1954	la infancia	dzieciństwo	60	word	2022-04-05 20:35:55.677387
1955	infantil	dziecięcy	60	word	2022-04-05 20:35:55.677387
1956	el jardín de la infancia	przedszkole	60	word	2022-04-05 20:35:55.677387
1957	la juventud	młodzież	60	word	2022-04-05 20:35:55.677387
1958	juvenil	młodzieżowy	60	word	2022-04-05 20:35:55.677387
1959	el adulto	dorosły (o osobie)	60	word	2022-04-05 20:35:55.677387
1960	adulto	dorosły	60	word	2022-04-05 20:35:55.677387
1961	el primo	kuzyn	60	word	2022-04-05 20:35:55.677387
1962	la prima	kuzynka	60	word	2022-04-05 20:35:55.677387
1963	el sobrino	bratanek, siostrzeniec	60	word	2022-04-05 20:35:55.677387
1964	la sobrina	bratanica, siostrzenica	60	word	2022-04-05 20:35:55.677387
1965	el cuñado	szwagier	60	word	2022-04-05 20:35:55.677387
1966	el bisabuelo	pradziadek	60	word	2022-04-05 20:35:55.677387
1967	la bisabuela	prababcia	60	word	2022-04-05 20:35:55.677387
1968	la generación	pokolenie	60	word	2022-04-05 20:35:55.677387
1969	la relación	stosunek, relacja	60	word	2022-04-05 20:35:55.677387
1970	común	wspólny	60	word	2022-04-05 20:35:55.677387
1971	divorciarse	rozwodzić się	60	word	2022-04-05 20:35:55.677387
1972	el divorcio	rozwód	60	word	2022-04-05 20:35:55.677387
1973	tirar	ciągnąć	61	word	2022-04-05 20:36:36.912067
1974	empujar	pchać	61	word	2022-04-05 20:36:36.912067
1975	colocar	stawiać, umieszczać	61	word	2022-04-05 20:36:36.912067
1976	junto a	przy	61	word	2022-04-05 20:36:36.912067
1977	el fondo	dno, spód, tło	61	word	2022-04-05 20:36:36.912067
1978	la esquina	róg	61	word	2022-04-05 20:36:36.912067
1979	alrededor	wokół	61	word	2022-04-05 20:36:36.912067
1980	los alrededores	okolice	61	word	2022-04-05 20:36:36.912067
1981	andar	chodzić	61	word	2022-04-05 20:36:36.912067
1982	caer	upadać (nr)	61	word	2022-04-05 20:36:36.912067
1983	la caída	upadek	61	word	2022-04-05 20:36:36.912067
1984	levantar	podnosić	61	word	2022-04-05 20:36:36.912067
1985	levantarse	podnosić się	61	word	2022-04-05 20:36:36.912067
1986	para	do (wskazuje na punkt docelowy)	61	word	2022-04-05 20:36:36.912067
1987	hacia	do, w stronę	61	word	2022-04-05 20:36:36.912067
1988	encontrarse	znajdować się (o/ue)	61	word	2022-04-05 20:36:36.912067
1989	dirigirse	kierować się	61	word	2022-04-05 20:36:36.912067
1990	la dirección	kierunek	61	word	2022-04-05 20:36:36.912067
1991	adelante	naprzód	61	word	2022-04-05 20:36:36.912067
1992	torcer	skręcać (c/zc) (o/ue)	61	word	2022-04-05 20:36:36.912067
1993	seguir	iść za, jechać za (nr)	61	word	2022-04-05 20:36:36.912067
1994	mover	poruszać (o/ue)	61	word	2022-04-05 20:36:36.912067
1995	moverse	poruszać się (o/ue)	61	word	2022-04-05 20:36:36.912067
1996	el movimiento	ruch	61	word	2022-04-05 20:36:36.912067
1997	parar	zatrzymać	61	word	2022-04-05 20:36:36.912067
1998	pararse	zatrzymać się	61	word	2022-04-05 20:36:36.912067
1999	sin parar	nieustannie, bez przerwy	61	word	2022-04-05 20:36:36.912067
2000	el paso	krok	61	word	2022-04-05 20:36:36.912067
2001	paso a paso	stopniowo, krok po kroku	61	word	2022-04-05 20:36:36.912067
2002	a cada paso	na każdym kroku	61	word	2022-04-05 20:36:36.912067
2003	el punto	punkt, miejsce	61	word	2022-04-05 20:36:36.912067
2004	la distancia	odległość	61	word	2022-04-05 20:36:36.912067
2005	dentro	wewnątrz, w środku	61	word	2022-04-05 20:36:36.912067
2006	fuera	na zewnątrz, na dworze	61	word	2022-04-05 20:36:36.912067
2007	transportar	transportować	62	word	2022-04-05 20:37:08.662257
2008	el transporte	transport	62	word	2022-04-05 20:37:08.662257
2009	el medio de transporte	środek transportu	62	word	2022-04-05 20:37:08.662257
2010	el viaje	podróż, jazda	62	word	2022-04-05 20:37:08.662257
2011	el autocar	autokar	62	word	2022-04-05 20:37:08.662257
2012	la autopista	autostrada	62	word	2022-04-05 20:37:08.662257
2013	la gasolina	benzyna	62	word	2022-04-05 20:37:08.662257
2014	la gasolinera	stacja benzynowa	62	word	2022-04-05 20:37:08.662257
2015	el camión	samochód ciężarowy	62	word	2022-04-05 20:37:08.662257
2016	el camionero	kierowca samochodu ciężarowego	62	word	2022-04-05 20:37:08.662257
2017	prohibir	zakazywać, zabraniać	62	word	2022-04-05 20:37:08.662257
2018	la prohibición	zakaz	62	word	2022-04-05 20:37:08.662257
2019	el accidente	wypadek	62	word	2022-04-05 20:37:08.662257
2020	chocar	uderzać, zderzać się	62	word	2022-04-05 20:37:08.662257
2021	el choque	uderzenie, zderzenie	62	word	2022-04-05 20:37:08.662257
2022	estropear	uszkodzić, niszczyć	62	word	2022-04-05 20:37:08.662257
2023	estropeado	zepsuty	62	word	2022-04-05 20:37:08.662257
2024	el taller	warsztat, pracownia	62	word	2022-04-05 20:37:08.662257
2025	el mecánico	mechanik	62	word	2022-04-05 20:37:08.662257
2026	reparar	naprawiać	62	word	2022-04-05 20:37:08.662257
2027	la reparación	naprawa	62	word	2022-04-05 20:37:08.662257
2028	el ferrocarril	kolej	62	word	2022-04-05 20:37:08.662257
2029	la taquilla	okienko (kasowe)	62	word	2022-04-05 20:37:08.662257
2030	directo	bezpośredni	62	word	2022-04-05 20:37:08.662257
2031	el expreso	pociąg pośpieszny	62	word	2022-04-05 20:37:08.662257
2032	el rápido	pociąg ekspresowy	62	word	2022-04-05 20:37:08.662257
2033	el andén	peron	62	word	2022-04-05 20:37:08.662257
2034	la vía	tor	62	word	2022-04-05 20:37:08.662257
2035	llegar	przybywać, przyjeżdżać	62	word	2022-04-05 20:37:08.662257
2036	la llegada	przybycie, przyjazd	62	word	2022-04-05 20:37:08.662257
2037	retrasarse	spóźniać się, opóźniać się	62	word	2022-04-05 20:37:08.662257
2038	el retraso	spóźnienie, opóźnienie	62	word	2022-04-05 20:37:08.662257
2039	el compartimento	przedział	62	word	2022-04-05 20:37:08.662257
2040	el asiento	miejsce siedzące	62	word	2022-04-05 20:37:08.662257
2041	el transbordo	przesiadka	62	word	2022-04-05 20:37:08.662257
2042	cobrar	pobierać należność	62	word	2022-04-05 20:37:08.662257
2043	el revisor	konduktor	62	word	2022-04-05 20:37:08.662257
2044	el vuelo	lot	62	word	2022-04-05 20:37:08.662257
2045	la azafata	stewardesa	62	word	2022-04-05 20:37:08.662257
2046	el horario	rozkład (plan)	62	word	2022-04-05 20:37:08.662257
2047	la terminal	terminal	62	word	2022-04-05 20:37:08.662257
2048	el transbordador	prom (również kosmiczny)	62	word	2022-04-05 20:37:08.662257
2049	la barca	łódka, łódź	62	word	2022-04-05 20:37:08.662257
2050	el almacén	magazyn	63	word	2022-04-05 20:37:42.033559
2051	grandes almacenes	dom handlowy	63	word	2022-04-05 20:37:42.033559
2052	la floristería	kwiaciarnia	63	word	2022-04-05 20:37:42.033559
2053	la florista	kwiaciarka	63	word	2022-04-05 20:37:42.033559
2054	la frutería	sklep z owocami	63	word	2022-04-05 20:37:42.033559
2055	la verdulería	sklep z warzywami	63	word	2022-04-05 20:37:42.033559
2056	la charcutería	sklep z wędlinami	63	word	2022-04-05 20:37:42.033559
2057	la droguería	drogeria	63	word	2022-04-05 20:37:42.033559
2058	comercial	handlowy	63	word	2022-04-05 20:37:42.033559
2059	rebajar	obniżać (ceny)	63	word	2022-04-05 20:37:42.033559
2060	las rebajas	obniżka (cen)	63	word	2022-04-05 20:37:42.033559
2061	el escaparate	wystawa sklepowa	63	word	2022-04-05 20:37:42.033559
2062	el mostrador	lada sklepowa	63	word	2022-04-05 20:37:42.033559
2063	la lista	lista	63	word	2022-04-05 20:37:42.033559
2064	el artículo	artykuł	63	word	2022-04-05 20:37:42.033559
2065	la publicidad	reklama (p)	63	word	2022-04-05 20:37:42.033559
2066	atender	obsługiwać (e/ie)	63	word	2022-04-05 20:37:42.033559
2067	el catálogo	katalog	63	word	2022-04-05 20:37:42.033559
2068	aconsejar	doradzać	63	word	2022-04-05 20:37:42.033559
2069	el consejo	rada	63	word	2022-04-05 20:37:42.033559
2070	recomendar	polecać, rekomendować (e/ie)	63	word	2022-04-05 20:37:42.033559
2071	la recomendación	zalecenie, rekomendacja	63	word	2022-04-05 20:37:42.033559
2072	decidirse	decydować się	63	word	2022-04-05 20:37:42.033559
2073	la decisión	decyzja	63	word	2022-04-05 20:37:42.033559
2074	pedir	zamawiać (e/i)	63	word	2022-04-05 20:37:42.033559
2075	el pedido	zamówienie	63	word	2022-04-05 20:37:42.033559
2076	el recibo	kwit, pokwitowanie	63	word	2022-04-05 20:37:42.033559
2077	la peluquería	salon fryzjerski	63	word	2022-04-05 20:37:42.033559
2078	el peluquero	fryzjer	63	word	2022-04-05 20:37:42.033559
2079	la sastrería	zakład krawiecki	63	word	2022-04-05 20:37:42.033559
2080	el sastre	krawiec	63	word	2022-04-05 20:37:42.033559
2081	la modista	krawcowa	63	word	2022-04-05 20:37:42.033559
2082	la electricidad	elektryczność	63	word	2022-04-05 20:37:42.033559
2083	el electricista	elektryk	63	word	2022-04-05 20:37:42.033559
2084	eléctrico	elektryczny	63	word	2022-04-05 20:37:42.033559
2085	la medicina	medycyna	64	word	2022-04-05 20:38:13.441829
2086	médico	medyczny, lekarski	64	word	2022-04-05 20:38:13.441829
2087	deber	być zobowiązanym, musieć	64	word	2022-04-05 20:38:13.441829
2088	la consulta	wizyta u lekarza	64	word	2022-04-05 20:38:13.441829
2089	el consultorio	gabinet lekarski	64	word	2022-04-05 20:38:13.441829
2090	el oculista	okulista	64	word	2022-04-05 20:38:13.441829
2091	examinar	badać	64	word	2022-04-05 20:38:13.441829
2092	el examen	badanie	64	word	2022-04-05 20:38:13.441829
2093	el paciente	pacjent	64	word	2022-04-05 20:38:13.441829
2094	el sordo	głuchy (osoba)	64	word	2022-04-05 20:38:13.441829
2095	sordo	głuchy	64	word	2022-04-05 20:38:13.441829
2096	el ciego	niewidomy, ślepiec	64	word	2022-04-05 20:38:13.441829
2097	ciego	niewidomy, ślepy	64	word	2022-04-05 20:38:13.441829
2098	pálido	blady	64	word	2022-04-05 20:38:13.441829
2099	enfermar	zachorować	64	word	2022-04-05 20:38:13.441829
2100	resfriarse	przeziębiać się	64	word	2022-04-05 20:38:13.441829
2101	el resfriado	przeziębienie	64	word	2022-04-05 20:38:13.441829
2102	la angina	angina	64	word	2022-04-05 20:38:13.441829
2103	vomitar	wymiotować	64	word	2022-04-05 20:38:13.441829
2104	el vómito	wymioty	64	word	2022-04-05 20:38:13.441829
2105	la diarrea	biegunka	64	word	2022-04-05 20:38:13.441829
2106	la alergia	alergia	64	word	2022-04-05 20:38:13.441829
2107	recetar	przepisywać (lek)	64	word	2022-04-05 20:38:13.441829
2108	la receta	recepta	64	word	2022-04-05 20:38:13.441829
2109	la tableta	tabletka	64	word	2022-04-05 20:38:13.441829
2110	las gotas	krople	64	word	2022-04-05 20:38:13.441829
2111	el jarabe	syrop	64	word	2022-04-05 20:38:13.441829
2112	el antibiótico	antybiotyk	64	word	2022-04-05 20:38:13.441829
2113	la vitamina	witamina	64	word	2022-04-05 20:38:13.441829
2114	herirse	zranić się (e/ie)	64	word	2022-04-05 20:38:13.441829
2115	la herida	zranienie, rana	64	word	2022-04-05 20:38:13.441829
2116	quemarse	oparzyć się	64	word	2022-04-05 20:38:13.441829
2117	la quemadura	oparzenie	64	word	2022-04-05 20:38:13.441829
2118	salvar	ratować	64	word	2022-04-05 20:38:13.441829
2119	la salvación	ratunek	64	word	2022-04-05 20:38:13.441829
2120	la ambulancia	karetka (pogotowia)	64	word	2022-04-05 20:38:13.441829
2121	sufrir	cierpieć	64	word	2022-04-05 20:38:13.441829
2122	el sufrimiento	cierpienie	64	word	2022-04-05 20:38:13.441829
2123	la inyección	zastrzyk	64	word	2022-04-05 20:38:13.441829
2124	el cirujano	chirurg	64	word	2022-04-05 20:38:13.441829
2125	operar	operować	64	word	2022-04-05 20:38:13.441829
2126	la operación	operacja	64	word	2022-04-05 20:38:13.441829
2127	mejorar	wracać do zdrowia	64	word	2022-04-05 20:38:13.441829
2128	curarse	wyzdrowieć, wyleczyć się	64	word	2022-04-05 20:38:13.441829
2129	la esponja	gąbka	65	word	2022-04-05 20:38:56.156692
2130	el cepillo	szczotka	65	word	2022-04-05 20:38:56.156692
2131	el cepillo de dientes	szczoteczka do zębów	65	word	2022-04-05 20:38:56.156692
2132	el gel	żel	65	word	2022-04-05 20:38:56.156692
2133	el desodorante	dezodorant	65	word	2022-04-05 20:38:56.156692
2134	el perfume	perfumy	65	word	2022-04-05 20:38:56.156692
2135	la perfumería	perfumeria	65	word	2022-04-05 20:38:56.156692
2136	la higiene	higiena	65	word	2022-04-05 20:38:56.156692
2137	higiénico	higieniczny	65	word	2022-04-05 20:38:56.156692
2138	el papel higiénico	papier toaletowy	65	word	2022-04-05 20:38:56.156692
2139	el pañuelo	chusteczka	65	word	2022-04-05 20:38:56.156692
2140	dormirse	zasypiać (o/ue)	65	word	2022-04-05 20:38:56.156692
2141	soñar	śnić, marzyć (o/ue)	65	word	2022-04-05 20:38:56.156692
2142	el sueño	sen, marzenie	65	word	2022-04-05 20:38:56.156692
2143	el despertador	budzik	65	word	2022-04-05 20:38:56.156692
2144	el pueblo	lud, naród	66	word	2022-04-05 20:39:32.760713
2145	la patria	ojczyzna	66	word	2022-04-05 20:39:32.760713
2146	el ciudadano	obywatel	66	word	2022-04-05 20:39:32.760713
2147	ciudadano	obywatelski	66	word	2022-04-05 20:39:32.760713
2148	el principado	księstwo	66	word	2022-04-05 20:39:32.760713
2149	el región	region	66	word	2022-04-05 20:39:32.760713
2150	depender	zależeć	66	word	2022-04-05 20:39:32.760713
2151	la dependencia	zależność	66	word	2022-04-05 20:39:32.760713
2152	la independencia	niezależność	66	word	2022-04-05 20:39:32.760713
2153	independiente	niezależny	66	word	2022-04-05 20:39:32.760713
2154	la diplomacia	dyplomacja	66	word	2022-04-05 20:39:32.760713
2155	el diplomático	dyplomata	66	word	2022-04-05 20:39:32.760713
2156	diplomático	dyplomatyczny	66	word	2022-04-05 20:39:32.760713
2157	la embajada	ambasada	66	word	2022-04-05 20:39:32.760713
2158	el embajador	ambasador	66	word	2022-04-05 20:39:32.760713
2159	el poder	władza, potęga	66	word	2022-04-05 20:39:32.760713
2160	poderoso	potężny	66	word	2022-04-05 20:39:32.760713
2161	el cargo	urząd, stanowisko	66	word	2022-04-05 20:39:32.760713
2162	el ministerio	ministerstwo	66	word	2022-04-05 20:39:32.760713
2163	el diputado	poseł	66	word	2022-04-05 20:39:32.760713
2164	la democracia	demokracja	66	word	2022-04-05 20:39:32.760713
2165	democrático	demokratyczny	66	word	2022-04-05 20:39:32.760713
2166	el sistema	system	66	word	2022-04-05 20:39:32.760713
2167	el capitalismo	kapitalizm	66	word	2022-04-05 20:39:32.760713
2168	capitalista	kapitalistyczny	66	word	2022-04-05 20:39:32.760713
2169	elegir	wybierać (e/i)	66	word	2022-04-05 20:39:32.760713
2170	las elecciones	wybory	66	word	2022-04-05 20:39:32.760713
2171	el candidato	kandydat	66	word	2022-04-05 20:39:32.760713
2172	la candidatura	kandydatura	66	word	2022-04-05 20:39:32.760713
2173	votar	głosować	66	word	2022-04-05 20:39:32.760713
2174	el voto	głos (w głosowaniu)	66	word	2022-04-05 20:39:32.760713
2175	la mayoría	większość	66	word	2022-04-05 20:39:32.760713
2176	la minoría	mniejszość	66	word	2022-04-05 20:39:32.760713
2177	el líder	przywódca, lider	66	word	2022-04-05 20:39:32.760713
2178	la conferencia	konferencja	66	word	2022-04-05 20:39:32.760713
2179	prometer	obiecywać	66	word	2022-04-05 20:39:32.760713
2180	la promesa	obietnica	66	word	2022-04-05 20:39:32.760713
2181	reformar	reformować	66	word	2022-04-05 20:39:32.760713
2182	la reforma	reforma	66	word	2022-04-05 20:39:32.760713
2183	limitar	ograniczać	66	word	2022-04-05 20:39:32.760713
2184	la limitación	ograniczenie	66	word	2022-04-05 20:39:32.760713
2185	influir	wpływać	66	word	2022-04-05 20:39:32.760713
2186	la influencia	wpływ	66	word	2022-04-05 20:39:32.760713
2187	realizar	realizować	66	word	2022-04-05 20:39:32.760713
2188	la realización	realizacja	66	word	2022-04-05 20:39:32.760713
2189	la comisión	komisja	66	word	2022-04-05 20:39:32.760713
2190	el miembro	członek	66	word	2022-04-05 20:39:32.760713
2191	proponer	proponować (1g)	66	word	2022-04-05 20:39:32.760713
2192	la propuesta	propozycja	66	word	2022-04-05 20:39:32.760713
2193	oficial	oficjalny, urzędowy	66	word	2022-04-05 20:39:32.760713
2194	extraoficial	nieoficjalny	66	word	2022-04-05 20:39:32.760713
2195	cooperar	współpracować	66	word	2022-04-05 20:39:32.760713
2196	la cooperación	współpraca	66	word	2022-04-05 20:39:32.760713
2197	fundar	zakładać	66	word	2022-04-05 20:39:32.760713
2198	la fundación	założenie	66	word	2022-04-05 20:39:32.760713
2199	el fundador	założyciel	66	word	2022-04-05 20:39:32.760713
2200	la institución	instytucja	66	word	2022-04-05 20:39:32.760713
2201	unir	łączyć, jednoczyć	66	word	2022-04-05 20:39:32.760713
2202	la unión	unia	66	word	2022-04-05 20:39:32.760713
2746	la emoción	emocja	82	word	2022-04-07 20:45:10.006344
2747	emocional	emocjonalny	82	word	2022-04-07 20:45:10.006344
2748	la intuición	intuicja, przeczucie	82	word	2022-04-07 20:45:10.006344
2749	intuitivo	intuicyjny	82	word	2022-04-07 20:45:10.006344
2750	la voluntad	wola	82	word	2022-04-07 20:45:10.006344
2751	la locura	szaleństwo	82	word	2022-04-07 20:45:10.006344
2752	el romance	romans	82	word	2022-04-07 20:45:10.006344
2753	el amante	kochanek	82	word	2022-04-07 20:45:10.006344
2754	abrazar	ściskać, obejmować	82	word	2022-04-07 20:45:10.006344
2755	el abrazo	uścisk, objęcie	82	word	2022-04-07 20:45:10.006344
2756	fiel	wierny	82	word	2022-04-07 20:45:10.006344
2757	merecer	zasługiwać, być godnym (c/zc)	82	word	2022-04-07 20:45:10.006344
2758	envidiar	zazdrościć	82	word	2022-04-07 20:45:10.006344
2759	la envidia	zazdrość, zawiść	82	word	2022-04-07 20:45:10.006344
2760	envidioso	zazdrosny, zawistny	82	word	2022-04-07 20:45:10.006344
2204	asesinar	mordować	67	word	2022-04-05 20:40:15.098647
2205	el asesinato	morderstwo, zabójstwo	67	word	2022-04-05 20:40:15.098647
2206	el asesino	morderca, zabójca	67	word	2022-04-05 20:40:15.098647
2207	muerto	martwy	67	word	2022-04-05 20:40:15.098647
2208	vivo	żywy	67	word	2022-04-05 20:40:15.098647
2209	suicidarse	popełniać samobójstwo	67	word	2022-04-05 20:40:15.098647
2210	el suicidio	samobójstwo	67	word	2022-04-05 20:40:15.098647
2211	el suicida	samobójca	67	word	2022-04-05 20:40:15.098647
2212	forzar	zmuszać (o/ue)	67	word	2022-04-05 20:40:15.098647
2213	el carterista	złodziej kieszonkowy	67	word	2022-04-05 20:40:15.098647
2214	el contrabando	przemyt	67	word	2022-04-05 20:40:15.098647
2215	el contrabandista	przemytnik	67	word	2022-04-05 20:40:15.098647
2216	el delito	przestępstwo	67	word	2022-04-05 20:40:15.098647
2217	el delincuente	przestępca	67	word	2022-04-05 20:40:15.098647
2218	cometer	popełniać	67	word	2022-04-05 20:40:15.098647
2219	sospechar	podejrzewać	67	word	2022-04-05 20:40:15.098647
2220	el sospechoso	podejrzany (osoba)	67	word	2022-04-05 20:40:15.098647
2221	sospechoso	podejrzany	67	word	2022-04-05 20:40:15.098647
2222	detener	aresztować (1g)	67	word	2022-04-05 20:40:15.098647
2223	la detención	aresztowanie	67	word	2022-04-05 20:40:15.098647
2224	la cárcel	więzienie	67	word	2022-04-05 20:40:15.098647
2225	el preso	więzień	67	word	2022-04-05 20:40:15.098647
2226	huir	uciekać, zbiegać	67	word	2022-04-05 20:40:15.098647
2227	el jurista	prawnik (j)	67	word	2022-04-05 20:40:15.098647
2228	el abogado	prawnik (a)	67	word	2022-04-05 20:40:15.098647
2229	el abogado de defensa	adwokat	67	word	2022-04-05 20:40:15.098647
2230	la ley	ustawa, prawo	67	word	2022-04-05 20:40:15.098647
2231	el reglamento	przepisy, regulamin	67	word	2022-04-05 20:40:15.098647
2232	el caso	przypadek	67	word	2022-04-05 20:40:15.098647
2233	la culpa	wina	67	word	2022-04-05 20:40:15.098647
2234	culpable	winny	67	word	2022-04-05 20:40:15.098647
2235	la inocencia	niewinność	67	word	2022-04-05 20:40:15.098647
2236	inocente	niewinny	67	word	2022-04-05 20:40:15.098647
2237	castigar	ukarać	67	word	2022-04-05 20:40:15.098647
2238	el castigo	kara	67	word	2022-04-05 20:40:15.098647
2239	justo	sprawiedliwy	67	word	2022-04-05 20:40:15.098647
2240	injusto	niesprawiedliwy	67	word	2022-04-05 20:40:15.098647
2241	la multa	grzywna, mandat	67	word	2022-04-05 20:40:15.098647
2242	evitar	unikać	67	word	2022-04-05 20:40:15.098647
2243	la sociedad	społeczeństwo	67	word	2022-04-05 20:40:15.098647
2244	la miseria	nędza, bieda	67	word	2022-04-05 20:40:15.098647
2245	principal	główny	67	word	2022-04-05 20:40:15.098647
2246	social	socjalny	67	word	2022-04-05 20:40:15.098647
2247	la diferencia	różnica	67	word	2022-04-05 20:40:15.098647
2248	diferente	różny	67	word	2022-04-05 20:40:15.098647
2249	la vivienda	mieszkanie	67	word	2022-04-05 20:40:15.098647
2250	la adicción	uzależnienie	67	word	2022-04-05 20:40:15.098647
2251	adicto	uzależniony	67	word	2022-04-05 20:40:15.098647
2252	el alcoholismo	alkoholizm	67	word	2022-04-05 20:40:15.098647
2253	el alcohólico	alkoholik	67	word	2022-04-05 20:40:15.098647
2254	la drogadicción	narkomania	67	word	2022-04-05 20:40:15.098647
2255	el drogadicto	narkoman	67	word	2022-04-05 20:40:15.098647
2256	drogadicto	uzależniony od narkotyków	67	word	2022-04-05 20:40:15.098647
2257	tolerar	tolerować	67	word	2022-04-05 20:40:15.098647
2258	la tolerancia	tolerancja	67	word	2022-04-05 20:40:15.098647
2259	tolerante	tolerancyjny	67	word	2022-04-05 20:40:15.098647
2260	la intolerancia	nietolerancja	67	word	2022-04-05 20:40:15.098647
2261	intolerante	nietolerancyjny	67	word	2022-04-05 20:40:15.098647
2262	discriminar	dyskryminować	67	word	2022-04-05 20:40:15.098647
2263	la discriminación	dyskryminacja	67	word	2022-04-05 20:40:15.098647
2264	la igualdad	równość	67	word	2022-04-05 20:40:15.098647
2265	igual	równy	67	word	2022-04-05 20:40:15.098647
2266	la realidad	rzeczywistość	67	word	2022-04-05 20:40:15.098647
2267	real	realny, rzeczywisty	67	word	2022-04-05 20:40:15.098647
2268	protestar	protestować	67	word	2022-04-05 20:40:15.098647
2269	la protesta	protest	67	word	2022-04-05 20:40:15.098647
2270	grave	poważny, niebezpieczny	67	word	2022-04-05 20:40:15.098647
2271	la huelga	strajk	67	word	2022-04-05 20:40:15.098647
2272	causar	powodować	67	word	2022-04-05 20:40:15.098647
2273	la causa	powód, przyczyna	67	word	2022-04-05 20:40:15.098647
2274	la consecuencia	konsekwencja, rezultat	67	word	2022-04-05 20:40:15.098647
2275	consecuente	konsekwentny	67	word	2022-04-05 20:40:15.098647
2276	resolver	rozwiązywać (zadanie, problem) (o/ue)	67	word	2022-04-05 20:40:15.098647
2277	actuar	działać, postępować	67	word	2022-04-05 20:40:15.098647
2278	la acción	działanie, postępek	67	word	2022-04-05 20:40:15.098647
2279	la solución	rozwiązanie	67	word	2022-04-05 20:40:15.098647
2280	el modo	sposób (m)	67	word	2022-04-05 20:40:15.098647
2281	la hoja	kartka	68	word	2022-04-05 20:40:48.272551
2282	el portafolios	teczka, aktówka	68	word	2022-04-05 20:40:48.272551
2283	los portafolios	teczki, aktówki	68	word	2022-04-05 20:40:48.272551
2284	el monedero	portmonetka	68	word	2022-04-05 20:40:48.272551
2285	el objeto	przedmiot	68	word	2022-04-05 20:40:48.272551
2286	la cerilla	zapałka	68	word	2022-04-05 20:40:48.272551
2287	el encendedor	zapalniczka	68	word	2022-04-05 20:40:48.272551
2288	el abrebotellas	otwieracz do butelek	68	word	2022-04-05 20:40:48.272551
2289	los abrebotellas	otwieracze do butelek	68	word	2022-04-05 20:40:48.272551
2290	el abrelatas	otwieracz do puszek	68	word	2022-04-05 20:40:48.272551
2291	los abrelatas	otwieracze do puszek	68	word	2022-04-05 20:40:48.272551
2292	el sacacorchos	korkociąg	68	word	2022-04-05 20:40:48.272551
2293	los sacacorchos	korkociągi	68	word	2022-04-05 20:40:48.272551
2294	la pila	bateria	68	word	2022-04-05 20:40:48.272551
2295	funcionar	funkcjonować, działać	68	word	2022-04-05 20:40:48.272551
2296	la función	funkcja	68	word	2022-04-05 20:40:48.272551
2297	funcional	funkcjonalny	68	word	2022-04-05 20:40:48.272551
2298	la cadena	łańcuch, łańcuszek	68	word	2022-04-05 20:40:48.272551
2299	la navaja	nóż składany, scyzoryk	68	word	2022-04-05 20:40:48.272551
2300	práctico	praktyczny	68	word	2022-04-05 20:40:48.272551
2301	el cordón	sznurek	68	word	2022-04-05 20:40:48.272551
2302	la aguja	igła	68	word	2022-04-05 20:40:48.272551
2303	el hilo	nić, nitka	68	word	2022-04-05 20:40:48.272551
2304	el monasterio	klasztor	69	word	2022-04-05 20:41:25.295831
2305	el monje	mnich, zakonnik	69	word	2022-04-05 20:41:25.295831
2306	la monja	mniszka, zakonnica	69	word	2022-04-05 20:41:25.295831
2307	el sacerdote	ksiądz, kapłan	69	word	2022-04-05 20:41:25.295831
2308	el alma	dusza (rodzaj żeński)	69	word	2022-04-05 20:41:25.295831
2309	la Biblia	Biblia	69	word	2022-04-05 20:41:25.295831
2310	el cementerio	cmentarz	69	word	2022-04-05 20:41:25.295831
2311	la catedral	katedra	69	word	2022-04-05 20:41:25.295831
2312	el milagro	cud	69	word	2022-04-05 20:41:25.295831
2313	milagroso	cudowny	69	word	2022-04-05 20:41:25.295831
2314	el santo	święty (osoba)	69	word	2022-04-05 20:41:25.295831
2315	santo	święty	69	word	2022-04-05 20:41:25.295831
2316	el paraíso	raj	69	word	2022-04-05 20:41:25.295831
2317	paradisíaco	rajski	69	word	2022-04-05 20:41:25.295831
2318	el infierno	piekło	69	word	2022-04-05 20:41:25.295831
2319	el cielo	niebo	69	word	2022-04-05 20:41:25.295831
2320	el cristianismo	chrześcijaństwo	69	word	2022-04-05 20:41:25.295831
2321	el cristiano	chrześcijanin	69	word	2022-04-05 20:41:25.295831
2322	cristiano	chrześcijański	69	word	2022-04-05 20:41:25.295831
2323	el catolicismo	katolicyzm	69	word	2022-04-05 20:41:25.295831
2324	el católico	katolik	69	word	2022-04-05 20:41:25.295831
2325	católico	katolicki	69	word	2022-04-05 20:41:25.295831
2326	la tradición	tradycja	69	word	2022-04-05 20:41:25.295831
2327	tradicional	tradycyjny	69	word	2022-04-05 20:41:25.295831
2328	la costumbre	zwyczaj, obyczaj	69	word	2022-04-05 20:41:25.295831
2329	la vela	świeczka	69	word	2022-04-05 20:41:25.295831
2330	la corona	wieniec	69	word	2022-04-05 20:41:25.295831
2331	el adviento	adwent	69	word	2022-04-05 20:41:25.295831
2332	la afición	hobby	70	word	2022-04-05 20:41:59.595414
2333	el aficionado	miłośnik, fan	70	word	2022-04-05 20:41:59.595414
2334	patinar	jeździć na łyżwach	70	word	2022-04-05 20:41:59.595414
2335	el patinador	łyżwiarz	70	word	2022-04-05 20:41:59.595414
2336	el patín	łyżwa	70	word	2022-04-05 20:41:59.595414
2337	el patinaja	łyżwiarstwo	70	word	2022-04-05 20:41:59.595414
2338	montar	jeździć konno, dosiadać	70	word	2022-04-05 20:41:59.595414
2339	la vela	żeglarstwo	70	word	2022-04-05 20:41:59.595414
2340	el velero	żaglówka	70	word	2022-04-05 20:41:59.595414
2341	el ciclismo	kolarstwo	70	word	2022-04-05 20:41:59.595414
2342	el ciclista	kolarz	70	word	2022-04-05 20:41:59.595414
2343	la gimnasia	gimnastyka	70	word	2022-04-05 20:41:59.595414
2344	el gimnasio	siłownia	70	word	2022-04-05 20:41:59.595414
2345	el footing	jogging	70	word	2022-04-05 20:41:59.595414
2346	la forma	forma, kondycja	70	word	2022-04-05 20:41:59.595414
2347	el club	klub	70	word	2022-04-05 20:41:59.595414
2348	el seguidor	kibic	70	word	2022-04-05 20:41:59.595414
2349	entrenar	trenować	70	word	2022-04-05 20:41:59.595414
2350	el entrenamiento	trening	70	word	2022-04-05 20:41:59.595414
2351	el entrenador	trener	70	word	2022-04-05 20:41:59.595414
2352	saltar	skakać	70	word	2022-04-05 20:41:59.595414
2353	el salto	skok	70	word	2022-04-05 20:41:59.595414
2354	el saltador	skoczek	70	word	2022-04-05 20:41:59.595414
2355	competir	współzawodniczyć (e/i)	70	word	2022-04-05 20:41:59.595414
2356	la competición	zawody	70	word	2022-04-05 20:41:59.595414
2357	el campeonato	mistrzostwo	70	word	2022-04-05 20:41:59.595414
2358	el campeón	mistrz	70	word	2022-04-05 20:41:59.595414
2359	ganar	wygrywać	70	word	2022-04-05 20:41:59.595414
2360	el ganador	zwycięzca	70	word	2022-04-05 20:41:59.595414
2361	premiar	nagradzać	70	word	2022-04-05 20:41:59.595414
2362	el premio	nagroda	70	word	2022-04-05 20:41:59.595414
2363	conseguir	zdobywać, osiągać (nr)	70	word	2022-04-05 20:41:59.595414
2364	perder	przegrywać (e/ie)	70	word	2022-04-05 20:41:59.595414
2365	el perdedor	przegrywający	70	word	2022-04-05 20:41:59.595414
2366	el billar	bilard	70	word	2022-04-05 20:41:59.595414
2367	coleccionar	kolekcjonować	70	word	2022-04-05 20:41:59.595414
2368	la colección	kolekcja	70	word	2022-04-05 20:41:59.595414
2369	el coleccionista	kolekcjoner	70	word	2022-04-05 20:41:59.595414
2370	el circo	cyrk	70	word	2022-04-05 20:41:59.595414
2371	el funcionario	urzędnik	71	word	2022-04-05 20:42:31.224865
2372	personal	osobisty	71	word	2022-04-05 20:42:31.224865
2373	personalmente	osobiście	71	word	2022-04-05 20:42:31.224865
2374	los datos	dane	71	word	2022-04-05 20:42:31.224865
2375	rellenar	wypełniać	71	word	2022-04-05 20:42:31.224865
2376	indicar	wskazywać	71	word	2022-04-05 20:42:31.224865
2377	la edad	wiek	71	word	2022-04-05 20:42:31.224865
2378	civil	cywilny	71	word	2022-04-05 20:42:31.224865
2379	el domicilio	miejsce zamieszkania	71	word	2022-04-05 20:42:31.224865
2380	el domicilio fijo	stałe miejsce zamieszkania	71	word	2022-04-05 20:42:31.224865
2381	el carné	dowód, legitymacja	71	word	2022-04-05 20:42:31.224865
2382	el carné de identidad	dowód osobisty	71	word	2022-04-05 20:42:31.224865
2383	actual	aktualny	71	word	2022-04-05 20:42:31.224865
2384	actualmente	aktualnie, obecnie	71	word	2022-04-05 20:42:31.224865
2385	el original	oryginał	71	word	2022-04-05 20:42:31.224865
2386	original	oryginalny	71	word	2022-04-05 20:42:31.224865
2387	válido	ważny	71	word	2022-04-05 20:42:31.224865
2388	sellar	stemplować, pieczętować	71	word	2022-04-05 20:42:31.224865
2389	el sello	stempel, pieczątka	71	word	2022-04-05 20:42:31.224865
2390	firmar	podpisywać	71	word	2022-04-05 20:42:31.224865
2391	la firma	podpis	71	word	2022-04-05 20:42:31.224865
2392	permitir	zezwalać, pozwalać	71	word	2022-04-05 20:42:31.224865
2393	el permiso	zezwolenie, pozwolenie	71	word	2022-04-05 20:42:31.224865
2394	urgente	pilny	71	word	2022-04-05 20:42:31.224865
2395	urgentemente	pilnie	71	word	2022-04-05 20:42:31.224865
2396	el asunto	sprawa	71	word	2022-04-05 20:42:31.224865
2397	la fecha	termin	71	word	2022-04-05 20:42:31.224865
2398	entregar	oddawać, dostarczać	71	word	2022-04-05 20:42:31.224865
2399	la entrega	oddanie, dostarczenie	71	word	2022-04-05 20:42:31.224865
2400	recoger	odbierać	71	word	2022-04-05 20:42:31.224865
2401	positivo	pozytywny	71	word	2022-04-05 20:42:31.224865
2402	negativo	negatywny	71	word	2022-04-05 20:42:31.224865
2403	el desastre	katastrofa, nieszczęście	72	word	2022-04-05 20:43:10.296184
2404	explotar	eksplodować	72	word	2022-04-05 20:43:10.296184
2405	la explosión	eksplozja	72	word	2022-04-05 20:43:10.296184
2406	la mina	mina	72	word	2022-04-05 20:43:10.296184
2407	el pánico	panika, strach	72	word	2022-04-05 20:43:10.296184
2408	la emergencia	nagły wypadek	72	word	2022-04-05 20:43:10.296184
2409	prudente	ostrożny	72	word	2022-04-05 20:43:10.296184
2410	imprudente	nieostrożny	72	word	2022-04-05 20:43:10.296184
2411	el incendio	pożar	72	word	2022-04-05 20:43:10.296184
2412	el bombero	strażak	72	word	2022-04-05 20:43:10.296184
2413	el cuerpo de bomberos	straż pożarna	72	word	2022-04-05 20:43:10.296184
2414	el héroe	bohater	72	word	2022-04-05 20:43:10.296184
2415	la heroína	bohaterka	72	word	2022-04-05 20:43:10.296184
2416	heroico	bohaterski	72	word	2022-04-05 20:43:10.296184
2417	el marinero	marynarz	72	word	2022-04-05 20:43:10.296184
2418	el submarino	łódź podwodna	72	word	2022-04-05 20:43:10.296184
2419	espiar	szpiegować	72	word	2022-04-05 20:43:10.296184
2420	el espionaje	szpiegostwo	72	word	2022-04-05 20:43:10.296184
2421	el espía	szpieg	72	word	2022-04-05 20:43:10.296184
2422	el enemigo	wróg	72	word	2022-04-05 20:43:10.296184
2423	enemigo	wrogi	72	word	2022-04-05 20:43:10.296184
2424	atacar	atakować	72	word	2022-04-05 20:43:10.296184
2425	el ataque	atak	72	word	2022-04-05 20:43:10.296184
2426	el agresor	napastnik, agresor	72	word	2022-04-05 20:43:10.296184
2427	la crueldad	okrucieństwo	72	word	2022-04-05 20:43:10.296184
2428	cruel	okrutny	72	word	2022-04-05 20:43:10.296184
2429	el ejército	armia, wojsko	72	word	2022-04-05 20:43:10.296184
2430	marchar	maszerować	72	word	2022-04-05 20:43:10.296184
2431	la marcha	marsz	72	word	2022-04-05 20:43:10.296184
2432	luchar	walczyć	72	word	2022-04-05 20:43:10.296184
2433	la lucha	walka	72	word	2022-04-05 20:43:10.296184
2434	el arma	broń (rodzaj żeński)	72	word	2022-04-05 20:43:10.296184
2435	el arma de fuego	broń palna	72	word	2022-04-05 20:43:10.296184
2436	el arma blanca	broń biała	72	word	2022-04-05 20:43:10.296184
2437	el conflicto	konflikt	72	word	2022-04-05 20:43:10.296184
2438	golpear	uderzać, bić	72	word	2022-04-05 20:43:10.296184
2439	el golpe	uderzenie, cios	72	word	2022-04-05 20:43:10.296184
2440	defenderse	bronić się (e/ie)	72	word	2022-04-05 20:43:10.296184
2441	la defensa	obrona	72	word	2022-04-05 20:43:10.296184
2442	el defensor	obrońca	72	word	2022-04-05 20:43:10.296184
2443	la víctima	ofiara (człowiek)	72	word	2022-04-05 20:43:10.296184
2444	mortal	śmiertelny	72	word	2022-04-05 20:43:10.296184
2445	sobrevivir	przeżyć, ocaleć	72	word	2022-04-05 20:43:10.296184
2446	el aspecto	wygląd	73	word	2022-04-05 20:43:50.479287
2447	el aspecto físico	wygląd zewnętrzny	73	word	2022-04-05 20:43:50.479287
2448	atractivo	atrakcyjny	73	word	2022-04-05 20:43:50.479287
2449	guapo	przystojny, piękny	73	word	2022-04-05 20:43:50.479287
2450	la belleza	piękno	73	word	2022-04-05 20:43:50.479287
2451	la fealdad	brzydota	73	word	2022-04-05 20:43:50.479287
2452	el peinado	fryzura	73	word	2022-04-05 20:43:50.479287
2453	liso	prosty	73	word	2022-04-05 20:43:50.479287
2454	rizado	kręcony	73	word	2022-04-05 20:43:50.479287
2455	cano	siwy	73	word	2022-04-05 20:43:50.479287
2456	el rubio	blondyn	73	word	2022-04-05 20:43:50.479287
2457	el moreno	brunet	73	word	2022-04-05 20:43:50.479287
2458	el tipo	typ	73	word	2022-04-05 20:43:50.479287
2459	típico	typowy	73	word	2022-04-05 20:43:50.479287
2460	atípico	nietypowy	73	word	2022-04-05 20:43:50.479287
2461	la fábula	baśń	74	word	2022-04-05 20:44:39.112174
2462	fabuloso	baśniowy	74	word	2022-04-05 20:44:39.112174
2463	el caballero	rycerz	74	word	2022-04-05 20:44:39.112174
2464	el dragón	smok	74	word	2022-04-05 20:44:39.112174
2465	el monstruo	potwór	74	word	2022-04-05 20:44:39.112174
2466	monstruoso	potworny	74	word	2022-04-05 20:44:39.112174
2467	la espada	miecz	74	word	2022-04-05 20:44:39.112174
2468	hechizar	zaczarować	74	word	2022-04-05 20:44:39.112174
2469	la hechicería	czary, magia	74	word	2022-04-05 20:44:39.112174
2470	el hechicero	czarodziej	74	word	2022-04-05 20:44:39.112174
2471	la magia	magia	74	word	2022-04-05 20:44:39.112174
2472	mágico	magiczny	74	word	2022-04-05 20:44:39.112174
2473	aparecerse	zjawiać się, ukazywać się (c/zc)	74	word	2022-04-05 20:44:39.112174
2474	desaparecer	znikać (c/zc)	74	word	2022-04-05 20:44:39.112174
2475	el fantasma	duch	74	word	2022-04-05 20:44:39.112174
2476	existir	istnieć	74	word	2022-04-05 20:44:39.112174
2477	la existencia	istnienie, egzystencja	74	word	2022-04-05 20:44:39.112174
2478	el enano	krasnal, karzeł	74	word	2022-04-05 20:44:39.112174
2479	imaginarse	wyobrażać sobie	74	word	2022-04-05 20:44:39.112174
2480	la imaginación	wyobraźnia	74	word	2022-04-05 20:44:39.112174
2481	el secreto	tajemnica, sekret	74	word	2022-04-05 20:44:39.112174
2482	secreto	tajemny, sekretny	74	word	2022-04-05 20:44:39.112174
2483	el tesoro	skarb	74	word	2022-04-05 20:44:39.112174
2484	la voz	głos (mowa)	75	word	2022-04-05 20:45:39.277893
2485	sonar	brzmieć, dźwięczeć (o/ue)	75	word	2022-04-05 20:45:39.277893
2486	el sonido	brzmienie, dźwięk	75	word	2022-04-05 20:45:39.277893
2487	el timbre	dzwonek (u drzwi)	75	word	2022-04-05 20:45:39.277893
2488	la campana	dzwon	75	word	2022-04-05 20:45:39.277893
2489	la campanada	uderzenie dzwonu	75	word	2022-04-05 20:45:39.277893
2490	silbar	gwizdać	75	word	2022-04-05 20:45:39.277893
2491	el silbido	gwizd	75	word	2022-04-05 20:45:39.277893
2492	gritar	krzyczeć	75	word	2022-04-05 20:45:39.277893
2493	el grito	krzyk	75	word	2022-04-05 20:45:39.277893
2494	callar	milczeć	75	word	2022-04-05 20:45:39.277893
2495	callado	cichy, milczący	75	word	2022-04-05 20:45:39.277893
2496	el siglo	wiek, stulecie	75	word	2022-04-05 20:45:39.277893
2497	el milenio	tysiąclecie	75	word	2022-04-05 20:45:39.277893
2498	el día laborable	dzień roboczy	75	word	2022-04-05 20:45:39.277893
2499	festivo	świąteczny	75	word	2022-04-05 20:45:39.277893
2500	la Nochevieja	sylwester	75	word	2022-04-05 20:45:39.277893
2501	el aniversario	rocznica	75	word	2022-04-05 20:45:39.277893
2502	naranja	pomarańczowy	75	word	2022-04-05 20:45:39.277893
2503	rosa	różowy	75	word	2022-04-05 20:45:39.277893
2504	violeta	fioletowy	75	word	2022-04-05 20:45:39.277893
2505	brillar	błyszczeć, lśnić	75	word	2022-04-05 20:45:39.277893
2506	brillante	błyszczący, lśniący	75	word	2022-04-05 20:45:39.277893
2507	mate	matowy	75	word	2022-04-05 20:45:39.277893
2508	la bola	kula, kulka	75	word	2022-04-05 20:45:39.277893
2509	el ángulo	kąt	75	word	2022-04-05 20:45:39.277893
2510	el triángulo	trójkąt	75	word	2022-04-05 20:45:39.277893
2511	triangular	trójkątny	75	word	2022-04-05 20:45:39.277893
2512	el rectángulo	prostokąt	75	word	2022-04-05 20:45:39.277893
2513	rectangular	prostokątny	75	word	2022-04-05 20:45:39.277893
2514	la línea	linia	75	word	2022-04-05 20:45:39.277893
2515	vertical	pionowy	75	word	2022-04-05 20:45:39.277893
2516	el horizonte	horyzont	75	word	2022-04-05 20:45:39.277893
2517	horizontal	poziomy	75	word	2022-04-05 20:45:39.277893
2518	llano	płaski, równy	75	word	2022-04-05 20:45:39.277893
2519	el muchacho	chłopak	75	word	2022-04-05 20:45:39.277893
2520	la muchacha	dziewczyna	75	word	2022-04-05 20:45:39.277893
2521	ambos	obaj	75	word	2022-04-05 20:45:39.277893
2522	mismo	sam	75	word	2022-04-05 20:45:39.277893
2523	¿Sabes qué hora es?	Wiesz, która jest godzina?	36	sentence	2022-04-05 21:07:40.326245
2524	¿Hasta qué hora?	Do której godziny?	36	sentence	2022-04-05 21:11:21.522155
2525	Es la una	Jest pierwsza	36	sentence	2022-04-05 21:13:09.171079
2526	Son las nueve de la mañana	Jest dziewiąta rano	36	sentence	2022-04-05 21:13:29.138732
2527	Son las tres y cuarto	Jest kwadrans po trzeciej	36	sentence	2022-04-05 21:14:05.208987
2528	Son las tres y media	jest w pół do czwartej	36	sentence	2022-04-05 21:14:32.922162
2529	Son las cuatro menos veinte	Jest za dwadzieścia czwarta	36	sentence	2022-04-05 21:15:08.055576
2530	Son las tres de la madrugada	Jest trzecia w nocy	36	sentence	2022-04-05 21:15:43.122276
2531	¿A qué hora empieza la clase de informática?	O której godzinie zaczyna się lekcja informatyki?	36	sentence	2022-04-05 21:18:56.776694
2532	finalizar	zakończyć, zakończyć się	76	word	2022-04-07 20:38:11.66129
2533	nunca	kiedykolwiek (w wyrażeniach porównawczych)	76	word	2022-04-07 20:38:11.66129
2534	jamás	nigdy	76	word	2022-04-07 20:38:11.66129
2535	nunca jamás	przenigdy	76	word	2022-04-07 20:38:11.66129
2536	dentro de	w ciągu, za	76	word	2022-04-07 20:38:11.66129
2537	dentro de poco	wkrótce	76	word	2022-04-07 20:38:11.66129
2538	a partir de	od (w odniesieniu do czasu)	76	word	2022-04-07 20:38:11.66129
2539	de nuevo	znowu	76	word	2022-04-07 20:38:11.66129
2540	de antemano	uprzednio, z góry	76	word	2022-04-07 20:38:11.66129
2541	breve	krótki, zwięzły	76	word	2022-04-07 20:38:11.66129
2542	brevemente	krótko, zwięźle	76	word	2022-04-07 20:38:11.66129
2543	en breve	wkrótce, niebawem	76	word	2022-04-07 20:38:11.66129
2544	hace poco	niedawno	76	word	2022-04-07 20:38:11.66129
2545	entonces	wtedy	76	word	2022-04-07 20:38:11.66129
2546	desde entonces	odtąd, od tego czasu	76	word	2022-04-07 20:38:11.66129
2547	hoy en día	obecnie	76	word	2022-04-07 20:38:11.66129
2548	al mismo tiempo	jednocześnie	76	word	2022-04-07 20:38:11.66129
2549	el instante	chwila	76	word	2022-04-07 20:38:11.66129
2550	temporal	tymczasowy, chwilowy	76	word	2022-04-07 20:38:11.66129
2551	temporalmente	tymczasowo, chwilowo	76	word	2022-04-07 20:38:11.66129
2552	corriente	bieżący	76	word	2022-04-07 20:38:11.66129
2553	anterior	wcześniejszy, poprzedni	76	word	2022-04-07 20:38:11.66129
2554	la anterioridad	wyprzedzenie	76	word	2022-04-07 20:38:11.66129
2555	reciente	ostatni, niedawny	76	word	2022-04-07 20:38:11.66129
2556	recientemente	ostatnio, niedawno	76	word	2022-04-07 20:38:11.66129
2557	adelantarse	śpieszyć się (o zegarze)	76	word	2022-04-07 20:38:11.66129
2558	atrasar	opóźniać	76	word	2022-04-07 20:38:11.66129
2559	atrasado	opóźniony	76	word	2022-04-07 20:38:11.66129
2560	la exactitud	dokładność	76	word	2022-04-07 20:38:11.66129
2561	contemporáneo	współczesny	76	word	2022-04-07 20:38:11.66129
2562	la cifra	cyfra	77	word	2022-04-07 20:39:28.294037
2563	el centenar	setka	77	word	2022-04-07 20:39:28.294037
2564	el millar	tysiąc	77	word	2022-04-07 20:39:28.294037
2565	por lo menos	przynajmniej	77	word	2022-04-07 20:39:28.294037
2566	a lo sumo	najwyżej	77	word	2022-04-07 20:39:28.294037
2567	alrededor	około	77	word	2022-04-07 20:39:28.294037
2568	el total	suma	77	word	2022-04-07 20:39:28.294037
2569	total	całkowity, zupełny	77	word	2022-04-07 20:39:28.294037
2570	doble	podwójny	77	word	2022-04-07 20:39:28.294037
2571	triple	potrójny	77	word	2022-04-07 20:39:28.294037
2572	el barril	beczka	77	word	2022-04-07 20:39:28.294037
2573	el peso	waga	77	word	2022-04-07 20:39:28.294037
2574	la falta de peso	niedowaga	77	word	2022-04-07 20:39:28.294037
2575	el exceso	nadmiar	77	word	2022-04-07 20:39:28.294037
2576	el exceso de peso	nadwaga	77	word	2022-04-07 20:39:28.294037
2577	la medida	miara	77	word	2022-04-07 20:39:28.294037
2578	agrandar	zwiększać, powiększać	77	word	2022-04-07 20:39:28.294037
2579	agrandarse	zwiększać się, powiększać się	77	word	2022-04-07 20:39:28.294037
2580	el agrandamiento	zwiększenie, powiększenie	77	word	2022-04-07 20:39:28.294037
2581	reducir	zmniejszać (c/zc)	77	word	2022-04-07 20:39:28.294037
2582	la reducción	zmniejszenie	77	word	2022-04-07 20:39:28.294037
2583	la relación	stosunek	77	word	2022-04-07 20:39:28.294037
2584	relativamente	stosunkowo	77	word	2022-04-07 20:39:28.294037
2585	corresponder	odpowiadać, być zgodnym	77	word	2022-04-07 20:39:28.294037
2586	correspondiente	odpowiedni	77	word	2022-04-07 20:39:28.294037
2587	la extensión	zakres	77	word	2022-04-07 20:39:28.294037
2588	extenso	obszerny, rozległy	77	word	2022-04-07 20:39:28.294037
2589	la superficie	powierzchnia	77	word	2022-04-07 20:39:28.294037
2590	el promedio	przeciętna, średnia	77	word	2022-04-07 20:39:28.294037
2591	la cantidad	liczba, ilość	77	word	2022-04-07 20:39:28.294037
2592	caber	mieścić się (nr)	77	word	2022-04-07 20:39:28.294037
2593	la mitad	połowa	77	word	2022-04-07 20:39:28.294037
2594	acortar	skracać	77	word	2022-04-07 20:39:28.294037
2595	el acortamiento	skrócenie	77	word	2022-04-07 20:39:28.294037
2596	alargar	przedłużać, wydłużać	77	word	2022-04-07 20:39:28.294037
2597	el alargamiento	przedłużenie, wydłużenie	77	word	2022-04-07 20:39:28.294037
2598	la unidad	całość, jedność	77	word	2022-04-07 20:39:28.294037
2599	unitario	jednolity, jednakowy	77	word	2022-04-07 20:39:28.294037
2600	el equilibrio	równowaga	77	word	2022-04-07 20:39:28.294037
2601	la vivienda	mieszkanie	78	word	2022-04-07 20:40:11.219463
2602	el dueño	właściciel	78	word	2022-04-07 20:40:11.219463
2603	mudarse	wprowadzać się, wyprowadzać się	78	word	2022-04-07 20:40:11.219463
2604	instalarse	osiedlać się, urządzać się	78	word	2022-04-07 20:40:11.219463
2605	el desván	strych, poddasze	78	word	2022-04-07 20:40:11.219463
2606	el techo	dach	78	word	2022-04-07 20:40:11.219463
2607	el albañil	murarz	78	word	2022-04-07 20:40:11.219463
2608	la chimenea	komin, kominek	78	word	2022-04-07 20:40:11.219463
2609	la leña	drewno opałowe	78	word	2022-04-07 20:40:11.219463
2610	acogedor	przytulny	78	word	2022-04-07 20:40:11.219463
2611	la calefacción	ogrzewanie	78	word	2022-04-07 20:40:11.219463
2612	el espacio	przestrzeń, obszar	78	word	2022-04-07 20:40:11.219463
2613	espacioso	obszerny, przestrzenny	78	word	2022-04-07 20:40:11.219463
2614	el equipamiento	wyposażenie	78	word	2022-04-07 20:40:11.219463
2615	equipado	wyposażony, umeblowany	78	word	2022-04-07 20:40:11.219463
2616	la bañera	wanna	78	word	2022-04-07 20:40:11.219463
2617	el lavabo	umywalka	78	word	2022-04-07 20:40:11.219463
2618	el anaquel	półka	78	word	2022-04-07 20:40:11.219463
2619	el florero	wazon	78	word	2022-04-07 20:40:11.219463
2620	el vestíbulo	hol	78	word	2022-04-07 20:40:11.219463
2621	enorme	ogromny, olbrzymi	78	word	2022-04-07 20:40:11.219463
2622	chiquito	malutki, maleńki	78	word	2022-04-07 20:40:11.219463
2623	el corredor	korytarz	78	word	2022-04-07 20:40:11.219463
2624	iluminar	oświetlać	78	word	2022-04-07 20:40:11.219463
2625	la iluminación	oświetlenie	78	word	2022-04-07 20:40:11.219463
2626	el colchón	materac	78	word	2022-04-07 20:40:11.219463
2627	la manta	koc, kołdra	78	word	2022-04-07 20:40:11.219463
2628	la almohada	poduszka	78	word	2022-04-07 20:40:11.219463
2629	la sábana	prześcieradło	78	word	2022-04-07 20:40:11.219463
2630	el mantel	obrus	78	word	2022-04-07 20:40:11.219463
2631	los cubiertos	sztućce	78	word	2022-04-07 20:40:11.219463
2632	la jarra	dzban, dzbanek	78	word	2022-04-07 20:40:11.219463
2633	la copa	kieliszek	78	word	2022-04-07 20:40:11.219463
2634	tapar	przykrywać (pokrywką)	78	word	2022-04-07 20:40:11.219463
2635	la tapa	pokrywka, przykrywka	78	word	2022-04-07 20:40:11.219463
2636	guardar	przechowywać	78	word	2022-04-07 20:40:11.219463
2637	la tostada	tost	78	word	2022-04-07 20:40:11.219463
2638	el tostador	toster	78	word	2022-04-07 20:40:11.219463
2639	el microondas	kuchenka mikrofalowa	78	word	2022-04-07 20:40:11.219463
2640	los microondas	kuchenki mikrofalowe	78	word	2022-04-07 20:40:11.219463
2641	el lavaplatos	zmywarka	78	word	2022-04-07 20:40:11.219463
2642	los lavaplatos	zmywarki	78	word	2022-04-07 20:40:11.219463
2643	cotidiano	codzienny	78	word	2022-04-07 20:40:11.219463
2644	acostumbrarse	przyzwyczajać się	78	word	2022-04-07 20:40:11.219463
2645	doméstico	domowy (d)	78	word	2022-04-07 20:40:11.219463
2646	recoger	uprzątać, zbierać	78	word	2022-04-07 20:40:11.219463
2647	la asistenta	sprzątaczka (w domu)	78	word	2022-04-07 20:40:11.219463
2648	cuidadoso	uważny	78	word	2022-04-07 20:40:11.219463
2649	la escoba	miotła	78	word	2022-04-07 20:40:11.219463
2650	barrer	zmiatać	78	word	2022-04-07 20:40:11.219463
2651	el trapo	ścierka	78	word	2022-04-07 20:40:11.219463
2652	la especie	gatunek	79	word	2022-04-07 20:41:10.707633
2653	la raza	rasa	79	word	2022-04-07 20:41:10.707633
2654	la agresión	agresja	79	word	2022-04-07 20:41:10.707633
2655	agresivo	agresywny	79	word	2022-04-07 20:41:10.707633
2656	la garra	pazur	79	word	2022-04-07 20:41:10.707633
2657	arañar	drapać	79	word	2022-04-07 20:41:10.707633
2658	el arañazo	zadrapanie	79	word	2022-04-07 20:41:10.707633
2659	el carnero	baran	79	word	2022-04-07 20:41:10.707633
2660	la liebre	zając	79	word	2022-04-07 20:41:10.707633
2661	la pata	łapa, noga (u zwierzęcia)	79	word	2022-04-07 20:41:10.707633
2662	el gusano	robak	79	word	2022-04-07 20:41:10.707633
2663	la lombriz	dżdżownica	79	word	2022-04-07 20:41:10.707633
2664	la hormiga	mrówka	79	word	2022-04-07 20:41:10.707633
2665	el hormiguero	mrowisko	79	word	2022-04-07 20:41:10.707633
2666	el pavo	indyk	79	word	2022-04-07 20:41:10.707633
2667	el pavo real	paw	79	word	2022-04-07 20:41:10.707633
2668	la cigüeña	bocian	79	word	2022-04-07 20:41:10.707633
2669	la lechuza	sowa	79	word	2022-04-07 20:41:10.707633
2670	el loro	papuga	79	word	2022-04-07 20:41:10.707633
2671	la gaviota	mewa	79	word	2022-04-07 20:41:10.707633
2672	el cisne	łabędź	79	word	2022-04-07 20:41:10.707633
2673	el pingüino	pingwin	79	word	2022-04-07 20:41:10.707633
2674	el ala	skrzydło (rodzaj żeński)	79	word	2022-04-07 20:41:10.707633
2675	batir las alas	machać skrzydłami	79	word	2022-04-07 20:41:10.707633
2676	el murciélago	nietoperz	79	word	2022-04-07 20:41:10.707633
2677	picar	kąsać, kłuć	79	word	2022-04-07 20:41:10.707633
2678	la picadura	ukąszenie, ukłucie	79	word	2022-04-07 20:41:10.707633
2679	la avispa	osa	79	word	2022-04-07 20:41:10.707633
2680	el mosquito	komar	79	word	2022-04-07 20:41:10.707633
2681	la tortuga	żółw	79	word	2022-04-07 20:41:10.707633
2682	el hipopótamo	hipopotam	79	word	2022-04-07 20:41:10.707633
2683	el tiburón	rekin	79	word	2022-04-07 20:41:10.707633
2684	devorar	żreć, pożerać	79	word	2022-04-07 20:41:10.707633
2685	voraz	żarłoczny	79	word	2022-04-07 20:41:10.707633
2686	la ballena	wieloryb	79	word	2022-04-07 20:41:10.707633
2687	el salmón	łosoś	79	word	2022-04-07 20:41:10.707633
2688	la trucha	pstrąg	79	word	2022-04-07 20:41:10.707633
2689	municipal	miejski	80	word	2022-04-07 20:41:45.90087
2690	circular	być w ruchu, krążyć	80	word	2022-04-07 20:41:45.90087
2691	la circulación	ruch uliczny	80	word	2022-04-07 20:41:45.90087
2692	el atasco	zator, korek (uliczny)	80	word	2022-04-07 20:41:45.90087
2693	la hora punta	godziny szczytu	80	word	2022-04-07 20:41:45.90087
2694	atravesar	przechodzić (e/ie)	80	word	2022-04-07 20:41:45.90087
2695	la acera	chodnik	80	word	2022-04-07 20:41:45.90087
2696	el carril	pas ruchu	80	word	2022-04-07 20:41:45.90087
2697	la fuente	fontanna	80	word	2022-04-07 20:41:45.90087
2698	vigilar	strzec, czuwać	80	word	2022-04-07 20:41:45.90087
2699	la vigilancia	straż, czuwanie	80	word	2022-04-07 20:41:45.90087
2700	el vigilante	strażnik	80	word	2022-04-07 20:41:45.90087
2701	el chalé	dom (jednorodzinny), domek	80	word	2022-04-07 20:41:45.90087
2702	el chalé adosado	dom szeregowy	80	word	2022-04-07 20:41:45.90087
2703	la parcela	działka	80	word	2022-04-07 20:41:45.90087
2704	abundar	obfitować	80	word	2022-04-07 20:41:45.90087
2705	la abundancia	obfitość, dostatek	80	word	2022-04-07 20:41:45.90087
2706	abundante	obfity	80	word	2022-04-07 20:41:45.90087
2707	escasear	brakować, kończyć się	80	word	2022-04-07 20:41:45.90087
2708	la escasez	brak, niedobór	80	word	2022-04-07 20:41:45.90087
2709	escaso	rzadki, nieliczny	80	word	2022-04-07 20:41:45.90087
2710	cosechar	zbierać plon	80	word	2022-04-07 20:41:45.90087
2711	la cosecha	zbiory, żniwa	80	word	2022-04-07 20:41:45.90087
2712	el grano	ziarno	80	word	2022-04-07 20:41:45.90087
2713	el trigo	pszenica	80	word	2022-04-07 20:41:45.90087
2714	el ganado	bydło	80	word	2022-04-07 20:41:45.90087
2715	el estable	obora, stajnia	80	word	2022-04-07 20:41:45.90087
2716	la pala	łopata	80	word	2022-04-07 20:41:45.90087
2717	cavar	kopać	80	word	2022-04-07 20:41:45.90087
2718	la escalera	drabina	80	word	2022-04-07 20:41:45.90087
2719	plateado	srebrny (w kolorze srebra), srebrzysty	81	word	2022-04-07 20:42:48.073611
2720	dorado	złoty (w kolorze złota), złocisty	81	word	2022-04-07 20:42:48.073611
2721	burdeos	bordowy	81	word	2022-04-07 20:42:48.073611
2722	celeste	lazurowy, błękitny	81	word	2022-04-07 20:42:48.073611
2723	beige	beżowy	81	word	2022-04-07 20:42:48.073611
2724	el matiz	odcień	81	word	2022-04-07 20:42:48.073611
2725	el contraste	kontrast	81	word	2022-04-07 20:42:48.073611
2726	el óvalo	owal	81	word	2022-04-07 20:42:48.073611
2727	ovalado	owalny	81	word	2022-04-07 20:42:48.073611
2728	el cubo	sześcian	81	word	2022-04-07 20:42:48.073611
2729	el cubito de hielo	kostka lodu	81	word	2022-04-07 20:42:48.073611
2730	perpendicular	prostopadły	81	word	2022-04-07 20:42:48.073611
2731	paralelo	równoległy	81	word	2022-04-07 20:42:48.073611
2732	torcido	krzywy, przekrzywiony	81	word	2022-04-07 20:42:48.073611
2733	el tono	ton, dźwięk	81	word	2022-04-07 20:42:48.073611
2734	el tono de la voz	ton głosu	81	word	2022-04-07 20:42:48.073611
2735	sonoro	dźwięczny	81	word	2022-04-07 20:42:48.073611
2736	doblar	bić (o dzwonach)	81	word	2022-04-07 20:42:48.073611
2737	susurrar	szeptać	81	word	2022-04-07 20:42:48.073611
2738	el susurro	szept	81	word	2022-04-07 20:42:48.073611
2739	murmurar	szumieć, mamrotać	81	word	2022-04-07 20:42:48.073611
2740	roncar	chrapać	81	word	2022-04-07 20:42:48.073611
2741	el ronquido	chrapanie	81	word	2022-04-07 20:42:48.073611
2742	estallar	huczeć, wybuchać	81	word	2022-04-07 20:42:48.073611
2743	el estallido	huk, wybuch	81	word	2022-04-07 20:42:48.073611
2744	crujir	trzeszczeć, skrzypieć	81	word	2022-04-07 20:42:48.073611
2745	sisear	syczeć	81	word	2022-04-07 20:42:48.073611
2761	la indiferencia	obojętność, nieczułość	82	word	2022-04-07 20:45:10.006344
2762	indiferente	obojętny, nieczuły	82	word	2022-04-07 20:45:10.006344
2763	despreciar	lekceważyć, pogardzać	82	word	2022-04-07 20:45:10.006344
2764	el desprecio	lekceważenie, pogarda	82	word	2022-04-07 20:45:10.006344
2765	deprimir	przygnębiać	82	word	2022-04-07 20:45:10.006344
2766	deprimido	przygnębiony	82	word	2022-04-07 20:45:10.006344
2767	irritar	denerwować, irytować	82	word	2022-04-07 20:45:10.006344
2768	irritarse	denerwować się, irytować się	82	word	2022-04-07 20:45:10.006344
2769	la irritación	zdenerwowanie, irytacja	82	word	2022-04-07 20:45:10.006344
2770	la furia	furia, wściekłość	82	word	2022-04-07 20:45:10.006344
2771	furioso	wściekły	82	word	2022-04-07 20:45:10.006344
2772	la calma	spokój, cisza	82	word	2022-04-07 20:45:10.006344
2773	insultar	obrażać, znieważać	82	word	2022-04-07 20:45:10.006344
2774	el insulto	obelga, zniewaga	82	word	2022-04-07 20:45:10.006344
2775	aguantar	wytrzymywać	82	word	2022-04-07 20:45:10.006344
2776	vengarse	mścić się	82	word	2022-04-07 20:45:10.006344
2777	la venganza	zemsta	82	word	2022-04-07 20:45:10.006344
2778	vengativo	mściwy	82	word	2022-04-07 20:45:10.006344
2779	temer	bać się, lękać się	82	word	2022-04-07 20:45:10.006344
2780	el temor	strach, lęk	82	word	2022-04-07 20:45:10.006344
2781	tremendo	straszny, okropny	82	word	2022-04-07 20:45:10.006344
2782	avergonzarse	wstydzić się (o/üe)	82	word	2022-04-07 20:45:10.006344
2783	la vergüenza	wstyd	82	word	2022-04-07 20:45:10.006344
2784	embarazarse	zakłopotać się	82	word	2022-04-07 20:45:10.006344
2785	embarazoso	kłopotliwy	82	word	2022-04-07 20:45:10.006344
2786	la compasión	współczucie	82	word	2022-04-07 20:45:10.006344
2787	extrañar	zadziwiać, dziwić	82	word	2022-04-07 20:45:10.006344
2788	la extrañeza	zdziwienie	82	word	2022-04-07 20:45:10.006344
2789	extraño	dziwny	82	word	2022-04-07 20:45:10.006344
2790	entusiasmarse	zachwycać się	82	word	2022-04-07 20:45:10.006344
2791	el entusiasmo	zachwyt	82	word	2022-04-07 20:45:10.006344
2792	entusiasmado	zachwycony	82	word	2022-04-07 20:45:10.006344
2793	la satisfacción	zadowolenie	82	word	2022-04-07 20:45:10.006344
2794	satisfecho	zadowolony, rad	82	word	2022-04-07 20:45:10.006344
2795	la desgracia	nieszczęście, pech	82	word	2022-04-07 20:45:10.006344
2796	desgraciado	nieszczęśliwy, pechowy	82	word	2022-04-07 20:45:10.006344
2797	quejarse	narzekać, skarżyć się	82	word	2022-04-07 20:45:10.006344
2798	la queja	narzekanie, skarga	82	word	2022-04-07 20:45:10.006344
2799	desilusionar	rozczarować	82	word	2022-04-07 20:45:10.006344
2800	desilusionarse	rozczarować się	82	word	2022-04-07 20:45:10.006344
2801	la desilusión	rozczarowanie	82	word	2022-04-07 20:45:10.006344
2802	desilusionado	rozczarowany	82	word	2022-04-07 20:45:10.006344
2803	el destinatario	adresat	83	word	2022-04-07 20:47:16.440156
2804	el remitente	nadawca	83	word	2022-04-07 20:47:16.440156
2805	el código	kod	83	word	2022-04-07 20:47:16.440156
2806	el código postal	kod pocztowy	83	word	2022-04-07 20:47:16.440156
2807	el auricular	słuchawka	83	word	2022-04-07 20:47:16.440156
2808	el prefijo	numer kierunkowy	83	word	2022-04-07 20:47:16.440156
2809	informar	relacjonować	83	word	2022-04-07 20:47:16.440156
2810	el informe	relacja, sprawozdanie	83	word	2022-04-07 20:47:16.440156
2811	el hecho	fakt	83	word	2022-04-07 20:47:16.440156
2812	de hecho	faktycznie	83	word	2022-04-07 20:47:16.440156
2813	la redacción	redakcja	83	word	2022-04-07 20:47:16.440156
2814	el redactor	redaktor	83	word	2022-04-07 20:47:16.440156
2815	la línea	wiersz, linijka	83	word	2022-04-07 20:47:16.440156
2816	el titular	nagówek	83	word	2022-04-07 20:47:16.440156
2817	útil	użyteczny	83	word	2022-04-07 20:47:16.440156
2818	inútil	nieużyteczny	83	word	2022-04-07 20:47:16.440156
2819	la pantalla	ekran	83	word	2022-04-07 20:47:16.440156
2820	apretar	naciskać, uciskać (e/ie)	83	word	2022-04-07 20:47:16.440156
2821	la tecla	klawisz	83	word	2022-04-07 20:47:16.440156
2822	almacenar	zapisywać, zachowywać	83	word	2022-04-07 20:47:16.440156
2823	borrar	kasować, usuwać	83	word	2022-04-07 20:47:16.440156
2824	grabar	nagrywać	83	word	2022-04-07 20:47:16.440156
2825	la grabación	nagranie	83	word	2022-04-07 20:47:16.440156
2826	la grabadora	magnetofon	83	word	2022-04-07 20:47:16.440156
2827	la carpintería	zakład stolarski	84	word	2022-04-07 20:47:55.038796
2828	el carpintero	stolarz	84	word	2022-04-07 20:47:55.038796
2829	el fontanero	hydraulik	84	word	2022-04-07 20:47:55.038796
2830	la tintorería	pralnia	84	word	2022-04-07 20:47:55.038796
2831	el estanco	kiosk z tytoniem	84	word	2022-04-07 20:47:55.038796
2832	la pipa	fajka	84	word	2022-04-07 20:47:55.038796
2833	la papelería	sklep papierniczy	84	word	2022-04-07 20:47:55.038796
2834	la juguetería	sklep z zabawkami	84	word	2022-04-07 20:47:55.038796
2835	la sección	dział, sekcja	84	word	2022-04-07 20:47:55.038796
2836	la mercancía	towar	84	word	2022-04-07 20:47:55.038796
2837	la oferta	oferta (korzystna)	84	word	2022-04-07 20:47:55.038796
2838	favorable	korzystny, preferencyjny	84	word	2022-04-07 20:47:55.038796
2839	desfavorable	niekorzystny	84	word	2022-04-07 20:47:55.038796
2840	la cola	kolejka	84	word	2022-04-07 20:47:55.038796
2841	el vistazo	spojrzenie	84	word	2022-04-07 20:47:55.038796
2842	consultar	radzić się, zasięgać opinii	84	word	2022-04-07 20:47:55.038796
2843	la consulta	porada, opinia	84	word	2022-04-07 20:47:55.038796
2844	escoger	wybierać	84	word	2022-04-07 20:47:55.038796
2845	adquirir	nabywać, zdobywać (i/ie)	84	word	2022-04-07 20:47:55.038796
2846	la adquisición	nabycie, nabytek	84	word	2022-04-07 20:47:55.038796
2847	embalar	opakowywać	84	word	2022-04-07 20:47:55.038796
2848	el embalaje	opakowanie	84	word	2022-04-07 20:47:55.038796
2849	garantizar	gwarantować	84	word	2022-04-07 20:47:55.038796
2850	la garantía	gwarancja	84	word	2022-04-07 20:47:55.038796
2851	la calidad	jakość	84	word	2022-04-07 20:47:55.038796
2852	el defecto	wada	84	word	2022-04-07 20:47:55.038796
2853	defectuoso	wadliwy	84	word	2022-04-07 20:47:55.038796
2854	reclamar	reklamować (zgłaszać reklamację)	84	word	2022-04-07 20:47:55.038796
2855	la reclamación	reklamacja	84	word	2022-04-07 20:47:55.038796
2856	pertenecer	należeć (c/zc)	85	word	2022-04-07 20:48:30.506113
2857	el pincel	pędzel	85	word	2022-04-07 20:48:30.506113
2858	pegar	kleić	85	word	2022-04-07 20:48:30.506113
2859	el pegamento	klej	85	word	2022-04-07 20:48:30.506113
2860	resistente	trwały, wytrzymały	85	word	2022-04-07 20:48:30.506113
2861	sujetar	przymocowywać, przytwierdzać	85	word	2022-04-07 20:48:30.506113
2862	extender	rozciągać (e/ie)	85	word	2022-04-07 20:48:30.506113
2863	extenderse	rozciągać się (e/ie)	85	word	2022-04-07 20:48:30.506113
2864	la cuerda	sznur, lina	85	word	2022-04-07 20:48:30.506113
2865	la correa	pasek, smycz	85	word	2022-04-07 20:48:30.506113
2866	atar	wiązać, krępować	85	word	2022-04-07 20:48:30.506113
2867	desatar	rozwiązywać	85	word	2022-04-07 20:48:30.506113
2868	soltar	rozluźniać, rozwiązywać (o/ue)	85	word	2022-04-07 20:48:30.506113
2869	separar	rozdzielać	85	word	2022-04-07 20:48:30.506113
2870	separable	rozdzielny	85	word	2022-04-07 20:48:30.506113
2871	inseparable	nierozdzielny	85	word	2022-04-07 20:48:30.506113
2872	el utensilio	przyrząd, narzędzie	85	word	2022-04-07 20:48:30.506113
2873	utilizar	używać	85	word	2022-04-07 20:48:30.506113
2874	útil	użyteczny	85	word	2022-04-07 20:48:30.506113
2875	inútil	bezużyteczny	85	word	2022-04-07 20:48:30.506113
2876	el hacha	siekiera (rodzaj żeński)	85	word	2022-04-07 20:48:30.506113
2877	el martillo	młotek	85	word	2022-04-07 20:48:30.506113
2878	clavar	wbijać (gwóźdź, pinezkę)	85	word	2022-04-07 20:48:30.506113
2879	el clavo	gwóźdź	85	word	2022-04-07 20:48:30.506113
2880	el tornillo	śruba	85	word	2022-04-07 20:48:30.506113
2881	el destornillador	śrubokręt	85	word	2022-04-07 20:48:30.506113
2882	girar	kręcić, obracać	85	word	2022-04-07 20:48:30.506113
2883	girarse	kręcić się, obracać się	85	word	2022-04-07 20:48:30.506113
2884	instalar	instalować	85	word	2022-04-07 20:48:30.506113
2885	la instalación	instalacja	85	word	2022-04-07 20:48:30.506113
2886	el enchufe	kontakt (gniazdko)	85	word	2022-04-07 20:48:30.506113
2887	la bombilla	żarówka	85	word	2022-04-07 20:48:30.506113
2888	la linterna	latarka	85	word	2022-04-07 20:48:30.506113
2889	conservar	zachowywać, trzymać	85	word	2022-04-07 20:48:30.506113
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

