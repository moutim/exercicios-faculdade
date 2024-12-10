CREATE SCHEMA IF NOT EXISTS `faculdade` DEFAULT CHARACTER SET utf8;
USE `faculdade`;

CREATE TABLE IF NOT EXISTS `faculdade`.`Cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `faculdade`.`Alunos` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `curso_id` INT NOT NULL,
  PRIMARY KEY (`id_aluno`, `curso_id`),
  INDEX `fk_Alunos_Cursos_idx` (`curso_id`),
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`curso_id`)
    REFERENCES `faculdade`.`Cursos` (`id_curso`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `faculdade`.`Materias` (
  `id_materia` INT NOT NULL AUTO_INCREMENT,
  `nome_materia` VARCHAR(45) NOT NULL,
  `curso_id` INT NOT NULL,
  PRIMARY KEY (`id_materia`),
  INDEX `fk_Materias_Cursos1_idx` (`curso_id`),
  CONSTRAINT `fk_Materias_Cursos1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `faculdade`.`Cursos` (`id_curso`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `faculdade`.`Professores` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `faculdade`.`Turmas` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `materia_id` INT NOT NULL,
  `professor_id` INT NOT NULL,
  PRIMARY KEY (`id_turma`, `materia_id`, `professor_id`),
  INDEX `fk_Turmas_Materias1_idx` (`materia_id`),
  INDEX `fk_Turmas_Professores1_idx` (`professor_id`),
  CONSTRAINT `fk_Turmas_Materias1`
    FOREIGN KEY (`materia_id`)
    REFERENCES `faculdade`.`Materias` (`id_materia`),
  CONSTRAINT `fk_Turmas_Professores1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `faculdade`.`Professores` (`id_professor`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `faculdade`.`Notas` (
  `aluno_id` INT NOT NULL,
  `materia_id` INT NOT NULL,
  `nota` FLOAT NOT NULL,
  PRIMARY KEY (`aluno_id`, `materia_id`),
  INDEX `fk_Alunos_has_Materias_Materias1_idx` (`materia_id`),
  INDEX `fk_Alunos_has_Materias_Alunos1_idx` (`aluno_id`),
  CONSTRAINT `fk_Alunos_has_Materias_Alunos1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `faculdade`.`Alunos` (`id_aluno`),
  CONSTRAINT `fk_Alunos_has_Materias_Materias1`
    FOREIGN KEY (`materia_id`)
    REFERENCES `faculdade`.`Materias` (`id_materia`)
) ENGINE = InnoDB;
