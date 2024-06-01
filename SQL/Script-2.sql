USE gardenDB;

-- 1
	SELECT id_oficina, nombre_ciudad
	FROM oficina
	INNER JOIN ciudad ON oficina.id_ciudad = ciudad.id_ciudad;


-- 2
SELECT nombre_ciudad, num_telefono
FROM ciudad
INNER JOIN oficina ON ciudad.id_ciudad = oficina.id_ciudad
INNER JOIN telefono_oficina ON oficina.id_oficina = telefono_oficina.id_oficina
INNER JOIN telefono ON telefono_oficina.id_telefono = telefono.id_telefono
INNER JOIN region ON ciudad.id_region = region.id_region
INNER JOIN pais ON region.id_pais = pais.id_pais
WHERE pais.nombre_pais = 'España';


-- 3
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE id_jefe = 7;


-- 4 -------------------------------------------------------------------------------
SELECT e1.puesto AS puesto_jefe,
       e2.nombre,
       e2.apellido1,
       e2.apellido2,
       e2.email
FROM empleado e1
JOIN empleado e2 ON e1.id_jefe = e2.id_empleado
WHERE e1.id_jefe IS NULL;	


-- 5
SELECT nombre, apellido1, apellido2, puesto
FROM empleado
WHERE puesto != 'Representante de Ventas';


-- 6
SELECT nombre_cliente
FROM cliente
INNER JOIN ciudad ON cliente.id_ciudad = ciudad.id_ciudad
INNER JOIN region ON ciudad.id_region = region.id_region
INNER JOIN pais ON region.id_pais = pais.id_pais
WHERE pais.nombre_pais = 'España';


-- 7 
SELECT estado
FROM estado;


-- 8
-- Utilizando la función YEAR de MySQL
SELECT DISTINCT id_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

-- Utilizando la función DATE_FORMAT de MySQL
SELECT DISTINCT id_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

-- Sin utilizar ninguna de las funciones anteriores
SELECT DISTINCT id_cliente
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';


-- 9
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega > fecha_esperada;

-- 10
-- Utilizando la función ADDDATE de MySQL
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);

-- Utilizando la función DATEDIFF de MySQL
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;


-- 11
SELECT *
FROM pedido
WHERE id_estado = (SELECT id_estado FROM estado WHERE estado = 'Rechazado')
AND YEAR(fecha_pedido) = 2009;


-- 12
SELECT *
FROM pedido
WHERE MONTH(fecha_entrega) = 1;


-- 13
SELECT *
FROM pago
WHERE YEAR(fecha_pago) = 2008
AND forma_pago = 'Paypal'
ORDER BY total DESC;


-- 14
SELECT DISTINCT forma_pago
FROM pago;


-- 15
SELECT *
FROM producto
WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;


-- 16
SELECT c.nombre_cliente
FROM cliente c
INNER JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
WHERE ci.nombre_ciudad = 'Madrid' AND (e.id_empleado = 11 OR e.id_empleado = 30);

/* consultas multitabla*/

-- 1
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e
WHERE c.id_empleado_rep_ventas = e.id_empleado;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado;




-- 2
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e, pago p
WHERE c.id_cliente = p.id_cliente AND c.id_empleado_rep_ventas = e.id_empleado;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN pago p ON c.id_cliente = p.id_cliente;



-- 3
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e
WHERE c.id_empleado_rep_ventas = e.id_empleado
AND c.id_cliente NOT IN (SELECT id_cliente FROM pago);

