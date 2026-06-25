
----- PRE ENTREGA M3 -----

/* CREAR BASE DE DATOS */

CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;

/* DROP TABLES (Orden inverso de dependencias) */

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

/* DEFINICIÓN DEL ESQUEMA (DDL) Y RESTRICCIONES DE INTEGRIDAD */

-- 1. Tabla Categorías
CREATE TABLE Categorias (
    ID_Categoria INT PRIMARY KEY,
    Nombre_Categoria VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(200)
);

-- 2. Tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Ciudad VARCHAR(50),
    Fecha_Registro DATE NOT NULL
);

-- 3. Tabla Productos
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre_Producto VARCHAR(100) NOT NULL,
    ID_Categoria INT FOREIGN KEY REFERENCES Categorias(ID_Categoria) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    Activo TINYINT DEFAULT 1,
);

-- 4. Tabla Ventas 
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente) NOT NULL,
    ID_Producto INT FOREIGN KEY REFERENCES Productos(ID_Producto) NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Fecha_Venta DATE NOT NULL,
);

/* CARGA INICIAL DE DATOS ó Data Manipulation Language (DML): se usa para manipular la información de las tablas. */

-- 1. Carga de Categorías
INSERT INTO Categorias (ID_Categoria, Nombre_Categoria, Descripcion) VALUES 
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

-- 2. Carga de Clientes
INSERT INTO Clientes (ID_Cliente, Nombre, Email, Ciudad, Fecha_Registro) VALUES 
(1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10'),
(3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01'),
(4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15'),
(5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

-- 3. Carga de Productos
INSERT INTO Productos (ID_Producto, Nombre_Producto, ID_Categoria, Precio, Stock, Activo) VALUES 
(1, 'Laptop Pro 15',       1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico',   2,   28.00, 80, 1),
(3, 'Monitor 4K 27"',      1,  450.00, 12, 1),
(4, 'Auriculares BT Pro',  3,  120.00, 35, 1),
(5, 'SSD Externo 1TB',     4,  130.00, 18, 1),
(6, 'Teclado Mecánico',    2,   95.00, 40, 1);

-- 4. Carga de Ventas
INSERT INTO Ventas (ID_Venta, ID_Cliente, ID_Producto, Cantidad, Precio_Unitario, Fecha_Venta) VALUES 
(1,  1, 1, 2, 1200.00, '2024-03-05'),
(2,  2, 2, 5,   28.00, '2024-03-06'),
(3,  3, 3, 1,  450.00, '2024-03-07'),
(4,  1, 4, 2,  120.00, '2024-03-08'),
(5,  4, 5, 3,  130.00, '2024-03-10'),
(6,  2, 6, 4,   95.00, '2024-03-11'),
(7,  5, 1, 1, 1200.00, '2024-03-12'),
(8,  3, 2, 8,   28.00, '2024-03-13'),
(9,  4, 4, 1,  120.00, '2024-03-14'),
(10, 5, 3, 2,  450.00, '2024-03-15');

/* Verificación de integridad */
SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;