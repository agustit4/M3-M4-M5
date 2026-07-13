-------- PRE ENTREGA M4 --------------

USE Ventas_Tech_DB;

-- ===================================================================================================================
-- Consulta 1 — Resumen ejecutivo mensual : Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes.
-- ===================================================================================================================

SELECT 
    MONTH(Fecha_Venta) AS mes,
    SUM(Cantidad * Precio_Unitario) AS total_facturado,
    COUNT(ID_Venta) AS cantidad_pedidos,
    AVG(Cantidad * Precio_Unitario) AS ticket_promedio
FROM Ventas
GROUP BY MONTH(Fecha_Venta);

-- ============================================================================================================
-- Consulta 2 — Ranking de productos: Top 5 de id_producto por total facturado, mostrando las unidades vendidas.
-- ============================================================================================================
SELECT TOP (5)
    ID_Producto AS id_producto,
    SUM(Cantidad) AS unidades_vendidas,
    SUM(Cantidad * Precio_Unitario) AS total_generado
FROM Ventas
GROUP BY ID_Producto
ORDER BY total_generado DESC;


-- ======================================================================================================
-- Consulta 3 — Clientes recurrentes: id_cliente que hayan realizado más de un pedido y el total gastado.
-- ======================================================================================================

SELECT 
    ID_Cliente AS id_cliente,
    COUNT(ID_Venta) AS cantidad_pedidos,
    SUM(Cantidad * Precio_Unitario) AS total_gastado
FROM Ventas
GROUP BY ID_Cliente
HAVING COUNT(ID_Venta) > 1;


-- =======================================================================================================================
-- Consulta 4 — Meses por encima/por debajo del promedio: Compara el total de cada mes contra el promedio mensual general.
-- =======================================================================================================================

WITH totales_mensuales AS (
    SELECT 
        MONTH(Fecha_Venta) AS mes,
        SUM(Cantidad * Precio_Unitario) AS total_mensual
    FROM Ventas
    GROUP BY MONTH(Fecha_Venta)
)
SELECT 
    mes,
    total_mensual AS total_facturado,
    CASE 
        WHEN total_mensual >= (SELECT AVG(total_mensual) FROM totales_mensuales)
        THEN 'Por encima o igual'
        ELSE 'Por debajo'
    END AS rendimiento_vs_promedio
FROM totales_mensuales;


-- ============================================================================
-- Bloque de cierre: Hallazgos concretos del negocio (M4)
-- ============================================================================
/*
1. La actividad comercial se concentra en el mes de marzo, indicando un Q de 10 pedidos con un promedio de $644.40 y una facturación total de $6444.00
2. Realizamos una consulta del Top 5: se observa una fuerte dependencia del producto con ID 1 el cual concentra el volumen de facturación pero no el Q de unidades vendidas (en contraposición, por ejemplo, del produco con ID 5, el cual concentra Q de unidades vendidas pero no la facturación)
3. Clientes recurrentes: la Consulta 3 identifica los ID_Cliente con más de 1 pedido y su total gastado; a partir de eso se infiere retención.
*/