-- SQL2 (LEFT JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
WHERE p.id_cliente IS NULL;




-- 4
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c, empleado e, ciudad ci, oficina o, pago p
WHERE c.id_cliente = p.id_cliente 
AND c.id_empleado_rep_ventas = e.id_empleado
AND e.id_oficina = o.id_oficina
AND o.id_ciudad = ci.id_ciudad;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN oficina o ON e.id_oficina = o.id_oficina
INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad
INNER JOIN pago p ON c.id_cliente = p.id_cliente;



-- 5
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c, empleado e, ciudad ci, oficina o
WHERE c.id_empleado_rep_ventas = e.id_empleado
AND e.id_oficina = o.id_oficina
AND o.id_ciudad = ci.id_ciudad
AND c.id_cliente NOT IN (SELECT id_cliente FROM pago);

-- SQL2 (LEFT JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN oficina o ON e.id_oficina = o.id_oficina
INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
WHERE p.id_cliente IS NULL;



-- 6
-- SQL1
SELECT d.direccion
FROM direccion d, direccion_cliente dc, cliente c, ciudad ci, oficina o
WHERE d.id_direccion = o.id_oficina
AND o.id_oficina = ci.id_ciudad
AND ci.nombre_ciudad = 'Fuenlabrada';

-- SQL2 (INNER JOIN)
SELECT d.direccion
FROM direccion d
INNER JOIN oficina o ON d.id_direccion = o.id_oficina
INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad
INNER JOIN cliente c ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad = 'Fuenlabrada';




-- 7
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c, empleado e, ciudad ci, oficina o
WHERE c.id_empleado_rep_ventas = e.id_empleado
AND e.id_oficina = o.id_oficina
AND o.id_ciudad = ci.id_ciudad;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN oficina o ON e.id_oficina = o.id_oficina
INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad;




-- 8
-- SQL1
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1, empleado e2
WHERE e1.id_jefe = e2.id_empleado;

-- SQL2 (INNER JOIN)
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1
INNER JOIN empleado e2 ON e1.id_jefe = e2.id_empleado;




-- 9
-- SQL1
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe, e3.nombre AS nombre_jefe_jefe
FROM empleado e1, empleado e2, empleado e3
WHERE e1.id_jefe = e2.id_empleado
AND e2.id_jefe = e3.id_empleado;

-- SQL2 (INNER JOIN)
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe, e3.nombre AS nombre_jefe_jefe
FROM empleado e1
INNER JOIN empleado e2 ON e1.id_jefe = e2.id_empleado
INNER JOIN empleado e3 ON e2.id_jefe = e3.id_empleado;



-- 10
-- SQL1
SELECT c.nombre_cliente
FROM cliente c, pedido p
WHERE c.id_cliente = p.id_cliente
AND p.fecha_entrega > p.fecha_esperada;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.fecha_entrega > p.fecha_esperada;



-- 11
-- SQL1
SELECT DISTINCT c.nombre_cliente, g.gama
FROM cliente c, pedido p, detalle_pedido dp, producto pr, gama_producto g
WHERE c.id_cliente = p.id_cliente
AND p.id_pedido = dp.id_pedido
AND dp.id_producto = pr.id_producto
AND pr.gama = g.gama;

-- SQL2 (INNER JOIN)
SELECT DISTINCT c.nombre_cliente, g.gama
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
INNER JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
INNER JOIN producto pr ON dp.id_producto = pr.id_producto
INNER JOIN gama_producto g ON pr.gama = g.gama;



/* Multitabla externas */

-- 1
-- LEFT JOIN
SELECT c.*
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
WHERE p.id_transaccion IS NULL;




-- 2
-- LEFT JOIN
SELECT c.*, IFNULL(p.id_transaccion, 'No pago') AS pago_realizado, IFNULL(pe.id_pedido, 'No pedido') AS pedido_realizado
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente
WHERE p.id_transaccion IS NULL OR pe.id_pedido IS NULL;



-- 3
-- LEFT JOIN
SELECT c.*, IFNULL(p.id_transaccion, 'No pago') AS pago_realizado, IFNULL(pe.id_pedido, 'No pedido') AS pedido_realizado
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente
WHERE p.id_transaccion IS NULL OR pe.id_pedido IS NULL;




-- 4
-- LEFT JOIN
SELECT e.*
FROM empleado e
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
WHERE o.id_oficina IS NULL;



-- 5
-- LEFT JOIN
SELECT e.*
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
WHERE c.id_cliente IS NULL;



-- 6
-- LEFT JOIN
SELECT e.*, o.*
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
WHERE c.id_cliente IS NULL;




-- 7
-- LEFT JOIN
SELECT e.*, IFNULL(o.id_oficina, 'Sin oficina') AS oficina_asociada, IFNULL(c.id_cliente, 'Sin cliente') AS cliente_asociado
FROM empleado e
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas;




-- 8
-- RIGHT JOIN
SELECT p.*
FROM producto p
RIGHT JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
WHERE dp.id_pedido IS NULL;




-- 9
-- RIGHT JOIN
SELECT p.nombre, p.descripcion, p.imagen
FROM producto p
RIGHT JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
WHERE dp.id_pedido IS NULL;



-- 10
-- LEFT JOIN
SELECT o.*
FROM oficina o
LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
LEFT JOIN producto pr ON dp.id_producto = pr.id_producto
WHERE pr.gama = 'Frutales'
AND e.id_empleado IS NULL;



-- 11
-- LEFT JOIN
SELECT c.*
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN pago pa ON p.id_cliente = pa.id_cliente
WHERE pa.id_transaccion IS NULL AND p.id_pedido IS NOT NULL;


-- 12
-- LEFT JOIN
SELECT e.nombre, e.apellido1, e.apellido2, e.email, ej.nombre AS nombre_jefe, ej.apellido1 AS apellido1_jefe, ej.apellido2 AS apellido2_jefe
FROM empleado e
LEFT JOIN empleado ej ON e.id_jefe = ej.id_empleado
WHERE e.id_empleado NOT IN (SELECT DISTINCT id_empleado_rep_ventas FROM cliente WHERE id_empleado_rep_ventas IS NOT NULL);



/* consulta resumen */


-- 1
SELECT COUNT(*) AS total_empleados
FROM empleado;

-- 2
SELECT p.nombre_pais, COUNT(c.id_cliente) AS total_clientes
FROM pais p
LEFT JOIN ciudad ci ON p.id_pais = ci.id_pais
LEFT JOIN cliente c ON ci.id_ciudad = c.id_ciudad
GROUP BY p.nombre_pais;


-- 3
SELECT AVG(total) AS pago_medio_2009
FROM pago
WHERE YEAR(fecha_pago) = 2009;


-- 4
SELECT e.estado, COUNT(p.id_pedido) AS total_pedidos
FROM estado e
LEFT JOIN pedido p ON e.id_estado = p.id_estado
GROUP BY e.estado
ORDER BY total_pedidos DESC;


-- 5
SELECT MAX(precio_venta) AS precio_mas_caro, MIN(precio_venta) AS precio_mas_barato
FROM producto;


-- 6
SELECT COUNT(*) AS total_clientes
FROM cliente;


-- 7
SELECT COUNT(*) AS clientes_en_Madrid
FROM cliente c
JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
WHERE ci.nombre_ciudad = 'Madrid';


-- 8
SELECT ci.nombre_ciudad, COUNT(c.id_cliente) AS total_clientes
FROM ciudad ci
JOIN cliente c ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad LIKE 'M%'
GROUP BY ci.nombre_ciudad;


-- 9
SELECT CONCAT(e.nombre, ' ', e.apellido1) AS representante_ventas, COUNT(c.id_cliente) AS clientes_atendidos
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
WHERE e.puesto = 'Representante de ventas'
GROUP BY e.id_empleado;


-- 10
SELECT COUNT(*) AS clientes_sin_representante
FROM cliente
WHERE id_empleado_rep_ventas IS NULL;


-- 11
SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, 
       MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;


-- 12
SELECT id_pedido, COUNT(DISTINCT id_producto) AS productos_diferentes
FROM detalle_pedido
GROUP BY id_pedido;


-- 13
SELECT id_pedido, SUM(cantidad) AS cantidad_total
FROM detalle_pedido
GROUP BY id_pedido;


-- 14
SELECT p.nombre, SUM(dp.cantidad) AS total_unidades_vendidas
FROM producto p
JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto
ORDER BY total_unidades_vendidas DESC
LIMIT 20;


-- 15
SELECT SUM(precio_unidad * cantidad) AS base_imponible, 
       SUM(precio_unidad * cantidad) * 0.21 AS iva,
       SUM(precio_unidad * cantidad) + (SUM(precio_unidad * cantidad) * 0.21) AS total_facturado
FROM detalle_pedido;


-- 16
SELECT dp.id_producto, SUM(dp.precio_unidad * dp.cantidad) AS base_imponible, 
       SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado
FROM detalle_pedido dp
GROUP BY dp.id_producto;


-- 17
SELECT dp.id_producto, SUM(dp.precio_unidad * dp.cantidad) AS base_imponible, 
       SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
WHERE p.nombre LIKE 'OR%'
GROUP BY dp.id_producto;


-- 18
SELECT p.nombre, SUM(dp.cantidad) AS unidades_vendidas,
       SUM(dp.precio_unidad * dp.cantidad) AS total_facturado,
       (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado_con_iva
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
GROUP BY p.id_producto
HAVING total_facturado_con_iva > 3000;


-- 19
SELECT YEAR(fecha_pago) AS año, SUM(total) AS suma_total_pagos
FROM pago
GROUP BY YEAR(fecha_pago);


/* subconsultas */


-- 1
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);


-- 2
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);


-- 3
SELECT nombre
FROM producto
WHERE id_producto = (
    SELECT id_producto
    FROM detalle_pedido
    GROUP BY id_producto
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
);


-- 4
SELECT nombre_cliente
FROM cliente
WHERE limite_credito > (
    SELECT SUM(total)
    FROM pago
    WHERE pago.id_cliente = cliente.id_cliente
);


-- 5
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto);


