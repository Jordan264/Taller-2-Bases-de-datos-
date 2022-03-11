CREATE TABLE Administrador (
    Id_admin int PRIMARY KEY NOT NULL,
	Nombre varchar(100)
);

CREATE TABLE Carrito (
	Id_carrito int primary key not null
);

CREATE TABLE Producto (
    Id_producto int primary key NOT NULL,
    Nombre varchar(100),
    Categoria varchar(20),
    Marca varchar(30),
    Stock int,
    Descripcion varchar(200),
    Precios varchar(100),
	Id_carrito int,
	FOREIGN KEY(Id_carrito)
	REFERENCES Carrito(Id_carrito)
);

CREATE TABLE Tarjeta (
    Id_tarjeta int primary key NOT NULL,
    Tipo_tarjeta varchar(100),
    Numero_tarjeta  varchar(100) NOT NULL,
    Fecha_ex date NOT NULL,
    Cvc varchar(10) NOT NULL
);


CREATE TABLE Vendedor (
    Id_vendedor int primary key NOT NULL,
    Nombre varchar(100),
    Calificacion varchar(20),
	Id_admin int,
    Id_producto int,
	FOREIGN KEY(Id_admin) 
	REFERENCES Administrador(Id_admin),
	FOREIGn KEY (Id_producto)
	REFERENCES Producto(Id_producto)
);

CREATE TABLE Comprador (
    Id_comprador int primary key NOT NULL,
    Nombre varchar(100),
    Tipo_identificacion varchar(50),
    Num_identificacion  varchar(100),
    Nombre_Usuario varchar(100),   
    Contraseña varchar(50),
    Correo varchar(100),
    Ciudad varchar(60),
    Direccion varchar(150),
	Id_vendedor int,
	FOREIGN KEY(Id_vendedor) 
	REFERENCES Vendedor(Id_vendedor)
);

CREATE TABLE Envio (
    Id_envio int primary key NOT NULL,
    Estado varchar(50) NOT NULL,
    Guia varchar(70) NOT NULL
);

CREATE TABLE Compra (
    Id_compra int primary key NOT NULL,
    Estado_de_pago varchar(20),
	Estado_compra varchar(20),
    Id_comprador int,
    Id_producto int,
	Id_envio int,
	FOREIGN KEY(Id_producto) 
	REFERENCES Producto(Id_producto),
	FOREIGN KEY( Id_comprador) 
	REFERENCES Comprador(Id_comprador),
	FOREIGN KEY(Id_envio) 
	REFERENCES Envio(Id_envio)
);

CREATE TABLE Cuentadepago (
    Id_cuenta_pago int primary key NOT NULL,
    Dinero_en_cuenta numeric NOT NULL,
    Id_tarjeta int,
    Id_comprador int,
    FOREIGN KEY(Id_tarjeta)
    REFERENCES Tarjeta(Id_tarjeta),
    FOREIGN KEY(Id_comprador) 
    REFERENCES Comprador(Id_comprador)
);

CREATE TABLE Vende (
    Id_vendedor int,
    Id_producto int,
    FOREIGN KEY(Id_vendedor)
    REFERENCES Vendedor(Id_vendedor),
    FOREIGN KEY(Id_producto) 
    REFERENCES Producto(Id_producto)
);

--Tabla Administrador registro
INSERT INTO Administrador(Id_admin,Nombre)
VALUES('1', 'Juan Andres Parra Martinez');
INSERT INTO Administrador(Id_admin,Nombre)
VALUES('2', 'David Camilo Gomez Paez');
INSERT INTO Administrador(Id_admin,Nombre)
VALUES('3', 'Maria Paula Rodriguez Avila');
INSERT INTO Administrador(Id_admin,Nombre)
VALUES('4', 'Andrea Catalina Acero Caro');
INSERT INTO Administrador(Id_admin,Nombre)
VALUES('5', 'Gabriel Felipe Herrera Moreno');


--Tablas Carrito y Producto registro

INSERT INTO Carrito(Id_carrito)
VALUES('2');
INSERT INTO Producto(Id_producto,Nombre, Categoria, Marca, Stock, Descripcion, Precios, Id_carrito)
VALUES('2', 'Twister', 'Jugueteria', 'Hasbro', '100', 'Twister el Juego de equilibrio y agilidad. Ideal para jugar en casa o al aire libre. 2 o más jugadores.', '79.000', '2');
--
INSERT INTO Carrito(Id_carrito)
VALUES('3');
--
INSERT INTO Carrito(Id_carrito)
VALUES('4');
INSERT INTO Producto(Id_producto,Nombre, Categoria, Marca, Stock, Descripcion, Precios, Id_carrito)
VALUES('4', 'Comedor 6 sillas', 'Hogar', 'M+DESIGN', '45', 'Comedor 6 sillas140x80x75 vidrio 2.0 M+Design.', '999.990', '4');
--
INSERT INTO Carrito(Id_carrito)
VALUES('5');
INSERT INTO Producto(Id_producto,Nombre, Categoria, Marca, Stock, Descripcion, Precios, Id_carrito)
VALUES('5', 'Gimnasio para gatos castelli', 'Mascotas', 'MECANO', '19', 'Definido por sus líneas geométricas castelli es el gimnasio de pared que necesitan tus felinos para divertirse en el hogar.', '522.279', '5');


