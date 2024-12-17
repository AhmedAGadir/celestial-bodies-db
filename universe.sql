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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    description text,
    diameter_in_km numeric,
    has_moons boolean,
    orbit_type character varying(30) NOT NULL,
    name character varying(30)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_million_years numeric,
    type text NOT NULL
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
    name character varying(30),
    description text,
    diameter_in_km integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    description text,
    luminosity integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'The largest object in the asteroid belt between Mars and Jupiter.', 939.4, false, 'Belt', 'Ceres');
INSERT INTO public.asteroid VALUES (2, 'A bright asteroid with a surface covered in basaltic rock.', 525.4, false, 'Belt', 'Vesta');
INSERT INTO public.asteroid VALUES (3, 'A near-Earth asteroid with a peanut-like shape.', 16.84, false, 'Near-Earth', 'Eros');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy containing our Solar System.', 13500, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A large spiral galaxy closest to the Milky Way.', 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'A massive elliptical galaxy in the Virgo Cluster.', 13500, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'A small spiral galaxy and a member of the Local Group.', 9000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A bright galaxy with a large central bulge.', 11000, 'Lenticular');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A stunning face-on spiral galaxy.', 12000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite, stabilizes the planet''s rotation.', 3474, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small, irregularly shaped moon of Mars.', 22, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant moon of Mars.', 12, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'A volcanic moon with the most active volcanoes in the Solar System.', 3643, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon believed to have a subsurface ocean.', 3121, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System.', 5268, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon, the second-largest orbiting Jupiter.', 4821, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'A thick atmosphere moon, larger than Mercury.', 5150, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'An icy moon that ejects plumes of water into space.', 504, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 'A retrograde orbit moon, the largest of Neptune.', 2706, 7);
INSERT INTO public.moon VALUES (11, 'Kepler-22b I', 'A hypothetical moon orbiting the exoplanet Kepler-22b.', 3000, 8);
INSERT INTO public.moon VALUES (12, 'TRAPPIST-1e I', 'A hypothetical moon in the TRAPPIST-1 system.', 1500, 12);
INSERT INTO public.moon VALUES (13, 'Metis', 'A small moon closest to Jupiter, within its main ring.', 43, 5);
INSERT INTO public.moon VALUES (14, 'Adrastea', 'A small, irregularly shaped moon orbiting within Jupiter''s rings.', 20, 5);
INSERT INTO public.moon VALUES (15, 'Mimas', 'A heavily cratered moon, often compared to the Death Star.', 396, 6);
INSERT INTO public.moon VALUES (16, 'Rhea', 'An icy moon, Saturn''s second-largest.', 1528, 6);
INSERT INTO public.moon VALUES (17, 'Nereid', 'A small, irregularly orbiting moon of Neptune.', 340, 7);
INSERT INTO public.moon VALUES (18, 'Mariner', 'A hypothetical moon representing early Mars exploration.', 15, 2);
INSERT INTO public.moon VALUES (19, 'Kepler-22b II', 'A secondary hypothetical moon orbiting Kepler-22b.', 2900, 8);
INSERT INTO public.moon VALUES (20, 'TRAPPIST-1e II', 'A second hypothetical moon in the TRAPPIST-1 system.', 1600, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet to support life.', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'A rocky planet with a thin atmosphere, also known as the Red Planet.', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'An exoplanet orbiting Proxima Centauri in the habitable zone.', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'A terrestrial planet with a thick, toxic atmosphere.', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, known for its Great Red Spot.', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant with stunning ring systems.', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'A distant, icy giant with supersonic winds.', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 'An exoplanet in the habitable zone of its star, Kepler-22.', false, true, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-16b', 'A planet orbiting a binary star system, sometimes called a circumbinary planet.', false, true, 3);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'A planet orbiting the closest star system to Earth.', false, true, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'An exoplanet believed to have conditions favorable for life.', false, true, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'One of the seven Earth-like planets orbiting the star TRAPPIST-1.', false, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 100, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A small red dwarf star closest to the Sun.', 1, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky.', 25, 2);
INSERT INTO public.star VALUES (4, 'Vega', 'A bright star in the Lyra constellation.', 50, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A massive red supergiant nearing the end of its life.', 500, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 'A luminous blue supergiant in the Orion constellation.', 800, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteroid_id_key UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


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

