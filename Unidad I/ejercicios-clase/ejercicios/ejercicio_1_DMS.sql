TRUNCATE Estudiante;
TRUNCATE Maestro;
TRUNCATE Asignatura;

INSERT INTO Estudiantes (
    
    var_nombre_estudiante,
    var_carrera,
    int_edad,
    int_codigo_asignatura
) VALUES 
    ("José Inestroza", "Derecho",44,501),
    ("Carlos Cruz", "Filosofia",65,502)
;

INSERT INTO Maestro (
    
    var_nombre_maestro,
    int_edad,
    int_codigo_asignatura
) VALUES 
    ("Erick Vladimir", 30,501),
    ("David Zuniga", 56,502)
;