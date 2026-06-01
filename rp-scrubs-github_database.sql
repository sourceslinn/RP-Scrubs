-- Creación de la base de datos para la marca
CREATE DATABASE rp_scrubs_db;
USE rp_scrubs_db;

-- Tabla base de prendas / productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT
);

-- Tabla para guardar el inventario por variaciones (Talla y Color/Estilo)
CREATE TABLE inventario_variaciones (
    id_variacion INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    corte VARCHAR(50) DEFAULT 'Unisex', -- Hombre, Mujer, Unisex
    talla VARCHAR(10) NOT NULL,         -- XCH, CH, M, G, XG
    color_diseno VARCHAR(50) NOT NULL,  -- Oxford, Coquette, Plumbago, etc.
    stock INT DEFAULT 0,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE
);

-- --- INSERCIÓN DEL INVENTARIO ESPECIFICADO ---

-- 1. Uniforme modelo Daila
INSERT INTO productos (id_producto, nombre, precio) VALUES (1, 'Uniforme modelo Daila', 480.00);
INSERT INTO inventario_variaciones (id_producto, talla, color_diseno, stock) VALUES
(1, 'XCH', 'Estándar', 15),
(1, 'CH', 'Estándar', 20),
(1, 'M', 'Estándar', 25),
(1, 'XG', 'Estándar', 10);

-- 2. Uniforme recto
INSERT INTO productos (id_producto, nombre, precio) VALUES (2, 'Uniforme recto', 470.00);
INSERT INTO inventario_variaciones (id_producto, corte, talla, color_diseno, stock) VALUES
(2, 'Hombre', 'CH', 'Oxford', 12), (2, 'Hombre', 'M', 'Negro', 15), 
(2, 'Mujer', 'CH', 'Marino', 18), (2, 'Mujer', 'M', 'Blanco', 10);

-- 3. Uniforme Jogger
INSERT INTO productos (id_producto, nombre, precio) VALUES (3, 'Uniforme Jogger', 470.00);
INSERT INTO inventario_variaciones (id_producto, corte, talla, color_diseno, stock) VALUES
(3, 'Hombre', 'M', 'Azul', 14), (3, 'Mujer', 'CH', 'Negro', 22), (3, 'Mujer', 'G', 'Morado', 9);

-- 4. Filipina estampada
INSERT INTO productos (id_producto, nombre, precio) VALUES (4, 'Filipina estampada', 280.00);
INSERT INTO inventario_variaciones (id_producto, talla, color_diseno, stock) VALUES
(4, 'CH', 'Bloom', 30), (4, 'M', 'Coquette', 25), (4, 'G', 'Polka Dots', 15), (4, 'XG', 'Cheetah', 12);

-- 5. Jumpsuit
INSERT INTO productos (id_producto, nombre, precio) VALUES (5, 'Jumpsuit', 510.00);
INSERT INTO inventario_variaciones (id_producto, talla, color_diseno, stock) VALUES
(5, 'XCH', 'Plumbago', 8), (5, 'CH', 'Berry Blush', 14), (5, 'M', 'Negro', 20), (5, 'G', 'Expresso', 11);