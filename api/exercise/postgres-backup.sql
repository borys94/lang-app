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
-- Name: exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise (
    exercise_id integer NOT NULL,
    name text NOT NULL,
    lang character varying(100) NOT NULL,
    level character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.exercise OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercise_id_seq OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercise_id_seq OWNED BY public.exercise.exercise_id;


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
-- Name: sub_exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_exercise (
    sub_exercise_id integer NOT NULL,
    exercise_id integer NOT NULL,
    title character varying(500) NOT NULL,
    text text NOT NULL,
    answers character varying(200)[] NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sub_exercise OWNER TO postgres;

--
-- Name: sub_exercise_sub_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_exercise_sub_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_exercise_sub_exercise_id_seq OWNER TO postgres;

--
-- Name: sub_exercise_sub_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_exercise_sub_exercise_id_seq OWNED BY public.sub_exercise.sub_exercise_id;


--
-- Name: user_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_results (
    user_result_id integer NOT NULL,
    sub_exercise_id integer NOT NULL,
    user_id integer NOT NULL,
    points integer NOT NULL,
    max_points integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_results OWNER TO postgres;

--
-- Name: user_results_user_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_results_user_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_results_user_result_id_seq OWNER TO postgres;

--
-- Name: user_results_user_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_results_user_result_id_seq OWNED BY public.user_results.user_result_id;


--
-- Name: exercise exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise ALTER COLUMN exercise_id SET DEFAULT nextval('public.exercise_exercise_id_seq'::regclass);


--
-- Name: sub_exercise sub_exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_exercise ALTER COLUMN sub_exercise_id SET DEFAULT nextval('public.sub_exercise_sub_exercise_id_seq'::regclass);


--
-- Name: user_results user_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_results ALTER COLUMN user_result_id SET DEFAULT nextval('public.user_results_user_result_id_seq'::regclass);


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise (exercise_id, name, lang, level, created_at) FROM stdin;
1	<p>Conditional Simple</p>	Spanish	B1	2022-04-14 22:12:41.02079
2	El futuro	Spanish	B1	2022-04-15 08:04:39.508381
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, file, created_at) FROM stdin;
adcad675-d5e7-4315-a0cc-65a50ed31af0	0000-init_migrations.sql	2022-04-14 22:11:56.789382
2c757836-7ac2-4f3f-af8a-aad6a4e09fbe	0001-add_exercise_tables.sql	2022-04-14 22:11:56.789382
\.


--
-- Data for Name: sub_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_exercise (sub_exercise_id, exercise_id, title, text, answers, created_at) FROM stdin;
1	1	CONDICIONAL SIMPLE (VERBOS IRREGULARES)	<ol><li>¿Qué le (decir) _ el jefe a Corina?&nbsp;</li><li>José (querer) _ hacer lo mismo que hace su hermano.&nbsp;</li><li>En otra época esa casa (valer) _ mucho menos.&nbsp;</li><li>A mi fiesta (venir) _ más gente que a la tuya.&nbsp;</li><li>En ese autobús no (caber) _ todos nosotros.&nbsp;</li><li>Yo creo que tu hermana menor (saber) _ más de historia que tú.&nbsp;</li><li>¿Tu (salir) _ con ese chico?&nbsp;</li><li>Yo en tu lugar (ponerse) _ el vestido azul.&nbsp;</li><li>¿Tu (poder) _ ayudarme con esta tarea?&nbsp;</li><li>¿Tu (tener) _ tiempo de venir estar noche?&nbsp;</li><li>Yo que tú (hacer) _ más pasteles. Recuerda que son 10 niños invitados.</li></ol>	{diría,querría,valdría,vendría,cabríamos,sabría,saldrías,"me pondría",podrías,tendrías,haría}	2022-04-14 22:15:24.668485
2	2	B1: EL FUTURO IMPERFECTO (1)	<p>Poner la forma correcta del futuro.</p><p><strong>El año que viene:</strong></p><p>El año que viene todo (ser) _ diferente. Yo (dejar) _ de fumar y (adelgazar) _ 10 kg. (Hacer) _ deporte todos los días y (comer) _ más frutas y verduras. (Beber) _ menos café y cerveza y no (estar) _ muchas horas sentado enfrente de la televisión. No (gastar) _ tanto dinero en videojuegos y tabaco. Mi vida (ser) _ más activa, llamaré por teléfono a mis amigos para quedar con ellos cada fin de semana. Nosotros (salir) _ juntos los viernes y (ver) _ buenas películas. (Hacer) _ un curso de salsa y tango para poder bailar bien, así (poder) _ conocer una chica guapa de América Latina. Pero antes (empezar) _ a estudiar español intensamente. (Aprender) _ 5 palabras nuevas cada día y (pasar) _ mis vacaciones en México. No (trabajar) _ tanto y me (ocupar) _ más de mi familia. ¡Sí, el año que viene todo (ser) _ diferente!</p>	{será,dejaré,adelgazaré,Haré,comeré,Beberé,estaré,gastaré,será,saldremos,veremos,Haré,podré,empezaré,Aprenderé,pasaré,trabajaré,ocuparé,será}	2022-04-15 08:07:15.029566
3	2	B1: EL FUTURO IMPERFECTO (2)	<p>Poner las formas correctas del futuro de los verbos entre paréntesis:</p><p>Córdoba te gustará:</p><p>Tú oyes en el tren una conversación entre una chica española y una alemana. La alemana va de "au pair" a Córdoba y no está muy segura... A ver lo que dice la chica española. Mujer, ya (ver) _ que te (gustar) _ muchísimo. Primero, claro, te (costar) _ un poco por el idioma, y (tener) _ que acostumbrarte a las comidas y al estilo de vida. Pero ya (comprobar) _ que Córdoba es una ciudad alegre con una vida enorme, y además, como todavía (estar) _ en primavera allí (disfrutar) _ del buen tiempo, ¡qué suerte! Hay gente que va de todas partes a Córdoba sólo para disfrutar del clima y tú lo (tener) _ allí mismo... Pero es una ciudad estupenda, muy alegre, y la gente es muy abierta, y si tienes suerte con la familia y los niños ya no (querer) _ regresar a casa. Seguro que (aprender) _ el idioma muy rápido y (conocer) _ a muchos chicos. (Divertirse) Te _ hablando con ellos. Además (poder) _ ir a otras ciudades cerca de Valencia. Creo que lo (pasar) _ muy bien y nunca (olvidar) _ esta experiencia. ¡Luego (alegrarse) te _ de haber ido!</p>	{verás,gustará,costará,tendrás,comprobarás,estarás,disfrutar,tendrás,querrás,aprenderás,conocerás,divertirás,podrás,pasarás,olvidarás,alegrarás}	2022-04-15 08:17:23.364779
4	2	B1: EL FUTURO IMPERFECTO (3)	<p>Poner las formas correctas del futuro de los verbos entre paréntesis:</p><ol><li>Si consigue ese trabajo, (ganar) _ más dinero.</li><li>Si estoy enfermo, (ir) _ al médico.</li><li>Si vais en tren, (conocer) _ muchos lugares.</li><li>Si llora el bebé, (dar) nosotros le _ el biberón.</li><li>Si te sientes solo, (llamar) te _ por teléfono.</li><li>Si visita ese museo, (ver) _ muchos cuadros famosos.</li><li>Si vamos al cine Rex, (ver) _ una buena película.</li><li>Si vas siempre a clase, (aprender) _ más.</li><li>Si hace más deporte, (adelgazar) _</li><li>Si estudiáis mucho, (aprobar) _ el examen.</li></ol>	{ganará,iré,conoceréis,daremos,llamaré,verá,veremos,aprenderás,adelgazará,aprobaréis}	2022-04-15 08:20:25.844716
\.


--
-- Data for Name: user_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_results (user_result_id, sub_exercise_id, user_id, points, max_points, created_at) FROM stdin;
\.


--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercise_id_seq', 2, true);


--
-- Name: sub_exercise_sub_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_exercise_sub_exercise_id_seq', 4, true);


--
-- Name: user_results_user_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_results_user_result_id_seq', 1, false);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: sub_exercise sub_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_exercise
    ADD CONSTRAINT sub_exercise_pkey PRIMARY KEY (sub_exercise_id);


--
-- Name: user_results user_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_results
    ADD CONSTRAINT user_results_pkey PRIMARY KEY (user_result_id);


--
-- PostgreSQL database dump complete
--

