-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1

-- Tiempo de generación: 17-10-2024 a las 00:11:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

-- Tiempo de generación: 15-09-2024 a las 21:40:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria_tudai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `ID_Editorial` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`ID_Editorial`, `nombre`, `pais`) VALUES
(1, 'Debolsillo', 'España'),
(2, 'Ivrea', 'Argentina'),
(3, 'NOVA', 'Argentina'),
(4, 'Panini', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `ID_Libro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,

  `descripcion` text NOT NULL,

  `ID_Editorial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--


INSERT INTO `libro` (`ID_Libro`, `titulo`, `autor`, `genero`, `precio`, `descripcion`, `ID_Editorial`) VALUES
(1, 'Juego de tronos', 'George R.R. Martin', 'Fantasia', 30000, 'En el legendario mundo de los Siete Reinos, donde el verano puede durar décadas y el invierno toda una vida, y donde rastros de una magia inmemorial surgen de los rincones más sombríos, la tierra del norte, Invernalia, está resguardada por un colosal muro de hielo que detiene a fuerzas oscuras y sobrenaturales. En este majestuoso escenario, lord Stark y su familia se encuentran en el centro de un conflicto que desatará todas las pasiones: la traición y la lealtad, la compasión y la sed de venganza, el amor y el poder, la lujuria y el incesto, todo ello para ganar la más mortal de las batallas: el trono de hierro, una poderosa trampa que atrapará a los personajes… y al lector.', 1),
(2, 'Fullmetal alchemist', ' Hiromu Arakawa', 'Aventura', 6000, 'Los hermanos Edward y Alphonse Elric viven en un mundo donde la magia y la alquimia existen y se pueden practicar. Después de la muerte de su madre, juntos tratarán de resucitarla a través de la alquimia. Pero algo sale mal y Edward pierde un brazo y una pierna, y el espíritu de Alphonse acaba relegado en una vieja armadura.\r\n\r\nPara poder recuperar sus cuerpos deciden apuntarse al ejército de Amestris, en la división de alquimistas, para así poder seguir investigando sobre “la piedra filosofal” que puede devolverlos a la normalidad. Lo que no esperaban descubrir es que detrás de la piedra filosofal hay toda una conspiración escondida para destruir el mundo entero tal y como lo conocemos…', 2),
(3, 'Elantris', 'Brandon Sanderson', 'Fantasia', 40000, 'La ciudad de Elantris, poderosa y bella capital de Arelon, había sido llamada la «ciudad de los dioses». Antaño famosa sede de inmortales, lugar repleto de poderosa magia, Elantris ha caído en desgracia. Ahora sólo acoge a los nuevos «muertos en vida», postrados en una insufrible «no-vida» tras una misteriosa y terrible transformación. Un matrimonio de estado destinado a unir los dos reinos de Arelon y Teod se frustra, ya que el novio, Raoden, el príncipe de Arelon, sufre inesperadamente la Transformación y se convierte en un «muerto en vida» obligado a refugiarse en Elantris. Su reciente esposa, la princesa Sarene de Teod, creyéndole muerto, se ve obligada a incorporarse a la vida de Arelon y su nueva capital, Kae. Mientras, el embajador y alto sacerdote de otro reino vecino, Fjordell, va a usar su habilidad política para intentar dominar los reinos de Arelod y Teod con el propósito de somerterlos a su emperador y su dios.', 3),
(4, 'Spider-man', 'Stan Lee', 'Superheroe', 15000, 'Mordido por una araña genéticamente modificada, un estudiante de secundaria tímido y torpe obtiene increíbles capacidades como arácnido. Pronto comprenderá que su cometido es utilizarlas para luchar contra el mal y defender a sus vecinos.', 4),
(5, 'La comunidad del anillo', 'J. R. R. Tolkien', 'Fantasia', 30000, 'En la Tierra Media, el Señor Oscuro Sauron forjó los Grandes Anillos del Poder y creó uno con el poder de esclavizar a toda la Tierra Media. Frodo Bolsón es un hobbit al que su tío Bilbo hace portador del poderoso Anillo Único con la misión de destruirlo. Acompañado de sus amigos, Frodo emprende un viaje hacia Mordor, el único lugar donde el anillo puede ser destruido. Sin embargo, Sauron ordena la persecución del grupo para recuperar el anillo y acabar con la Tierra Media.', 1),
(6, 'El rey arturo', 'Chretien de Troyes ', 'Aventura', 4000, 'Arturo quiere abandonar Bretaña para volver a Roma. Pero antes, una última misión le hace comprender tanto a él como a los caballeros de la Mesa Redonda que lo que Bretaña necesita es un rey que la defienda de la amenaza de la invasión sajona.', 1),
(7, 'Yo soy el Diego de la gente', 'Diego Armando Maradona', 'Autobiografico', 10000, 'Diego Armando Maradona. Desde los orígenes pobres hasta la mayor gloria, pasando por cada una de sus muertes y sus respectivas resurrecciones, por las definiciones sobre sus amigos y sus enemigos, todo está relatado aquí por él, en primera persona, un Maradona íntegro y también íntimo.', 1),
(8, 'Dragon ball', 'Akira Toriyama', 'Aventura', 6000, 'Se centra en un niño alienígena llamado Goku que es enviado a la Tierra. Tiene características especiales como una cola de mono y potencial para las artes marciales. Conoce a Bulma y le acompaña a buscar las bolas de Dragón, un artefacto mágico capaz de conceder deseos.', 2),
(9, 'DUNE: Parte 1', 'Frank Herbert', 'Postapocalíptico', 40000, '\"Dune\", el periplo de un héroe mítico y con una enorme carga emocional, cuenta la historia de Paul Atreides. Se trata de un joven brillante y de gran talento con un destino grandioso que no comprende todavía y que deberá viajar al planeta más peligroso del universo para asegurar el futuro de su familia y de su pueblo. Mientras las fuerzas del mal se enfrentan por uno de los recursos más excepcionales del planeta que tiene el poder de desbloquear todo el potencial de la humanidad, solo los que logren dominar sus miedos podrán sobrevivir.', 3),
(11, 'Naruto', 'Masashi Kishimoto', 'Aventura', 6000, 'Naruto es una serie de manga escrita e ilustrada por Masashi Kishimoto. La obra narra la historia de un ninja adolescente llamado Naruto Uzumaki, quien aspira a convertirse en Hokage, líder de su aldea, con el propósito de ser reconocido como alguien importante dentro de la aldea y entre sus compañeros.', 4);


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`ID_Editorial`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ID_Libro`),
  ADD KEY `ID_Editorial` (`ID_Editorial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `ID_Editorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`ID_Editorial`) REFERENCES `editorial` (`ID_Editorial`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
