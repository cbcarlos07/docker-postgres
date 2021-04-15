--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE catupiry_db;
DROP DATABASE libbs_db;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md59df270eb52907fff723d9b8b7436113a';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "catupiry_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: catupiry_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE catupiry_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE catupiry_db OWNER TO postgres;

\connect catupiry_db

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
-- Name: action_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_type (
    id_action_type integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.action_type OWNER TO postgres;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id_channel integer NOT NULL,
    name character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: id_action_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_action_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_action_type_seq OWNER TO postgres;

--
-- Name: id_action_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_action_type_seq OWNED BY public.action_type.id_action_type;


--
-- Name: id_channel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_channel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_channel_seq OWNER TO postgres;

--
-- Name: id_channel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_channel_seq OWNED BY public.channel.id_channel;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    url character varying(100) NOT NULL,
    icon character varying(100),
    order_menu integer DEFAULT 0 NOT NULL,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_menu_seq OWNER TO postgres;

--
-- Name: id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    id_office integer NOT NULL,
    description character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.office OWNER TO postgres;

--
-- Name: id_office_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_office_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_office_seq OWNER TO postgres;

--
-- Name: id_office_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_office_seq OWNED BY public.office.id_office;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_users integer NOT NULL,
    name character varying(200) NOT NULL,
    username character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    password character varying(255) NOT NULL,
    id_office integer NOT NULL,
    blocked boolean NOT NULL,
    photo character varying(100),
    id_status integer NOT NULL,
    pass_changed boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: id_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_users_seq OWNER TO postgres;

--
-- Name: id_users_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_users_seq OWNED BY public.users.id_users;


--
-- Name: office_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office_menu (
    id_office_menu integer NOT NULL,
    id_office integer NOT NULL,
    id_menu integer NOT NULL
);


ALTER TABLE public.office_menu OWNER TO postgres;

--
-- Name: iid_office_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iid_office_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iid_office_menu_seq OWNER TO postgres;

--
-- Name: iid_office_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iid_office_menu_seq OWNED BY public.office_menu.id_office_menu;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    description character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: iid_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iid_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iid_status_seq OWNER TO postgres;

--
-- Name: iid_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iid_status_seq OWNED BY public.status.id_status;


--
-- Name: investments_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investments_manager (
    id_invmanager integer NOT NULL,
    id_users integer NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    amount numeric(13,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.investments_manager OWNER TO postgres;

--
-- Name: investments_manager_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investments_manager_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investments_manager_seq OWNER TO postgres;

--
-- Name: investments_manager_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investments_manager_seq OWNED BY public.investments_manager.id_invmanager;


--
-- Name: investments_supervisor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investments_supervisor (
    id_invsupervisor integer NOT NULL,
    id_invmanager integer NOT NULL,
    id_action_type integer NOT NULL,
    id_channel integer NOT NULL,
    name_manager character varying(255) NOT NULL,
    action_details character varying(255) NOT NULL,
    amount numeric(13,2) NOT NULL,
    date_initial date NOT NULL,
    date_end date NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    id_users integer NOT NULL
);


ALTER TABLE public.investments_supervisor OWNER TO postgres;

--
-- Name: investments_supervisor_id_invcli_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investments_supervisor_id_invcli_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investments_supervisor_id_invcli_seq OWNER TO postgres;

--
-- Name: investments_supervisor_id_invcli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investments_supervisor_id_invcli_seq OWNED BY public.investments_supervisor.id_invsupervisor;


--
-- Name: validate_password; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validate_password (
    id_valpass integer NOT NULL,
    id_users integer NOT NULL,
    pwd character varying(255) NOT NULL,
    dt_password date DEFAULT now() NOT NULL,
    dt_pwd_expires date NOT NULL,
    time_validate integer NOT NULL,
    changed boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.validate_password OWNER TO postgres;

--
-- Name: COLUMN validate_password.time_validate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.validate_password.time_validate IS 'Validade em meses 
Exemplo: 3, significa três meses';


--
-- Name: validate_password_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.validate_password_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validate_password_seq OWNER TO postgres;

--
-- Name: validate_password_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.validate_password_seq OWNED BY public.validate_password.id_valpass;


--
-- Name: action_type id_action_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_type ALTER COLUMN id_action_type SET DEFAULT nextval('public.id_action_type_seq'::regclass);


--
-- Name: channel id_channel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id_channel SET DEFAULT nextval('public.id_channel_seq'::regclass);


--
-- Name: investments_manager id_invmanager; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_manager ALTER COLUMN id_invmanager SET DEFAULT nextval('public.investments_manager_seq'::regclass);


--
-- Name: investments_supervisor id_invsupervisor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor ALTER COLUMN id_invsupervisor SET DEFAULT nextval('public.investments_supervisor_id_invcli_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.id_menu_seq'::regclass);


--
-- Name: office id_office; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN id_office SET DEFAULT nextval('public.id_office_seq'::regclass);


--
-- Name: office_menu id_office_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu ALTER COLUMN id_office_menu SET DEFAULT nextval('public.iid_office_menu_seq'::regclass);


--
-- Name: status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.iid_status_seq'::regclass);


--
-- Name: users id_users; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_users SET DEFAULT nextval('public.id_users_seq'::regclass);


--
-- Name: validate_password id_valpass; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password ALTER COLUMN id_valpass SET DEFAULT nextval('public.validate_password_seq'::regclass);


--
-- Data for Name: action_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_type (id_action_type, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id_channel, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: investments_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investments_manager (id_invmanager, id_users, month, year, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: investments_supervisor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investments_supervisor (id_invsupervisor, id_invmanager, id_action_type, id_channel, name_manager, action_details, amount, date_initial, date_end, created_at, updated_at, id_users) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, name, description, url, icon, order_menu, parent_id, created_at, updated_at) FROM stdin;
2	Usuário	Lista de usuários	#	perm_identity	1	0	2021-01-04 19:22:00	2021-01-04 19:22:00.077958
3	Planejamento	Menu	#	payment	1	0	2021-01-04 21:19:01	2021-01-04 21:19:01.592487
1	Gerente	Lista de Planejamento	invimanager	attach_money	1	3	2021-01-04 19:20:46	2021-01-04 19:20:46.276242
4	Supervisor	Lista de planejamento de supervisor	invsupervisor	monetization_on	3	2	2021-01-04 21:22:58	2021-01-04 21:22:58.775255
5	Tipo de Ação	Lista de tipo de ação	tipoacao	build	4	0	2021-01-04 21:27:25	2021-01-04 21:27:25.5973
6	Usuário	Lista de usuários	usuario	supervised_user_circle	1	2	2021-01-04 21:28:58	2021-01-04 21:28:58.986551
7	Cargo	Lista de cargos	cargo	wysiwyg	2	2	2021-01-04 21:29:23	2021-01-04 21:29:23.350536
8	Menu	Lista de menu	menu	view_headline	2	2	2021-01-04 21:30:37	2021-01-04 21:30:37.398139
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (id_office, description, created_at, updated_at) FROM stdin;
1	Administrador++	2021-01-04 19:24:26	2021-01-04 19:24:26.502801
\.


--
-- Data for Name: office_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office_menu (id_office_menu, id_office, id_menu) FROM stdin;
1	1	1
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id_status, description, created_at, updated_at) FROM stdin;
1	Ativo	2021-01-04 19:30:41	2021-01-04 19:30:41.636003
2	Inativo	2021-01-04 19:30:47	2021-01-04 19:30:47.990858
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_users, name, username, email, cpf, password, id_office, blocked, photo, id_status, pass_changed, created_at, updated_at) FROM stdin;
3	Carlos Bruno	carlos.brito	carlos@ipdvonline.com.br	83457468451	$2b$10$SThbogqFPWQvKLsSyFc.UOkn17ubgO44EvOk0VxufmuFQ0FbkGadm	1	f	\N	1	f	2021-01-04 19:36:04	2021-01-04 19:36:04.354145
4	Carlos Bruno	carlos.brito	carlos@ipdvonline.com.br	83457468451	$2b$10$.92HZOibJnIJ81OCMySHtOYYaEbaheuwJ8/YpYakRb7D4.pPqwPnu	1	f	\N	1	f	2021-01-04 19:38:32	2021-01-04 19:38:32.890318
2	carlos.brito	carlos.brito	carlos@ipdvonline.com.br	83457468451	$2b$10$SgLdcG7bdfO288gxG6oUSO0nCHEZtFPADkSx8UQj/3qmtw6sIlPeG	1	f	\N	1	f	2021-01-04 19:35:59	2021-01-04 19:35:59.613659
\.


--
-- Data for Name: validate_password; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.validate_password (id_valpass, id_users, pwd, dt_password, dt_pwd_expires, time_validate, changed, created_at, updated_at) FROM stdin;
\.


--
-- Name: id_action_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_action_type_seq', 1, false);


--
-- Name: id_channel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_channel_seq', 1, false);


--
-- Name: id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_menu_seq', 8, true);


--
-- Name: id_office_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_office_seq', 3, true);


--
-- Name: id_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_users_seq', 4, true);


--
-- Name: iid_office_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iid_office_menu_seq', 2, true);


--
-- Name: iid_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iid_status_seq', 3, true);


--
-- Name: investments_manager_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investments_manager_seq', 1, false);


--
-- Name: investments_supervisor_id_invcli_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investments_supervisor_id_invcli_seq', 1, false);


--
-- Name: validate_password_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.validate_password_seq', 1, false);


--
-- Name: action_type at_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_type
    ADD CONSTRAINT at_id_pk PRIMARY KEY (id_action_type);


--
-- Name: channel channel_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_id_pk PRIMARY KEY (id_channel);


--
-- Name: office id_office_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT id_office_pk PRIMARY KEY (id_office);


--
-- Name: users id_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_users);


--
-- Name: validate_password id_vpass_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password
    ADD CONSTRAINT id_vpass_pk PRIMARY KEY (id_valpass);


--
-- Name: investments_supervisor invcli_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor
    ADD CONSTRAINT invcli_id_pk PRIMARY KEY (id_invsupervisor);


--
-- Name: investments_manager ip_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_manager
    ADD CONSTRAINT ip_id_pk PRIMARY KEY (id_invmanager);


--
-- Name: menu menu_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_id_pk PRIMARY KEY (id_menu);


--
-- Name: office_menu office_menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT office_menu_pk PRIMARY KEY (id_office_menu);


--
-- Name: status status_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_id_pk PRIMARY KEY (id_status);


--
-- Name: investments_supervisor action_type_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor
    ADD CONSTRAINT action_type_investiment_client_fk FOREIGN KEY (id_action_type) REFERENCES public.action_type(id_action_type);


--
-- Name: investments_supervisor channel_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor
    ADD CONSTRAINT channel_investiment_client_fk FOREIGN KEY (id_channel) REFERENCES public.channel(id_channel);


--
-- Name: investments_supervisor investments_product_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor
    ADD CONSTRAINT investments_product_investiment_client_fk FOREIGN KEY (id_invmanager) REFERENCES public.investments_manager(id_invmanager);


--
-- Name: office_menu menu_office_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT menu_office_menu_fk FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: office_menu office_office_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT office_office_menu_fk FOREIGN KEY (id_office) REFERENCES public.office(id_office) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users office_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT office_users_fk FOREIGN KEY (id_office) REFERENCES public.office(id_office);


--
-- Name: users status_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT status_users_fk FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- Name: investments_supervisor users_investments_manager_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_supervisor
    ADD CONSTRAINT users_investments_manager_fk FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- Name: investments_manager users_investments_manager_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_manager
    ADD CONSTRAINT users_investments_manager_fk1 FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- Name: validate_password users_validate_password_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password
    ADD CONSTRAINT users_validate_password_fk FOREIGN KEY (id_users) REFERENCES public.users(id_users) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "libbs_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: libbs_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE libbs_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE libbs_db OWNER TO postgres;

\connect libbs_db

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
-- Name: insert_validate_pwd_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_validate_pwd_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        
        DECLARE v_newDate DATE;
        BEGIN
            IF OLD.pass_changed = TRUE OR NEW.pass_changed = TRUE THEN
                INSERT INTO debug_trigger (campo1) VALUES( 'ALTERADO '  );

                IF NEW.password <> OLD.password THEN

                    SELECT  CURRENT_DATE + INTERVAL '3 MONTH' INTO v_newDate;
                        INSERT INTO validate_password (id_users, pwd, dt_password, dt_pwd_expires, time_validate, changed, created_at)
                    VALUES (NEW.id_users, NEW.password, NOW(), v_newDate, 3, false, NOW() );
                    
                END IF;

            END IF;    
            
            RETURN NEW;
        END;
    $$;


ALTER FUNCTION public.insert_validate_pwd_update() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_type (
    id_action_type integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.action_type OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id_category integer NOT NULL,
    description character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_description_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_description_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_description_seq OWNER TO postgres;

--
-- Name: category_description_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_description_seq OWNED BY public.category.description;


--
-- Name: category_id_category_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_category_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_category_seq_1 OWNER TO postgres;

--
-- Name: category_id_category_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_category_seq_1 OWNED BY public.category.id_category;


--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id_channel integer NOT NULL,
    name character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    name character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_client_seq OWNER TO postgres;

--
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- Name: debug_trigger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debug_trigger (
    id integer NOT NULL,
    campo1 character varying(100) NOT NULL
);


ALTER TABLE public.debug_trigger OWNER TO postgres;

--
-- Name: debug_trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.debug_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.debug_trigger_id_seq OWNER TO postgres;

--
-- Name: debug_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.debug_trigger_id_seq OWNED BY public.debug_trigger.id;


--
-- Name: id_action_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_action_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_action_type_seq OWNER TO postgres;

--
-- Name: id_action_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_action_type_seq OWNED BY public.action_type.id_action_type;


--
-- Name: id_channel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_channel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_channel_seq OWNER TO postgres;

--
-- Name: id_channel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_channel_seq OWNED BY public.channel.id_channel;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    icon character varying(100),
    order_menu integer DEFAULT 0 NOT NULL,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now(),
    url character varying(100)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_menu_seq OWNER TO postgres;

--
-- Name: id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    id_office integer NOT NULL,
    description character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.office OWNER TO postgres;

--
-- Name: id_office_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_office_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_office_seq OWNER TO postgres;

--
-- Name: id_office_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_office_seq OWNED BY public.office.id_office;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id_product integer NOT NULL,
    description character varying(200) NOT NULL,
    ean character varying(50) NOT NULL,
    id_category integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: id_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_product_seq OWNER TO postgres;

--
-- Name: id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_product_seq OWNED BY public.product.id_product;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_users integer NOT NULL,
    name character varying(200) NOT NULL,
    username character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    password character varying(255) NOT NULL,
    id_office integer NOT NULL,
    blocked integer DEFAULT 0 NOT NULL,
    photo character varying(100),
    id_status integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    pass_changed boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.pass_changed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.pass_changed IS 'Identifica se a senha já foi alterada';


--
-- Name: id_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_users_seq OWNER TO postgres;

--
-- Name: id_users_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_users_seq OWNED BY public.users.id_users;


--
-- Name: office_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office_menu (
    id_office_menu integer NOT NULL,
    id_office integer NOT NULL,
    id_menu integer NOT NULL
);


ALTER TABLE public.office_menu OWNER TO postgres;

--
-- Name: iid_office_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iid_office_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iid_office_menu_seq OWNER TO postgres;

--
-- Name: iid_office_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iid_office_menu_seq OWNED BY public.office_menu.id_office_menu;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    description character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: iid_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iid_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iid_status_seq OWNER TO postgres;

--
-- Name: iid_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iid_status_seq OWNED BY public.status.id_status;


--
-- Name: investments_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investments_client (
    id_invcli integer NOT NULL,
    id_invpro integer NOT NULL,
    id_client integer NOT NULL,
    id_action_type integer NOT NULL,
    id_channel integer NOT NULL,
    name_manager character varying(255) NOT NULL,
    action_details character varying(255) NOT NULL,
    amount numeric(13,2) NOT NULL,
    date_initial date NOT NULL,
    date_end date NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.investments_client OWNER TO postgres;

--
-- Name: investments_client_id_invcli_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investments_client_id_invcli_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investments_client_id_invcli_seq OWNER TO postgres;

--
-- Name: investments_client_id_invcli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investments_client_id_invcli_seq OWNED BY public.investments_client.id_invcli;


--
-- Name: investments_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investments_product (
    id_invpro integer NOT NULL,
    id_product integer NOT NULL,
    year integer NOT NULL,
    amount numeric(13,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.investments_product OWNER TO postgres;

--
-- Name: investments_product_id_invpro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investments_product_id_invpro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investments_product_id_invpro_seq OWNER TO postgres;

--
-- Name: investments_product_id_invpro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investments_product_id_invpro_seq OWNED BY public.investments_product.id_invpro;


--
-- Name: validate_password; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validate_password (
    id_valpass integer NOT NULL,
    id_users integer NOT NULL,
    pwd character varying(255) NOT NULL,
    dt_password date DEFAULT now() NOT NULL,
    time_validate integer NOT NULL,
    changed boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    dt_pwd_expires date
);


ALTER TABLE public.validate_password OWNER TO postgres;

--
-- Name: COLUMN validate_password.time_validate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.validate_password.time_validate IS 'Validade em meses 
Exemplo: 3, significa três meses';


--
-- Name: validate_password_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.validate_password_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validate_password_seq OWNER TO postgres;

--
-- Name: validate_password_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.validate_password_seq OWNED BY public.validate_password.id_valpass;


--
-- Name: action_type id_action_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_type ALTER COLUMN id_action_type SET DEFAULT nextval('public.id_action_type_seq'::regclass);


--
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq_1'::regclass);


--
-- Name: category description; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN description SET DEFAULT nextval('public.category_description_seq'::regclass);


--
-- Name: channel id_channel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id_channel SET DEFAULT nextval('public.id_channel_seq'::regclass);


--
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- Name: debug_trigger id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debug_trigger ALTER COLUMN id SET DEFAULT nextval('public.debug_trigger_id_seq'::regclass);


--
-- Name: investments_client id_invcli; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client ALTER COLUMN id_invcli SET DEFAULT nextval('public.investments_client_id_invcli_seq'::regclass);


--
-- Name: investments_product id_invpro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_product ALTER COLUMN id_invpro SET DEFAULT nextval('public.investments_product_id_invpro_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.id_menu_seq'::regclass);


--
-- Name: office id_office; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN id_office SET DEFAULT nextval('public.id_office_seq'::regclass);


--
-- Name: office_menu id_office_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu ALTER COLUMN id_office_menu SET DEFAULT nextval('public.iid_office_menu_seq'::regclass);


--
-- Name: product id_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id_product SET DEFAULT nextval('public.id_product_seq'::regclass);


--
-- Name: status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.iid_status_seq'::regclass);


--
-- Name: users id_users; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_users SET DEFAULT nextval('public.id_users_seq'::regclass);


--
-- Name: validate_password id_valpass; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password ALTER COLUMN id_valpass SET DEFAULT nextval('public.validate_password_seq'::regclass);


--
-- Data for Name: action_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_type (id_action_type, name, description, created_at, updated_at) FROM stdin;
2	PAREDÃO ATRÁS DO BALCÃO	\N	2020-12-20 18:49:10	2020-12-20 18:49:10.659949
3	CONTRATO DE BÔNUS DE CRESCIMENTO	\N	2020-12-20 18:49:26	2020-12-20 18:49:26.49865
1	TABLÓIDE FOCO EM PREÇO - RODAPÉ	desc	2020-12-20 22:48:40	2020-12-20 22:48:40.416
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id_category, description, created_at, updated_at) FROM stdin;
1	Dermatológicos	2020-12-20 18:57:02	2020-12-20 18:57:02.542673
2	Cardiológicos	2020-12-20 18:57:09	2020-12-20 18:57:09.211149
3	Ginecológicos	2020-12-20 18:57:15	2020-12-20 18:57:15.514018
4	Gástricos	2020-12-20 18:57:20	2020-12-20 18:57:20.3712
5	Oncológicos	2020-12-21 02:57:25	2020-12-21 02:57:25.127
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id_channel, name, created_at, updated_at) FROM stdin;
1	Direto	2020-12-20 18:59:44	2020-12-20 18:59:44.165146
2	Indireto	2020-12-20 18:59:51	2020-12-20 18:59:51.275067
3	Distribuidor	2020-12-20 19:00:08	2020-12-20 19:00:08.387695
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id_client, name, created_at, updated_at) FROM stdin;
1	Drogaria São Paulo	2020-12-20 19:08:41	2020-12-20 19:08:41.765959
2	Ultrafarma	2020-12-20 19:08:50	2020-12-20 19:08:50.071322
3	Farmácias Pague Menos	2020-12-20 19:08:55	2020-12-20 19:08:55.812649
\.


--
-- Data for Name: debug_trigger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debug_trigger (id, campo1) FROM stdin;
4	ALTERADO
5	ALTERADO 
6	ALTERADO 
7	ALTERADO 
8	ALTERADO 
9	ALTERADO 
10	ALTERADO 
11	ALTERADO 
12	ALTERADO 
13	ALTERADO 
14	ALTERADO 
15	ALTERADO 
16	ALTERADO 
17	ALTERADO 
\.


--
-- Data for Name: investments_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investments_client (id_invcli, id_invpro, id_client, id_action_type, id_channel, name_manager, action_details, amount, date_initial, date_end, created_at, updated_at) FROM stdin;
1	1	1	1	1	gerente	detalhes	200.00	2020-12-21	2020-12-23	2020-12-20 22:11:18	2020-12-20 22:11:18.599531
2	1	1	1	1	gerente	detalhes	200.00	2020-12-21	2020-12-23	\N	2020-12-21 17:09:55.546615
3	5	2	2	1	Import gerente	detalhe importado 1	200.00	2020-12-22	2020-12-25	\N	2020-12-21 17:09:55.546615
4	1	1	1	1	gerente	detalhes	200.00	2020-12-21	2020-12-23	\N	2020-12-21 17:34:06.948608
5	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 22:35:42	2020-12-21 22:35:42.303507
6	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 22:40:11	2020-12-21 22:40:11.24908
7	5	1	1	1	teste	tste	100.00	2020-12-22	2020-12-23	2020-12-21 22:43:26	2020-12-21 22:43:26.360603
8	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 22:44:48	2020-12-21 22:44:48.714826
9	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 22:48:18	2020-12-21 22:48:18.83073
10	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 23:01:02	2020-12-21 23:01:02.849996
11	5	1	1	1	teste	tste	100.00	2020-12-22	2020-12-23	2020-12-21 23:05:39	2020-12-21 23:05:39.569418
12	5	1	1	1	teste	tste	200.00	2020-12-22	2020-12-23	2020-12-21 23:06:12	2020-12-21 23:06:12.042009
18	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:47:32	2020-12-22 02:47:32.031209
19	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:47:50	2020-12-22 02:47:50.322226
20	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:54:17	2020-12-22 02:54:17.600058
21	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:54:19	2020-12-22 02:54:19.394823
22	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:55:35	2020-12-22 02:55:35.72298
23	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:58:25	2020-12-22 02:58:25.916545
24	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 02:59:57	2020-12-22 02:59:57.226463
25	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:00:43	2020-12-22 03:00:43.942374
26	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:02:39	2020-12-22 03:02:39.227805
27	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:06	2020-12-22 03:03:06.809781
28	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:07	2020-12-22 03:03:07.519706
29	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:08	2020-12-22 03:03:08.146081
30	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:09	2020-12-22 03:03:09.300014
31	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:09	2020-12-22 03:03:09.969995
32	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:03:22	2020-12-22 03:03:22.346806
33	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:11:47	2020-12-22 03:11:47.067705
34	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:19:05	2020-12-22 03:19:05.117734
35	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:19:12	2020-12-22 03:19:12.201487
36	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:20:38	2020-12-22 03:20:38.961506
37	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:45:16	2020-12-22 03:45:16.513209
38	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:47:38	2020-12-22 03:47:38.386253
39	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:50:48	2020-12-22 03:50:48.796882
40	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 03:52:23	2020-12-22 03:52:23.893048
41	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 13:24:50	2020-12-22 13:24:50.18696
42	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:44:59	2020-12-22 15:44:59.385301
43	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:46:01	2020-12-22 15:46:01.442371
44	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:47:06	2020-12-22 15:47:06.477455
45	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:50:40	2020-12-22 15:50:40.797125
46	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:50:46	2020-12-22 15:50:46.587648
47	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:53:21	2020-12-22 15:53:21.244421
48	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:57:01	2020-12-22 15:57:01.627328
49	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 15:57:49	2020-12-22 15:57:49.499105
50	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 16:48:27	2020-12-22 16:48:27.043193
51	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 17:05:56	2020-12-22 17:05:56.776074
52	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 17:39:34	2020-12-22 17:39:34.767958
53	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 17:43:33	2020-12-22 17:43:33.647809
54	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-22 17:50:01	2020-12-22 17:50:01.286424
55	1	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:06:28	2020-12-23 15:06:28.658835
56	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:07:00	2020-12-23 15:07:00.343738
57	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:17:05	2020-12-23 15:17:05.866783
59	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:18:14	2020-12-23 15:18:14.377271
60	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:18:23	2020-12-23 15:18:23.104107
61	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 15:33:31	2020-12-23 15:33:31.822973
62	1	1	1	1	fdfd	dfs	200.00	2020-12-24	2020-12-25	2020-12-23 16:05:10	2020-12-23 16:05:10.824093
63	9	2	1	1	fsdfsdf	fdfsdfs	200.00	2020-12-22	2020-12-25	2020-12-23 16:11:17	2020-12-23 16:11:17.152196
64	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 17:35:43	2020-12-23 17:35:43.762365
65	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 17:43:10	2020-12-23 17:43:10.272608
66	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 18:13:39	2020-12-23 18:13:39.532319
67	2	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 18:17:23	2020-12-23 18:17:23.903359
68	3	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 18:19:57	2020-12-23 18:19:57.934387
69	3	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 18:21:18	2020-12-23 18:21:18.543428
70	3	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-23 18:22:26	2020-12-23 18:22:26.382822
73	15	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-25 20:03:12	2020-12-25 20:03:12.334866
76	15	1	2	1	gerente	details	200.00	2020-12-25	2020-12-30	2020-12-25 20:39:43	2020-12-25 20:39:43.956029
77	7	2	2	1	gerente	details	200.00	2020-12-25	2020-12-30	2020-12-25 20:41:40	2020-12-25 20:41:40.438802
78	7	1	2	1	gerente	details	100.00	2020-12-26	2020-12-30	2020-12-25 20:44:02	2020-12-25 20:44:02.375673
81	15	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-26 23:13:48	2020-12-26 23:13:48.235179
79	15	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-25 21:04:57	2020-12-25 21:04:57.6881
80	15	1	1	1	Teste	detalhes	100.00	2020-12-17	2020-12-28	2020-12-26 23:12:59	2020-12-26 23:12:59.722836
82	16	1	2	1	gere	dste	100.00	2020-12-26	2020-12-30	2020-12-26 23:20:11	2020-12-26 23:20:11.765161
83	8	1	2	1	fsdsf	fsf	200.00	2020-12-26	2020-12-31	2020-12-26 23:32:00	2020-12-26 23:32:00.046064
84	3	1	2	1	fsdf	fds	100.00	2020-12-26	2020-12-31	2020-12-26 23:34:22	2020-12-26 23:34:22.703225
85	29	1	1	1	gerente import	detalhes import 1	200.00	2020-12-21	2020-12-23	\N	2020-12-27 01:28:24.897318
87	29	1	1	1	gerente import	detalhes import 1	200.00	2020-12-21	2020-12-23	\N	2020-12-27 01:30:23.339179
\.


--
-- Data for Name: investments_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investments_product (id_invpro, id_product, year, amount, created_at, updated_at) FROM stdin;
1	1	2020	1000.00	2020-12-20 19:24:08	2020-12-20 19:24:08.35581
2	2	2020	1000.00	2020-12-21 14:24:45	2020-12-21 14:24:45.085139
3	2	2020	1000.00	2020-12-21 14:58:55	2020-12-21 14:58:55.164337
4	1	2021	2000.00	2020-12-21 14:58:55	2020-12-21 14:58:55.164337
5	2	2020	1000.00	2020-12-21 15:01:04	2020-12-21 15:01:04.177439
6	1	2021	2000.00	2020-12-21 15:01:04	2020-12-21 15:01:04.177439
7	1	2022	2000.00	2020-12-22 17:51:13	2020-12-22 17:51:13.593763
8	2	2020	3000.00	2020-12-22 17:52:56	2020-12-22 17:52:56.545175
9	1	2020	200.00	2020-12-22 17:57:25	2020-12-22 17:57:25.633648
10	2	2020	100.00	2020-12-22 18:19:47	2020-12-22 18:19:47.936759
15	1	2022	500.00	2020-12-25 19:56:14	2020-12-25 19:56:14.971923
16	1	2020	200.00	2020-12-26 22:51:51	2020-12-26 22:51:51.23591
29	1	2020	1000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
30	2	2020	1000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
31	2	2020	1000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
32	1	2021	2000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
33	2	2020	1000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
34	1	2021	2000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
35	1	2022	2000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
36	2	2020	3000.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
37	1	2020	200.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
38	2	2020	100.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
39	1	2022	500.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
40	1	2020	200.00	2020-12-27 00:34:11	2020-12-27 00:34:11.228779
41	1	2020	1000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
42	2	2020	1000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
43	2	2020	1000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
44	1	2021	2000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
45	2	2020	1000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
46	1	2021	2000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
47	1	2022	2000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
48	2	2020	3000.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
49	1	2020	200.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
50	2	2020	100.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
51	1	2022	500.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
52	1	2020	200.00	2020-12-27 00:35:51	2020-12-27 00:35:51.295141
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, name, description, icon, order_menu, parent_id, created_at, updated_at, url) FROM stdin;
4	Investimento Produtos	Lista de investimentos	attach_money	1	1	2020-12-25 17:03:41	2020-12-25 17:03:41.023746	invpro
5	Investimento Cliente	Lista de investimento de cliente	monetization_on	2	1	2020-12-25 17:10:39	2020-12-25 17:10:39.756027	invcli
1	Financeiro	Finaneiro	payment	1	0	2020-12-21 06:56:30	2020-12-21 06:56:30.659	#
8	Produtos	Lista de produtos	shopping_cart	1	7	2020-12-27 18:07:05	2020-12-27 18:07:05.467842	produto
9	Categoria	Lista de categorias	category	2	7	2020-12-27 18:17:18	2020-12-27 18:17:18.66964	categoria
7	Produto	Menu	add_shopping_cart	2	0	2020-12-27 22:06:03	2020-12-27 22:06:03.061	#
10	Cliente	Lista de clientes	supervisor_account	3	0	2020-12-27 18:18:35	2020-12-27 18:18:35.031036	cliente
11	Tipo de Ação	Lista de tipos de ações	build	4	0	2020-12-27 18:19:25	2020-12-27 18:19:25.762711	tipoAcao
12	Usuários	Menu	perm_identity	5	0	2020-12-27 18:20:04	2020-12-27 18:20:04.092585	#
13	Usuário	Lista de usuários	supervised_user_circle	1	12	2020-12-27 18:20:42	2020-12-27 18:20:42.214004	usuario
14	Cargo	Lista de cargos	wysiwyg	2	12	2020-12-27 18:21:13	2020-12-27 18:21:13.46227	cargo
17	Menu	Lista de menu	view_headline	3	12	2021-01-04 21:43:40	2021-01-04 21:43:40.416952	menu
\.


--
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (id_office, description, created_at, updated_at) FROM stdin;
2	Promotor	2020-12-20 19:04:39	2020-12-20 19:04:39.370548
3	Supervisor	2020-12-20 23:04:55	2020-12-20 23:04:55.24
1	Adminsitrador	2020-12-21 15:00:25	2020-12-21 15:00:25.175
\.


--
-- Data for Name: office_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office_menu (id_office_menu, id_office, id_menu) FROM stdin;
6	3	1
11	1	1
14	2	1
17	3	4
18	3	5
19	2	4
20	1	4
22	1	5
23	1	7
24	1	8
25	1	9
26	1	10
27	1	11
28	1	12
29	1	13
30	1	14
32	1	17
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id_product, description, ean, id_category, created_at, updated_at) FROM stdin;
1	Filtrum® Ultra Seco FPS 30	7896094208032	2	2020-12-20 22:58:28	2020-12-20 22:58:28.129
2	FIltrum® Color FPS 50	7896094208025	1	2020-12-21 02:58:44	2020-12-21 02:58:44.766
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id_status, description, created_at, updated_at) FROM stdin;
1	Ativo	2020-12-20 19:10:17	2020-12-20 19:10:17.315211
2	Inativo	2020-12-20 19:10:23	2020-12-20 19:10:23.006034
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_users, name, username, email, cpf, password, id_office, blocked, photo, id_status, created_at, updated_at, pass_changed) FROM stdin;
2	Carlos Bruno Brito	carlos.brito	carlos@ipdvonline.com.br	83457468451	$2b$10$DkVc.5uW04qKuWiSR0jW.eCPJrEUJvQp1EFcJ18r6Nu.nksWX96cu	1	0	\N	1	2020-12-20 19:10:32	2020-12-20 19:10:32.153449	t
7	teste teste	teste.teste	teste@g.com	12345678911	$2b$10$F1i1L69I1G6HdA5RotskS.UuDDzBXWEi8MVJ4qJhBMOL9uarx9xG6	2	0	\N	1	2020-12-29 14:42:31	2020-12-29 14:42:31.116694	t
3	Charles Hercules	charles.hercules	charles@gmail.com	15741918530	$2b$10$k7U6GJxIBPA.Y0HV09KUSODa7Jahf3fnF0amCMjcfscaK4qnDEUUq	2	0	\N	1	2020-12-25 18:35:17	2020-12-25 18:35:17.910335	t
\.


