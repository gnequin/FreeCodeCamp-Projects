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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(35) NOT NULL,
    date_discovered date,
    discoverer_name character varying(30),
    class character varying(5),
    in_asteroid_belt boolean DEFAULT true
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text,
    constellation character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    millions_of_lightyears_from_milkyway numeric(7,2)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer NOT NULL,
    discovery_year smallint,
    discoverer_name character varying(50)
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
    name character varying(30) NOT NULL,
    description text,
    temperature_by_celcius integer,
    moons integer DEFAULT 0,
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false,
    planet_type character varying(20),
    constellation character varying(30)
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
    name character varying(30) NOT NULL,
    lightyears_from_earth numeric(8,2),
    planet_id integer,
    star_id integer NOT NULL,
    galaxy_id integer,
    constellation character varying(35)
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

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES (1, 'Ceres', '1801-01-01', 'Giuseppe Piazzi', 'G', true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', '1807-03-29', 'Heinrich Olbers', 'V', true);
INSERT INTO public.asteroid VALUES (3, 'Pallas', '1802-03-28', 'Heinrich Olbers', 'B', true);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', '1849-04-12', 'Annibale de Gasparis', 'C', true);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', '1910-08-02', 'Vincenzo Cerulli', 'F', true);
INSERT INTO public.asteroid VALUES (6, 'Europa', '1858-02-04', 'Hermann Goldschmidt', 'C', true);
INSERT INTO public.asteroid VALUES (7, 'Hektor', '1907-02-10', 'August Kopff', 'D', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'The galaxy containing the sun, the Solar System, and the Earth.', 'Sagittarius', 1, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 'The closest big galaxy to the Milky Way, thought to collide with the Milky Way in about 4.5 billion years. When they do, they will eventually merge into one, massive galaxy called Milkdromeda.', 'Andromeda', 2, 2.50);
INSERT INTO public.galaxy VALUES ('Antennae', 'Its appearance is like insect antennae.', 'Corvus', 3, 45.00);
INSERT INTO public.galaxy VALUES ('Backward', 'The tips of its spiraling arms point in the same direction of its rotation, making it look like it spins backwards.', 'Centaurus', 4, 111.00);
INSERT INTO public.galaxy VALUES ('Black Eye', 'Has a dark band of dust in front of its bright nuclues. Also known as the "Evil Eye" or "Sleeping Beauty" galaxy.', 'Coma Berenices', 5, 17.00);
INSERT INTO public.galaxy VALUES ('Bode''s', 'Named after Johann Elert Bode, who discovered it in 1774.', 'Ursa Major', 6, 12.00);
INSERT INTO public.galaxy VALUES ('Butterfly', 'Looks just like a butterfly.', 'Virgo', 7, 60.00);
INSERT INTO public.galaxy VALUES ('Cartwheel', 'Looks just like a cartwheel.', 'Sculptor', 8, 500.00);
INSERT INTO public.galaxy VALUES ('Cigar', 'Looks just like a cigar.', 'Ursa Major', 9, 12.00);
INSERT INTO public.galaxy VALUES ('Circinus', 'Named after the constellation it is located in.', 'Circinus', 10, 13.00);
INSERT INTO public.galaxy VALUES ('Comet', 'Looks like a comet, but it is a galaxy.', 'Sculptor', 12, 3200.00);
INSERT INTO public.galaxy VALUES ('Cosmos Redshift 7', 'Its name is based on a Redshift measurement, which measure changes in wavelength for electromagnetic radiation, like light.', 'Sextans', 13, 800.00);
INSERT INTO public.galaxy VALUES ('Eye of Sauron', 'Looks just like the ''Eye of Sauron'' from The Lord of the Rings.', 'Canes Venatici', 14, 52.00);
INSERT INTO public.galaxy VALUES ('Hockey Stick', 'Looks just like a hockey stick.', 'Canes Venatici', 15, 30.00);
INSERT INTO public.galaxy VALUES ('Hoag''s Object', 'Named after Art Hoag, who discovered it.', 'Serpens Caput', 16, 612.80);
INSERT INTO public.galaxy VALUES ('Lindsay-Shapley Ring', 'Named after Eric Lindsay who discovered it, his professor Harlow Shapley, and how it''s a ring galaxy.', 'Volans', 17, 300.00);
INSERT INTO public.galaxy VALUES ('Little Sombrero', 'Named after its likeness to the Sombrero Galaxy.', 'Pegasus', 18, 40.00);
INSERT INTO public.galaxy VALUES ('Malin 1', 'Discovered and named by David Malin.', 'Coma Berenices', 19, 1200.00);
INSERT INTO public.galaxy VALUES ('Medusa Merger', 'The dust emerging from the merging galaxies looks like the snakes on the head of Medusa from Greek mythology.', 'Ursa Major', 20, 130.00);
INSERT INTO public.galaxy VALUES ('Sculptor Dwarf', 'Similar to the Sculpture Galaxies.', 'Sculptor', 21, 0.26);
INSERT INTO public.galaxy VALUES ('Mice', 'Looks just like mice.', 'Coma Berenices', 22, 290.00);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 'Named after Ferdinand Magellan.', 'Tucana', 23, 200.00);
INSERT INTO public.galaxy VALUES ('Mayall''s Object', 'Discovered and named after Nicholas Mayall.', 'Ursa Major', 24, 450.00);
INSERT INTO public.galaxy VALUES ('Needle', 'Slender, and looks just like a needle.', 'Coma Berenices', 25, 38.49);
INSERT INTO public.galaxy VALUES ('Wolf-Lundmark-Melotte', 'Named after the three astronomers who lead to its discovery.', 'Cetus', 26, 3.10);
INSERT INTO public.galaxy VALUES ('Pinwheel', 'Looks just like a pinwheel toy.', 'Ursa Major', 27, 21.00);
INSERT INTO public.galaxy VALUES ('Sculptor', 'Named after its location in the Sculptor constellation. Also known as the ''Silver Dollar'' or ''Silver Coin'' Galaxy with its light, circular appearance.', 'Sculptor', 28, 11.42);
INSERT INTO public.galaxy VALUES ('Sombrero', 'Looks just like a sombrero.', 'Virgo', 29, 31.10);
INSERT INTO public.galaxy VALUES ('Southern Pinwheel', 'Named after its resemblence to the Pinwheel Galaxy and its location in the southern hemisphere.', 'Hydra', 30, 15.00);
INSERT INTO public.galaxy VALUES ('Sunflower', 'Looks just like a sunflower.', 'Canes Venatici', 31, 27.00);
INSERT INTO public.galaxy VALUES ('Tadpole', 'Looks just like a tadpole.', 'Draco', 32, 420.00);
INSERT INTO public.galaxy VALUES ('Triangulum', 'Named after its location in the Triangulum constellation.', 'Triangulum', 33, 2.73);
INSERT INTO public.galaxy VALUES ('Whirlpool', 'Looks just like a whirlpool.', 'Canes Venatici', 34, 31.00);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 'Named after Ferdinand Magellan, and the 4th largest galaxy.', 'Dorado, Mensa', 35, 0.16);
INSERT INTO public.galaxy VALUES ('Fireworks', 'Looks just like colorful fireworks.', 'Cygnus, Cepheus', 36, 25.20);
INSERT INTO public.galaxy VALUES ('Coma Pinwheel', 'Named after its location in the Coma Benerices constellation and likeness to the Pinwheel galaxy.', 'Coma Berenices', 11, 49.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Phobos', 4, 2, 1877, 'Hall');
INSERT INTO public.moon VALUES ('Moon', 1, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Deimos', 4, 3, 1877, 'Hall');
INSERT INTO public.moon VALUES ('Io', 5, 4, 1610, 'Galileo');
INSERT INTO public.moon VALUES ('Europa', 5, 5, 1610, 'Galileo');
INSERT INTO public.moon VALUES ('Ganymede', 5, 6, 1610, 'Galileo');
INSERT INTO public.moon VALUES ('Callisto', 5, 7, 1610, 'Galileo');
INSERT INTO public.moon VALUES ('Amalthea', 5, 8, 1892, 'Barnard');
INSERT INTO public.moon VALUES ('Himalia', 5, 9, 1904, 'Perrine');
INSERT INTO public.moon VALUES ('Elara', 5, 10, 1905, 'Perrine');
INSERT INTO public.moon VALUES ('Pasiphae', 5, 11, 1908, 'Melotte');
INSERT INTO public.moon VALUES ('Mimas', 6, 12, 1789, 'Herschel');
INSERT INTO public.moon VALUES ('Enceladus', 6, 13, 1789, 'Herschel');
INSERT INTO public.moon VALUES ('Tethys', 6, 14, 1684, 'Cassini');
INSERT INTO public.moon VALUES ('Dione', 6, 15, 1684, 'Cassini');
INSERT INTO public.moon VALUES ('Rhea', 6, 16, 1672, 'Cassini');
INSERT INTO public.moon VALUES ('Titan', 6, 17, 1655, 'Huygens');
INSERT INTO public.moon VALUES ('Phoebe', 6, 18, 1899, 'Pickering');
INSERT INTO public.moon VALUES ('Ariel', 7, 19, 1851, 'Lassell');
INSERT INTO public.moon VALUES ('Umbriel', 7, 20, 1851, 'Lassell');
INSERT INTO public.moon VALUES ('Titania', 7, 21, 1787, 'Herschel');
INSERT INTO public.moon VALUES ('Oberon', 7, 22, 1787, 'Herschel');
INSERT INTO public.moon VALUES ('Miranda', 7, 23, 1948, 'Kuiper');
INSERT INTO public.moon VALUES ('Triton', 8, 24, 1846, 'Lassell');
INSERT INTO public.moon VALUES ('Nereid', 8, 25, 1949, 'Kuiper');
INSERT INTO public.moon VALUES ('Charon', 10, 26, 1978, 'Christy');
INSERT INTO public.moon VALUES ('Kerberos', 10, 27, 2011, 'Showalter');
INSERT INTO public.moon VALUES ('Styx', 10, 28, 2012, 'Showalter');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Venus', 'Its atmosphere is filled with toxic carbon dioxide, and covered in thick, yellow clouds of hot, sulfuric acid, making it the hottest planet in the Solar System.', 475, 0, 2, false, 'Terrestrial', 'Pisces');
INSERT INTO public.planet VALUES ('Ceres', 'The only dwarf planet located within the inner part of the Solar System as the largest object in the asteroid belt, though it is known as the smallest known dwarf planet.', -38, 0, 9, false, 'Dwarf', 'Taurus');
INSERT INTO public.planet VALUES ('Mars', 'Called the ''Red Planet'', Mars is red from all the rusty iron in its soil. Mars is similar to Earth, having seasons, polar ice caps, volcanoes, canyons, and its own weather.', -65, 2, 4, false, 'Terrestrial', 'Pisces');
INSERT INTO public.planet VALUES ('Jupiter', 'Covered in cloud stripes, Jupiter has giant storms that have lasted hundreds of years. Has rings, but very faint to the naked eye.', -110, 79, 5, false, 'Gas Giant', 'Pisces');
INSERT INTO public.planet VALUES ('Pluto', 'A donut-shaped region of icy bodies located within the Kuiper Belt.', -225, 5, 10, false, 'Dwarf', 'Sagittarius');
INSERT INTO public.planet VALUES ('Haumea', 'Orbiting the sun far from Neptune, Haumea is as big as Pluto and has two moons.', -241, 2, 11, false, 'Dwarf', 'Bootes');
INSERT INTO public.planet VALUES ('Neptune', 'Dark, cold and really windy, Neptune is the last of the planets in the Solar System. It''s more than 30 times farther from the Sun than Earth, and is filled with water, ammonia, and methane.', -200, 14, 8, false, 'Ice Giant', 'Pisces');
INSERT INTO public.planet VALUES ('Orcus', 'Thought to be the ''anti-Pluto'', Orcus was named after the Etruscan god of the underworld.', -230, 1, 14, false, 'TNO', 'Pisces');
INSERT INTO public.planet VALUES ('Gonggong', 'Gonggong has a red appearance, likely due to the organic substances called ''tholins'' on its surface. The tidal forces on Gonggong are thought to be caused by its moon, Xiangliu.', 26, 1, 16, false, 'TNO', 'Pisces');
INSERT INTO public.planet VALUES ('Earth', 'The third planet from the Sun, Earth is the only planet with the perfect set of environments known to harbor life. Its name comes from Old English and Germanic words, meaning ''ground''.', 15, 1, 3, true, 'Terrestrial', 'Cassiopeia');
INSERT INTO public.planet VALUES ('Saturn', 'While Saturn is only one-eighth dense as Earth, it is 95 times bigger.', -140, 82, 6, false, 'Gas Giant', 'Capricornus');
INSERT INTO public.planet VALUES ('Uranus', 'Made up of water, methane, and ammonia over its rocky center. The methane gives Uranus its signature blue color.', -195, 27, 7, false, 'Ice Giant', 'Aries');
INSERT INTO public.planet VALUES ('Makemake', 'The fourth body classified as a dwarf planet, and one of the bodies that caused Pluto to lose its own status as a major planet. Makemake is big and bright enough to be seen by a high-end telescope.', -240, 1, 12, false, 'Dwarf', 'Coma Berenices');
INSERT INTO public.planet VALUES ('Eris', 'One of the largest known dwarf planets, Eris is about the same size as Pluto but is three times farther from the Sun.', -240, 1, 13, false, 'Dwarf', 'Cetes');
INSERT INTO public.planet VALUES ('Quaoar', 'About half in diameter compared to Pluto, Quaoar is named after the creator diety of the Native American Tongva people, while Weywot is his son.', -220, 1, 15, false, 'TNO', 'Ophiuchus');
INSERT INTO public.planet VALUES ('Sedna', 'After Mars, Sedna is the second reddest object in the Solar System.', -240, 0, 17, false, 'TNO', 'Taurus');
INSERT INTO public.planet VALUES ('Mercury', 'One of the rocky planets that is covered with craters, just like the Moon. Has a thin atmosphere, and a day on Mars lasts about 59 Earth days.', 167, 0, 1, false, 'Terrestrial', 'Taurus');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Antares', 554.50, 4, 1, 1, 'Scorpius');
INSERT INTO public.star VALUES ('KW Sagittarii', 7828.00, 5, 3, 1, 'Sagittarius');
INSERT INTO public.star VALUES ('Betelgeuse', 642.50, 3, 2, 1, 'Orion');
INSERT INTO public.star VALUES ('VV Cephei A', 5000.00, 3, 4, 1, 'Cepheus');
INSERT INTO public.star VALUES ('Mu Cephei', 2838.00, 3, 5, 1, 'Cepheus');
INSERT INTO public.star VALUES ('KY Cygni', 5153.00, 3, 6, 1, 'Cygnus');
INSERT INTO public.star VALUES ('V354 Cephei', 11420.00, 3, 7, 1, 'Cepheus');
INSERT INTO public.star VALUES ('RW Cephei', 11420.00, 3, 8, 1, 'Cepheus');
INSERT INTO public.star VALUES ('VY Canis Majoris', 4892.00, 3, 9, 1, 'Canis Major');
INSERT INTO public.star VALUES ('UY Scuti', 5219.00, 3, 10, 1, 'Scutum');


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 36, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroids_asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_asteroid_id_key UNIQUE (asteroid_id);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

