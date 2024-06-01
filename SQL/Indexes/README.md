# Indexes Db Garden

```mysql
    SHOW TABLES;
    +--------------------+
    | Tables_in_gardenDB |
    +--------------------+
    | ciudad             |
    | cliente            |
    | detalle_pedido     |
    | direccion          |
    | direccion_cliente  |
    | direccion_oficina  |
    | empleado           |
    | estado             |
    | gama_producto      |
    | oficina            |
    | pago               |
    | pais               |
    | pedido             |
    | producto           |
    | proveedor          |
    | region             |
    | telefono           |
    | telefono_cliente   |
    | telefono_oficina   |
    | tipo_direccion     |
    | tipo_telefono      |
    +--------------------+
```

### Consultas sobre una tabla
1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

```sql
SELECT id_oficina, nombre_ciudad
FROM oficina
INNER JOIN ciudad ON oficina.id_ciudad = ciudad.id_ciudad;
```
```mysql
+------------+---------------+
| id_oficina | nombre_ciudad |
+------------+---------------+
|          1 | Madrid        |
|          2 | Sevilla       |
|          3 | Valencia      |
+------------+---------------+

```

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

```sql
SELECT nombre_ciudad, num_telefono
FROM ciudad
INNER JOIN oficina ON ciudad.id_ciudad = oficina.id_ciudad
INNER JOIN telefono_oficina ON oficina.id_oficina = telefono_oficina.id_oficina
INNER JOIN telefono ON telefono_oficina.id_telefono = telefono.id_telefono
INNER JOIN region ON ciudad.id_region = region.id_region
INNER JOIN pais ON region.id_pais = pais.id_pais
WHERE pais.nombre_pais = 'España';
```
```mysql
+---------------+--------------+
| nombre_ciudad | num_telefono |
+---------------+--------------+
| Madrid        | 4567890123   |
| Sevilla       | 5678901234   |
| Valencia      | 6789012345   |
+---------------+--------------+
```

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

```sql
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE id_jefe = 7;
```
```mysql
+--------+-----------+-----------+--------------------------+
| nombre | apellido1 | apellido2 | email                    |
+--------+-----------+-----------+--------------------------+
| Frank  | Wilson    | NULL      | frank.wilson@example.com |
| Grace  | Moore     | NULL      | grace.moore@example.com  |
| Hank   | Taylor    | NULL      | hank.taylor@example.com  |
+--------+-----------+-----------+--------------------------+

```

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

```sql
SELECT puesto AS puesto_jefe,
       nombre,
       apellido1,
       apellido2,
       email
FROM empleado
WHERE id_jefe IS NULL;	
```
```mysql
+------------------+--------+-----------+-----------+----------------------+
| puesto_jefe      | nombre | apellido1 | apellido2 | email                |
+------------------+--------+-----------+-----------+----------------------+
| Director General | John   | Doe       | NULL      | john.doe@example.com |
+------------------+--------+-----------+-----------+----------------------+
```

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

```sql
SELECT nombre, apellido1, apellido2, puesto
FROM empleado
WHERE puesto != 'Representante de Ventas';
```
```mysql
+--------+-----------+-----------+-----------------------+
| nombre | apellido1 | apellido2 | puesto                |
+--------+-----------+-----------+-----------------------+
| John   | Doe       | NULL      | Director General      |
| Jane   | Smith     | NULL      | Subdirector Marketing |
| Alice  | Johnson   | NULL      | Subdirector Ventas    |
| David  | Davis     | NULL      | Secretaria            |
| Eve    | Miller    | NULL      | Director Oficina      |
+--------+-----------+-----------+-----------------------+

```

6. Devuelve un listado con el nombre de los todos los clientes españoles.

```sql
SELECT nombre_cliente
FROM cliente
INNER JOIN ciudad ON cliente.id_ciudad = ciudad.id_ciudad
INNER JOIN region ON ciudad.id_region = region.id_region
INNER JOIN pais ON region.id_pais = pais.id_pais
WHERE pais.nombre_pais = 'España';
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| TechCorp       |
| RiverSide      |
| Sunshine Ltd.  |
| Thunderbolt    |
| EarthBound     |
| WaveMotion     |
| QuantumTech    |
| AeroDynamics   |
| FusionCore     |
+----------------+
```

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

```sql
-- 7 
SELECT estado
FROM estado;
```
```mysql
+------------+
| estado     |
+------------+
| En proceso |
| Rechazado  |
| Enviado    |
| Entregado  |
+------------+

```

8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
• Utilizando la función YEAR de MySQL.

```sql
SELECT DISTINCT id_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;
```
```mysql
+------------+
| id_cliente |
+------------+
|          1 |
|          5 |
|          6 |
|         10 |
|         15 |
+------------+

```

• Utilizando la función DATE_FORMAT de MySQL.

```sql
SELECT DISTINCT id_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';
```
```mysql
+------------+
| id_cliente |
+------------+
|          1 |
|          5 |
|          6 |
|         10 |
|         15 |
+------------+

```

• Sin utilizar ninguna de las funciones anteriores.

```sql
SELECT DISTINCT id_cliente
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';
```
```mysql
+------------+
| id_cliente |
+------------+
|          1 |
|          5 |
|          6 |
|         10 |
|         15 |
+------------+
```

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

```sql
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega > fecha_esperada;
```
```mysql
+-----------+------------+----------------+---------------+
| id_pedido | id_cliente | fecha_esperada | fecha_entrega |
+-----------+------------+----------------+---------------+
|         2 |          2 | 2024-05-03     | 2024-05-04    |
|         3 |          3 | 2024-05-04     | 2024-05-05    |
|         6 |          6 | 2024-05-07     | 2024-05-08    |
|         7 |          7 | 2024-05-08     | 2024-05-09    |
|        11 |         11 | 2024-05-12     | 2024-05-13    |
|        14 |         14 | 2024-05-15     | 2024-05-16    |
|        17 |         17 | 2008-05-18     | 2008-05-19    |
+-----------+------------+----------------+---------------+
```

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.
• Utilizando la función ADDDATE de MySQL.

```sql
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);
```
```mysql
+-----------+------------+----------------+---------------+
| id_pedido | id_cliente | fecha_esperada | fecha_entrega |
+-----------+------------+----------------+---------------+
|         1 |          1 | 2024-05-02     | 2024-04-03    |
|         4 |          4 | 2024-05-05     | 2024-01-06    |
|         5 |          5 | 2024-05-06     | 2024-04-07    |
|         8 |          8 | 2024-05-09     | 2024-01-10    |
|         9 |          9 | 2024-05-10     | 2024-01-11    |
|        10 |         10 | 2008-05-11     | 2008-04-12    |
|        12 |         12 | 2024-05-13     | 2024-01-14    |
|        13 |         13 | 2024-05-14     | 2024-04-15    |
|        15 |         15 | 2008-05-16     | 2008-04-17    |
|        16 |         16 | 2024-05-17     | 2024-01-18    |
+-----------+------------+----------------+---------------+
```

• Utilizando la función DATEDIFF de MySQL.

```sql
SELECT id_pedido, id_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
```
```mysql
+-----------+------------+----------------+---------------+
| id_pedido | id_cliente | fecha_esperada | fecha_entrega |
+-----------+------------+----------------+---------------+
|         1 |          1 | 2024-05-02     | 2024-04-03    |
|         4 |          4 | 2024-05-05     | 2024-01-06    |
|         5 |          5 | 2024-05-06     | 2024-04-07    |
|         8 |          8 | 2024-05-09     | 2024-01-10    |
|         9 |          9 | 2024-05-10     | 2024-01-11    |
|        10 |         10 | 2008-05-11     | 2008-04-12    |
|        12 |         12 | 2024-05-13     | 2024-01-14    |
|        13 |         13 | 2024-05-14     | 2024-04-15    |
|        15 |         15 | 2008-05-16     | 2008-04-17    |
|        16 |         16 | 2024-05-17     | 2024-01-18    |
+-----------+------------+----------------+---------------+
```

