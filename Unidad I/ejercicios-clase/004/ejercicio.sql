-- Creación de la base de datos, únicamente si wata no existe

CREATE DATABASE IF NOT EXISTS GameCatalogue;

-- Se selecciona la base de datos para su uso.
USE GameCatalogue;

-- Se crean las tabñas de base de datos

CREATE Table IF NOT EXISTS Player(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_name TEXT NOT NULL,
    tim_creation TIMESTAMP DEFAULT NOW(),
    cod_state ENUM('active', 'blocked', 'inactive') DEFAULT 'active'
) CHARACTER SET utf8;
CREATE Table IF NOT EXISTS Game(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tec_name TEXT NOT NULL

) CHARACTER SET utf8;

CREATE Table IF NOT EXISTS GamePlayer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_player INT NOT NULL,
    id_game INT NOT NULL,
    tim_lastPlayed TIMESTAMP NULL,
    cod_state ENUM('on-progress', 'not-played', 'beated') DEFAULT 'not-played'

) CHARACTER SET utf8;


/*
-- Eliminar Tablas
DROP TABLE Player;
DROP TABLE Game;
DROP TABLE GamePlayer;

-- Eliminar la Base de Datos
DROP DATABASE GameCatalogue;

*/

/*
    Se le pide al estudiante es:
    - Crear el diagrama y el modelo ER
    - Aplicar las restricciones de integridad de foreign key basaado en su ER
    - Aplicar las restricciones de integridad mediante CREATE TABLE y mediante ALTER TABLE.
*/