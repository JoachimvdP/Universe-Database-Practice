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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    constellation character varying(30),
    number_of_stars_in_billions integer,
    galaxy_type text NOT NULL
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
-- Name: man_made_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.man_made_object (
    man_made_object_id integer NOT NULL,
    name character varying(30) NOT NULL,
    object_type character varying(30),
    entered_space_in_year date,
    launched_from text
);


ALTER TABLE public.man_made_object OWNER TO freecodecamp;

--
-- Name: man_made_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.man_made_objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.man_made_objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: man_made_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.man_made_objects_object_id_seq OWNED BY public.man_made_object.man_made_object_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    planet_id integer,
    alternative_names text,
    discovered_by character varying(30)
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
    galaxy_id integer,
    name character varying(30),
    planet_type character varying(40),
    has_life boolean NOT NULL,
    number_of_moons integer
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
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(4,2),
    part_of_constellation character varying(30)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: man_made_object man_made_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.man_made_object ALTER COLUMN man_made_object_id SET DEFAULT nextval('public.man_made_objects_object_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'sagittarius', 400, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (2, 'NGC 4414', NULL, 'Coma Berenices', NULL, 'Unbarred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', false, 'Canes Venatici', NULL, 'Interacting Grand Design Spiral Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', false, 'Andromeda', 1000, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Messier 89', false, 'Virgo', NULL, 'Elliptical Galaxy');
INSERT INTO public.galaxy VALUES (6, 'NGC 87', false, 'Phoenix', NULL, 'Irregular Galaxy');


--
-- Data for Name: man_made_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.man_made_object VALUES (1, 'James Webb Space Telescope', 'Telescope', '2021-12-25', NULL);
INSERT INTO public.man_made_object VALUES (2, 'Hubble Space Telescope', 'Telescope', '1990-04-24', NULL);
INSERT INTO public.man_made_object VALUES (3, 'Curiosity', 'Mars Rover', '2011-11-26', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1, 'Luna, Selene, Cynthia', NULL);
INSERT INTO public.moon VALUES (2, 1, 'Phobos', 2, NULL, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 1, 'Deimos', 2, NULL, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 1, 'Io', 7, 'Jupiter I', 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 1, 'Callisto', 7, 'Jupiter IV', 'Galileo Galilei');
INSERT INTO public.moon VALUES (6, 1, 'Ganymede', 7, 'Jupiter III', 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 1, 'Europa', 7, 'Jupiter II', 'Galileo Galilei, Simon Marius');
INSERT INTO public.moon VALUES (8, 1, 'Titan', 8, 'Saturn VI', 'Christiaan Huygens');
INSERT INTO public.moon VALUES (9, 1, 'Mimas', 8, 'Saturn I', 'William Herschel');
INSERT INTO public.moon VALUES (10, 1, 'Enceladus', 8, 'Saturn II', 'William Herschel');
INSERT INTO public.moon VALUES (11, 1, 'Tethys', 8, 'Saturn III', 'Giovanni Cassini');
INSERT INTO public.moon VALUES (12, 1, 'Dione', 8, 'Saturn IV', 'Giovanni Cassini');
INSERT INTO public.moon VALUES (13, 1, 'Rhea', 8, 'Saturn V', 'Giovanni Cassini');
INSERT INTO public.moon VALUES (14, 1, 'lapetus', 8, 'Saturn VIII', 'Giovanni Cassini');
INSERT INTO public.moon VALUES (15, 1, 'Triton', 6, 'Neptune I', 'William Lassell');
INSERT INTO public.moon VALUES (16, 1, 'Umbriel', 5, 'Uranus II', 'William Lassell');
INSERT INTO public.moon VALUES (17, 1, 'Miranda', 5, 'Uranus V', 'Gerard P. Kuiper');
INSERT INTO public.moon VALUES (18, 1, 'Titania', 5, 'Uranus III', 'William Herschel');
INSERT INTO public.moon VALUES (19, 1, 'Ariel', 5, 'Uranus I', 'William Lassell');
INSERT INTO public.moon VALUES (20, 1, 'Puck', 5, 'Uranus XV', 'Stephan P. Synnott, Voyager 2');
INSERT INTO public.moon VALUES (21, 1, 'Oberon', 5, 'Uranus IV', 'William Herschel');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 1, 'Mercury', 'Terrestrial planet', false, NULL);
INSERT INTO public.planet VALUES (4, 1, 'Venus', 'Terrestrial planet', false, NULL);
INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial planet', true, 1);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Terrestrial planet', false, 2);
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', 'Gas Giant', false, 80);
INSERT INTO public.planet VALUES (9, 3, 'M51-ULS-1b', 'Extragalactic Planet', false, NULL);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 'Dwarf Planet', false, 5);
INSERT INTO public.planet VALUES (45, 1, '90482 Orcus', 'Dwarf Planet', false, 1);
INSERT INTO public.planet VALUES (46, 1, 'Ceres', 'Dwarf Planet', false, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Saturn', 'Gas Giant', false, 83);
INSERT INTO public.planet VALUES (6, 1, 'Neptune', 'Ice Giant', false, 14);
INSERT INTO public.planet VALUES (5, 1, 'Uranus', 'Ice Giant', false, 27);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4.60, NULL);
INSERT INTO public.star VALUES (NULL, 2, 'Delta Sagittarii', 0.26, 'Sagittarius');
INSERT INTO public.star VALUES (NULL, 3, 'Epsilon Sagittarii', 0.23, 'Sagittarius');
INSERT INTO public.star VALUES (NULL, 4, 'Zeta Sagittarii', 0.50, 'Sagittarius');
INSERT INTO public.star VALUES (NULL, 5, 'Phi Sagittarii', 0.15, 'Sagittarius');
INSERT INTO public.star VALUES (NULL, 6, 'Lambda Sagittarii', NULL, 'Sagittarius');
INSERT INTO public.star VALUES (NULL, 7, 'Gamma2 Sagittarii', NULL, 'Sagittarius');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: man_made_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.man_made_objects_object_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 46, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: man_made_object pkey_man_made_objects; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.man_made_object
    ADD CONSTRAINT pkey_man_made_objects PRIMARY KEY (man_made_object_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: man_made_object unique_object_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.man_made_object
    ADD CONSTRAINT unique_object_id UNIQUE (man_made_object_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_satellite_to_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_satellite_to_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

