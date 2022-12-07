-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2022 a las 04:31:14
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferrreteria_epa`
--
CREATE DATABASE IF NOT EXISTS `ferrreteria_epa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ferrreteria_epa`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `PRAL_DATA_CATEGORIA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_CATEGORIA` (IN `TIPO_CONSULTA` INT, IN `xID_CATEGORIA` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_CATEGORIA AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_CATEGORIA AS A
        where A.ID_CATEGORIA=xID_CATEGORIA;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_MARCA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_MARCA` (IN `TIPO_CONSULTA` INT, IN `xID_MARCA` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_MARCA AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_MARCA AS A
        where A.ID_MARCA=xID_MARCA;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_PRODUCTO` (IN `TIPO_CONSULTA` INT, IN `xID_PRODUCTO` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_PRODUCTO AS A
        where A.ID_PRODUCTO=xID_PRODUCTO;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_RECEPCION_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_RECEPCION_PRODUCTO` (IN `TIPO_CONSULTA` INT, IN `xID_RECEPCION` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO AS A
        where A.ID_RECEPCION=xID_RECEPCION;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_RECEPCION_PRODUCTO_DETA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_RECEPCION_PRODUCTO_DETA` (IN `TIPO_CONSULTA` INT, IN `xID_RECEPCION` INT, IN `xID_RECEPCION_DETA` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO_DETA AS A
         where A.ID_RECEPCION=xID_RECEPCION;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_RECEPCION_PRODUCTO_DETA AS A
        where A.ID_RECEPCION=xID_RECEPCION
        AND A.ID_RECEPCION_DETA=xID_RECEPCION_DETA;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_SALIDA_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_SALIDA_PRODUCTO` (IN `TIPO_CONSULTA` INT, IN `xID_SALIDA` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_SALIDA_PRODUCTO AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_SALIDA_PRODUCTO AS A
        where A.ID_SALIDA=xID_SALIDA;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_SALIDA_PRODUCTO_DETA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_SALIDA_PRODUCTO_DETA` (IN `TIPO_CONSULTA` INT, IN `xID_SALIDA` INT, IN `xID_SALIDA_DETA` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_SALIDA_PRODUCTO_DETA AS A
         where A.ID_SALIDA=xID_SALIDA;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_SALIDA_PRODUCTO_DETA AS A
        where A.ID_SALIDA=xID_SALIDA
        AND A.ID_SALIDA_DETA=xID_SALIDA_DETA;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_DATA_USUARIO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_DATA_USUARIO` (IN `TIPO_CONSULTA` INT, IN `xID_USUARIO` INT, IN `xLOGIN_USUARIO` INT, IN `OPCION_CONSULTA` INT)   BEGIN
	IF (TIPO_CONSULTA=1) THEN
		SELECT * FROM V_USUARIOS AS A;
       
	ELSEIF (TIPO_CONSULTA=2) THEN
		SELECT * FROM V_USUARIOS AS A
        where A.ID_USUARIO=xID_USUARIO;
        
	ELSEIF (TIPO_CONSULTA=3) THEN
		SELECT * FROM V_USUARIOS AS A
        where A.LOGIN_USUARIO=xLOGIN_USUARIO;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_CATEGORIA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_CATEGORIA` (IN `TIPO_ACTUALIZA` INT, IN `xID_CATEGORIA` INT, IN `xNOMBRE_CATEGORIA` VARCHAR(100))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_CATEGORIA := ifnull(max(a.ID_CATEGORIA),0)+1 FROM categoria as a ;
		INSERT INTO categoria(ID_CATEGORIA,NOMBRE_CATEGORIA) VALUES(@ID_CATEGORIA,xNOMBRE_CATEGORIA);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update categoria set NOMBRE_CATEGORIA=xNOMBRE_CATEGORIA
        where categoria.ID_CATEGORIA=xID_CATEGORIA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM categoria where ID_CATEGORIA=xID_CATEGORIA; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_MARCA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_MARCA` (IN `TIPO_ACTUALIZA` INT, IN `xID_MARCA` INT, IN `xNOMBRE_MARCA` VARCHAR(100))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_MARCA := ifnull(max(a.ID_MARCA),0)+1 FROM MARCA as a ;
		INSERT INTO MARCA(ID_MARCA,NOMBRE_MARCA) VALUES(@ID_MARCA,xNOMBRE_MARCA);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update MARCA set NOMBRE_MARCA=xNOMBRE_MARCA
        where MARCA.ID_MARCA=xID_MARCA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM MARCA where ID_MARCA=xID_MARCA; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_PRODUCTO` (IN `TIPO_ACTUALIZA` INT, IN `xID_PRODUCTO` INT, IN `xID_CATEGORIA` INT, IN `xID_MARCA` INT, IN `xNOMBRE_PRODUCTO` VARCHAR(100), IN `xDESCRIPCION` VARCHAR(150))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_PRODUCTO := ifnull(max(a.ID_PRODUCTO),0)+1 FROM PRODUCTO as a ;
		INSERT INTO PRODUCTO(ID_PRODUCTO,ID_CATEGORIA,ID_MARCA,NOMBRE_PRODUCTO,DESCRIPCION,EXISTENCIA,ESTADO_PRODUCTO) VALUES(@ID_PRODUCTO,xID_CATEGORIA,xID_MARCA,xNOMBRE_PRODUCTO,xDESCRIPCION,0,'AC');
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update PRODUCTO set ID_CATEGORIA=xID_CATEGORIA,ID_MARCA=xID_MARCA,NOMBRE_PRODUCTO=xNOMBRE_PRODUCTO,DESCRIPCION=xDESCRIPCION
        where PRODUCTO.ID_PRODUCTO=xID_PRODUCTO;
	elseif(TIPO_ACTUALIZA=3) THEN
		update PRODUCTO set ESTADO_PRODUCTO='IN'
        where PRODUCTO.ID_PRODUCTO=xID_PRODUCTO;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_RECEPCION_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_RECEPCION_PRODUCTO` (IN `TIPO_ACTUALIZA` INT, IN `xFECHA_RECEPCION` VARCHAR(100), IN `xOBSERVACIONES` VARCHAR(255))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		INSERT INTO recepcion_producto(FECHA_RECEPCION,OBSERVACIONES) VALUES(xFECHA_RECEPCION,xOBSERVACIONES);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update RECEPCION_PRODUCTO set FECHA_RECEPCION=xFECHA_RECEPCION,ESTADO_RECEPCION=xESTADO_RECEPCION,OBSERVACIONES=xOBSERVACIONES
        where RECEPCION_PRODUCTO.ID_RECEPCION=xID_RECEPCION;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM RECEPCION_PRODUCTO where ID_RECEPCION=xID_RECEPCION; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_RECEPCION_PRODUCTO_DETA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_RECEPCION_PRODUCTO_DETA` (IN `TIPO_ACTUALIZA` INT, IN `xID_RECEPCION` INT, IN `xID_RECEPCION_DETA` INT, IN `xCANTIDAD_RECEPCION` INT, IN `xID_PRODUCTO` INT)   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		INSERT INTO recepcion_producto_deta(ID_RECEPCION,ID_RECEPCION_DETA,CANTIDAD_RECEPCION,ID_PRODUCTO) VALUES(xID_RECEPCION,xID_RECEPCION,xCANTIDAD_RECEPCION,xID_PRODUCTO);
		
        UPDATE producto SET EXISTENCIA =EXISTENCIA+xCANTIDAD_RECEPCION
        WHERE producto.ID_PRODUCTO=xID_PRODUCTO;
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update RECEPCION_PRODUCTO_DETA set CANTIDAD_RECEPCION=xCANTIDAD_RECEPCION,ID_PRODUCTO=xID_PRODUCTO
        where RECEPCION_PRODUCTO_DETA.ID_RECEPCION=xID_RECEPCION
        AND RECEPCION_PRODUCTO_DETA.ID_RECEPCION_DETA=xID_RECEPCION_DETA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM RECEPCION_PRODUCTO_DETA 
        where ID_RECEPCION=xID_RECEPCION 
        and ID_RECEPCION_DETA=xID_RECEPCION_DETA; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_SALIDA_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_SALIDA_PRODUCTO` (IN `TIPO_ACTUALIZA` INT, IN `xFECHA_SALIDA` VARCHAR(100), IN `xOBSERVACIONES` VARCHAR(255))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		INSERT INTO salida_productos(FECHA_SALIDA,OBSERVACIONES) VALUES(xFECHA_SALIDA,xOBSERVACIONES);
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update SALIDA_PRODUCTO set FECHA_SALIDA=xFECHA_SALIDA,ESTADO_SALIDA=xESTADO_SALIDA,OBSERVACIONES=xOBSERVACIONES
        where SALIDA_PRODUCTO.ID_SALIDA=xID_SALIDA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM SALIDA_PRODUCTO where ID_SALIDA=xID_SALIDA; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_SALIDA_PRODUCTO_DETA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_SALIDA_PRODUCTO_DETA` (IN `TIPO_ACTUALIZA` INT, IN `xID_SALIDA` INT, IN `xID_SALIDA_DETA` INT, IN `xCANTIDAD_SALIDA` INT, IN `xID_PRODUCTO` INT)   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		INSERT INTO salida_producto_deta(ID_SALIDA,ID_SALIDA_DETA,ID_PRODUCTO,CANTIDAD_SALIDA) VALUES(xID_SALIDA,xID_SALIDA_DETA,xID_PRODUCTO,xCANTIDAD_SALIDA);
		
        UPDATE producto SET EXISTENCIA =EXISTENCIA-xCANTIDAD_SALIDA
        WHERE producto.ID_PRODUCTO=xID_PRODUCTO;
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update SALIDA_PRODUCTO_DETA set CANTIDAD_SALIDA=xCANTIDAD_SALIDA,ID_PRODUCTO=xID_PRODUCTO
        where SALIDA_PRODUCTO_DETA.ID_SALIDA=xID_SALIDA
        AND SALIDA_PRODUCTO_DETA.ID_SALIDA_DETA=xID_SALIDA_DETA;
	elseif(TIPO_ACTUALIZA=3) THEN
		DELETE FROM SALIDA_PRODUCTO_DETA 
        where ID_SALIDA=xID_SALIDA 
        and ID_SALIDA_DETA=xID_SALIDA_DETA; 
    END IF;
END$$

DROP PROCEDURE IF EXISTS `PRAL_MTTO_USUARIO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRAL_MTTO_USUARIO` (IN `TIPO_ACTUALIZA` INT, IN `xID_USUARIO` INT, IN `xNOMBRE_USUARIO` VARCHAR(100), IN `xLOGIN_USUARIO` VARCHAR(45), IN `xCLAVE` VARCHAR(32))   BEGIN
	IF (TIPO_ACTUALIZA=1) THEN
		SELECT @ID_USUARIO := ifnull(max(a.ID_USUARIO),0)+1 FROM USUARIOS as a ;
		INSERT INTO USUARIOS(ID_USUARIO,NOMBRE_USUARIO,LOGIN_USUARIO,CLAVE,ESTADO_USUARIO) VALUES(@ID_USUARIO,xNOMBRE_USUARIO,xLOGIN_USUARIO,md5(xCLAVE),'AC');
    ELSEIF(TIPO_ACTUALIZA=2) THEN
		update USUARIOS set NOMBRE_USUARIO=xNOMBRE_USUARIO,LOGIN_USUARIO=xLOGIN_USUARIO,CLAVE=xCLAVE
        where USUARIOS.ID_USUARIO=xID_USUARIO;
	elseif(TIPO_ACTUALIZA=3) THEN
		update USUARIOS set ESTADO_USUARIO='IN'
        where USUARIOS.ID_USUARIO=xID_USUARIO; 
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE_CATEGORIA` varchar(100) DEFAULT NULL,
  `ESTADO` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_CATEGORIA`, `NOMBRE_CATEGORIA`, `ESTADO`) VALUES
(2, 'Ferreteria', 1),
(3, 'Electrico', 1),
(4, 'TestDesdeUI', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

DROP TABLE IF EXISTS `detalle_entrada`;
CREATE TABLE `detalle_entrada` (
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

DROP TABLE IF EXISTS `detalle_salida`;
CREATE TABLE `detalle_salida` (
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_bitcora`
--

DROP TABLE IF EXISTS `inventario_bitcora`;
CREATE TABLE `inventario_bitcora` (
  `ID_BITACORA` int(11) NOT NULL,
  `FECHA_BITACORA` date NOT NULL,
  `CLASE_MOVIMIENTO` varchar(3) NOT NULL,
  `LLAVE_MOVIMIENTO` varchar(250) NOT NULL,
  `REFERENCIA_MOVIMIENTO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `ID_MARCA` int(11) NOT NULL,
  `NOMBRE_MARCA` varchar(100) DEFAULT NULL,
  `ESTADO` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`ID_MARCA`, `NOMBRE_MARCA`, `ESTADO`) VALUES
(1, 'Stanley', 1),
(2, 'Skill', 1),
(3, 'BBT', 1),
(4, 'Test', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_MARCA` int(11) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  `EXISTENCIA` int(11) DEFAULT NULL,
  `ESTADO_PRODUCTO` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `ID_CATEGORIA`, `ID_MARCA`, `NOMBRE_PRODUCTO`, `DESCRIPCION`, `EXISTENCIA`, `ESTADO_PRODUCTO`) VALUES
(1, 2, 3, 'Llave halen', 'TEDS', 10, 1),
(2, 2, 2, 'TEST23', 'TEDS', 5, 1),
(3, 3, 2, 'Cable vulcan cal 12', 'TEDS', 5, 1),
(4, 3, 3, 'ERE', 'TEDS', 5, 1),
(5, 3, 3, 'Toma doble Egle', 'TEDS', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion_producto`
--

DROP TABLE IF EXISTS `recepcion_producto`;
CREATE TABLE `recepcion_producto` (
  `ID_RECEPCION` int(11) NOT NULL,
  `FECHA_RECEPCION` datetime NOT NULL,
  `ESTADO_RECEPCION` int(11) DEFAULT 1,
  `OBSERVACIONES` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recepcion_producto`
--

INSERT INTO `recepcion_producto` (`ID_RECEPCION`, `FECHA_RECEPCION`, `ESTADO_RECEPCION`, `OBSERVACIONES`) VALUES
(1, '2022-11-21 00:00:00', 1, '-'),
(2, '2022-11-21 00:00:00', 1, '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion_producto_deta`
--

DROP TABLE IF EXISTS `recepcion_producto_deta`;
CREATE TABLE `recepcion_producto_deta` (
  `ID_RECEPCION` int(11) NOT NULL,
  `ID_RECEPCION_DETA` int(11) NOT NULL,
  `CANTIDAD_RECEPCION` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recepcion_producto_deta`
--

INSERT INTO `recepcion_producto_deta` (`ID_RECEPCION`, `ID_RECEPCION_DETA`, `CANTIDAD_RECEPCION`, `ID_PRODUCTO`) VALUES
(1, 1, 1, 3),
(2, 2, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_productos`
--

DROP TABLE IF EXISTS `salida_productos`;
CREATE TABLE `salida_productos` (
  `ID_SALIDA` int(11) NOT NULL,
  `FECHA_SALIDA` datetime NOT NULL,
  `ESTADO_SALIDA` int(11) NOT NULL DEFAULT 1,
  `OBSERVACIONES` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salida_productos`
--

INSERT INTO `salida_productos` (`ID_SALIDA`, `FECHA_SALIDA`, `ESTADO_SALIDA`, `OBSERVACIONES`) VALUES
(1, '2022-11-24 08:02:10', 1, '-'),
(2, '2022-11-24 08:03:59', 1, '-'),
(3, '2022-11-24 08:06:08', 1, '-'),
(4, '2022-11-24 08:07:13', 1, '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_producto_deta`
--

DROP TABLE IF EXISTS `salida_producto_deta`;
CREATE TABLE `salida_producto_deta` (
  `ID_SALIDA` int(11) NOT NULL,
  `ID_SALIDA_DETA` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD_SALIDA` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salida_producto_deta`
--

INSERT INTO `salida_producto_deta` (`ID_SALIDA`, `ID_SALIDA_DETA`, `ID_PRODUCTO`, `CANTIDAD_SALIDA`) VALUES
(1, 0, 5, '1.00'),
(2, 0, 1, '5.00'),
(3, 0, 1, '5.00'),
(4, 0, 1, '5.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(150) NOT NULL,
  `LOGIN_USUARIO` varchar(45) NOT NULL,
  `CLAVE` varchar(32) NOT NULL,
  `ESTADO_USUARIO` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `NOMBRE_USUARIO`, `LOGIN_USUARIO`, `CLAVE`, `ESTADO_USUARIO`) VALUES
(1, 'admin', 'admin', '123', '1');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_entrega`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `view_entrega`;
CREATE TABLE `view_entrega` (
`ID_SALIDA` int(11)
,`FECHA_SALIDA` datetime
,`ESTADO_SALIDA` int(11)
,`ID_PRODUCTO` int(11)
,`NOMBRE_PRODUCTO` varchar(100)
,`CANTIDAD_SALIDA` decimal(10,2)
,`NOMBRE_CATEGORIA` varchar(100)
,`NOMBRE_MARCA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_recepcion`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `view_recepcion`;
CREATE TABLE `view_recepcion` (
`ID_RECEPCION` int(11)
,`FECHA_RECEPCION` datetime
,`ESTADO_RECEPCION` int(11)
,`ID_PRODUCTO` int(11)
,`NOMBRE_PRODUCTO` varchar(100)
,`CANTIDAD_RECEPCION` int(11)
,`NOMBRE_CATEGORIA` varchar(100)
,`NOMBRE_MARCA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_categoria`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_categoria`;
CREATE TABLE `v_categoria` (
`IDCATEGORIA` int(11)
,`NOMBRECATEGORIA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_inventario_bitacora`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_inventario_bitacora`;
CREATE TABLE `v_inventario_bitacora` (
`IDBITACORA` int(11)
,`FECHABITACORA` date
,`CLASEMOVIMIENTO` varchar(3)
,`LLAVEMOVIMIENTO` varchar(250)
,`REFERENCIAMOVIMIENTO` varchar(250)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_marca`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_marca`;
CREATE TABLE `v_marca` (
`IDMARCA` int(11)
,`NOMBREMARCA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_producto`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_producto`;
CREATE TABLE `v_producto` (
`IDPRODUCTO` int(11)
,`NOMBREPRODUCTO` varchar(100)
,`DESCRIPCION` varchar(150)
,`EXISTENCIA` int(11)
,`ESTADOPRODUCTO` int(11)
,`NOMBREESTADOPRODUCTO` varchar(8)
,`IDCATEGORIA` int(11)
,`NOMBRECATEGORIA` varchar(100)
,`IDMARCA` int(11)
,`NOMBREMARCA` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_recepcion_producto`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_recepcion_producto`;
CREATE TABLE `v_recepcion_producto` (
`IDRECEPCION` int(11)
,`FECHARECEPCION` datetime
,`ESTADORECEPCION` int(11)
,`NOMBREESTADORECEPCION` varchar(8)
,`OBSERVACIONES` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_recepcion_producto_deta`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_recepcion_producto_deta`;
CREATE TABLE `v_recepcion_producto_deta` (
`IDRECEPCION` int(11)
,`IDRECEPCIONDETA` int(11)
,`IDPRODUCTO` int(11)
,`NOMBREPRODUCTO` varchar(100)
,`CANTIDADRECEPCION` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salida_producto`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_salida_producto`;
CREATE TABLE `v_salida_producto` (
`IDSALIDA` int(11)
,`FECHASALIDA` datetime
,`ESTADOSALIDA` int(11)
,`NOMBREESTADOSALIDA` varchar(8)
,`OBSERVACIONES` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salida_producto_deta`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_salida_producto_deta`;
CREATE TABLE `v_salida_producto_deta` (
`IDSALIDA` int(11)
,`IDSALIDADETA` int(11)
,`IDPRODUCTO` int(11)
,`NOMBREPRODUCTO` varchar(100)
,`CANTIDADSALIDA` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_usuarios`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_usuarios`;
CREATE TABLE `v_usuarios` (
`IDUSUARIO` int(11)
,`NOMBREUSUARIO` varchar(150)
,`LOGINUSUARIO` varchar(45)
,`ESTADOUSUARIO` varchar(5)
,`NOMBREESTADOUSUARIO` varchar(8)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_entrega`
--
DROP TABLE IF EXISTS `view_entrega`;

DROP VIEW IF EXISTS `view_entrega`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_entrega`  AS SELECT `s`.`ID_SALIDA` AS `ID_SALIDA`, `s`.`FECHA_SALIDA` AS `FECHA_SALIDA`, `s`.`ESTADO_SALIDA` AS `ESTADO_SALIDA`, `ds`.`ID_PRODUCTO` AS `ID_PRODUCTO`, `p`.`NOMBRE_PRODUCTO` AS `NOMBRE_PRODUCTO`, `ds`.`CANTIDAD_SALIDA` AS `CANTIDAD_SALIDA`, `c`.`NOMBRE_CATEGORIA` AS `NOMBRE_CATEGORIA`, `m`.`NOMBRE_MARCA` AS `NOMBRE_MARCA` FROM ((((`salida_producto_deta` `ds` join `salida_productos` `s` on(`ds`.`ID_SALIDA` = `s`.`ID_SALIDA`)) join `producto` `p` on(`ds`.`ID_PRODUCTO` = `p`.`ID_PRODUCTO`)) join `categoria` `c` on(`p`.`ID_CATEGORIA` = `c`.`ID_CATEGORIA`)) join `marca` `m` on(`p`.`ID_MARCA` = `m`.`ID_MARCA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_recepcion`
--
DROP TABLE IF EXISTS `view_recepcion`;

DROP VIEW IF EXISTS `view_recepcion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_recepcion`  AS SELECT `r`.`ID_RECEPCION` AS `ID_RECEPCION`, `r`.`FECHA_RECEPCION` AS `FECHA_RECEPCION`, `r`.`ESTADO_RECEPCION` AS `ESTADO_RECEPCION`, `dt`.`ID_PRODUCTO` AS `ID_PRODUCTO`, `p`.`NOMBRE_PRODUCTO` AS `NOMBRE_PRODUCTO`, `dt`.`CANTIDAD_RECEPCION` AS `CANTIDAD_RECEPCION`, `c`.`NOMBRE_CATEGORIA` AS `NOMBRE_CATEGORIA`, `m`.`NOMBRE_MARCA` AS `NOMBRE_MARCA` FROM ((((`recepcion_producto_deta` `dt` join `recepcion_producto` `r` on(`dt`.`ID_RECEPCION` = `r`.`ID_RECEPCION`)) join `producto` `p` on(`dt`.`ID_PRODUCTO` = `p`.`ID_PRODUCTO`)) join `marca` `m` on(`p`.`ID_MARCA` = `m`.`ID_MARCA`)) join `categoria` `c` on(`p`.`ID_CATEGORIA` = `c`.`ID_CATEGORIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_categoria`
--
DROP TABLE IF EXISTS `v_categoria`;

DROP VIEW IF EXISTS `v_categoria`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_categoria`  AS SELECT `a`.`ID_CATEGORIA` AS `IDCATEGORIA`, `a`.`NOMBRE_CATEGORIA` AS `NOMBRECATEGORIA` FROM `categoria` AS `a``a`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inventario_bitacora`
--
DROP TABLE IF EXISTS `v_inventario_bitacora`;

DROP VIEW IF EXISTS `v_inventario_bitacora`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventario_bitacora`  AS SELECT `a`.`ID_BITACORA` AS `IDBITACORA`, `a`.`FECHA_BITACORA` AS `FECHABITACORA`, `a`.`CLASE_MOVIMIENTO` AS `CLASEMOVIMIENTO`, `a`.`LLAVE_MOVIMIENTO` AS `LLAVEMOVIMIENTO`, `a`.`REFERENCIA_MOVIMIENTO` AS `REFERENCIAMOVIMIENTO` FROM `inventario_bitcora` AS `a``a`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_marca`
--
DROP TABLE IF EXISTS `v_marca`;

DROP VIEW IF EXISTS `v_marca`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_marca`  AS SELECT `a`.`ID_MARCA` AS `IDMARCA`, `a`.`NOMBRE_MARCA` AS `NOMBREMARCA` FROM `marca` AS `a``a`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_producto`
--
DROP TABLE IF EXISTS `v_producto`;

DROP VIEW IF EXISTS `v_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_producto`  AS SELECT `a`.`ID_PRODUCTO` AS `IDPRODUCTO`, `a`.`NOMBRE_PRODUCTO` AS `NOMBREPRODUCTO`, `a`.`DESCRIPCION` AS `DESCRIPCION`, `a`.`EXISTENCIA` AS `EXISTENCIA`, `a`.`ESTADO_PRODUCTO` AS `ESTADOPRODUCTO`, CASE WHEN `a`.`ESTADO_PRODUCTO` = 'AC' THEN 'Activo' WHEN `a`.`ESTADO_PRODUCTO` = 'IN' THEN 'Inactivo' ELSE '' END AS `NOMBREESTADOPRODUCTO`, `a`.`ID_CATEGORIA` AS `IDCATEGORIA`, `c`.`NOMBRE_CATEGORIA` AS `NOMBRECATEGORIA`, `a`.`ID_MARCA` AS `IDMARCA`, `b`.`NOMBRE_MARCA` AS `NOMBREMARCA` FROM ((`producto` `a` join `marca` `b` on(`a`.`ID_MARCA` = `b`.`ID_MARCA`)) join `categoria` `c` on(`a`.`ID_CATEGORIA` = `c`.`ID_CATEGORIA`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_recepcion_producto`
--
DROP TABLE IF EXISTS `v_recepcion_producto`;

DROP VIEW IF EXISTS `v_recepcion_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_recepcion_producto`  AS SELECT `a`.`ID_RECEPCION` AS `IDRECEPCION`, `a`.`FECHA_RECEPCION` AS `FECHARECEPCION`, `a`.`ESTADO_RECEPCION` AS `ESTADORECEPCION`, CASE WHEN `a`.`ESTADO_RECEPCION` = 'DI' THEN 'DIGITADO' WHEN `a`.`ESTADO_RECEPCION` = 'AP' THEN 'APLICADO' ELSE '' END AS `NOMBREESTADORECEPCION`, `a`.`OBSERVACIONES` AS `OBSERVACIONES` FROM `recepcion_producto` AS `a``a`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_recepcion_producto_deta`
--
DROP TABLE IF EXISTS `v_recepcion_producto_deta`;

DROP VIEW IF EXISTS `v_recepcion_producto_deta`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_recepcion_producto_deta`  AS SELECT `a`.`ID_RECEPCION` AS `IDRECEPCION`, `a`.`ID_RECEPCION_DETA` AS `IDRECEPCIONDETA`, `a`.`ID_PRODUCTO` AS `IDPRODUCTO`, `b`.`NOMBRE_PRODUCTO` AS `NOMBREPRODUCTO`, `a`.`CANTIDAD_RECEPCION` AS `CANTIDADRECEPCION` FROM (`recepcion_producto_deta` `a` join `producto` `b` on(`a`.`ID_PRODUCTO` = `b`.`ID_PRODUCTO`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salida_producto`
--
DROP TABLE IF EXISTS `v_salida_producto`;

DROP VIEW IF EXISTS `v_salida_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salida_producto`  AS SELECT `a`.`ID_SALIDA` AS `IDSALIDA`, `a`.`FECHA_SALIDA` AS `FECHASALIDA`, `a`.`ESTADO_SALIDA` AS `ESTADOSALIDA`, CASE WHEN `a`.`ESTADO_SALIDA` = 'DI' THEN 'DIGITADO' WHEN `a`.`ESTADO_SALIDA` = 'AP' THEN 'APLICADO' ELSE '' END AS `NOMBREESTADOSALIDA`, `a`.`OBSERVACIONES` AS `OBSERVACIONES` FROM `salida_productos` AS `a``a`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salida_producto_deta`
--
DROP TABLE IF EXISTS `v_salida_producto_deta`;

DROP VIEW IF EXISTS `v_salida_producto_deta`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salida_producto_deta`  AS SELECT `a`.`ID_SALIDA` AS `IDSALIDA`, `a`.`ID_SALIDA_DETA` AS `IDSALIDADETA`, `a`.`ID_PRODUCTO` AS `IDPRODUCTO`, `b`.`NOMBRE_PRODUCTO` AS `NOMBREPRODUCTO`, `a`.`CANTIDAD_SALIDA` AS `CANTIDADSALIDA` FROM (`salida_producto_deta` `a` join `producto` `b` on(`a`.`ID_PRODUCTO` = `b`.`ID_PRODUCTO`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_usuarios`
--
DROP TABLE IF EXISTS `v_usuarios`;

DROP VIEW IF EXISTS `v_usuarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuarios`  AS SELECT `a`.`ID_USUARIO` AS `IDUSUARIO`, `a`.`NOMBRE_USUARIO` AS `NOMBREUSUARIO`, `a`.`LOGIN_USUARIO` AS `LOGINUSUARIO`, `a`.`ESTADO_USUARIO` AS `ESTADOUSUARIO`, CASE WHEN `a`.`ESTADO_USUARIO` = 'AC' THEN 'Activo' WHEN `a`.`ESTADO_USUARIO` = 'IN' THEN 'Inactivo' ELSE '' END AS `NOMBREESTADOUSUARIO` FROM `usuarios` AS `a``a`  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `inventario_bitcora`
--
ALTER TABLE `inventario_bitcora`
  ADD PRIMARY KEY (`ID_BITACORA`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID_MARCA`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`,`ID_CATEGORIA`,`ID_MARCA`),
  ADD KEY `fk_PRODUCTOS_CATEGORIAS_idx` (`ID_CATEGORIA`),
  ADD KEY `fk_PRODUCTO_MARCA1_idx` (`ID_MARCA`);

--
-- Indices de la tabla `recepcion_producto`
--
ALTER TABLE `recepcion_producto`
  ADD PRIMARY KEY (`ID_RECEPCION`);

--
-- Indices de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  ADD PRIMARY KEY (`ID_SALIDA`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `recepcion_producto`
--
ALTER TABLE `recepcion_producto`
  MODIFY `ID_RECEPCION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  MODIFY `ID_SALIDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_PRODUCTOS_CATEGORIAS` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PRODUCTO_MARCA1` FOREIGN KEY (`ID_MARCA`) REFERENCES `marca` (`ID_MARCA`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