--Tabla Tarjeta registro
INSERT INTO Tarjeta(Id_tarjeta,Tipo_tarjeta,Numero_tarjeta,Fecha_ex,Cvc)
VALUES('1', 'Visa', '4070217404190065', '01/11/2026', '333');
INSERT INTO Tarjeta(Id_tarjeta,Tipo_tarjeta,Numero_tarjeta,Fecha_ex,Cvc)
VALUES('2', 'Mastercard', '5444082332361618', '01/03/2023', '415');
INSERT INTO Tarjeta(Id_tarjeta,Tipo_tarjeta,Numero_tarjeta,Fecha_ex,Cvc)
VALUES('3', 'American Express', '373844238831655', '01/03/2025', '726');
INSERT INTO Tarjeta(Id_tarjeta,Tipo_tarjeta,Numero_tarjeta,Fecha_ex,Cvc)
VALUES('4', 'Mastercard', '5350581962323592', '01/08/2023', '995');
INSERT INTO Tarjeta(Id_tarjeta,Tipo_tarjeta,Numero_tarjeta,Fecha_ex,Cvc)
VALUES('5','Visa', '4951000372574575', '01/12/2025', '135');


--Tabla Vendedor registro
INSERT INTO Vendedor(Id_vendedor,Nombre,Calificacion,Id_admin,Id_producto)
VALUES('1', 'Maximiliano Barreiro', '4.5', '1', '4');
INSERT INTO Vendedor(Id_vendedor,Nombre,Calificacion,Id_admin,Id_producto)
VALUES('2', 'Luis Pelayo Olivera Arnau', '3.0', '4', '1');
INSERT INTO Vendedor(Id_vendedor,Nombre,Calificacion,Id_admin,Id_producto)
VALUES('3', 'Beatriz Palacio Falco', '4.8', '2', '3');
INSERT INTO Vendedor(Id_vendedor,Nombre,Calificacion,Id_admin,Id_producto)
VALUES('4', 'Andres Frias Mariscal', '4.2', '3', '2');
INSERT INTO Vendedor(Id_vendedor,Nombre,Calificacion,Id_admin,Id_producto)
VALUES('5','Victor Manuel Perez Rocha', '3.4', '1', '5');


--Tabla Comprador registro
INSERT INTO Comprador(Id_comprador, Nombre, Tipo_identificacion, Num_identificacion, Nombre_Usuario, Contraseña, Correo, Ciudad, Direccion, Id_vendedor)
VALUES('1', 'Bruno Benavente Carranza', 'cedula de ciudadania', '1235846972', 'brbca', '123456', 'brunobcarranza@gmail.com', 'Bogota', 'CALLE 12A#45-21 SUR', '1');
INSERT INTO Comprador(Id_comprador, Nombre, Tipo_identificacion, Num_identificacion, Nombre_Usuario, Contraseña, Correo, Ciudad, Direccion, Id_vendedor)
VALUES('2', 'Marianela Morillo Ibáñez', 'cedula de ciudadania', '80649276', 'marmori', 'abcde', 'marimoriba@gmail.com', 'Bogota', 'CARRERA 67B#31-39  APARTAMENTO 501', '2');
INSERT INTO Comprador(Id_comprador, Nombre, Tipo_identificacion, Num_identificacion, Nombre_Usuario, Contraseña, Correo, Ciudad, Direccion, Id_vendedor)
VALUES('3', 'Cesar Angel Marquez', 'cedula de ciudadania','974554179', 'cesarAM', '12134abcd', 'angelmarquez@hotmail.com', 'Bogota', 'AVENIDA 68#23-45', '2');
INSERT INTO Comprador(Id_comprador, Nombre, Tipo_identificacion, Num_identificacion, Nombre_Usuario, Contraseña, Correo, Ciudad, Direccion, Id_vendedor)
VALUES('4', 'Eduardo Baquero Rodriguez', 'cedula de ciudadania', '31246879', 'BaquerEd', 'abcd123', 'baquero94@yahoo.com', 'Bogota', 'AVENIDA CARRERA 3A#13-25 SUR ', '3');
INSERT INTO Comprador(Id_comprador, Nombre, Tipo_identificacion, Num_identificacion, Nombre_Usuario, Contraseña, Correo, Ciudad, Direccion, Id_vendedor)
VALUES('5', 'Felicia Moran Macias', 'cedula de ciudadania', '1147969763', 'Feli', 'Feli123.', 'felimm@gmail.com', 'Bogota', 'CALLE 140#7F-20 APARTAMENTO 302', '5');