• ¿Sería posible resolver esta consulta utilizando el operador de suma + o
resta -?

```sql
ño se :c
```

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

```sql
SELECT *
FROM pedido
WHERE id_estado = (SELECT id_estado FROM estado WHERE estado = 'Rechazado')
AND YEAR(fecha_pedido) = 2009;
```
```mysql
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
| id_pedido | fecha_pedido | fecha_esperada | fecha_entrega | id_estado | observaciones  | id_cliente | id_empleado |
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
|         2 | 2009-05-02   | 2024-05-03     | 2024-05-04    |         2 | Pedido regular |          2 |           2 |
|         5 | 2009-05-05   | 2024-05-06     | 2024-04-07    |         2 | Pedido urgente |          5 |           5 |
|        11 | 2009-05-11   | 2024-05-12     | 2024-05-13    |         2 | Pedido urgente |         11 |           1 |
|        14 | 2009-05-14   | 2024-05-15     | 2024-05-16    |         2 | Pedido regular |         14 |           4 |
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
```

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

```sql
SELECT *
FROM pedido
WHERE MONTH(fecha_entrega) = 1;
```
```mysql
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
| id_pedido | fecha_pedido | fecha_esperada | fecha_entrega | id_estado | observaciones  | id_cliente | id_empleado |
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
|         4 | 2024-05-04   | 2024-05-05     | 2024-01-06    |         1 | Pedido regular |          4 |           4 |
|         8 | 2024-05-08   | 2024-05-09     | 2024-01-10    |         2 | Pedido regular |          8 |           8 |
|         9 | 2024-05-09   | 2024-05-10     | 2024-01-11    |         3 | Pedido urgente |          9 |           9 |
|        12 | 2024-05-12   | 2024-05-13     | 2024-01-14    |         3 | Pedido regular |         12 |           2 |
|        16 | 2024-05-16   | 2024-05-17     | 2024-01-18    |         1 | Pedido regular |         16 |           6 |
+-----------+--------------+----------------+---------------+-----------+----------------+------------+-------------+
```

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

```sql
SELECT *
FROM pago
WHERE YEAR(fecha_pago) = 2008
AND forma_pago = 'Paypal'
ORDER BY total DESC;
```
```mysql
+----------------+------------+------------+------------+--------+
| id_transaccion | id_cliente | forma_pago | fecha_pago | total  |
+----------------+------------+------------+------------+--------+
|             10 |         10 | Paypal     | 2008-05-22 | 195.00 |
|              5 |          5 | Paypal     | 2008-05-27 | 190.00 |
|             15 |         15 | Paypal     | 2008-05-17 | 175.00 |
+----------------+------------+------------+------------+--------+
```

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

```sql
SELECT DISTINCT forma_pago
FROM pago;
```
```mysql
+------------------------+
| forma_pago             |
+------------------------+
| Tarjeta de crédito     |
| Transferencia bancaria |
| Efectivo               |
| Tarjeta de débito      |
| Paypal                 |
+------------------------+
```

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

```sql
SELECT *
FROM producto
WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;
```
```mysql
+-------------+----------+--------------+--------------------------+--------------+-------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| id_producto | nombre   | gama         | dimensiones              | id_proveedor | descripcion                                                                                                       | cantidad_en_stock | precio_venta | precio_proveedor |
+-------------+----------+--------------+--------------------------+--------------+-------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
|          12 | Rosa     | Ornamentales | 0,80 m x 0,60 m x 0,60 m |            7 | Arbusto ornamental con flores de diversos colores y fragancias. Ideal para jardines, macetas y arreglos florales. |               130 |        15.00 |            11.00 |
|          21 | Surfinia | Ornamentales | 0,30 m x 0,25 m x 0,25 m |            7 | Planta ornamental de flores colgantes y abundantes. Ideal para jardines, macetas y cestas colgantes.              |               103 |         6.00 |             4.00 |
|          20 | Begonia  | Ornamentales | 0,25 m x 0,20 m x 0,20 m |            7 | Planta ornamental de flores vistosas y hojas decorativas. Ideal para jardines, macetas y cestas colgantes.        |               109 |         5.00 |             3.50 |
+-------------+----------+--------------+--------------------------+--------------+-------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

```

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 5 o 10.


```sql
SELECT c.nombre_cliente
FROM cliente c
INNER JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
WHERE ci.nombre_ciudad = 'Madrid' AND (e.id_empleado = 5 OR e.id_empleado = 10);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| Sunshine Ltd.  |
| Thunderbolt    |
| EarthBound     |
+----------------+
```


### Consultas multitabla (Composición interna)
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.
1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

```sql
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e
WHERE c.id_empleado_rep_ventas = e.id_empleado;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado;
```
```mysql
+----------------+---------+-----------+
| nombre_cliente | nombre  | apellido1 |
+----------------+---------+-----------+
| TechCorp       | Eve     | Miller    |
| GreenFields    | Grace   | Moore     |
| Sunshine Ltd.  | Charlie | Brown     |
| OceanBlue      | Frank   | Wilson    |
| SkyHigh Inc.   | Hank    | Taylor    |
| MountainView   | Charlie | Brown     |
| RiverSide      | Frank   | Wilson    |
| StarLight      | Grace   | Moore     |
| Galaxy Co.     | Charlie | Brown     |
| Thunderbolt    | Hank    | Taylor    |
| WindPower      | Eve     | Miller    |
| FireLight      | Grace   | Moore     |
| EarthBound     | Charlie | Brown     |
| WaveMotion     | Frank   | Wilson    |
| QuantumTech    | Hank    | Taylor    |
| AeroDynamics   | Frank   | Wilson    |
| FusionCore     | Frank   | Wilson    |
+----------------+---------+-----------+
```

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

```sql
-- SQL1
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e, pago p
WHERE c.id_cliente = p.id_cliente AND c.id_empleado_rep_ventas = e.id_empleado;

-- SQL2 (INNER JOIN)
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN pago p ON c.id_cliente = p.id_cliente;
```
```mysql
+----------------+---------+-----------+
| nombre_cliente | nombre  | apellido1 |
+----------------+---------+-----------+
| TechCorp       | Eve     | Miller    |
| TechCorp       | Eve     | Miller    |
| Sunshine Ltd.  | Charlie | Brown     |
| OceanBlue      | Frank   | Wilson    |
| SkyHigh Inc.   | Hank    | Taylor    |
| MountainView   | Charlie | Brown     |
| RiverSide      | Frank   | Wilson    |
| StarLight      | Grace   | Moore     |
| Galaxy Co.     | Charlie | Brown     |
| Thunderbolt    | Hank    | Taylor    |
| WindPower      | Eve     | Miller    |
| FireLight      | Grace   | Moore     |
| EarthBound     | Charlie | Brown     |
| WaveMotion     | Frank   | Wilson    |
| QuantumTech    | Hank    | Taylor    |
| AeroDynamics   | Frank   | Wilson    |
| FusionCore     | Frank   | Wilson    |
+----------------+---------+-----------+
```

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

```sql
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
```
```mysql
+----------------+--------+-----------+
| nombre_cliente | nombre | apellido1 |
+----------------+--------+-----------+
| GreenFields    | Grace  | Moore     |
+----------------+--------+-----------+
```

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql
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
```
```mysql
+----------------+---------+-----------+---------------+
| nombre_cliente | nombre  | apellido1 | nombre_ciudad |
+----------------+---------+-----------+---------------+
| TechCorp       | Eve     | Miller    | Madrid        |
| TechCorp       | Eve     | Miller    | Madrid        |
| WindPower      | Eve     | Miller    | Madrid        |
| SkyHigh Inc.   | Hank    | Taylor    | Madrid        |
| Thunderbolt    | Hank    | Taylor    | Madrid        |
| QuantumTech    | Hank    | Taylor    | Madrid        |
| OceanBlue      | Frank   | Wilson    | Sevilla       |
| RiverSide      | Frank   | Wilson    | Sevilla       |
| WaveMotion     | Frank   | Wilson    | Sevilla       |
| AeroDynamics   | Frank   | Wilson    | Sevilla       |
| FusionCore     | Frank   | Wilson    | Sevilla       |
| Sunshine Ltd.  | Charlie | Brown     | Valencia      |
| MountainView   | Charlie | Brown     | Valencia      |
| Galaxy Co.     | Charlie | Brown     | Valencia      |
| EarthBound     | Charlie | Brown     | Valencia      |
| StarLight      | Grace   | Moore     | Valencia      |
| FireLight      | Grace   | Moore     | Valencia      |
+----------------+---------+-----------+---------------+

