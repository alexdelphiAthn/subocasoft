-- ----------------------------------------------------------------------
-- Verifactu: envío directo a la AEAT (sustituye a la API externa)
-- Base de datos: subocasana (MariaDB 10.10)
-- Se puede ejecutar más de una vez.
-- ----------------------------------------------------------------------

-- Cadena de huellas por NIF emisor. La aplicación la crea también si no
-- existe, pero se deja aquí para que quede documentada.
CREATE TABLE IF NOT EXISTS suboc_verifactu_cadena (
  NIF_VFCAD varchar(20) NOT NULL,
  CONTADOR_VFCAD bigint(20) NOT NULL DEFAULT 0,
  NUMSERIE_FAC_VFCAD varchar(60) DEFAULT NULL,
  FECHA_FAC_VFCAD date DEFAULT NULL,
  HUELLA_VFCAD char(64) DEFAULT NULL,
  PROXIMO_ENVIO_VFCAD datetime DEFAULT NULL,
  VUELO_CLAVE_VFCAD varchar(80) DEFAULT NULL,
  VUELO_FHGEN_VFCAD varchar(30) DEFAULT NULL,
  VUELO_HUELLA_VFCAD char(64) DEFAULT NULL,
  INSTANTE_MODIF_VFCAD datetime DEFAULT NULL,
  PRIMARY KEY (NIF_VFCAD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci
  COMMENT='Cadena de huellas VERI*FACTU por emisor';

-- Factura que rectifica un abono (para enviarlo como R1/R5)
ALTER TABLE suboc_facturas
  ADD COLUMN IF NOT EXISTS SERIE_RECTIFICADA_FACTURA varchar(8) DEFAULT NULL
    COMMENT 'Serie de la factura rectificada (abonos)',
  ADD COLUMN IF NOT EXISTS NRO_RECTIFICADA_FACTURA int(8) DEFAULT NULL
    COMMENT 'Número de la factura rectificada (abonos)',
  ADD COLUMN IF NOT EXISTS FECHA_RECTIFICADA_FACTURA date DEFAULT NULL
    COMMENT 'Fecha de la factura rectificada (abonos)';

-- El abono guarda la referencia a la factura original
DELIMITER $$
DROP PROCEDURE IF EXISTS PRC_CREAR_FACTURA_ABONO $$
CREATE PROCEDURE `PRC_CREAR_FACTURA_ABONO`(IN `pidseriefactura` varchar(200),
	IN `pidnumfactura` varchar(200),
	IN `pidseriefacturaabono` varchar(200),
	IN `pfechafacturaabono` date,
	OUT `pidnumfacturaabono` varchar(200))
BEGIN
   DECLARE contadorped varchar(200);
   START TRANSACTION;
   CALL GET_NEXT_CONT_FACT_SERIE(pidseriefacturaabono, 'FC', @cont);
   SET @pFecha = (SELECT DATE_FORMAT(pfechafacturaabono, '%Y-%m-%d'));
   SET contadorped = @cont;
   SET pidnumfacturaabono = contadorped;
   INSERT INTO suboc_facturas (`NRO_FACTURA`,
												`SERIE_FACTURA`,
												`CODIGO_CLIENTE_FACTURA`,
												`RAZONSOCIAL_CLIENTE_FACTURA`,
												`NIF_CLIENTE_FACTURA`,
												`MOVIL_CLIENTE_FACTURA`,
												`EMAIL_CLIENTE_FACTURA`,
												`DIRECCION1_CLIENTE_FACTURA`,
												`DIRECCION2_CLIENTE_FACTURA`,
												`POBLACION_CLIENTE_FACTURA`,
												`PROVINCIA_CLIENTE_FACTURA`,
												`CPOSTAL_CLIENTE_FACTURA`,
												`PAIS_CLIENTE_FACTURA`,
												`TIPOID_INT_CLIENTE_FACTURA`,
												`FECHA_FACTURA`,
												`TOTAL_LIQUIDO_FACTURA`,
												`FORMA_PAGO_FACTURA`,
												`NOMBRE`,
												`APELLIDOS`,
												`ESSIMPL_FACTURA`,
												`SERIE_RECTIFICADA_FACTURA`,
												`NRO_RECTIFICADA_FACTURA`,
												`FECHA_RECTIFICADA_FACTURA`)
							           SELECT   contadorped,
												pidseriefacturaabono,
												`CODIGO_CLIENTE_FACTURA`,
												`RAZONSOCIAL_CLIENTE_FACTURA`,
												`NIF_CLIENTE_FACTURA`,
												`MOVIL_CLIENTE_FACTURA`,
												`EMAIL_CLIENTE_FACTURA`,
												`DIRECCION1_CLIENTE_FACTURA`,
												`DIRECCION2_CLIENTE_FACTURA`,
												`POBLACION_CLIENTE_FACTURA`,
												`PROVINCIA_CLIENTE_FACTURA`,
												`CPOSTAL_CLIENTE_FACTURA`,
												`PAIS_CLIENTE_FACTURA`,
												`TIPOID_INT_CLIENTE_FACTURA`,
												@pFecha,
												`TOTAL_LIQUIDO_FACTURA`*-1,
												`FORMA_PAGO_FACTURA`,
												`NOMBRE`,
												`APELLIDOS`,
												`ESSIMPL_FACTURA`,
												`SERIE_FACTURA`,
												`NRO_FACTURA`,
												`FECHA_FACTURA`
										FROM 	suboc_facturas
										WHERE 	`NRO_FACTURA` = pidnumfactura
										AND     `SERIE_FACTURA` = pidseriefactura;
	INSERT INTO suboc_facturas_lineas (`SERIE_FACTURA_LINEA`,
							`NRO_FACTURA_LINEA`,
							`LINEA_LINEA`,
							`CODIGO_ARTICULO_LINEA`,
							`DESCRIPCION_ARTICULO_LINEA`,
							`PRECIOVENTA_ARTICULO_LINEA`,
							`CANTIDAD_LINEA`,
							`SUM_TOTAL_LINEA`)
	        SELECT 	 pidseriefacturaabono,
									 contadorped,
									`LINEA_LINEA`,
									`CODIGO_ARTICULO_LINEA`,
									`DESCRIPCION_ARTICULO_LINEA`,
									`PRECIOVENTA_ARTICULO_LINEA`,
									`CANTIDAD_LINEA`*-1,
									`SUM_TOTAL_LINEA`*-1
							  FROM suboc_facturas_lineas
							 WHERE `SERIE_FACTURA_LINEA` = pidseriefactura
							   AND `NRO_FACTURA_LINEA` = pidnumfactura;
		COMMIT;
END $$
DELIMITER ;

-- Parámetros del envío directo (solo se crean si no existen).
-- El número enviado a la AEAT lleva delante VERIFACTU_PREFIJO_NUMSERIE o,
-- si no existe ese parámetro, OFFLINE_PREFIX (como hacía la API anterior).
-- Rellenar en Parámetros: NIF y nombre del emisor y datos del productor
-- del software. VERIFACTU_ENTORNO: PRE (pruebas) o PRO (producción).
INSERT INTO suboc_param (NOMBRE_PARAM, VALUE_PARAM)
SELECT n.NOMBRE_PARAM, n.VALUE_PARAM
  FROM (SELECT 'VERIFACTU_ENTORNO' AS NOMBRE_PARAM, 'PRE' AS VALUE_PARAM
        UNION ALL SELECT 'VERIFACTU_NIF_EMISOR', ''
        UNION ALL SELECT 'VERIFACTU_NOMBRE_EMISOR', ''
        UNION ALL SELECT 'VERIFACTU_SIF_NOMBRE_RAZON', ''
        UNION ALL SELECT 'VERIFACTU_SIF_NIF', ''
        UNION ALL SELECT 'VERIFACTU_SIF_NOMBRE', 'Subocasana'
        UNION ALL SELECT 'VERIFACTU_SIF_ID', 'SB'
        UNION ALL SELECT 'VERIFACTU_SIF_VERSION', '1.0'
        UNION ALL SELECT 'VERIFACTU_SIF_NUMERO_INSTALACION', '1'
        UNION ALL SELECT 'VERIFACTU_OPERACION_EXENTA', 'E1'
        UNION ALL SELECT 'VERIFACTU_DESCRIPCION_OPERACION', '') n
 WHERE NOT EXISTS (SELECT 1 FROM suboc_param p
                    WHERE p.NOMBRE_PARAM = n.NOMBRE_PARAM);