--
-- Data for Name: validate_password; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.validate_password (id_valpass, id_users, pwd, dt_password, time_validate, changed, created_at, updated_at, dt_pwd_expires) FROM stdin;
1	2	12345678	2020-12-28	3	f	2020-12-28 13:57:19.164724	2020-12-28 13:57:19.164724	2021-03-28
2	2	"$2b$10$/A4RWX6qGeyDlZCKo6PuLuIWL7JlyKrbgSX16LDU5m/iNKFBKyRLu"	2020-12-28	3	f	2020-12-28 14:05:15.494453	2020-12-28 14:05:15.494453	2021-03-28
3	3	$2b$10$qzUdng6lAK46vgs0fg5WF.msj.3U9GI1gxxvo4FaF9LejxcVbtRau	2020-12-28	3	f	2020-12-28 14:08:31.990506	2020-12-28 14:08:31.990506	2021-03-28
4	3	$2b$10$N3O00Lq5BIaawDNEWhuCQe6PQxXG.c9S4.dSzq1c7rWyKCN0P/Ca.	2020-12-28	3	f	2020-12-28 14:13:22.050234	2020-12-28 14:13:22.050234	2021-03-28
5	3	"$2b$10$/A4RWX6qGeyDlZCKo6PuLuIWL7JlyKrbgSX16LDU5m/iNKFBKyRLu"	2020-12-28	3	f	2020-12-28 14:14:08.319804	2020-12-28 14:14:08.319804	2021-03-28
6	2	$2b$10$ZYe.7Gx6C4WvL1TvvWsIwuISoBSsR97ZhTb79Pwcu3bewST4QfjZe	2020-12-28	3	f	2020-12-28 14:20:10.79442	2020-12-28 14:20:10.79442	2021-03-28
7	2	$2b$10$J5ganBO3e3DUH.TgoBIOLu4mU7SEyKCKEgyTvHXPWOH6mImNeGWzO	2020-12-28	3	f	2020-12-28 14:23:48.462109	2020-12-28 14:23:48.462109	2021-03-28
8	3	$2b$10$k7U6GJxIBPA.Y0HV09KUSODa7Jahf3fnF0amCMjcfscaK4qnDEUUq	2020-12-28	3	f	2020-12-28 14:27:14.623915	2020-12-28 14:27:14.623915	2021-03-28
9	2	$2b$10$chwKB20rhS0o1mYikjvnQOCuZNDlR8w7uqLnTXmSTE/XMWJAWL1eK	2020-12-28	3	f	2020-12-28 17:54:42.28055	2020-12-28 17:54:42.28055	2021-03-28
10	2	$2b$10$Jt0Wzo9edpeDgpnlbbF1i.U0PC2fjRtQrCVpi9NjSD1MWeV3UzEQ2	2020-12-28	3	f	2020-12-28 17:56:21.462773	2020-12-28 17:56:21.462773	2020-12-28
11	2	$2b$10$DkVc.5uW04qKuWiSR0jW.eCPJrEUJvQp1EFcJ18r6Nu.nksWX96cu	2020-12-29	3	f	2020-12-29 14:40:10.408074	2020-12-29 14:40:10.408074	2021-03-29
12	7	$2b$10$tNRu4VbjINS0xXDyfPMcbO.GuzPPyYjAtavIlDnF4BGU/OUfJRlRK	2020-12-29	3	f	2020-12-29 15:21:18.673086	2020-12-29 15:21:18.673086	2021-03-29
13	7	$2b$10$F1i1L69I1G6HdA5RotskS.UuDDzBXWEi8MVJ4qJhBMOL9uarx9xG6	2020-12-29	3	f	2020-12-29 15:25:52.639624	2020-12-29 15:25:52.639624	2021-03-29
14	2	$2b$10$DkVc.5uW04qKuWiSR0jW.eCPJrEUJvQp1EFcJ18r6Nu.nksWX96cu	2020-12-29	3	t	2020-12-29 17:15:11.386057	2020-12-29 17:15:11.386057	2021-03-29
\.