```

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql
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
```
```mysql
+----------------+--------+-----------+---------------+
| nombre_cliente | nombre | apellido1 | nombre_ciudad |
+----------------+--------+-----------+---------------+
| GreenFields    | Grace  | Moore     | Valencia      |
+----------------+--------+-----------+---------------+
```

6. Lista la dirección de las oficinas que tengan clientes en Madrid.

```sql
-- SQL (INNER JOIN)
SELECT d.direccion
FROM direccion d
INNER JOIN oficina o ON d.id_direccion = o.id_oficina
INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad
INNER JOIN cliente c ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad = 'Madrid';
```
```mysql
+-----------------+
| direccion       |
+-----------------+
| 123 Main Street |
| 123 Main Street |
| 123 Main Street |
+-----------------+
```

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql
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
```
```mysql
+----------------+---------+-----------+---------------+
| nombre_cliente | nombre  | apellido1 | nombre_ciudad |
+----------------+---------+-----------+---------------+
| TechCorp       | Eve     | Miller    | Madrid        |
| WindPower      | Eve     | Miller    | Madrid        |
| SkyHigh Inc.   | Hank    | Taylor    | Madrid        |
| Thunderbolt    | Hank    | Taylor    | Madrid        |
| QuantumTech    | Hank    | Taylor    | Madrid        |
| OceanBlue      | Frank   | Wilson    | Sevilla       |
| RiverSide      | Frank   | Wilson    | Sevilla       |
| WaveMotion     | Frank   | Wilson    | Sevilla       |
| AeroDynamics   | Frank   | Wilson    | Sevilla       |
| FusionCore     | Frank   | Wilson    | Sevilla       |
| Sunshine Ltd.  | Charlie | Brown     | Valencia      |
| MountainView   | Charlie | Brown     | Valencia      |
| Galaxy Co.     | Charlie | Brown     | Valencia      |
| EarthBound     | Charlie | Brown     | Valencia      |
| GreenFields    | Grace   | Moore     | Valencia      |
| StarLight      | Grace   | Moore     | Valencia      |
| FireLight      | Grace   | Moore     | Valencia      |
+----------------+---------+-----------+---------------+
```

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

```sql
-- SQL1
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1, empleado e2
WHERE e1.id_jefe = e2.id_empleado;

