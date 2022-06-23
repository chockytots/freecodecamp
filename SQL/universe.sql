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
-- Name: feature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.feature (
    feature_id integer NOT NULL,
    name character varying(40) NOT NULL,
    coordinates character varying(40),
    yeardiscovered integer,
    visited boolean DEFAULT false,
    wki character varying(40),
    imageurl text,
    planet_id integer
);


ALTER TABLE public.feature OWNER TO freecodecamp;

--
-- Name: feature_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.feature_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_feature_id_seq OWNER TO freecodecamp;

--
-- Name: feature_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.feature_feature_id_seq OWNED BY public.feature.feature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(40),
    starcount integer,
    size numeric,
    constellation character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    volume numeric,
    mass numeric,
    density numeric,
    gravity numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    volume numeric,
    mass numeric,
    density numeric,
    gravity numeric,
    haslife boolean DEFAULT false,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    volume numeric,
    mass numeric,
    density numeric,
    gravity numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: feature feature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature ALTER COLUMN feature_id SET DEFAULT nextval('public.feature_feature_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.feature VALUES (1, 'Picasso', '3.44°N 309.76°W', 2010, false, 'Picasso_(crater)', 'https://en.wikipedia.org/wiki/Picasso_(crater)#/media/File:Picasso_crater.png', 1);
INSERT INTO public.feature VALUES (2, 'Beckett', '40.1°S 248.8°W', 2008, false, 'Beckett_(crater)', 'https://en.wikipedia.org/wiki/Beckett_(crater)#/media/File:Beckett_crater.png', 1);
INSERT INTO public.feature VALUES (3, 'Gibran_', '35.5°N 110.4°W', 2009, false, 'Gibran_(crater)', 'https://en.wikipedia.org/wiki/Gibran_(crater)#/media/File:Gibran_pit_crater_arrow.jpg', 1);
INSERT INTO public.feature VALUES (4, 'Abigail', '52.2°S 111.2°E', 1994, false, NULL, NULL, 2);
INSERT INTO public.feature VALUES (5, 'Abika', '52.5°S 104.4°E', 1994, false, NULL, NULL, 2);
INSERT INTO public.feature VALUES (6, 'Abington', '47.8°S 82.3°W', 1994, false, NULL, NULL, 2);
INSERT INTO public.feature VALUES (7, 'Huygens', '13.96°S 55.58°E', 1973, false, 'Huygens_(crater)', 'https://en.wikipedia.org/wiki/Huygens_(crater)#/media/File:Martian_impact_crater_Huygens_based_on_THEMIS_Day_IR.png', 4);
INSERT INTO public.feature VALUES (8, 'Schiaparelli', '2.69°S 16.79°E', 1973, false, 'Schiaparelli_(Martian_crater)', 'https://en.wikipedia.org/wiki/Schiaparelli_(Martian_crater)#/media/File:SchiaparelliMOLA.jpeg', 4);
INSERT INTO public.feature VALUES (9, 'Greeley', '36.63°S 3.19°E', 2015, false, 'Greeley_(Martian_crater)', 'https://en.wikipedia.org/wiki/Greeley_(Martian_crater)#/media/File:Maprabecrater.jpg', 4);
INSERT INTO public.feature VALUES (10, 'Cassini', '22.59°N 32.11°E', 1973, false, 'Cassini_(Martian_crater)', 'https://en.wikipedia.org/wiki/Cassini_(Martian_crater)#/media/File:CassiniMartianCrater.jpg', 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBC', 400, 185000, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA', 1, 220000, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'NGC 2787', 'SBC', 0, 5.5, 'Ursa Major');
INSERT INTO public.galaxy VALUES (4, 'NGC 4314', 'SB(rs)a of SBa', 0, 2.18, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (5, 'M58', 'SAB(rs)b', 0, 5.9, 'Virgo');
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', 'irr', 9, 12, 'Canis Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 21958000000, 73420000000000000000000, 3.344, 1.622, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 5783.61, 10659000000000000, 1.876, 0.0057, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 999.78, 1476200000000000, 1.471, 0.003, 4);
INSERT INTO public.moon VALUES (4, 'Io', 25300000000, 89310000000000000000000, 3.528, 1.796, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 15930000000, 47990000000000000000000, 3.013, 1.314, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 76600000000, 148190000000000000000000, 1.936, 1.428, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 59000000000, 107500000000000000000000, 1.8344, 1.235, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Lapetus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Titania', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Caliban', NULL, NULL, NULL, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 6.083, 3.3011, 5.427, 3.7, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 9.2843, 4.8675, 5.243, 8.87, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.0823, 5.972, 5.514, 9.806, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.1631, 6.4171, 3.9335, 3.9335, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1.4313, 1.8982, 1.326, 24.79, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 8.2713, 5.6834, 0.687, 10.44, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 6.833, 8.6810, 1.27, 8.68, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 6.253, 1.02413, 1.638, 11.15, false, 1);
INSERT INTO public.planet VALUES (9, 'AB Aurigae b', NULL, 9, NULL, NULL, false, 7);
INSERT INTO public.planet VALUES (10, 'Beta Pictoris b', NULL, 12, NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (11, '51 Eridani b', NULL, 2.6, NULL, NULL, false, 9);
INSERT INTO public.planet VALUES (12, 'HR 8799 e', NULL, 7, NULL, NULL, false, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1.41, 1.9885, 1.408, 274, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 0.2121, NULL, 5.2, 1);
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 2.036, NULL, 4.336, 6);
INSERT INTO public.star VALUES (4, 'Epsilon Canis Majoris', NULL, 12.6, NULL, 3.39, 6);
INSERT INTO public.star VALUES (5, 'Betelgeuse', NULL, 16.5, NULL, 0.5, 1);
INSERT INTO public.star VALUES (6, 'Antares', NULL, 11, NULL, 3.9, 1);
INSERT INTO public.star VALUES (7, 'AB Aurigae', NULL, 2.4, NULL, NULL, 1);
INSERT INTO public.star VALUES (8, 'Beta Pictoris', NULL, 1.75, NULL, NULL, 1);
INSERT INTO public.star VALUES (9, '51 Eridani', NULL, 1.75, NULL, NULL, 1);
INSERT INTO public.star VALUES (10, 'HR 8799', NULL, 1.43, NULL, NULL, 1);


--
-- Name: feature_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.feature_feature_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: feature feature_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_name_key UNIQUE (name);


--
-- Name: feature feature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (feature_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: feature fk_feature_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk_feature_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