--
-- Name: category_description_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_description_seq', 1, false);


--
-- Name: category_id_category_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_category_seq_1', 6, true);


--
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_client_seq', 5, true);


--
-- Name: debug_trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.debug_trigger_id_seq', 17, true);


--
-- Name: id_action_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_action_type_seq', 4, true);


--
-- Name: id_channel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_channel_seq', 3, true);


--
-- Name: id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_menu_seq', 17, true);


--
-- Name: id_office_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_office_seq', 4, true);


--
-- Name: id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_product_seq', 3, true);


--
-- Name: id_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_users_seq', 7, true);


--
-- Name: iid_office_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iid_office_menu_seq', 32, true);


--
-- Name: iid_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iid_status_seq', 2, true);


--
-- Name: investments_client_id_invcli_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investments_client_id_invcli_seq', 88, true);


--
-- Name: investments_product_id_invpro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investments_product_id_invpro_seq', 52, true);


--
-- Name: validate_password_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.validate_password_seq', 14, true);


--
-- Name: action_type at_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_type
    ADD CONSTRAINT at_id_pk PRIMARY KEY (id_action_type);


--
-- Name: channel channel_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_id_pk PRIMARY KEY (id_channel);


--
-- Name: debug_trigger debug_trigger_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debug_trigger
    ADD CONSTRAINT debug_trigger_pk PRIMARY KEY (id);


