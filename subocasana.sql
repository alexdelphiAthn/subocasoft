/*
 Navicat Premium Dump SQL

 Source Server         : localhost_mariadb
 Source Server Type    : MariaDB
 Source Server Version : 101002 (10.10.2-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : subocasana

 Target Server Type    : MariaDB
 Target Server Version : 101002 (10.10.2-MariaDB)
 File Encoding         : 65001

 Date: 13/09/2025 17:14:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for codigo_postal
-- ----------------------------
DROP TABLE IF EXISTS `codigo_postal`;
CREATE TABLE `codigo_postal`  (
  `CODIGO_CLIENTE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CODIGO_POSTAL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_articulos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_articulos`;
CREATE TABLE `suboc_articulos`  (
  `CODIGO_ARTICULO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DESCRIPCION_ARTICULO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FAMILIA_ARTICULO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PRECIOVENTA_ARTICULO` decimal(18, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ARTICULO`) USING BTREE,
  INDEX `CODIGO`(`CODIGO_ARTICULO` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_clientes
-- ----------------------------
DROP TABLE IF EXISTS `suboc_clientes`;
CREATE TABLE `suboc_clientes`  (
  `CODIGO_CLIENTE` int(10) NOT NULL,
  `RAZONSOCIAL_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NIF_CLIENTE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `MOVIL_CLIENTE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION1_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION2_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `POBLACION_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PROVINCIA_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CPOSTAL_CLIENTE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PAIS_CLIENTE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `TIPOID_INT_CLIENTE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT '\'ID\' O \'PASAPORTE\' PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL',
  `OBSERVACIONES_CLIENTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `REFERENCIA_CLIENTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `TELEFONO_CLIENTE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PROFESION_CLIENTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FECHA_NACIMIENTO` date NULL DEFAULT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `APELLIDOS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `IBAN` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CLIENTE`) USING BTREE,
  INDEX `IDX_CLIENETS_CODIGO_CLIENTE`(`CODIGO_CLIENTE` ASC) USING BTREE,
  INDEX `IDX_CLIENTES_EMAIL`(`EMAIL_CLIENTE` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_consolidacion
-- ----------------------------
DROP TABLE IF EXISTS `suboc_consolidacion`;
CREATE TABLE `suboc_consolidacion`  (
  `ID_CONSOLIDACION` int(11) NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_FACTURA` int(8) NOT NULL,
  `REQUEST_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'ID único de la petición',
  `QUEUE_ID` int(11) NULL DEFAULT NULL COMMENT 'ID de cola del sistema',
  `ISSUER_IRS_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'NIF del emisor',
  `ISSUED_TIME` datetime NULL DEFAULT NULL COMMENT 'Fecha y hora de emisión',
  `CHAIN_NUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Número de cadena del sistema',
  `CHAIN_HASH` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Hash de la cadena blockchain',
  `VERIFACTU_URL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'URL de verificación en AEAT',
  `QRCODE_BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Código QR en base64',
  `QRCODE_PNG` blob NULL DEFAULT NULL COMMENT 'Código QR en PNG',
  `FECHA_PROCESAMIENTO` datetime NULL DEFAULT current_timestamp() COMMENT 'Fecha de procesamiento',
  `ESTADO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'PROCESADO' COMMENT 'Estado del procesamiento',
  `RESPUESTA_COMPLETA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JSON completo de respuesta del webservice' CHECK (json_valid(`RESPUESTA_COMPLETA`)),
  `PETICION_COMPLETA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'JSON completo de petición del webservice',
  PRIMARY KEY (`ID_CONSOLIDACION`) USING BTREE,
  UNIQUE INDEX `UK_FACTURA`(`SERIE_FACTURA` ASC, `NRO_FACTURA` ASC) USING BTREE,
  INDEX `IDX_REQUEST_ID`(`REQUEST_ID` ASC) USING BTREE,
  INDEX `IDX_FECHA_PROCESAMIENTO`(`FECHA_PROCESAMIENTO` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_contadores
-- ----------------------------
DROP TABLE IF EXISTS `suboc_contadores`;
CREATE TABLE `suboc_contadores`  (
  `TIPODOC_CONTADOR` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `EJERCICIO_CONTADOR` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `SERIE_CONTADOR` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CONTADOR_CONTADOR` bigint(20) NOT NULL,
  `DEFAULT_CONTADOR` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DEFSIMPL_CONTADOR` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'N',
  PRIMARY KEY (`TIPODOC_CONTADOR`, `EJERCICIO_CONTADOR`, `SERIE_CONTADOR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_cuestionario
-- ----------------------------
DROP TABLE IF EXISTS `suboc_cuestionario`;
CREATE TABLE `suboc_cuestionario`  (
  `CODIGO_CUESTIONARIO` int(10) NOT NULL,
  `FECHA_CUESTIONARIO` date NULL DEFAULT NULL,
  `CODIGO_CLIENTE` int(10) NULL DEFAULT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `APELLIDOS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CUESTIONARIO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_cuestionario_respuestas
-- ----------------------------
DROP TABLE IF EXISTS `suboc_cuestionario_respuestas`;
CREATE TABLE `suboc_cuestionario_respuestas`  (
  `CODIGO_CUESTIONARIO` int(10) NOT NULL,
  `CODIGO_PREGUNTA` int(10) NOT NULL,
  `PREGUNTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `RESPUESTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CUESTIONARIO`, `CODIGO_PREGUNTA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_dibujos_presupuestos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_dibujos_presupuestos`;
CREATE TABLE `suboc_dibujos_presupuestos`  (
  `NRO_FACTURA` int(8) NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DIBUJO_FACTURA` longblob NULL DEFAULT NULL,
  PRIMARY KEY (`NRO_FACTURA`, `SERIE_FACTURA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_dientes
-- ----------------------------
DROP TABLE IF EXISTS `suboc_dientes`;
CREATE TABLE `suboc_dientes`  (
  `iddiente` int(2) NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`iddiente`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_facturas
-- ----------------------------
DROP TABLE IF EXISTS `suboc_facturas`;
CREATE TABLE `suboc_facturas`  (
  `NRO_FACTURA` int(8) NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CODIGO_CLIENTE_FACTURA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NIF_CLIENTE_FACTURA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `MOVIL_CLIENTE_FACTURA` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `EMAIL_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION1_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION2_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `POBLACION_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PROVINCIA_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CPOSTAL_CLIENTE_FACTURA` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PAIS_CLIENTE_FACTURA` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `TIPOID_INT_CLIENTE_FACTURA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT '\'ID\' O \'PASAPORTE\' PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL',
  `FECHA_FACTURA` date NULL DEFAULT NULL,
  `TOTAL_LIQUIDO_FACTURA` decimal(18, 6) NULL DEFAULT NULL COMMENT 'Total Factura',
  `FORMA_PAGO_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Codigo Forma de Pago',
  `COMENTARIOS_FACTURA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `APELLIDOS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CONSOLIDACION_FACTURA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'N' COMMENT '\'S\' O \'N\' PARA SABER SI ESTÁ CONSOLIDADA LA FACTURA',
  `FECHA_ULT_CONSO_FACTURA` datetime NULL DEFAULT NULL COMMENT 'FECHA DE CONSOLIDACION',
  `FASE_CONSOLIDACION_FACTURA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'ONLINE, OFFLINE, VERIF1, VERIF2, ERROR_BORRADOR, ERROR_GRAVE',
  `ESSIMPL_FACTURA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'N' COMMENT '\'S\' O \'N\' PARA SABER SI ES FACTURA SIMPLIFICADA O NO',
  PRIMARY KEY (`SERIE_FACTURA`, `NRO_FACTURA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_facturas_lineas
-- ----------------------------
DROP TABLE IF EXISTS `suboc_facturas_lineas`;
CREATE TABLE `suboc_facturas_lineas`  (
  `SERIE_FACTURA_LINEA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_FACTURA_LINEA` int(8) NOT NULL,
  `LINEA_LINEA` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CODIGO_ARTICULO_LINEA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DESCRIPCION_ARTICULO_LINEA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `ZONA` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PRECIOVENTA_ARTICULO_LINEA` decimal(19, 6) NULL DEFAULT NULL,
  `CANTIDAD_LINEA` decimal(18, 6) NULL DEFAULT NULL,
  `SUM_TOTAL_LINEA` decimal(19, 6) NULL DEFAULT NULL,
  `ODONTOLOGO` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SERIE_FACTURA_LINEA`, `NRO_FACTURA_LINEA`, `LINEA_LINEA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_formapago
-- ----------------------------
DROP TABLE IF EXISTS `suboc_formapago`;
CREATE TABLE `suboc_formapago`  (
  `CODIGO_FORMAPAGO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DESCRIPCION_FORMAPAGO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `N_PLAZOS` int(10) NULL DEFAULT 1,
  `DIAS_ENTRE_PLAZOS` int(10) NULL DEFAULT 0,
  `PORCEN_ANTICIPO` decimal(5, 2) NULL DEFAULT 0.00,
  `DEFAULT_FACTURA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FORMAPAGO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_historia
-- ----------------------------
DROP TABLE IF EXISTS `suboc_historia`;
CREATE TABLE `suboc_historia`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODIGO_ARTICULO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DESCRIPCION_ARTICULO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CODIGO_CLIENTE` int(10) NOT NULL,
  `PRECIOVENTA_ARTICULO` decimal(18, 6) NULL DEFAULT NULL,
  `FECHA` date NULL DEFAULT NULL,
  `ZONA` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DESCRIPCION_HISTORIA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NRO_FACTURA` int(8) NULL DEFAULT NULL,
  `LINEA_LINEA` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `ODONTOLOGO` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CANTIDAD` decimal(18, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CODIGO_CLIENTE`(`CODIGO_CLIENTE` ASC) USING BTREE,
  INDEX `ODONTOLOGO`(`ODONTOLOGO` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8987 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_odontologos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_odontologos`;
CREATE TABLE `suboc_odontologos`  (
  `ODONTOLOGO` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NOMBRE_ODONTOLOGO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ODONTOLOGO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_paises
-- ----------------------------
DROP TABLE IF EXISTS `suboc_paises`;
CREATE TABLE `suboc_paises`  (
  `COD_PAIS` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `COD_PAIS_ALPHA3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `COD_PAIS_ALPHA2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NOMBRE_SPA_PAIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NOMBRE_ENG_PAIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `ESMIEMBRO_UE_PAIS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'S SI ES MIEMBRO DE LA UE, N CUANDO NO LO ES',
  `ORDEN_PAIS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`COD_PAIS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_param
-- ----------------------------
DROP TABLE IF EXISTS `suboc_param`;
CREATE TABLE `suboc_param`  (
  `NOMBRE_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `VALUE_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_preguntas
-- ----------------------------
DROP TABLE IF EXISTS `suboc_preguntas`;
CREATE TABLE `suboc_preguntas`  (
  `CODIGO_PREGUNTA` int(10) NULL DEFAULT NULL,
  `PREGUNTA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_presupuestos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_presupuestos`;
CREATE TABLE `suboc_presupuestos`  (
  `NRO_FACTURA` int(8) NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CODIGO_CLIENTE_FACTURA` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NIF_CLIENTE_FACTURA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `MOVIL_CLIENTE_FACTURA` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `EMAIL_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION1_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION2_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `POBLACION_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PROVINCIA_CLIENTE_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CPOSTAL_CLIENTE_FACTURA` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PAIS_CLIENTE_FACTURA` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `TIPOID_INT_CLIENTE_FACTURA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT '\'ID\' O \'PASAPORTE\' PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL',
  `FECHA_FACTURA` date NULL DEFAULT NULL,
  `TOTAL_LIQUIDO_FACTURA` decimal(18, 6) NULL DEFAULT NULL COMMENT 'Total Factura',
  `FORMA_PAGO_FACTURA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Codigo Forma de Pago',
  `COMENTARIOS_FACTURA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `NOMBRE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `APELLIDOS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SERIE_FACTURA`, `NRO_FACTURA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_presupuestos_lineas
-- ----------------------------
DROP TABLE IF EXISTS `suboc_presupuestos_lineas`;
CREATE TABLE `suboc_presupuestos_lineas`  (
  `SERIE_FACTURA_LINEA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_FACTURA_LINEA` int(8) NOT NULL,
  `LINEA_LINEA` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CODIGO_ARTICULO_LINEA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DESCRIPCION_ARTICULO_LINEA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `ZONA` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PRECIOVENTA_ARTICULO_LINEA` decimal(19, 6) NULL DEFAULT NULL,
  `CANTIDAD_LINEA` decimal(18, 6) NULL DEFAULT NULL,
  `SUM_TOTAL_LINEA` decimal(19, 6) NULL DEFAULT NULL,
  `ODONTOLOGO` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SERIE_FACTURA_LINEA`, `NRO_FACTURA_LINEA`, `LINEA_LINEA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_recibos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_recibos`;
CREATE TABLE `suboc_recibos`  (
  `NRO_FACTURA` int(8) NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_PLAZO_RECIBO` int(8) NOT NULL,
  `FORMA_PAGO_ORIGEN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FORMA_PAGO_DESCRIPCION_ORIGEN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `EUROS_RECIBO` decimal(18, 6) NULL DEFAULT NULL,
  `ESTADO_RECIBO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FECHA_EXPEDICION` date NULL DEFAULT NULL,
  `FECHA_VENCIMIENTO` date NULL DEFAULT NULL,
  `IBAN` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FECHA_PAGO` date NULL DEFAULT NULL,
  `LOCALIDAD_EXPEDICION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CODIGO_CLIENTE` int(10) NULL DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `DIRECCION1_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `POBLACION_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `PROVINCIA_CLIENTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `CPOSTAL_CLIENTE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `IMPORTE_LETRA` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `TRATAMIENTOS` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`NRO_FACTURA`, `SERIE_FACTURA`, `NRO_PLAZO_RECIBO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_verifactu_log_eventos
-- ----------------------------
DROP TABLE IF EXISTS `suboc_verifactu_log_eventos`;
CREATE TABLE `suboc_verifactu_log_eventos`  (
  `ID_LOG` bigint(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_LOG` datetime(3) NOT NULL,
  `TIPO_EVENTO_LOG` tinyint(3) UNSIGNED NOT NULL,
  `USUARIO_LOG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `VERSION_LOG` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DESCRIPCION_LOG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `DATOS_ADICIONALES_LOG` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `HASH_ANTERIOR_LOG` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `HASH_PROPIO_LOG` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `FIRMA_DIGITAL_LOG` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CREATED_AT_LOG` timestamp NULL DEFAULT current_timestamp(),
  `NRO_FACTURA_LOG` int(8) NULL DEFAULT NULL,
  `SERIE_FACTURA_LOG` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`) USING BTREE,
  INDEX `idx_timestamp`(`TIMESTAMP_LOG` ASC) USING BTREE,
  INDEX `idx_tipo_evento`(`TIPO_EVENTO_LOG` ASC) USING BTREE,
  INDEX `idx_usuario`(`USUARIO_LOG` ASC) USING BTREE,
  INDEX `idx_hash_propio`(`HASH_PROPIO_LOG` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2774 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suboc_verifactu_queue
-- ----------------------------
DROP TABLE IF EXISTS `suboc_verifactu_queue`;
CREATE TABLE `suboc_verifactu_queue`  (
  `ID_QUEUE` bigint(20) NOT NULL AUTO_INCREMENT,
  `TIPO_OPERACION` enum('CONSOLIDAR','CONSULTAR_ESTADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_FACTURA` int(8) NOT NULL,
  `FECHA_PROGRAMADA` datetime NOT NULL COMMENT 'Fecha y hora para ejecutar la operación',
  `FECHA_CREACION` datetime NOT NULL DEFAULT current_timestamp(),
  `ESTADO_COLA` enum('PENDIENTE','PROCESANDO','COMPLETADO','ERROR','CANCELADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'PENDIENTE',
  `INTENTOS` int(3) NOT NULL DEFAULT 0 COMMENT 'Número de intentos de procesamiento',
  `MAX_INTENTOS` int(3) NOT NULL DEFAULT 3 COMMENT 'Máximo número de intentos',
  `PRIORIDAD` int(3) NOT NULL DEFAULT 5 COMMENT '1=Alta, 5=Normal, 10=Baja',
  `ERROR_MESSAGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FECHA_PROCESAMIENTO` datetime NULL DEFAULT NULL COMMENT 'Fecha real de procesamiento',
  `CREADO_POR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'SYSTEM',
  `NOTAS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `VERIFACTU_QUEUE_ID` int(11) NULL DEFAULT NULL COMMENT 'QueueId devuelto por Verifactu',
  `VERIFACTU_REQUEST_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'RequestId devuelto por Verifactu',
  `RESPUESTA_VERIFACTU` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Respuesta completa de Verifactu',
  `CODIGO_ERROR_VERIFACTU` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT 'Código de error devuelto por Verifactu',
  PRIMARY KEY (`ID_QUEUE`) USING BTREE,
  INDEX `IDX_FECHA_PROGRAMADA`(`FECHA_PROGRAMADA` ASC) USING BTREE,
  INDEX `IDX_ESTADO_COLA`(`ESTADO_COLA` ASC) USING BTREE,
  INDEX `IDX_FACTURA`(`SERIE_FACTURA` ASC, `NRO_FACTURA` ASC) USING BTREE,
  INDEX `IDX_PRIORIDAD`(`PRIORIDAD` ASC) USING BTREE,
  INDEX `IDX_READY_OPERATIONS`(`ESTADO_COLA` ASC, `FECHA_PROGRAMADA` ASC, `PRIORIDAD` ASC) USING BTREE,
  INDEX `IDX_ESTADO_FECHA`(`ESTADO_COLA` ASC, `FECHA_PROGRAMADA` ASC) USING BTREE,
  INDEX `IDX_FACTURA_TIPO`(`SERIE_FACTURA` ASC, `NRO_FACTURA` ASC, `TIPO_OPERACION` ASC) USING BTREE,
  INDEX `IDX_VERIFACTU_QUEUE_ID`(`VERIFACTU_QUEUE_ID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci COMMENT = 'Cola simplificada de procesamiento para operaciones de Verifactu' ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for vu_suboc_historia
-- ----------------------------
DROP VIEW IF EXISTS `vu_suboc_historia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vu_suboc_historia` AS SELECT H.*, C.RAZONSOCIAL_CLIENTE, C.MOVIL_CLIENTE, O.NOMBRE_ODONTOLOGO, CAST(DESCRIPCION_HISTORIA as varchar(100)) AS DESHISVARCHAR FROM SUBOC_HISTORIA H
LEFT JOIN SUBOC_CLIENTES C
ON H.CODIGO_CLIENTE = C.CODIGO_CLIENTE
LEFT JOIN SUBOC_ODONTOLOGOS O 
ON H.ODONTOLOGO = O.ODONTOLOGO 
ORDER BY FECHA DESC ;

-- ----------------------------
-- View structure for v_suboc_cola_pendientes_summary
-- ----------------------------
DROP VIEW IF EXISTS `v_suboc_cola_pendientes_summary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_suboc_cola_pendientes_summary` AS SELECT 
    COUNT(*) as TOTAL_PENDIENTES,
    COUNT(CASE WHEN FECHA_PROGRAMADA <= NOW() THEN 1 END) as READY_NOW,
    COUNT(CASE WHEN ESTADO_COLA = 'PROCESANDO' THEN 1 END) as PROCESANDO,
    COUNT(CASE WHEN ESTADO_COLA = 'ERROR' THEN 1 END) as CON_ERROR
FROM suboc_verifactu_queue 
WHERE ESTADO_COLA IN ('PENDIENTE', 'PROCESANDO', 'ERROR') ;

-- ----------------------------
-- View structure for v_suboc_cola_verifactu
-- ----------------------------
DROP VIEW IF EXISTS `v_suboc_cola_verifactu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_suboc_cola_verifactu` AS SELECT 
    q.ID_QUEUE,
    q.TIPO_OPERACION,
    q.SERIE_FACTURA,
    q.NRO_FACTURA,
    q.FECHA_PROGRAMADA,
    q.FECHA_CREACION,
    q.ESTADO_COLA,
    q.INTENTOS,
    q.MAX_INTENTOS,
    q.PRIORIDAD,
    q.ERROR_MESSAGE,
    q.FECHA_PROCESAMIENTO,
    q.CREADO_POR,
    q.NOTAS,
    q.VERIFACTU_QUEUE_ID,
    q.VERIFACTU_REQUEST_ID,
    q.RESPUESTA_VERIFACTU,
    q.CODIGO_ERROR_VERIFACTU,
    f.RAZONSOCIAL_CLIENTE_FACTURA,
    f.TOTAL_LIQUIDO_FACTURA,
    f.CONSOLIDACION_FACTURA,
    f.FASE_CONSOLIDACION_FACTURA,
    CASE 
        WHEN q.FECHA_PROGRAMADA <= NOW() THEN 'READY'
        ELSE 'WAITING'
    END AS STATUS_EJECUCION,
    TIMESTAMPDIFF(SECOND, NOW(), q.FECHA_PROGRAMADA) AS SEGUNDOS_RESTANTES,
    CASE q.ESTADO_COLA
        WHEN 'PENDIENTE' THEN 1
        WHEN 'PROCESANDO' THEN 2
        WHEN 'COMPLETADO' THEN 3
        WHEN 'ERROR' THEN 4
        WHEN 'CANCELADO' THEN 5
        ELSE 6
    END AS ORDEN_ESTADO,
    CASE 
        WHEN q.CODIGO_ERROR_VERIFACTU IS NOT NULL THEN 
            CONCAT('ERROR VERIFACTU [', q.CODIGO_ERROR_VERIFACTU, ']')
        WHEN q.ERROR_MESSAGE IS NOT NULL THEN 
            CONCAT('ERROR SISTEMA: ', LEFT(q.ERROR_MESSAGE, 50))
        ELSE 'SIN ERRORES'
    END AS TIPO_ERROR
FROM suboc_verifactu_queue q
LEFT JOIN suboc_facturas f ON q.SERIE_FACTURA = f.SERIE_FACTURA 
                          AND q.NRO_FACTURA = f.NRO_FACTURA
ORDER BY q.PRIORIDAD ASC, q.FECHA_PROGRAMADA ASC ;

-- ----------------------------
-- View structure for v_suboc_facturas
-- ----------------------------
DROP VIEW IF EXISTS `v_suboc_facturas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_suboc_facturas` AS SELECT 
 F.NRO_FACTURA
,F.SERIE_FACTURA
,F.CODIGO_CLIENTE_FACTURA
,F.RAZONSOCIAL_CLIENTE_FACTURA
,F.NIF_CLIENTE_FACTURA
,F.MOVIL_CLIENTE_FACTURA
,F.EMAIL_CLIENTE_FACTURA
,F.DIRECCION1_CLIENTE_FACTURA
,F.DIRECCION2_CLIENTE_FACTURA
,F.POBLACION_CLIENTE_FACTURA
,F.PROVINCIA_CLIENTE_FACTURA
,F.CPOSTAL_CLIENTE_FACTURA
,F.PAIS_CLIENTE_FACTURA
,F.TIPOID_INT_CLIENTE_FACTURA
,F.FECHA_FACTURA
,F.TOTAL_LIQUIDO_FACTURA
,F.FORMA_PAGO_FACTURA
,F.COMENTARIOS_FACTURA
,F.NOMBRE
,F.APELLIDOS
,F.CONSOLIDACION_FACTURA
,C.REQUEST_ID
,C.QUEUE_ID
,C.ISSUER_IRS_ID
,C.ISSUED_TIME
,C.CHAIN_NUMBER
,C.CHAIN_HASH
,C.VERIFACTU_URL
,C.QRCODE_BASE64
,C.QRCODE_PNG
,C.FECHA_PROCESAMIENTO
,C.ESTADO
,C.RESPUESTA_COMPLETA
,C.PETICION_COMPLETA
,P.NOMBRE_SPA_PAIS
       FROM suboc_facturas F 
 INNER JOIN suboc_consolidacion C 
         ON F.NRO_FACTURA = C.NRO_FACTURA
        AND F.SERIE_FACTURA = C.SERIE_FACTURA 
        
 INNER JOIN suboc_paises P 
         ON F.PAIS_CLIENTE_FACTURA = P.COD_PAIS_ALPHA2 ;

-- ----------------------------
-- View structure for v_suboc_presupuestos
-- ----------------------------
DROP VIEW IF EXISTS `v_suboc_presupuestos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_suboc_presupuestos` AS SELECT 
 F.NRO_FACTURA
,F.SERIE_FACTURA
,F.CODIGO_CLIENTE_FACTURA
,F.RAZONSOCIAL_CLIENTE_FACTURA
,F.NIF_CLIENTE_FACTURA
,F.MOVIL_CLIENTE_FACTURA
,F.EMAIL_CLIENTE_FACTURA
,F.DIRECCION1_CLIENTE_FACTURA
,F.DIRECCION2_CLIENTE_FACTURA
,F.POBLACION_CLIENTE_FACTURA
,F.PROVINCIA_CLIENTE_FACTURA
,F.CPOSTAL_CLIENTE_FACTURA
,F.PAIS_CLIENTE_FACTURA
,F.FECHA_FACTURA
,F.TOTAL_LIQUIDO_FACTURA
,F.FORMA_PAGO_FACTURA
,F.COMENTARIOS_FACTURA
,F.NOMBRE
,F.APELLIDOS
,C.DIBUJO_FACTURA
       FROM suboc_presupuestos F 
 INNER JOIN suboc_dibujos_presupuestos C 
         ON F.NRO_FACTURA = C.NRO_FACTURA
        AND F.SERIE_FACTURA = C.SERIE_FACTURA ;

-- ----------------------------
-- Function structure for FNC_BUSCAR_POR_VERIFACTU_QUEUE_ID
-- ----------------------------
DROP FUNCTION IF EXISTS `FNC_BUSCAR_POR_VERIFACTU_QUEUE_ID`;
delimiter ;;
CREATE FUNCTION `FNC_BUSCAR_POR_VERIFACTU_QUEUE_ID`(pQueueId INT)
 RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
  READS SQL DATA 
  DETERMINISTIC
BEGIN
    DECLARE vFactura VARCHAR(100) DEFAULT '';
    
    SELECT CONCAT(SERIE_FACTURA, '/', NRO_FACTURA) 
    INTO vFactura
    FROM suboc_verifactu_queue 
    WHERE VERIFACTU_QUEUE_ID = pQueueId
    LIMIT 1;
    
    RETURN COALESCE(vFactura, 'NO ENCONTRADA');
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FNC_GET_NEXT_LINEA_FACTURA
-- ----------------------------
DROP FUNCTION IF EXISTS `FNC_GET_NEXT_LINEA_FACTURA`;
delimiter ;;
CREATE FUNCTION `FNC_GET_NEXT_LINEA_FACTURA`(pnumfac varchar(8), 
                                             pserie varchar(8))
 RETURNS varchar(3) CHARSET utf8mb3 COLLATE utf8mb3_spanish_ci
BEGIN
 DECLARE ppresul varchar(3);
 DECLARE pnextnum varchar(3);
 SET pnextnum = (select lpad((max(LINEA_LINEA)+10),3,'0' ) 
                   from suboc_facturas_lineas 
                  where NRO_FACTURA_LINEA = pnumfac 
                    AND SERIE_FACTURA_LINEA = pserie);
 IF (pnextnum IS NULL) THEN
   SET ppresul = '010';
 ELSE
   SET ppresul = pnextnum;
 END IF;
 RETURN ppresul;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FNC_GET_NEXT_LINEA_PRESUPUESTO
-- ----------------------------
DROP FUNCTION IF EXISTS `FNC_GET_NEXT_LINEA_PRESUPUESTO`;
delimiter ;;
CREATE FUNCTION `FNC_GET_NEXT_LINEA_PRESUPUESTO`(pnumfac varchar(8), 
                                             pserie varchar(8))
 RETURNS varchar(3) CHARSET utf8mb3 COLLATE utf8mb3_spanish_ci
BEGIN
 DECLARE ppresul varchar(3);
 DECLARE pnextnum varchar(3);
 SET pnextnum = (select lpad((max(LINEA_LINEA)+10),3,'0' ) 
                   from suboc_presupuestos_lineas 
                  where NRO_FACTURA_LINEA = pnumfac 
                    AND SERIE_FACTURA_LINEA = pserie);
 IF (pnextnum IS NULL) THEN
   SET ppresul = '010';
 ELSE
   SET ppresul = pnextnum;
 END IF;
 RETURN ppresul;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GET_NEXT_CONT
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_NEXT_CONT`;
delimiter ;;
CREATE PROCEDURE `GET_NEXT_CONT`(IN pTipoDoc varchar(2), OUT pcont int)
BEGIN
START TRANSACTION;
    IF( (EXISTS(
             SELECT *
               FROM suboc_contadores 
              WHERE SERIE_CONTADOR = '-' 
                AND TIPODOC_CONTADOR = pTipoDoc ) ) ) THEN
	BEGIN
	 UPDATE suboc_contadores 
	    SET CONTADOR_CONTADOR = CONTADOR_CONTADOR + 1
	  WHERE SERIE_CONTADOR = '-' 
      AND TIPODOC_CONTADOR = pTipoDoc;
	SET pcont = (SELECT CONTADOR_CONTADOR - 1 
                 from suboc_contadores 
                where SERIE_CONTADOR = '-' 
                  and TIPODOC_CONTADOR = pTipoDoc LIMIT 1);
	END;
  ELSE
  BEGIN
    SET pcont = 1;
    INSERT INTO suboc_contadores
    (TIPODOC_CONTADOR, CONTADOR_CONTADOR, SERIE_CONTADOR, EJERCICIO_CONTADOR) 
    VALUES
    (pTipoDoc, 1, '-', '-');
  END;
  END IF;
COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GET_NEXT_CONT_FACT_SERIE
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_NEXT_CONT_FACT_SERIE`;
delimiter ;;
CREATE PROCEDURE `GET_NEXT_CONT_FACT_SERIE`(IN pserie varchar(10), IN pTipoDoc varchar(2), OUT pcont int)
BEGIN
START TRANSACTION;
	 UPDATE suboc_contadores 
	    SET CONTADOR_CONTADOR = CONTADOR_CONTADOR + 1
	  WHERE SERIE_CONTADOR = pserie 
      AND TIPODOC_CONTADOR = pTipoDoc;
	SET pcont = (SELECT CONTADOR_CONTADOR - 1 
                 from suboc_contadores 
                where SERIE_CONTADOR = pserie 
                  and TIPODOC_CONTADOR = pTipoDoc LIMIT 1);
COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for GET_NUMEROS_A_LETRAS
-- ----------------------------
DROP FUNCTION IF EXISTS `GET_NUMEROS_A_LETRAS`;
delimiter ;;
CREATE FUNCTION `GET_NUMEROS_A_LETRAS`(NUMERO DECIMAL(12,2))
 RETURNS varchar(200) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
BEGIN
	DECLARE MILLARES INT;
	DECLARE CENTENAS INT;
	DECLARE CENTIMOS INT;
	DECLARE CENTIMO_AUX VARCHAR(200);
	DECLARE CENTIMO_AUX_CON VARCHAR(200);
	DECLARE MIL_AUX VARCHAR(200);
	DECLARE EN_LETRAS VARCHAR(200);
	DECLARE ENTERO INT;
	DECLARE AUX VARCHAR(15);
	DECLARE PRUEBA VARCHAR(200);
	
	SET EN_LETRAS = '';
	SET CENTIMO_AUX_CON = '';
	SET ENTERO = TRUNCATE(NUMERO,0);
	SET MILLARES = TRUNCATE(ENTERO / 1000,0);
	SET CENTENAS = ENTERO MOD 1000;
	SET CENTIMOS = (TRUNCATE(NUMERO,2) * 100) MOD 100;
	
	IF ((MILLARES = 1)) THEN
		SET EN_LETRAS = 'MIL ';
	ELSE 
		IF (MILLARES > 0) THEN
				SET EN_LETRAS = CONCAT(EN_LETRAS , GET_NUMERO_MENOR_MIL(MILLARES) ,'MIL ');
				SET EN_LETRAS = REPLACE(EN_LETRAS,'UNO ','UN ');
		END IF;
	END IF;
	
	IF ((CENTENAS > 0) OR ((ENTERO = 0) AND (CENTIMOS = 0))) THEN
		BEGIN
			SET EN_LETRAS = CONCAT(EN_LETRAS, GET_NUMERO_MENOR_MIL(CENTENAS));			
		END;
	END IF;
	IF (CENTIMOS > 0) THEN
	BEGIN
		IF (CENTIMOS = 1) THEN
			SET  AUX = 'CÉNTIMO ';
		ELSE
			SET AUX = 'CÉNTIMOS ';
		END IF;	
		IF (CENTIMOS > 0) THEN
			SET CENTIMO_AUX = GET_NUMERO_MENOR_MIL(CENTIMOS);
			SET CENTIMO_AUX = REPLACE(CENTIMO_AUX,'UNO ','UN '); 
			IF ENTERO <> 0 THEN 
			  SET CENTIMO_AUX_CON = 'CON ' ; 
			END IF;
			SET EN_LETRAS = CONCAT(EN_LETRAS, CENTIMO_AUX_CON, CENTIMO_AUX , AUX);
		ELSE
			SET EN_LETRAS = CONCAT(EN_LETRAS, CENTIMO_AUX, AUX);		
		END IF;
	END;
	END IF;
	RETURN(EN_LETRAS);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for GET_NUMERO_MENOR_MIL
-- ----------------------------
DROP FUNCTION IF EXISTS `GET_NUMERO_MENOR_MIL`;
delimiter ;;
CREATE FUNCTION `GET_NUMERO_MENOR_MIL`(NUMERO DECIMAL(4))
 RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
BEGIN
       DECLARE CENTENAS INT;
       DECLARE DECENAS INT;
       DECLARE UNIDADES INT;
       DECLARE EN_LETRAS VARCHAR(100);
       DECLARE UNIR VARCHAR(2);
			 SET EN_LETRAS = '';
        IF (NUMERO = 100) THEN
            RETURN ('CIEN ');
        ELSEIF NUMERO = 0 THEN
            RETURN ('CERO ');
        ELSEIF NUMERO = 1 THEN
            RETURN ('UNO ');
        ELSE
            SET CENTENAS = TRUNCATE(NUMERO / 100,0);
            SET DECENAS  = TRUNCATE((NUMERO MOD 100)/10,0);
            SET UNIDADES = NUMERO MOD 10;
            SET UNIR = 'Y ';
            
						IF CENTENAS = 1 THEN
                SET EN_LETRAS = 'CIENTO ';
            ELSEIF CENTENAS = 2 THEN
                SET EN_LETRAS = 'DOSCIENTOS ';
            ELSEIF CENTENAS = 3 THEN
                SET EN_LETRAS = 'TRESCIENTOS ';
            ELSEIF CENTENAS = 4 THEN
                SET EN_LETRAS = 'CUATROCIENTOS ';
            ELSEIF CENTENAS = 5 THEN
                SET EN_LETRAS = 'QUINIENTOS ';
            ELSEIF CENTENAS = 6 THEN
                SET EN_LETRAS = 'SEISCIENTOS ';
            ELSEIF CENTENAS = 7 THEN
                SET EN_LETRAS = 'SETECIENTOS ';
            ELSEIF CENTENAS = 8 THEN
                SET EN_LETRAS = 'OCHOCIENTOS ';
            ELSEIF CENTENAS = 9 THEN
                SET EN_LETRAS = 'NOVECIENTOS ';
            END IF;
            
						IF DECENAS = 3 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'TREINTA ');
            ELSEIF DECENAS = 4 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'CUARENTA ');
            ELSEIF DECENAS = 5 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'CINCUENTA ');
            ELSEIF DECENAS = 6 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'SESENTA ');
            ELSEIF DECENAS = 7 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'SETENTA ');
            ELSEIF DECENAS = 8 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'OCHENTA ');
            ELSEIF DECENAS = 9 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'NOVENTA ');
            ELSEIF DECENAS = 1 THEN
                IF UNIDADES < 6 THEN
                    IF UNIDADES = 0 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'DIEZ ');
                    ELSEIF UNIDADES = 1 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'ONCE ');
                    ELSEIF UNIDADES = 2 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'DOCE ');
                    ELSEIF UNIDADES = 3 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'TRECE ');
                    ELSEIF UNIDADES = 4 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'CATORCE ');
                    ELSEIF UNIDADES = 5 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'QUINCE ');
                    END IF;
                    SET UNIDADES = 0;
                ELSE
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'DIECI');
                    SET UNIR = '';
                END IF;
            ELSEIF (DECENAS = 2) THEN
                IF (UNIDADES = 0) THEN
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'VEINTE ');
                ELSE
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'VEINTI');
                END IF;
                SET UNIR = '';
            ELSEIF (DECENAS = 0) THEN
                SET UNIR = '';
            END IF;
						
            IF (UNIDADES = 1) THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'UNO ');
            ELSEIF UNIDADES = 2 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'DOS ');
            ELSEIF UNIDADES = 3 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'TRES ');
            ELSEIF UNIDADES = 4 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'CUATRO ');
            ELSEIF UNIDADES = 5 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'CINCO ');
            ELSEIF UNIDADES = 6 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'SEIS ');
            ELSEIF UNIDADES = 7 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'SIETE ');
            ELSEIF UNIDADES = 8 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'OCHO ');
            ELSEIF UNIDADES = 9 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , UNIR , 'NUEVE ');
            END IF;
        END IF;
        RETURN(EN_LETRAS);
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CALCULAR_FACTURA
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CALCULAR_FACTURA`;
delimiter ;;
CREATE PROCEDURE `PRC_CALCULAR_FACTURA`(IN `pidseriefactura` varchar(200),
	IN `pidnumfactura` varchar(200))
BEGIN
  DECLARE suma_total decimal(18,6);
  START TRANSACTION;
  SET suma_total = (SELECT SUM(SUM_TOTAL_LINEA) FROM suboc_facturas_lineas WHERE NRO_FACTURA_LINEA=pidnumfactura AND SERIE_FACTURA_LINEA = pidseriefactura);
  UPDATE suboc_facturas 
	    SET TOTAL_LIQUIDO_FACTURA = suma_total
		WHERE NRO_FACTURA = pidnumfactura
		  AND SERIE_FACTURA = pidseriefactura;			
	COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CALCULAR_PRESUPUESTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CALCULAR_PRESUPUESTO`;
delimiter ;;
CREATE PROCEDURE `PRC_CALCULAR_PRESUPUESTO`(IN `pidseriefactura` varchar(200),
	IN `pidnumfactura` varchar(200))
BEGIN
  DECLARE suma_total decimal(18,6);
  START TRANSACTION;
  SET suma_total = (SELECT SUM(SUM_TOTAL_LINEA) FROM suboc_presupuestos_lineas WHERE NRO_FACTURA_LINEA=pidnumfactura AND SERIE_FACTURA_LINEA = pidseriefactura);
  UPDATE suboc_presupuestos 
	    SET TOTAL_LIQUIDO_FACTURA = suma_total
		WHERE NRO_FACTURA = pidnumfactura
		  AND SERIE_FACTURA = pidseriefactura;			
	COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_ACTUALIZAR_CLIENTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_CLIENTE`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_ACTUALIZAR_CLIENTE`(IN `pCODIGO_CLIENTE` int(10),
	IN `pRAZONSOCIAL_CLIENTE` varchar(200),
	IN `pNOMBRE` varchar(100),
	IN `pAPELLIDOS` varchar(100),
	IN `pNIF_CLIENTE` varchar(50),
	IN `pMOVIL_CLIENTE` varchar(40),
	IN `pEMAIL_CLIENTE` varchar(200),
	IN `pDIRECCION1_CLIENTE` varchar(200),
	IN `pDIRECCION2_CLIENTE` varchar(200),
	IN `pPOBLACION_CLIENTE` varchar(200),
	IN `pPROVINCIA_CLIENTE` varchar(200),
	IN `pCPOSTAL_CLIENTE` varchar(15),
	IN `pPAIS_CLIENTE` varchar(150),
  IN `pTIPOID_INT_CLIENTE` varchar(150))
BEGIN
START TRANSACTION;
 IF( EXISTS(
             SELECT *
             FROM suboc_clientes
             WHERE `CODIGO_CLIENTE` =  pcodigo_cliente) ) THEN
	BEGIN
	  UPDATE suboc_clientes
	    SET     RAZONSOCIAL_CLIENTE   = pRAZONSOCIAL_CLIENTE ,
					NIF_CLIENTE           = pNIF_CLIENTE         ,
					NOMBRE                = pNOMBRE              , 
					APELLIDOS			  = pAPELLIDOS           , 
					MOVIL_CLIENTE         = pMOVIL_CLIENTE       ,
					EMAIL_CLIENTE         = pEMAIL_CLIENTE       ,
					DIRECCION1_CLIENTE    = pDIRECCION1_CLIENTE  ,
					DIRECCION2_CLIENTE    = pDIRECCION2_CLIENTE  ,
					POBLACION_CLIENTE     = pPOBLACION_CLIENTE   ,
					PROVINCIA_CLIENTE     = pPROVINCIA_CLIENTE   ,
					CPOSTAL_CLIENTE       = pCPOSTAL_CLIENTE     ,
					PAIS_CLIENTE          = pPAIS_CLIENTE        ,
          TIPOID_INT_CLIENTE    = pTIPOID_INT_CLIENTE
		WHERE CODIGO_cliente = pCODIGO_CLIENTE;
	END;
	ELSE
	BEGIN
	  INSERT INTO suboc_clientes (CODIGO_CLIENTE,
											NOMBRE,
											APELLIDOS,
											RAZONSOCIAL_CLIENTE,
											NIF_CLIENTE,
											MOVIL_CLIENTE,
											EMAIL_CLIENTE,
											DIRECCION1_CLIENTE,
											DIRECCION2_CLIENTE,
											POBLACION_CLIENTE,
											PROVINCIA_CLIENTE,
											CPOSTAL_CLIENTE,
											PAIS_CLIENTE,
                      TIPOID_INT_CLIENTE) VALUES
												     (pCODIGO_CLIENTE,
														pNOMBRE,
														pAPELLIDOS,
														pRAZONSOCIAL_CLIENTE,
														pNIF_CLIENTE,
														pMOVIL_CLIENTE,
														pEMAIL_CLIENTE,
														pDIRECCION1_CLIENTE,
														pDIRECCION2_CLIENTE,
														pPOBLACION_CLIENTE,
														pPROVINCIA_CLIENTE,
														pCPOSTAL_CLIENTE,
														pPAIS_CLIENTE,
                            pTIPOID_INT_CLIENTE);
	END;
  END IF;
	COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_ACTUALIZAR_HISTORIA_FACTURA`(IN  `pID_HISTORIA` bigint,
	IN  `pSERIEin` varchar(4),
	IN  `pFECHAin` date,
	IN  `PFacturain` int,
	OUT `pNroFactura` int,
	OUT `pNroLinea` varchar(3))
BEGIN
	DECLARE  `pRAZONSOCIAL_CLIENTE` varchar(200);
	DECLARE  `pNOMBRE` varchar(100);
	DECLARE  `pAPELLIDOS` varchar(100);
	DECLARE  `pNIF_CLIENTE` varchar(50);
	DECLARE  `pMOVIL_CLIENTE` varchar(40);
	DECLARE  `pEMAIL_CLIENTE` varchar(200);
	DECLARE  `pDIRECCION1_CLIENTE` varchar(200);
	DECLARE  `pDIRECCION2_CLIENTE` varchar(200);
	DECLARE  `pPOBLACION_CLIENTE` varchar(200);
	DECLARE  `pPROVINCIA_CLIENTE` varchar(200);
	DECLARE  `pCPOSTAL_CLIENTE` varchar(15);
	DECLARE  `pPAIS_CLIENTE` varchar(150);
	DECLARE  `pODONTOLOGO` varchar(8);
	DECLARE  `pPRECIO_VENTA_ARTICULO` decimal(18,6); 
	DECLARE  `pCODIGO_ARTICULO` varchar(20);
	DECLARE  `pZONA` varchar(60);
	DECLARE  `pDESCRIPCION_ARTICULO` varchar(100);
	DECLARE  `pCANTIDAD` int;
	DECLARE  `pCODIGO_CLIENTE` int(10);
	
	START TRANSACTION;
	SELECT CODIGO_CLIENTE,
	       ODONTOLOGO,
	       PRECIOVENTA_ARTICULO,
				 CODIGO_ARTICULO,
				 DESCRIPCION_ARTICULO,
				 ZONA,
				 CANTIDAD
		 INTO
		    `pCODIGO_CLIENTE`,
				`pODONTOLOGO`,
				`pPRECIO_VENTA_ARTICULO`,
				`pCODIGO_ARTICULO`,
				`pDESCRIPCION_ARTICULO`,
				`pZONA`,
				`pCANTIDAD`
		FROM suboc_historia
	WHERE ID = `pID_HISTORIA`;
	SET @SerieFactura = pSERIEin;
	SET @pFecha = pFECHAin;
IF( NOT( EXISTS(
             SELECT *
               FROM suboc_facturas
              WHERE (`CODIGO_CLIENTE_FACTURA` =  pcodigo_cliente
						          AND  `FECHA_FACTURA`= @pFecha
						          AND  `SERIE_FACTURA` = @SerieFactura)		))) THEN
	BEGIN
		IF ((pFACTURAin = 0) AND ( NOT (EXISTS ( SELECT *
                                                  FROM suboc_facturas
												 WHERE NRO_FACTURA = pFACTURAin)))) THEN
	  BEGIN
		  CALL GET_NEXT_CONT_FACT_SERIE(@SerieFactura, 'FC', @cont); 
	  END;
	  ELSE
	  BEGIN	
		  SET @cont = pFACTURAin;
	  END;
	END IF;
	  SELECT  `RAZONSOCIAL_CLIENTE` 	
		       ,`NOMBRE` 				
		       ,`APELLIDOS` 			
		       ,`NIF_CLIENTE` 			
		       ,`MOVIL_CLIENTE` 		
		       ,`EMAIL_CLIENTE` 		
		       ,`DIRECCION1_CLIENTE` 	
		       ,`DIRECCION2_CLIENTE` 	
		       ,`POBLACION_CLIENTE` 	
		       ,`PROVINCIA_CLIENTE` 	
		       ,`PAIS_CLIENTE` 		
		       ,`CPOSTAL_CLIENTE` 		
		  INTO  `pRAZONSOCIAL_CLIENTE` 	
			     ,`pNOMBRE` 				
			     ,`pAPELLIDOS` 			
			     ,`pNIF_CLIENTE` 			
			     ,`pMOVIL_CLIENTE` 		
			     ,`pEMAIL_CLIENTE` 		
			     ,`pDIRECCION1_CLIENTE` 	
			     ,`pDIRECCION2_CLIENTE` 	
			     ,`pPOBLACION_CLIENTE` 	
			     ,`pPROVINCIA_CLIENTE` 	
			     ,`pPAIS_CLIENTE` 		
			     ,`pCPOSTAL_CLIENTE` 			            
			 FROM suboc_clientes
		WHERE CODIGO_cliente = pCODIGO_CLIENTE;
		INSERT INTO suboc_facturas (    `NRO_FACTURA` 							
																		,`SERIE_FACTURA` 
																		,`CODIGO_CLIENTE_FACTURA` 
																		,`RAZONSOCIAL_CLIENTE_FACTURA` 
																		,`NIF_CLIENTE_FACTURA` 
																		,`MOVIL_CLIENTE_FACTURA` 
																		,`EMAIL_CLIENTE_FACTURA` 
																		,`DIRECCION1_CLIENTE_FACTURA` 
																		,`DIRECCION2_CLIENTE_FACTURA` 
																		,`POBLACION_CLIENTE_FACTURA` 
																		,`PROVINCIA_CLIENTE_FACTURA` 
																		,`CPOSTAL_CLIENTE_FACTURA` 
																		,`PAIS_CLIENTE_FACTURA` 
																		,`FECHA_FACTURA` 
																		,`TOTAL_LIQUIDO_FACTURA` 
																		,`FORMA_PAGO_FACTURA` 
																		,`COMENTARIOS_FACTURA` 
																		,`NOMBRE` 
																		,`APELLIDOS` 
															) VALUES 
															(   @cont
																 ,@SerieFactura
																 ,`pCODIGO_CLIENTE`
															   ,`pRAZONSOCIAL_CLIENTE` 	 
															   ,`pNIF_CLIENTE` 			
															   ,`pMOVIL_CLIENTE` 		
															   ,`pEMAIL_CLIENTE` 		
															   ,`pDIRECCION1_CLIENTE` 
															   ,`pDIRECCION2_CLIENTE` 
															   ,`pPOBLACION_CLIENTE` 	
                                 ,`pPROVINCIA_CLIENTE` 	
		                             ,`pCPOSTAL_CLIENTE`
																 ,`pPAIS_CLIENTE` 		
		                             ,@pFecha
		                             ,0
																 ,'TARJETA'	
																 ,''
																 ,`pNOMBRE` 				
															   ,`pAPELLIDOS` 			
															 );
	END;
	ELSE
	  BEGIN
	    SELECT NRO_FACTURA
			  INTO @cont	
				FROM suboc_facturas
			 WHERE `CODIGO_CLIENTE_FACTURA` =  pcodigo_cliente
				 AND `FECHA_FACTURA`= @pFecha
				 AND `SERIE_FACTURA` = @SerieFactura
			ORDER BY NRO_FACTURA DESC
			LIMIT 1;
    END;
  END IF;
	SET pNroFactura = @cont;
  IF ((pCANTIDAD = 0) OR (pCANTIDAD IS NULL)) THEN 
	  SET pCANTIDAD = 1;
  END IF;
	SET @nrolinea = (SELECT `FNC_GET_NEXT_LINEA_FACTURA`(@cont, @SerieFactura));
	SET pNroLinea = @nrolinea;
	INSERT INTO suboc_facturas_lineas (   `SERIE_FACTURA_LINEA` 
																				,`NRO_FACTURA_LINEA` 
																				,`LINEA_LINEA` 
																				,`CODIGO_ARTICULO_LINEA` 
																				,`DESCRIPCION_ARTICULO_LINEA` 
																				,`ZONA` 
																				,`PRECIOVENTA_ARTICULO_LINEA` 
																				,`CANTIDAD_LINEA` 
																				,`SUM_TOTAL_LINEA` 
																				,`ODONTOLOGO` 
																		) VALUES 
																		(  @SerieFactura
																		  ,@cont
																		  ,@nrolinea
																			,`pCODIGO_ARTICULO`
																			,`pDESCRIPCION_ARTICULO`
																			,`pZONA`
																			,`pPRECIO_VENTA_ARTICULO`
																			,`pCANTIDAD`
																			,`pPRECIO_VENTA_ARTICULO`*`pCANTIDAD`
																			,`pODONTOLOGO`
																		);
	CALL `PRC_CALCULAR_FACTURA`(@SerieFactura, @cont);
	UPDATE suboc_historia
	   SET NRO_FACTURA = @cont,
				 SERIE_FACTURA = @SerieFactura,
				 LINEA_LINEA = @nrolinea
	 WHERE ID = `pID_HISTORIA`;
	COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_FACTURA_ABONO
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_ABONO`;
delimiter ;;
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
												`APELLIDOS`)
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
												`APELLIDOS`
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_FACTURA_DUPLICADA
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_DUPLICADA`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_FACTURA_DUPLICADA`(IN `pidseriefactura` varchar(200),
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
												`APELLIDOS`)
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
												@pfecha,
												`TOTAL_LIQUIDO_FACTURA`,
												`FORMA_PAGO_FACTURA`,
												`NOMBRE`,
												`APELLIDOS`
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
									`CANTIDAD_LINEA`,
									`SUM_TOTAL_LINEA`
							  FROM suboc_facturas_lineas 
							 WHERE `SERIE_FACTURA_LINEA` = pidseriefactura  
							   AND `NRO_FACTURA_LINEA` = pidnumfactura;
		COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_FACTURA_PRESUPUESTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_PRESUPUESTO`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_FACTURA_PRESUPUESTO`(IN `pidseriepresupuesto` varchar(200),
	IN `pidnumpresupuesto` varchar(200),
	IN `pidseriefactura` varchar(200),
	IN `pfechafactura` date,
	IN `pidnumfactura` varchar(200),
	OUT `pidresulnumfac` varchar(200))
BEGIN
   DECLARE contadorped varchar(200);
  
	 IF pidnumfactura = 0 THEN
     CALL GET_NEXT_CONT_FACT_SERIE(pidseriefactura, 'FC', @cont);
		 SET pidresulnumfac = @cont;	   
     SET pidnumfactura = @cont;
	 END IF;
   SET @pFecha = (SELECT DATE_FORMAT(pfechafactura, '%Y-%m-%d'));
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
												  `APELLIDOS`)
						      SELECT   pidnumfactura,
												   pidseriefactura,
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
												  @pfecha,
												  `TOTAL_LIQUIDO_FACTURA`,
												  `FORMA_PAGO_FACTURA`,
													`NOMBRE`,
												  `APELLIDOS`
										FROM   suboc_presupuestos 
										WHERE `NRO_FACTURA` = pidnumpresupuesto 
										AND     `SERIE_FACTURA` = pidseriepresupuesto;	
										
							INSERT INTO  suboc_facturas_lineas (`SERIE_FACTURA_LINEA`,
													`NRO_FACTURA_LINEA`,
													`LINEA_LINEA`,
													`CODIGO_ARTICULO_LINEA`,
													`DESCRIPCION_ARTICULO_LINEA`,
													`PRECIOVENTA_ARTICULO_LINEA`,
													`CANTIDAD_LINEA`,
													`SUM_TOTAL_LINEA`)
									SELECT 	 pidseriefactura,
													 pidnumfactura,
													`LINEA_LINEA`,
													`CODIGO_ARTICULO_LINEA`,
													`DESCRIPCION_ARTICULO_LINEA`,
													`PRECIOVENTA_ARTICULO_LINEA`,
													`CANTIDAD_LINEA`,
													`SUM_TOTAL_LINEA`
										  FROM suboc_presupuestos_lineas
										 WHERE `SERIE_FACTURA_LINEA` = pidseriepresupuesto  
											 AND `NRO_FACTURA_LINEA` = pidnumpresupuesto;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_RECIBOS_FACTURA
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_RECIBOS_FACTURA`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_RECIBOS_FACTURA`(IN `pSERIE_FACTURA` varchar(8),
	                                                                         IN `pNRO_FACTURA` int(8))
BEGIN
  DECLARE pCODIGO_FORMAPAGO VARCHAR(10);
	DECLARE pFORMA_PAGO_FACTURA VARCHAR(100);
	DECLARE pN_PLAZOS int(10); 
	DECLARE I int(10);
	DECLARE pDIAS_ENTRE_PLAZOS int(10);
	DECLARE pPORCEN_ANTICIPO decimal(5,2);
	DECLARE pCODIGO_CLIENTE  int(10);
	DECLARE pIBAN varchar(34);
	DECLARE pRAZONSOCIAL_CLIENTE varchar(200);
	DECLARE pDIRECCION1_CLIENTE  varchar(200);
	DECLARE pPOBLACION_CLIENTE  varchar(200);
	DECLARE pPROVINCIA_CLIENTE  varchar(200);
	DECLARE pCPOSTAL_CLIENTE  varchar(15);
	DECLARE pIMPORTE_LETRA  varchar(150);
	DECLARE pTOTAL_LIQUIDO_FACTURA decimal(18,6);
	DECLARE pIMPORTE_RECIBO decimal(18,6);
	DECLARE pIMPORTE_RESTO decimal(18,6);
	DECLARE pIMPORTE_ANTICIPO decimal(18,6);
	DECLARE pFECHA_VENCIMIENTO date;
	DECLARE pFECHA_FACTURA date;
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE pTRATAMIENTO_LINEA VARCHAR(100);
  DECLARE pTRATAMIENTOS varchar(1000) DEFAULT "";
  DECLARE curTratamientos 
        CURSOR FOR 
            SELECT DESCRIPCION_ARTICULO_LINEA 
						  FROM suboc_facturas_lineas 
						 WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
						   AND NRO_FACTURA_LINEA = pNRO_FACTURA;
  DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
	START TRANSACTION;
	DELETE FROM suboc_recibos 
   WHERE NRO_FACTURA = pNRO_FACTURA
	   AND SERIE_FACTURA = pSERIE_FACTURA;	
  OPEN curTratamientos;
  getTratamientos: LOOP
		FETCH curTratamientos INTO pTRATAMIENTO_LINEA;
		IF finished = 1 THEN 
				LEAVE getTratamientos;
		END IF;
		-- build email list
		SET pTRATAMIENTOS = CONCAT(pTRATAMIENTOS,'\n',pTRATAMIENTO_LINEA);
  END LOOP getTratamientos;
	
	SELECT FORMA_PAGO_FACTURA, 
				 CODIGO_CLIENTE_FACTURA,
				 TOTAL_LIQUIDO_FACTURA,
				 RAZONSOCIAL_CLIENTE_FACTURA,
				 DIRECCION1_CLIENTE_FACTURA,
				 POBLACION_CLIENTE_FACTURA,
				 PROVINCIA_CLIENTE_FACTURA,
				 CPOSTAL_CLIENTE_FACTURA,
				 FECHA_FACTURA 
		INTO pFORMA_PAGO_FACTURA,
				 pCODIGO_CLIENTE,
				 pTOTAL_LIQUIDO_FACTURA,
				 pRAZONSOCIAL_CLIENTE,
				 pDIRECCION1_CLIENTE,
				 pPOBLACION_CLIENTE,
				 pPROVINCIA_CLIENTE,
				 pCPOSTAL_CLIENTE,
				 pFECHA_FACTURA
		FROM suboc_facturas
   WHERE SERIE_FACTURA = pSERIE_FACTURA
	   AND NRO_FACTURA = pNRO_FACTURA;
		 
		 SELECT IBAN 
		  INTO pIBAN
		 FROM suboc_clientes
		 WHERE CODIGO_CLIENTE = pCODIGO_CLIENTE;
		 
		 IF( EXISTS(
							 SELECT *
							 FROM suboc_formapago
							 WHERE DESCRIPCION_FORMAPAGO =  pFORMA_PAGO_FACTURA) ) THEN
		BEGIN
			SELECT CODIGO_FORMAPAGO, 
			       N_PLAZOS, 
						 DIAS_ENTRE_PLAZOS, 
						 PORCEN_ANTICIPO 
				INTO pCODIGO_FORMAPAGO,
				     pN_PLAZOS, 
						 pDIAS_ENTRE_PLAZOS,  
						 pPORCEN_ANTICIPO
				FROM suboc_formapago
				WHERE DESCRIPCION_FORMAPAGO = pFORMA_PAGO_FACTURA;
				
			IF ((pPORCEN_ANTICIPO = 100)) THEN
			BEGIN
				SELECT GET_NUMEROS_A_LETRAS(pTOTAL_LIQUIDO_FACTURA) 
			         INTO pIMPORTE_LETRA;		 
				INSERT INTO  suboc_recibos 
				       (NRO_FACTURA					         ,
								SERIE_FACTURA                ,
								NRO_PLAZO_RECIBO             ,
								FORMA_PAGO_ORIGEN            ,
								FORMA_PAGO_DESCRIPCION_ORIGEN,								
								EUROS_RECIBO                 ,
								ESTADO_RECIBO                ,
								FECHA_EXPEDICION             ,
								FECHA_VENCIMIENTO            ,
								IBAN                         ,
								FECHA_PAGO                   ,
								LOCALIDAD_EXPEDICION         ,
								CODIGO_CLIENTE               ,
								RAZONSOCIAL_CLIENTE          ,
								DIRECCION1_CLIENTE           ,
								POBLACION_CLIENTE            ,
								PROVINCIA_CLIENTE            ,
								CPOSTAL_CLIENTE              ,
								IMPORTE_LETRA                ,
							  TRATAMIENTOS	)
				VALUES( pNRO_FACTURA,
				        pSERIE_FACTURA,
								1,
								pCODIGO_FORMAPAGO,
								pFORMA_PAGO_FACTURA,
								pTOTAL_LIQUIDO_FACTURA,
								'Pagado',
								pFECHA_FACTURA,
								pFECHA_FACTURA,
								pIBAN,
								pFECHA_FACTURA,
								'Zamora',
								pCODIGO_CLIENTE,
								pRAZONSOCIAL_CLIENTE,
								pDIRECCION1_CLIENTE,
								pPOBLACION_CLIENTE,
								pPROVINCIA_CLIENTE,
								pCPOSTAL_CLIENTE,
								pIMPORTE_LETRA,
								pTRATAMIENTOS
							);
			END;
			ELSE 
			  IF (pN_PLAZOS >= 1) THEN
				BEGIN
			    SET I = 1;
					WHILE (I<=pN_PLAZOS) DO
					BEGIN
					      IF I = 1 THEN 
								BEGIN
								  SET pFECHA_VENCIMIENTO  = pFECHA_FACTURA;
								  SET pIMPORTE_ANTICIPO = pTOTAL_LIQUIDO_FACTURA * (pPORCEN_ANTICIPO/100);
									SET pIMPORTE_RESTO = (pTOTAL_LIQUIDO_FACTURA - pIMPORTE_ANTICIPO);
								  
								END;
								END IF;									
								IF ((I= 1) AND (pPORCEN_ANTICIPO > 0)) THEN								  
									SET pIMPORTE_RECIBO = pIMPORTE_ANTICIPO;
								ELSE
								  IF pN_PLAZOS > 1 THEN 
									  SET pIMPORTE_RECIBO = pIMPORTE_RESTO / (pN_PLAZOS - 1);
									ELSE
										SET pIMPORTE_RECIBO = pIMPORTE_RESTO;
									END IF;
								END IF;
							  SELECT GET_NUMEROS_A_LETRAS(pIMPORTE_RECIBO) 
     			        INTO pIMPORTE_LETRA;	
								IF (I <> 1) THEN
								  SET pFECHA_VENCIMIENTO = ADDDATE(pFECHA_VENCIMIENTO, INTERVAL pDIAS_ENTRE_PLAZOS DAY);
								END IF;
								
								INSERT INTO  suboc_recibos 
												 (NRO_FACTURA					         ,
													SERIE_FACTURA                ,
													NRO_PLAZO_RECIBO             ,
													FORMA_PAGO_ORIGEN            ,													
													FORMA_PAGO_DESCRIPCION_ORIGEN,
													EUROS_RECIBO                 ,
													ESTADO_RECIBO                ,
													FECHA_EXPEDICION             ,
													FECHA_VENCIMIENTO            ,
													IBAN                         ,
													FECHA_PAGO                   ,
													LOCALIDAD_EXPEDICION         ,
													CODIGO_CLIENTE               ,
													RAZONSOCIAL_CLIENTE          ,
													DIRECCION1_CLIENTE           ,
													POBLACION_CLIENTE            ,
													PROVINCIA_CLIENTE            ,
													CPOSTAL_CLIENTE              ,
													IMPORTE_LETRA                ,
													TRATAMIENTOS	)
								VALUES( pNRO_FACTURA,
													pSERIE_FACTURA,
													I,
													pCODIGO_FORMAPAGO,										
													pFORMA_PAGO_FACTURA,
													pIMPORTE_RECIBO,
													'Emitido',
													pFECHA_FACTURA,
													pFECHA_VENCIMIENTO,
													pIBAN,
													NULL,
													'Zamora',
													pCODIGO_CLIENTE,
													pRAZONSOCIAL_CLIENTE,
													pDIRECCION1_CLIENTE,
													pPOBLACION_CLIENTE,
													pPROVINCIA_CLIENTE,
													pCPOSTAL_CLIENTE,
													pIMPORTE_LETRA,
													pTRATAMIENTOS
												);
								SET I = I + 1;
					END;
					END WHILE;
				END;
				END IF;
			END IF;
		END;
		END IF;
		COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_CREAR_RECIBOS_PRESUPUESTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_CREAR_RECIBOS_PRESUPUESTO`;
delimiter ;;
CREATE PROCEDURE `PRC_CREAR_RECIBOS_PRESUPUESTO`(IN `pSERIE_FACTURA` varchar(8),
	                                                                         IN `pNRO_FACTURA` int(8))
BEGIN
  DECLARE pCODIGO_FORMAPAGO VARCHAR(10);
	DECLARE pFORMA_PAGO_FACTURA VARCHAR(100);
	DECLARE pN_PLAZOS int(10); 
	DECLARE I int(10);
	DECLARE pDIAS_ENTRE_PLAZOS int(10);
	DECLARE pPORCEN_ANTICIPO decimal(5,2);
	DECLARE pCODIGO_CLIENTE  int(10);
	DECLARE pIBAN varchar(34);
	DECLARE pRAZONSOCIAL_CLIENTE varchar(200);
	DECLARE pDIRECCION1_CLIENTE  varchar(200);
	DECLARE pPOBLACION_CLIENTE  varchar(200);
	DECLARE pPROVINCIA_CLIENTE  varchar(200);
	DECLARE pCPOSTAL_CLIENTE  varchar(15);
	DECLARE pIMPORTE_LETRA  varchar(150);
	DECLARE pTOTAL_LIQUIDO_FACTURA decimal(18,6);
	DECLARE pIMPORTE_RECIBO decimal(18,6);
	DECLARE pIMPORTE_RESTO decimal(18,6);
	DECLARE pIMPORTE_ANTICIPO decimal(18,6);
	DECLARE pFECHA_VENCIMIENTO date;
	DECLARE pFECHA_FACTURA date;
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE pTRATAMIENTO_LINEA VARCHAR(100);
  DECLARE pTRATAMIENTOS varchar(1000) DEFAULT '';
  DECLARE curTratamientos 
        CURSOR FOR 
            SELECT DESCRIPCION_ARTICULO_LINEA 
						  FROM suboc_presupuestos_lineas 
						 WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
						   AND NRO_FACTURA_LINEA = pNRO_FACTURA;
  DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
	START TRANSACTION;
	DELETE FROM suboc_recibos 
   WHERE NRO_FACTURA = pNRO_FACTURA
	   AND SERIE_FACTURA = pSERIE_FACTURA;	
  OPEN curTratamientos;
  getTratamientos: LOOP
		FETCH curTratamientos INTO pTRATAMIENTO_LINEA;
		IF finished = 1 THEN 
				LEAVE getTratamientos;
		END IF;
		-- build email list
		SET pTRATAMIENTOS = CONCAT(pTRATAMIENTOS,'\n',pTRATAMIENTO_LINEA);
  END LOOP getTratamientos;
	
	SELECT FORMA_PAGO_FACTURA, 
				 CODIGO_CLIENTE_FACTURA,
				 TOTAL_LIQUIDO_FACTURA,
				 RAZONSOCIAL_CLIENTE_FACTURA,
				 DIRECCION1_CLIENTE_FACTURA,
				 POBLACION_CLIENTE_FACTURA,
				 PROVINCIA_CLIENTE_FACTURA,
				 CPOSTAL_CLIENTE_FACTURA,
				 FECHA_FACTURA 
		INTO pFORMA_PAGO_FACTURA,
				 pCODIGO_CLIENTE,
				 pTOTAL_LIQUIDO_FACTURA,
				 pRAZONSOCIAL_CLIENTE,
				 pDIRECCION1_CLIENTE,
				 pPOBLACION_CLIENTE,
				 pPROVINCIA_CLIENTE,
				 pCPOSTAL_CLIENTE,
				 pFECHA_FACTURA
		FROM suboc_presupuestos
   WHERE SERIE_FACTURA = pSERIE_FACTURA
	   AND NRO_FACTURA = pNRO_FACTURA;
		 
		 SELECT IBAN 
		  INTO pIBAN
		 FROM suboc_clientes
		 WHERE CODIGO_CLIENTE = pCODIGO_CLIENTE;
		 
		 IF( EXISTS(
							 SELECT *
							 FROM suboc_formapago
							 WHERE DESCRIPCION_FORMAPAGO =  pFORMA_PAGO_FACTURA) ) THEN
		BEGIN
			SELECT CODIGO_FORMAPAGO, 
			       N_PLAZOS, 
						 DIAS_ENTRE_PLAZOS, 
						 PORCEN_ANTICIPO 
				INTO pCODIGO_FORMAPAGO,
				     pN_PLAZOS, 
						 pDIAS_ENTRE_PLAZOS,  
						 pPORCEN_ANTICIPO
				FROM suboc_formapago
				WHERE DESCRIPCION_FORMAPAGO = pFORMA_PAGO_FACTURA;
				
			IF ((pPORCEN_ANTICIPO = 100)) THEN
			BEGIN
				SELECT GET_NUMEROS_A_LETRAS(pTOTAL_LIQUIDO_FACTURA) 
			         INTO pIMPORTE_LETRA;		 
				INSERT INTO  suboc_recibos 
				       (NRO_FACTURA					         ,
								SERIE_FACTURA                ,
								NRO_PLAZO_RECIBO             ,
								FORMA_PAGO_ORIGEN            ,
								FORMA_PAGO_DESCRIPCION_ORIGEN,								
								EUROS_RECIBO                 ,
								ESTADO_RECIBO                ,
								FECHA_EXPEDICION             ,
								FECHA_VENCIMIENTO            ,
								IBAN                         ,
								FECHA_PAGO                   ,
								LOCALIDAD_EXPEDICION         ,
								CODIGO_CLIENTE               ,
								RAZONSOCIAL_CLIENTE          ,
								DIRECCION1_CLIENTE           ,
								POBLACION_CLIENTE            ,
								PROVINCIA_CLIENTE            ,
								CPOSTAL_CLIENTE              ,
								IMPORTE_LETRA                ,
							  TRATAMIENTOS	)
				VALUES( pNRO_FACTURA,
				        pSERIE_FACTURA,
								1,
								pCODIGO_FORMAPAGO,
								pFORMA_PAGO_FACTURA,
								pTOTAL_LIQUIDO_FACTURA,
								'Pagado',
								pFECHA_FACTURA,
								pFECHA_FACTURA,
								pIBAN,
								pFECHA_FACTURA,
								'Zamora',
								pCODIGO_CLIENTE,
								pRAZONSOCIAL_CLIENTE,
								pDIRECCION1_CLIENTE,
								pPOBLACION_CLIENTE,
								pPROVINCIA_CLIENTE,
								pCPOSTAL_CLIENTE,
								pIMPORTE_LETRA,
								pTRATAMIENTOS
							);
			END;
			ELSE 
			  IF (pN_PLAZOS >= 1) THEN
				BEGIN
			    SET I = 1;
					WHILE (I<=pN_PLAZOS) DO
					BEGIN
					      IF I = 1 THEN 
								BEGIN
								  SET pFECHA_VENCIMIENTO  = pFECHA_FACTURA;
								  SET pIMPORTE_ANTICIPO = pTOTAL_LIQUIDO_FACTURA * (pPORCEN_ANTICIPO/100);
									SET pIMPORTE_RESTO = (pTOTAL_LIQUIDO_FACTURA - pIMPORTE_ANTICIPO);
								  
								END;
								END IF;									
								IF ((I= 1) AND (pPORCEN_ANTICIPO > 0)) THEN								  
									SET pIMPORTE_RECIBO = pIMPORTE_ANTICIPO;
								ELSE
								  IF pN_PLAZOS > 1 THEN 
									  SET pIMPORTE_RECIBO = pIMPORTE_RESTO / (pN_PLAZOS - 1);
									ELSE
										SET pIMPORTE_RECIBO = pIMPORTE_RESTO;
									END IF;
								END IF;
							  SELECT GET_NUMEROS_A_LETRAS(pIMPORTE_RECIBO) 
     			        INTO pIMPORTE_LETRA;	
								IF (I <> 1) THEN
								  SET pFECHA_VENCIMIENTO = ADDDATE(pFECHA_VENCIMIENTO, INTERVAL pDIAS_ENTRE_PLAZOS DAY);
								END IF;
								
								INSERT INTO  suboc_recibos 
												 (NRO_FACTURA					         ,
													SERIE_FACTURA                ,
													NRO_PLAZO_RECIBO             ,
													FORMA_PAGO_ORIGEN            ,													
													FORMA_PAGO_DESCRIPCION_ORIGEN,
													EUROS_RECIBO                 ,
													ESTADO_RECIBO                ,
													FECHA_EXPEDICION             ,
													FECHA_VENCIMIENTO            ,
													IBAN                         ,
													FECHA_PAGO                   ,
													LOCALIDAD_EXPEDICION         ,
													CODIGO_CLIENTE               ,
													RAZONSOCIAL_CLIENTE          ,
													DIRECCION1_CLIENTE           ,
													POBLACION_CLIENTE            ,
													PROVINCIA_CLIENTE            ,
													CPOSTAL_CLIENTE              ,
													IMPORTE_LETRA                ,
													TRATAMIENTOS	)
								VALUES( pNRO_FACTURA,
													pSERIE_FACTURA,
													I,
													pCODIGO_FORMAPAGO,										
													pFORMA_PAGO_FACTURA,
													pIMPORTE_RECIBO,
													'Emitido',
													pFECHA_FACTURA,
													pFECHA_VENCIMIENTO,
													pIBAN,
													NULL,
													'Zamora',
													pCODIGO_CLIENTE,
													pRAZONSOCIAL_CLIENTE,
													pDIRECCION1_CLIENTE,
													pPOBLACION_CLIENTE,
													pPROVINCIA_CLIENTE,
													pCPOSTAL_CLIENTE,
													pIMPORTE_LETRA,
													pTRATAMIENTOS
												);
								SET I = I + 1;
					END;
					END WHILE;
				END;
				END IF;
			END IF;
		END;
		END IF;
		COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_GET_DATA_ARTICULO
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_GET_DATA_ARTICULO`;
delimiter ;;
CREATE PROCEDURE `PRC_GET_DATA_ARTICULO`(IN pidcodarticulo varchar(200), 
											OUT pidnomarticulo varchar(200), 
											OUT pidprecioventa decimal(18,6))
BEGIN
   IF( EXISTS(
             SELECT *
             FROM suboc_articulos
             WHERE `CODIGO_ARTICULO` =  pidcodarticulo) ) THEN
	BEGIN
	  SELECT DESCRIPCION_ARTICULO, PRECIOVENTA_ARTICULO 
      INTO pidnomarticulo, pidprecioventa	      
      FROM suboc_articulos
	   WHERE CODIGO_ARTICULO = pidcodarticulo;
	END;
	ELSE
	BEGIN
	  SET pidnomarticulo = '';
	  SET pidprecioventa = 0.00;
	END;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_GET_EMPTY_FACTURA_PARA_VALIDAR
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_GET_EMPTY_FACTURA_PARA_VALIDAR`;
delimiter ;;
CREATE PROCEDURE `PRC_GET_EMPTY_FACTURA_PARA_VALIDAR`(IN `pNif` varchar(10),
    IN `pRazonSocial` varchar(200),
    OUT `pJsonResult` longtext)
BEGIN
    DECLARE vTotalFactura decimal(18,6);
    DECLARE vTotalIVA decimal(18,6);
    
    /* Calcular valores (simplificado) */
    SET vTotalIVA = 0;
    SET vTotalFactura = 0;
    
    /* Construir JSON básico */
    SET pJsonResult = JSON_OBJECT(
        'invoice', JSON_OBJECT(
            'id', JSON_OBJECT(
                'number', CONCAT(CONCAT('VALID_NIF_',pNIF) , '/', '1'),
                'issuedTime', DATE_FORMAT(CURRENT_DATE, '%Y-%m-%d')
            ),
            'type', 'F1',
            'description', JSON_OBJECT(
                'text', 'Factura de servicios odontológicos',
                'operationDate', DATE_FORMAT(CURRENT_DATE, '%Y-%m-%d')
            ),
            'recipient', JSON_OBJECT(
                'irsId', pNIF,
                'name', pRazonSocial,
                'country', 'ES'
            ),
            'vatLines', JSON_ARRAY(
                JSON_OBJECT(
                    'vatOperation', 'E1',
                    'base', 0,
                    'rate', 0,
                    'amount', 0,
                    'vatKey', '01'
                )
            ),
            'total', 0,
            'amount', 0
        )
    );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PRC_RESUMEN_ERRORES_VERIFACTU
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRC_RESUMEN_ERRORES_VERIFACTU`;
delimiter ;;
CREATE PROCEDURE `PRC_RESUMEN_ERRORES_VERIFACTU`()
BEGIN
    SELECT 
        'ERRORES DE VERIFACTU POR CÓDIGO' as TITULO,
        '' as SEPARADOR;
    
    SELECT 
        CODIGO_ERROR_VERIFACTU as CODIGO_ERROR,
        COUNT(*) as CANTIDAD_ERRORES,
        GROUP_CONCAT(DISTINCT CONCAT(SERIE_FACTURA, '/', NRO_FACTURA) SEPARATOR ', ') as FACTURAS_AFECTADAS,
        MAX(FECHA_PROCESAMIENTO) as ULTIMO_ERROR
    FROM suboc_verifactu_queue 
    WHERE CODIGO_ERROR_VERIFACTU IS NOT NULL
    GROUP BY CODIGO_ERROR_VERIFACTU
    ORDER BY CANTIDAD_ERRORES DESC;
    
    SELECT 
        'OPERACIONES CON QUEUE_ID DE VERIFACTU' as TITULO,
        '' as SEPARADOR;
        
    SELECT 
        COUNT(CASE WHEN VERIFACTU_QUEUE_ID IS NOT NULL THEN 1 END) as CON_QUEUE_ID,
        COUNT(CASE WHEN VERIFACTU_QUEUE_ID IS NULL THEN 1 END) as SIN_QUEUE_ID,
        COUNT(*) as TOTAL_OPERACIONES
    FROM suboc_verifactu_queue 
    WHERE ESTADO_COLA = 'COMPLETADO';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SET_CONSOLIDACION_FASE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SET_CONSOLIDACION_FASE`;