--Tabla Envio registro
INSERT INTO Envio(Id_envio, Estado, Guia)
VALUES('1', 'En transito', '5615241852');
INSERT INTO Envio(Id_envio, Estado, Guia)
VALUES('2', 'En reparto', '9523571886');
INSERT INTO Envio(Id_envio, Estado, Guia)
VALUES('3', 'Devolucion', '1268459732');

Select * from producto
where "precios" = '3.589.900'
INSERT INTO Envio(Id_envio, Estado, Guia)
VALUES('4', 'Entregado', '4587216932');
INSERT INTO Envio(Id_envio, Estado, Guia)
VALUES('5', 'En alistamiento', '1232158931');



--Tabla Compra registro
INSERT INTO Compra(Id_compra, Estado_de_pago, Estado_compra, Id_comprador, Id_producto, Id_envio)
VALUES('1', 'En proceso', 'Aprobada', '1', '1', '1');
INSERT INTO Compra(Id_compra, Estado_de_pago, Estado_compra, Id_comprador, Id_producto, Id_envio)
VALUES('2', 'Aprobado', 'Aprobada', '4', '3', '3');
INSERT INTO Compra(Id_compra, Estado_de_pago, Estado_compra, Id_comprador, Id_producto, Id_envio)
VALUES('3', 'No pago', 'En proceso', '3', '2', '2');
INSERT INTO Compra(Id_compra, Estado_de_pago, Estado_compra, Id_comprador, Id_producto, Id_envio)
VALUES('4', 'Aprobado', 'Aprobada', '5', '5', '4');
INSERT INTO Compra(Id_compra, Estado_de_pago, Estado_compra, Id_comprador, Id_producto, Id_envio)
VALUES('5', 'Aprobado', 'Aprobada', '2', '4', '5');


--Tabla Cuentadepago registro
INSERT INTO Cuentadepago(Id_cuenta_pago, Dinero_en_cuenta, Id_tarjeta, Id_comprador)
VALUES('1', '2569000', '1', '2');
INSERT INTO Cuentadepago(Id_cuenta_pago, Dinero_en_cuenta, Id_tarjeta, Id_comprador)
VALUES('2', '1580000', '2', '4');
INSERT INTO Cuentadepago(Id_cuenta_pago, Dinero_en_cuenta, Id_tarjeta, Id_comprador)
VALUES('3', '2890000', '4', '5');
INSERT INTO Cuentadepago(Id_cuenta_pago, Dinero_en_cuenta, Id_tarjeta, Id_comprador)
VALUES('4', '2900000', '5', '3');
INSERT INTO Cuentadepago(Id_cuenta_pago, Dinero_en_cuenta, Id_tarjeta, Id_comprador)
VALUES('5', '3200000', '3', '1');


--Tabla Vende registro
INSERT INTO Vende(Id_vendedor, Id_producto)
VALUES('1','2');
INSERT INTO Vende(Id_vendedor, Id_producto)
VALUES('2', '4');
INSERT INTO Vende(Id_vendedor, Id_producto)
VALUES('3','5');
INSERT INTO Vende(Id_vendedor, Id_producto)
VALUES('4','1');
INSERT INTO Vende(Id_vendedor, Id_producto)
VALUES('5','3');

CREATE INDEX preciosProducto ON producto("precios")

CREATE INDEX estadoPago ON compra("estado_de_pago")

CREATE INDEX carritoid ON producto("id_carrito")

Select * from producto
where "precios" = '3.589.900'

drop index preciosProducto

drop index estadoPago

drop index carritoid
 
 
 CREATE VIEW produc AS
SELECT

FROM producto p
JOIN public.vendedor sc
	ON p.Nombre = sc.Nombre
JOIN public.comprador c
	ON sc.Nombre = c.Nombre
WHERE
	p.Nombre IS NOT NULL
ORDER BY vendedor, comprador ASC;

select * from produc

drop view produc

select * from producto
	
CREATE VIEW des_product
 AS SELECT Id_producto, Nombre, Marca, Stock, Precios
 FROM public.producto
 WHERE Precios ='3.589.900';

drop view des_product
select * from des_product

--Aqui comienza el taller 2 
CREATE TABLE variante (
	Nombre varchar(100), 
	Stock int,
	Descripcion varchar(200),
	Id_producto int,
	FOREIGN KEY(Id_producto)
	REFERENCES producto(Id_producto)
);