--
-- Name: category id_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT id_category_pk PRIMARY KEY (id_category);


--
-- Name: client id_client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT id_client_pk PRIMARY KEY (id_client);


--
-- Name: office id_office_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT id_office_pk PRIMARY KEY (id_office);


--
-- Name: product id_product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT id_product_pk PRIMARY KEY (id_product);


--
-- Name: users id_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_users);


--
-- Name: validate_password id_vpass_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password
    ADD CONSTRAINT id_vpass_pk PRIMARY KEY (id_valpass);


--
-- Name: investments_client invcli_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client
    ADD CONSTRAINT invcli_id_pk PRIMARY KEY (id_invcli);


--
-- Name: investments_product ip_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_product
    ADD CONSTRAINT ip_id_pk PRIMARY KEY (id_invpro);


--
-- Name: menu menu_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_id_pk PRIMARY KEY (id_menu);


--
-- Name: office_menu office_menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT office_menu_pk PRIMARY KEY (id_office_menu);


--
-- Name: status status_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_id_pk PRIMARY KEY (id_status);


--
-- Name: users trg_ains_users; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ains_users AFTER UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.insert_validate_pwd_update();


--
-- Name: investments_client action_type_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client
    ADD CONSTRAINT action_type_investiment_client_fk FOREIGN KEY (id_action_type) REFERENCES public.action_type(id_action_type);


