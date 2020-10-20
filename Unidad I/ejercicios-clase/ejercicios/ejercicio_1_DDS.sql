DROP DATABASE IF EXISTS Instituto;

CREATE DATABASE Instituto;

USE Instituto;

CREATE TABLE IF NOT EXISTS Estudiante (
    int_id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    var_nombre_estudiante VARCHAR(50) NOT NULL,
    var_carrera VARCHAR(30) NOT NULL,
    int_edad INT NOT NULL
    ) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Maestro (
    int_id_maestro INT AUTO_INCREMENT PRIMARY KEY,
    var_nombre_maestro VARCHAR(50) NOT NULL,
    int_edad INT NOT NULL
    ) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Asignatura (
    int_codigo INT AUTO_INCREMENT PRIMARY KEY,
    var_nombre VARCHAR(50) NOT NULL,
    int_uv INT NOT NULL
    ) CHARACTER SET utf8;



