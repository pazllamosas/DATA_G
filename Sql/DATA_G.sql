USE [GD2C2015]
GO

/****** Object:  Schema [DATA_G]    Script Date: 10/3/2015 12:50:10 PM ******/




/** DROP TABLAS **/

IF OBJECT_ID('DATA_G.MILLAS') IS NOT NULL
DROP TABLE DATA_G.MILLAS

IF OBJECT_ID('DATA_G.DEVOLUCION') IS NOT NULL
DROP TABLE DATA_G.DEVOLUCION

IF OBJECT_ID('DATA_G.PAQUETE') IS NOT NULL
DROP TABLE DATA_G.PAQUETE

IF OBJECT_ID('DATA_G.PASAJE') IS NOT NULL
DROP TABLE DATA_G.PASAJE

IF OBJECT_ID('DATA_G.BUTACA') IS NOT NULL
DROP TABLE DATA_G.BUTACA

IF OBJECT_ID('DATA_G.COMPRA') IS NOT NULL
DROP TABLE DATA_G.COMPRA

IF OBJECT_ID('DATA_G.VUELO') IS NOT NULL
DROP TABLE DATA_G.VUELO

IF OBJECT_ID('DATA_G.AERONAVE') IS NOT NULL
DROP TABLE DATA_G.AERONAVE

IF OBJECT_ID('DATA_G.ESTADO') IS NOT NULL
DROP TABLE DATA_G.ESTADO

IF OBJECT_ID('DATA_G.RUTA') IS NOT NULL
DROP TABLE DATA_G.RUTA

IF OBJECT_ID('DATA_G.TIPODESERVICIO') IS NOT NULL
DROP TABLE DATA_G.TIPODESERVICIO

IF OBJECT_ID('DATA_G.CIUDAD') IS NOT NULL
DROP TABLE DATA_G.CIUDAD

IF OBJECT_ID('DATA_G.PUNTO_DE_COMPRA') IS NOT NULL
DROP TABLE DATA_G.PUNTO_DE_COMPRA

IF OBJECT_ID('DATA_G.BENEFICIOS') IS NOT NULL
DROP TABLE DATA_G.BENEFICIOS

IF OBJECT_ID('DATA_G.PRODUCTO') IS NOT NULL
DROP TABLE DATA_G.PRODUCTO

IF OBJECT_ID('DATA_G.INTENTOS_LOGIN') IS NOT NULL
DROP TABLE DATA_G.INTENTOS_LOGIN

IF OBJECT_ID('DATA_G.CLIENTE') IS NOT NULL
DROP TABLE DATA_G.CLIENTE

IF OBJECT_ID('DATA_G.USUARIOPORROL') IS NOT NULL
DROP TABLE DATA_G.USUARIOPORROL

IF OBJECT_ID('DATA_G.USUARIO') IS NOT NULL
DROP TABLE DATA_G.USUARIO

IF OBJECT_ID('DATA_G.ROL_POR_FUNCIONALIDADES') IS NOT NULL
DROP TABLE DATA_G.ROL_POR_FUNCIONALIDADES

IF OBJECT_ID('DATA_G.FUNCIONALIDADES') IS NOT NULL
DROP TABLE DATA_G.FUNCIONALIDADES

IF OBJECT_ID('DATA_G.ROL') IS NOT NULL
DROP TABLE DATA_G.ROL

IF OBJECT_ID('tempdb.dbo.#TEMPPASAJE') IS NOT NULL
DROP TABLE #TEMPPASAJE

IF OBJECT_ID('tempdb.dbo.#TEMPCLIENTES') IS NOT NULL
DROP TABLE #TEMPCLIENTES

IF OBJECT_ID('tempdb.dbo.#TEMP1') IS NOT NULL
DROP TABLE #TEMP1

IF OBJECT_ID('tempdb.dbo.#TEMP2') IS NOT NULL
DROP TABLE #TEMP2

-- DROP PROCEDURES