delimiter ;;
CREATE PROCEDURE `SET_CONSOLIDACION_FASE`(IN pNumFactura int(8), 
                                           IN pSerieFactura varchar(8), 
                                           IN pFaseConso varchar(20), 
                                           IN pConso varchar(1))
BEGIN
  START TRANSACTION;
	 UPDATE suboc_facturas 
	    SET CONSOLIDACION_FACTURA = pConso,
          FASE_CONSOLIDACION_FACTURA = pFaseConso, 
          FECHA_ULT_CONSO_FACTURA = CURRENT_TIMESTAMP
	  WHERE NRO_FACTURA = pNumFactura 
      AND SERIE_FACTURA = pSerieFactura;
	COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table suboc_verifactu_queue
-- ----------------------------
DROP TRIGGER IF EXISTS `TR_COLA_STATUS_CHANGE`;
delimiter ;;
CREATE TRIGGER `TR_COLA_STATUS_CHANGE` AFTER UPDATE ON `suboc_verifactu_queue` FOR EACH ROW BEGIN
    /* Log automático cuando se completa con QueueId */
    IF OLD.ESTADO_COLA != NEW.ESTADO_COLA 
       AND NEW.ESTADO_COLA = 'COMPLETADO' 
       AND NEW.VERIFACTU_QUEUE_ID IS NOT NULL THEN
       
        INSERT INTO suboc_verifactu_log_eventos (
            TIMESTAMP_LOG,
            TIPO_EVENTO_LOG,
            USUARIO_LOG,
            VERSION_LOG,
            DESCRIPCION_LOG,
            DATOS_ADICIONALES_LOG,
            HASH_ANTERIOR_LOG,
            HASH_PROPIO_LOG,
            FIRMA_DIGITAL_LOG
        ) VALUES (
            NOW(3),
            1, /* Información */
            'AUTO_QUEUE',
            '1.0',
            CONCAT('Operación completada con éxito - QueueId Verifactu: ', NEW.VERIFACTU_QUEUE_ID),
            JSON_OBJECT(
                'id_cola', NEW.ID_QUEUE,
                'tipo_operacion', NEW.TIPO_OPERACION,
                'factura', CONCAT(NEW.SERIE_FACTURA, '/', NEW.NRO_FACTURA),
                'queue_verifactu', NEW.VERIFACTU_QUEUE_ID,
                'request_id', NEW.VERIFACTU_REQUEST_ID
            ),
            '',
            '',
            ''
        );
    END IF;
    
    /* Log automático cuando hay error de Verifactu */
    IF OLD.CODIGO_ERROR_VERIFACTU IS NULL 
       AND NEW.CODIGO_ERROR_VERIFACTU IS NOT NULL THEN
       
        INSERT INTO suboc_verifactu_log_eventos (
            TIMESTAMP_LOG,
            TIPO_EVENTO_LOG,
            USUARIO_LOG,
            VERSION_LOG,
            DESCRIPCION_LOG,
            DATOS_ADICIONALES_LOG,
            HASH_ANTERIOR_LOG,
            HASH_PROPIO_LOG,
            FIRMA_DIGITAL_LOG
        ) VALUES (
            NOW(3),
            3, /* Error */
            'AUTO_QUEUE',
            '1.0',
            CONCAT('Error Verifactu detectado - Código: ', NEW.CODIGO_ERROR_VERIFACTU),
            JSON_OBJECT(
                'id_cola', NEW.ID_QUEUE,
                'tipo_operacion', NEW.TIPO_OPERACION,
                'factura', CONCAT(NEW.SERIE_FACTURA, '/', NEW.NRO_FACTURA),
                'codigo_error', NEW.CODIGO_ERROR_VERIFACTU,
                'intentos', NEW.INTENTOS
            ),
            '',
            '',
            ''
        );
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
