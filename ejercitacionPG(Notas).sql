-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema evaluacionPractica_notas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evaluacionPractica_notas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evaluacionPractica_notas` DEFAULT CHARACTER SET utf8 ;
USE `evaluacionPractica_notas` ;

-- -----------------------------------------------------
-- Table `evaluacionPractica_notas`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacionPractica_notas`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nota_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacionPractica_notas`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacionPractica_notas`.`Categorias` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacionPractica_notas`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacionPractica_notas`.`Notas` (
  `idNotas` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `titulo` TEXT(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_ultModificacion` DATETIME NOT NULL,
  `descripcion` TEXT(500) NOT NULL,
  `eliminable` TINYINT NOT NULL DEFAULT 1,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`idNotas`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) VISIBLE,
  INDEX `Notas_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `Notas_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `evaluacionPractica_notas`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Notas_cat`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `evaluacionPractica_notas`.`Categorias` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO Categorias (idCategorias, nombre) VALUES (1, 'Música');
INSERT INTO Categorias (idCategorias, nombre) VALUES (2, 'Artes Visuales');
INSERT INTO Categorias (idCategorias, nombre) VALUES (3, 'IT');
INSERT INTO Categorias (idCategorias, nombre) VALUES (4, 'Educación Fisica');
INSERT INTO Categorias (idCategorias, nombre) VALUES (5, 'Economia');
INSERT INTO Categorias (idCategorias, nombre) VALUES (6, 'Comunicacion');
INSERT INTO Categorias (idCategorias, nombre) VALUES (7, 'Ingenieria');
INSERT INTO Categorias (idCategorias, nombre) VALUES (8, 'Espiritualidad');
INSERT INTO Categorias (idCategorias, nombre) VALUES (9, 'Teatro');
INSERT INTO Categorias (idCategorias, nombre) VALUES (10, 'Comedia Musical');


INSERT INTO Notas (usuario_id, titulo, fecha_creacion, fecha_ultModificacion, descripcion, eliminable, categoria_id) VALUES
(1, 'Nota 1', '2023-03-12', '2023-03-12', 'Descripción de la nota 1', 1, 1),
(10, 'Nota 2', '2023-03-12', '2023-03-12', 'Descripción de la nota 2', 1, 1),
(9, 'Nota 3', '2023-03-12', '2023-03-12', 'Descripción de la nota 3', 1, 2),
(8, 'Nota 4', '2023-03-12', '2023-03-12', 'Descripción de la nota 4', 1, 2),
(7, 'Nota 5', '2023-03-12', '2023-03-12', 'Descripción de la nota 5', 1, 3),
(6, 'Nota 6', '2023-03-12', '2023-03-12', 'Descripción de la nota 6', 1, 3),
(5, 'Nota 7', '2023-03-12', '2023-03-12', 'Descripción de la nota 7', 1, 4),
(4, 'Nota 8', '2023-03-12', '2023-03-12', 'Descripción de la nota 8', 1, 4),
(3, 'Nota 9', '2023-03-12', '2023-03-12', 'Descripción de la nota 9', 1, 5),
(2, 'Nota 10', '2023-03-12', '2023-03-12', 'Descripción de la nota 10', 1, 5);

SELECT * FROM Notas;

DELETE FROM usuarios WHERE idUsuarios = 1 AND nombre = 'Shermie' AND email = 'sspurge0@japanpost.jp' AND nota_id = '89';
SELECT * FROM Usuarios;
UPDATE Usuarios SET idUsuarios = 1 WHERE nota_id =3;
DELETE FROM Usuarios WHERE idUsuarios > 1;

INSERT INTO Usuarios (idUsuarios,nombre, email, nota_id) VALUES
(1,'Roberto','roberto@gmail.com', 10),
(2,'Maria','maria@gmail.com', 9),
(3,'Eric','eric@gmail.com', 8),
(4,'Solange','solcito@gmail.com', 7),
(5,'Emmanuel','emma@gmail.com', 6),
(6,'Jazmin','jazmin@gmail.com', 5),
(7,'Pablo','pablo@gmail.com', 4),
(8,'Martin','martincho@gmail.com', 3),
(9,'Agustin','aguss@gmail.com', 2),
(10,'Benjamina','benjamina@gmail.com', 1);