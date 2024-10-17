-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'AreaDePlantil'
-- Área de Cultivo
-- ---

DROP TABLE IF EXISTS `AreaDePlantil`;
		
CREATE TABLE `AreaDePlantil` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `IdCultura` INTEGER NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `DataInicio` DATE NULL DEFAULT NULL,
  `Latitude` DOUBLE NOT NULL DEFAULT NULL,
  `Longitude` DOUBLE NOT NULL DEFAULT NULL,
  `Largura` DOUBLE NOT NULL DEFAULT NULL,
  `Comprimento` DOUBLE NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Área de Cultivo';

-- ---
-- Table 'Sensor'
-- cadastro de sensores
-- ---

DROP TABLE IF EXISTS `Sensor`;
		
CREATE TABLE `Sensor` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Quadrante` VARCHAR(15) NOT NULL COMMENT 'Quadrante onde o sensor esta instalado',
  `SN` VARCHAR NULL DEFAULT NULL COMMENT 'Serial Number',
  `id_TipoSensor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'cadastro de sensores';

-- ---
-- Table 'DadoSensor'
-- Guarda os dados coletados pelos sensores
-- ---

DROP TABLE IF EXISTS `DadoSensor`;
		
CREATE TABLE `DadoSensor` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `Valor` DOUBLE NOT NULL,
  `IdSensor` INTEGER NOT NULL,
  `IdAreaDePlantil` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Guarda os dados coletados pelos sensores';

-- ---
-- Table 'Cultura'
-- Tipo de cultura
-- ---

DROP TABLE IF EXISTS `Cultura`;
		
CREATE TABLE `Cultura` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Tipo de cultura';

-- ---
-- Table 'TipoSensor'
-- Tipo de sensor, umidade, ph, npk etc...
-- ---

DROP TABLE IF EXISTS `TipoSensor`;
		
CREATE TABLE `TipoSensor` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
) COMMENT 'Tipo de sensor, umidade, ph, npk etc...';

-- ---
-- Table 'Atuador'
-- 
-- ---

DROP TABLE IF EXISTS `Atuador`;
		
CREATE TABLE `Atuador` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_TipoAtuador` INTEGER NULL DEFAULT NULL,
  `id_AreaDePlantil` INTEGER NOT NULL,
  `Quadrante` VARCHAR NULL DEFAULT NULL COMMENT 'Quadrante onde esta instalado',
  `SN` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'TipoAtuador'
-- 
-- ---

DROP TABLE IF EXISTS `TipoAtuador`;
		
CREATE TABLE `TipoAtuador` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Atuacao'
-- 
-- ---

DROP TABLE IF EXISTS `Atuacao`;
		
CREATE TABLE `Atuacao` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Atuador` INTEGER NULL DEFAULT NULL,
  `Data` DATETIME NULL DEFAULT NULL,
  `Valor` DOUBLE NULL DEFAULT NULL COMMENT 'Valor da quantidade de produto aplicado',
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `AreaDePlantil` ADD FOREIGN KEY (IdCultura) REFERENCES `Cultura` (`id`);
ALTER TABLE `Sensor` ADD FOREIGN KEY (id_TipoSensor) REFERENCES `TipoSensor` (`id`);
ALTER TABLE `DadoSensor` ADD FOREIGN KEY (IdSensor) REFERENCES `Sensor` (`id`);
ALTER TABLE `DadoSensor` ADD FOREIGN KEY (IdAreaDePlantil) REFERENCES `AreaDePlantil` (`id`);
ALTER TABLE `Atuador` ADD FOREIGN KEY (id_TipoAtuador) REFERENCES `TipoAtuador` (`id`);
ALTER TABLE `Atuador` ADD FOREIGN KEY (id_AreaDePlantil) REFERENCES `AreaDePlantil` (`id`);
ALTER TABLE `Atuacao` ADD FOREIGN KEY (id_Atuador) REFERENCES `Atuador` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `AreaDePlantil` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Sensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `DadoSensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `TipoSensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Atuador` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `TipoAtuador` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Atuacao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `AreaDePlantil` (`id`,`IdCultura`,`Nome`,`DataInicio`,`Latitude`,`Longitude`,`Largura`,`Comprimento`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Sensor` (`id`,`Quadrante`,`SN`,`id_TipoSensor`) VALUES
-- ('','','','');
-- INSERT INTO `DadoSensor` (`id`,`Data`,`Valor`,`IdSensor`,`IdAreaDePlantil`) VALUES
-- ('','','','','');
-- INSERT INTO `Cultura` (`id`,`Nome`) VALUES
-- ('','');
-- INSERT INTO `TipoSensor` (`id`,`Nome`) VALUES
-- ('','');
-- INSERT INTO `Atuador` (`id`,`id_TipoAtuador`,`id_AreaDePlantil`,`Quadrante`,`SN`) VALUES
-- ('','','','','');
-- INSERT INTO `TipoAtuador` (`id`,`Nome`) VALUES
-- ('','');
-- INSERT INTO `Atuacao` (`id`,`id_Atuador`,`Data`,`Valor`) VALUES
-- ('','','','');
