--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    comet_date_discovered date NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    galaxy_constellation character varying(20),
    galaxy_size_kpc numeric(4,1),
    galaxy_distance_mly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galkey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galkey_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galkey_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    moon_orbit_km integer,
    moon_has_water boolean,
    moon_designation text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_mookey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mookey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mookey_seq OWNER TO freecodecamp;

--
-- Name: moon_mookey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mookey_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(20),
    planet_has_water boolean,
    planet_orbit_au numeric(8,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_plakey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_plakey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_plakey_seq OWNER TO freecodecamp;

--
-- Name: planet_plakey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_plakey_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    star_class character varying(10),
    star_age_myr integer,
    star_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_stakey_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_stakey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_stakey_seq OWNER TO freecodecamp;

--
-- Name: star_stakey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_stakey_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galkey_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_mookey_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_plakey_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_stakey_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', '1758-01-01');
INSERT INTO public.comet VALUES (2, '19P/Borrelly', '1904-12-28');
INSERT INTO public.comet VALUES (3, '21P/Giacobini-Zinner', '1900-12-20');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Sagittarius', 26.8, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Andromeda', 46.6, 3);
INSERT INTO public.galaxy VALUES (3, 'Hercules A', 'Elliptical', 'Hercules', NULL, 2100);
INSERT INTO public.galaxy VALUES (4, 'Messier 84', 'Lenticular', 'Virgo', NULL, 55);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Spiral', 'Coma Berenices', 16.5, 17);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Canes Venatici', 23.6, 31);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, 384399, false, 'Earth I');
INSERT INTO public.moon VALUES (2, 'Phobos', 5, 9376, false, 'Mars I');
INSERT INTO public.moon VALUES (3, 'Ganymede', 6, 1070400, true, 'Jupiter III');
INSERT INTO public.moon VALUES (4, 'Callisto', 6, 1882700, true, 'Jupiter IV');
INSERT INTO public.moon VALUES (5, 'Io', 6, 421700, false, 'Jupiter I');
INSERT INTO public.moon VALUES (6, 'Europa', 6, 670900, true, 'Jupiter II');
INSERT INTO public.moon VALUES (7, 'Titan', 7, 1221870, true, 'Saturn VI');
INSERT INTO public.moon VALUES (8, 'Mimas', 7, 185539, true, 'Saturn I');
INSERT INTO public.moon VALUES (9, 'Titania', 8, 435910, true, 'Uranus III');
INSERT INTO public.moon VALUES (10, 'Miranda', 8, 129390, true, 'Uranus V');
INSERT INTO public.moon VALUES (11, 'Triton', 9, 354759, true, 'Neptune I');
INSERT INTO public.moon VALUES (12, 'Charon', 10, 19591, true, 'Pluto I');
INSERT INTO public.moon VALUES (13, '20', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Rows', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Is', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Way', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Too', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Many', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'For', 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'This', 11, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 0.4);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false, 0.7);
INSERT INTO public.planet VALUES (4, 'Earth', 1, 'Terrestrial', true, 1.0);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 'Terrestrial', true, 1.5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 'Gas Giant', false, 5.2);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 'Gas Giant', false, 9.5);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', true, 19.2);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 'Ice Giant', true, 30.1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 'Dwarf Planet', true, 39.5);
INSERT INTO public.planet VALUES (11, 'HR 8799 b', 7, 'Unknown Giant', true, 68.0);
INSERT INTO public.planet VALUES (12, 'HR 8799 c', 7, 'Unknown Giant', true, 38.0);
INSERT INTO public.planet VALUES (13, 'HR 8799 d', 7, 'Unknown Giant', true, 24.0);
INSERT INTO public.planet VALUES (14, 'HR 8799 e', 7, 'Gas Giant', true, 14.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G2V', 4600, 9);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'A3V', 60, NULL);
INSERT INTO public.star VALUES (3, 'Mirach', 2, 'M0III', NULL, NULL);
INSERT INTO public.star VALUES (4, 'Polaris', 1, 'F7lb', 70, NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'A0mA1 Va', 242, 0);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M1-M2', 8, NULL);
INSERT INTO public.star VALUES (7, 'HR 8799', 1, 'kA5 hF0', 30, 4);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galkey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galkey_seq', 6, true);


--
-- Name: moon_mookey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mookey_seq', 20, true);


--
-- Name: planet_plakey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_plakey_seq', 14, true);


--
-- Name: star_stakey_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_stakey_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: planet planet_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