-- SQL2 (INNER JOIN)
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1
INNER JOIN empleado e2 ON e1.id_jefe = e2.id_empleado;
```
```mysql
+-----------------+-------------+
| nombre_empleado | nombre_jefe |
+-----------------+-------------+
| Jane            | John        |
| Alice           | John        |
| Bob             | Jane        |
| Charlie         | Alice       |
| David           | Bob         |
| Eve             | John        |
| Frank           | Eve         |
| Grace           | Eve         |
| Hank            | Eve         |
+-----------------+-------------+
```

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

```sql
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
```
```mysql
+-----------------+-------------+------------------+
| nombre_empleado | nombre_jefe | nombre_jefe_jefe |
+-----------------+-------------+------------------+
| Bob             | Jane        | John             |
| Charlie         | Alice       | John             |
| David           | Bob         | Jane             |
| Frank           | Eve         | John             |
| Grace           | Eve         | John             |
| Hank            | Eve         | John             |
+-----------------+-------------+------------------+
```

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

```sql
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
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| GreenFields    |
| Sunshine Ltd.  |
| MountainView   |
| RiverSide      |
| WindPower      |
| WaveMotion     |
| FusionCore     |
+----------------+
```

11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

```sql
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
```
```mysql
+----------------+--------------+
| nombre_cliente | gama         |
+----------------+--------------+
| TechCorp       | Aromáticas   |
| GreenFields    | Aromáticas   |
| Sunshine Ltd.  | Aromáticas   |
| Sunshine Ltd.  | Herramientas |
| OceanBlue      | Herramientas |
| SkyHigh Inc.   | Herramientas |
| MountainView   | Ornamentales |
| RiverSide      | Ornamentales |
| RiverSide      | Frutales     |
| StarLight      | Frutales     |
| Galaxy Co.     | Frutales     |
| Thunderbolt    | Ornamentales |
| WindPower      | Ornamentales |
| FireLight      | Ornamentales |
| FireLight      | Frutales     |
| EarthBound     | Frutales     |
| WaveMotion     | Frutales     |
| QuantumTech    | Herbaceas    |
| AeroDynamics   | Herbaceas    |
| FusionCore     | Herbaceas    |
+----------------+--------------+
```


### Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.
1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

```sql
-- LEFT JOIN
SELECT c.*
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
WHERE p.id_transaccion IS NULL;
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
|          2 | GreenFields    | Ana             | Martinez          | 555-0002 |         2 |                      9 |       30000.00 |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
```

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

```sql
-- LEFT JOIN
SELECT c.*, IFNULL(p.id_transaccion, 'No pago') AS pago_realizado, IFNULL(pe.id_pedido, 'No pedido') AS pedido_realizado
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente
WHERE p.id_transaccion IS NULL OR pe.id_pedido IS NULL;
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito | pago_realizado | pedido_realizado |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
|          2 | GreenFields    | Ana             | Martinez          | 555-0002 |         2 |                      9 |       30000.00 | No pago        | 2                |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
```

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

```sql
-- LEFT JOIN
SELECT c.*, IFNULL(p.id_transaccion, 'No pago') AS pago_realizado, IFNULL(pe.id_pedido, 'No pedido') AS pedido_realizado
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
LEFT JOIN pedido pe ON c.id_cliente = pe.id_cliente
WHERE p.id_transaccion IS NULL OR pe.id_pedido IS NULL;
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito | pago_realizado | pedido_realizado |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
|          2 | GreenFields    | Ana             | Martinez          | 555-0002 |         2 |                      9 |       30000.00 | No pago        | 2                |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+----------------+------------------+
```

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

```sql
-- LEFT JOIN
SELECT e.*
FROM empleado e
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
WHERE o.id_oficina IS NULL;
```
```mysql
+-------------+------------+--------+-----------+-----------+-----------+-------------------------+---------+------------+
| id_empleado | id_oficina | nombre | apellido1 | apellido2 | extension | email                   | id_jefe | puesto     |
+-------------+------------+--------+-----------+-----------+-----------+-------------------------+---------+------------+
|           6 |       NULL | David  | Davis     | NULL      | 3002      | david.davis@example.com |       4 | Secretaria |
+-------------+------------+--------+-----------+-----------+-----------+-------------------------+---------+------------+
```

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

```sql
-- LEFT JOIN
SELECT e.*
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
WHERE c.id_cliente IS NULL;
```
```mysql
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+
| id_empleado | id_oficina | nombre | apellido1 | apellido2 | extension | email                     | id_jefe | puesto                  |
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+
|           1 |          1 | John   | Doe       | NULL      | 1001      | john.doe@example.com      |    NULL | Director General        |
|           2 |          1 | Jane   | Smith     | NULL      | 1002      | jane.smith@example.com    |       1 | Subdirector Marketing   |
|           3 |          2 | Alice  | Johnson   | NULL      | 2001      | alice.johnson@example.com |       1 | Subdirector Ventas      |
|           4 |          2 | Bob    | Williams  | NULL      | 2002      | bob.williams@example.com  |       2 | Representante de Ventas |
|           6 |       NULL | David  | Davis     | NULL      | 3002      | david.davis@example.com   |       4 | Secretaria              |
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+
```

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

```sql
-- LEFT JOIN
SELECT e.*, o.*
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
WHERE c.id_cliente IS NULL;
```
```mysql
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------+-----------+
| id_empleado | id_oficina | nombre | apellido1 | apellido2 | extension | email                     | id_jefe | puesto                  | id_oficina | id_ciudad |
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------+-----------+
|           1 |          1 | John   | Doe       | NULL      | 1001      | john.doe@example.com      |    NULL | Director General        |          1 |        13 |
|           2 |          1 | Jane   | Smith     | NULL      | 1002      | jane.smith@example.com    |       1 | Subdirector Marketing   |          1 |        13 |
|           3 |          2 | Alice  | Johnson   | NULL      | 2001      | alice.johnson@example.com |       1 | Subdirector Ventas      |          2 |        14 |
|           4 |          2 | Bob    | Williams  | NULL      | 2002      | bob.williams@example.com  |       2 | Representante de Ventas |          2 |        14 |
|           6 |       NULL | David  | Davis     | NULL      | 3002      | david.davis@example.com   |       4 | Secretaria              |       NULL |      NULL |
+-------------+------------+--------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------+-----------+
```

7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

```sql
-- LEFT JOIN
SELECT e.*, IFNULL(o.id_oficina, 'Sin oficina') AS oficina_asociada, IFNULL(c.id_cliente, 'Sin cliente') AS cliente_asociado
FROM empleado e
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas;
```
```mysql
+-------------+------------+---------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------------+------------------+
| id_empleado | id_oficina | nombre  | apellido1 | apellido2 | extension | email                     | id_jefe | puesto                  | oficina_asociada | cliente_asociado |
+-------------+------------+---------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------------+------------------+
|           1 |          1 | John    | Doe       | NULL      | 1001      | john.doe@example.com      |    NULL | Director General        | 1                | Sin cliente      |
|           2 |          1 | Jane    | Smith     | NULL      | 1002      | jane.smith@example.com    |       1 | Subdirector Marketing   | 1                | Sin cliente      |
|           3 |          2 | Alice   | Johnson   | NULL      | 2001      | alice.johnson@example.com |       1 | Subdirector Ventas      | 2                | Sin cliente      |
|           4 |          2 | Bob     | Williams  | NULL      | 2002      | bob.williams@example.com  |       2 | Representante de Ventas | 2                | Sin cliente      |
|           5 |          3 | Charlie | Brown     | NULL      | 3001      | charlie.brown@example.com |       3 | Representante de Ventas | 3                | 3                |
|           5 |          3 | Charlie | Brown     | NULL      | 3001      | charlie.brown@example.com |       3 | Representante de Ventas | 3                | 6                |
|           5 |          3 | Charlie | Brown     | NULL      | 3001      | charlie.brown@example.com |       3 | Representante de Ventas | 3                | 9                |
|           5 |          3 | Charlie | Brown     | NULL      | 3001      | charlie.brown@example.com |       3 | Representante de Ventas | 3                | 13               |
|           6 |       NULL | David   | Davis     | NULL      | 3002      | david.davis@example.com   |       4 | Secretaria              | Sin oficina      | Sin cliente      |
|           7 |          1 | Eve     | Miller    | NULL      | 1003      | eve.miller@example.com    |       1 | Director Oficina        | 1                | 1                |
|           7 |          1 | Eve     | Miller    | NULL      | 1003      | eve.miller@example.com    |       1 | Director Oficina        | 1                | 11               |
|           8 |          2 | Frank   | Wilson    | NULL      | 2003      | frank.wilson@example.com  |       7 | Representante de Ventas | 2                | 4                |
|           8 |          2 | Frank   | Wilson    | NULL      | 2003      | frank.wilson@example.com  |       7 | Representante de Ventas | 2                | 7                |
|           8 |          2 | Frank   | Wilson    | NULL      | 2003      | frank.wilson@example.com  |       7 | Representante de Ventas | 2                | 14               |
|           8 |          2 | Frank   | Wilson    | NULL      | 2003      | frank.wilson@example.com  |       7 | Representante de Ventas | 2                | 16               |
|           8 |          2 | Frank   | Wilson    | NULL      | 2003      | frank.wilson@example.com  |       7 | Representante de Ventas | 2                | 17               |
|           9 |          3 | Grace   | Moore     | NULL      | 3003      | grace.moore@example.com   |       7 | Representante de Ventas | 3                | 2                |
|           9 |          3 | Grace   | Moore     | NULL      | 3003      | grace.moore@example.com   |       7 | Representante de Ventas | 3                | 8                |
|           9 |          3 | Grace   | Moore     | NULL      | 3003      | grace.moore@example.com   |       7 | Representante de Ventas | 3                | 12               |
|          10 |          1 | Hank    | Taylor    | NULL      | 1004      | hank.taylor@example.com   |       7 | Representante de Ventas | 1                | 5                |
|          10 |          1 | Hank    | Taylor    | NULL      | 1004      | hank.taylor@example.com   |       7 | Representante de Ventas | 1                | 10               |
|          10 |          1 | Hank    | Taylor    | NULL      | 1004      | hank.taylor@example.com   |       7 | Representante de Ventas | 1                | 15               |
+-------------+------------+---------+-----------+-----------+-----------+---------------------------+---------+-------------------------+------------------+------------------+
```

8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
-- RIGHT JOIN
SELECT p.*
FROM producto p
RIGHT JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
WHERE dp.id_pedido IS NULL;

-- todos los productos han sido pedidos

```
```mysql
Empty set (0,00 sec)

```


9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

```sql
-- RIGHT JOIN
SELECT p.nombre, p.descripcion, p.imagen
FROM producto p
RIGHT JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
WHERE dp.id_pedido IS NULL;

-- todos los productos han sido pedidos

```
```mysql
Empty set (0,00 sec)

```

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

```sql
-- LEFT JOIN
SELECT DISTINCT o.id_oficina, o.id_ciudad
FROM oficina o
LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
LEFT JOIN producto pr ON dp.id_producto = pr.id_producto
LEFT JOIN gama_producto gp ON pr.gama = gp.gama
WHERE gp.gama = 'Frutales'
  AND e.id_empleado IS NULL;
```
```mysql
Empty set (0,00 sec)
```

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

```sql
-- LEFT JOIN
SELECT c.*
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN pago pa ON p.id_cliente = pa.id_cliente
WHERE pa.id_transaccion IS NULL AND p.id_pedido IS NOT NULL;
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
|          2 | GreenFields    | Ana             | Martinez          | 555-0002 |         2 |                      9 |       30000.00 |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
```

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

```sql
-- LEFT JOIN
SELECT e.nombre, e.apellido1, e.apellido2, e.email, ej.nombre AS nombre_jefe, ej.apellido1 AS apellido1_jefe, ej.apellido2 AS apellido2_jefe
FROM empleado e
LEFT JOIN empleado ej ON e.id_jefe = ej.id_empleado
WHERE e.id_empleado NOT IN (SELECT DISTINCT id_empleado_rep_ventas FROM cliente WHERE id_empleado_rep_ventas IS NOT NULL);
```
```mysql
+--------+-----------+-----------+---------------------------+-------------+----------------+----------------+
| nombre | apellido1 | apellido2 | email                     | nombre_jefe | apellido1_jefe | apellido2_jefe |
+--------+-----------+-----------+---------------------------+-------------+----------------+----------------+
| John   | Doe       | NULL      | john.doe@example.com      | NULL        | NULL           | NULL           |
| Jane   | Smith     | NULL      | jane.smith@example.com    | John        | Doe            | NULL           |
| Alice  | Johnson   | NULL      | alice.johnson@example.com | John        | Doe            | NULL           |
| Bob    | Williams  | NULL      | bob.williams@example.com  | Jane        | Smith          | NULL           |
| David  | Davis     | NULL      | david.davis@example.com   | Bob         | Williams       | NULL           |
+--------+-----------+-----------+---------------------------+-------------+----------------+----------------+
```