--
-- Name: product category_produtc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_produtc_fk FOREIGN KEY (id_category) REFERENCES public.category(id_category);


--
-- Name: investments_client channel_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client
    ADD CONSTRAINT channel_investiment_client_fk FOREIGN KEY (id_channel) REFERENCES public.channel(id_channel);


--
-- Name: investments_client client_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client
    ADD CONSTRAINT client_investiment_client_fk FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- Name: investments_client investments_product_investiment_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_client
    ADD CONSTRAINT investments_product_investiment_client_fk FOREIGN KEY (id_invpro) REFERENCES public.investments_product(id_invpro);


--
-- Name: office_menu menu_office_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT menu_office_menu_fk FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: office_menu office_office_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_menu
    ADD CONSTRAINT office_office_menu_fk FOREIGN KEY (id_office) REFERENCES public.office(id_office) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users office_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT office_users_fk FOREIGN KEY (id_office) REFERENCES public.office(id_office);


--
-- Name: investments_product product_investments_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investments_product
    ADD CONSTRAINT product_investments_product_fk FOREIGN KEY (id_product) REFERENCES public.product(id_product);


--
-- Name: users status_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT status_users_fk FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- Name: validate_password users_validate_password_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validate_password
    ADD CONSTRAINT users_validate_password_fk FOREIGN KEY (id_users) REFERENCES public.users(id_users) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

