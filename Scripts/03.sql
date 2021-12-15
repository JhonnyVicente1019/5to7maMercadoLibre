/*Administrador: puede ver todo desde cualquier lado.*/
DROP USER IF EXISTS 'Administrador'@'%';
CREATE USER 'Administrador'@'%' IDENTIFIED BY 'passAdministrador';
GRANT SELECT ON MercadoLibre.* TO 'Administrador'@'%';

/*SistemaUsuario: desde la red 10.3.45.xxx puede: 
-Dar de alta Usuarios y modificar solo su contraseña. 
-Ver y dar de alta productos, solo modificar su precio y cantidad.*/
DROP USER IF EXISTS 'SistemaUsuario'@'10.3.45.xxx';
CREATE USER 'SistemaUsuario'@'10.3.45.xxx' IDENTIFIED BY 'passSistemaUsuario';
GRANT SELECT, UPDATE(Contrasena) ON MercadoLibre.Cliente TO 'SistemaUsuario'@'10.3.45.xxx'; 
GRANT INSERT, SELECT, UPDATE(Precio, Cantidad) ON MercadoLibre.Producto TO 'SistemaUsuario'@'10.3.45.xxx';

/*Usuario:  desde cualquier lado puede
Ver todo lo de la tabla usuario.
Ver todo respecto de los productos.
Ver todo respecto de las compras.*/
/*DROP USER IF EXISTS 'Usuario'@'%';*/
CREATE USER 'Usuario'@'%' IDENTIFIED BY 'passUsuario';
GRANT SELECT ON MercadoLibre.Cliente TO 'Usuario'@'%';
GRANT SELECT ON MercadoLibre.Producto TO 'Usuario'@'%';
GRANT SELECT ON MercadoLibre.Compra TO 'Usuario'@'%';