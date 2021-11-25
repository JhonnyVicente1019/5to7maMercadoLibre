DROP DATABASE IF EXISTS MercadoLibre;
CREATE DATABASE MercadoLibre;
USE MercadoLibre;

CREATE TABLE Cliente (
             Nombre varchar(45) NOT NULL, 
             Apellido varchar(45) NOT NULL,
             Telefono int unsigned NOT NULL,
             Email varchar(45) NOT NULL,
             NUsuario varchar(45) NOT NULL,
             Contrasena char(64) NOT NULL,
             idCliente int NOT NULL,
             PRIMARY KEY(idCliente));

CREATE TABLE Producto (
             Precio decimal(62) NOT NULL,
             Cantidad smallint unsigned NOT NULL,
             Nombre varchar(45) NOT NULL,
             idCliente int NOT NULL,
             Fecha date NOT NULL,
             idProducto int NOT NULL,
             PRIMARY KEY(idProducto),
             fulltext ft_producto_nombre(Nombre));
             			
CREATE TABLE Compra   (
			 idCliente int NOT NULL,
             idProducto int NOT NULL,
             FechaHora datetime NOT NULL,
             CUnidades smallint unsigned NOT NULL,
             PrecioDeCompra decimal(62) NOT NULL,
             PRIMARY KEY(idCliente, idProducto, FechaHora));
             

SET FOREIGN_KEY_CHECKS=1;
ALTER TABLE Producto ADD CONSTRAINT FK_Producto_Cliente
	FOREIGN KEY (`idCliente`) REFERENCES Cliente (`idCliente`);
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_Cliente 
	FOREIGN KEY (`idCliente`) REFERENCES Cliente (`idCliente`);
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_Producto 
	FOREIGN KEY (`idProducto`) REFERENCES Producto (`idProducto`);