-- 6
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);


-- 7
SELECT nombre, apellido1, email
FROM empleado
WHERE id_jefe = (
    SELECT id_empleado
    FROM empleado
    WHERE nombre = 'Alberto' AND apellido1 = 'Soria'
);


-- 8
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);


-- 9
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta FROM producto);


-- 10
SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock FROM producto);


-- 11
SELECT nombre, apellido1, puesto
FROM empleado
WHERE id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);


-- 12
SELECT *
FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM pago);


-- 13
SELECT *
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pago);


-- 14
SELECT *
FROM producto
WHERE id_producto NOT IN (SELECT id_producto FROM detalle_pedido);


-- 15
SELECT e.nombre, e.apellido1, e.puesto, t.num_telefono
FROM empleado e
JOIN telefono_oficina te ON e.id_oficina = te.id_oficina
JOIN telefono t ON te.id_telefono = t.id_telefono
WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);


-- 16
SELECT *
FROM oficina
WHERE id_oficina NOT IN (
    SELECT id_oficina
    FROM empleado
    WHERE id_empleado IN (
        SELECT id_empleado_rep_ventas
        FROM cliente
        WHERE id_cliente IN (
            SELECT id_cliente
            FROM pedido
            WHERE id_producto IN (
                SELECT id_producto
                FROM producto
                WHERE gama = 'Frutales'
            )
        )
    )
);