### Consultas resumen
1. ¿Cuántos empleados hay en la compañía?

```sql
SELECT COUNT(*) AS total_empleados
FROM empleado;
```
```mysql
+-----------------+
| total_empleados |
+-----------------+
|              10 |
+-----------------+
```

2. ¿Cuántos clientes tiene cada país?

```sql
SELECT p.nombre_pais, COUNT(c.id_cliente) AS total_clientes
FROM cliente c
JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
JOIN region r ON ci.id_region = r.id_region
JOIN pais p ON r.id_pais = p.id_pais
GROUP BY p.nombre_pais;
```
```mysql
+----------------+----------------+
| nombre_pais    | total_clientes |
+----------------+----------------+
| España         |              9 |
| Francia        |              2 |
| Italia         |              1 |
| Alemania       |              1 |
| Reino Unido    |              2 |
| Estados Unidos |              2 |
+----------------+----------------+
```

3. ¿Cuál fue el pago medio en 2009?

```sql
SELECT AVG(total) AS pago_medio_2009
FROM pago
WHERE YEAR(fecha_pago) = 2009;
```
```mysql
+-----------------+
| pago_medio_2009 |
+-----------------+
|            NULL |
+-----------------+
```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

```sql
SELECT e.estado, COUNT(p.id_pedido) AS total_pedidos
FROM estado e
LEFT JOIN pedido p ON e.id_estado = p.id_estado
GROUP BY e.estado
ORDER BY total_pedidos DESC;
```
```mysql
+------------+---------------+
| estado     | total_pedidos |
+------------+---------------+
| En proceso |             6 |
| Rechazado  |             6 |
| Enviado    |             5 |
| Entregado  |             0 |
+------------+---------------+
```

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

```sql
SELECT MAX(precio_venta) AS precio_mas_caro, MIN(precio_venta) AS precio_mas_barato
FROM producto;
```
```mysql
+-----------------+-------------------+
| precio_mas_caro | precio_mas_barato |
+-----------------+-------------------+
|           15.00 |              2.50 |
+-----------------+-------------------+
```

6. Calcula el número de clientes que tiene la empresa.

```sql
SELECT COUNT(*) AS total_clientes
FROM cliente;
```
```mysql
+----------------+
| total_clientes |
+----------------+
|             17 |
+----------------+
```

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

```sql
SELECT COUNT(*) AS clientes_en_Madrid
FROM cliente c
JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
WHERE ci.nombre_ciudad = 'Madrid';
```
```mysql
+--------------------+
| clientes_en_Madrid |
+--------------------+
|                  3 |
+--------------------+
```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

```sql
SELECT ci.nombre_ciudad, COUNT(c.id_cliente) AS total_clientes
FROM ciudad ci
JOIN cliente c ON ci.id_ciudad = c.id_ciudad
WHERE ci.nombre_ciudad LIKE 'M%'
GROUP BY ci.nombre_ciudad;
```
```mysql
+---------------+----------------+
| nombre_ciudad | total_clientes |
+---------------+----------------+
| Marsella      |              1 |
| Manchester    |              1 |
| Madrid        |              3 |
+---------------+----------------+
```

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

```sql
SELECT CONCAT(e.nombre, ' ', e.apellido1) AS representante_ventas, COUNT(c.id_cliente) AS clientes_atendidos
FROM empleado e
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
WHERE e.puesto = 'Representante de ventas'
GROUP BY e.id_empleado;
```
```mysql
+----------------------+--------------------+
| representante_ventas | clientes_atendidos |
+----------------------+--------------------+
| Bob Williams         |                  0 |
| Charlie Brown        |                  4 |
| Frank Wilson         |                  5 |
| Grace Moore          |                  3 |
| Hank Taylor          |                  3 |
+----------------------+--------------------+
```

10. Calcula el número de clientes que no tiene asignado representante de ventas.

```sql
SELECT COUNT(*) AS clientes_sin_representante
FROM cliente
WHERE id_empleado_rep_ventas IS NULL;
```
```mysql
+----------------------------+
| clientes_sin_representante |
+----------------------------+
|                          0 |
+----------------------------+
```

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

```sql
SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, 
       MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago
FROM cliente c
LEFT JOIN pago p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
```
```mysql
+----------------+-----------------+-------------------+-------------+-------------+
| nombre_cliente | nombre_contacto | apellido_contacto | primer_pago | ultimo_pago |
+----------------+-----------------+-------------------+-------------+-------------+
| TechCorp       | Carlos          | Lopez             | 2008-05-31  | 2024-05-30  |
| GreenFields    | Ana             | Martinez          | NULL        | NULL        |
| Sunshine Ltd.  | Miguel          | Hernandez         | 2024-05-29  | 2024-05-29  |
| OceanBlue      | Laura           | Gonzalez          | 2024-05-28  | 2024-05-28  |
| SkyHigh Inc.   | Daniel          | Perez             | 2008-05-27  | 2008-05-27  |
| MountainView   | Sofia           | Rodriguez         | 2008-05-26  | 2008-05-26  |
| RiverSide      | Julio           | Garcia            | 2024-05-25  | 2024-05-25  |
| StarLight      | Natalia         | Fernandez         | 2024-05-24  | 2024-05-24  |
| Galaxy Co.     | Luis            | Martinez          | 2024-05-23  | 2024-05-23  |
| Thunderbolt    | Carlos          | Lopez             | 2008-05-22  | 2008-05-22  |
| WindPower      | Ana             | Martinez          | 2024-05-21  | 2024-05-21  |
| FireLight      | Miguel          | Hernandez         | 2024-05-20  | 2024-05-20  |
| EarthBound     | Laura           | Gonzalez          | 2024-05-19  | 2024-05-19  |
| WaveMotion     | Daniel          | Perez             | 2024-05-18  | 2024-05-18  |
| QuantumTech    | Sofia           | Rodriguez         | 2008-05-17  | 2008-05-17  |
| AeroDynamics   | Julio           | Garcia            | 2024-05-16  | 2024-05-16  |
| FusionCore     | Natalia         | Fernandez         | 2024-05-15  | 2024-05-15  |
+----------------+-----------------+-------------------+-------------+-------------+
```

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

```sql
SELECT id_pedido, COUNT(DISTINCT id_producto) AS productos_diferentes
FROM detalle_pedido
GROUP BY id_pedido;
```
```mysql
+-----------+----------------------+
| id_pedido | productos_diferentes |
+-----------+----------------------+
|         1 |                    2 |
|         2 |                    2 |
|         3 |                    2 |
|         4 |                    2 |
|         5 |                    2 |
|         6 |                    2 |
|         7 |                    2 |
|         8 |                    2 |
|         9 |                    2 |
|        10 |                    2 |
|        11 |                    2 |
|        12 |                    2 |
|        13 |                    2 |
|        14 |                    2 |
|        15 |                    2 |
|        16 |                    2 |
|        17 |                    2 |
+-----------+----------------------+
```

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

```sql
SELECT id_pedido, SUM(cantidad) AS cantidad_total
FROM detalle_pedido
GROUP BY id_pedido;
```
```mysql
+-----------+----------------+
| id_pedido | cantidad_total |
+-----------+----------------+
|         1 |             15 |
|         2 |             20 |
|         3 |             21 |
|         4 |             30 |
|         5 |             35 |
|         6 |             14 |
|         7 |             22 |
|         8 |             35 |
|         9 |             40 |
|        10 |             18 |
|        11 |             27 |
|        12 |             38 |
|        13 |             18 |
|        14 |             27 |
|        15 |             42 |
|        16 |             38 |
|        17 |             40 |
+-----------+----------------+
```

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

