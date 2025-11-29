-- Script para crear la base de datos concesionaria y la tabla coches

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS concesionaria
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE concesionaria;

-- Crear la tabla coches
CREATE TABLE IF NOT EXISTS coches (
    id INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(20) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_marca (marca),
    INDEX idx_anio (anio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos de ejemplo (opcional - puedes comentar o eliminar si no los necesitas)
INSERT INTO coches (placa, marca, modelo, anio, tipo) VALUES
('ABC-1234', 'Toyota', 'Corolla', 2023, 'Sedán'),
('XYZ-5678', 'Honda', 'CR-V', 2022, 'SUV'),
('DEF-9012', 'Ford', 'F-150', 2024, 'Pickup'),
('GHI-3456', 'Chevrolet', 'Silverado', 2023, 'Pickup'),
('JKL-7890', 'Nissan', 'Versa', 2022, 'Sedán')
ON DUPLICATE KEY UPDATE placa=placa;

-- Verificar los datos insertados
SELECT * FROM coches;
