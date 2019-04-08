CREATE DATABASE `dbpixelgameshop` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE `articulo` (
  `idArticulo` varchar(50) NOT NULL,
  `idUsuario` varchar(50) NOT NULL,
  `ANombre` varchar(50) NOT NULL,
  `AValoracion` float NOT NULL,
  `APrecio` float NOT NULL,
  `AImagenA` blob,
  `AImagenB` blob,
  `AImagenC` blob,
  `AVideo` blob,
  `AEstado` varchar(50) DEFAULT NULL,
  `AExistencia` varchar(50) NOT NULL,
  `ACantidad` float NOT NULL,
  `AFechaPub` date NOT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `idUsuario_idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idArtUsuario_idUsUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `carrito` (
  `idCarrito` varchar(50) NOT NULL,
  `idUsuario` varchar(50) NOT NULL,
  `idArticulo` varchar(50) NOT NULL,
  `CCantidadArt` int(11) DEFAULT NULL,
  `CSesion` int(11) DEFAULT NULL,
  `CEstado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idCarrito`),
  KEY `FKCRArticulo_idArticulo_idx` (`idArticulo`),
  KEY `FKCRUsuario_idUsuario_idx` (`idUsuario`),
  CONSTRAINT `FKCRArticulo_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKCRUsuario_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `categoria` (
  `idCategoria` varchar(50) NOT NULL,
  `CNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `categoria_articulo` (
  `idCat_Art` varchar(50) NOT NULL,
  `idCategoria` varchar(50) NOT NULL,
  `idArticulo` varchar(50) NOT NULL,
  PRIMARY KEY (`idCat_Art`),
  KEY `FKCategoria_idCategoria_idx` (`idCategoria`),
  KEY `FKArticulo_idArticulo_idx` (`idArticulo`),
  CONSTRAINT `FKCAArticulo_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKCACategoria_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `chat` (
  `idChat` varchar(50) NOT NULL,
  `idUsuarioA` varchar(50) NOT NULL,
  `idUsuarioB` varchar(50) NOT NULL,
  `idProducto` varchar(50) NOT NULL,
  `CCotizado` float NOT NULL,
  `CEstado` varchar(5) NOT NULL,
  PRIMARY KEY (`idChat`),
  KEY `FKUsurioAB_idUsuario_idx` (`idUsuarioA`),
  KEY `FKProducto_idProducto_idx` (`idProducto`),
  KEY `FKUsurioB_idUsuario_idx` (`idUsuarioB`),
  CONSTRAINT `FKProducto_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKUsurioA_idUsuario` FOREIGN KEY (`idUsuarioA`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKUsurioB_idUsuario` FOREIGN KEY (`idUsuarioB`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `compra` (
  `idCompra` varchar(50) NOT NULL,
  `id_Articulo` varchar(50) NOT NULL,
  `id_Usuario` varchar(50) NOT NULL,
  `CFecha` date NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `FKCArticulo_idArticulo_idx` (`id_Articulo`),
  KEY `FKCUsuario_idUsuario_idx` (`id_Usuario`),
  CONSTRAINT `FKCArticulo_idArticulo` FOREIGN KEY (`id_Articulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKCUsuario_idUsuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `mensaje` (
  `idMensaje` varchar(50) NOT NULL,
  `MMensaje` varchar(50) NOT NULL,
  `idUsuario` varchar(50) NOT NULL,
  `idChat` varchar(50) NOT NULL,
  PRIMARY KEY (`idMensaje`),
  KEY `idUsuario_idUsuario_idx` (`idUsuario`),
  KEY `FKChat_idChat_idx` (`idChat`),
  CONSTRAINT `FKChat_idChat` FOREIGN KEY (`idChat`) REFERENCES `chat` (`idChat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `metodo_pago` (
  `idMet_pag` varchar(50) NOT NULL,
  `MNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idMet_pag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `metpago_articulo` (
  `idMetPago_Articulo` varchar(50) NOT NULL,
  `idMetPago` varchar(50) NOT NULL,
  `idArticulo` varchar(50) NOT NULL,
  PRIMARY KEY (`idMetPago_Articulo`),
  KEY `FKMetPago_idMetPago_idx` (`idMetPago`),
  KEY `FKArticulo_idArticulo_idx` (`idArticulo`),
  CONSTRAINT `FKArticulo_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKMetPago_idMetPago` FOREIGN KEY (`idMetPago`) REFERENCES `metodo_pago` (`idMet_pag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `idUsuario` varchar(50) NOT NULL,
  `UNombre` varchar(50) NOT NULL,
  `UApellido` varchar(50) NOT NULL,
  `UEmail` varchar(50) NOT NULL,
  `UTelefono` varchar(20) DEFAULT NULL,
  `UDireccion` varchar(50) DEFAULT NULL,
  `UUsuario` varchar(50) NOT NULL,
  `UContra` varchar(50) NOT NULL,
  `UAvatar` blob,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `valoracion` (
  `idValoracion` varchar(50) NOT NULL,
  `idUsuario` varchar(45) NOT NULL,
  `idArticulo` varchar(45) NOT NULL,
  `VValoracion` int(11) NOT NULL,
  `VFecha` date NOT NULL,
  PRIMARY KEY (`idValoracion`),
  KEY `FKVArticulo_idArticulo_idx` (`idArticulo`),
  KEY `FKVUsuario_idUsuario_idx` (`idUsuario`),
  CONSTRAINT `FKVArticulo_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKVUsuario_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