```sql
SELECT p.nombre, SUM(dp.cantidad) AS total_unidades_vendidas
FROM producto p
JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto
ORDER BY total_unidades_vendidas DESC
LIMIT 20;
```
```mysql
+----------------+-------------------------+
| nombre         | total_unidades_vendidas |
+----------------+-------------------------+
| Cinta métrica  |                      25 |
| Limonero       |                      22 |
| Orégano        |                      22 |
| Menta          |                      22 |
| Cilantro       |                      20 |
| Cerezo         |                      20 |
| Salvia         |                      20 |
| Destornillador |                      20 |
| Higuera        |                      20 |
| Dalia          |                      18 |
| Albahaca       |                      18 |
| Hierbabuena    |                      18 |
| Naranjo        |                      18 |
| Perejil        |                      15 |
| Peral          |                      15 |
| Frambuesa      |                      15 |
| Hortensia      |                      15 |
| Surfinia       |                      12 |
| Manzano        |                      12 |
| Granada        |                      12 |
+----------------+-------------------------+
```

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

```sql
SELECT SUM(precio_unidad * cantidad) AS base_imponible, 
       SUM(precio_unidad * cantidad) * 0.21 AS iva,
       SUM(precio_unidad * cantidad) + (SUM(precio_unidad * cantidad) * 0.21) AS total_facturado
FROM detalle_pedido;
```
```mysql
+----------------+----------+-----------------+
| base_imponible | iva      | total_facturado |
+----------------+----------+-----------------+
|        3676.10 | 771.9810 |       4448.0810 |
+----------------+----------+-----------------+

```

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

```sql
SELECT dp.id_producto, SUM(dp.precio_unidad * dp.cantidad) AS base_imponible, 
       SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado
FROM detalle_pedido dp
GROUP BY dp.id_producto;
```
```mysql
+-------------+----------------+---------+-----------------+
| id_producto | base_imponible | iva     | total_facturado |
+-------------+----------------+---------+-----------------+
|           1 |          35.00 |  7.3500 |         42.3500 |
|           2 |          14.00 |  2.9400 |         16.9400 |
|           3 |          25.60 |  5.3760 |         30.9760 |
|           4 |          30.00 |  6.3000 |         36.3000 |
|           5 |          40.50 |  8.5050 |         49.0050 |
|           6 |          72.00 | 15.1200 |         87.1200 |
|           7 |         160.00 | 33.6000 |        193.6000 |
|           8 |         150.00 | 31.5000 |        181.5000 |
|           9 |         125.00 | 26.2500 |        151.2500 |
|          10 |          70.00 | 14.7000 |         84.7000 |
|          11 |          96.00 | 20.1600 |        116.1600 |
|          12 |          90.00 | 18.9000 |        108.9000 |
|          13 |          80.00 | 16.8000 |         96.8000 |
|          14 |         180.00 | 37.8000 |        217.8000 |
|          15 |         135.00 | 28.3500 |        163.3500 |
|          16 |         150.00 | 31.5000 |        181.5000 |
|          17 |         216.00 | 45.3600 |        261.3600 |
|          18 |         220.00 | 46.2000 |        266.2000 |
|          19 |          45.00 |  9.4500 |         54.4500 |
|          20 |          40.00 |  8.4000 |         48.4000 |
|          21 |          72.00 | 15.1200 |         87.1200 |
|          22 |         225.00 | 47.2500 |        272.2500 |
|          23 |         126.00 | 26.4600 |        152.4600 |
|          24 |         200.00 | 42.0000 |        242.0000 |
|          25 |          96.00 | 20.1600 |        116.1600 |
|          26 |          80.00 | 16.8000 |         96.8000 |
|          27 |         168.00 | 35.2800 |        203.2800 |
|          28 |         135.00 | 28.3500 |        163.3500 |
|          29 |          80.00 | 16.8000 |         96.8000 |
|          30 |         110.00 | 23.1000 |        133.1000 |
|          31 |          81.00 | 17.0100 |         98.0100 |
|          32 |         120.00 | 25.2000 |        145.2000 |
|          33 |         110.00 | 23.1000 |        133.1000 |
|          34 |          99.00 | 20.7900 |        119.7900 |
+-------------+----------------+---------+-----------------+
```

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

```sql
SELECT dp.id_producto, SUM(dp.precio_unidad * dp.cantidad) AS base_imponible, 
       SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
WHERE p.nombre LIKE 'OR%'
GROUP BY dp.id_producto;
```
```mysql
+-------------+----------------+---------+-----------------+
| id_producto | base_imponible | iva     | total_facturado |
+-------------+----------------+---------+-----------------+
|          30 |         110.00 | 23.1000 |        133.1000 |
+-------------+----------------+---------+-----------------+
```

18. Lista las ventas totales de los productos que hayan facturado más de 200 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

```sql
SELECT p.nombre, SUM(dp.cantidad) AS unidades_vendidas,
       SUM(dp.precio_unidad * dp.cantidad) AS total_facturado,
       (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS iva,
       SUM(dp.precio_unidad * dp.cantidad) + (SUM(dp.precio_unidad * dp.cantidad) * 0.21) AS total_facturado_con_iva
FROM detalle_pedido dp
JOIN producto p ON dp.id_producto = p.id_producto
GROUP BY p.id_producto
HAVING total_facturado_con_iva > 200;
```
```mysql
+-----------+-------------------+-----------------+---------+-------------------------+
| nombre    | unidades_vendidas | total_facturado | iva     | total_facturado_con_iva |
+-----------+-------------------+-----------------+---------+-------------------------+
| Manzano   |                12 |          180.00 | 37.8000 |                217.8000 |
| Naranjo   |                18 |          216.00 | 45.3600 |                261.3600 |
| Limonero  |                22 |          220.00 | 46.2000 |                266.2000 |
| Hortensia |                15 |          225.00 | 47.2500 |                272.2500 |
| Higuera   |                20 |          200.00 | 42.0000 |                242.0000 |
| Granada   |                12 |          168.00 | 35.2800 |                203.2800 |
+-----------+-------------------+-----------------+---------+-------------------------+
```

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

```sql
SELECT YEAR(fecha_pago) AS año, SUM(total) AS suma_total_pagos
FROM pago
GROUP BY YEAR(fecha_pago);
```
```mysql
+------+------------------+
| año  | suma_total_pagos |
+------+------------------+
| 2008 |           915.00 |
| 2024 |          2565.50 |
+------+------------------+
```

Subconsultas
Con operadores básicos de comparación
1. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| SkyHigh Inc.   |
| WaveMotion     |
+----------------+
```

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);
```
```mysql
+---------------+
| nombre        |
+---------------+
| Llave inglesa |
| Rosa          |
| Hortensia     |
+---------------+
```

3. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)

```sql
SELECT nombre
FROM producto
WHERE id_producto = (
    SELECT id_producto
    FROM detalle_pedido
    GROUP BY id_producto
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
);
```
```mysql
+----------------+
| nombre         |
+----------------+
| Cinta métrica  |
+----------------+
```


4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

```sql
SELECT nombre_cliente
FROM cliente
WHERE limite_credito > (
    SELECT SUM(total)
    FROM pago
    WHERE pago.id_cliente = cliente.id_cliente
);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| TechCorp       |
| Sunshine Ltd.  |
| OceanBlue      |
| SkyHigh Inc.   |
| MountainView   |
| RiverSide      |
| StarLight      |
| Galaxy Co.     |
| Thunderbolt    |
| WindPower      |
| FireLight      |
| EarthBound     |
| WaveMotion     |
| QuantumTech    |
| AeroDynamics   |
| FusionCore     |
+----------------+
```

5. Devuelve el producto que más unidades tiene en stock.

```sql
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto);
```
```mysql
+--------+
| nombre |
+--------+
| Rosa   |
+--------+
```

6. Devuelve el producto que menos unidades tiene en stock.

```sql
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);
```
```mysql
+---------+
| nombre  |
+---------+
| Naranjo |
| Granada |
+---------+
```

7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de John Doe.