--AUDITORIA DE VARIANTE

CREATE TABLE variante_audit (
	Nombre varchar(100),
	Stock int,
	Descripcion varchar(200),
	Id_producto int,
	FOREIGN KEY(Id_producto)
	REFERENCES producto(Id_producto)
);
CREATE OR REPLACE FUNCtiON trigger_variante_audit() RETURNS TRIGGER AS $$
BEGIN
		IF(TG_OP= 'INSERT' ) THEN
				INSERT INTO variante_audit
				VALUES (new.Nombre,new.Stock,new.Descripcion,new.Id_producto);
				RETURN NEW;
		ELSEIF (TG_OP= 'UPDATE' ) THEN
				INSERT INTO variante_audit
				VALUES (new.Nombre,new.Stock,new.Descripcion,new.Id_producto);
				RETURN NEW;
		ELSEIF (TG_OP= 'DELETE' ) THEN
				INSERT INTO variante_audit
				VALUES (old.Nombre,old.Stock,old.Descripcion,old.Id_producto);
				RETURN OLD;
				
		END IF;
		RETURN NULL;
		
END;
$$LANGUAGE plpgsql;

drop FUNcTION trigger_variante_audit;

CREATE TRIGGER trigger_variante_audit AFTER INSERT OR UPDATE OR DELETE ON variante
FOR EACH ROW EXECUTE PROCEDURE trigger_variante_audit();

INSERT INTO variante(Nombre,Stock, Descripcion,Id_producto)
VALUES('Jean Skinny Tiro Alto Mujer','50',
	   'Jean ajustado tiro alto, bolsillos delanteros y posteriores, cierre y botón metálico. Efecto lavado.','5');
	   
UPDATE variante SET 
Nombre = 'picaso',
Stock = '5000',
Descripcion = 'pieza de arte',
Id_producto = '5'
	WHERE Nombre ='Jean Skinny Tiro Alto Mujer';

DELETE FROM variante 
WHERE Nombre = 'picaso'

--
SELECT * FROM variante_audit;

DROP TABLE variante_audit;


--AUDITORIA PRODUCTO

CREATE TABLE producto_audit (
	Id_producto int,
    Nombre varchar(100),
    Categoria varchar(20),
    Marca varchar(30),
    Stock int,
    Descripcion varchar(200),
    Precios varchar(100),
	Id_carrito int,
	FOREIGN KEY(Id_carrito)
	REFERENCES Carrito(Id_carrito)
);
CREATE OR REPLACE FUNCtiON trigger_producto_audit() RETURNS TRIGGER AS $$
BEGIN
		IF(TG_OP= 'INSERT' ) THEN
				INSERT INTO producto_audit
				VALUES (new.Id_producto,new.Nombre,new.Categoria,new.Marca,new.Stock,new.Descripcion,new.Precios,new.Id_carrito);
				RETURN NEW;
		ELSEIF (TG_OP= 'UPDATE' ) THEN
				INSERT INTO  producto_audit
				VALUES (new.Id_producto,new.Nombre,new.Categoria,new.Marca,new.Stock,new.Descripcion,new.Precios,new.Id_carrito);
				RETURN NEW;
		ELSEIF (TG_OP= 'DELETE' ) THEN
				INSERT INTO  producto_audit
				VALUES (old.Id_producto,old.Nombre,old.Categoria,old.Marca,old.Stock,old.Descripcion,old.Precios,old.Id_carrito);
				RETURN OLD;
				
		END IF;
		RETURN NULL;
		
END;
$$LANGUAGE plpgsql;

drop FUNcTION trigger_variante_audit;

CREATE TRIGGER trigger_producto_audit AFTER INSERT OR UPDATE OR DELETE ON Producto
FOR EACH ROW EXECUTE PROCEDURE trigger_producto_audit();

INSERT INTO Carrito(Id_carrito)
VALUES('1');
INSERT INTO Producto(Id_producto,Nombre, Categoria, Marca, Stock, Descripcion, Precios, Id_carrito)
VALUES('1', 'Jean Skinny Tiro Alto Mujer', 'Moda', 'Levis', '50', 'Jean ajustado tiro alto, bolsillos delanteros y posteriores, cierre y botón metálico. Efecto lavado.', '59.990', '1');

UPDATE Producto SET
Nombre = 'Playstation 5 Ps5',
Categoria = 'Tecnologia',
Marca = 'Sony',
Stock = '20',
Descripcion = 'Consola Sony Playstation 5 Ps5 825Gb Lector De Disco.',
Precios = '3.589.900',
Id_carrito = '3'
WHERE Id_producto = '1';

DELETE FROM Producto 
WHERE Nombre = 'Gimnasio para gatos castelli'

Select * from producto_audit;
SELECT * FROM Producto;





