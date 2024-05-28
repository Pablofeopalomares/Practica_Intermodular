-- Borrado de la base de datos
DROP DATABASE IF EXISTS practica_intermodular;
CREATE DATABASE practica_intermodular;
USE practica_intermodular;

-- Creación de las tablas
CREATE TABLE Sol (
    id_sol INT PRIMARY KEY,
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    radio DECIMAL(10,2),
    temperatura DECIMAL(10,2),
    distancia_tierra DECIMAL(10,2),
    composicion VARCHAR(100),
    fecha_creacion DATE
);

CREATE TABLE Planeta (
    id_planeta INT PRIMARY KEY,
    nombre VARCHAR(50),
    radio DECIMAL(10,2),
    distancia_sol DECIMAL(10,2),
    periodo_orbital DECIMAL(10,2),
    temperatura DECIMAL(10,2),
    tipo_planeta VARCHAR(50),
    num_satelites INT,
    id_sol INT,
    fecha_creacion DATE,
    FOREIGN KEY (id_sol) REFERENCES Sol(id_sol)
);

CREATE TABLE Satélite (
    id_satélite INT PRIMARY KEY,
    nombre VARCHAR(50),
    planeta VARCHAR(50),
    radio DECIMAL(10,2),
    distancia_planeta DECIMAL(10,2),
    periodo_orbital DECIMAL(10,2),
    temperatura DECIMAL(10,2),
    tipo_cuerpo VARCHAR(50),
    id_planeta INT,
    fecha_creacion DATE,
    FOREIGN KEY (id_planeta) REFERENCES Planeta(id_planeta)
);

-- Inserción de datos
INSERT INTO Sol (id_sol, nombre, tipo, radio, temperatura, distancia_tierra, composicion, fecha_creacion) VALUES
(1, 'Sol', 'G2V', 696340.0, 5500.0, 149.6, '74% Hidrógeno, 24% Helio, 2% Otros', '2023-04-01');

INSERT INTO Planeta (id_planeta, nombre, radio, distancia_sol, periodo_orbital, temperatura, tipo_planeta, num_satelites, id_sol, fecha_creacion) VALUES
(1, 'Mercurio', 2439.7, 57.9, 88.0, 167.0, 'Rocoso', 0, 1, '2023-04-02'),
(2, 'Venus', 6051.8, 108.2, 225.0, 464.0, 'Rocoso', 0, 1, '2023-04-03'),
(3, 'Tierra', 6371.0, 149.6, 365.25, 15.0, 'Rocoso', 1, 1, '2023-04-04'),
(4, 'Marte', 3389.5, 227.9, 687.0, -65.0, 'Rocoso', 2, 1, '2023-04-05'),
(5, 'Júpiter', 69911.0, 778.5, 4333.0, -110.0, 'Gaseoso', 79, 1, '2023-04-06'),
(6, 'Saturno', 58232.0, 1429.4, 10759.0, -140.0, 'Gaseoso', 82, 1, '2023-04-07'),
(7, 'Urano', 25362.0, 2870.9, 30687.0, -195.0, 'Gaseoso', 27, 1, '2023-04-08'),
(8, 'Neptuno', 24622.0, 4498.3, 60190.0, -200.0, 'Gaseoso', 14, 1, '2023-04-09');

INSERT INTO Satélite (id_satélite, nombre, planeta, radio, distancia_planeta, periodo_orbital, temperatura, tipo_cuerpo, id_planeta, fecha_creacion) VALUES
(1, 'Luna', 'Tierra', 1737.4, 384400.0, 27.3, -53.0, 'Sólido/Rocoso', 3, '2023-04-10'),
(2, 'Fobos', 'Marte', 11.1, 9378.0, 0.3, -40.0, 'Sólido/Rocoso', 4, '2023-04-11'),
(3, 'Deimos', 'Marte', 6.2, 23460.0, 1.3, -40.0, 'Sólido/Rocoso', 4, '2023-04-12'),
(4, 'Ío', 'Júpiter', 1821.6, 421700.0, 1.8, -143.0, 'Sólido/Rocoso', 5, '2023-04-13'),
(5, 'Europa', 'Júpiter', 1560.8, 670900.0, 3.5, -160.0, 'Sólido/Hielo', 5, '2023-04-14'),
(6, 'Ganimedes', 'Júpiter', 2634.1, 1070400.0, 7.2, -163.0, 'Sólido/Hielo', 5, '2023-04-15'),
(7, 'Calisto', 'Júpiter', 2410.3, 1882700.0, 16.7, -139.0, 'Sólido/Hielo', 5, '2023-04-16'),
(8, 'Tritón', 'Neptuno', 1353.4, 354800.0, 5.87, -235.0, 'Sólido/Hielo', 8, '2023-04-17');

DELIMITER //
CREATE TRIGGER fecha_creacion_sol
before insert on Sol
for each row 
begin
set new.fecha_creacion = SYSDATE();
end;
//
DELIMITER;

DELIMITER //
CREATE TRIGGER fecha_creacion_planeta
before insert on Planeta
for each row 
begin
set new.fecha_creacion = SYSDATE();
end;
//
DELIMITER;

DELIMITER //
CREATE TRIGGER fecha_creacion_satelites
before insert on Satélite
for each row 
begin
set new.fecha_creacion = SYSDATE();
end;
//