```sql
SELECT nombre, apellido1, email
FROM empleado
WHERE id_jefe = (
    SELECT id_empleado
    FROM empleado
    WHERE nombre = 'John' AND apellido1 = 'Doe'
);
```
```mysql
+--------+-----------+---------------------------+
| nombre | apellido1 | email                     |
+--------+-----------+---------------------------+
| Jane   | Smith     | jane.smith@example.com    |
| Alice  | Johnson   | alice.johnson@example.com |
| Eve    | Miller    | eve.miller@example.com    |
+--------+-----------+---------------------------+
```

Subconsultas con ALL y ANY
8. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| SkyHigh Inc.   |
| WaveMotion     |
+----------------+
```

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta FROM producto);
```
```mysql
+---------------+
| nombre        |
+---------------+
| Llave inglesa |
| Rosa          |
| Hortensia     |
+---------------+

```

10. Devuelve el producto que menos unidades tiene en stock.

```sql
SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock FROM producto);
```
```mysql
+---------+
| nombre  |
+---------+
| Naranjo |
| Granada |
+---------+
```

Subconsultas con IN y NOT IN
11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

```sql
SELECT nombre, apellido1, puesto
FROM empleado
WHERE id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);
```
```mysql
+--------+-----------+-------------------------+
| nombre | apellido1 | puesto                  |
+--------+-----------+-------------------------+
| John   | Doe       | Director General        |
| Jane   | Smith     | Subdirector Marketing   |
| Alice  | Johnson   | Subdirector Ventas      |
| Bob    | Williams  | Representante de Ventas |
| David  | Davis     | Secretaria              |
+--------+-----------+-------------------------+
```

12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

```sql
SELECT *
FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM pago);
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
|          2 | GreenFields    | Ana             | Martinez          | 555-0002 |         2 |                      9 |       30000.00 |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
```

13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

```sql
SELECT *
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pago);
```
```mysql
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
| id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax      | id_ciudad | id_empleado_rep_ventas | limite_credito |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
|          1 | TechCorp       | Carlos          | Lopez             | 555-0001 |         1 |                      7 |       50000.00 |
|          3 | Sunshine Ltd.  | Miguel          | Hernandez         | 555-0003 |        13 |                      5 |       40000.00 |
|          4 | OceanBlue      | Laura           | Gonzalez          | 555-0004 |         4 |                      8 |       45000.00 |
|          5 | SkyHigh Inc.   | Daniel          | Perez             | 555-0005 |         5 |                     10 |       60000.00 |
|          6 | MountainView   | Sofia           | Rodriguez         | 555-0006 |         6 |                      5 |       35000.00 |
|          7 | RiverSide      | Julio           | Garcia            | 555-0007 |         7 |                      8 |       30000.00 |
|          8 | StarLight      | Natalia         | Fernandez         | 555-0008 |         8 |                      9 |       25000.00 |
|          9 | Galaxy Co.     | Luis            | Martinez          | 555-0009 |         9 |                      5 |       55000.00 |
|         10 | Thunderbolt    | Carlos          | Lopez             | 555-0010 |        13 |                     10 |       50000.00 |
|         11 | WindPower      | Ana             | Martinez          | 555-0011 |        11 |                      7 |       30000.00 |
|         12 | FireLight      | Miguel          | Hernandez         | 555-0012 |        12 |                      9 |       40000.00 |
|         13 | EarthBound     | Laura           | Gonzalez          | 555-0013 |        13 |                      5 |       45000.00 |
|         14 | WaveMotion     | Daniel          | Perez             | 555-0014 |        14 |                      8 |       60000.00 |
|         15 | QuantumTech    | Sofia           | Rodriguez         | 555-0015 |        15 |                     10 |       35000.00 |
|         16 | AeroDynamics   | Julio           | Garcia            | 555-0016 |        16 |                      8 |       30000.00 |
|         17 | FusionCore     | Natalia         | Fernandez         | 555-0017 |        17 |                      8 |       25000.00 |
+------------+----------------+-----------------+-------------------+----------+-----------+------------------------+----------------+
```

14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
SELECT *
FROM producto
WHERE id_producto NOT IN (SELECT id_producto FROM detalle_pedido);
```
```mysql
+-------------+----------------+------------+--------------------------+--------------+---------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| id_producto | nombre         | gama       | dimensiones              | id_proveedor | descripcion                                                                                                         | cantidad_en_stock | precio_venta | precio_proveedor |
+-------------+----------------+------------+--------------------------+--------------+---------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
|          35 | Tomillo limón  | Herbáceas  | 0,25 m x 0,20 m x 0,20 m |            6 | Variedad de tomillo con un aroma cítrico y limón. Ideal para condimentar pescados, mariscos y ensaladas.            |                18 |         5.00 |             3.50 |
|          36 | Romero limón   | Herbáceas  | 0,30 m x 0,20 m x 0,20 m |            6 | Variedad de romero con un aroma cítrico y limón. Ideal para condimentar carnes, pollos y verduras.                  |                20 |         6.00 |             4.00 |
|          37 | Perejil rizado | Herbáceas  | 0,30 m x 0,25 m x 0,25 m |            6 | Variedad de perejil con hojas rizadas y un sabor más intenso. Ideal para condimentar sopas, salsas y ensaladas.     |               107 |         4.50 |             3.00 |
|          38 | Cebollino fino | Herbáceas  | 0,20 m x 0,10 m x 0,10 m |            6 | Variedad de cebollino con tallos más finos y un sabor más suave. Ideal para ensaladas, salsas y guarniciones.       |                12 |         3.50 |             2.50 |
|          39 | Estragón       | Herbáceas  | 0,30 m x 0,20 m x 0,20 m |            6 | Planta aromática con un sabor anisado y ligeramente picante. Ideal para condimentar pescados, salsas y vinagretas.  |                22 |         6.00 |             4.00 |
+-------------+----------------+------------+--------------------------+--------------+---------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
```

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

```sql
SELECT e.nombre, e.apellido1, e.puesto, t.num_telefono
FROM empleado e
JOIN telefono_oficina te ON e.id_oficina = te.id_oficina
JOIN telefono t ON te.id_telefono = t.id_telefono
WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);
```
```mysql
+--------+-----------+-------------------------+--------------+
| nombre | apellido1 | puesto                  | num_telefono |
+--------+-----------+-------------------------+--------------+
| John   | Doe       | Director General        | 4567890123   |
| Jane   | Smith     | Subdirector Marketing   | 4567890123   |
| Alice  | Johnson   | Subdirector Ventas      | 5678901234   |
| Bob    | Williams  | Representante de Ventas | 5678901234   |
+--------+-----------+-------------------------+--------------+
```

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

```sql
SELECT DISTINCT o.id_oficina
FROM oficina o
WHERE o.id_oficina NOT IN (
    SELECT DISTINCT e.id_oficina
    FROM empleado e
    JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
    JOIN pedido p ON c.id_cliente = p.id_cliente
    JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
    JOIN producto pr ON dp.id_producto = pr.id_producto
    WHERE pr.gama = 'Frutales'
);
```
```mysql
+------------+
| id_oficina |
+------------+
|          1 |
+------------+
```

17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

```sql
SELECT nombre_cliente
FROM cliente
WHERE id_cliente IN (SELECT id_cliente FROM pedido)
AND id_cliente NOT IN (SELECT id_cliente FROM pago);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| GreenFields    |
+----------------+
```


### Subconsultas con EXISTS y NOT EXISTS
18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

```sql
SELECT nombre_cliente
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.id_cliente = c.id_cliente
);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| GreenFields    |
+----------------+

