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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_relative_to_the_moon_in_percentage integer NOT NULL,
    mass_relative_to_the_moon_in_percentage numeric NOT NULL,
    orbital_period_in_years numeric NOT NULL,
    has_moons boolean DEFAULT true NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying NOT NULL,
    size_in_light_years integer,
    distance_from_earth_in_kiloparsec numeric NOT NULL,
    is_dwarf boolean DEFAULT false NOT NULL,
    has_satellite_galaxies boolean DEFAULT false NOT NULL,
    interesting_facts text
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
    name character varying(20) NOT NULL,
    radius_in_km numeric NOT NULL,
    orbital_period_in_days numeric NOT NULL,
    is_moving_in_retrograde boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    unique_feature text,
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
    name character varying(30) NOT NULL,
    radius_in_km numeric,
    orbital_period_in_days numeric NOT NULL,
    number_of_known_moons integer,
    has_rings boolean DEFAULT false NOT NULL,
    is_terrestrial boolean DEFAULT false NOT NULL,
    unique_feature text,
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
    name character varying(30) NOT NULL,
    mass_in_solar_mass numeric NOT NULL,
    radius_in_solar_radius numeric NOT NULL,
    luminosity_in_solar_luminosity numeric,
    evolutionary_stage character varying NOT NULL,
    has_companion_star boolean DEFAULT false NOT NULL,
    unique_feature text,
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 68, 17.7, 247.9, true);
INSERT INTO public.dwarf_planet VALUES (2, 'Ceres', 27, 1.3, 4.604, false);
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 67, 22.4, 558.0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral galaxy', 152000, 765, false, true, 'is expected to collide directly with the Milky Way in about 2.5-4 billion years');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy', 87400, 7.935, false, true, 'has Earth therefore has life');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'spiral galaxy', 61100, 9970, false, false, 'is the third-largest member of the Local Group of galaxies, behind the Andromeda Galaxy and the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Virgo Stellar Stream', 'used to be dwarf spheroidal galaxy', NULL, 0.3066, true, false, 'is in the process of merging with the Milky Way and is the largest galaxy visible from the Earth');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Spheroidal Galaxy', 'elliptical loop-shaped galaxy', 10000, 20, true, false, 'is one of the closest companion galaxies to the Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'barred dwarf spiral galaxy', 32200, 49.97, true, false, 'is predicted to merge with he Milky Way in approximately 2.4 billion years');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, 27.321582, false, true, 'is tidally locked to the Earth therefore always showing the same side', 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 6.2, 1.262, false, false, 'has an equatorial, almost circular, orbit', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 11.267, 0.319, false, false, 'has 6-mile - 9.7 kilometer - crater Stickney', 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, 1.769, false, true, 'is the most volcanically active world in the solar system', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, 3.551, false, true, 'has the smoothest surface of any known solid object in the Solar System', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1, 7.155, false, true, 'is the only moon known to have its own magnetic field', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, 16.69, false, true, 'is the most heavily cratered of any object in our solar system', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 83.5, 0.498, false, true, 'is the largest of the inner satellites of Jupiter ', 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 198.2, 0.942, false, true, 'has large crater that gives Mimas the appearance of the "Death Star" from Star Wars', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252.1, 1.370, false, true, 'is mostly covered by fresh, clean ice, making it one of the most reflective bodies of the Solar System', 6);
INSERT INTO public.moon VALUES (11, 'Titan', 2574.73, 15.95, false, true, 'is the only moon in the solar system with a dense atmosphere', 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 735.6, 79.33, false, true, 'has a chain of 10km high mountains girdling the equator', 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', 135, 21.28, false, false, 'has a fairly eccentric orbit', 6);
INSERT INTO public.moon VALUES (14, 'Phoebe', 106.5, 550.31, true, false, 'has a mysterious origin as it may be an object from the Kuiper belt', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 235.8, 1.413, false, true, 'has one of the most extreme and varied topographies of any object in the Solar System', 8);
INSERT INTO public.moon VALUES (16, 'Oberon', 761.4, 13.46, false, true, 'is heavily cratered', 8);
INSERT INTO public.moon VALUES (17, 'Titania', 788.9, 8.706, false, true, 'was geologically active', 8);
INSERT INTO public.moon VALUES (18, 'Umbriel', 584.7, 4.144, false, true, 'is the darkest among Uranian moons', 8);
INSERT INTO public.moon VALUES (19, 'Ariel', 578.9, 2.520, false, true, 'have had the most recent geologic activity', 8);
INSERT INTO public.moon VALUES (20, 'Triton', 1353.4, 5.877, true, true, 'is the only large moon in our solar system that orbits in the opposite direction of its planets rotation', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6378.136, 365.256, 1, false, true, 'has life', 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 2440.53, 87.969, 0, false, false, 'the closest to the Sun', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 6051.8, 224.701, 0, false, false, 'the hotest planet in the Solar system', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3396.19, 686.971, 2, false, false, 'is red', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 71492, 4332.59, 84, true, false, 'the GOAT of gas giants of the Solar system', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 60268, 10759.22, 83, true, false, 'the Lord Of The Rings of the Solar system', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25559, 30688.5, 27, true, false, 'orbits the sun on its side', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24764, 60182, 14, true, false, 'the only planet in our solar system not visible to the naked eye', 1);
INSERT INTO public.planet VALUES (9, 'Smertrios', NULL, 2.8766, 0, false, false, 'exceptionally large planetary core', 6);
INSERT INTO public.planet VALUES (10, 'Janssen', NULL, 0.7365474, 0, false, true, 'nicknamed "Hell on Earth"', 7);
INSERT INTO public.planet VALUES (11, 'Harriot', NULL, 260, 0, false, false, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Phobetor', NULL, 98.2114, 0, false, true, 'is a super-Earth orbiting a pulsar', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.000, 1, 1, 'yellow dwarf', false, 'has Earth therefore has life', 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 2.063, 1.711, 25.4, 'white main-sequence star', true, 'is a binary star with Sirius B', 1);
INSERT INTO public.star VALUES (3, 'Sirius B', 1.018, 0.0084, 0.056, 'white dwarf', true, 'with Sirius A they make the brightest star in the night sky', 1);
INSERT INTO public.star VALUES (4, 'Alpheratz(primary)', 3.800, 2.7, 240, 'blue-white subgiant', true, 'is a mercury-manganese star', 2);
INSERT INTO public.star VALUES (5, 'BAT99-98', 226, 37.5, 5000000, 'Wolf-Rayet star', false, 'is one of the most massive and luminous stars known', 4);
INSERT INTO public.star VALUES (6, 'Ogma', 1.345, 1.541, 3.03, 'yellow subgiant', false, NULL, 1);
INSERT INTO public.star VALUES (7, 'Copernicus', 0.905, 0.943, 0.582, 'subgiant', true, 'has multiplanetary sysytem', 1);
INSERT INTO public.star VALUES (8, 'Lich', 1.4, 0.000015, NULL, 'pulsar', false, 'has multuplanetary system', 1);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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

