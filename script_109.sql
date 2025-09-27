
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_dibujos_presupuestos' 
     AND column_name = 'DIBUJO_FACTURA'
     AND data_type != 'longblob') > 0,
    'ALTER TABLE `suboc_dibujos_presupuestos` MODIFY COLUMN `DIBUJO_FACTURA` LONGBLOB;',
    'SELECT ''Column DIBUJO_FACTURA is already LONGBLOB'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE suboc_clientes 
SET NIF_CLIENTE = REPLACE(REPLACE(REPLACE(NIF_CLIENTE, '-', ''), ' ', ''), '.', '');

UPDATE suboc_facturas 
SET NIF_CLIENTE_FACTURA = REPLACE(REPLACE(REPLACE(NIF_CLIENTE_FACTURA, '-', ''), ' ', ''), '.', '');

-- Verificar y agregar columnas en suboc_facturas
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_facturas' 
     AND column_name = 'FASE_CONSOLIDACION_FACTURA') = 0,
    'ALTER TABLE `suboc_facturas` ADD COLUMN `FASE_CONSOLIDACION_FACTURA` varchar(100) NULL;',
    'SELECT ''Column FASE_CONSOLIDACION_FACTURA already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_facturas' 
     AND column_name = 'FECHA_ULT_CONSO_FACTURA') = 0,
    'ALTER TABLE `suboc_facturas` ADD COLUMN `FECHA_ULT_CONSO_FACTURA` datetime NULL;',
    'SELECT ''Column FECHA_ULT_CONSO_FACTURA already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

