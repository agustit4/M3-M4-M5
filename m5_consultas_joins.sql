USE Ventas_Tech_DB;

-- ====================================================================================================
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- Combina ventas, clientes, productos y categorías. 
-- * Nota: Se usa 'Ciudad' de Clientes como 'Región/Territorio'. 
-- ====================================================================================================

SELECT 
    v.Fecha_Venta AS fecha,
    c.Nombre AS nombre_cliente,
    c.Ciudad AS region,             
    p.Nombre_Producto AS nombre_producto,
    cat.Nombre_Categoria AS categoria,
    v.Cantidad AS cantidad,
    v.Precio_Unitario AS precio_unitario,
    (v.Cantidad * v.Precio_Unitario) AS total_venta,
    v.Canal AS canal
FROM Ventas v
INNER JOIN Clientes c 
    ON v.ID_Cliente = c.ID_Cliente
INNER JOIN Productos p 
    ON v.ID_Producto = p.ID_Producto
INNER JOIN Categorias cat 
    ON p.ID_Categoria = cat.ID_Categoria;

-- ====================================================================================================
-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Identifica clientes registrados que aún no han realizado ninguna compra.
-- ====================================================================================================

SELECT 
    c.Nombre AS nombre_cliente,
    c.Email AS email,
    c.Fecha_Registro AS fecha_registro
FROM Clientes c
LEFT JOIN Ventas v 
    ON c.ID_Cliente = v.ID_Cliente
WHERE v.ID_Venta IS NULL;


-- ====================================================================================================
-- Consulta 3 — Productos sin ventas (LEFT JOIN)
-- Identifica productos del catálogo que no tienen ninguna venta registrada.
-- ====================================================================================================

SELECT 
    p.Nombre_Producto AS nombre_producto,
    cat.Nombre_Categoria AS categoria,
    p.Precio AS precio
FROM Productos p
INNER JOIN Categorias cat 
    ON p.ID_Categoria = cat.ID_Categoria
LEFT JOIN Ventas v 
    ON p.ID_Producto = v.ID_Producto
WHERE v.ID_Venta IS NULL;


	-- ====================================================================================================
	-- Consulta 4 — Consolidado por canal (UNION ALL + GROUP BY)
	-- En caso de que las ventas no estén separadas por tablas o canal explícito, 
	-- se simula la combinación entre ventas Online y Presenciales mediante subconsultas con UNION ALL.
	-- ====================================================================================================

WITH Ventas_Consolidadas AS (
    SELECT
        'Online' AS canal,
        ID_Venta,
        Cantidad,
        Precio_Unitario
    FROM Ventas
    WHERE Canal = 'Online'

    UNION ALL

    SELECT
        'Presencial' AS canal,
        ID_Venta,
        Cantidad,
        Precio_Unitario
    FROM Ventas
    WHERE Canal = 'Presencial'
)
SELECT
    canal,
    SUM(Cantidad * Precio_Unitario) AS total_facturado,
    COUNT(ID_Venta) AS total_operaciones
FROM Ventas_Consolidadas
GROUP BY canal;