-- 17
SELECT nombre_cliente
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pedido)
AND id_cliente NOT IN (SELECT id_cliente FROM pago);


-- 18
SELECT nombre_cliente
FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM pago);


-- 19
SELECT nombre_cliente
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pago);


-- 20
SELECT nombre
FROM producto
WHERE id_producto NOT IN (SELECT id_producto FROM detalle_pedido);


-- 21
SELECT nombre
FROM producto
WHERE id_producto IN (SELECT id_producto FROM detalle_pedido);




/* subconsultas variadas */


-- 1
SELECT c.nombre_cliente, COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;


-- 2
SELECT c.nombre_cliente, COALESCE(SUM(pa.total), 0) AS total_pagado
FROM cliente c
LEFT JOIN pago pa ON c.id_cliente = pa.id_cliente
GROUP BY c.id_cliente;


-- 3
SELECT DISTINCT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre_cliente ASC;


-- 4
SELECT c.nombre_cliente, e.nombre, e.apellido1, t.num_telefono
FROM cliente c
LEFT JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
LEFT JOIN telefono_oficina tof ON e.id_oficina = tof.id_oficina
LEFT JOIN telefono t ON tof.id_telefono = t.id_telefono
WHERE c.id_cliente NOT IN (SELECT id_cliente FROM pago);


-- 5
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c
LEFT JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
LEFT JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad;


-- 6
SELECT e.nombre, e.apellido1, e.puesto, t.num_telefono
FROM empleado e
JOIN telefono_oficina tof ON e.id_oficina = tof.id_oficina
JOIN telefono t ON tof.id_telefono = t.id_telefono
WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);


-- 7
SELECT ci.nombre_ciudad, COUNT(e.id_empleado) AS num_empleados
FROM ciudad ci
LEFT JOIN oficina o ON ci.id_ciudad = o.id_ciudad
LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
GROUP BY ci.nombre_ciudad;