DROP TABLE IF EXISTS `suboc_paises`;
CREATE TABLE IF NOT EXISTS `suboc_paises` (
  `COD_PAIS` char(3) NOT NULL,
  `COD_PAIS_ALPHA3` varchar(3) DEFAULT NULL,
  `COD_PAIS_ALPHA2` varchar(2) DEFAULT NULL,
  `NOMBRE_SPA_PAIS` varchar(100) DEFAULT NULL,
  `NOMBRE_ENG_PAIS` varchar(100) DEFAULT NULL,
  `ESMIEMBRO_UE_PAIS` varchar(1) DEFAULT NULL COMMENT 'S SI ES MIEMBRO DE LA UE, N CUANDO NO LO ES',
  `ORDEN_PAIS` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PAIS`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `suboc_paises` VALUES
 ('004','AFG','AF','Afganistán','Afghanistan','N',999),
 ('008','ALB','AL','Albania','Albania','N',999),
 ('010','ATA','AQ','Antártida','Antartic','N',999),
 ('012','DZA','DZ','Argelia','Algeria','N',999),
 ('020','AND','AD','Andorra','Andorra','N',999),
 ('024','AGO','AO','Angola','Angola','N',999),
 ('028','ATG','AG','Antigua y Barbuda','Antigua and Barbuda','N',999),
 ('031','AZE','AZ','Azerbaiyán','Azerbaijan','N',999),
 ('032','ARG','AR','Argentina','Argentina','N',999),
 ('036','AUS','AU','Australia','Australia','N',999),
 ('040','AUT','AT','Austria','Austria','S',999),
 ('044','BHS','BS','Bahamas','Bahamas','N',999),
 ('048','BHR','BH','Baréin','Bahrain','N',999),
 ('050','BGD','BD','Bangladés','Bangladesh','N',999),
 ('051','ARM','AM','Armenia','Armenia','N',999),
 ('052','BRB','BB','Barbados','Barbados','N',999),
 ('056','BEL','BE','Bélgica','Belgium','S',999),
 ('060','BMU','BM','Bermudas','Bermuda','N',999),
 ('064','BTN','BT','Bután','Bhutan','N',999),
 ('068','BOL','BO','Bolivia','Bolivia','N',999),
 ('070','BIH','BA','Bosnia y Herzegovina','Bosnia and Herzegovina','N',999),
 ('072','BWA','BW','Botsuana','Botswana','N',999),
 ('074','BVT','BV','Isla Bouvet','Bouvet Island ','N',999),
 ('076','BRA','BR','Brasil','Brazil','N',999),
 ('084','BLZ','BZ','Belice','Belize','N',999),
 ('086','IOT','IO','Territorio Británico del Océano Índico','British Indian Ocean Territory','N',999),
 ('090','SLB','SB','Islas Salomón','Solomon Islands','N',999),
 ('092','VGB','VG','Islas Vírgenes (UK)','Virgin Islands','N',999),
 ('096','BRN','BN','Brunéi','Brunei','N',999),
 ('100','BGR','BG','Bulgaria','Bulgaria','S',999),
 ('104','MMR','MM','Birmania','Myanmar','N',999),
 ('108','BDI','BI','Burundi','Burundi','N',999),
 ('112','BLR','BY','Bielorrusia','Belarus','N',999),
 ('116','KHM','KH','Camboya','Cambodia','N',999),
 ('120','CMR','CM','Camerún','Cameroon','N',999),
 ('124','CAN','CA','Canadá','Canada','N',999),
 ('132','CPV','CV','Cabo Verde','Cape Verde','N',999),
 ('136','CYM','KY','Islas Caimán','Cayman Islands','N',999),
 ('140','CAF','CF','República Centroafricana','Central African Republic','N',999),
 ('144','LKA','LK','Sri Lanka','Sri Lanka','N',999),
 ('148','TCD','TD','Chad','Chad','N',999),
 ('152','CHL','CL','Chile','Chile','N',999),
 ('156','CHN','CN','China','China','N',999),
 ('158','TWN','TW','Taiwán','Taiwan','N',999),
 ('162','CXR','CX','Isla de Navidad','Christmas Island','N',999),
 ('166','CCK','CC','Islas Cocos','Cocos Islands','N',999),
 ('170','COL','CO','Colombia','Colombia','N',999),
 ('174','COM','KM','Comoras','Comoros','N',999),
 ('175','MYT','YT','Mayotte','Mayotte','N',999),
 ('178','COG','CG','Congo','Congo','N',999),
 ('180','COD','CD','República Democrática del Congo','Democratic Republic of the Congo','N',999),
 ('184','COK','CK','Islas Cook','Cook Islands','N',999),
 ('188','CRI','CR','Costa Rica','Costa Rica','N',999),
 ('191','HRV','HR','Croacia','Croatia','S',999),
 ('192','CUB','CU','Cuba','Cuba','N',999),
 ('196','CYP','CY','Chipre','Cyprus','S',999),
 ('203','CZE','CZ','República Checa','Czech Republic','S',999),
 ('204','BEN','BJ','Benín','Benin','N',999),
 ('208','DNK','DK','Dinamarca','Denmark','S',999),
 ('212','DMA','DM','Dominica','Dominica','N',999),
 ('214','DOM','DO','República Dominicana','Dominican Republic','N',999),
 ('218','ECU','EC','Ecuador','Ecuador','N',999),
 ('222','SLV','SV','El Salvador','El Salvador','N',999),
 ('226','GNQ','GQ','Guinea Ecuatorial','Equatorial Guinea','N',999),
 ('231','ETH','ET','Etiopía','Ethiopia','N',999),
 ('232','ERI','ER','Eritrea','Eritrea','N',999),
 ('233','EST','EE','Estonia','Estonia','S',999),
 ('234','FRO','FO','Islas Feroe','Faroe Islands','N',999),
 ('238','FLK','FK','Islas Malvinas','Falkland Islands','N',999),
 ('239','SGS','GS','Georgia del Sur y las Islas Sandwich del Sur','South Georgia and the South Sandwich Islands','N',999),
 ('242','FJI','FJ','Fiyi','Fiji','N',999),
 ('246','FIN','FI','Finlandia','Finland','S',999),
 ('248','ALA','AX','Islas Åland','Åland Islands','N',999),
 ('250','FRA','FR','Francia','France','S',3),
 ('254','GUF','GF','Guayana Francesa','French Guiana','N',999),
 ('260','ATF','TF','Territorios Australes y Antárticos Franceses','French Southern and Antarctic Lands','N',999),
 ('262','DJI','DJ','Yibuti','Djibouti','N',999),
 ('266','GAB','GA','Gabón','Gabon','N',999),
 ('268','GEO','GE','Georgia','Georgia','N',999),
 ('270','GMB','GM','Gambia','Gambia','N',999),
 ('276','DEU','DE','Alemania','Germany','S',999),
 ('288','GHA','GH','Ghana','Ghana','N',999),
 ('292','GIB','GI','Gibraltar','Gibraltar','N',999),
 ('296','KIR','KI','Kiribati','Kiribati','N',999),
 ('300','GRC','GR','Grecia','Greece','S',999),
 ('304','GRL','GL','Groenlandia','Greenland','N',999),
 ('308','GRD','GD','Granada','Grenada','N',999),
 ('312','GLP','GP','Guadalupe','Guadalupe','N',999),
 ('316','GUM','GU','Guam','Guam','N',999),
 ('320','GTM','GT','Guatemala','Guatemala','N',999),
 ('324','GIN','GN','Guinea','Guinea','N',999),
 ('328','GUY','GY','Guyana','Guiana','N',999),
 ('332','HTI','HT','Haití','Haiti','N',999),
 ('334','HMD','HM','Islas Heard y McDonald','Heard Island and McDonald Islands','N',999),
 ('336','VAT','VA','Ciudad del Vaticano','Vatican City','N',999),
 ('340','HND','HN','Honduras','Honduras','N',999),
 ('344','HKG','HK','Hong Kong','Hong Kong','N',999),
 ('348','HUN','HU','Hungría','Hungary','S',999),
 ('352','ISL','IS','Islandia','Iceland','N',999),
 ('356','IND','IN','India','India','N',999),
 ('360','IDN','ID','Indonesia','Indonesia','N',999),
 ('364','IRN','IR','Irán','Iran','N',999),
 ('368','IRQ','IQ','Irak','Iraq','N',999),
 ('372','IRL','IE','Irlanda','Ireland','S',999),
 ('376','ISR','IL','Israel','Israel','N',999),
 ('380','ITA','IT','Italia','Italy','S',999),
 ('384','CIV','CI','Costa de Marfil','Ivory Coast','N',999),
 ('388','JAM','JM','Jamaica','Jamaica','N',999),
 ('392','JPN','JP','Japón','Japan','N',999),
 ('398','KAZ','KZ','Kazajistán','Kazakhstan','N',999),
 ('400','JOR','JO','Jordania','Jordan','N',999),
 ('404','KEN','KE','Kenia','Kenya','N',999),
 ('408','PRK','KP','Corea del Norte','North Korea','N',999),
 ('410','KOR','KR','Corea del Sur','South Korea','N',999),
 ('412','XXK','XK','Kosovo','Kosovo','N',999),
 ('414','KWT','KW','Kuwait','Kuwait','N',999),
 ('417','KGZ','KG','Kirguistán','Kyrgyzstan','N',999),
 ('418','LAO','LA','Laos','Laos','N',999),
 ('422','LBN','LB','Líbano','Lebanon','N',999),
 ('426','LSO','LS','Lesoto','Lesotho','N',999),
 ('428','LVA','LV','Letonia','Latvia','S',999),
 ('430','LBR','LR','Liberia','Liberia','N',999),
 ('434','LBY','LY','Libia','Libya','N',999),
 ('438','LIE','LI','Liechtenstein','Liechtenstein','N',999),
 ('440','LTU','LT','Lituania','Lithuania','S',999),
 ('442','LUX','LU','Luxemburgo','Luxembourg','S',999),
 ('446','MAC','MO','Macao','Macau','N',999),
 ('450','MDG','MG','Madagascar','Madagascar','N',999),
 ('454','MWI','MW','Malaui','Malawi','N',999),
 ('458','MYS','MY','Malasia','Malaysia','N',999),
 ('462','MDV','MV','Maldivas','Maldives','N',999),
 ('466','MLI','ML','Malí','Mali','N',999),
 ('470','MLT','MT','Malta','Malta','S',999),
 ('474','MTK','MQ','Martinica','Martinique','N',999),
 ('478','MRT','MR','Mauritania','Mauritania','N',999),
 ('480','MUS','MU','Mauricio','Mauritius','N',999),
 ('484','MEX','MX','México','Mexico','N',999),
 ('492','MCO','MC','Mónaco','Monaco','N',999),
 ('496','MNG','MN','Mongolia','Mongolia','N',999),
 ('498','MDA','MD','Moldavia','Moldova','N',999),
 ('499','MNE','ME','Montenegro','Montenegro','N',999),
 ('504','MAR','MA','Marruecos','Morocco','N',999),
 ('508','MOZ','MZ','Mozambique','Mozambique','N',999),
 ('512','OMN','OM','Omán','Oman','N',999),
 ('516','NAM','NA','Namibia','Namibia','N',999),
 ('520','NRU','NR','Nauru','Nauru','N',999),
 ('524','NPL','NP','Nepal','Nepal','N',999),
 ('528','NLD','NL','Países Bajos','Netherlands','S',999),
 ('531','CUW','CW','Curaçao','Curaçao','N',999),
 ('533','ABW','AW','Aruba','Aruba','N',999),
 ('535','BES','BQ','Caribe Neerlandés','Caribbean netherlands','N',999),
 ('548','VUT','VU','Vanuatu','Vanuatu','N',999),
 ('554','NZL','NZ','Nueva Zelanda','New Zealand','N',999),
 ('558','NIC','NI','Nicaragua','Nicaragua','N',999),
 ('562','NER','NE','Níger','Niger','N',999),
 ('566','NGA','NG','Nigeria','Nigeria','N',999),
 ('574','NFK','NF','Isla Nor Folk','Norfolk Island','N',999),
 ('578','NOR','NO','Noruega','Norway','N',999),
 ('580','MNP','MP','Islas Marianas del Norte','Northern Mariana Islands','N',999),
 ('581','UMI','UM','Islas ultramarinas menores de los Estados Unidos','United States Minor Outlying Islands','N',999),
 ('583','FSM','FM','Micronesia','Micronesia','N',999),
 ('584','MHL','MH','Islas Marshall','Marshall Islands','N',999),
 ('585','PLW','PW','Palaos','Palau','N',999),
 ('586','PAK','PK','Pakistán','Pakistan','N',999),
 ('591','PAN','PA','Panamá','Panama','N',999),
 ('598','PNG','PG','Papúa Nueva Guinea','Papua New Guinea','N',999),
 ('600','PRY','PY','Paraguay','Paraguay','N',999),
 ('604','PER','PE','Perú','Peru','N',999),
 ('608','PHL','PH','Filipinas','Philippines','N',999),
 ('612','PCN','PN','Islas Pitcairn','Pitcairn Island','N',999),
 ('616','POL','PL','Polonia','Poland','S',999),
 ('620','PRT','PT','Portugal','Portugal','S',2),
 ('624','GNB','GW','Guinea-Bisáu','Guinea-Bissau','N',999),
 ('626','TLS','TL','Timor Oriental','East Timor','N',999),
 ('634','QAT','QA','Catar','Qatar','N',999),
 ('642','ROU','RO','Rumania','Romania','S',999),
 ('643','RUS','RU','Rusia','Russia','N',999),
 ('646','RWA','RW','Ruanda','Rwanda','N',999),
 ('659','KNA','KN','San Cristóbal y Nieves','Saint Kitts and Nevis','N',999),
 ('660','AIA','AI','Anguila','Anguila','N',999),
 ('662','LCA','LC','Santa Lucía','Saint Lucia','N',999),
 ('663','MAF','MF','Isla de San Martín','Island of Saint Martin','N',999),
 ('670','VCT','VC','San Vicente y las Granadinas','Saint Vincent and the Grenadines','N',999),
 ('674','SMR','SM','San Marino','San Marino','N',999),
 ('678','STP','ST','Santo Tomé y Príncipe','Sao Tome and Principe','N',999),
 ('682','SAU','SA','Arabia Saudita','Saudi Arabia','N',999),
 ('686','SEN','SN','Senegal','Senegal','N',999),
 ('688','SRB','RS','Serbia','Serbia','N',999),
 ('690','SYC','SC','Seychelles','Seychelles','N',999),
 ('694','SLE','SL','Sierra Leona','Sierra Leone','N',999),
 ('702','SGP','SG','Singapur','Singapore','N',999),
 ('703','SVK','SK','Eslovaquia','Slovakia','S',999),
 ('704','VNM','VN','Vietnam','Vietnam','N',999),
 ('705','SVN','SI','Eslovenia','Slovenia','S',999),
 ('706','SOM','SO','Somalia','Somalia','N',999),
 ('710','ZAF','ZA','Sudáfrica','South Africa','N',999),
 ('716','ZWE','ZW','Zimbabue','Zimbabwe','N',999),
 ('724','ESP','ES','España','Spain','S',1),
 ('728','SSD','SS','Sudán del Sur','South Sudan','N',999),
 ('729','SDN','SD','Sudán','Sudan','N',999),
 ('740','SUR','SR','Surinam','Suriname','N',999),
 ('748','SWZ','SZ','Suazilandia','Eswatini','N',999),
 ('752','SWE','SE','Suecia','Sweden','S',999),
 ('756','CHE','CH','Suiza','Switzerland','N',999),
 ('760','SYR','SY','Siria','Syria','N',999),
 ('762','TJK','TJ','Tayikistán','Tajikistan','N',999),
 ('764','THA','TH','Tailandia','Thailand','N',999),
 ('768','TGO','TG','Togo','Togo','N',999),
 ('772','TKL','TK','Tokelau','Tokelau','N',999),
 ('776','TON','TO','Tonga','Tonga','N',999),
 ('780','TTO','TT','Trinidad y Tobago','Trinidad and Tobago','N',999),
 ('784','ARE','AE','Emiratos Árabes Unidos','United Arab Emirates','N',999),
 ('788','TUN','TN','Túnez','Tunisia','N',999),
 ('792','TUR','TR','Turquía','Turkey','N',999),
 ('795','TKM','TM','Turkmenistán','Turkmenistan','N',999),
 ('796','TCA','TC','Islas Turcas y Caicos','Turks and Caicos Islands','N',999),
 ('798','TUV','TV','Tuvalu','Tuvalu','N',999),
 ('800','UGA','UG','Uganda','Uganda','N',999),
 ('804','UKR','UA','Ucrania','Ukraine','N',999),
 ('807','MKD','MK','Macedonia del Norte','North Macedonia','N',999),
 ('818','EGY','EG','Egipto','Egypt','N',999),
 ('826','GBR','GB','Reino Unido','United Kingdom','N',999),
 ('831','GGY','GG','Bailía de Guernsey','Bailiwick of Guernsey','N',999),
 ('832','JEY','JE','Jersey','Bailiwick of Jersey','N',999),
 ('833','IMN','IM','Isla de Man','Isle of Man','N',999),
 ('834','TZA','TZ','Tanzania','Tanzania','N',999),
 ('840','USA','US','Estados Unidos','United States','N',999),
 ('850','MNP','VI','Islas Marianas del Norte','Northern Mariana Islands','N',999),
 ('854','BFA','BF','Burkina Faso','Burkina Faso','N',999),
 ('858','URY','UY','Uruguay','Uruguay','N',999),
 ('860','UZB','UZ','Uzbekistán','Uzbekistan','N',999),
 ('862','VEN','VE','Venezuela','Venezuela','N',999),
 ('876','WLF','WF','Wallis y Futuna','Wallis and Futuna','N',999),
 ('882','WSM','WS','Samoa','Samoa','N',999),
 ('887','YEM','YE','Yemen','Yemen','N',999),
 ('894','ZMB','ZM','Zambia','Zambia','N',999);


DELIMITER $$
DROP PROCEDURE IF EXISTS `GET_NEXT_CONT` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_NEXT_CONT`(IN pTipoDoc varchar(2), OUT pcont int)
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
END $$
DELIMITER ;

DROP TABLE IF EXISTS `suboc_consolidacion`;
CREATE TABLE `suboc_consolidacion` (
  `ID_CONSOLIDACION` int(11) NOT NULL,
  `SERIE_FACTURA` varchar(8) NOT NULL,
  `NRO_FACTURA` int(8) NOT NULL,
  `REQUEST_ID` varchar(100) DEFAULT NULL COMMENT 'ID único de la petición',
  `QUEUE_ID` int(11) DEFAULT NULL COMMENT 'ID de cola del sistema',
  `ISSUER_IRS_ID` varchar(50) DEFAULT NULL COMMENT 'NIF del emisor',
  `ISSUED_TIME` datetime DEFAULT NULL COMMENT 'Fecha y hora de emisión',
  `CHAIN_NUMBER` varchar(100) DEFAULT NULL COMMENT 'Número de cadena del sistema',
  `CHAIN_HASH` varchar(256) DEFAULT NULL COMMENT 'Hash de la cadena blockchain',
  `VERIFACTU_URL` text DEFAULT NULL COMMENT 'URL de verificación en AEAT',
  `QRCODE_BASE64` longtext DEFAULT NULL COMMENT 'Código QR en base64',
  `QRCODE_PNG` blob DEFAULT NULL COMMENT 'Código QR en PNG',
  `FECHA_PROCESAMIENTO` datetime DEFAULT current_timestamp() COMMENT 'Fecha de procesamiento',
  `ESTADO` varchar(20) DEFAULT 'PROCESADO' COMMENT 'Estado del procesamiento',
  `RESPUESTA_COMPLETA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JSON completo de respuesta del webservice' CHECK (json_valid(`RESPUESTA_COMPLETA`)),
  `PETICION_COMPLETA` longtext DEFAULT NULL COMMENT 'JSON completo de petición del webservice',
  PRIMARY KEY (`ID_CONSOLIDACION`) USING BTREE,
  UNIQUE KEY `UK_FACTURA` (`SERIE_FACTURA`,`NRO_FACTURA`) USING BTREE,
  KEY `IDX_REQUEST_ID` (`REQUEST_ID`) USING BTREE,
  KEY `IDX_FECHA_PROCESAMIENTO` (`FECHA_PROCESAMIENTO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

-- Verificar y agregar columnas en suboc_facturas
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_facturas' 
     AND column_name = 'CONSOLIDACION_FACTURA') = 0,
    'ALTER TABLE `suboc_facturas` ADD COLUMN `CONSOLIDACION_FACTURA` varchar(1) NULL DEFAULT ''N'' COMMENT ''S O N PARA SABER SI ESTÁ CONSOLIDADA LA FACTURA'' AFTER `APELLIDOS`;',
    'SELECT ''Column CONSOLIDACION_FACTURA already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_facturas' 
     AND column_name = 'ESSIMPL_FACTURA') = 0,
    'ALTER TABLE `suboc_facturas` ADD COLUMN `ESSIMPL_FACTURA` varchar(1) NULL DEFAULT ''N'' COMMENT ''S O N PARA SABER SI ES SIMPLIFICADA LA FACTURA'' AFTER `CONSOLIDACION_FACTURA`;',
    'SELECT ''Column ESSIMPL_FACTURA already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_facturas' 
     AND column_name = 'TIPOID_INT_CLIENTE_FACTURA') = 0,
    'ALTER TABLE `suboc_facturas` ADD COLUMN `TIPOID_INT_CLIENTE_FACTURA` varchar(20) NULL COMMENT ''ID O PASAPORTE PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL'' AFTER `PAIS_CLIENTE_FACTURA`;',
    'SELECT ''Column TIPOID_INT_CLIENTE_FACTURA already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Verificar y agregar columna en suboc_contadores
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_contadores' 
     AND column_name = 'DEFSIMPL_CONTADOR') = 0,
    'ALTER TABLE `suboc_contadores` ADD COLUMN `DEFSIMPL_CONTADOR` varchar(1) NULL DEFAULT ''N'' AFTER `DEFAULT_CONTADOR`;',
    'SELECT ''Column DEFSIMPL_CONTADOR already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Verificar y agregar columna en suboc_clientes
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_clientes' 
     AND column_name = 'TIPOID_INT_CLIENTE') = 0,
    'ALTER TABLE `suboc_clientes` ADD COLUMN `TIPOID_INT_CLIENTE` varchar(20) NULL COMMENT ''ID O PASAPORTE PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL'' AFTER `PAIS_CLIENTE`;',
    'SELECT ''Column TIPOID_INT_CLIENTE already exists'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Verificar y agregar columna en suboc_presupuestos
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_schema = DATABASE() 
     AND table_name = 'suboc_presupuestos' 
     AND column_name = 'TIPOID_INT_CLIENTE_FACTURA') = 0,
    'ALTER TABLE `suboc_presupuestos` ADD COLUMN `TIPOID_INT_CLIENTE_FACTURA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL COMMENT ''ID O PASAPORTE PARA EL TIPO DE IDENTIFICACIÓN INTERNACIONAL'' AFTER `PAIS_CLIENTE_FACTURA`;',
    'SELECT ''Column TIPOID_INT_CLIENTE_FACTURA already exists in suboc_presupuestos'' as Info;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Crear vista v_suboc_facturas