```

19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

```sql
SELECT nombre_cliente
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.id_cliente = c.id_cliente
);
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| TechCorp       |
| Sunshine Ltd.  |
| OceanBlue      |
| SkyHigh Inc.   |
| MountainView   |
| RiverSide      |
| StarLight      |
| Galaxy Co.     |
| Thunderbolt    |
| WindPower      |
| FireLight      |
| EarthBound     |
| WaveMotion     |
| QuantumTech    |
| AeroDynamics   |
| FusionCore     |
+----------------+
```

20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
SELECT nombre
FROM producto pr
WHERE NOT EXISTS (
    SELECT 1
    FROM detalle_pedido dp
    WHERE dp.id_producto = pr.id_producto
);
```
```mysql
+----------------+
| nombre         |
+----------------+
| Tomillo limón  |
| Romero limón   |
| Perejil rizado |
| Cebollino fino |
| Estragón       |
+----------------+
```

21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

```sql
SELECT nombre
FROM producto pr
WHERE EXISTS (
    SELECT 1
    FROM detalle_pedido dp
    WHERE dp.id_producto = pr.id_producto
);
```
```mysql
+------------------+
| nombre           |
+------------------+
| Lavanda          |
| Romero           |
| Tomillo          |
| Cebollino        |
| Perejil          |
| Martillo         |
| Destornillador   |
| Llave inglesa    |
| Cinta métrica    |
| Nivel de burbuja |
| Jazmín           |
| Rosa             |
| Lavanda          |
| Manzano          |
| Peral            |
| Cerezo           |
| Naranjo          |
| Limonero         |
| Geranio          |
| Begonia          |
| Surfinia         |
| Hortensia        |
| Dalia            |
| Higuera          |
| Kiwi             |
| Uva              |
| Granada          |
| Frambuesa        |
| Salvia           |
| Orégano          |
| Hierbabuena      |
| Cilantro         |
| Menta            |
| Albahaca         |
+------------------+
```

Subconsultas correlacionadas
Consultas variadas
1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.

```sql
SELECT c.nombre_cliente, COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
```
```mysql
+----------------+---------------+
| nombre_cliente | total_pedidos |
+----------------+---------------+
| TechCorp       |             1 |
| GreenFields    |             1 |
| Sunshine Ltd.  |             1 |
| OceanBlue      |             1 |
| SkyHigh Inc.   |             1 |
| MountainView   |             1 |
| RiverSide      |             1 |
| StarLight      |             1 |
| Galaxy Co.     |             1 |
| Thunderbolt    |             1 |
| WindPower      |             1 |
| FireLight      |             1 |
| EarthBound     |             1 |
| WaveMotion     |             1 |
| QuantumTech    |             1 |
| AeroDynamics   |             1 |
| FusionCore     |             1 |
+----------------+---------------+
```

2. Devuelve un listado con los nombres de los clientes y el total pagado por
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
realizado ningún pago.

```sql
SELECT c.nombre_cliente, COALESCE(SUM(pa.total), 0) AS total_pagado
FROM cliente c
LEFT JOIN pago pa ON c.id_cliente = pa.id_cliente
GROUP BY c.id_cliente;
```
```mysql
+----------------+--------------+
| nombre_cliente | total_pagado |
+----------------+--------------+
| TechCorp       |       350.00 |
| GreenFields    |         0.00 |
| Sunshine Ltd.  |       180.50 |
| OceanBlue      |       220.00 |
| SkyHigh Inc.   |       190.00 |
| MountainView   |       205.00 |
| RiverSide      |       250.00 |
| StarLight      |       170.00 |
| Galaxy Co.     |       230.00 |
| Thunderbolt    |       195.00 |
| WindPower      |       210.00 |
| FireLight      |       185.00 |
| EarthBound     |       225.00 |
| WaveMotion     |       240.00 |
| QuantumTech    |       175.00 |
| AeroDynamics   |       195.00 |
| FusionCore     |       260.00 |
+----------------+--------------+
```

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
ordenados alfabéticamente de menor a mayor.

```sql
SELECT DISTINCT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre_cliente ASC;
```
```mysql
+----------------+
| nombre_cliente |
+----------------+
| FusionCore     |
| QuantumTech    |
| Thunderbolt    |
+----------------+
```

4. Devuelve el nombre del cliente, el nombre y primer apellido de su
representante de ventas y el número de teléfono de la oficina del
representante de ventas, de aquellos clientes que no hayan realizado ningún
pago.

```sql
SELECT c.nombre_cliente, e.nombre, e.apellido1, t.num_telefono
FROM cliente c
LEFT JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
LEFT JOIN telefono_oficina tof ON e.id_oficina = tof.id_oficina
LEFT JOIN telefono t ON tof.id_telefono = t.id_telefono
WHERE c.id_cliente NOT IN (SELECT id_cliente FROM pago);
```
```mysql
+----------------+--------+-----------+--------------+
| nombre_cliente | nombre | apellido1 | num_telefono |
+----------------+--------+-----------+--------------+
| GreenFields    | Grace  | Moore     | 6789012345   |
+----------------+--------+-----------+--------------+
```

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
nombre y primer apellido de su representante de ventas y la ciudad donde
está su oficina.

```sql
SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre_ciudad
FROM cliente c
LEFT JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
LEFT JOIN oficina o ON e.id_oficina = o.id_oficina
LEFT JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad;
```
```mysql
+----------------+---------+-----------+---------------+
| nombre_cliente | nombre  | apellido1 | nombre_ciudad |
+----------------+---------+-----------+---------------+
| TechCorp       | Eve     | Miller    | Madrid        |
| GreenFields    | Grace   | Moore     | Valencia      |
| Sunshine Ltd.  | Charlie | Brown     | Valencia      |
| OceanBlue      | Frank   | Wilson    | Sevilla       |
| SkyHigh Inc.   | Hank    | Taylor    | Madrid        |
| MountainView   | Charlie | Brown     | Valencia      |
| RiverSide      | Frank   | Wilson    | Sevilla       |
| StarLight      | Grace   | Moore     | Valencia      |
| Galaxy Co.     | Charlie | Brown     | Valencia      |
| Thunderbolt    | Hank    | Taylor    | Madrid        |
| WindPower      | Eve     | Miller    | Madrid        |
| FireLight      | Grace   | Moore     | Valencia      |
| EarthBound     | Charlie | Brown     | Valencia      |
| WaveMotion     | Frank   | Wilson    | Sevilla       |
| QuantumTech    | Hank    | Taylor    | Madrid        |
| AeroDynamics   | Frank   | Wilson    | Sevilla       |
| FusionCore     | Frank   | Wilson    | Sevilla       |
+----------------+---------+-----------+---------------+
```

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

```sql
SELECT e.nombre, e.apellido1, e.puesto, t.num_telefono
FROM empleado e
JOIN telefono_oficina tof ON e.id_oficina = tof.id_oficina
JOIN telefono t ON tof.id_telefono = t.id_telefono
WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente);
```
```mysql
+--------+-----------+-------------------------+--------------+
| nombre | apellido1 | puesto                  | num_telefono |
+--------+-----------+-------------------------+--------------+
| John   | Doe       | Director General        | 4567890123   |
| Jane   | Smith     | Subdirector Marketing   | 4567890123   |
| Alice  | Johnson   | Subdirector Ventas      | 5678901234   |
| Bob    | Williams  | Representante de Ventas | 5678901234   |
+--------+-----------+-------------------------+--------------+
```


7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
número de empleados que tiene.

```sql
SELECT ci.nombre_ciudad, COUNT(e.id_empleado) AS num_empleados
FROM ciudad ci
LEFT JOIN oficina o ON ci.id_ciudad = o.id_ciudad
LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
GROUP BY ci.nombre_ciudad;
```
```mysql
+---------------+---------------+
| nombre_ciudad | num_empleados |
+---------------+---------------+
| Sevilla       |             3 |
| París         |             0 |
| Milán         |             0 |
| Colonia       |             0 |
| Londres       |             0 |
| Los Ángeles   |             0 |
| Barcelona     |             0 |
| Marsella      |             0 |
| Roma          |             0 |
| Berlín        |             0 |
| Manchester    |             0 |
| San Francisco |             0 |
| Madrid        |             4 |
| Valencia      |             2 |
| Bilbao        |             0 |
| Granada       |             0 |
+---------------+---------------+
```