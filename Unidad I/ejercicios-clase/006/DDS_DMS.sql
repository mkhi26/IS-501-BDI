DROP DATABASE IF EXISTS InformationTechnologies;

CREATE DATABASE InformationTechnologies CHARACTER SET utf8;

USE InformationTechnologies;

CREATE TABLE PCInventory (

    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_name TEXT NOT NULL,
    cod_type ENUM('Laptop', 'Desktop', 'Tablet') NOT NULL DEFAULT 'Laptop',
    sma_ram SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    sma_ssd SMALLINT UNSIGNED NOT NULL DEFAULT 0

); 

INSERT INTO PCInventory(tex_name, sma_ram, sma_ssd) VALUES 
    ("Asus P1020", 4, 32),
    ("Acer P1021", 8, 32),
    ("HP P1022", 16, 64),
    ("HP P1023", 32, 512),
    ("DELL XPS 12", 32, 512),
    ("DELL XPS 17 1", 16, 2048),
    ("DELL XPS 17 2", 64, 2048),
    ("DELL XPS 17 3", 16, 128),
    ("DELL XPS 17 4", 128, 256),
    ("DELL XPS 17 5", 128, 32),
    ("DELL XPS 17 6", 128, 48),
    ("DELL XPS 17 7", 8, 64),
    ("DELL XPS 17 8", 8, 128),
    ("DELL XPS 17 9", 8, 256)
;

-- Listar todos los computadores del inventario

SELECT tex_name AS "Nombre", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory;

-- Listar todos los computadores que tienen 16 o 64 GB de RAM
SELECT tex_name AS "Nombre", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory WHERE sma_ram in (16,64);

-- Listar todos los computadore que tienen tipo XPS dentro del nombre de "marca".
SELECT tex_name AS "Nombre", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory WHERE tex_name LIKE("%XPS%");

-- Cúantos computadores hay por cantidad de RAM
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad de RAM" FROM PCInventory GROUP BY (sma_ram);

-- Cúantos computadores hay por cantidad de RAM, mostrando los grupos donde hay dos o más dispositivos.
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad de RAM" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2);

-- Cúantos computadores hay por cantidad de RAM, mostrando solo tres registros de los grupos donde hay dos o más dispositivos.
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad de RAM" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*)) >= 2 LIMIT 3;

-- Cúantos computadores hay por cantidad de RAM, mostrando solo tres registros de los grupos donde hay dos o más dispositivos ordenados de mayor a menor.
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3;

-- Liste las computadoras que pertenecen a los 3 grupos mayores de RAM. Si una computadora pertenece a la 4ta mayor agrupación de RAM, entonce dicha computadora no debe aparecer en la búsqueda.

-- SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad de RAM" FROM PCInventory GROUP BY (sma_ram);

SELECT tex_name AS "Nombre del computador" FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`;

SELECT * FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`;

SELECT * FROM PCInventory LEFT JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`;

-- De las computadoras anteriores que pertencen a los tres grupos mayores de RAM, se desea saber qué marca son. De forma anticipada, usted como empleado de la empresa, sabe que la marca de la computadora siempre es "la primer palabra" en el nombre del inventario.

SELECT DISTINCT SUBSTRING_INDEX(tex_name,' ', 1) FROM (SELECT tex_name  FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`) AS PCGroupNoBigRAM;

-- Todas las compputadoras en inventario que no pertenecen a las marcas de los 3 grupos mas grandes de ram.


SELECT DISTINCT SUBSTRING_INDEX(tex_name,' ', 1) AS "Marca Respuesta 1" FROM PCInventory WHERE SUBSTRING_INDEX(tex_name,' ', 1)  NOT IN (SELECT DISTINCT SUBSTRING_INDEX(tex_name,' ', 1) FROM (SELECT tex_name  FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`) AS PCGroupNoBigRAM);

-- Todas las compputadoras en inventario que no pertenecen a las marcas de los 3 grupos mas grandes de ram, no use el operador IN, en su lugar aplique JOIN para verificar la existencia en las listas.

SELECT Inventario.`Marca` AS "Marca Respuesta 2" FROM (SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) AS "Marca" FROM PCInventory) AS Inventario LEFT JOIN (SELECT DISTINCT SUBSTRING_INDEX(tex_name,' ', 1) AS "Marca" FROM (SELECT tex_name  FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY (sma_ram) HAVING (COUNT(*) >= 2) ORDER BY sma_ram DESC LIMIT 3
) PCGroup ON PCInventory.sma_ram = PCGroup.`RAM`) AS PCGroupNoBigRAM) AS PCGroupBigRAM ON Inventario.`Marca` = PCGroupBigRAM.`Marca` WHERE PCGroupBigRAM.`Marca` IS NULL;