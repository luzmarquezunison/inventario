-- ============================================================
--  Script de inicialización de la base de datos "inventario"
--  MySQL lo ejecuta automáticamente SOLO la primera vez,
--  cuando el volumen datos_mysql está vacío.
-- ============================================================

SET NAMES utf8mb4;
USE inventario;

CREATE TABLE IF NOT EXISTS equipos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    tipo            ENUM('Laptop','Escritorio','Servidor','Impresora','Switch','Router','Otro') NOT NULL,
    marca           VARCHAR(50)  NOT NULL,
    numero_serie    VARCHAR(50)  NOT NULL UNIQUE,
    ubicacion       VARCHAR(100) NOT NULL,
    estado          ENUM('Activo','En reparación','Baja') NOT NULL DEFAULT 'Activo',
    fecha_registro  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registros de ejemplo (datos ficticios)
INSERT INTO equipos (nombre, tipo, marca, numero_serie, ubicacion, estado) VALUES
('Servidor de laboratorio', 'Servidor',   'Dell',   'SRV-0001', 'Laboratorio de Redes', 'Activo'),
('Switch principal',        'Switch',     'Cisco',  'SW-0001',  'Laboratorio de Redes', 'Activo'),
('Impresora de oficina',    'Impresora',  'HP',     'IMP-0001', 'Coordinación',         'En reparación');
