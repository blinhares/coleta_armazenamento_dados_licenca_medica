CREATE TABLE `tb_estado` (
  `cod_estado` integer PRIMARY KEY,
  `estado` varchar(45)
);

CREATE TABLE `tb_estado_civil` (
  `cod_estado_civil` int PRIMARY KEY,
  `estado_civil` varchar(45)
);

CREATE TABLE `tb_escolaridade` (
  `cod_escolaridade` int PRIMARY KEY,
  `escolaridade` varchar(45)
);

CREATE TABLE `tb_hobbie` (
  `cod_hobbie` int PRIMARY KEY,
  `hobbie` varchar(45)
);

CREATE TABLE `tb_colaborador` (
  `cod_colaborador` int PRIMARY KEY,
  `nome_colaborador` varchar(45),
  `data_nascimento` date,
  `sexo_colaborador` varchar(45),
  `salario` decimal(10,2),
  `qtd_filhos` int,
  `possue_pet` varchar(3),
  `cod_estado_civil` int,
  `cod_escolaridade` int,
  `cod_hobbie` int,
  `cod_estado` int
);

CREATE TABLE `tb_processamento_licenca` (
  `cod_processamento` int PRIMARY KEY,
  `data_processamento` date,
  `inicio_licenca` date,
  `fim_licenca` date,
  `duracao_licenca` int,
  `cod_colaborador` int,
  `cod_medico` int,
  `cod_motivo_licenca` int
);

CREATE TABLE `tb_motivo_licenca` (
  `cod_motivo_licenca` int PRIMARY KEY,
  `motivo_licenca` varchar(45)
);

CREATE TABLE `tb_medico` (
  `cod_medico` int PRIMARY KEY,
  `nome_medico` varchar(45),
  `cod_especialidade` int
);

CREATE TABLE `tb_especialidade` (
  `cod_especialidade` int PRIMARY KEY,
  `especialidade` varchar(45)
);

ALTER TABLE `tb_colaborador` ADD FOREIGN KEY (`cod_estado_civil`) REFERENCES `tb_estado_civil` (`cod_estado_civil`);

ALTER TABLE `tb_colaborador` ADD FOREIGN KEY (`cod_escolaridade`) REFERENCES `tb_escolaridade` (`cod_escolaridade`);

ALTER TABLE `tb_colaborador` ADD FOREIGN KEY (`cod_hobbie`) REFERENCES `tb_hobbie` (`cod_hobbie`);

ALTER TABLE `tb_colaborador` ADD FOREIGN KEY (`cod_estado`) REFERENCES `tb_estado` (`cod_estado`);

ALTER TABLE `tb_processamento_licenca` ADD FOREIGN KEY (`cod_colaborador`) REFERENCES `tb_colaborador` (`cod_colaborador`);

ALTER TABLE `tb_processamento_licenca` ADD FOREIGN KEY (`cod_motivo_licenca`) REFERENCES `tb_motivo_licenca` (`cod_motivo_licenca`);

ALTER TABLE `tb_medico` ADD FOREIGN KEY (`cod_especialidade`) REFERENCES `tb_especialidade` (`cod_especialidade`);

ALTER TABLE `tb_processamento_licenca` ADD FOREIGN KEY (`cod_medico`) REFERENCES `tb_medico` (`cod_medico`);