DROP VIEW IF EXISTS v_suboc_facturas;
create VIEW v_suboc_facturas as 
SELECT 
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
         ON F.PAIS_CLIENTE_FACTURA = P.COD_PAIS_ALPHA2; 
		
DROP TABLE IF EXISTS `suboc_param`;
CREATE TABLE IF NOT EXISTS `suboc_param`  (
  `NOMBRE_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `VALUE_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

DROP VIEW IF EXISTS `v_suboc_presupuestos`;
CREATE VIEW v_suboc_presupuestos as 
SELECT 
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
        AND F.SERIE_FACTURA = C.SERIE_FACTURA;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Procedimientos almacenados
DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_CLIENTE` $$
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
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_DUPLICADA` $$
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
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_ABONO` $$
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
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_PRESUPUESTO` $$
CREATE  PROCEDURE `PRC_CREAR_FACTURA_PRESUPUESTO`(IN `pidseriepresupuesto` varchar(200),
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
END $$
DELIMITER ;

-- DELIMITER $$
-- DROP PROCEDURE IF EXISTS `PRC_GET_DATA_CLIENTE` $$
-- CREATE PROCEDURE `PRC_GET_DATA_CLIENTE`(IN `pCODIGO_CLIENTE` int(10),
-- 												OUT `pRAZONSOCIAL_CLIENTE` varchar(200),
-- 												OUT `pNOMBRE` varchar(100),
-- 												OUT `pAPELLIDOS` varchar(100),
-- 												OUT `pNIF_CLIENTE` varchar(50),
-- 												OUT `pMOVIL_CLIENTE` varchar(40),
-- 												OUT `pEMAIL_CLIENTE` varchar(200),
-- 												OUT `pDIRECCION1_CLIENTE` varchar(200),
-- 												OUT `pDIRECCION2_CLIENTE` varchar(200),
-- 												OUT `pPOBLACION_CLIENTE` varchar(200),
-- 												OUT `pPROVINCIA_CLIENTE` varchar(200),
-- 												OUT `pCPOSTAL_CLIENTE` varchar(15),
-- 												OUT `pPAIS_CLIENTE` varchar(150),
-- 												OUT `pTIPOID_INT_CLIENTE` varchar(150))
-- BEGIN
--    IF( EXISTS(
--              SELECT *
--              FROM suboc_clientes
--              WHERE `CODIGO_CLIENTE` = `pCODIGO_CLIENTE`) ) THEN
-- 	BEGIN
-- 	  SELECT  `RAZONSOCIAL_CLIENTE`,
-- 		        `NOMBRE`,
-- 		        `APELLIDOS`,
-- 		        `NIF_CLIENTE`,
-- 		        `MOVIL_CLIENTE`,
-- 		        `EMAIL_CLIENTE`,
-- 		        `DIRECCION1_CLIENTE`,
-- 		        `DIRECCION2_CLIENTE`,
-- 		        `POBLACION_CLIENTE`,
-- 		        `PROVINCIA_CLIENTE`,
-- 		        `CPOSTAL_CLIENTE`,
-- 		        `PAIS_CLIENTE`,
-- 				`TIPOID_INT_CLIENTE`
--       INTO  `pRAZONSOCIAL_CLIENTE`,
-- 		        `pNOMBRE`,
-- 		        `pAPELLIDOS`,
-- 		        `pNIF_CLIENTE`,
-- 		        `pMOVIL_CLIENTE`,
-- 		        `pEMAIL_CLIENTE`,
-- 		        `pDIRECCION1_CLIENTE`,
-- 		        `pDIRECCION2_CLIENTE`,
-- 		        `pPOBLACION_CLIENTE`,
-- 		        `pPROVINCIA_CLIENTE`,
-- 		        `pCPOSTAL_CLIENTE`,
-- 		        `pPAIS_CLIENTE`,
-- 				`pTIPOID_INT_CLIENTE`
--       FROM suboc_clientes
-- 	   WHERE `CODIGO_CLIENTE` = `pCODIGO_CLIENTE`;
-- 	END;
-- 	ELSE
-- 	BEGIN
-- 	  SET pRAZONSOCIAL_CLIENTE = 'PACIENTE NO ENCONTRADO';
-- 	END;
--   END IF;
-- END $
-- DELIMITER ;

-- Crear tabla de log de eventos de Verifactu
CREATE TABLE IF NOT EXISTS `suboc_verifactu_log_eventos` (
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;

DELIMITER $
DROP PROCEDURE IF EXISTS `SET_CONSOLIDACION_FASE` $
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
END $
DELIMITER ;

-- Insertar parámetros de configuración usando INSERT IGNORE
INSERT IGNORE INTO `suboc_param` VALUES ('AUTHKEY_VERIFACTU', 'API-KEY');
INSERT IGNORE INTO `suboc_param` VALUES ('PASSKEY_VERIFACTU', '2wj3W4pKXfxh80V7P7b1lPPeEvrTbqZ6H1Yvnl2jFJ8xlB6yEGhKCAB3dHAFytHK2K6d8jc7D62yA6oFSX9zU3');
INSERT IGNORE INTO `suboc_param` VALUES ('URL_QR_OFFLINE', 'https://prewww2.aeat.es/wlpl/TIKE-CONT/ValidarQR?');
INSERT IGNORE INTO `suboc_param` VALUES ('URL_VERIFACTU_INVOICE', 'https://wortice.es/api-demo/invoice');
INSERT IGNORE INTO `suboc_param` VALUES ('URL_VERIFACTU_CANCEL', 'https://wortice.es/api-demo/invoice_cancel');
INSERT IGNORE INTO `suboc_param` VALUES ('URL_VERIFACTU_STATE', 'https://wortice.es/api-demo/invoice_state');
INSERT IGNORE INTO `suboc_param` VALUES ('VERIFACTU_RETRY_DELAY', '2000');
INSERT IGNORE INTO `suboc_param` VALUES ('VERIFACTU_MAX_RETRIES', '3');
INSERT IGNORE INTO `suboc_param` VALUES ('VERIFACTU_TIMEOUT', '3000');
INSERT IGNORE INTO `suboc_param` VALUES ('OFFLINE_PREFIX', 'LAO-');
INSERT IGNORE INTO `suboc_param` VALUES ('OFFLINE_NIF', 'A39200019');


-- Sistema de cola asíncrona
DROP TABLE IF EXISTS `suboc_verifactu_queue`;
CREATE TABLE IF NOT EXISTS `suboc_verifactu_queue` (
  `ID_QUEUE` bigint(20) NOT NULL AUTO_INCREMENT,
  `TIPO_OPERACION` enum('CONSOLIDAR','CONSULTAR_ESTADO') NOT NULL,
  `SERIE_FACTURA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NRO_FACTURA` int(8) NOT NULL,
  `FECHA_PROGRAMADA` datetime NOT NULL COMMENT 'Fecha y hora para ejecutar la operación',
  `FECHA_CREACION` datetime NOT NULL DEFAULT current_timestamp(),
  `ESTADO_COLA` enum('PENDIENTE','PROCESANDO','COMPLETADO','ERROR','CANCELADO') NOT NULL DEFAULT 'PENDIENTE',
  `INTENTOS` int(3) NOT NULL DEFAULT 0 COMMENT 'Número de intentos de procesamiento',
  `MAX_INTENTOS` int(3) NOT NULL DEFAULT 3 COMMENT 'Máximo número de intentos',
  `PRIORIDAD` int(3) NOT NULL DEFAULT 5 COMMENT '1=Alta, 5=Normal, 10=Baja',
  `ERROR_MESSAGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `FECHA_PROCESAMIENTO` datetime NULL DEFAULT NULL COMMENT 'Fecha real de procesamiento',
  `CREADO_POR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT 'SYSTEM',
  `NOTAS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL,
  `VERIFACTU_QUEUE_ID` int(11) NULL DEFAULT NULL COMMENT 'QueueId devuelto por Verifactu',
  `VERIFACTU_REQUEST_ID` varchar(100) NULL DEFAULT NULL COMMENT 'RequestId devuelto por Verifactu',
  `RESPUESTA_VERIFACTU` longtext NULL DEFAULT NULL COMMENT 'Respuesta completa de Verifactu',
  `CODIGO_ERROR_VERIFACTU` varchar(20) NULL DEFAULT NULL COMMENT 'Código de error devuelto por Verifactu',
  PRIMARY KEY (`ID_QUEUE`) USING BTREE,
  INDEX `IDX_FECHA_PROGRAMADA`(`FECHA_PROGRAMADA` ASC) USING BTREE,
  INDEX `IDX_ESTADO_COLA`(`ESTADO_COLA` ASC) USING BTREE,
  INDEX `IDX_FACTURA`(`SERIE_FACTURA` ASC, `NRO_FACTURA` ASC) USING BTREE,
  INDEX `IDX_PRIORIDAD`(`PRIORIDAD` ASC) USING BTREE,
  INDEX `IDX_READY_OPERATIONS`(`ESTADO_COLA`, `FECHA_PROGRAMADA`, `PRIORIDAD`),
  INDEX `IDX_ESTADO_FECHA` (`ESTADO_COLA`, `FECHA_PROGRAMADA`),
  INDEX `IDX_FACTURA_TIPO` (`SERIE_FACTURA`, `NRO_FACTURA`, `TIPO_OPERACION`),
  INDEX `IDX_VERIFACTU_QUEUE_ID`(`VERIFACTU_QUEUE_ID` ASC)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_spanish_ci 
COMMENT = 'Cola simplificada de procesamiento para operaciones de Verifactu';

-- Crear vistas del sistema de cola
DROP VIEW IF EXISTS `v_suboc_cola_verifactu`;
CREATE VIEW `v_suboc_cola_verifactu` AS
SELECT 
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
ORDER BY q.PRIORIDAD ASC, q.FECHA_PROGRAMADA ASC;

DROP VIEW IF EXISTS `v_suboc_cola_pendientes_summary`;
CREATE VIEW `v_suboc_cola_pendientes_summary` AS
SELECT 
    COUNT(*) as TOTAL_PENDIENTES,
    COUNT(CASE WHEN FECHA_PROGRAMADA <= NOW() THEN 1 END) as READY_NOW,
    COUNT(CASE WHEN ESTADO_COLA = 'PROCESANDO' THEN 1 END) as PROCESANDO,
    COUNT(CASE WHEN ESTADO_COLA = 'ERROR' THEN 1 END) as CON_ERROR
FROM suboc_verifactu_queue 
WHERE ESTADO_COLA IN ('PENDIENTE', 'PROCESANDO', 'ERROR');

-- Procedimientos para manejo de errores
DROP PROCEDURE IF EXISTS `PRC_RESUMEN_ERRORES_VERIFACTU`;
DELIMITER $
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
END $
DELIMITER ;

-- Función para buscar por QueueId de Verifactu
DROP FUNCTION IF EXISTS `FNC_BUSCAR_POR_VERIFACTU_QUEUE_ID`;
DELIMITER $
CREATE FUNCTION `FNC_BUSCAR_POR_VERIFACTU_QUEUE_ID`(pQueueId INT) 
RETURNS VARCHAR(100)
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
END $
DELIMITER ;

-- Trigger para cambios de estado en la cola
DROP TRIGGER IF EXISTS `TR_COLA_STATUS_CHANGE`;
DELIMITER $
CREATE TRIGGER `TR_COLA_STATUS_CHANGE` 
AFTER UPDATE ON `suboc_verifactu_queue` 
FOR EACH ROW 
BEGIN
    -- Log automático cuando se completa con QueueId
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
            1, -- Información
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
    
    -- Log automático cuando hay error de Verifactu
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
            3, -- Error
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
END $
DELIMITER ;

-- Procedimiento final para validación
DROP PROCEDURE IF EXISTS `PRC_GET_EMPTY_FACTURA_PARA_VALIDAR`;
DELIMITER $
CREATE PROCEDURE `PRC_GET_EMPTY_FACTURA_PARA_VALIDAR`(
    IN `pNif` varchar(10),
    IN `pRazonSocial` varchar(200),
    OUT `pJsonResult` longtext
)
BEGIN
    DECLARE vTotalFactura decimal(18,6);
    DECLARE vTotalIVA decimal(18,6);
    
    -- Calcular valores (simplificado)
    SET vTotalIVA = 0;
    SET vTotalFactura = 0;
    
    -- Construir JSON básico
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
END $
DELIMITER ;


UPDATE suboc_clientes set PAIS_CLIENTE = 'ES';
UPDATE suboc_facturas set PAIS_CLIENTE_FACTURA = 'ES';