IF OBJECT_ID('DATA_G.EXISTE_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.EXISTE_USUARIO
	
IF OBJECT_ID('DATA_G.PASSWORD_CORRECTA') IS NOT NULL
DROP PROCEDURE DATA_G.PASSWORD_CORRECTA

IF OBJECT_ID('DATA_G.SET_PASSWORD') IS NOT NULL
DROP PROCEDURE DATA_G.SET_PASSWORD

IF OBJECT_ID('DATA_G.INTENTO_LOGIN') IS NOT NULL
DROP PROCEDURE DATA_G.INTENTO_LOGIN
	
IF OBJECT_ID('DATA_G.GET_ROLES_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.GET_ROLES_USUARIO

IF OBJECT_ID('DATA_G.GET_ID_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.GET_ID_USUARIO

IF OBJECT_ID('DATA_G.BAJA_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.BAJA_USUARIO

IF OBJECT_ID('DATA_G.HABILITAR_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.HABILITAR_USUARIO

IF OBJECT_ID('DATA_G.GET_ESTADO_USUARIO') IS NOT NULL
DROP PROCEDURE DATA_G.GET_ESTADO_USUARIO

IF OBJECT_ID('DATA_G.GET_CLIENTE') IS NOT NULL
DROP PROCEDURE DATA_G.GET_CLIENTE

IF OBJECT_ID('DATA_G.GET_CLIENTE_ID') IS NOT NULL
DROP PROCEDURE DATA_G.GET_CLIENTE_ID

IF OBJECT_ID('DATA_G.BAJA_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.BAJA_ROL

IF OBJECT_ID('DATA_G.ACTIVAR_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.ACTIVAR_ROL

IF OBJECT_ID('DATA_G.GET_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.GET_ROL

IF OBJECT_ID('DATA_G.GET_DESC_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.GET_DESC_ROL

IF OBJECT_ID('DATA_G.GET_DESC_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.GET_DESC_ROL

IF OBJECT_ID('DATA_G.GET_ROLES') IS NOT NULL
DROP PROCEDURE DATA_G.GET_ROLES

IF OBJECT_ID('DATA_G.GET_FUNCIONALIDADES') IS NOT NULL
DROP PROCEDURE DATA_G.GET_FUNCIONALIDADES

IF OBJECT_ID('DATA_G.GET_FUNCIONALIDADES_ROL') IS NOT NULL
DROP PROCEDURE DATA_G.GET_FUNCIONALIDADES_ROL

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DATA_G')
DROP SCHEMA [DATA_G]
GO

/** CREATE TABLAS **/

CREATE SCHEMA [DATA_G] AUTHORIZATION [dbo]
GO

CREATE TABLE DATA_G.#TEMPCLIENTES(
IdCli int,
CliDni numeric(18,0),
CliApellido nvarchar (255),
CliNombre nvarchar (255),
CliFechaNac datetime
)


CREATE TABLE #TEMPPASAJE(

	ID INT IDENTITY PRIMARY KEY, 
	Pasaje_Codigo numeric (18,0),
	Pasaje_Precio numeric (18,2),
	Pasaje_FechaCompra datetime,
	CantMillas int, 
	Cli_Dni numeric (18,0),
	Cli_Apellido nvarchar(255),
	Cli_Nombre nvarchar (255),
	Cli_Fecha_Nac datetime,
	Ruta_Codigo numeric (18,0),
	Tipo_Servicio nvarchar(255),
	Butaca_Nro numeric(18,0),
	Butaca_Tipo nvarchar(255),
	FechaSalida datetime,
	FechaLLegada datetime,
	Fecha_LLegada_Estimada datetime,
	Aeronave_Matricula nvarchar(255),
	Aeronave_Fab nvarchar(255),
	Origen nvarchar(255),
	Destino nvarchar(255)

	)


CREATE TABLE DATA_G.ROL(

	IdRol int PRIMARY KEY IDENTITY(1,1),
	Estado bit DEFAULT 1, -- 1 activo
	Descripcion varchar(255)
	

)


CREATE TABLE DATA_G.FUNCIONALIDADES(

	IdFuncionalidad int PRIMARY KEY IDENTITY (1,1),
	DescripcionFunc varchar(255)

)


CREATE TABLE DATA_G.ROL_POR_FUNCIONALIDADES(

	IdFuncionalidad int FOREIGN KEY REFERENCES DATA_G.FUNCIONALIDADES,
	IdRol int FOREIGN KEY REFERENCES DATA_G.ROL

)

CREATE TABLE DATA_G.USUARIO (
	IdUsuario int PRIMARY KEY IDENTITY(1,1),
	Username nvarchar(255) NOT NULL,
	Password nvarchar(255) NOT NULL,
	IntentosFallidos int NOT NULL DEFAULT 0,
	Estado bit NOT NULL DEFAULT 1
	)

CREATE TABLE DATA_G.USUARIOPORROL(
	IdUsuario int FOREIGN KEY REFERENCES DATA_G.USUARIO,
	IdRol int FOREIGN KEY REFERENCES DATA_G.ROL
)

CREATE TABLE DATA_G.CLIENTE (

	IdCli int PRIMARY KEY IDENTITY(1,1),
		 
	Dni numeric(18, 0), 
	Nombre nvarchar(255),
	Apellido nvarchar(255),
	Direccion nvarchar(255),
	Telefono numeric(18, 0),
	Mail nvarchar(255),
	Fecha_Nac datetime,
	IdUsuario int FOREIGN KEY REFERENCES DATA_G.USUARIO
	
)

CREATE TABLE DATA_G.INTENTOS_LOGIN(
	INT_ID INT IDENTITY(1,1) PRIMARY KEY,
	Usuario INT FOREIGN KEY REFERENCES DATA_G.USUARIO,
	Fecha DATETIME,
	Acceso BIT -- 1 ES CORRECTO
)


CREATE TABLE DATA_G.PRODUCTO(

	IdProducto int PRIMARY KEY IDENTITY (1,1),	

	CostoEnMillas int,
	Descripcion varchar(255),
	Cantidad int 

)


CREATE TABLE DATA_G.BENEFICIOS(

	IdBeneficio int PRIMARY KEY IDENTITY (1,1),

	IdProducto int FOREIGN KEY REFERENCES DATA_G.PRODUCTO,
	IdCli int FOREIGN KEY REFERENCES DATA_G.CLIENTE,

	Milla int
	
)


CREATE TABLE DATA_G.PUNTO_DE_COMPRA(

	IdPuntoDeCompra int PRIMARY KEY IDENTITY(1,1),

	TipoDePunto varchar(255)

)


CREATE TABLE DATA_G.CIUDAD(
	
	CodigoCiudad numeric(18,0)  PRIMARY KEY IDENTITY(1,1),

	Nombre nvarchar(255)

)

CREATE TABLE DATA_G.TIPODESERVICIO(
	IdServicio int PRIMARY KEY IDENTITY(1,1),
	Descripcion nvarchar (255)
	)

CREATE TABLE DATA_G.RUTA(

	IdRuta int PRIMARY KEY IDENTITY(1,1),

	Codigo numeric(18, 0),
	Precio_BaseKG numeric(18, 2),
	Precio_BasePasaje numeric(18, 2),
	--Ciudad_Origen  nvarchar(255),
	--Ciudad_Destino nvarchar (255),
	IdServicio int FOREIGN KEY REFERENCES DATA_G.TIPODESERVICIO,
	Origen numeric(18,0) FOREIGN KEY REFERENCES DATA_G.CIUDAD,
	Destino numeric(18,0) FOREIGN KEY REFERENCES DATA_G.CIUDAD
	 

)

CREATE TABLE DATA_G.ESTADO(

	IdEstado int PRIMARY KEY,
	Descripcion nvarchar(255),
	CantDias int 

)

CREATE TABLE DATA_G.AERONAVE(

	IdAeronave numeric(18,0) PRIMARY KEY IDENTITY (1,1),
	FechaDeAlta datetime, 
	Matricula nvarchar(255),
	Modelo nvarchar(255),
	KG_Disponibles numeric(18, 0),
	Fabricante nvarchar(255),
	IdServicio int FOREIGN KEY REFERENCES DATA_G.TIPODESERVICIO,
	BajaPorFueraDeServicio bit DEFAULT 0, /** 0 false 1 true**/
	BajaPorVidUtil bit DEFAULT 0,
	FechaDeFueraDeServicio datetime,
	FechaReinicioDeServicio datetime,
	FechaBajaDefinitiva datetime,
	CantButacas int NULL,
	CantKGDisponibles int NULL,
	IdEstado int FOREIGN KEY REFERENCES DATA_G.ESTADO DEFAULT 1
	

)


CREATE TABLE DATA_G.VUELO(

	NroVuelo int PRIMARY KEY IDENTITY(1,1),

	FechaEstimadaLlegada datetime,
	FechaLlegada datetime NOT NULL,
	FechaSalida datetime NOT NULL,

	IdRuta int FOREIGN KEY REFERENCES DATA_G.RUTA,
	IdAeronave numeric(18,0) FOREIGN KEY REFERENCES DATA_G.AERONAVE
	
)

CREATE TABLE DATA_G.COMPRA(
	NroCompra INT PRIMARY KEY IDENTITY,	
	PNR NVARCHAR(255),
	NroVuelo INT FOREIGN KEY REFERENCES DATA_G.VUELO NOT NULL,
	IdComprador INT FOREIGN KEY REFERENCES DATA_G.CLIENTE NOT NULL,
	Monto NUMERIC(18,2),
	FechaCompra DATETIME, 
	MedioPago NVARCHAR(255),
	NroTarjeta NUMERIC(18,0),
	VencimientoTarjeta DATETIME, 
	TipoTarjeta NVARCHAR(255),
	Cuotas 	NUMERIC(18,0),
	Pasaje_Codigo NUMERIC(18,0),
	Paquete_Codigo NUMERIC(18,0),
	IdPuntoDeCompra int FOREIGN KEY REFERENCES DATA_G.PUNTO_DE_COMPRA
)

CREATE TABLE DATA_G.BUTACA(

	IdButaca numeric (18, 0) PRIMARY KEY IDENTITY (1,1),
	NroButaca numeric (18, 0),
	Tipo nvarchar(255),
	Piso numeric(18, 0),
	Estado nvarchar(255) DEFAULT 'Libre' CHECK (ESTADO IN ('Libre', 'Ocupado')),

	IdAeronave numeric(18,0) FOREIGN KEY REFERENCES DATA_G.AERONAVE

)


CREATE TABLE DATA_G.PASAJE(
	IdPasaje int  PRIMARY KEY IDENTITY(1,1),
	Pasaje_Codigo numeric(18, 0),

	Precio numeric(18, 2),
	FechaCompra datetime, 
	CantMillas int,
	NroVuelo int FOREIGN KEY REFERENCES DATA_G.VUELO,
	--Ciudad_Origen nvarchar(255),
	--Ciudad_Destino nvarchar(255),

	IdCli int FOREIGN KEY REFERENCES DATA_G.CLIENTE,
	IdButaca numeric (18, 0) FOREIGN KEY REFERENCES DATA_G.BUTACA

)


CREATE TABLE DATA_G.PAQUETE(
	
	IdPaquete numeric(18,0) PRIMARY KEY IDENTITY (1,1),

	Codigo numeric(18,2),
	Precio numeric(18,2),
	KG numeric(18,0),
	FechaCompra datetime,
	Piso numeric(18, 0) CHECK (Piso IN ('0')),

	IdCli int FOREIGN KEY REFERENCES DATA_G.CLIENTE,
	NroVuelo int FOREIGN KEY REFERENCES DATA_G.VUELO

)

CREATE TABLE DATA_G.DEVOLUCION(

	IdDevolucion int PRIMARY KEY IDENTITY (1,1),
	FechaDevolucion datetime,

	NroCompra int FOREIGN KEY REFERENCES DATA_G.COMPRA,
	IdPaquete numeric(18,0) FOREIGN KEY REFERENCES DATA_G.PAQUETE,
	IdPasaje int  FOREIGN KEY REFERENCES DATA_G.PASAJE
	

)

CREATE TABLE DATA_G.MILLAS(

	IdMillas int PRIMARY KEY IDENTITY,
	HistorialMillas int DEFAULT '0',
	
	IdCli int FOREIGN KEY REFERENCES DATA_G.CLIENTE,
	NroVuelo int FOREIGN KEY REFERENCES DATA_G.VUELO
) 



-------------------------------------------------- MIGRACION DE DATOS ----------------------------------------------------------

INSERT INTO DATA_G.ROL( Descripcion)
VALUES ('Administrador General')
INSERT INTO DATA_G.ROL( Descripcion)
VALUES ('Cliente')

SET IDENTITY_INSERT DATA_G.FUNCIONALIDADES ON
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (0,'Crear acceso usuario')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (1,'Modificar acceso usuario')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (2,'Eliminar acceso usuario')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (3,'Logueo') --FUNCIONALIDAD ESPECIAL
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (4,'Crear origen y destino viaje')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (5,'Modificar origen y destino viaje')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (6,'Dar de baja origen y destino viaje')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (7,'Incorporar aeronave')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (8,'Modificar aeronave')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (9,'Dar de baja aeronave')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (10,'Confeccionar ruta de viaje disponible')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (11,'Compra de pasajes/encomiendas')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (12,'Registro de llegada destino')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (13,'Cancelacion/Devolucion de pasaje y/o encomienda')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (14,'Consulta de millas de pasajero frecuente')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (15,'Canje de millas de pasajero frecuente')
INSERT INTO DATA_G.FUNCIONALIDADES(IdFuncionalidad,DescripcionFunc)
VALUES (16,'Consulta TOP 5')
/**faltan mas??**/
SET IDENTITY_INSERT DATA_G.FUNCIONALIDADES OFF

INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(0,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(1,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(2,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(4,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(5,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(6,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(7,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(8,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(9,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(10,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(11,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(11,2)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(12,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(13,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(14,2)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(15,1)
INSERT INTO DATA_G.ROL_POR_FUNCIONALIDADES
VALUES(16,2)



INSERT INTO DATA_G.CLIENTE(Nombre, Apellido,Dni,Direccion,Telefono,Mail,Fecha_Nac, IdUsuario)
SELECT distinct Cli_Nombre,Cli_Apellido, Cli_Dni,Cli_Dir,Cli_Telefono,Cli_Mail,Cli_Fecha_Nac, U.IdUsuario FROM gd_esquema.Maestra, DATA_G.USUARIO U 
Order by 4

INSERT INTO DATA_G.USUARIO(Username,Password)
VALUES('admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7')

INSERT INTO DATA_G.USUARIOPORROL(IdUsuario, IdRol)
SELECT U.IdUsuario, 2 
FROM DATA_G.USUARIO U, DATA_G.ROL R
WHERE R.Descripcion = 'Administrador General' AND U.Username = 'admin'

INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Mochila',125,200)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Linterna',100,200)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Colchon Infable',225,100)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Equipo Termo',125,200)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Gu�a Turistica',100,150)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Valija',500,100)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Tostadora',500,150)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('GPS',1000,100)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Licuadora',500,150)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Estadia en Sao Paulo 5 dias',2000,50)
INSERT INTO DATA_G.PRODUCTO(Descripcion, CostoEnMillas, Cantidad)
VALUES('Tablet',1500,50) 

INSERT INTO #TEMPCLIENTES(IdCli, CliDni, CliApellido, CliNombre, CliFechaNac)
SELECT DISTINCT IdCli, Dni ,Apellido, Nombre, Fecha_Nac 
FROM  DATA_G.CLIENTE C, gd_esquema.Maestra M
WHERE C.Dni = M.Cli_Dni
	AND C.Apellido = M.Cli_Apellido
	AND C.Nombre = M.Cli_Nombre
	AND C.Fecha_Nac = M.Cli_Fecha_Nac

CREATE INDEX IDX_TempClientes ON #TEMPCLIENTES
(IdCli, CliApellido, CliNombre, CliFechaNac)
GO

INSERT INTO DATA_G.BENEFICIOS (IdCli, IdProducto , Milla) --REVISAR
SELECT		TC.IdCli,
			P.IdProducto,
			(SUM(P.CostoEnMillas)) AS 'MILLA'
FROM DATA_G.CLIENTE C, #TEMPCLIENTES tc WITH (INDEX(IDX_TempClientes)), DATA_G.PRODUCTO P
WHERE tc.CliDni = C.Dni
	AND TC.CliApellido = C.Apellido
	AND TC.CliNombre = C.Nombre 
	AND TC.CliFechaNac = C.Fecha_Nac
GROUP BY IdProducto, TC.IdCli 

SET IDENTITY_INSERT DATA_G.PUNTO_DE_COMPRA ON
INSERT INTO DATA_G.PUNTO_DE_COMPRA(IdPuntoDeCompra,TipoDePunto)
VALUES (1, 'Terminal Kiosco')
INSERT INTO DATA_G.PUNTO_DE_COMPRA(IdPuntoDeCompra,TipoDePunto)
VALUES(2, 'Oficina Comercial o Aeropuerto')
SET IDENTITY_INSERT DATA_G.PUNTO_DE_COMPRA OFF

INSERT INTO DATA_G.CIUDAD(Nombre)
SELECT DISTINCT Ruta_Ciudad_Destino 
FROM gd_esquema.Maestra
ORDER BY 1

INSERT INTO DATA_G.TIPODESERVICIO( Descripcion)
SELECT DISTINCT Tipo_Servicio
FROM gd_esquema.Maestra


INSERT INTO DATA_G.RUTA(Codigo, Precio_BaseKG, Precio_BasePasaje, IdServicio, Origen, Destino)

SELECT   RUTAS.Ruta_Codigo,
		 SUM(RUTAS.Ruta_Precio_BaseKG) AS 'Precio Base KG',
		 SUM(RUTAS.Ruta_Precio_BasePasaje)AS 'Precio Base Pasaje',
		 RUTAS.IdServicio,
		 RUTAS.Origen,
		 RUTAS.Destino
FROM
(SELECT DISTINCT M.Ruta_Codigo,
	   M.Ruta_Precio_BaseKG ,
	   M.Ruta_Precio_BasePasaje ,
	   t.IdServicio,
	   c1.CodigoCiudad AS 'Origen',
	   c2.CodigoCiudad AS 'Destino'    
FROM gd_esquema.Maestra M, DATA_G.CIUDAD c1, DATA_G.CIUDAD c2, DATA_G.TIPODESERVICIO t
WHERE M.Ruta_Ciudad_Origen = c1.Nombre
	AND M.Ruta_Ciudad_Destino = c2.Nombre
	AND M.Tipo_Servicio = t.Descripcion) RUTAS
GROUP BY RUTAS.Ruta_Codigo,RUTAS.IdServicio,RUTAS.Origen, RUTAS.Destino
ORDER BY 4, 5
 
 INSERT INTO DATA_G.ESTADO(IdEstado, Descripcion)
VALUES(1, 'Volando')
INSERT INTO DATA_G.ESTADO(IdEstado, Descripcion)
VALUES(2, 'Reposo')
INSERT INTO DATA_G.ESTADO(IdEstado, Descripcion, CantDias)
VALUES(3, 'Fuera de Servicio',0)
INSERT INTO DATA_G.ESTADO(IdEstado, Descripcion)
VALUES(4, 'Completo Vida Util')

 --AGREGAR LOS OTROS CAMPOS QUE PIDE EL ENUNCIADO?
INSERT INTO DATA_G.AERONAVE(Matricula, Modelo, KG_Disponibles, Fabricante, IdServicio)

SELECT M.Aeronave_Matricula, M.Aeronave_Modelo, M.Aeronave_KG_Disponibles, M.Aeronave_Fabricante, t.IdServicio
FROM gd_esquema.Maestra M, DATA_G.TIPODESERVICIO t
WHERE M.Tipo_Servicio = t.Descripcion
GROUP BY M.Aeronave_Matricula, M.Aeronave_Modelo, M.Aeronave_KG_Disponibles, M.Aeronave_Fabricante, t.IdServicio

ORDER BY 1

INSERT INTO DATA_G.VUELO(IdRuta,IdAeronave,FechaSalida,FechaLlegada,FechaEstimadaLlegada)
SELECT DISTINCT R.IdRuta,
				A.IdAeronave, 
				M.FechaSalida,
				M.FechaLlegada,
				M.Fecha_Llegada_Estimada	   
FROM gd_esquema.Maestra M, DATA_G.RUTA R, DATA_G.AERONAVE A, DATA_G.CIUDAD C,  DATA_G.CIUDAD C2
WHERE	
		M.Aeronave_Matricula = A.Matricula
	AND M.Aeronave_Fabricante = A.Fabricante
	AND M.Ruta_Codigo = R.Codigo
	AND (SELECT C1.CodigoCiudad FROM DATA_G.CIUDAD C1 WHERE M.Ruta_Ciudad_Origen = C1.Nombre) = R.Origen
	AND (SELECT C2.CodigoCiudad FROM DATA_G.CIUDAD C2 WHERE M.Ruta_Ciudad_Destino = C2.Nombre) = R.Destino
	AND M.Tipo_Servicio = ( SELECT Descripcion FROM DATA_G.TIPODESERVICIO  WHERE IdServicio = R.IdServicio)
	  
ORDER BY 2, 3, 4

INSERT INTO DATA_G.BUTACA(NroButaca, Tipo, Piso, IdAeronave)
SELECT DISTINCT M.Butaca_Nro,
				M.Butaca_Tipo,
				M.Butaca_Piso,
				A.IdAeronave
				
FROM gd_esquema.Maestra M, DATA_G.AERONAVE A 
WHERE M.Aeronave_Matricula = A.Matricula
	AND  M.Aeronave_Modelo = A.Modelo
	AND M.Aeronave_KG_Disponibles = A.KG_Disponibles
	AND M.Aeronave_Fabricante = A.Fabricante
	AND M.Butaca_Tipo IN ('Ventanilla', 'Pasillo')
	AND M.Butaca_Piso <>0
ORDER BY 1

UPDATE DATA_G.AERONAVE 
	SET CantButacas = joinButacaAeronave.CANTIDAD
	FROM (SELECT B.IdAeronave, COUNT(B.NroButaca) AS 'CANTIDAD'
										FROM DATA_G.BUTACA B, DATA_G.AERONAVE A
										WHERE A.IdAeronave = B.IdAeronave 
										GROUP BY B.IdAeronave ) AS joinButacaAeronave 
										WHERE joinButacaAeronave.IdAeronave =  DATA_G.AERONAVE.IdAeronave


										
--INSERT tabla temporal
INSERT INTO #TEMPPASAJE(Pasaje_Codigo, Pasaje_Precio, Pasaje_FechaCompra, CantMillas, Cli_Dni, Cli_Apellido, Cli_Nombre, Cli_Fecha_Nac, Ruta_Codigo, Tipo_Servicio, Aeronave_Matricula, Aeronave_Fab , Butaca_Nro, Butaca_Tipo, FechaSalida, FechaLLegada, Fecha_LLegada_Estimada, Origen, Destino)
SELECT distinct M.Pasaje_Codigo,
				M.Pasaje_Precio,
				M.Pasaje_FechaCompra,
				CAST(ROUND(M.Pasaje_Precio/10,1) AS decimal(10,0)) AS 'CantMillas',
				M.Cli_Dni,
				M.Cli_Apellido,
				M.Cli_Nombre,
				M.Cli_Fecha_Nac,
				M.Ruta_Codigo,
				M.Tipo_Servicio,
				M.Aeronave_Matricula,
				M.Aeronave_Fabricante,
				M.Butaca_Nro,
				M.Butaca_Tipo,
				M.FechaSalida,
				M.FechaLLegada,
				M.Fecha_LLegada_Estimada,
				M.Ruta_Ciudad_Origen,
				M.Ruta_Ciudad_Destino

	FROM gd_esquema.Maestra M
	WHERE M.Pasaje_Codigo <> 0




CREATE TABLE #TEMP1(
IdCli int,
IdPJ int 
)

INSERT INTO #TEMP1 
	SELECT TC.IdCli, PJ.ID FROM #TEMPPASAJE PJ
	JOIN  #TEMPCLIENTES tc WITH (INDEX(IDX_TempClientes)) ON tc.CliDni = PJ.Cli_Dni
					AND TC.CliApellido = PJ.Cli_Apellido
					AND TC.CliNombre = PJ.Cli_Nombre
					AND TC.CliFechaNac = PJ.Cli_Fecha_Nac

CREATE TABLE #TEMP2(
IdPJ int,
Pasaje_Codigo numeric(18, 0),
Pasaje_Precio numeric(18, 2),
Pasaje_FechaCompra datetime, 
CantMillas int ,
NroVuelo int,
IdButaca numeric(18,0),
)
INSERT INTO #TEMP2
	SELECT  PJ.ID,
			PJ.Pasaje_Codigo,
			PJ.Pasaje_Precio,
			PJ.Pasaje_FechaCompra,
			PJ.CantMillas,
			VU.NroVuelo,
			BU.IdButaca
		
FROM #TEMPPASAJE PJ
	JOIN DATA_G.CIUDAD c1 ON PJ.Destino = C1.Nombre
	JOIN DATA_G.CIUDAD c2 ON PJ.Origen = C2.Nombre
	JOIN DATA_G.TIPODESERVICIO TS ON TS.Descripcion = PJ.Tipo_Servicio
	JOIN DATA_G.RUTA R ON R.IdServicio= TS.IdServicio
		AND  r.Codigo =  PJ.Ruta_Codigo
		AND R.Destino = C1.CodigoCiudad
		AND R.Origen = C2.CodigoCiudad
	JOIN DATA_G.AERONAVE AE ON AE.Matricula = PJ.Aeronave_Matricula
		AND AE.Fabricante = PJ.Aeronave_Fab
	JOIN DATA_G.VUELO VU ON VU.FechaLlegada = PJ.FechaLLegada
		AND VU.FechaSalida = PJ.FechaSalida
		AND VU.IdAeronave = AE.IdAeronave
		AND VU.IdRuta = R.IdRuta
	JOIN DATA_G.BUTACA BU ON BU.IdAeronave = AE.IdAeronave
		AND BU.NroButaca = PJ.Butaca_Nro
		AND BU.Tipo = PJ.Butaca_Tipo

CREATE INDEX IDX_Temp2 ON #TEMP2
(IdPJ, Pasaje_Codigo, Pasaje_Precio, Pasaje_FechaCompra, CantMillas, NroVuelo, IdButaca)
GO


IF OBJECT_ID('tempdb.dbo.#TEMPPAQUETE') IS NOT NULL
DROP TABLE #TEMPPAQUETE

CREATE TABLE #TEMPPAQUETE(

	ID INT IDENTITY PRIMARY KEY, 
	Paquete_Codigo numeric (18,0),
	Paquete_Precio numeric (18,2),
	Paquete_FechaCompra datetime,
	Paquete_KG numeric (18,0),
	CantMillas int, 
	Cli_Dni numeric (18,0),
	Cli_Apellido nvarchar(255),
	Cli_Nombre nvarchar (255),
	Cli_Fecha_Nac datetime, 
	Ruta_Codigo numeric (18,0),
	Tipo_Servicio nvarchar(255),
	FechaSalida datetime,
	FechaLLegada datetime,
	Fecha_LLegada_Estimada datetime,
	Aeronave_Matricula nvarchar(255),
	Aeronave_Fab nvarchar(255),
	Origen nvarchar(255),
	Destino nvarchar(255)

	)

INSERT INTO #TEMPPAQUETE(Paquete_Codigo, Paquete_Precio, Paquete_FechaCompra, Paquete_KG, CantMillas, Cli_Dni, Cli_Apellido, Cli_Nombre, Cli_Fecha_Nac ,Ruta_Codigo, Tipo_Servicio, Aeronave_Matricula, Aeronave_Fab, FechaSalida, FechaLLegada, Fecha_LLegada_Estimada, Origen, Destino)
SELECT distinct M.Paquete_Codigo,
				M.Paquete_Precio,
				M.Paquete_FechaCompra,
				M.Paquete_KG,
				CAST(ROUND(M.Paquete_Precio/10,1) AS decimal(10,0)) AS 'CantMillas',
				M.Cli_Dni,
				M.Cli_Apellido,
				M.Cli_Nombre,
				M.Cli_Fecha_Nac,
				M.Ruta_Codigo,
				M.Tipo_Servicio,
				M.Aeronave_Matricula,
				M.Aeronave_Fabricante,
				M.FechaSalida,
				M.FechaLLegada,
				M.Fecha_LLegada_Estimada,
				M.Ruta_Ciudad_Origen,
				M.Ruta_Ciudad_Destino

	FROM gd_esquema.Maestra M
	WHERE M.Paquete_Codigo <> 0


INSERT INTO DATA_G.COMPRA (PNR, NroVuelo, IdComprador, Monto, FechaCompra, MedioPago, NroTarjeta, VencimientoTarjeta, TipoTarjeta, Cuotas, Pasaje_Codigo,Paquete_Codigo)
SELECT 
	NULL,
	T2.NroVuelo,
	T1.IdCli,
	T2.Pasaje_Precio,
	T2.Pasaje_FechaCompra,
	NULL, NULL, NULL, NULL, NULL, NULL, T2.Pasaje_Codigo
FROM #TEMP1 T1
	JOIN #TEMP2 T2 ON T2.IdPJ = T1.IdPJ

INSERT INTO DATA_G.COMPRA(PNR, NroVuelo, IdComprador, Monto, FechaCompra, MedioPago, NroTarjeta, VencimientoTarjeta, TipoTarjeta, Cuotas, Pasaje_Codigo,Paquete_Codigo)
SELECT 
	NULL, 
	VU.NroVuelo,
	TC.IdCli,
	PQ.Paquete_Precio,
	PQ.Paquete_FechaCompra,
	NULL, NULL, NULL, NULL, NULL, NULL, PQ.Paquete_Codigo
FROM #TEMPPAQUETE PQ 
JOIN  #TEMPCLIENTES tc WITH (INDEX(IDX_TempClientes)) ON tc.CliDni = PQ.Cli_Dni
					AND TC.CliApellido = PQ.Cli_Apellido
					AND TC.CliNombre = PQ.Cli_Nombre
					AND TC.CliFechaNac = PQ.Cli_Fecha_Nac
	JOIN DATA_G.CIUDAD c1 ON PQ.Destino = C1.Nombre
	JOIN DATA_G.CIUDAD c2 ON PQ.Origen = C2.Nombre
	JOIN DATA_G.TIPODESERVICIO TS ON TS.Descripcion = PQ.Tipo_Servicio
	JOIN DATA_G.RUTA R ON R.IdServicio= TS.IdServicio
		AND  r.Codigo =  PQ.Ruta_Codigo
		AND R.Destino = C1.CodigoCiudad
		AND R.Origen = C2.CodigoCiudad
	JOIN DATA_G.AERONAVE AE ON AE.Matricula = PQ.Aeronave_Matricula
		AND AE.Fabricante = PQ.Aeronave_Fab
	JOIN DATA_G.VUELO VU ON VU.FechaLlegada = PQ.FechaLLegada
		AND VU.FechaSalida = PQ.FechaSalida
		AND VU.IdAeronave = AE.IdAeronave
		AND VU.IdRuta = R.IdRuta


INSERT INTO DATA_G.PASAJE(Pasaje_Codigo,Precio,FechaCompra, CantMillas, NroVuelo, IdCli, IdButaca)
SELECT
			T2.Pasaje_Codigo,
			T2.Pasaje_Precio,
			T2.Pasaje_FechaCompra,
		T2.CantMillas,
		T2.NroVuelo,
		T1.IdCli,
		T2.IdButaca	
	FROM #TEMP1 T1
	JOIN #TEMP2 T2 WITH (INDEX(IDX_Temp2)) ON T2.IdPJ = T1.IdPJ



INSERT INTO DATA_G.PAQUETE( IdCli, Codigo, FechaCompra, Precio, NroVuelo, KG)
SELECT DISTINCT TC.IdCli,
		PQ.Paquete_Codigo,
	   PQ.Paquete_FechaCompra,
	   PQ.Paquete_Precio,
	   VU.NroVuelo,
	   PQ.Paquete_KG
FROM #TEMPPAQUETE PQ 
JOIN  #TEMPCLIENTES tc WITH (INDEX(IDX_TempClientes)) ON tc.CliDni = PQ.Cli_Dni
					AND TC.CliApellido = PQ.Cli_Apellido
					AND TC.CliNombre = PQ.Cli_Nombre
					AND TC.CliFechaNac = PQ.Cli_Fecha_Nac
	JOIN DATA_G.CIUDAD c1 ON PQ.Destino = C1.Nombre
	JOIN DATA_G.CIUDAD c2 ON PQ.Origen = C2.Nombre
	JOIN DATA_G.TIPODESERVICIO TS ON TS.Descripcion = PQ.Tipo_Servicio
	JOIN DATA_G.RUTA R ON R.IdServicio= TS.IdServicio
		AND  r.Codigo =  PQ.Ruta_Codigo
		AND R.Destino = C1.CodigoCiudad
		AND R.Origen = C2.CodigoCiudad
	JOIN DATA_G.AERONAVE AE ON AE.Matricula = PQ.Aeronave_Matricula
		AND AE.Fabricante = PQ.Aeronave_Fab
	JOIN DATA_G.VUELO VU ON VU.FechaLlegada = PQ.FechaLLegada
		AND VU.FechaSalida = PQ.FechaSalida
		AND VU.IdAeronave = AE.IdAeronave
		AND VU.IdRuta = R.IdRuta

ORDER BY 1

/* AHORA NO HAY DEVOLUCIONES
INSERT INTO DATA_G.DEVOLUCION(Codigo_Compra, IdPasaje, IdPaquete)
SELECT  CP.Codigo_Compra,
		PJ.IdPasaje,
		PQ.IdPaquete
FROM DATA_G.COMPRADOR CP, DATA_G.PASAJE PJ, DATA_G.PAQUETE PQ, DATA_G.CLIENTE C, gd_esquema.Maestra M
 */

INSERT INTO DATA_G.MILLAS (IdCli, NroVuelo)
SELECT DISTINCT PJ.IdCli,
				PJ.NroVuelo
FROM  DATA_G.PASAJE PJ


INSERT INTO DATA_G.MILLAS (IdCli, NroVuelo)
SELECT DISTINCT PQ.IdCli,
				PQ.NroVuelo
FROM  DATA_G.PAQUETE PQ

IF OBJECT_ID('tempdb.dbo.#TEMPPASAJE') IS NOT NULL
DROP TABLE #TEMPPASAJE

IF OBJECT_ID('tempdb.dbo.#TEMPCLIENTES') IS NOT NULL
DROP TABLE #TEMPCLIENTES

IF OBJECT_ID('tempdb.dbo.#TEMP1') IS NOT NULL
DROP TABLE #TEMP1

IF OBJECT_ID('tempdb.dbo.#TEMP2') IS NOT NULL
DROP TABLE #TEMP2

IF OBJECT_ID('tempdb.dbo.#TEMPPAQUETE') IS NOT NULL
DROP TABLE #TEMPPAQUETE	


/*
IF OBJECT_ID (N'DATA_G.FunctionParaVuelo') IS NOT NULL
    DROP FUNCTION DATA_G.FunctionParaVuelo;
GO
		
		GO
CREATE FUNCTION DATA_G.FunctionParaVuelo(@Destino nvarchar(255), @Origen nvarchar(255), @TipoServicio nvarchar (255), @RutaCodigo numeric (18,0), @AMatricula nvarchar (255),  @AFab nvarchar (255), @Salida datetime, @Llegada datetime)
	RETURNS @Tabla TABLE ( 
		Destino nvarchar(255)
		, Origen nvarchar(255)
		, TipoServicio nvarchar (255)
		, RutaCodigo numeric (18,0)
		, AMatricula nvarchar (255)
		, AFab nvarchar (255)
		, Salida datetime
		, Llegada datetime
		, IdAeronave int
		,NroVuelo int
		)
		AS
	BEGIN
	insert into @Tabla
		 select M.Ruta_Ciudad_Destino
		, M.Ruta_Ciudad_Origen
		, M.Tipo_Servicio
		, M.Ruta_Codigo 
		, M.Aeronave_Matricula 
		, M.Aeronave_Fabricante 
		, M.FechaSalida 
		, M.FechaLLegada
		, ae.IdAeronave 
		,vu.NroVuelo 
		 from DATA_G.VUELO VU, gd_esquema.Maestra M 
	JOIN DATA_G.CIUDAD c1 on @Destino  = C1.Nombre
	JOIN DATA_G.CIUDAD c2 ON @Origen  = C2.Nombre
	JOIN DATA_G.TIPODESERVICIO TS ON TS.Descripcion = @TipoServicio
	JOIN DATA_G.RUTA R ON R.IdServicio= TS.IdServicio
		AND  r.Codigo =  @RutaCodigo
		AND R.Destino = C1.CodigoCiudad
		AND R.Origen = C2.CodigoCiudad
	JOIN DATA_G.AERONAVE AE ON AE.Matricula = @AMatricula
		AND AE.Fabricante = @AFab
		where VU.FechaLlegada = @Llegada 
		AND VU.FechaSalida = @Salida
		AND VU.IdAeronave = AE.IdAeronave
		AND VU.IdRuta = R.IdRuta 
	
	RETURN;
	END;
	 GO
*/	 


	------------------------------------------------------------------------------------
	IF OBJECT_ID('DATA_G.EXISTE_USUARIO') IS NOT NULL
	DROP PROCEDURE DATA_G.EXISTE_USUARIO
	
	IF OBJECT_ID('DATA_G.PASSWORD_CORRECTA') IS NOT NULL
	DROP PROCEDURE DATA_G.PASSWORD_CORRECTA

	IF OBJECT_ID('DATA_G.SET_PASSWORD') IS NOT NULL
	DROP PROCEDURE DATA_G.SET_PASSWORD

	IF OBJECT_ID('DATA_G.INTENTO_LOGIN') IS NOT NULL
	DROP PROCEDURE DATA_G.INTENTO_LOGIN
	
	GO
	CREATE PROCEDURE DATA_G.EXISTE_USUARIO(@USUARIO VARCHAR(255)) AS
	BEGIN
		DECLARE @CANTIDAD INT
		
		SELECT @CANTIDAD = COUNT(USERNAME) FROM DATA_G.USUARIO
		WHERE USERNAME = @USUARIO AND
			  ESTADO = 1
		
		RETURN @CANTIDAD
	END
	
	GO
CREATE PROCEDURE DATA_G.PASSWORD_CORRECTA(@USUARIO VARCHAR(255),@PASSWORD VARCHAR(64)) AS
BEGIN
	DECLARE @HASH_PASS NVARCHAR(255), @CANTIDAD INT
	SET @HASH_PASS =  @PASSWORD


	SELECT @CANTIDAD = COUNT(USERNAME) FROM DATA_G.USUARIO
	WHERE ESTADO = 1 AND
		  USERNAME = @USUARIO AND
		  PASSWORD = @HASH_PASS


	RETURN @CANTIDAD
END

GO
CREATE PROCEDURE DATA_G.SET_PASSWORD(@USUARIO VARCHAR(255),@PASSWORD NVARCHAR(255)) AS
BEGIN 
	DECLARE @HASH_PASS NVARCHAR (255)
	SET @HASH_PASS = @PASSWORD
	
	UPDATE DATA_G.USUARIO SET
		PASSWORD = @HASH_PASS
	WHERE USERNAME = @USUARIO
END 

GO
CREATE TRIGGER DATA_G.AFTER_LOGIN ON DATA_G.INTENTOS_LOGIN AFTER INSERT AS
BEGIN
	DECLARE @ACCESO INT, @IDUSUARIO INT, @ESTADO INT, @INTENTOS_FALLIDOS_ACTUAL INT
	SELECT @ACCESO = ACCESO, @IDUSUARIO = USUARIO FROM INSERTED
	
	SELECT @ESTADO = ESTADO, @INTENTOS_FALLIDOS_ACTUAL = INTENTOSFALLIDOS FROM DATA_G.USUARIO
	WHERE IdUsuario = @IDUSUARIO
	
	IF @ACCESO = 1
	BEGIN
		UPDATE DATA_G.USUARIO SET 
			IntentosFallidos = 0
		WHERE IdUsuario = @IDUSUARIO
	END
	ELSE
	BEGIN
		IF @INTENTOS_FALLIDOS_ACTUAL = 2
		UPDATE DATA_G.USUARIO SET
			INTENTOSFALLIDOS = INTENTOSFALLIDOS + 1,
			ESTADO = 0
		WHERE IdUsuario = @IDUSUARIO
		ELSE
		UPDATE DATA_G.USUARIO SET
			INTENTOSFALLIDOS = INTENTOSFALLIDOS + 1,
			ESTADO = @ESTADO
		WHERE IdUsuario = @IDUSUARIO
	END
END 


GO
CREATE PROCEDURE DATA_G.INTENTO_LOGIN(@USUARIO VARCHAR(255),@ACCESO INT,@FECHA DATETIME) AS
BEGIN 
	INSERT INTO DATA_G.INTENTOS_LOGIN
	SELECT IdUsuario, GETDATE(), @ACCESO FROM DATA_G.USUARIO
	WHERE USERNAME = @USUARIO
END 

GO
CREATE PROCEDURE DATA_G.GET_ROLES_USUARIO(@USUARIO VARCHAR(255)) AS
BEGIN
	SELECT R.IdRol, Descripcion FROM DATA_G.USUARIO U, DATA_G.USUARIOPORROL UR, DATA_G.ROL R
	WHERE USERNAME = @USUARIO AND
		  U.IdUsuario  = UR.IdUsuario AND
		  R.IdRol = UR.IdRol AND
		  R.ESTADO = 1 AND
		  U.ESTADO = 1
END


GO
CREATE PROCEDURE DATA_G.GET_ID_USUARIO(@USUARIO VARCHAR(255)) AS
BEGIN
	DECLARE @USU_ID INT
	
	SELECT @USU_ID = IdUsuario FROM DATA_G.USUARIO
	WHERE USERNAME = @USUARIO
	
	RETURN @USU_ID
END

GO
CREATE PROCEDURE DATA_G.BAJA_USUARIO(@ID INT) AS
BEGIN
	UPDATE DATA_G.USUARIO SET
		ESTADO = 0
	WHERE IdUsuario = @ID
END

GO
CREATE PROCEDURE DATA_G.HABILITAR_USUARIO(@USERNAME VARCHAR(255)) AS
BEGIN
	UPDATE DATA_G.USUARIO SET
		ESTADO = 1
	WHERE USERNAME = @USERNAME
END

GO
CREATE PROCEDURE DATA_G.GET_ESTADO_USUARIO(@USERNAME VARCHAR(255)) AS
BEGIN
	DECLARE @ESTADO INT
	
	SELECT @ESTADO = ESTADO FROM DATA_G.USUARIO
		WHERE USERNAME = @USERNAME
	
	RETURN @ESTADO
END

GO
CREATE PROCEDURE DATA_G.GET_CLIENTE(@ID INT) AS
BEGIN
	SELECT * FROM DATA_G.CLIENTE C, DATA_G.USUARIO U
	WHERE C.IdCli = @ID AND U.IdUsuario = C.IdUsuario
END


GO
CREATE PROCEDURE DATA_G.GET_CLIENTE_ID(@USUARIO INT) AS
BEGIN
	DECLARE @CLI_ID INT
	
	SELECT @CLI_ID = IdCli FROM DATA_G.CLIENTE 
	WHERE IdUsuario = @USUARIO
	
	RETURN @CLI_ID
END

GO
CREATE PROCEDURE DATA_G.BAJA_ROL(@ID INT) AS
BEGIN 
	UPDATE DATA_G.ROL SET
		ESTADO = 0
	WHERE IdRol = @ID
END 

GO
CREATE PROCEDURE DATA_G.ACTIVAR_ROL(@NOMBRE VARCHAR(50)) AS
BEGIN 
	UPDATE DATA_G.ROL SET
		ESTADO = 1
	WHERE Descripcion = @NOMBRE
END 

GO
CREATE PROCEDURE DATA_G.GET_ROL(@ID INT) AS
BEGIN
	SELECT R.IdRol, R.Descripcion, RF.IdFuncionalidad, ESTADO FROM DATA_G.ROL R, DATA_G.ROL_POR_FUNCIONALIDADES RF
	WHERE R.IdRol = @ID AND
		  R.IdRol = RF.IdFuncionalidad
END


GO
CREATE PROCEDURE DATA_G.GET_DESC_ROL(@NOMBRE VARCHAR(50)) AS
BEGIN
	SELECT IdRol, Descripcion FROM DATA_G.ROL
	WHERE Descripcion = @NOMBRE
END


GO
CREATE PROCEDURE DATA_G.GET_ROLES(@ESTADO INT) AS
BEGIN
	SELECT IdRol AS Indice, Descripcion AS Rol FROM DATA_G.ROL
	WHERE (ESTADO = 1 OR ESTADO = @ESTADO)
END

GO
CREATE PROCEDURE DATA_G.GET_FUNCIONALIDADES AS
BEGIN
	SELECT IdFuncionalidad, DescripcionFunc FROM DATA_G.FUNCIONALIDADES
END

GO
CREATE PROCEDURE DATA_G.GET_FUNCIONALIDADES_ROL(@ROL_ID INT) AS
BEGIN
	SELECT F.IdFuncionalidad, DescripcionFunc AS Funcionalidad FROM DATA_G.ROL_POR_FUNCIONALIDADES RF, DATA_G.FUNCIONALIDADES F
	WHERE IdRol = @ROL_ID AND
		  F.IdFuncionalidad = RF.IdFuncionalidad
END

















