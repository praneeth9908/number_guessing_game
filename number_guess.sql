--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: usersinfo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usersinfo (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.usersinfo OWNER TO freecodecamp;

--
-- Name: usersinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usersinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usersinfo_id_seq OWNER TO freecodecamp;

--
-- Name: usersinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usersinfo_id_seq OWNED BY public.usersinfo.id;


--
-- Name: usersinfo id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usersinfo ALTER COLUMN id SET DEFAULT nextval('public.usersinfo_id_seq'::regclass);


--
-- Data for Name: usersinfo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usersinfo VALUES (2, 'siri', 1, 10);
INSERT INTO public.usersinfo VALUES (3, 'darshini', 1, 10);
INSERT INTO public.usersinfo VALUES (1, 'pran', 10, 10);
INSERT INTO public.usersinfo VALUES (4, 'tanvi', 1, 10);
INSERT INTO public.usersinfo VALUES (6, 'user_1718706331372', 2, 255);
INSERT INTO public.usersinfo VALUES (5, 'user_1718706331373', 5, 246);
INSERT INTO public.usersinfo VALUES (8, 'user_1718706860579', 2, 558);
INSERT INTO public.usersinfo VALUES (7, 'user_1718706860580', 5, 263);
INSERT INTO public.usersinfo VALUES (10, 'user_1718707085989', 2, 181);
INSERT INTO public.usersinfo VALUES (9, 'user_1718707085990', 5, 13);
INSERT INTO public.usersinfo VALUES (12, 'user_1718707177066', 2, 458);
INSERT INTO public.usersinfo VALUES (11, 'user_1718707177067', 5, 19);
INSERT INTO public.usersinfo VALUES (14, 'user_1718707297488', 2, 308);
INSERT INTO public.usersinfo VALUES (13, 'user_1718707297489', 5, 40);
INSERT INTO public.usersinfo VALUES (16, 'user_1718707482795', 2, 256);
INSERT INTO public.usersinfo VALUES (15, 'user_1718707482796', 5, 238);
INSERT INTO public.usersinfo VALUES (18, 'user_1718707567271', 2, 270);
INSERT INTO public.usersinfo VALUES (17, 'user_1718707567272', 5, 202);


--
-- Name: usersinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usersinfo_id_seq', 18, true);


--
-- Name: usersinfo usersinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usersinfo
    ADD CONSTRAINT usersinfo_pkey PRIMARY KEY (id);


--
-- Name: usersinfo usersinfo_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usersinfo
    ADD CONSTRAINT usersinfo_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

