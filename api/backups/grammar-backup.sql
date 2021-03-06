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
-- Name: examples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examples (
    example_id integer NOT NULL,
    value text NOT NULL,
    translated text NOT NULL,
    grammar_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.examples OWNER TO postgres;

--
-- Name: examples_example_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.examples_example_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examples_example_id_seq OWNER TO postgres;

--
-- Name: examples_example_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.examples_example_id_seq OWNED BY public.examples.example_id;


--
-- Name: exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise (
    exercise_id integer NOT NULL,
    grammar_id integer NOT NULL,
    name character varying(500) NOT NULL,
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
-- Name: grammar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grammar (
    grammar_id integer NOT NULL,
    name character varying(100) NOT NULL,
    lang character varying(100) NOT NULL,
    level character varying(100) NOT NULL,
    value text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.grammar OWNER TO postgres;

--
-- Name: grammar_grammar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grammar_grammar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grammar_grammar_id_seq OWNER TO postgres;

--
-- Name: grammar_grammar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grammar_grammar_id_seq OWNED BY public.grammar.grammar_id;


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
    value text NOT NULL,
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
-- Name: examples example_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples ALTER COLUMN example_id SET DEFAULT nextval('public.examples_example_id_seq'::regclass);


--
-- Name: exercise exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise ALTER COLUMN exercise_id SET DEFAULT nextval('public.exercise_exercise_id_seq'::regclass);


--
-- Name: grammar grammar_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grammar ALTER COLUMN grammar_id SET DEFAULT nextval('public.grammar_grammar_id_seq'::regclass);


--
-- Name: sub_exercise sub_exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_exercise ALTER COLUMN sub_exercise_id SET DEFAULT nextval('public.sub_exercise_sub_exercise_id_seq'::regclass);


--
-- Data for Name: examples; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.examples (example_id, value, translated, grammar_id, created_at) FROM stdin;
1	value	translated	1	2022-04-06 20:50:47.430738
2	Tengo que dec??rtelo	Musz?? ci to powiedzie??	5	2022-04-07 18:01:05.133151
3	No tengo que hacer nada	Nie musz?? nic robi??	5	2022-04-07 18:01:39.26124
4	??No me digas que tienes que volver a casa!	Nie m??w mi, ??e musisz wraca?? do domu!	5	2022-04-07 18:03:30.089483
5	??No me toques!	Nie dotykaj mnie!	17	2022-04-08 13:15:58.347418
6	??No me toques con las manos sucias!	Nie dotykaj mnie brudnymi rekami!	17	2022-04-08 13:16:55.956873
7	??Mira c??mo toca la flauta mi hijo!	Zobacz jak m??j syn gra na flecie!	17	2022-04-08 13:23:07.713586
8	Toca la canci??n que has aprendido en el cole	Zagraj piosenk??, kt??r?? nauczy??e?? si?? w szkole	17	2022-04-08 13:24:50.262142
9	Toca la otra canci??n	Zagraj inna piosenk??	17	2022-04-08 13:25:45.185262
10	??Sabes tocar alg??n instrumento?	Potrafisz gra?? na jakim?? instrumencie?	17	2022-04-08 13:28:06.847326
11	??Me ha tocado la loter??a!	Wygra??em na loterii	17	2022-04-08 13:31:12.431436
12	??Cu??nto te ha tocado?	Ile wygra??e???	17	2022-04-08 13:32:30.508367
13	A ti te toca limpiar el ba??o.	Twoja kolej na sprz??tanie ??azienki	17	2022-04-08 15:59:03.873664
14	??Toca la puerta! A ver si est??n dentro	Zapukaj do drzwi! Zobaczmy czy s?? w ??rodku	17	2022-04-08 16:01:59.145063
15	Toca el timbre	Zadzwo?? do drzwi	17	2022-04-08 16:02:49.734197
16	Ahora te toca a ti	Teraz jest twoja kolej	17	2022-04-08 16:04:56.025402
17	En este momento estoy leyendo	W tej chwili czytam	14	2022-04-09 18:56:33.545929
18	??Qu?? est??is haciendo?	Co robicie?	14	2022-04-09 19:00:26.745801
19	??Qu?? pel??cula est??s viendo?	Jaki film ogl??dasz?	14	2022-04-09 19:07:48.9059
20	??Mar??, en qu?? est??s pensando?	Mari, o czym my??lisz?	14	2022-04-09 19:09:09.890143
21	??Qu?? has dicho?	Co powiedzia??e???	15	2022-04-09 19:54:57.392568
22	Me he roto la pierna	Z??ama??em nog??	15	2022-04-09 19:55:21.712681
23	Ya he vuelto del trabajo	Ju?? wr??ci??em z pracy	15	2022-04-09 19:55:44.941352
\.


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise (exercise_id, grammar_id, name, created_at) FROM stdin;
1	19	test	2022-04-09 21:21:04.388827
2	19	Complete con un, una, unos, unas cuando sea necesario	2022-04-09 21:28:22.591948
3	19	Complete con un, una, unos, unas cuando sea necesario	2022-04-09 23:12:59.379838
4	20	Rodee la forma corecta	2022-04-10 07:49:10.35108
5	20	Ponga el, la, los, las donde sea necesario y escriba frases completas.	2022-04-10 08:28:36.555443
6	20	Complete con el, la, los, las o un, una, unos, unas.	2022-04-10 09:00:33.295233
7	20	Rodee la forma correcta.	2022-04-10 10:03:28.296153
8	20	Complete con al, del o a El, de El	2022-04-10 10:08:09.975386
9	21	Complete con el, la, los, las y los adjetivos entre par??ntesis.	2022-04-10 10:43:23.154413
10	22	Complete con un, una, unos, unos o el, lo, los, las. Utilice al o del cuando sea necesario.	2022-04-11 14:37:04.260063
11	22	Complete con la forma correcta del art??culo.	2022-04-11 14:55:32.088033
12	22	Complete con la forma correcta del art??culo.	2022-04-11 14:59:21.442814
13	22	Escriba las respuestas con uno, una, unos, unas, el, la, los, las y de en caso necesario y las palabras entre par??ntesis en la forma correcta.	2022-04-11 15:00:11.503716
14	23	Complete con una forma del art??culo definido cuando sea necesario.	2022-04-12 19:24:38.887778
15	23	Complete con una forma del, articulo definido cuando sea necesario.	2022-04-12 20:01:33.105747
16	23	Complete con una forma del articulo definido cuando sea necesario.	2022-04-12 20:39:47.452506
17	24	Complete con el articulo definido cuando sea necesario.	2022-04-13 09:27:37.704377
18	24	Responda a las preguntas con las palabras entre par??ntesis.	2022-04-13 09:41:32.409161
19	24	Responda a las preguntas con la informaci??n dada.	2022-04-13 14:13:50.234934
20	24	Complete con a, de, por y el articulo definido cuando sea necesario.	2022-04-13 14:21:29.931649
21	25	<p>Escribir la forma correcta del indefinido o imperfecto seg??n convenga:</p>	2022-04-13 15:14:18.867032
22	25	Una vacaciones inolvidables	2022-04-13 16:43:07.318005
24	25	Cuando era ni??a	2022-04-13 16:48:57.478438
23	25	Poner la forma correcta del indefinido o imperfecto seg??n convenga	2022-04-13 16:47:24.101298
25	26	<p>PONER LAS FORMAS DEL SUBJUNTIVO PRESENTE DE LOS VERBOS ENTRE PAR??NTESIS</p>	2022-04-13 18:12:08.956963
26	26	Turismo ecol??gico:	2022-04-13 18:14:45.732352
27	26	<p>test</p>	2022-04-13 18:17:45.767219
28	26	UN NUEVO PISO	2022-04-13 18:20:15.92756
29	26	EDUCACI??N ESTRICTA	2022-04-13 18:23:40.458791
30	26	??T?? O USTED?	2022-04-13 18:26:06.054316
31	27	<p>test</p>	2022-04-13 18:46:31.694782
32	25	<p>test</p>	2022-04-14 07:56:31.849186
33	28	<p>Complete con el art??culo definido cuando sea necesario.</p>	2022-04-14 14:33:41.731993
34	28	<p>Complete con el, la, los, las o un, una.</p>	2022-04-14 14:39:50.604361
35	28	<p>Complete con el art??culo definido cuando sea necesario.</p>	2022-04-15 09:01:53.619792
36	29	<p>Compete con el adjetivo en La forma correcta.</p>	2022-04-15 10:22:05.488419
37	29	<p>Vuelva a escribir las frases con el comparativo de igualdad y los adjetivos del recuadro en la forma correcta. (alto, amable, grande, inteligente, joven (2), simpatico, trabajador)</p>	2022-04-15 10:55:04.511936
38	31	Complete con un/uno, una, unos, unas y de en caso necesario.	2022-04-17 19:09:06.550448
39	31	<p>Sustituya lo subrayado por una frase con otro, otro, otros, otras.</p>	2022-04-17 19:16:28.360322
40	31	<p>Complete las frases con otro, otra, otros, otras y de en caso necesario.</p>	2022-04-17 19:40:03.443623
41	32	<p>Complete con cada, cada uno, cada uno de o cada una de.</p>	2022-04-17 20:40:08.056952
42	32	<p>Complete con todos, todas, uno, una, o cada uno, cada uno.</p>	2022-04-17 20:45:21.224906
43	32	<p>Complete con cualquier, cualquiera o cualquiera de.</p>	2022-04-17 20:50:43.799702
44	32	<p>Complete con un, uno, una y cualquiera, y la palabra entre par??ntesis donde la haya.</p>	2022-04-17 21:00:21.602218
45	33	<p>Complete con alguien, algo, nadie o nada y el adjetivo entre par??ntesis donde lo haya.</p>	2022-04-19 18:25:36.788114
46	33	<p>Complete con alguien o nadie. Utilice de en caso necesario.</p>	2022-04-19 18:30:27.162806
47	33	<p>Vuelva a escribir las frases.</p>	2022-04-19 18:33:14.857915
48	33	<p>Complete seg??n la clave siguiente y con las palabras entre par??ntesis en la forma adecuada. Use de cuando sea necesario.<br>(+): alguien, algo, alg??n/alguno/alguna/algunos/algunas (-): nadie, nada, ning??n/ninguno/ninguna</p>	2022-04-19 18:37:53.062712
49	33	<p>Complete con alguien, algo, nadie o nada, alguno y m??s en caso necesario.</p>	2022-04-19 18:46:40.860851
50	34	<p>Vuelva a escribir las frases con m??s o menos en el lugar adecuado.</p>	2022-04-24 16:52:48.793535
51	34	<p>Complete con m??s, menos y las cantidades entre par??ntesis donde las haya.</p>	2022-04-24 16:58:43.838819
52	34	<p>Complete con m??s, m??s de, menos y menos de.</p>	2022-04-24 17:05:17.99942
53	34	<p>Escriba comparaciones con las palabras dadas.</p>	2022-04-24 17:10:34.247142
54	34	<p>Complete con tanto/a/os/os.</p>	2022-04-24 17:17:57.355346
\.


--
-- Data for Name: grammar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grammar (grammar_id, name, lang, level, value, created_at) FROM stdin;
1	test	Spanish	A2	<p>test text</p>	2022-04-06 20:30:36.548803
2	Czas tera??niejszy ed	Spanish	A1	<figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>hablar</strong></td><td><strong>beber</strong></td><td><strong>vivir</strong></td></tr><tr><td><strong>yo</strong></td><td>hablo</td><td>bebo</td><td>vivo</td></tr><tr><td><strong>t??</strong></td><td>hablas</td><td>bebes</td><td>vives</td></tr><tr><td><strong>??l</strong></td><td>habla</td><td>bebe</td><td>vive</td></tr><tr><td><strong>nosotros</strong></td><td>hablamos</td><td>bebemos</td><td>vivimos</td></tr><tr><td><strong>vosotros</strong></td><td>habl??is</td><td>beb??is</td><td>viv??s</td></tr><tr><td><strong>ellos</strong></td><td>hablan</td><td>beben</td><td>viven</td></tr></tbody></table></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>	2022-04-06 21:07:48.688944
3	Czas tera??niejszy	Spanish	A1	<figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>hablar</strong></td><td><strong>beber</strong></td><td><strong>vivir</strong></td></tr><tr><td><strong>yo</strong></td><td>hablo</td><td>bebo</td><td>vivo</td></tr><tr><td><strong>t??</strong></td><td>hablas</td><td>bebes</td><td>vives</td></tr><tr><td><strong>??l</strong></td><td>habla</td><td>bebe</td><td>vive</td></tr><tr><td><strong>nosotros</strong></td><td>hablamos</td><td>bebemos</td><td>vivimos</td></tr><tr><td><strong>vosotros</strong></td><td>habl??is</td><td>beb??is</td><td>viv??s</td></tr><tr><td><strong>ellos</strong></td><td>hablan</td><td>beben</td><td>viven</td></tr></tbody></table></figure><ul><li>Gdy mowa jest o faktach, stanach niezmiennych lub prawdach og??lnych. S??u??y tak??e do podawania definicji i informacji np:<ul><li><strong>Yo soy espa??ol</strong></li><li><strong>El sol da luz y calor</strong></li><li><strong>Los tigres viven en Asia</strong></li></ul></li><li>Gdy mowa jest o pewnych przyzwyczajeniach, nawykach lub czynno??ciach powtarzaj??cych si??:<ul><li><strong>Siempre como a mediod??a</strong></li><li><strong>En Polonia mucha gente va a la iglesia</strong></li><li><strong>Cada noche leo libros hasta dos horas</strong></li></ul></li><li>Gdy udzielamy instrukcji lub pouczenia<ul><li><strong>Hierves el agua y echas la pasta</strong></li><li><strong>Pasas la aspiradora y despu??s sacas la basura</strong></li><li><strong>Si tienes hambre, abres la nevera y te haces un bocadillo</strong></li></ul></li><li>Gdy opisujemy czynno????, kt??ra ma miejsce dok??adnie w momencie trwania wypowiedzi<ul><li><strong>??Qu?? hago? Leo una revista</strong></li><li><strong>??No me molestes! ??No ves que trabajo?</strong></li><li><strong>En este momento se ducha</strong></li></ul></li></ul><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>	2022-04-06 21:23:43.695779
4	Czas tera??niejszy - czasowniki nieregularne	Spanish	A1	<p>TODO</p>	2022-04-07 09:20:35.139323
7	Estar i Haber	Spanish	A1	<p>TODO</p>	2022-04-07 09:21:46.169833
8	Liczebniki	Spanish	A1	<p>TODO</p>	2022-04-07 09:22:53.820687
9	Zaimki dzier??awcze	Spanish	A1	<p>TODO</p>	2022-04-07 09:23:46.905281
10	Stopniowanie przymiotnika	Spanish	A1	<p>TODO</p>	2022-04-07 09:24:13.085374
11	Przyimki miejsca	Spanish	A1	<p>TODO</p>	2022-04-07 09:24:40.935006
12	Okre??lanie godziny	Spanish	A1	<p>TODO</p>	2022-04-07 09:25:24.341055
13	Zaimki pytaj??ce	Spanish	A1	<p>TODO</p>	2022-04-07 09:26:33.249773
5	Tener	Spanish	A1	<figure class="table"><table><tbody><tr><td><strong>yo</strong></td><td>tengo</td><td><strong>nosotros</strong></td><td>tenemos</td></tr><tr><td><strong>t??</strong></td><td>tienes</td><td><strong>vosotros</strong></td><td>ten??is</td></tr><tr><td><strong>??l</strong></td><td>tiene</td><td><strong>ello</strong></td><td>tienen</td></tr></tbody></table></figure><p>Czasownik tener wyst??puje w wielu zwrotach, na przyklad:</p><ul><li><strong>tener calor</strong> (czu?? ciep??o)</li><li><strong>tener fr??o</strong> (czu?? zimno)</li><li><strong>tener hambre</strong> (by?? g??odnym)</li><li><strong>tener miedo</strong> (ba?? si??)</li><li><strong>tener prisa</strong> (??pieszy?? si??)</li><li><strong>tener que ver</strong> (mie?? co?? wsp??lnego)</li><li><strong>tener sed</strong> (by?? spragnionym)</li><li><strong>tener sue??o</strong> (by?? ??pi??cym)</li></ul>	2022-04-07 09:21:31.403965
16	Sacar	Spanish	B1	<p>Znaczenia:</p><ul><li>Poner algo fuera del lugar donde estaba</li><li>Hacer (con habilidad o fuerza) que alguien diga o d?? algo</li><li>Sacar un foto (hacer, echar, tomar)</li><li>Sacar (a alguien) de quicio</li><li>Sacar buenas/malas notas</li></ul>	2022-04-08 07:21:58.205651
6	Ser i Estar	Spanish	A1	<h3>Ser</h3><figure class="table"><table><tbody><tr><td>yo</td><td>soy</td></tr><tr><td>t??</td><td>eres</td></tr><tr><td>??l</td><td>es</td></tr><tr><td>nosotros</td><td>somos</td></tr><tr><td>vosotros</td><td>sois</td></tr><tr><td>ellos</td><td>son</td></tr></tbody></table></figure><p>Czasownik <strong>ser</strong> u??ywany jest przede wszystkim do opisywania cech i stan??w niezmiennych</p><p>Gdy okre??lamy cechy charakteru i w??a??ciwo??ci, na przyk??ad:</p><ul><li><strong>Somos ricos</strong> - Jeste??my bogaci</li><li><strong>Eres alegre</strong> - Jeste?? weso??y (z natury)</li><li><strong>Son tranquilos</strong> - S?? spokojni. (Cecha charakteru)</li><li><strong>Somos inteligentes</strong> - Jeste??my inteligentni</li></ul><p>Gdy opisujemy wygl??d (kolor, kszta??t, materia??), na przyk??ad:</p><ul><li><strong>El paraguas es negro</strong> - Parasol jest czarny</li><li><strong>La mesa es redonda</strong> - St???? jest okr??g??y</li><li><strong>El chico es bajo</strong> - Ch??opiec jest niski</li><li><strong>Las camisas son de algod??n</strong> - Koszule s?? z bawe??ny</li></ul><p>W znaczeniu ???mie?? miejsce???, ???zdarzy?? si?????, na przyk??ad:</p><ul><li><strong>La conferencia es ma??ana</strong> - Konferencja jest jutro</li><li><strong>Hoy es fiesta</strong> - Dzi?? jest ??wi??to</li><li><strong>As?? ser??</strong> - Tak b??dzie</li></ul><p>Gdy podajemy zaw??d, na przyk??ad:</p><ul><li><strong>Yo soy periodista</strong> - Jestem dziennikarzem</li><li><strong>Laura es m??dico</strong> - Laura jest lekark??</li><li><strong>Juan y Tom??s son profesores</strong> - Juan i Tomas sa nauczycielami</li></ul><p>Gdy okre??lamy zaw??d:</p><ul><li><strong>Este l??piz es de mi hermana</strong> - Ten o????wek jest mojej siostry</li><li><strong>??stas son nuestras llaves</strong> - To nasze klucze</li><li><strong>Es mi casa, pero no vivo all??</strong> - To m??j dom, ale w nim nie mieszkam</li></ul><h3>Estar</h3><figure class="table"><table><tbody><tr><td>yo</td><td>estoy</td></tr><tr><td>t??</td><td>est??s</td></tr><tr><td>??l</td><td>est??</td></tr><tr><td>nosotros</td><td>estamos</td></tr><tr><td>vosotros</td><td>est??is</td></tr><tr><td>ellos</td><td>est??n</td></tr></tbody></table></figure><p>Gdy okre??lamy cech?? lub stan przej??ciowy:</p><ul><li><strong>Estoy muy cansado</strong> - Jestem bardzo zm??czony</li><li><strong>Estamos alegres</strong> - Jeste??my weseli, cieszymy si??. (teraz)</li><li><strong>??Est??is preparados?</strong> - Jeste??cie gotowi?</li><li><strong>Pedro est?? enfermo</strong> - Pedro jest chory</li><li><strong>Enrique est?? alto</strong> - Enrique jest wysoki</li></ul><p>Z przymiotnikami <strong>vivo</strong> i <strong>muerto </strong>w znaczeniu ?????ywy??? i ???martwy???:</p><ul><li><strong>Ana est?? viva</strong> - Ana ??yje</li><li><strong>Su abuelo est?? muerto</strong> - Jego dziadek jest martwy</li></ul><p>Gdy chcemy powiedzie??, ??e ubranie dobrze le??y:</p><ul><li><strong>Esta camisa te est?? muy bien</strong> - Ta koszula bardzo dobrze na ciebie le??y</li><li><strong>Estos pantalones no le est??n bien</strong> - Te spodnie nie le???? na nim dobrze</li><li><strong>??C??mo me est?? esta camiseta?</strong> - Jak na mnie le??y ta koszulka?</li></ul><p>W nast??puj??cych wyra??eniach:</p><ul><li><strong>est?? bien</strong> - dobrze</li><li><strong>est?? claro</strong> - to jasne</li><li><strong>est?? harto</strong> - ma dosy??</li><li><strong>est?? mal</strong> - ??le</li></ul>	2022-04-07 09:21:40.288981
14	Estar + gerundio	Spanish	A1	<p>Konstrukcja <strong>estar + gerundio</strong> s??u??y do opisywania czynno??ci, kt??re maj?? miejsce w momencie trwania wypowiedzi.</p><figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>gritar&nbsp;</strong></td><td><strong>comer</strong></td><td><strong>escribir</strong></td></tr><tr><td><strong>yo</strong></td><td>estoy gritando</td><td>estoy comiendo</td><td>estoy escribiendo</td></tr><tr><td><strong>t??</strong></td><td>est??s gritando</td><td>est??s comiendo</td><td>est??s escribiendo</td></tr><tr><td><strong>??l</strong></td><td>est?? gritando</td><td>est?? comiendo</td><td>est?? escribiendo</td></tr><tr><td><strong>nosotros</strong></td><td>estamos gritando</td><td>estamos comiendo</td><td>estamos escribiendo</td></tr><tr><td><strong>vosotros</strong></td><td>est??is gritando</td><td>est??is comiendo</td><td>est??is escribiendo</td></tr><tr><td><strong>ellos</strong></td><td>est??n gritando</td><td>est??n comiendo</td><td>est??n escribiendo</td></tr></tbody></table></figure><p>Czasowniki nieregularne:</p><ul><li>Czasowniki <strong>III grupy</strong>, u kt??rych w czasie <strong>presente</strong> zachodzi??a wymiana <strong>e ??? ie</strong> i <strong>e ??? i</strong>, maj?? nieregularne gerundio, z wymian?? <strong>e ??? i</strong><ul><li>mentir - <strong>mintiendo</strong></li><li>venir - <strong>viniendo</strong></li><li>decir - <strong>diciendo</strong></li><li>herir - <strong>hiriendo</strong></li><li>hervir - <strong>hirviendo</strong></li><li>divertir - <strong>divirtiendo</strong></li><li>convertir - <strong>convirtiendo</strong></li><li>sentir - <strong>sintiendo</strong></li><li>referir - <strong>refiriendo</strong></li><li>pedir - <strong>pidiendo</strong></li><li>seguir - <strong>siguiendo</strong></li><li>servir - <strong>sirviendo</strong></li><li>elegir - <strong>eligiendo</strong></li><li>vestir - <strong>vistiendo</strong></li></ul></li><li>Pozosta??e czasowniki z nieregularna form?? gerundio to:<ul><li>ser - <strong>siendo</strong></li><li>leer - <strong>leyendo</strong></li><li>ver - <strong>viendo</strong></li><li>traer - <strong>trayendo</strong></li><li>ir - <strong>yendo</strong></li><li>poder - <strong>pudiendo</strong></li><li>dormir - <strong>durmiendo</strong></li><li>morir - <strong>muriendo</strong></li><li>re??r - <strong>riendo</strong></li><li>caer - <strong>cayendo</strong></li><li>huir - <strong>huyendo</strong></li><li>o??r - <strong>oyendo</strong></li></ul></li></ul><p><strong>Uwaga</strong>! Zaimek zwrotny se u??ywa si?? przed ca??ym czasownikiem lub dodaje si?? go do formy gerundio:</p><ul><li>No puedo coger el tel??fono, me estoy duchando (estoy duch??ndome)</li><li>Se est??n peinando (est??n pein??ndose) en el aseo</li><li>Se estaba vistiendo estaba (visti??ndose) cuando vinieron los invitados</li></ul>	2022-04-07 09:26:45.291837
15	pret??rito perfecto	Spanish	A2	<p>Czasu u??ywa si??:</p><ul><li>Gdy opisujemy czynno???? lub wydarzenie, kt??re mia??o miejsce w bardzo bliskiej przesz??o??ci, na przyk??ad:<ul><li>Me he levantado y voy a ducharme</li><li>Hace un momento ha salido</li><li>Hoy han llegado tarde</li></ul></li><li>Gdy opisujemy czynno???? lub wydarzenie, kt??re mia??o miejsce w przesz??o??ci, ale jego skutki s?? odczuwalne w tera??niejszo??ci, na przyk??ad:<ul><li>No tengo hambre porque he desayunado mucho</li><li>Tiene la pierna rota porque ha ca??do</li><li>Hemos ido muchos kil??metros y estamos cansados</li></ul></li><li>Gdy opisujemy czynno???? lub wydarzenie, kt??re mia??o miejsce w bli??ej nieokre??lonej przesz??o??ci<ul><li>Hemos viajado mucho</li><li>He trabajado para esa empresa</li><li>Juana ha comprado un coche</li></ul></li><li>W pytaniach, w kt??rych pojawiaj?? si?? zwroty typu: <strong>alguna vez</strong>, <strong>algunas veces</strong> lub w pytaniach kt??re t??umaczymy na j??zyk polski, u??ywaj??c przys????wk??w ???kiedy?????, ???kiedykolwiek???, ???ju?????<ul><li>??Has estado alguna vez en la India?</li><li>??Ha ido usted a Canada alguna vez?</li><li>??Hab??is bebido tequila?</li><li>??Te has sacado el carn?? de conducir?</li></ul></li><li>W zdaniach, w kt??rych wyst??puj?? okre??lenia czasu maj??ce zwi??zek z tera??niejszo??cia:<ul><li>esta noche</li><li>esta semana</li><li>esta mes</li><li>hoy</li><li>ya</li><li>todav??a</li><li>??ltimamente<ul><li>Esta semana he ido al gimnasio</li><li>Hoy he tenido mucho trabajo</li><li>Pablo no ha vuelto todav??a</li><li>Esta ma??ana he visto a Martin</li></ul></li></ul></li></ul><p>Nieregularne</p><ul><li>abrir ??? abierto</li><li>cubrir ??? cubierto</li><li>decir ??? dicho</li><li>descubrir ??? descubierto</li><li>escribir ??? escrito</li><li>hacer ??? hecho</li><li>imprimir ??? impreso</li><li>morir ??? muerto</li><li>poner ??? puesto</li><li>resolver ??? resuelto</li><li>romper ??? roto</li><li>ver ??? visto</li><li>volver ??? vuelto</li></ul>	2022-04-07 20:26:16.389133
17	Tocar	Spanish	B1	<h2>Tocar</h2><ol><li>Tocar algo (con tu cuerpo o con un objeto)</li><li>Tocar un instrumento o una pieza musical (una canci??n, una melod??a, etc.)</li><li>Caerle en suerte algo o alguien (normalmente un premio)</li><li>Pertenecer algo que por alg??n acuerdo tienes que hacer</li></ol>	2022-04-08 13:09:42.502953
22	004. Contraste entre el art??culo indefinido y el definido	Spanish	B1	<p><strong>Compare:</strong></p><figure class="table"><table><tbody><tr><td><p>Se usa <i>un, una, unos, unas</i> + nombre cuando hablamos de algo nuevo para el oyente (informaci??n nueva).&nbsp;</p><ul><li>Estoy leyendo <strong>un libro</strong> sobre <strong>una cantante</strong>???</li><li>Hab??a <strong>un hombre</strong> y <strong>una mujer</strong> en el sal??n...</li></ul></td><td><p>Se usa <i>el, la, los, las</i> + nombre cuando hablarnos de algo ya mencionado (informaci??n conocida por el oyente).</p><ul><li>...<strong>El libro</strong> se titula "Mi vida", y <strong>la cantante</strong>...</li><li>...<strong>El hombre</strong> parec??a extranjero y l<strong>a mujer</strong> llevaba...</li></ul></td></tr><tr><td><p>Se usa <i>un, una, unos, unas</i> + nombre cuando hablamos de alguien o algo como parte de una clase o grupo.</p><ul><li>Es <strong>una casa</strong> muy bonita.</li><li><strong>Una hermana</strong> de Pedro es bailarina. (= Pedro tiene varias hermanas.)</li><li>He visto <strong>una pel??cula de terror</strong>... (= una pel??cula de esa clase)</li></ul><p>Con <i>un, una, unos, unas</i> nos referimos a una clase de personas u objetos.</p><ul><li>Necesito <strong>una l??mpara</strong>. (= una l??mpara cualquiera)</li><li>Queremos <strong>una habitaci??n</strong>.</li></ul></td><td><p>Se usa <i>el, la, los, las</i> + nombre cuando hablamos de alguien o algo ??nico o espec??fico (??nico en esa situaci??n).</p><ul><li><strong>La casa</strong> de Juan es preciosa.</li><li><strong>La hermana</strong> de Luis es profesora. (= Luis tiene solo una hermana.)</li><li>...<strong>Los actores</strong> eran extraordinarios. (= los actores de esa pel??cula)</li></ul><p>Con <i>el, la, los, las</i> nos referimos a una persona u objeto concreto.</p><ul><li><strong>La l??mpara</strong> azul es preciosa. (= esta y no otra)&nbsp;</li><li>Estamos en <strong>la habitaci??n</strong> 323.</li></ul></td></tr><tr><td><p>Se usa <i>un, una, unos, unas</i> + nombre para indicar cantidad.</p><ul><li>He visto <strong>un le??n</strong> en el zoo.</li><li>He cortado <strong>unas rosas</strong>.</li><li>Compra <strong>unas manzanas</strong>.</li></ul></td><td><p>Se usa <i>el, la, los, las</i> + nombre para hablar de algo en sentido general.</p><ul><li><strong>El le??n</strong> es un animal peligroso.</li><li><strong>Las rosas</strong> son mis flores preferidas.</li><li><strong>Las manzanas</strong> son mi fruta preferido,</li></ul></td></tr></tbody></table></figure><p>PERO: A veces tambi??n se usa un, una para hablar de algo en sentido general.</p><ul><li><strong>Un rat??n</strong> es un mam??fero roedor.</li><li><strong>El rat??n</strong> es un mam??fero roedor.</li></ul><figure class="table"><table><tbody><tr><td><p>Se usa<i> uno, una, unos, unas</i> + adjetivo o uno, una, unos, unas + de + nombre cuando hablamos de una ciase o grupo ya mencionados.</p><ul><li>-??Qu?? tipo de ordenador busca? -<strong>Uno</strong> potente.</li><li>-??Qu?? tipo de mesa hab??is comprado? -<strong>Una de metal</strong>, muy moderno.&nbsp;</li></ul></td><td><p>Se usa <i>el, la, los, las</i> + adjetivo o <i>el, la, los, las</i> + de + nombre cuando hablamos de alguien o algo espec??fico ya mencionado.</p><ul><li>-<strong>El blanco</strong> es muy elegante. Y a ti, ??cu??l te gusta m??s?</li><li>-??Cu??l es tu moleta? -<strong>La de pl??stico</strong>.</li></ul></td></tr></tbody></table></figure>	2022-04-11 11:09:59.570373
23	005. El art??culo definido con nombres propios	Spanish	B1	<h4><i>El, la, los, las</i> con nombres de personas</h4><p>Se usa el, la, los o las + se??or, se??ora, se??orita, profesor, profesora, capit??n... (+ nombre) + apellido.&nbsp;</p><ul><li>??Has visto a <strong>la se??orita Moreno</strong>?</li><li>Estoy en el grupo <strong>del profesor Herrero</strong>.</li></ul><p><strong>PERO:</strong> No se usan los art??culos definidos en singular delante de don/do??a, delante de un nombre o un apellido, o cuando hablamos directamente a una persona.</p><ul><li><strong>Don Alberto</strong> est?? enfermo</li><li><strong>Guti??rrez</strong> no ha venido hoy</li><li><strong>Lola</strong> es muy simp??tica.</li><li>??Quiere usted algo, <strong>se??orita Moreno</strong>?</li></ul><p>Se usa los + apellido singular para referirse a una familia.</p><ul><li><strong>Los P??rez</strong> son muy agradables.</li><li>Esta noche cenamos en casa de <strong>los Mart??nez</strong>.</li></ul><p>Se usa el, la con nombres de peri??dicos y revistas.</p><ul><li>C??mprame <strong>el Hola</strong>, por favor.</li><li>??Ha salido <strong>la Gaceta</strong>?</li></ul><p>Se usa el, la, los, las con nombres de monumentos y obras de arte.</p><ul><li>Hemos visitado <strong>la Alhombra</strong>.</li><li>??Hab??is visto <strong>el Guernica</strong>?</li></ul><h4><i>El, la, los, los</i> con nombres de lugares</h4><p>Se usa <i>el, la</i> + nombres de calles, plazas, avenidas, paseos.</p><ul><li>El hotel est?? en <strong>la calle (de) Trafalgar</strong>.</li><li>Roberto vive en <strong>la Plaza del Carmen.</strong></li></ul><p>Se usa <i>el, la, los, las</i> + nombres de cines, teatros, hoteles, museos.</p><ul><li>el (hotel) Nacional</li><li>el (cine) Amaya</li><li>el (teatro) Real</li><li>el (hospital) Doce de Octubre</li><li>el (museo) Reina Sof??a</li><li>la (Universidad) Complutense<ul><li>Julio est?? enfermo. Est?? en <strong>el Doce de Octubre</strong>.</li><li>Rosa est?? haciendo un curso en <strong>la Complutense</strong>.</li></ul></li></ul><p>Se usa <i>el, la, los, las</i> + nombres de r??os, lagos, mares, oc??anos, grupos de islas, monta??as, cordilleras, volcanes, desiertos.</p><ul><li>el (r??o) Ebro, el Nilo</li><li>el (lago) Titicaca&nbsp;</li><li>el (mar) Cant??brico, el Egeo</li><li>el (oc??ano) Pac??fico, el Atl??ntico</li><li>las (islas) Baleares, las Gal??pagos</li><li>el (volc??n) Teide, el Etna</li><li>los Alpes, los Andes,</li><li>el (monte) Everest</li><li>el (desierto del) Kalahari<ul><li><strong>El Nilo</strong> es el r??o m??s largo del mundo.</li><li>El verano pasado subimos <strong>al Teide</strong>.</li></ul></li></ul><p><strong>PERO:</strong> No se usa <i>el, la, los, las</i> con nombres de islas cuando no son un grupo: Tenerife, Creta, Cuba, Jamaica.&nbsp;</p><ul><li>Este verano queremos ir a <strong>Creta</strong>.</li></ul><p>No se usa<i> el, la, los, las </i>con nombres de ciudades, regiones, provincias, pa??ses, continentes.</p><ul><li>Ciudades: Salamanca, Berl??n, Nueva York, Lima, Guadalajara...</li><li>Pa??ses y regiones: Per??, Brasil, Guatemala, China, Castilla, Arizona, Chiapas???</li><li>Continentes: Europa, Asia???<ul><li><strong>Salamanca</strong> est?? en <strong>Castilla</strong></li><li><strong>China</strong> est?? en <strong>Asia</strong>.</li></ul></li></ul><p><strong>PERO:</strong> Algunos nombres de ciudades, pa??ses y regiones llevan <i>el, la, los, las</i> como parte dei nombre:&nbsp;</p><ul><li>La Habana. El Escorial, La Haya, La Paz, Las Palmas, Los ??ngeles, El Cairo, El Salvador, (la) India (el) L??bano, La Mancha, La Rioja, La Pampa.</li></ul><p>Tambi??n se usa el articulo definido cuando el nombre del pa??s lleva las palabras Rep??blica, Reino o Estados: la Rep??blica Argentina, (los) Estados Unidos, el Reino Unido.</p><ul><li><strong>Los ??ngeles</strong> est?? en <strong>los Estados Unidos.</strong></li><li><strong>La Pampa</strong> es una zona de <strong>la Rep??blica Argentina.</strong></li></ul><p><strong>ATENCI??N:</strong></p><ul><li>(la) India, (el) Libano</li><li>??Has estado alguna vez en <strong>la India</strong>?</li></ul>	2022-04-11 16:39:56.332922
18	Czas przesz??y prosty - Pret??rito indefinido	Spanish	A2	<p>Czas prosty dokonany</p><figure class="table"><table><tbody><tr><td>&nbsp;</td><td>hablar</td><td>comer</td><td>salir</td></tr><tr><td>yo</td><td>habl??</td><td>com??</td><td>sal??</td></tr><tr><td>t??</td><td>hablaste</td><td>comiste</td><td>saliste</td></tr><tr><td>??l</td><td>habl??</td><td>comi??</td><td>sali??</td></tr><tr><td>nosotros</td><td>hablamos</td><td>comimos</td><td>salimos</td></tr><tr><td>vosotros</td><td>hablasteis</td><td>comisteis</td><td>salisteis</td></tr><tr><td>ellos</td><td>hablaron</td><td>comieron</td><td>salieron</td></tr></tbody></table></figure><p>&nbsp;</p><ul><li>Gdy opisujemy jednorazowe czynno??ci, zako??czone w czasie przesz??ym<ul><li>Com?? y sal?? de casa</li><li>Javier me llam??</li><li>Ana se sent?? en el sill??n</li></ul></li><li>W zdaniach opisuj??cych czynno??ci i wydarzenia przesz??e, w kt??rych wyst??puj?? typowe dla tego czasu okre??lenia:<ul><li>anoche</li><li>anteayer</li><li>ayer</li><li>el a??o pasado</li><li>en 1980</li><li>hace cuatro meses</li><li>la ??ltima semana<ul><li>na przyk??ad<ul><li>Anoche no salieron de casa</li><li>Bel??n nos visit?? anteayer</li><li>El a??o pasado no estuvimos aqu??</li><li>hace cuatro meses dio a luz a su ni??a</li></ul></li></ul></li></ul></li><li>Gdy opisujemy wydarzenia dotycz??ce czyjego?? ??ycia, kt??re nast??powa??y jedno po drugim:<ul><li>Anita empez?? los estudios en 1990 y los termin?? cinco a??os m??s tarde</li><li>Juan se cas??, tuvo dos ni??as, se traslado a Alemania y all?? compr?? una f??brica</li><li>Julio viaj?? mucho durante toda su vida</li></ul></li><li>W zdaniach, w kt??rych wyst??puj?? okre??lenia czasu takie jak <strong>muchas veces</strong>, <strong>raras veces</strong><ul><li>Reg?? las plantas muchas veces</li><li>Escuch?? este disco muchas veces</li><li>Pablo habl?? con su hijo raras veces</li></ul></li></ul><p>Nieregularne</p>	2022-04-09 20:05:50.022136
19	001. Omisi??n del art??culo	Spanish	B1	<p>Normalmente no se usa <i>un, una, unos, unas </i>+ nombres no contables</p><ul><li>??Qu?? es eso? - Es vino</li></ul><p>Pero se usa <i>un, una, unos, unas</i> + nombre no contable en los siguientes casos:</p><ul><li><i>un, una, unos, unas</i> = un tipo de, una clase de<ul><li>He comprado <strong>un queso</strong> (= un tipo de queso) que te va a gustar</li><li>Es <strong>un vino</strong> (= un tipo de vino) extraordinario</li></ul></li><li><i>un, una, unos, unas</i> = un/una vaso/taza??? de cerveza/caf??<ul><li>Un caf??, por favor (= una taza de caf??)</li></ul></li></ul><p>No se usa usa <i>un, una, unos, unas</i> detr??s de ser o hacerse con nombres de profesi??n, religi??n, nacionalidad o ideolog??a pol??tica</p><ul><li>Julia <strong>es mexicana</strong></li><li>Soy <strong>m??dico</strong></li></ul><p>Pero se usa <i>un, una, unos, unas</i></p><ul><li>Cuando el nombre va con un calificativo<ul><li>Julia es <strong>una arquitecta muy conocida</strong></li><li>??Qui??n es Hans? Es <strong>un ingeniero que trabaja conmigo</strong></li></ul></li><li>cuando se identifica a alguien por su profesi??n<ul><li>??Qui??n era Frida Kahlo? Era una pintora</li></ul></li></ul><p>No se usa usa <i>un, una, unos, unas</i> con el objeto directo de un verbo cuando nos referimos a algo en general y no a algo concreto</p><ul><li>Antonio <strong>vende enciclopedias</strong></li><li>No <strong>tengo coche</strong></li><li>Rosa <strong>lleva</strong> siempre <strong>vaqueros</strong></li><li>Alberto no <strong>come carne</strong></li></ul><p>Pero se usa <i>un, una, unos, unas</i></p><ul><li>Cuando se hable de cantidad<ul><li>La novia de Alfonso <strong>ha publicado una novela</strong> (=1)</li><li>He comprado <strong>unos melocotones</strong> (algunos melocotones)</li></ul></li><li>Cuando el nombre va con un calificativo<ul><li>Tengo <strong>unas enciclopedias muy antiguas</strong></li><li>Rosa lleva <strong>unos vaqueros car??simos</strong></li></ul></li></ul><p>No se usa usa <i>un, una, unos, unas</i> con el segundo nombre de las palabras compuestas formadas por nombre + preposici??n + nombre</p><ul><li>Juli??n es <strong>profesor de universidad</strong></li><li>Me han regalado una <strong>corbata de seda</strong></li><li>Rosa tiene una <strong>colecci??n se sellos</strong></li><li>Un <strong>caf?? con leche</strong>, por favor</li><li>Aqu?? venden <strong>ropa de ni??o</strong></li><li>Luisa es <strong>directora de orquestra</strong></li></ul>	2022-04-09 20:37:51.126158
31	010. un, otro	Spanish	B1	<p><i>un, una</i> = un elemento indeterminado (No se dice cu??l.)&nbsp;</p><p><i>unos, unas</i> = identidad y cantidad indeterminadas (No se dice cu??les ni cu??ntos.)</p><figure class="table"><table><tbody><tr><td><i>un, una</i> + nombre singular</td><td>Rosa est?? saliendo con <strong>un italiano</strong>.&nbsp;<br>Te ha llamado <strong>una amiga</strong>.</td></tr><tr><td><i>unos, unas</i> + nombre plural</td><td>Me han regalado <strong>unas flores</strong>.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td><i>uno, una</i> + de</td><td><p>+ nosotros, vosotros...</p><p>+ los, las<br>+ mis, tus???<br>+ estos, esos...&nbsp;</p></td><td><p>&nbsp;</p><p>+ nombre plural&nbsp;</p></td><td><p><strong>Uno de vosotros</strong> tiene que ayudarme.</p><p>Juli??n es <strong>uno de los participantes.&nbsp;</strong><br>He visto a <strong>una de tus hermanas.</strong><br>Quiero <strong>una de esas carteras.</strong></p></td></tr></tbody></table></figure><p>otro, otra, otros, otras</p><ul><li><i>otro, otra, otros, otras</i> = m??s elementos del mismo tipo<ul><li>Los Blanco van a tener <strong>otro hijo</strong>. (=un hijo m??s)</li><li>Han llegado <strong>otros tres alumnos</strong>. (= tres alumnos m??s)</li></ul></li><li><i>otro, otra, otros, otras</i> = elementos diferentes<ul><li>Hoy estoy ocupado. Ven <strong>otro d??a</strong>. (w= un d??a distinto a hoy)</li><li>-??Ya no vives aqu??? -No, ahora vivo en <strong>otro barrio</strong>. (= un barrio diferente)</li></ul></li></ul><figure class="table"><table><tbody><tr><td>(el, la)<br>mi, tu???<br>este, ese...</td><td>+ otro, otra + nombre singular</td><td>P??same <strong>el otro plato</strong>.&nbsp;<br>Este es <strong>mi otro hijo</strong>.<br>Prefiero <strong>ese otro pl??tano</strong>.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td>(los, las)<br>mis, tus<br>estos, esos...</td><td>+ otros, otras + (dos, tres...)</td><td>+ nombre plural</td><td>Esas no. Quiero <strong>las otras botas</strong>.&nbsp;<br>Mis <strong>otros dos primos</strong>.<br><strong>Esas otras manzanos</strong> son mejores.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td>otro, otra + de</td><td><p>+ nosotros, vosotros...</p><p>+ los, las...&nbsp;<br>+ mis, tus???<br>+ estos, esos...&nbsp;</p></td><td><p>&nbsp;</p><p>+ nombre plural</p></td><td><p>Quiere que vaya <strong>otro de nosotros</strong>.</p><p>P??same <strong>otro de los pasteles</strong> de chocolate.&nbsp;<br>He perdido <strong>otra de mis plumas</strong>.<br>Dame <strong>otra de esas ciruelas</strong>.</p></td></tr></tbody></table></figure><p>el <i>otro d??a, la otra ma??ana/tarde/noche</i> = pasado reciente</p><ul><li><strong>El otro d??a</strong> vi a Kika, (= hace unos d??as)</li><li><strong>La otra noche</strong> salimos todos los de la oficina. (- hace unas noches)</li></ul><p><i>otro, otra, otros, otras</i> = se pueden usar solos cuando est?? claro de qui??n o de qu?? se est?? hablando</p><ul><li>-??Qu?? ricos est??n los pasteles! -Coge <strong>otro</strong>. (= otro pastel)</li></ul>	2022-04-17 18:02:55.916008
20	002. El art??culo definido	Spanish	B1	<p>Se usa <i>el, la, los, las</i> + nombre cuando est?? claro a qu?? persona o cosa concreta nos referimos</p><ul><li>porque es una persona o cosa ??nica<ul><li>El Papa es la cabeza de la iglesia cat??lica</li><li>La mujer de Ant??n es muy simp??tica</li><li>La catedral de Burgos es de estilo g??tico</li></ul></li><li>por la situaci??n<ul><li>Ayer estuve con Lola en un restaurante italiano. La cena fue magn??fica (=la cena en un restaurante)</li><li>Saqu?? las llaves del coche u abr?? la puerta (=la puerta del coche)</li><li>??D??nde est?? la entrada?</li></ul></li><li>o porque se ha mencionado antes<ul><li>Y de repente se apareci?? un coche. - ??Qui??n iba en el coche?</li></ul></li></ul><p><strong>Compare</strong></p><ul><li>Andr??s no tiene hijos</li><li>Los hijos de Ana son muy agradables</li></ul><p>Se usa e<i>l, la, los, las</i> + nombre para referirnos a algo espec??fico de una persona, cosa o animal indeterminado</p><ul><li>He roto <strong>el cristal</strong> de una ventana</li><li>Dibuj?? <strong>las alas</strong> de un p??jaro</li></ul><p>Se usa <i>el, la, los, las</i> + nombre para hablar de algo o alguien en sentido general</p><ul><li><strong>El caballo</strong> es un animal muy noble</li><li><strong>Los libros</strong> ayudan a vivir</li><li><strong>El bol??grafo</strong> se usa para escribir</li><li>Me encanta <strong>el pescado</strong></li></ul><p><strong>Compare</strong></p><figure class="table"><table><tbody><tr><td>He roto <strong>un cristal</strong></td><td>-</td><td>He roto <strong>el cristal de una ventana</strong></td></tr><tr><td>Dibuj?? <strong>unas alas</strong></td><td>-</td><td>Dibuj?? <strong>las alas de un p??jaro</strong></td></tr></tbody></table></figure><p>Se usa <i>el, la, los, las</i> + nombre con partes del cuerpo, ropa y art??culos de uso personal, en lugar de mi, tu???</p><ul><li>Me he roto <strong>la pierna</strong> esquiando (mi pierna)</li><li>Ra??l ha perdido <strong>la gorra</strong> (su gorra)</li></ul><p>Se usa el (no la) delante de nombres femeninos en singular que empiezan por <i>a-, ??-, ha-, h??-</i> acentuada</p><ul><li>el aula</li><li>el hacha</li><li>el agua</li><li>el hambre</li><li>el arma</li><li>La se??ora Ram??rez est?? en<strong> el aula </strong>12</li></ul><p>Pero</p><ul><li>Mira la otra aula</li></ul><p><i>a</i> y <i>de</i> + nombres propios con El</p><ul><li>Es un art??culo <strong>de El Mundo</strong></li><li>??Cu??ndo te vas <strong>a El Cairo</strong>?</li></ul>	2022-04-10 07:25:10.452052
21	003. Omisi??n del nombre	Spanish	B1	<p>Cuando hablamos de alguien o algo espec??fico, se puede usar <i>el, la, los, las</i> en lugar de un nombre mencionado anteriormente, o cuando no es necesario mencionarlo porque todos sabemos de qu?? estamos hablando.</p><ul><li><i>el, la, los, las</i> + adjetivo<ul><li>-??Qu?? camisa te gusta m??s? -<strong>La verde</strong>. (= la camisa verde)</li><li>-??Qui??n es Laura? -<strong>La alta</strong>. (= la chica alta)</li></ul></li></ul><p>La forma del art??culo y del adjetivo (masculino, femenino, singular o plural) es la misma que la del nombre al que se refiere.</p><ul><li>-??Qu?? <strong>zapatillas</strong> te gustan m??s? -<strong>Las rojas</strong>.</li></ul><p>Se puede usar <i>el, la, los, las + de</i> + nombre para indicar origen, posesi??n, situaci??n o materia.</p><ul><li><strong>La de Sevilla</strong> es la m??s simp??tica. (= la chica de Sevilla)</li><li>-??Qui??n es Juli??n? -<strong>El de gafas</strong>. (= el chico que lleva gafas)&nbsp;</li><li>-??Qu?? vasos prefieres? -<strong>Los de papel</strong>. (= los vasos de papel)</li></ul><p>La forma del art??culo (masculino, femenino, singular o plural) es la misma que la del nombre al que se refiere.</p><ul><li>No me gustan las <strong>sillas</strong> de pl??stico. Prefiero<strong> las de</strong> madera.</li></ul><p>Se usa el art??culo <i>lo</i> + adjetivo masculino singular, para referirnos a una cualidad.<br>lo = la cosa, las cosas</p><ul><li><strong>Lo bueno</strong> del verano son las vacaciones. (= la cosa buena del verano)</li><li><strong>Lo mejor</strong> de Per?? es la gente. (= la mejor cosa de Per??)</li><li>Me gusta <strong>lo salado</strong>. (= las cosas saladas)</li><li><strong>Lo m??s bonito</strong> de la vida son los amigos. (= la cosa m??s bonita)</li></ul><p>Se usa <i>lo + de</i> + nombre o adverbio para referirse, sin mencionarlo, a algo conocido por los interlocutores.</p><ul><li>Tenemos que hablar de <strong>lo de Pili</strong> (- Los dos sabemos qu?? es "lo de Pili", por ejemplo, un problema que tiene Pili con una amiga.)</li><li><strong>Lo de tu hermano</strong> ha sido estupendo. (= Los dos sabemos qu?? es "lo de tu hermano", por ejemplo, que le ha tocado la loter??a.)</li><li><strong>Lo de ayer</strong> fue extraordinario.</li></ul>	2022-04-10 10:28:42.686396
24	006. El art??culo definido con expresiones de tiempo	Spanish	B1	<p>Se usa <i>la, las</i> + horas.</p><ul><li>El partido empieza <strong>a la</strong> una.</li><li>-??A qu?? hora sale el tren? -A <strong>las catorce</strong> horas.</li></ul><p>Se usa <i>el</i> + fechas o d??as de la semana, cuando hablamos de alg??n acontecimiento.</p><ul><li><strong>La boda</strong> es <strong>el cinco</strong> de octubre.</li><li><strong>El lunes</strong> tenemos <strong>un examen</strong>. (= el Lunes pr??ximo)</li><li>Mis padres <strong>llegaron el jueves</strong>. (= el jueves de esta semana)</li></ul><p>PERO:&nbsp;</p><ul><li>Hoy es <strong>dos</strong> de mayo.</li><li>-??Qu?? d??a es hoy? -<strong>Jueves</strong>. Ma??ana es <strong>viernes</strong>.</li></ul><p><strong>ATENCI??N</strong>:</p><ul><li>d??a de la semana + fecha ??? solo un art??culo</li><li>La boda es <strong>el domingo</strong>. La boda es <strong>el diecisiete</strong> de junio. ??? La boda es <strong>el domingo, diecisiete</strong> de junio.</li></ul><p>Se usa <i>los</i> + d??as de la semana cuando hablamos de una acci??n habitual.</p><ul><li><strong>Los lunes</strong> trabajo hasta las diez.</li><li>??Qu?? sueles hacer <strong>los domingos</strong>?</li></ul><p>No se usa art??culo con los nombres de los meses.&nbsp;</p><ul><li>Ana y Pedro se casan en <strong>marzo</strong>.</li></ul><p>Se usa <i>por la</i> + partes del d??a: ma??ana, tarde, noche.</p><ul><li>No puedo ir <strong>por la ma??ana</strong>. Estoy ocupado.</li><li>Ll??mame <strong>por la noche</strong>. Es cuando estoy en casa.</li></ul><p>PERO: <strong>a</strong> mediod??a, <strong>de</strong> madrugada</p><ul><li>Regreso a cosa <strong>a mediod??a</strong>, o la hora de comer.</li><li>El cami??n de la basura pasa <strong>de madrugada</strong>.</li></ul><p>Frecuencia o cantidad + <i>al/a la</i> + per??odo de tiempo</p><figure class="table"><table><tbody><tr><td><p>una vez</p><p>dos veces</p><p>una hora</p><p>ocho horas</p><p>dos litros de agua</p></td><td><p>al d??a</p><p>al mes</p><p>a la semana</p><p>a la hora</p></td><td><p>Voy a Bruselas <strong>una vez al mes</strong>.</p><p>Ando <strong>uno hora al d??a</strong>.</p><p>Tengo clase <strong>un d??a a la semana</strong>.</p><p>Bebo dos <strong>litros de aguo al d??a</strong>.</p></td></tr></tbody></table></figure><p>Precio + <i>el, la, los, las</i> + unidades de medidas (kilo, litro, docena...)</p><figure class="table"><table><tbody><tr><td><p>un euro</p><p>diez pesos</p><p>cinco d??lares</p><p>veinte c??ntimos</p></td><td><p>el kilo, litro???</p><p>la docena???</p><p>los cien o gramos???</p></td><td><p>El aceite ha subido <strong>veinte c??ntimos el litro</strong>.</p><p>Esos huevos cuestan <strong>tres euros la docena</strong>.</p><p>Es un jam??n caro. <strong>Seis euros los cien gramos</strong>.</p></td></tr></tbody></table></figure>	2022-04-13 08:18:21.75592
28	007. Otros usos del art??culo definido	Spanish	B1	<h4>Se usa <i>el, la, los, las</i> en los casos siguientes:&nbsp;</h4><p>Instrumentos musicales</p><ul><li>Para hablar de un instrumento en general.&nbsp;<ul><li><strong>El piano</strong> es mi instrumento preferido.</li></ul></li><li>Con tocar<ul><li>Me gustar??a saber <strong>tocar</strong> <strong>el viol??n</strong>.</li></ul></li></ul><p>PERO:</p><ul><li>Rosa <strong>estudia piano</strong>.</li><li>Necesito <strong>un piano</strong> nuevo.</li></ul><p>Deportes y juegos</p><ul><li>Para hablar de un deporte o juego en general&nbsp;<ul><li><strong>El alpinismo</strong> es un deporte peligroso.</li><li><strong>El parch??s</strong> es un juego muy divertido.&nbsp;</li></ul></li><li>Con jugar<ul><li><strong>juegas</strong> muy bien <strong>al tenis</strong>.</li><li>??Quieres aprender a <strong>jugar al ajedrez</strong>?</li></ul></li></ul><p>PERO:</p><ul><li>Solo <strong>hago alpinismo</strong> en verano.</li><li>Mi hijo <strong>hace gimnasia</strong> y <strong>nataci??n</strong>.</li></ul><p>Asignaturas o idiomas</p><ul><li>??Has aprobado <strong>la Historia</strong>?</li><li><strong>El espa??ol</strong> es un idioma universal.</li></ul><p>PERO: &nbsp; No con saber, ense??ar, estudiar, hablar</p><ul><li>Hans <strong>ense??a Historia</strong>.</li><li>Mucho gente <strong>estudio espa??ol</strong> en los Estados Unidos.</li></ul><p>Nombres de monedas: el euro, el d??lar???</p><ul><li><strong>La libra</strong> es una moneda fuerte.</li><li>La moneda de Venezuela es <strong>el bol??var</strong>.</li></ul><p>la polic??a, el ej??rcito, los bomberos</p><ul><li>El t??o de Andr??s es capit??n <strong>del ej??rcito</strong>.</li><li>Luis quiere ingresar en <strong>la polic??a</strong>.</li></ul><p>el cine, el teatro, la radio, la televisi??n, el peri??dico, !as noticias</p><ul><li>Nunca escucho <strong>la radio</strong> por las ma??anas.</li><li>Luis, compra <strong>el peri??dico</strong> cuando salgas.</li></ul><p>PERO:&nbsp;</p><ul><li>Me he comprado <strong>una televisi??n</strong>. (= un aparato de televisi??n)</li><li>Tengo <strong>una buena noticia</strong>.</li></ul><p>el mar, el campo, la playa, la monta??a, el cielo, la naturaleza</p><ul><li>Es muy sano ba??arse en <strong>el mar</strong>.</li><li>Vamos <strong>al campo</strong> todos los fines de semana.</li></ul><p>ir a la... / venir de la... /estar en la... c??rcel, iglesia, oficina, universidad...</p><ul><li>Mi hermana <strong>est?? en lo universidad.</strong></li><li>Los domingos <strong>voy a la iglesia.</strong></li><li>-??De d??nde <strong>vienes</strong> ? -<strong>Del m??dico</strong>.</li><li>Tenemos que <strong>estar en el aeropuerto</strong> a las seis.</li></ul><p>Medios de transporte: el metro, el autob??s, el tren...</p><ul><li><strong>El tren</strong> es un medio de transporte muy agradable.</li></ul><p>PERO: ir/venir/viajar en metro, autob??s, tren...</p><ul><li>Me gusta <strong>viajar en tren</strong>, pero para viajes largos, prefiero <strong>ir en avi??n</strong>.</li></ul>	2022-04-14 13:36:49.762245
25	PASADOS (INDEFINIDO - IMPERFECTO)	Spanish	B2	<p>PASADOS (INDEFINIDO - IMPERFECTO)</p>	2022-04-13 15:12:16.372731
26	SUBJUNTIVO PRESENTE	Spanish	B2	<p>todo</p>	2022-04-13 18:10:14.183181
27	Indicativo - subjuntivo	Spanish	B2	<p>todo</p>	2022-04-13 18:31:41.324024
29	008. Comparativo de igualdad	Spanish	B1	<ul><li>Rosa es <strong>tan alegre corno</strong> Jorge.</li><li>Rosa es<strong> igual de alegre que</strong> Jorge.</li><li>Rosa y Jorge son <strong>igual de alegres</strong>.</li><li>Una bici no es <strong>tan r??pida como</strong> una moto.</li><li>Una bici no es <strong>igual de r??pida que</strong> una moto.</li><li>Una bici y una moto no son <strong>igual de r??pidas</strong>.</li></ul><p><i>Tan alegre, tan r??pida, igual de alegre, igual de r??pida</i> son expresiones comparativas. Se usan para indicar si cierta cualidad - <i>alegre, r??pida</i> - es igual o no en dos t??rminos (personas, animales o cosas).</p><ul><li><strong>Mis padres</strong> son <strong>tan mayores</strong> como <strong>los tuyos</strong>.</li><li><strong>Roberto</strong> es <strong>igual de antip??tico</strong> que <strong>sus hermanos</strong>.</li></ul><p>Formaci??n del comparativo de igualdad</p><figure class="table"><table><tbody><tr><td><p>tan + adjetivo (+ como)</p><p>igual de + adjetivo (+ que)</p></td><td><p>Julia es <strong>tan alta como</strong> Marta, pero no es <strong>tan guapo</strong>.</p><p>Soy <strong>igual de alto que</strong> mi hermano.</p><p>Mi hermano y yo somos <strong>igual de altos</strong>.</p></td></tr></tbody></table></figure><p>El adjetivo tiene [a misma forma (masculino o femenino, singular o plural) que la persona, animal o cosa a la que se refiere.</p><ul><li>Mi piso es igual de peque??o que el tuyo.</li><li>Mi hermana es tan trabajadora corno yo.</li><li>Ana y su madre son igual de guapas.</li><li>Estos dos televisores son igual de caros.</li></ul><p>Construcciones con el comparativo de igualdad</p><figure class="table"><table><tbody><tr><td><p>tan + adjetivo + como</p><p>igual de + adjetivo + que</p></td><td><p>+ nombre</p><p>+ yo, t??...</p><p>+ el m??o, el tuyo...</p></td><td><p>Rafa no es tan simp??tico como su hermano.&nbsp;</p><p>yo soy igual de inteligente que vosotros.&nbsp;</p><p>Mi coche no es tan r??pido como el tuyo.</p></td></tr><tr><td>tan + adjetivo + como</td><td>+ oraci??n</td><td><p>Julio no es tan guapo como t?? dices.</p><p>El espa??ol no es tan dif??cil como yo pensaba.</p></td></tr></tbody></table></figure><p>Cuando est?? claro a qu?? nos referimos, no es necesario mencionar el segundo t??rmino de comparaci??n.</p><ul><li>-Felipe es muy amable. -Pues su hermana no es tan amable.</li><li>-Los argentinos son muy agradables. -Pues los chilenos son igual de agradables.</li></ul><p>ATENCI??N</p><figure class="table"><table><tbody><tr><td>- Rafa es guapo.</td><td><p>- Pues Luis es.</p><p>- Pues Luis es tan guapo como ??l.</p><p>- Pues Luis es igual de guapa,</p></td></tr><tr><td>- Rosa es muy inteligente.</td><td><p>-Pues sus hermanos no son tan inteligentes.</p><p>- Pues sus hermanos no son tan inteligentes como ella.</p><p>- Pues sus hermanos no son igual de inteligentes.</p></td></tr></tbody></table></figure>	2022-04-15 10:01:18.667153
30	009. todos, algunos, varios, uno, ninguno, alguno	Spanish	B1	<p>Se usan <i>todos, algunos, varios, uno, ninguno, alguno</i> para referirse a los componentes de un grupo.&nbsp;</p><ul><li>Todos mis amigos son simp??ticos. (= la totalidad del grupo)</li><li>Algunos de mis amigos son estudiantes. (= una parte indeterminada del grupo)</li><li>varios de mis amigos son arquitectos. (= un n??mero indeterminado del grupo)</li><li>Uno de mis amigos hablo chino. (= uno indeterminado; no digo cu??l)</li><li>Ninguno de mis amigos es antip??tico. (= nadie del grupo)</li></ul><p>todos, todas</p><ul><li>todos, todas + los, las.../mis, tus.../estos, esos... + nombre plural; todos + nosotros, vosotros... ; todas + nosotras...<ul><li>Todos los asientos est??n ocupados.</li><li>Todas mis amigas hablan espa??ol.</li><li>Deme todas esas manzanas, por favor.</li><li>Todos vosotros sois muy amables.</li></ul></li></ul><p>un, una, alg??n, alguna, algunos, algunos, ning??n, ninguno, ninguna</p><ul><li>uno, una, ning??n, ninguna, alg??n, alguna + nombre singular<ul><li>Una se??ora ha preguntado por ti.&nbsp;</li><li>No veo ning??n elefante.</li><li>??Ha llegado alg??n alumno?</li></ul></li><li>algunas, algunas + nombre plural<ul><li>Algunas setas pueden ser venenosas.</li></ul></li><li>uno, una, alguno, alguna, algunos, algunas, ninguno, ninguna + de + los, las???/mis, tus.../ estos,&nbsp;esos... + nombre plural: uno, una, alguno... + de + nosotros, vosotros???<ul><li>Una de los ruedas est?? rota.</li><li>??Alguna de tus t??as vive en Caracas?</li><li>Algunos de esos libros son muy raros.</li><li>No veo a ninguno de los ni??os.</li><li>??Alguno de vosotros conduce?</li></ul></li><li>alg??n, alguno y alguna se suelen emplear en preguntas. Preguntan por cantidad e identidad indeterminadas.&nbsp;<ul><li>??Tienen alg??n libro nuevo?</li><li>??Alguno de vosotros habla ??rabe?</li></ul></li></ul><p><strong>Compare:</strong></p><figure class="table"><table><tbody><tr><td><p>Te est?? esperando un alumno.</p><p>(= cantidad determinada e identidad indeterminada)</p></td><td><p>??Hay alg??n alumno en la clase?</p><p>(= cantidad e identidad indeterminadas)</p></td></tr></tbody></table></figure><p>ATENCI??N</p><ul><li>??Hay alg??n paquete abierto?</li><li>ning??n, ninguno, ninguna + verbo afirmativo ??? Ninguno de mis amigos habla chino.</li><li>verbo negativo + ning??n, ninguno, ninguna ??? No hablo chino ninguno de mis amigos.</li></ul><p>varios, varias = un n??mero indeterminado de personas o cosas</p><ul><li>varios, varias + nombre plural ??? Me gustan varios escritores espa??oles.&nbsp;</li><li>varios, varias + de + los, las.../mis, tus.../estos, esos.../nosotros, vosotros... + nombre plural<ul><li>Quiero comprar varios de esos recuerdos.</li><li>Tengo malas noticias para varios de vosotros.</li><li>Ya he le??do varios de los libros que me prestaste.</li><li>Conozco a varias de tus primas.</li></ul></li></ul><p>Todos, todas, uno, una, alguno, alguna, algunos, algunas, varios, varios y ninguno, ninguna se pueden usar solos cuando est?? claro de qui??n o de qu?? se habla.</p><ul><li>-Conozco a todas esas chicas. -Pues yo no conozco a ninguna.</li><li>-??Has le??do alguna obra de Borges? S??, varias.</li></ul>	2022-04-15 14:48:54.631718
33	012. alguien, algo, nadie, nada	Spanish	B1	<p>Se usan <i>alguien, algo, nadie</i> y <i>nada</i> para referirse a personas o cosas de identidad desconocida.</p><figure class="table"><table><tbody><tr><td><i>alguien</i> = una persona (o varias), pero no decimos qui??n<br><i>nadie</i> = ninguna persona<br><i>algo</i> = una cosa (o varias), pero no decimos qu??<br><i>nada</i> = ninguna cosa</td><td>Te ha llamado alguien.<br>Nadie conoce al Sr. Rojos.<br>Tengo algo para ti. Es una sorpresa.<br>No hay nada en la caja.</td></tr></tbody></table></figure><p>Se usan alguien y nadie para hablar de personas y algo y nada para hablar de cosas.</p><ul><li>Ha llamado alguien? Estoy esperando una llamada de un amigo italiano. -No, lo siento. No ha llamado nadie.&nbsp;</li><li>-Ma??ana es mi cumplea??os. Espero que mis hijos me regalen algo. El a??o pasado no me regalaron nada.</li></ul><p>Se pueden usar adjetivos detr??s de alguien, algo, nadie y nado. El adjetivo va en singular masculino.</p><ul><li>-??Con qui??n est?? hablando Jos??? -No s??. Parece alguien muy importante.&nbsp;</li><li>-Qu?? quieres para tu cumplea??os?-Quiero algo bonito, No quiero nada caro.</li></ul><h4>Alguien de, nadie de</h4><p>Para hablar de una (o varias) personas de identidad desconocida de un grupo, se usan alguien de, nadie de.</p><ul><li>-??Qui??n me llam?? ? -No me acuerdo ahora. Era alguien de tu familia.</li><li>-??Qui??n ha roto la ventana? -No ha sido nadie de esta clase.</li></ul><p>ATENCI??N</p><figure class="table"><table><tbody><tr><td><p><i>nadie, nada</i> + verbo afirmativo</p><p>verbo negativo + <i>nadie, nada</i></p></td><td><p><strong>Nadie</strong> quiere hacerlo.</p><p><strong>No</strong> quiere hacerlo <strong>nadie</strong>.<br><strong>Nunca</strong> viene <strong>nadie</strong>.</p></td><td><p><strong>Nada</strong> le importa.</p><p><strong>No</strong> le importa <strong>nada</strong>.<br><strong>Nunca</strong> quiere <strong>nada</strong>.</p></td></tr></tbody></table></figure><h4>Alguien, algo, alguno, nadie, nada, ninguno</h4><p>Alguien, algo, nadie, nada no dan informaci??n alguna sobre la persona o cosa a la que se refieren.</p><ul><li>Ha llamado alguien, pero no ha dicho el nombre. (No sabemos nada sobre la persona que ha llamado.)&nbsp;</li><li>Te han comprado algo para tu cumplea??os. (No sabemos nada sobre el regalo.)</li></ul><p>Alg??n, alguno, alguna, ning??n, ninguno, ninguna dan informaci??n sobre el grupo o se refieren a algo mencionado anteriormente.</p><ul><li>-Has visto a alguna de mis amigas? -No, no he visto a ninguna. (Sabemos que es una amiga.)&nbsp;</li><li>Ninguno de mis alumnos ha suspendido. (Sabemos que son alumnos.)</li></ul><p>Compare</p><figure class="table"><table><tbody><tr><td>??Hay <strong>algo</strong> en la mesa?<br>(No se especifica ning??n tipo de objeto.)</td><td>??Hay <strong>alg??n paquete</strong> en lo mesa?<br>(Se especifica un tipo de objeto.)</td></tr></tbody></table></figure><p>ATENCI??N</p><figure class="table"><table><tbody><tr><td><p><i>alguien de, nadie de</i> + nombre singular</p><ul><li>No conozco a nadie de tu familia.</li><li>Ha llamado alguien de tu familia.</li></ul><p><i>alguna de, alguna de, algunos de, algunas de, ninguno de, ninguna de</i> + nombre plural&nbsp;</p><ul><li>Conozco a alguno de tus amigos.</li></ul></td></tr></tbody></table></figure><p>Alguien, algo, nadie, nada, alg??n/alguno, alguna, ning??n/ninguno, ninguna + m??s (m??s = otro, otros)</p><ul><li>Enfermera, ??hay alguien m??s esperando?</li><li>??Tienes alguna pregunta m??s?</li><li>-??Postre?-No, gracias. Estoy lleno. No quiero nada m??s.</li></ul>	2022-04-19 18:09:55.150025
32	011. cada, cualquiera	Spanish	B1	<p><i>cada</i> = todos los componentes de un grupo individualmente</p><p><i>cada</i> = los componentes de un grupo agrupados en una cantidad determinada</p><figure class="table"><table><tbody><tr><td><i>cada</i></td><td>+ &nbsp;nombre singular<br>+ &nbsp;n??mero (dos, tres) ?? nombre plural</td><td>Hay un sill??n diferente en <strong>cada</strong> habitaci??n.&nbsp;<br>Hay un ordenador para <strong>cada</strong> dos alumnos.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td><i>cada uno/una de</i></td><td><p>+ nosotros, vosotros...&nbsp;</p><p>+ las, las<br>+ mis, tus...<br>+ estos, esos...</p></td><td><p>&nbsp;</p><p>+ nombre plural&nbsp;</p></td><td><p><strong>Cada uno de nosotros</strong> tiene su trabajo.</p><p>Leo <strong>cada una de las cartas</strong> que recibo.&nbsp;<br>Quiero hablar con <strong>cada uno de mi</strong>s alumnos.&nbsp;<br>Cierne tres de <strong>cada uno de esos pasteles.</strong></p></td></tr></tbody></table></figure><p>Compare</p><figure class="table"><table><tbody><tr><td>Quiero hablar con todos los alumnos. (= con todos los alumnos en grupo)</td><td>Quiero hablar con uno de mis alumnos. (= con un solo alumno)</td><td>Quiero hablar con cada uno de mis alumnos. (= con todos los alumnos individualmente)</td></tr></tbody></table></figure><p>Se usa <i>cada uno, cada una</i> cuando est?? claro de qui??n o de qu?? estamos hablando.&nbsp;</p><ul><li>He comprado un helado <strong>para cada uno</strong>. (Para cada uno de nosotros o de vosotros.)&nbsp;</li></ul><p>cualquier, cualquiera</p><ul><li><i>cualquier, cualquiera</i> = uno, no importa cu??l, no conocido ni identificado</li></ul><figure class="table"><table><tbody><tr><td><p><i>cualquier</i> + nombre singular</p><p><i>un, una</i> + nombre singular + <i>cualquiera</i>&nbsp;</p></td><td><p><strong>Cualquier d??a</strong> voy a verte.</p><p>D??jame <strong>una raqueta cualquiera.</strong></p></td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td><i>cualquiera de</i></td><td><p>+ nosotros, ustedes...</p><p>+ los, las&nbsp;<br>+ mis, tus...<br>+ estos, esos...</p></td><td><p>&nbsp;</p><p>+ nombre plural</p></td><td><p><strong>Cualquiera de ustedes</strong> puede hacerlo.</p><p>P??same <strong>cualquiera de los bol??grafos.</strong><br>Ponte <strong>cualquiera de mis trajes.</strong><br><strong>Cualquiera de esos chicos</strong> es m??s amable que t??.</p></td></tr></tbody></table></figure><p>Se usa <i>uno, una + cualquiera</i> cuando est?? claro de qu?? estamos hablando.&nbsp;</p><ul><li>-??Qu?? libro prefieres? ???Es igual. D??jame <strong>uno cualquiera</strong>.</li></ul><p>cualquiera = cualquier persona</p><ul><li><strong>Cualquiera</strong> puede cometer un error.</li><li>Rodrigo habla con <strong>cualquiera</strong>.</li></ul>	2022-04-17 20:22:08.249312
34	013. m??s, menos, tanto	Spanish	B1	<p>M??s y menos sirven para indicar cantidad indeterminada.</p><figure class="table"><table><tbody><tr><td>m??s<br>menos</td><td>+ nombre singular no contable (agua, aire...)</td><td>Necesitamos <strong>m??s lluvia.&nbsp;</strong><br>Hoy hace <strong>menos calor.</strong></td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td>m??s<br>menos</td><td>Hoy hace menos calor,</td><td>Jorge tiene <strong>m??s libros</strong> que yo<br>Tienes que trabajar <strong>menos horas</strong>.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td><p>otro/otra, un/una + nombre contable singular</p><p>(otros/otras) dos, tres... + nombre contable plural</p></td><td>+ m??s<br>+ menos</td><td>Compra <strong>otro litro m??s.</strong><br>Ahora tenemos <strong>un coche menos.&nbsp;</strong><br>Necesitamos <strong>dos entradas m??s.&nbsp;</strong><br>Estado mejor con <strong>cinco kilos menos.</strong></td></tr></tbody></table></figure><p><i>M??s</i> y <i>menos</i> se pueden usar solos cuando est?? claro de qu?? estamos hablando.</p><ul><li>-??Quieres carne? -No quiero <strong>m??s</strong> (carne), gracias.</li><li>-He comprado tres refrescos. -Necesitamos <strong>dos m??s</strong> (refrescos). Somos cinco.</li></ul><p><strong>ATENCI??N</strong></p><ul><li>-Tengo dos hijos. ??? -Yo tengo <strong>uno m??s</strong>. Tengo tres.&nbsp;</li></ul><p><i>m??s de</i> (= por encima de), <i>menos de</i> (=por debajo de)</p><figure class="table"><table><tbody><tr><td>m??s de<br>menos de</td><td>+ cantidad</td><td>Hab??a <strong>m??s de cien personas</strong> en la conferencia.&nbsp;<br>Este ced?? tiene que costar <strong>menos de 20 euros.</strong></td></tr></tbody></table></figure><p>M??s, menos y tanto se usan para hacer comparaciones con nombres.</p><figure class="table"><table><tbody><tr><td>m??s (+)<br>menos (-)</td><td>+ nombre (+ que)</td><td>En mi barrio hay <strong>m??s ??rboles que</strong> en el tuyo.&nbsp;<br>Hoy ha venido <strong>menos gente que</strong> ayer.</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td>tanto, tanta,<br>tantos, tantas (=)</td><td>+ nombre (+ como)</td><td>Esta ciudad tiene <strong>tanto tr??fico como</strong> cualquier otra.<br>No tengo <strong>tantos amigos como</strong> mi hermana.</td></tr></tbody></table></figure><p><i>que/como</i> + pronombres personales de sujeto</p><ul><li>Voy a ayudar a Luisa. Tiene <strong>m??s trabajo que yo</strong>,&nbsp;</li><li>No tengo <strong>tanta suerte como t??</strong>.</li></ul><p>Normalmente no se usa que/como + t??rmino de comparaci??n cuando est?? claro con qu?? se compara.</p><ul><li>Hoy hace <strong>menos calor</strong>. (= menos que ayer)</li><li>Ahora estoy <strong>m??s tranquilo</strong>. (= m??s que hace un momento)</li></ul><p><i>M??s, menos, tanto/a/os/as</i> se pueden usar solos cuando el nombre al que se refieren se ha mencionado anteriormente.</p><ul><li>-Tienes mucha <strong>suerte</strong>. Te ha tocado la loter??a. -T?? tienes <strong>m??s</strong>. Te toco casi todas las semanas.&nbsp;</li><li>Alberto y yo coleccionamos <strong>sellos</strong>. Yo tengo unos dos mil, pero Alberto no tiene <strong>tantos</strong>.</li></ul><p>PERO: En frases afirmativas <i>tanto/a/os/as</i> va siempre con <i>como</i> + t??rmino de comparaci??n,</p><ul><li>-Elisa tiene una gran colecci??n de mariposas. ??? &nbsp;-Yo tengo <strong>tantas como ella.</strong></li></ul>	2022-04-24 14:07:38.506428
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, file, created_at) FROM stdin;
a754917f-abfb-48bc-827b-77c661285ec5	0000-init_migrations.sql	2022-04-06 17:56:33.691906
39666aed-2fb2-4b8d-a037-87d2bca9a179	0001-initial_data.sql	2022-04-06 17:56:33.691906
1caf65d5-3f62-4f76-a764-a6bdfed988c8	0002-add-exercise-table.sql	2022-04-09 20:59:59.801603
\.


--
-- Data for Name: sub_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_exercise (sub_exercise_id, exercise_id, value, answers, created_at) FROM stdin;
5	2	test	{test2}	2022-04-09 21:43:09.816771
6	2	??Queda _ leche en la nevera?	{''}	2022-04-09 21:46:33.30416
58	9	-??Qui??n es Julia? -(rubio) _	{"La rubia"}	2022-04-10 10:44:03.157924
59	9	-??Qui??n es Sebasti??n? -(alto) _	{"El alto"}	2022-04-10 11:00:09.681503
7	2	??Qu?? prefieres para cenar: _ carne o _ pescado?	{"",""}	2022-04-09 21:58:19.865418
8	2	Tengo _ vino que te va a gustar	{un}	2022-04-09 22:38:23.844993
9	2	En La Mancha hacen _ quesos buen??simos	{unos}	2022-04-09 22:40:40.068803
10	2	Nunca tomo _ caf?? por la noche	{""}	2022-04-09 22:41:57.631841
11	3	Rub??n era _ protestante pero luego se hizo _ cat??lico	{"",""}	2022-04-09 23:14:04.770737
12	3	Mis abuelos eran _ cubanos	{""}	2022-04-09 23:15:32.94304
14	4	Esto no funciona. Necesitamos (la/una) televisi??n nueva. 	{una}	2022-04-10 08:08:18.760372
20	4	Me he comprado (los/unos) pantalones y (la/una) camisa. (Los/Unos) pantalones son azules y (la/una) camisa es blanca.	{unos,una,Los,la}	2022-04-10 08:22:58.987447
15	4	Estoy trabajando. Apaga (la/una) televisi??n, por favor	{la}	2022-04-10 08:11:36.807115
16	4	-??Cu??ndo os vais? -Ahora mismo. Ya he metido (las/unas) maletas en (el/un) coche.	{las,el}	2022-04-10 08:18:19.708161
17	4	-Hay (el/un) coche en la calle. -Si, es (el/un) coche de Jorge.	{un,el}	2022-04-10 08:18:58.679627
18	4	-??Has hablado con (el/un) director? -Si. Empiezo a trabajar (el/un) lunes.	{el,el}	2022-04-10 08:19:59.744285
19	4	Ha llamado Antonio. Te espera en (la/una) puerta (del/de) un cine.	{la,del}	2022-04-10 08:20:54.678796
21	4	(Los/Unos) abuelos de Sandra tienen (el/un) coche antiguo.	{Los,un}	2022-04-10 08:23:44.818721
22	4	Anita se encontr?? un gato. -??C??mo era (el/un) gato?	{el}	2022-04-10 08:31:40.646851
23	5	vida de mariposa es muy breve.	{"La vida de la mariposa es muy breve."}	2022-04-10 08:55:41.844431
24	5	lluvia es buena para campo	{"La lluvia es buena para el campo"}	2022-04-10 08:56:37.915839
25	5	a espa??oles les gusta caf?? 	{"a los espa??oles les gusta el caf??"}	2022-04-10 08:57:39.631983
26	5	ballenas son unos mam??feros enormes	{"Las ballenas son unos mam??feros enormes "}	2022-04-10 08:58:11.075789
27	5	salud es m??s importante que dinero	{"La salud es m??s importante que el dinero"}	2022-04-10 08:58:42.474333
28	5	desde aqu?? se ven luces de bah??a	{"desde aqu?? se ven las luces de la bah??a"}	2022-04-10 08:59:10.974067
29	5	oro es un metal precioso	{"El oro es un metal precioso"}	2022-04-10 08:59:31.663788
30	5	me encanta olor de flores	{"me encanta el olor de las flores"}	2022-04-10 08:59:51.390311
31	6	Marcel Duchamp hizo una escultura con _ rueda de _ bicicleta.	{la,una}	2022-04-10 09:01:05.409702
32	6	Ayer nos encontramos en el campo _ piel de _ serpiente.	{la,un}	2022-04-10 09:21:56.749447
33	6	-??Qu?? est??s dibujando? - _ cabeza de _ jirafa.	{la,una}	2022-04-10 09:22:47.308593
34	6	Para hacer este postre necesito _ clara de _ huevo.	{la,un}	2022-04-10 09:23:22.518362
35	6	Estos dos vasos est??n hechos con _ cuernos de _ toro.	{los,un}	2022-04-10 09:23:47.495932
37	7	(Los/Mis) padres viven en Valencia	{Mis}	2022-04-10 10:04:26.014456
38	7	He dejado (la/mi) moto en el garaje	{la}	2022-04-10 10:04:45.210073
39	7	Me duelen (los/mis) pies	{los}	2022-04-10 10:04:59.817497
40	7	Susana est?? en (la/su) casa	{su}	2022-04-10 10:05:33.949775
41	7	Veo poco sin (las/mis) gafas	{las}	2022-04-10 10:05:55.49235
42	7	Me ha mordido un perro en (la/mi) mano.	{la}	2022-04-10 10:06:18.700101
44	7	Tengo (el/mi) coche averiado.	{el}	2022-04-10 10:07:09.110619
45	7	Tienes sangre en (la/tu) mano derecha.	{la}	2022-04-10 10:07:24.701043
36	7	Tengo (las/mis) manos fr??as.	{las}	2022-04-10 10:04:09.608535
46	8	Hemos visto _ nuevo profesor en la cafeter??a.	{al}	2022-04-10 10:09:10.642805
47	8	In??s ha salido (de) _ banco a toda prisa.	{del}	2022-04-10 10:09:38.146918
48	8	Vamos (a) _ cine casi todas las semanas.	{al}	2022-04-10 10:10:03.886216
49	8	??Has le??do el editorial (de) _ Pa??s?	{"de El"}	2022-04-10 10:10:25.548819
50	8	??Salid (de) _ agua ahora mismo!	{del}	2022-04-10 10:11:09.455295
51	8	-??Ad??nde vais? -(a) _ aula de lengua.	{al}	2022-04-10 10:12:00.11392
52	8	Sandra estudia Historia (de) _ Arte.	{del}	2022-04-10 10:12:24.374261
53	8	Este es el ca????n (de) _ arma.	{del}	2022-04-10 10:12:46.192066
54	8	Miguel y Ana han venido (de) _ India muy contentos.	{"de la"}	2022-04-10 10:13:08.19062
55	8	Tengo que llamar (a) _ Sr. S??nchez a la oficina.	{al}	2022-04-10 10:13:26.989463
56	8	Esta noche vamos a cenar (a) _ Rinc??n de Luis.	{al}	2022-04-10 10:13:52.042121
57	8	El domingo haremos una visita (a) _ Escorial.	{"a El"}	2022-04-10 10:14:12.355607
13	4	(El/Un) padre de Lidia es muy simp??tico	{El}	2022-04-10 07:50:22.684019
43	7	T??pate (la/tu) boca con (la/tu) bufanda.	{la,la}	2022-04-10 10:06:57.057917
60	10	Es _ comedia. _ actores son fabulosos. _ pel??cula es sobre _ m??dico que se enamora de _ paciente. _ m??dico no sabe c??mo dec??rselo a _ paciente. Esta tiene _ hijo y _ m??dico tiene _ hija. _ hijo de _ paciente y _ hija de _ m??dico se conocen y se hacen amigos. _ d??a dan _ fiesta e invitan a sus padres a _ fiesta. pel??cula acaba con _ boda de _ padres.	{una,los,la,un,una,el,la,un,el,una,el,la,la,del,un,una,la,la,los}	2022-04-11 14:48:38.493154
61	10	Es _ cuadro muy famoso. Se ve a _ hombre  y _ mujer en _ jard??n. _ hombre est??  leyendo _ libro y _ mujer est?? tumbada debajo de _ ??rbol. En _ ramas de _ ??rbol hay _ p??jaros de muchos colores. _ p??jaros tienen _ alas extendidas; parece que van  a echarse a volar.	{un,un,una,un,el,un,la,un,las,del,unos,los,las}	2022-04-11 14:54:03.65366
62	11	Salta es _ ciudad de Argentina.	{una}	2022-04-11 14:56:11.878381
63	11	Montevideo es _ capital de Uruguay.	{la}	2022-04-11 14:56:28.79305
64	11	_ moto de Pedro es espa??ola.	{la}	2022-04-11 14:56:41.131642
65	11	Tengo _ casa en Segovia.	{una}	2022-04-11 14:57:05.797593
66	11	_ Primer Ministro espa??ol vive en la Moncloa.	{El}	2022-04-11 14:57:22.142508
67	11	Necesito _ pantalones cortos para el verano.	{unos}	2022-04-11 14:57:36.572366
68	11	Hace tiempo que no veo _ ??guila.	{un}	2022-04-11 14:57:55.332672
69	11	Ten cuidado. Has vuelto a olvidar _ llave del portal.	{la}	2022-04-11 14:58:11.820431
70	12	_ peras son mi fruta preferida.	{Las}	2022-04-11 15:00:55.871592
71	12	_ ??guilas vuelan alto.	{Las}	2022-04-11 15:01:12.637881
72	12	He comprado _ naranjas.	{unas}	2022-04-11 15:01:28.722315
73	12	En el zoo hay _ panda.	{un}	2022-04-11 15:01:50.536045
74	12	He cogido _ margaritas para llevar a Sonia.	{unas}	2022-04-11 15:02:06.390674
75	12	_ gorilas est??n en peligro de extinci??n.	{Los}	2022-04-11 15:02:25.837212
76	12	Me encanta _ fruta.	{la}	2022-04-11 15:02:38.030759
77	12	Dame _ euros para comprar algo.	{unos}	2022-04-11 15:02:52.199426
82	13	-??Qu?? pantalones me pongo? -(negro) _. Los otros no me gustan.	{"Los negros"}	2022-04-11 15:07:38.800357
83	13	-Qu?? tipo de sillas vais a comprar? -(pl??stico) _.Son m??s pr??cticas.	{"Unas de pl??stico"}	2022-04-11 15:08:33.840698
84	13	-Qu?? tipo de c??mara usas? -(digital) _. Son m??s pr??cticas.	{"Una digital"}	2022-04-11 15:09:24.933398
85	13	-??Con qu?? chica saliste ayer? -Con (Valencia) _.Es muy simp??tica.	{"la de Valencia"}	2022-04-11 15:09:50.337866
78	13	-??Qu?? libro est??s leyendo? -(Vargas Llosa) _	{"Uno de Vargas Llosa"}	2022-04-11 15:04:38.956833
79	13	-??Qu?? tipo de agenda quiere? -(barato) _	{"Una barata"}	2022-04-11 15:05:51.990036
80	13	-??Has visto mi chaqueta? -??Cu??l? -(lana) _	{"La de lana"}	2022-04-11 15:06:17.651499
81	13	-Necesito un bol??grafo? -??.De qu?? tipo? -Es igual. (azul) _	{"Uno azul"}	2022-04-11 15:06:40.474915
86	14	_ Montejo, ??d??nde est?? _ don Alfonso? -Est?? reunido con _ se??or G??mez.	{-,-,el}	2022-04-12 19:53:19.420283
87	14	Ayer estuvimos con _ Marisa en un restaurante cerca de _ Puerta de Alcal??.	{-,la}	2022-04-12 19:54:30.280463
88	14	_ Pinto son una familia muy original.	{los}	2022-04-12 19:55:08.156245
89	14	??Conoce a _ se??ora Blanco?	{la}	2022-04-12 19:55:26.887672
90	14	_ Sres. Costa quieren ver _ Cibeles de noche.	{los,la}	2022-04-12 19:57:01.804737
91	14	Ha estado aqu?? _ capit??n Moreno. Quer??a hablar con _ general Casado.	{el,el}	2022-04-12 19:57:26.248359
92	14	_ se??orita Blanco, ??sabe d??nde est?? _ ??lvarez?	{-,-}	2022-04-12 19:57:45.293174
93	14	_ se??ora Sulleiro solo Lee _ Voz de Galicia.	{la,la}	2022-04-12 19:58:13.309093
94	14	Hay un mensaje de _ se??or C??rdoba para _ doctor Casal.	{del,el}	2022-04-12 19:58:40.091627
95	14	_ Santiago, compra _ Gaceta de los Negocios cuando salgas.	{-,la}	2022-04-12 19:58:59.981695
96	14	Hoy tengo clase con _ profesora Gal??n.	{la}	2022-04-12 19:59:20.824862
97	14	Aqui mataron a _ Presidente Kennedy.	{al}	2022-04-12 19:59:33.706751
98	14	No he podido hablar con _ Dr. Ros o. Est?? ocupado.	{el}	2022-04-12 19:59:50.972933
99	14	_ L??pez nos esperan en _ Hotel Ritz.	{los,el}	2022-04-12 20:00:09.939828
100	14	??Ha corregido ya tos ex??menes, _ profesor Mata?	{-}	2022-04-12 20:00:37.28936
101	14	_ Sr. Ministro no ha podido asistir hoy al Consejo. 	{el}	2022-04-12 20:00:54.039036
102	15	-??D??nde estudias? -En _ Universidad Aut??noma.	{la}	2022-04-12 20:02:19.560741
103	15	_ r??o Misisip?? est?? en _ Estados Unidos.	{el,los}	2022-04-12 20:02:57.261946
104	15	_ hotel Central est?? en _ Plaza de Roma.	{el,la}	2022-04-12 20:03:16.71141
105	15	-Por favor, ??sabe d??nde est?? _ cine Par??s? -Si", est?? en _ calle Palencia.	{el,la}	2022-04-12 20:03:34.538095
106	15	_ S??hara llega desde _ Oc??ano Atl??ntico hasta _ Mar Rojo.	{el,el,el}	2022-04-12 20:04:11.736052
107	15	Los vinos de _ Rioja son m??s caros que los de _ Mancha.	{la,la}	2022-04-12 20:04:32.968163
108	15	El fin de semana pasado estuvimos en _ Granada y visitamos _ Alhambra. 	{-,la}	2022-04-12 20:04:51.617963
109	15	Siempre veraneamos en _ Rep??blica Dominicana.	{la}	2022-04-12 20:05:06.71754
110	15	En _ India ten??is que visitar _ Benar??s. Es muy interesante.	{la,-}	2022-04-12 20:05:37.65055
111	15	_ Escocia forma parte de _ Reino Unido de _ Gran Breta??a e _ Irlanda del Norte.	{-,del,-,-}	2022-04-12 20:06:09.637833
112	15	_ L??bano tiene frontera con _ Israel.	{el,-}	2022-04-12 20:06:25.751121
113	15	_ Ebro desemboca en _ Mediterr??neo.	{el,el}	2022-04-12 20:06:50.715366
114	15	_ Gran Muralla est?? en el centro de _ Rep??blica Popular China.	{la,la}	2022-04-12 20:07:05.564788
115	15	Este verano queremos ir a _ Argentina. Vamos a recorrer _ Pampa y a llegar hasta _ Tierra del Fuego.	{-,la,-}	2022-04-12 20:07:56.948774
116	16	En _ Salamanca hay que visitar _ Plaza Mayor.	{-,la}	2022-04-12 20:40:35.283395
117	16	_ don Antonio vive en _ Avenida de la Paz.	{-,la}	2022-04-12 20:40:56.522261
118	16	_ Ju??rez viven en _ Ciudad de M??xico.	{los,la}	2022-04-12 20:41:18.594655
119	16	_ Guernica est?? en _ Reina Sof??a.	{el,el}	2022-04-12 20:41:42.220909
120	16	_ pir??mides est??n en _ Cairo.	{los,el}	2022-04-12 20:42:13.488199
121	16	_ Retiro est?? cerca de _ Prado en _ Madrid.	{el,el,-}	2022-04-12 20:43:32.929111
122	16	_ Hamilton no conocen _ Giralda de Sevilla.	{los,la}	2022-04-12 20:43:54.686864
123	16	_ Etna est?? en _ Sicilia.	{el,-}	2022-04-12 20:44:16.320402
124	16	_ Texas es un estado de _ Estados Unidos.	{-,los}	2022-04-12 20:44:37.23657
125	16	_ Sagrada Familia de Gaud?? est?? en _ Barcelona.	{la,-}	2022-04-12 20:45:07.556099
126	16	_ Rep??blica Sudafricana tiene dos capitales, _ Pretoria y _ Ciudad del Cabo.	{la,-,-}	2022-04-12 20:45:38.354347
127	16	_ Taj Mahal es uno de los monumentos m??s importante de _ India.	{-,la}	2022-04-12 20:45:59.223476
128	16	_ Amazonia es el pulm??n de _ Tierra.	{la,la}	2022-04-12 20:46:24.187386
129	16	_ C??cladas est??n en _ mar Egeo.	{las,el}	2022-04-12 20:46:54.287819
130	16	_ Tenerife es isla m??s grande de _ Canarias.	{-,las}	2022-04-12 20:47:15.038795
131	17	Alberto naci?? _ seis de _ diciembre de 2002.	{el,-}	2022-04-13 09:28:15.39672
132	17	-??Qu?? hora es? - _ dos y cinco.	{las}	2022-04-13 09:28:42.404619
133	17	-??Cu??ndo es el examen? - _ martes.	{el}	2022-04-13 09:29:10.773456
134	17	-??Qu?? d??a es hoy? - _ mi??rcoles, _ seis de _ febrero.	{el,-,-}	2022-04-13 09:29:54.445067
135	17	-??Cu??ndo llega Ana? - _ d??a ocho.	{el}	2022-04-13 09:30:22.603594
136	17	-??A qu?? hora com??is? -A _ una y media.	{la}	2022-04-13 09:30:39.236581
137	17	-??Trabajas _ s??bado? -No, _ s??bados no trabajo nunca.	{el,los}	2022-04-13 09:31:06.62011
138	17	El tren sate a _ quince horas.	{las}	2022-04-13 09:31:32.883695
139	17	La exposici??n se inaugura _ dieciocho de _ abril.	{el,-}	2022-04-13 09:32:01.545614
140	17	Se van a casar _ martes, _ trece de _ septiembre.	{el,-,-}	2022-04-13 09:33:04.311333
141	17	Este a??o estoy muy ocupado. _ martes tengo clase de ingl??s y _ jueves tengo dase de piano.	{los,los}	2022-04-13 09:33:32.523566
142	17	-??Qu?? d??a fue ayer? - _ veinticinco de junio.	{-}	2022-04-13 09:33:58.4908
143	18	-??Ves mucho la tele? -Unas (10 horas/semana) _. 	{"diez horas a la semana"}	2022-04-13 09:42:26.227023
144	18	-??Andas mucho? -(2 horas/d??a) _.	{"dos horas al d??a"}	2022-04-13 09:42:51.389382
145	18	-??Viaj??is mucho? -No, (2/a??o) _.	{"dos veces al a??o"}	2022-04-13 09:43:13.68489
146	18	-??Ves mucho a Luis? -(1/mes) _.	{"una vez al mes"}	2022-04-13 09:43:53.464785
147	18	-??Vas mucho al gimnasio? -No, (1 d??a/semana) _.	{"un d??a a la semana"}	2022-04-13 09:44:22.099329
148	18	-??Hablas mucho con tu madre? -S??, (2/d??a) _.	{"dos veces al d??a"}	2022-04-13 09:45:07.656804
149	19	-??Cu??ndo naciste, Alfonso? (12/4/95) _.	{"El doce de abril de 1995"}	2022-04-13 14:14:30.450958
153	19	-??Cu??ndo estudias? -(noche) _.	{"Por la noche"}	2022-04-13 14:16:38.325958
193	34	Sale mucho humo de la cocina. Llama a _ bomberos.	{los}	2022-04-14 14:41:01.337461
152	19	-??A qu?? hora comes? -(2.30) _.	{"A las dos y media"}	2022-04-13 14:16:20.744982
194	34	-??Has o??do _ noticias? -No, nunca escucho _ radio por la ma??ana.	{las,la}	2022-04-14 14:42:39.412035
151	19	-??A qu?? hora vuelves a casa? -(mediod??a) _.	{"A mediod??a"}	2022-04-13 14:15:46.988547
150	19	-??A qu?? hora te levantas para ir a trabajar? -(7.30) _.	{"A las siete y media"}	2022-04-13 14:15:14.554849
154	19	-??Juegas mucho al baloncesto? -(2x/semana) _.	{"Dos veces por semana"}	2022-04-13 14:18:01.342698
155	20	Ma??ana salimos para Berl??n _ madrugada	{de}	2022-04-13 14:23:22.878465
156	20	Siempre me encuentro a los vecinos _ ma??anas.	{"por las"}	2022-04-13 14:23:36.798555
157	20	La gasolina ya est?? a m??s de un euro _ litro.	{el}	2022-04-13 14:23:51.486184
158	20	El gimnasio nos cuesta 200 euros _ trimestre.	{al}	2022-04-13 14:24:03.927056
159	20	Beatriz hace gimnasia tres veces _ semana.	{"a la"}	2022-04-13 14:24:16.766126
160	20	Toda la familia se re??ne en casa _ mediod??a	{a}	2022-04-13 14:24:38.312714
161	20	jugamos al ajedrez _ s??bados _ tarde.	{los,"por la"}	2022-04-13 14:25:09.950994
162	20	Es bueno caminar media hora _ d??a.	{al}	2022-04-13 14:25:31.926658
163	20	Carmen va a revisi??n m??dica una vez _ a??o.	{al}	2022-04-13 14:25:46.204131
164	20	La final de la Champions ser?? _ domingo _ 25 de mayo.	{el,-}	2022-04-13 14:26:11.709674
195	34	Me gusta leer _ peri??dico despu??s de comer.	{el}	2022-04-14 14:42:53.423089
196	34	He o??do _ noticia muy rara.	{una}	2022-04-14 14:43:09.4533
197	34	-??Hay _ teatro por aqu??? -No, solo hay _ cine.	{un,un}	2022-04-14 14:43:33.186131
198	34	-??Vais mucho a _ teatro? -No, vamos m??s a _ cine.	{al,al}	2022-04-14 14:43:55.702194
199	34	Juan se ha comprado _ viol??n antiguo.	{un}	2022-04-14 14:44:09.688299
308	45	Quiero hacer (divertido) _.	{"algo divertido"}	2022-04-19 18:26:12.096856
309	45	Ayer vi a Julia con (sospechoso) _	{"alguien sospechoso"}	2022-04-19 18:27:34.354
310	45	-Te llama Lola. -Lo siento. No quiero hablar con _.	{nadie}	2022-04-19 18:27:58.48816
311	45	-??Qu?? te ha regalado Andr??s? - _. Es muy taca??o.	{nada}	2022-04-19 18:28:24.128177
312	45	??Quieres hacer _ este domingo?	{algo}	2022-04-19 18:28:36.386698
200	35	Luisa ha llamado desde _ aeropuerto. Nos espera.	{el}	2022-04-15 09:02:24.849713
201	35	Mi hermana va a _ universidad en _ autob??s.	{la,-}	2022-04-15 09:03:13.622235
202	35	-??D??nde est?? Roc??o? -En _ clase.	{-}	2022-04-15 09:03:42.800863
203	35	-Va a llover. _ cielo est?? muy nublado.	{El}	2022-04-15 09:04:07.91177
204	35	-Hab??is estado en _ playa este verano? -No, a Piti no le gusta _ mar.	{la,el}	2022-04-15 09:04:34.283831
205	35	??C??mo prefieres volver a _ casa, en _ metro o en _ taxi?	{-,-,-}	2022-04-15 09:05:02.204712
206	35	-??C??mo vas a _ trabajo? -Normalmente voy en _ coche.	{al,-}	2022-04-15 09:05:33.867358
207	35	Vengo de _ banco. Voy a _ dentista..	{del,al}	2022-04-15 09:05:56.50053
208	35	_ avi??n es m??s r??pido que _ tren.	{El,el}	2022-04-15 09:06:16.301522
209	35	Voy a _ Correos. Quiero enviar un paquete.	{-}	2022-04-15 09:06:45.545091
210	35	Prefiero vivir en _ campo. Est??s en contacto con _ naturaleza.	{el,la}	2022-04-15 09:07:04.291708
211	35	??Puedo ir a _ lavabo?	{al}	2022-04-15 09:07:19.568716
231	38	Compra _ pasteles. 	{unos}	2022-04-17 19:10:52.476503
232	38	Ten??is que leer _ estos libros.	{"uno de"}	2022-04-17 19:11:11.842398
233	38	Sof??a es _ las favoritas del concurso.	{"una de"}	2022-04-17 19:11:31.391917
234	38	Puedes ir al concierto con _ tus padres.	{"uno de"}	2022-04-17 19:11:54.971256
235	38	-??Qui??n ha tirado esos papeles? -Ha sido _ ellos.	{"uno de"}	2022-04-17 19:12:05.99085
236	38	-Le ha tocado el premio a _ nosotros, pero no sabemos a qui??n.	{"uno de"}	2022-04-17 19:12:16.644804
237	38	_ vosotras tiene que ayudarme.	{"una de"}	2022-04-17 19:12:32.055419
238	38	He invitado a _ compa??eras m??as.	{unas}	2022-04-17 19:12:50.273258
239	38	_ mis amigas se casa el s??bado.	{"Una de"}	2022-04-17 19:13:07.638457
240	38	Te ha llamado _ amigo.	{un}	2022-04-17 19:13:22.339556
348	50	Necesitamos pan. (+) _	{"Necesitamos m??s pan"}	2022-04-24 16:53:25.959523
241	39	Se han matriculado <u>dos alumnos m??s</u>. _	{"Otros dos alumnos"}	2022-04-17 19:17:53.42805
341	49	Solo tenemos dos velas. Compra _.	{"alguna m??s"}	2022-04-19 18:48:10.208256
230	38	P??same _ esos pasteles, por favor.	{"uno de"}	2022-04-17 19:10:19.339931
242	39	Quiero <u>un vaso diferente</u>. _ 	{"otro vaso"}	2022-04-17 19:31:00.32896
243	39	Prefiero <u>una pel??cula diferente</u>. _	{"otra pel??cula"}	2022-04-17 19:31:32.313056
244	39	Los Fern??ndez han comprado <u>un coche m??s</u>. _	{"otro coche"}	2022-04-17 19:31:57.136207
245	39	Puedes invitar a <u>tres personas m??s</u>. _	{"otras tres personas"}	2022-04-17 19:32:42.171198
313	45	Me gustar??a conocer a (interesante) _.	{"alguien interesante"}	2022-04-19 18:29:02.290815
314	45	Estoy cansada. No tengo ganas de hacer _	{nada}	2022-04-19 18:29:20.512103
319	46	Alicia no conoce a _ mi familia.	{"nadie de"}	2022-04-19 18:31:48.46668
320	46	Me gustar??a ser _ importante.	{alguien}	2022-04-19 18:32:33.608899
321	46	Si tienes un problema, habla con _ la direcci??n.	{"alguien de"}	2022-04-19 18:32:51.311177
322	47	No me llama nadie.	{"Nadie me llama"}	2022-04-19 18:34:18.877409
323	47	No me ha visto nadie.	{"Nadie me ha visto"}	2022-04-19 18:34:44.838986
324	47	Nadie ha visto la pel??cula.	{"No ha visto nadie la pel??cula"}	2022-04-19 18:35:11.324242
325	47	Para Luisa, nada tiene importancia.	{"Para Luisa, no tiene importancia nada"}	2022-04-19 18:35:57.122611
326	47	Nadie quiso acompa??arme 	{"No quiso acompa??arme nadie"}	2022-04-19 18:36:19.560233
327	47	A Luis, nada le altera. 	{"A Luis, no le altera nada"}	2022-04-19 18:36:41.042073
328	48	??Conoces a (+, esos chicos) _?	{"alguno de esos chicos"}	2022-04-19 18:38:46.143157
329	48	No me ha ayudado (-) _	{nadie}	2022-04-19 18:39:09.848777
330	48	??Quiere venir (+) _ al teatro?	{alguien}	2022-04-19 18:39:29.491567
331	48	No quiero (-, tus regalos) _	{"ninguno de tus regalos"}	2022-04-19 18:40:08.865641
332	48	Gabriel no se habla con (-, su clase) _	{"nadie de su clase"}	2022-04-19 18:40:33.843302
333	48	??Te ha regalado Alberto (+) _	{algo}	2022-04-19 18:41:00.979464
334	48	??Conoces a (+, actor) _	{"alg??n actor"}	2022-04-19 18:41:19.013311
335	48	(+, tus amigos) _ son muy antip??ticos.	{"algunos de tus amigos"}	2022-04-19 18:41:39.035275
336	48	No quiere ayudarme (-) _	{nadie}	2022-04-19 18:41:52.845078
337	48	No quiere ayudarme (-, mis compa??eros) _	{"ninguno de mis compa??eros"}	2022-04-19 18:42:11.883952
338	48	-??De qui??n es esto? -No s??. Ser?? de (+, mis t??as) _	{"alguna de mis t??as"}	2022-04-19 18:42:38.841374
339	48	(+, esas tiendas) _ son muy caras.	{"algunas de esas tiendas"}	2022-04-19 18:43:02.177932
340	49	-Ayer me vio Pedro en el parque. -??Te vio _?	{"aquien m??s"}	2022-04-19 18:47:16.258677
342	49	-Ayer estuve en una discoteca con Carmen. -??Te vio _?	{alguien}	2022-04-19 18:49:02.075356
343	49	-P??ngame dos kilos de naranjas y uno de pl??tanos. -Aqui tiene. ??Quiere _? -No, gracias.	{"algo m??s"}	2022-04-19 18:49:42.510742
344	49	-Ya tienes muchas corbatas. -S??, pero quiero _	{"alguna m??s"}	2022-04-19 18:50:05.896012
345	49	Ya tengo dos relojes. No me regales _	{"ninguno m??s"}	2022-04-19 18:50:53.619187
346	49	-He invitado a 20 personas. -No invites a _. Somos muchos.	{"nadie m??s"}	2022-04-19 18:51:13.945729
347	49	Juan y yo vamos a ir a Toledo el domingo. ??Quiere venir _?	{"alguien (m??s)"}	2022-04-19 18:51:39.591939
349	50	Hay que comprar comida. (-) _	{"Hay que comprar menos comida"}	2022-04-24 16:54:32.046019
350	50	Compra dos kilos. (-) _	{"Compra dos kilos m??s"}	2022-04-24 16:55:05.548106
351	50	Echa agua a las plantas. (-) _	{"Echa menos agua a las plantas"}	2022-04-24 16:55:34.609684
352	50	Quiero sopa. (-) _	{"Quiero menos sopa"}	2022-04-24 16:55:53.864684
218	36	Un perro puede ser tan (grande) _ como un lobo.	{grande}	2022-04-15 10:51:33.974844
219	36	Una moto puede ser tan (caro) _ como un coche.	{cara}	2022-04-15 10:51:46.574679
165	21	<p>Mi abuela&nbsp;<br>En 1915 mi abuela (nacer) _ en un peque??o pueblo al norte de Buenos Aires. Aunque sus padres (ser) _ italianos, mi abuela no (hablar) _ italiano, porque en la escuela s??lo (aprender) _ el castellano o espa??ol. (Ser) _ una ni??a muy inteligente que (so??ar) _ con estudiar medicina. Pero sus padres (morir) _ cuando ella (tener) _ 15 a??os. Como (ser) _ la hermana mayor de tres hermanos (tener) _ que trabajar mucho para poder alimentarlos. Mi abuela (casarse) _ cuando (tener) _ 17 a??os. En aquella ??poca (ser) _ normal casarse tan joven, pero ella no (querer) _ casarse tan joven porque (pensar) _ ir a Buenos Aires para estudiar en la Universidad, pero no (tener) _ dinero. (Empezar) _ a trabajar en una f??brica de conservas. La f??brica (pertenecer) _ a la familia m??s rica del pueblo. All?? (conocer) _ a mi abuelo. Mi abuelo tambi??n (trabajar) _ en la f??brica. El (ser) _ un hombre muy fuerte, grande y tambi??n (ser) _ muy simp??tico. Ellos (enamorarse) _ a primera vista y (decidir) _ casarse muy pronto aunque no (tener) _ mucho dinero. En 1943 (nacer) _ su primer hijo, mi t??o Miguel. Dos a??os m??s tarde (nacer) _ mi madre Isabel. Por los ni??os mi abuela ya no (poder) _ trabajar m??s en la f??brica. Por eso, (empezar) _ a hacer conservas en casa para venderlas, como a la gente del pueblo le (gustar) _ mucho las conservas de mi abuela, ella (vender) _ muchas conservas cada d??a y (ganar) _ m??s dinero que en la f??brica. Por eso, mi abuelo (dejar) _ la f??brica tambi??n y (empezar) _ a ayudar a mi abuela con la peque??a tienda que a??os m??s tarde (convertirse) _ en la f??brica m??s grande de la regi??n. Ahora mis abuelos son muy ricos y est??n jubilados, pero mi abuela todav??a hace conservas muy buenas.</p>	{naci??,eran,hablaba,aprendi??,Era,so??aba,murieron,ten??a,era,ten??a,"se cas??",ten??a,era,quer??a,pensaba,ten??a,Empez??,pertenec??a,conoci??,trabajaba,era,era,"se enamoraron",decidieron,ten??an,naci??,naci??,pudo,empez??,gustaban,vend??a,ganaba,dej??,empez??,"se convirti??"}	2022-04-13 15:17:43.443233
212	36	Mis hermanos son igual de (alto) _.	{altos}	2022-04-15 10:22:24.124027
213	36	Ana es tan (alto) _ como su madre.	{alta}	2022-04-15 10:22:35.972737
214	36	Fernando es igual de (guapo) _ que su padre.	{guapo}	2022-04-15 10:49:58.546638
215	36	Roberto y Luis son igual de (simp??tico) _.	{simp??ticos}	2022-04-15 10:50:14.939399
216	36	Nuria es igual de (antip??tico) _ que su hermana.	{antip??tica}	2022-04-15 10:50:30.974134
220	36	Ana y Sof??a son igual de (trabajador) _.	{trabajadoras}	2022-04-15 10:52:01.058591
221	36	Ana es igual de (estudioso) _ que Sof??a.	{estudiosa}	2022-04-15 10:52:14.290979
266	41	_ alumno tiene su mesa.	{cada}	2022-04-17 20:40:56.152868
217	36	Tus amigas son tan (simp??tico) _ como t??.	{simp??ticas}	2022-04-15 10:50:44.87568
222	37	Luisa es m??s antip??tica de lo que yo pensaba.	{"Luisa no es tan simp??tica como yo pensaba"}	2022-04-15 10:55:59.038542
223	37	Mi casa es m??s peque??a que la tuya.	{"Mi casa no es tan grande como la tuya"}	2022-04-15 10:56:44.32742
224	37	Rafa es menos inteligente de lo que piensas. 	{"Rafa no es tan inteligente como piensas"}	2022-04-15 10:58:05.723025
225	37	Leandro es m??s bajo de lo que parece. 	{"Leandro no es tan alto como parece"}	2022-04-15 10:58:59.414151
226	37	Juan es menos trabajador que Alfonso.	{"Juan no es tan trabajador como Alfonso"}	2022-04-15 10:59:26.111592
227	37	Antonio es menos amable que t??.	{"Antonio no es tan amable como t??"}	2022-04-15 11:05:06.884671
228	37	Mis padres son m??s viejos que los tuyos.	{"Mis padres no son tan jovenes como los tuyos"}	2022-04-15 11:05:51.883336
229	37	Alicia es menos joven de lo que dice. 	{"Alicia no es tan joven como dice"}	2022-04-15 11:06:30.317755
246	39	Laura trabaja en <u>una empresa diferente</u>. _	{"otra empresa"}	2022-04-17 19:35:18.8292
248	39	He vendido <u>dos cuadros m??s</u>. _	{"otros dos cuadros"}	2022-04-17 19:36:15.338774
249	39	Ten??is que hacer <u>un examen m??s</u>. _	{"otro examen"}	2022-04-17 19:36:40.160637
250	39	Elsa sale con <u>unas amigas diferentes</u>. _	{"otras amigas"}	2022-04-17 19:37:12.427062
252	39	Ll??mame <u>un d??a diferente</u>. _	{"otro d??a"}	2022-04-17 19:37:51.95496
247	39	P??ngame <u>una cerveza m??s</u>, por favor. _	{"otra cerveza"}	2022-04-17 19:35:38.764245
251	39	Quiero hacerlo <u>una vez m??s</u>. _	{"otra vez"}	2022-04-17 19:37:30.938246
253	40	He recibido _ postal de Carlos	{otra}	2022-04-17 19:40:41.018853
254	40	Mira, ah?? va Rosa con _ sus sombreros.	{"otro de"}	2022-04-17 19:41:00.324519
255	40	P??same la _ jarra. Esta est?? vac??a.	{otra}	2022-04-17 19:41:25.64756
256	40	Necesito que me ayude _ vosotros.	{"otro de"}	2022-04-17 19:41:49.390826
257	40	P??same _ esos pl??tanos, por favor	{"otro de"}	2022-04-17 19:42:15.117644
258	40	Me quedan _ dos a??os para acabar la carrera.	{otros}	2022-04-17 19:42:31.313146
259	40	T??a Sara ya est?? aqu?? y mis _ dos t??as vienen ma??ana.	{otras}	2022-04-17 19:42:47.425331
260	40	Este coche no es muy bueno, pero mi _ coche es un Ferrari.	{otro}	2022-04-17 19:43:06.707898
261	40	Julia vino a verme el _ d??a.	{otro}	2022-04-17 19:43:24.608678
262	40	Ya he le??do _ tus libros.	{"otro de"}	2022-04-17 19:43:45.514725
263	40	La _ tarde estuve con Carlos.	{otra}	2022-04-17 19:44:01.587442
264	40	C??ntame _ tus canciones.	{"otra de"}	2022-04-17 19:44:11.195613
265	41	Pon una botella por _ cuatro invitados.	{cada}	2022-04-17 20:40:31.465207
267	41	Quiero por igual a _ mis hijos.	{"cada uno de"}	2022-04-17 20:41:25.836205
268	41	Os llamar?? uno a uno. Quiero hablar con _ vosotros.	{"cada uno de"}	2022-04-17 20:41:55.737752
269	41	He comprado un regalo para _ mis amigas.	{"cada una de"}	2022-04-17 20:42:17.490611
270	41	Hay que poner flores en _ mesa.	{cada}	2022-04-17 20:42:32.723072
271	41	En casa _ tiene su habitaci??n.	{"cada uno"}	2022-04-17 20:42:47.138331
272	41	??Cu??nto cuesta _ entrada?	{cada}	2022-04-17 20:43:02.221948
273	41	En esta empresa _ tiene su responsabilidad.	{"cada uno"}	2022-04-17 20:43:51.995333
274	41	_ vez que veo esta pel??cula, lloro.	{cada}	2022-04-17 20:44:06.972537
166	22	<p>El mes pasado nosotros (ir) _ de vacaciones a M??laga. (Reservar) _ los billetes y el hotel en una agencia de viajes del centro. El empleado de la agencia nos (asegurar) _ que (ir) iba a estar todo organizado por lo que no (haber) _ raz??n para preocuparse. Nosotros (salir) _ muy temprano de Londres, (hacer) _ un tiempo horrible. (Tratar) _ de dormir un poco en el avi??n, pero (haber) _ mucho ruido. Por eso, (decidir) _ leer el peri??dico mientras (esperar) _ el desayuno. La azafata nos (traer) _ por fin el desayuno, pero el caf?? (estar) _ fr??o y los huevos (tener) _ mucha sal, as?? que no (desayunar) _ nada. Cuando (llegar) _ al aeropuerto (estar) _ muy cansados por el viaje y (tener) _ mucha hambre. En la sala de espera (haber) _ much??sima gente que (esperar) _ a otros pasajeros, pero a nosotros nadie nos (esperar) _. (Recoger) _ el equipaje y (salir) _ del aeropuerto, tambi??n (llover) _ y para colmo de males no (encontrar) _ ning??n taxi libre. Como nosotros no (conocer) _ la ciudad, no (alquilar) _ un coche y (decidir) _ tomar el autob??s. Pero el autob??s (llegar) _ con una hora de retraso. Por fin, (llegar) _ al hotel, cuando (entrar) _, (tener) _ que esperar porque la recepcionista no (estar) _. Unos minutos m??s tarde (llegar) _ y nos (decir) _ que no hab??a recibido nuestra reserva y, lo peor de todo es que no (tener) _ m??s habitaciones libres. Ella (llamar) _ a otros hoteles de la ciudad y finalmente (conseguir) _ una habitaci??n para nosotros en un hotel que (estar) _ un poco lejos de la playa. El problema m??s grande (ser) _ que s??lo (poder) _ quedarnos 3 d??as en esa habitaci??n y despu??s (tener) _ que buscar otro hotel. As?? que el resto de nuestras vacaciones lo (pasar) _ en un peque??o apartamento que no (tener) _ ni cocina. ??Despu??s de estas vacaciones, me alegra mucho estar de nuevo en casa!</p>	{fuimos,Reservamos,asegur??,hab??a,salimos,hac??a,Tratamos,hab??a,decidimos,esper??bamos,trajo,estaba,ten??an,desayunamos,llegamos,est??bamos,ten??amos,hab??a,esperaba,esperaba,Recogimos,salimos,llov??a,encontramos,conoc??amos,alquilamos,decidimos,lleg??,llegamos,entramos,tuvimos,estaba,lleg??,dijo,ten??a,llam??,consigui??,estaba,era,pudimos,tuvimos,pasamos,ten??a}	2022-04-13 16:45:15.653747
167	23	<p>Cuando yo (ser) _ ni??a (tener) _ que tocar antes de abrir la puerta de una habitaci??n y (preguntar) _ si yo (poder) _ entrar. Mis padres me (prohibir) _ hablar cuando (hablar) _ los mayores. Yo no (levantarse) _ de la mesa hasta que todos (terminar) _ de comer. A mis padres les (molestar) _ que mi hermano y yo corri??ramos dentro de la casa, por eso, nosotros (salir) _ a jugar al jard??n. Por supuesto, no (estar) _ permitido jugar antes de terminar todos los deberes para el d??a siguiente. Despu??s de la cena nosotros (lavarse) _ los dientes. Y antes de acostarnos mi madre nos (pedir) _ un beso. Mi padre (preferir) _ que apag??ramos la luz enseguida, aunque mi hermano mayor a veces (poder) _ leer todav??a un rato en la cama. Los fines de semana ellos no (ser) _ tan estrictos con nosotros. Nosotros (poder) _ jugar m??s tiempo en el jard??n e (invitar) _ a nuestros amigos y (ver) _ juntos una pel??cula para ni??os. Tambi??n nosotros (acostarse) _ m??s tarde que entre semana. Pero un d??a nos (visitar) _ la hermana menor de mi padre, la t??a Pepa. Mis padres le (pedir) _ que viniera a cuidarnos mientras ellos (estar) _ en Par??s un fin de semana. La t??a Pepa nos (decir) _ que nosotros (poder) _ hacer todo lo que (querer) _. Nosotros (correr) _ y (jugar) _ en la casa y en el jard??n. Nosotros (ver) _ tele por la noche y (acostarse) _ muy tarde, lo ??nico que ella (querer) _ (ser) _ hablar por tel??fono horas y horas con su novio. Aquel fin de semana (ser) _ muy divertido.</p>	{era,ten??a,preguntaba,pod??a,prohib??an,hablaban,"me levantaba",terminaban,molestaba,sal??amos,estaba,"nos lav??bamos",ped??a,prefer??a,pod??a,eran,pod??amos,invit??bamos,ve??amos,"nos acost??bamos",visit??,pidieron,estaban,dijo,pod??amos,quer??amos,corrimos,jugamos,vimos,"nos acostamos",quer??a,era,fue}	2022-04-13 16:47:56.578108
275	41	Tienes que tomar una de estas pastillas _ ocho horas.	{cada}	2022-04-17 20:44:17.745518
276	41	_ de los regalos cuesta m??s de cien euros.	{"cada uno"}	2022-04-17 20:44:32.956118
277	41	_ debe tomar sus propias decisiones.	{"cada uno"}	2022-04-17 20:44:46.904929
278	42	Ayer vi a _ de tus amigos, a Jorge.	{uno}	2022-04-17 20:46:19.581632
279	42	Llama a todo el mundo. El jefe quiere decirnos algo a _	{todos}	2022-04-17 20:46:41.043335
280	42	??Pongo la ensalada en un plato para _ o en un plato para _	{todos,"cada uno"}	2022-04-17 20:48:07.41085
281	42	-Somos cinco. ??Preparo un bocadillo para _	{"cada uno"}	2022-04-17 20:48:30.610378
282	42	Aqu?? no se puede trabajar bien. Hay solo un ordenador para _	{todos}	2022-04-17 20:48:45.328782
283	42	Solo hay que preparar _ habitaci??n. Solo hay un hu??sped.	{una}	2022-04-17 20:49:01.337587
284	42	-??Compro una botella de agua para _ ? -S??, compra una botella grande.	{todos}	2022-04-17 20:49:17.126119
285	42	Aqu?? solo hay comida para _	{uno}	2022-04-17 20:49:27.275415
286	42	Compra comida para _. Luego te damos el dinero.	{todos}	2022-04-17 20:49:50.809213
287	42	-??Has escrito a tus amigas? -S??, he escrito una carta a _	{todas}	2022-04-17 20:50:14.208991
288	43	Esto lo puedes encontrar en _ tienda.	{cualquier}	2022-04-17 20:52:42.423802
289	43	Eso es complicado. No lo puede hacer _ vosotros.	{"cualquiera de"}	2022-04-17 20:52:58.100678
290	43	Para preparar el examen te sirve _ estos libros.	{"cualquiera de"}	2022-04-17 20:53:13.71668
291	43	Si quieres que te ayude, ven _ ma??ana. Estoy siempre libre.	{cualquier}	2022-04-17 20:53:30.26153
292	43	Usa _ esos ordenadores. Todos funcionan.	{"cualquiera de"}	2022-04-17 20:53:48.666075
293	43	Dale una excusa _. Por ejemplo, que est??s enfermo.	{cualquiera}	2022-04-17 20:54:05.296165
294	43	-??Qu?? quieres comer? -Es igual. Yo como _ cosa.	{cualquier}	2022-04-17 20:54:36.610298
169	25	<p>Querida amiga:</p><p>Espero que t?? (estar) _ muy bien y que todo (ir) _ bien en la universidad. Yo ya estoy en M??xico y he visto algunas cosas muy diferentes. Por ejemplo, es muy interesante que los mexicanos, especialmente en las comunidades rurales, (celebrar) _ con una fiesta el primero de noviembre, el D??a de los Muertos. Me parece muy raro que las personas (ir) _ a los cementerios vestidas de fiesta. Pero aunque es raro, me gusta que los mexicanos (cantar) _, (bailar) _ e -incluso- (comer) _ en los cementerios. Tambi??n es muy extra??o que a los ni??os se les (regalar) _ calaveras de az??car, o esqueletos y huesos de pl??stico de diferentes colores. Pero, adem??s, aqu?? es normal que las personas mayores les (dar) _ esqueletos y calaveras de dulce o pan a sus amigos y familiares.Para algunos mexicanos es importante que (haber) _ un altar para los muertos en su casa, ya que creen que cada a??o, el primero de noviembre, los muertos vuelven para visitar a sus familiares. Por eso, es necesario que las familias (preparar) _ la comida preferida de los muertos y (tomar) _ su bebida predilecta. He tomado muchas fotos que te ense??ar?? cuando (volver) _, pero creo que es mejor que t?? (venir) _ a este pa??s. Estoy seguro de que te encantar??.</p><p>Un abrazo,</p><p>Miguel</p>	{est??s,vaya,celebren,vayan,canten,bailen,coman,regalen,den,haya,preparen,tomen,vuelva,vengas}	2022-04-13 18:12:54.633583
170	26	<p>Seg??n un estudio realizado por la Asociaci??n de Turismo Responsable, los turistas "verdes" prefieren que el alojamiento (ser) _ en casas privadas u hoteles rurales. Estos turistas quieren que los paquetes (incluir) _ actividades que les (permitir) _ disfrutar de la naturaleza de una forma responsable. Para ellos es muy importante que se (cuidar) _ el medio ambiente y al mismo tiempo que ellos (poder) _ pasar unas vacaciones relajantes y (tener) _ la posibilidad de hacer un poco de deporte, por ejemplo, senderismo, nataci??n, etc. En cuanto a la comida los turistas verdes piden que los hoteles les (servir) _ un men?? vegetariano que (tener) _ muchas frutas y verduras frescas. Sin embargo, a veces quieren que los cocineros les (preparar) _ un plato de pescado o mariscos. Finalmente, este tipo de turista no quiere que las empleadas del hotel les (cambiar) _ todos los d??as las toallas y s??banas, ya que opinan que es importante para el planeta que no se (gastar) _ mucha agua y energ??a.</p>	{sea,incluyan,permitan,cuide,puedan,tengan,sirvan,tenga,preparen,cambien,gaste}	2022-04-13 18:15:21.109901
168	24	<span>Cuando yo (ser) _ ni??a (tener) _ que tocar antes de abrir la puerta de una habitaci??n y (preguntar) _ si yo (poder) _ entrar. Mis padres me (prohibir) _ hablar cuando (hablar) _ los mayores. Yo no (levantarse) _ de la mesa hasta que todos (terminar) _ de comer. A mis padres les (molestar) _ que mi hermano y yo corri??ramos dentro de la casa, por eso, nosotros (salir) _ a jugar al jard??n. Por supuesto, no (estar) _ permitido jugar antes de terminar todos los deberes para el d??a siguiente. Despu??s de la cena nosotros (lavarse) _ los dientes. Y antes de acostarnos mi madre nos (pedir) _ un beso. Mi padre (preferir) _ que apag??ramos la luz enseguida, aunque mi hermano mayor a veces (poder) _ leer todav??a un rato en la cama. Los fines de semana ellos no (ser) _ tan estrictos con nosotros. Nosotros (poder) _ jugar m??s tiempo en el jard??n e (invitar) _ a nuestros amigos y (ver) _ juntos una pel??cula para ni??os. Tambi??n nosotros (acostarse) _ m??s tarde que entre semana. Pero un d??a nos (visitar) _ la hermana menor de mi padre, la t??a Pepa. Mis padres le (pedir) _ que viniera a cuidarnos mientras ellos (estar) _ en Par??s un fin de semana. La t??a Pepa nos (decir) _ que nosotros (poder) _ hacer todo lo que (querer) _. Nosotros (correr) _ y (jugar) _ en la casa y en el jard??n. Nosotros (ver) _ tele por la noche y (acostarse) _ muy tarde, lo ??nico que ella (querer) _ (ser) _ hablar por tel??fono horas y horas con su novio. Aquel fin de semana (ser) _ muy divertido.</span>	{era,ten??a,preguntaba,pod??a,prohib??an,hablaban,"me levantaba",terminaban,molestaba,sal??amos,estaba,"nos lav??bamos",ped??a,prefer??a,pod??a,eran,pod??amos,invit??bamos,ve??amos,"nos acost??bamos",visit??,pidieron,estaban,dijo,pod??amos,quer??amos,corrimos,jugamos,vimos,"nos acostamos",quer??a,era,fue}	2022-04-13 16:49:27.00601
171	27	<ol><li>Es bueno que t?? (conocer) _ la cultura hispana.</li><li>Te recomendamos que t?? (probar) _ diferentes estrategias para aprender vocabulario, hay algunas muy divertidas y efectivas.</li><li>Es importante que los alumnos (leer) _ en espa??ol lecturas interesantes.</li><li>Es fundamental que (participar) _ activamente en clase.</li><li>Es aconsejable que los alumnos (tratar) _ de hablar con nativos en espa??ol.</li><li>Es necesario que los alumnos se (comunicar) _ en espa??ol en clase.</li><li>Te aconsejamos que (ver) _ pel??culas en espa??ol y (o??r) _ m??sica hispana.</li><li>Es imprescindible que t?? no te (frustrar) _ si no entiendes algo o no puedes decir lo que quieres.</li><li>Es mejor que t?? (asistir) _ regularmente a un curso de lengua.</li><li>Es recomendable que (hacer) _ tus deberes en casa.</li></ol>	{conozcas,pruebes,lean,participes,traten,comuniquen,veas,oigas,frustres,asistas,hagas}	2022-04-13 18:19:16.153903
295	43	_ tus hermanos te puede ayudar. Todos hablan ingl??s.	{"Cualquiera de"}	2022-04-17 20:55:11.417218
296	43	No es muy dif??cil. _ puede hacerlo.	{Cualquiera}	2022-04-17 20:55:31.620308
297	43	-??Qu?? trabajo quieres hacer? - _. Necesito trabajar.	{Cualquiera}	2022-04-17 20:55:55.628339
298	43	Necesito que me ayude _ vosotros.	{"cualquiera de"}	2022-04-17 20:56:13.403169
299	43	_ mis amigos tiene m??s fuerza que yo.	{"Cualquiera de"}	2022-04-17 20:56:29.602796
300	44	El domingo es el cumplea??os de Antonio. ??Qu?? le regalo? -C??mprale (ced??) _.	{"un ced?? cualquiera"}	2022-04-17 21:00:51.097589
301	44	-??Qu?? pel??cula vemos? -Es igual. _ .	{"(una) cualquiera"}	2022-04-17 21:01:55.212582
303	44	-??A qui??n pregunto? - A (persona) _.	{"cualquier persona"}	2022-04-17 21:02:52.329551
307	44	-??Qu?? falda me pongo? -Ponte (faIda) _. No vamos a ning??n sitio elegante.	{"una falda cualquiera"}	2022-04-17 21:04:58.738568
306	44	D??jame (libro) _. Estoy aburrido.	{"un libro cualquiera"}	2022-04-17 21:04:07.692323
305	44	-Necesitamos una maleta. -Compra (maleta) _. No te gastes mucho dinero.	{"una maleta cualquiera"}	2022-04-17 21:03:39.843555
302	44	-??A qu?? restaurante vamos? - A _. Tengo mucha hambre.	{cualquiera}	2022-04-17 21:02:27.7482
304	44	-??Qu?? camisa me pongo? - _.	{"(Una) cualquiera"}	2022-04-17 21:03:13.06248
315	45	No conozco a _ en la fiesta.	{nadie}	2022-04-19 18:29:37.011284
316	46	Me gustar??a conocer a _ de mi pa??s.	{"alguien de"}	2022-04-19 18:31:00.850738
317	46	No conozco a _  esta clase.	{"nadie de"}	2022-04-19 18:31:17.541318
318	46	No conocemos a _ en Lima.	{nadie}	2022-04-19 18:31:31.695491
172	28	<p><strong>Mandy</strong>: Oye, ??t?? conoces a alguien que (vender) _ un piso? Es que estamos buscando un piso desde hace casi dos a??os y no hemos encontrado ninguno que nos (gustar) _.</p><p><strong>Vicky</strong>: Pues no conozco a nadie que (querer) _ vender su piso. Pero s?? me entero de alguien que (desear) _ vender un piso, te aviso. ??Qu?? tipo de piso est??is buscando?</p><p><strong>Mandy</strong>: Queremos que el piso (ser) _ grande. Ya sabes que somos 3, pero adem??s necesitamos un piso que (tener) _ un estudio que (ser) _ claro y una habitaci??n para hu??spedes porque mis padres suelen visitarnos cuando tienen vacaciones. Por eso, preferimos que en el piso (haber) _ por lo menos 2 ba??os completos, porque ya te imaginar??s c??mo es cuando la familia est?? reunida.</p><p><strong>Vicky</strong>: ??Y os da igual que el piso (estar) _ en las afueras? Porque no es muy f??cil encontrar un piso que (ser) _ grande y (estar) _ en el centro. Sobre todo, os va a costar un ojo de la cara.</p><p><strong>Mandy</strong>: S?? ya sabemos que los pisos en el centro son muy caros. No es necesario que el piso (estar) _ en el centro, pero es muy importante para nosotros que el piso (estar) _ cerca del centro y (estar) _ bien comunicado. T?? sabes que yo trabajo en el centro y la ni??a va a una escuela que est?? tambi??n cerca del centro. Adem??s, preferimos un piso que (ser) _ soleado y tranquilo.</p><p><strong>Vicky</strong>: Uy, chica, no quiero ser pesimista, pero no creo que (haber) _ muchos pisos con esas caracter??sticas.</p><p><strong>Mandy</strong>: ??Qu?? dices? Si s??lo queremos un piso normal y corriente ??No puede ser que (ser) _ tan dif??cil encontrar uno!</p>	{venda,guste,quiera,desee,sea,tenga,sea,haya,est??,sea,est??,est??,est??,est??,sea,haya,sea}	2022-04-13 18:20:42.733874
173	29	<p>Mis padres me dicen que nunca (abrir) _ la puerta de una habitaci??n sin antes tocar y preguntar, si puedo entrar. Me proh??ben que (hablar) _ cuando hablan los mayores. No quieren que me (levantar) _ de la mesa hasta que todos terminen de comer. Les molesta que mi hermano y yo (correr) _ dentro de la casa, por eso, nos piden que (salir) _ a jugar al jard??n. Por supuesto, no est?? permitido que (jugar) _ antes de que terminemos todos los deberes para el d??a siguiente. Despu??s de la cena quieren que nos (lavar) _ los dientes. Y antes de que nos (acostar) _ mi madre nos pide que le (dar) _ un beso. Mi padre prefiere que nosotros (apagar) _ la luz enseguida, aunque mi hermano mayor a veces puede leer todav??a un rato en la cama. Los fines de semana no son tan estrictos con nosotros. Podemos jugar m??s tiempo en el jard??n y, adem??s, mis padres permiten que (invitar) _ a nuestros amigos y (ver) _ juntos una pel??cula para ni??os. Tambi??n podemos acostarnos m??s tarde que entre semana. Pero este fin de semana nos ha visitado la hermana menor de mi padre, la t??a Pepa. Mis padres le han pedido que (venir) _ para cuidarnos mientras ellos est??n en Par??s el fin de semana. La t??a Pepa no nos ha dicho que salgamos a correr y jugar al jard??n. Nos ha permitido que (ver) _ televisi??n por la noche y tampoco le ha molestado que nos acostemos m??s tarde, s??lo nos ha dicho que prefiere que la (dejar) _ hablar por tel??fono horas y horas con su novio. ??Ha sido un fin de semana muy divertido!</p>	{abra,hable,levante,corramos,salgamos,juguemos,lavemos,acostemos,demos,apaguemos,invitemos,veamos,venga,veamos,dejemos}	2022-04-13 18:24:02.441124
174	30	<p>Actualmente en Espa??a los padres les permiten a los hijos que los (tutear) _. Los abuelos tambi??n prefieren que los ni??os los (tratar) _ de t??. Sin embargo, tanto a los padres como a los abuelos les gusta que los ni??os les (mostrar) _ respeto. Cuando los ni??os crecen es normal que (llamar) _ "padre o madre" a sus padres, pero a ellos les da igual que los hijos les (decir) _ "pap?? o mam??". En la universidad es normal que los estudiantes (tutear) _ a los profesores. Ellos quieren que no (existir) _ distancia entre sus estudiantes para que la comunicaci??n (ser) _ m??s f??cil. Entre los colegas de trabajo es importante que (haber) _ mucha confianza. Por eso, casi todos se tutean. Incluso muchos jefes prefieren que sus empleados no los (tratar) _ de usted.</p>	{tuteen,traten,muestren,llamen,digan,tuteen,exista,sea,haya,traten}	2022-04-13 18:26:27.774932
175	32	<p>(Estar) _&nbsp;anocheciendo cuando Manolo sali?? del instituto. Se.(parar) _&nbsp;en las escaleras para hablar con un compa??ero. Entonces (ver) _&nbsp;que se (acercar) _&nbsp;el autob??s escolar a la parada que hab??a al otro lado de la calle. Le (decir) _&nbsp;adi??s a su amigo r??pidamente,(bajar)&nbsp;_ las escaleras corriendo y (cruzar) _&nbsp;la calle. (Haber)&nbsp;_ mucho tr??fico y cuando&nbsp;_ (llegar) al otro lado de la calle, el autob??s ya&nbsp;(marcharse) _ Manolo (perder) _&nbsp;el autob??s y no (haber) _ otro hasta dos horas m??s tarde.</p>	{Estaba,Par??,Vio,Acercaba,Dijo,Baj??,Cruz??,Hab??a,Lleg??,"Hab??a marchado","Hab??a perdido",Hab??a}	2022-04-14 08:00:23.041654
177	33	Pedro est?? en Brasil aprendiendo _ portugu??s.	{-}	2022-04-14 14:34:04.136512
176	32	<p>Manolo (mirar) _&nbsp;su reloj. (Ser) _&nbsp;las siete menos cinco y sus padres lo esperaban a las ocho en casa. (Pensar) _&nbsp;que se iban a enfadar much??simo. (Tener) _&nbsp;que llegar a su casa a las ocho como fuera. Entonces (tener) _&nbsp;una idea. Muy cerca, al final de la calle, (haber)&nbsp;_&nbsp;un mercado que (cerrar) _&nbsp;a las siete. All?? (haber) _&nbsp;muchos camiones que (ir) _&nbsp;por la carretera que (llevar) _ a su pueblo.</p>	{Mir??,Eran,Pens??,Ten??a,Tuvo,Hab??a,Cerraba,Hab??a,Iban,Llevaba}	2022-04-14 08:06:01.78133
178	33	_ nataci??n es un deporte muy completo.	{La}	2022-04-14 14:34:20.357209
179	33	_ piano es un instrumento muy dif??cil	{El}	2022-04-14 14:34:31.510203
180	33	Laura ense??a _ Geograf??a en un instituto.	{-}	2022-04-14 14:34:47.121786
181	33	Mis tres hijos estudian _ piano.	{-}	2022-04-14 14:34:57.855593
182	33	Me re??no con unos amigos para jugar a _ cartas los s??bados.	{las}	2022-04-14 14:35:12.305488
183	33	-??Juegas a _ f??tbol? -No, _ f??tbol me aburre.	{al,el}	2022-04-14 14:35:36.139586
184	33	??D??nde puedo aprender _ ??rabe?	{-}	2022-04-14 14:35:55.288366
185	33	-??Haces _ nataci??n? -No, solo hago _ gimnasia.	{-,-}	2022-04-14 14:36:19.243356
186	33	??Qui??n sabe hablar _ sueco?	{-}	2022-04-14 14:36:42.590247
187	33	??Alguien de vosotros toca _ guitarra?	{la}	2022-04-14 14:36:57.387884
188	33	Estudiar _ ruso es duro. Es m??s dif??cil que _ alem??n.	{-,el}	2022-04-14 14:37:44.422085
189	33	A veces jugamos a _ dados en la cafeter??a.	{los}	2022-04-14 14:38:02.48751
190	33	No debes tocar _ flauta de madrugada, Mariano.	{la}	2022-04-14 14:38:13.906681
191	34	Hay alguien en el s??tano. Llama a _ polic??a.	{la}	2022-04-14 14:40:27.680014
192	34	_ euro est?? m??s fuerte que _ d??lar.	{el,el}	2022-04-14 14:40:46.404009
353	50	Han venido otros dos invitados. (+) _	{"Han venido otros dos invitados m??s"}	2022-04-24 16:56:19.334844
354	50	Hoy hace fr??o. (+) _	{"Hoy hace m??s fr??o"}	2022-04-24 16:56:39.905209
355	50	Me han dado veinte euros. (-) _	{"Me han dado veinte euros menos"}	2022-04-24 16:57:02.495762
356	50	Necesito otra hora. (+) _	{"Necesito otra hora m??s"}	2022-04-24 16:57:18.283267
357	50	Hoy tengo tiempo, (+) _	{"Hoy tengo m??s tiempo"}	2022-04-24 16:57:38.751089
358	51	-He comprado dos kilos de naranjas. -Compra (1) _ Somos muchos.	{"un kilo m??s"}	2022-04-24 16:59:35.158363
359	51	-Hoy hace fr??o. -Si, pero ayer hizo _.	{m??s}	2022-04-24 17:00:00.820278
360	51	-En mi calle hay muchos ??rboles. -S??, pero en la m??a hay _	{m??s}	2022-04-24 17:00:30.468015
361	51	-Tengo poco dinero. -Pues yo tengo _.	{menos}	2022-04-24 17:01:12.603825
362	51	-Tenemos cinco hijos. -Nosotros tenemos (2) _ .Tenemos tres.	{"dos menos"}	2022-04-24 17:01:35.722709
363	51	 -Tengo poca suerte. -Pues yo tengo _.	{menos}	2022-04-24 17:01:55.301719
364	51	-Hay seis sillas. -Necesitamos (1) _. Somos siete.	{"una m??s"}	2022-04-24 17:02:45.655558
365	51	-Hoy hay mucha gente. -S??, pero ayer hubo _.	{m??s}	2022-04-24 17:03:00.686174
366	51	-Tengo seis copas. -Necesitamos (3) _. Vamos a ser nueve.	{"tres m??s"}	2022-04-24 17:03:18.300164
367	51	-Tengo dos ordenadores. -Yo tengo (1) _. Tengo tres.	{"uno m??s"}	2022-04-24 17:03:37.869835
368	52	Aqu?? no hay mucha gente. Hay _ veinticinco personas.	{"menos de"}	2022-04-24 17:06:08.992747
369	52	No hay suficiente. Necesitamos _ comida.	{m??s}	2022-04-24 17:06:28.736585
370	52	Cinco kilos son muchas. Compra _ naranjas.	{menos}	2022-04-24 17:06:47.486629
371	52	Fue un gran ??xito. Hab??a _ mil personas.	{"m??s de"}	2022-04-24 17:07:07.32002
372	52	Eso es muy caro. No pagues _ cincuenta euros.	{"m??s de"}	2022-04-24 17:07:58.601938
373	52	Daniel tiene una gran colecci??n de plumas. Tiene _ quinientas.	{"m??s de"}	2022-04-24 17:08:21.601948
374	52	Hay mucha gente. Necesitamos _ sillas.	{m??s}	2022-04-24 17:08:35.904194
375	52	Si cuesta _ diez euros, es barato.	{"menos de"}	2022-04-24 17:08:54.402167
376	52	Sara no puede entrar al casino. Tiene _ dieciocho a??os.	{"menos de"}	2022-04-24 17:09:13.775533
377	52	Trabajas mucho. Tienes que trabajar _ horas.	{menos}	2022-04-24 17:09:29.287386
378	53	Julio / tiene / + / corbata / Rafa 	{"Julio tiene m??s corbatas que Rafa"}	2022-04-24 17:11:21.662402
379	53	Ana / tiene / = pulsera / yo	{"Ana tiene tantas pulseras como yo"}	2022-04-24 17:11:55.654057
380	53	En esta ciudad / hay / + / tr??fico / en Madrid 	{"En esta ciudad hay m??s tr??fico que en Madrid"}	2022-04-24 17:12:43.821718
381	53	T?? / tienes / + / vacaciones / Marta 	{"T?? tienes m??s vacaciones que Marta"}	2022-04-24 17:13:23.267892
382	53	Hoy / hace / = / calor / ayer 	{"Hoy hace tanto calor como ayer"}	2022-04-24 17:13:53.291839
383	53	Hoy / hay / + / nube 	{"Hoy hay m??s nubes"}	2022-04-24 17:14:27.379807
384	53	Hugo / tiene / - / juguete / su hermana 	{"Hugo tiene menos juguetes que su hermana"}	2022-04-24 17:15:19.503018
385	53	Hoy / tengo / - / sue??o / anoche	{"Hoy tengo menos sue??o que anoche"}	2022-04-24 17:16:10.23591
386	53	Hoy / hay / = / gente / el domingo pasado 	{"Hoy hay tanta gente como el domingo pasado"}	2022-04-24 17:16:43.926082
387	53	No hablo / = / idioma / mi padre 	{"No hablo tantas idiomas como mi padre"}	2022-04-24 17:17:06.469971
388	54	-Tienes mucha suerte. -Pues t?? tienes _.	{"tanta corno yo"}	2022-04-24 17:18:46.226022
389	54	-Tengo muchas vacaciones. Treinta d??as. -Yo no tengo _. Solo veinte d??as.	{"tantas (como t??)"}	2022-04-24 17:19:33.959731
390	54	-Ayer hizo mucho fr??o. -Pues hoy hace _	{"tanto como ayer"}	2022-04-24 17:20:07.370211
391	54	-En mi empresa hay muchos trabajadores. -Pues en mi empresa no hay _.	{"tantos (como en la tuya)"}	2022-04-24 17:21:16.915211
392	54	-Bebo mucha agua. Dos litros al d??a. -Pues yo no bebo _. La mitad.	{"tanta (como t??)"}	2022-04-24 17:21:51.48963
393	54	-Rosana tiene casi treinta alumnos. -Pues yo no tengo _.	{"tantos (como ella)"}	2022-04-24 17:22:09.347936
\.


--
-- Name: examples_example_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.examples_example_id_seq', 23, true);


--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercise_id_seq', 54, true);


--
-- Name: grammar_grammar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grammar_grammar_id_seq', 34, true);


--
-- Name: sub_exercise_sub_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_exercise_sub_exercise_id_seq', 393, true);


--
-- Name: examples examples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_pkey PRIMARY KEY (example_id);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id);


--
-- Name: grammar grammar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grammar
    ADD CONSTRAINT grammar_pkey PRIMARY KEY (grammar_id);


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
-- Name: examples examples_grammar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_grammar_id_fkey FOREIGN KEY (grammar_id) REFERENCES public.grammar(grammar_id);


--
-- Name: exercise exercise_grammar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_grammar_id_fkey FOREIGN KEY (grammar_id) REFERENCES public.grammar(grammar_id);


--
-- Name: sub_exercise sub_exercise_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_exercise
    ADD CONSTRAINT sub_exercise_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise(exercise_id);


--
-- PostgreSQL database dump complete
--

