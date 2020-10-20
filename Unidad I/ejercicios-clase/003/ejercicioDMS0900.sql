-- La limpieza de las tablas, en caso que las tablas ya existan

TRUNCATE  Gerencia;
TRUNCATE  Departamento;
TRUNCATE  Usuario;
TRUNCATE  Lista;
TRUNCATE  Tarea;

-- Se agregan datos de prueba a las tablas.

-- Gerencia(Aqui van los campos sobre los cuales se ingresaran los datos), id es autoincrementado

INSERT INTO Gerencia(nombre) VALUES   
    ("Tecnologías de información"),
    ("Mercadeo")
;

INSERT INTO Departamento(id_gerencia, nombre) VALUES
    (1,"Desarrollo web"),
    (1,"Desarrollo móvil"),
    (2,"Canales Digitales")

;

INSERT INTO Usuario(id_departamento, nombre) VALUES 

    (1, "Alan Vigil"),
    (2, "Alejandra Ramos"),
    (3, "Yelmi Elvir")
;

INSERT INTO Lista(id_usuario, nombre) VALUES

    (1, "Bases de datos 1"),
    (1, "Videojuegos para los feriados"),
    (3, "Peliculas pendientes")
 ;

 INSERT INTO Tarea(id_lista, descripcion) VALUES 
    (1,"Aprendeer sobre el modelo ER."),
    (1,"Aprendeer sobre el modelo ER."),
    (1,"Listar todas las sentencias de SQL para insertar, modificar y seleccionar registros."),
    (2, "Metal Gear Solid Colection"),
    (3, "El silencio de los ino...")
 ;

-- Actualización
UPDATE Tarea SET estado = "completada" WHERE id = 1;

-- Consultas

SELECT Lista.id_usuario AS "Identificador de usuario", Tarea.estado AS "Estado de la tarea", COUNT(*) AS "Cantida de tareas" ,(SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista .id WHERE Lista.id_usuario = Usuario.id) AS "Total de registros del Usuario", CONCAT(COUNT(*)/(SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista .id WHERE Lista.id_usuario = Usuario.id)*100," %") AS "Porcentaje" FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id GROUP BY Lista.id_usuario, Tarea.estado;

-- SubConsulta, Podemos hacer otras consultas dentro de una consulta (SubConsultas)