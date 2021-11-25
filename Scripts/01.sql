/*Realizar los SP para dar de alta todas las entidades recibiendo los parámetros necesarios*/
DELIMITER $$
CREATE PROCEDURE altaCliente ( IN unNombre varchar(45), IN unApellido varchar(45), IN unTelefono int, IN unEmail varchar(45), IN unNUsuario varchar(45), IN unaContrasena char(64), IN unIdCliente int)
BEGIN
	INSERT INTO Cliente (Nombre, Apellido, Telefono, Email, NUsuario, Contrasena, idCLiente)
		 VALUES (unNombre, unApellido, unTelefono, unEmail, unNUsuario, unaContrasena, unIdCliente);
END$$
 
DELIMITER $$
CREATE PROCEDURE altaProducto (IN unPrecio decimal(7.2), IN unaCantidad smallint unsigned, IN unNombre varchar(45), IN unIdCliente int, IN unaFecha date, IN unIdProducto int)
BEGIN
	INSERT INTO Producto (Precio, Cantidad, Nombre, idCliente, Fecha, idProducto)
		 VALUES (unPrecio, unaCantidad, unNombre, unIdCliente, unaFecha, unIdProducto);
END$$

DELIMITER $$
CREATE PROCEDURE altaCompra (IN unIdCliente int, IN unIdProducto int, IN unaFechaHora datetime, IN unaCUnidades smallint unsigned, IN unPrecioDeCompra decimal(7.2) )
BEGIN
	INSERT INTO Compra (idCliente, idProducto, FechaHora, CUnidades, PrecioDeCompra)
		 VALUES (unIdCliente, unIdProducto, unaFechaHora, unaCUnidades, unPrecioDeCompra);
END$$

/*Realizar el SF ‘recaudacionPara’ que reciba por parámetros el identificador de un producto y 2 fechas, la función tiene que devolver la sumatoria de las ventas de ese producto entre esas 2 fechas (inclusive)*/
DELIMITER $$
CREATE FUNCTION recaudacionPara (unIdProducto int, unaFechaDeInicio date, unaFechaDeFin date)
								 RETURNS INT
BEGIN
	DECLARE resultado int;
    SELECT SUM(CUnidades * PrecioDeCompra) INTO resultado
	FROM Compra
	WHERE idProducto = unIdProducto
    AND PrecioDeCompra BETWEEN unaFechaDeInicio AND unaFechaDeFin;
	RETURN resultado;
END$$

/*Se pide hacer el SP ‘BuscarProducto’ que reciba por parámetro una cadena. El SP tiene que devolver los productos que contengan la cadena en su nombre*/
DELIMITER $$
CREATE PROCEDURE BuscarProducto (unNombre varchar(45))
BEGIN
	SELECT * 
    FROM Producto 
    WHERE MATCH(Nombre) AGAINST(unNombre);
END$$

/*Realizar el SP ‘VentasDe’ que reciba como parámetro un idUsuario, el SP tiene que devolver todas las columnas de la tabla Compra que pertenezcan al usuario ordenadas por fecha de mayor a menor.*/
DELIMITER $$
CREATE PROCEDURE VentasDe (IN unIdVendedor int)
BEGIN
	SELECT *
    FROM Producto
    JOIN Compra USING (idProducto)
    WHERE Producto.idCliente  = unIdCliente
    ORDER BY Fecha DESC;
END$$

/*Realizar el SP ‘ComprasDe’ que reciba como parámetro un idUsuario, el SP tiene que devolver todas las columnas de la tabla Compra que pertenezcan al usuario ordenadas por fecha de mayor a menor.*/
DELIMITER $$
CREATE PROCEDURE ComprasDe (IN unIdCliente int)
BEGIN
	SELECT *
    FROM Compra
    WHERE idCliente = unIdCliente
    ORDER BY Fecha DESC;
END$$    
	
