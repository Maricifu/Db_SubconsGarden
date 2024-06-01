USE gardenDB;


INSERT INTO gama_producto VALUES 
	('Herbaceas','Plantas para jardin decorativas',NULL,NULL),
	('Herramientas','Herramientas para todo tipo de acción',NULL,NULL),
	('Aromáticas','Plantas aromáticas',NULL,NULL),
	('Frutales','Árboles pequeños de producción frutal',NULL,NULL),
	('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);


INSERT INTO proveedor VALUES
	(1, 'HiperGarden Tools', 'info@hipergarden.com'), 
	(2, 'Murcia Seasons', 'murciaseasons@gmail.com'), 
	(3, 'Frutales Talavera S.A', 'frutalestalavera@hotmail.com'), 
	(4, 'NaranjasValencianas.com', 'ventas@naranjasvalencianas.com'), 
	(5, 'Melocotones de Cieza S.A.', 'melocotonesdecieza@yahoo.es'),
	(6, 'Jerte Distribuciones S.L.', 'jertedistribuciones@outlook.com'), 
	(7, 'Viveros EL OASIS', 'viverosoasis@orange.es'); 


INSERT INTO producto VALUES
	(1, 'Lavanda', 'Aromáticas', '0,20 m x 0,20 m x 0,20 m', 2, 'Planta aromática de flores violetas con propiedades calmantes y relajantes. Ideal para jardines, macetas y decoración del hogar.', 110, 3.50, 2.20),
	(2, 'Romero', 'Aromáticas', '0,30 m x 0,20 m x 0,20 m', 2, 'Planta aromática de hojas verdes con propiedades digestivas y antioxidantes. Ideal para condimentar carnes, guisos y preparaciones culinarias.', 30, 2.80, 1.80),
	(3, 'Tomillo', 'Aromáticas', '0,25 m x 0,20 m x 0,20 m', 2, 'Planta aromática de hojas pequeñas con propiedades antisépticas y expectorantes. Ideal para infusiones, condimentos y repelente natural de insectos.', 101, 3.20, 2.00),
	(4, 'Cebollino', 'Aromáticas', '0,20 m x 0,10 m x 0,10 m', 2, 'Planta aromática de hojas finas y sabor suave. Ideal para ensaladas, salsas y guarniciones.', 15, 2.50, 1.50),
	(5, 'Perejil', 'Aromáticas', '0,30 m x 0,20 m x 0,20 m', 2, 'Planta aromática de hojas verdes con un sabor fresco y intenso. Ideal para condimentar sopas, salsas, carnes y pescados.', 25, 2.70, 1.70),
	(6, 'Martillo', 'Herramientas', '0,25 m x 0,15 m x 0,05 m', 1, 'Herramienta manual utilizada para golpear, clavar y romper materiales. Ideal para trabajos de bricolaje, carpintería y construcción.', 105, 12.00, 8.00),
	(7, 'Destornillador', 'Herramientas', '0,20 m x 0,05 m x 0,02 m', 1, 'Herramienta manual utilizada para ajustar y aflojar tornillos. Ideal para trabajos de bricolaje, carpintería y electrónica.', 25, 8.00, 5.00),
	(8, 'Llave inglesa', 'Herramientas', '0,25 m x 0,10 m x 0,03 m', 1, 'Herramienta manual ajustable utilizada para apretar y aflojar tuercas y tornillos. Ideal para trabajos de fontanería, mecánica y bricolaje.', 15, 15.00, 10.00),
	(9, 'Cinta métrica', 'Herramientas', '0,05 m x 0,05 m x 0,02 m', 1, 'Herramienta de medición utilizada para determinar la longitud de objetos. Ideal para trabajos de bricolaje, carpintería y construcción.', 12, 5.00, 3.00),
	(10, 'Nivel de burbuja', 'Herramientas', '0,20 m x 0,05 m x 0,02 m', 1, 'Herramienta de medición utilizada para verificar la horizontalidad o verticalidad de superficies. Ideal para trabajos de albañilería, carpintería y construcción.', 10, 7.00, 4.50),
	(11, 'Jazmín', 'Ornamentales', '1,50 m x 1,00 m x 1,00 m', 7, 'Arbusto ornamental con flores blancas y aromáticas. Ideal para jardines, macetas y pérgolas.', 18, 12.00, 9.00),
	(12, 'Rosa', 'Ornamentales', '0,80 m x 0,60 m x 0,60 m', 7, 'Arbusto ornamental con flores de diversos colores y fragancias. Ideal para jardines, macetas y arreglos florales.', 130, 15.00, 11.00),
	(13, 'Lavanda', 'Ornamentales', '0,60 m x 0,40 m x 0,40 m', 7, 'Arbusto ornamental con flores violetas y propiedades calmantes. Ideal para jardines, macetas y aromaterapia.', 20, 8.00, 6.00),
	(14, 'Manzano', 'Frutales', '1,50 m x 1,00 m x 1,00 m', 3, 'Árbol frutal que produce manzanas deliciosas y nutritivas. Ideal para jardines y huertos.', 12, 8.00, 6.00),
	(15, 'Peral', 'Frutales', '1,80 m x 1,20 m x 1,20 m', 3, 'Árbol frutal que produce peras dulces y jugosas. Ideal para jardines y huertos.', 10, 9.00, 7.00),
	(16, 'Cerezo', 'Frutales', '1,20 m x 0,80 m x 0,80 m', 5, 'Árbol frutal que produce cerezas dulces y ácidas. Ideal para jardines y huertos.', 15, 7.50, 5.50),
	(17, 'Naranjo', 'Frutales', '2,00 m x 1,50 m x 1,50 m', 5, 'Árbol frutal que produce naranjas jugosas y ricas en vitamina C. Ideal para jardines y huertos.', 8, 12.00, 9.00),
	(18, 'Limonero', 'Frutales', '1,50 m x 1,00 m x 1,00 m', 3, 'Árbol frutal que produce limones ácidos y aromáticos. Ideal para jardines y huertos.', 10, 10.00, 7.50),
	(19, 'Geranio', 'Ornamentales', '0,30 m x 0,25 m x 0,25 m', 7, 'Planta ornamental de flores coloridas y duraderas. Ideal para jardines, macetas y balcones.', 20, 4.50, 3.00),
	(20, 'Begonia', 'Ornamentales', '0,25 m x 0,20 m x 0,20 m', 7, 'Planta ornamental de flores vistosas y hojas decorativas. Ideal para jardines, macetas y cestas colgantes.', 109, 5.00, 3.50),
	(21, 'Surfinia', 'Ornamentales', '0,30 m x 0,25 m x 0,25 m', 7, 'Planta ornamental de flores colgantes y abundantes. Ideal para jardines, macetas y cestas colgantes.', 103, 6.00, 4.00),
	(22, 'Hortensia', 'Ornamentales', '1,00 m x 0,80 m x 0,80 m', 7, 'Arbusto ornamental de flores grandes y vistosas. Ideal para jardines, macetas y jardineras.', 15, 15.00, 10.00),
	(23, 'Dalia', 'Ornamentales', '0,50 m x 0,40 m x 0,40 m', 7, 'Planta ornamental de flores grandes y llamativas. Ideal para jardines, macetas y arreglos florales.', 12, 7.00, 5.00),
	(24, 'Higuera', 'Frutales', '2,50 m x 2,00 m x 2,00 m', 4, 'Árbol frutal que produce higos dulces y nutritivos. Ideal para jardines y huertos.', 10, 10.00, 8.00),
	(25, 'Kiwi', 'Frutales', '2,00 m x 1,50 m x 1,50 m', 5, 'Árbol frutal que produce kiwis ricos en vitamina C. Ideal para jardines y huertos.', 12, 12.00, 9.00),
	(26, 'Uva', 'Frutales', '1,50 m x 1,00 m x 1,00 m', 4, 'Parra frutal que produce uvas dulces y jugosas. Ideal para jardines, huertos y consumo fresco.', 15, 8.00, 6.00),
	(27, 'Granada', 'Frutales', '2,00 m x 1,50 m x 1,50 m', 5, 'Árbol frutal que produce granadas con propiedades antioxidantes. Ideal para jardines y huertos.', 8, 14.00, 10.50),
	(28, 'Frambuesa', 'Frutales', '1,00 m x 0,80 m x 0,80 m', 4, 'Arbusto frutal que produce frambuesas dulces y aromáticas. Ideal para jardines, huertos y consumo fresco.', 100, 9.00, 6.50),
	(29, 'Salvia', 'Herbáceas', '0,30 m x 0,20 m x 0,20 m', 6, 'Planta aromática y medicinal con propiedades antiinflamatorias y digestivas. Ideal para jardines, macetas y uso culinario.', 20, 4.00, 2.50),
	(30, 'Orégano', 'Herbáceas', '0,25 m x 0,20 m x 0,20 m', 6, 'Planta aromática y medicinal con propiedades digestivas y antioxidantes. Ideal para condimentar carnes, pizzas y salsas.', 22, 5.00, 3.50),
	(31, 'Hierbabuena', 'Herbáceas', '0,30 m x 0,20 m x 0,20 m', 6, 'Planta aromática y medicinal con propiedades digestivas y refrescantes. Ideal para infusiones, tés y mojitos.', 102, 4.50, 3.00),
	(32, 'Cilantro', 'Herbáceas', '0,30 m x 0,25 m x 0,25 m', 6, 'Planta aromática y medicinal con un sabor fresco y cítrico. Ideal para condimentar salsas, guisos y platos mexicanos.', 20, 6.00, 4.00),
	(33, 'Menta', 'Herbáceas', '0,25 m x 0,20 m x 0,20 m', 6, 'Planta aromática y medicinal con un sabor refrescante y mentolado. Ideal para infusiones, postres y caramelos.', 104, 4.00, 2.50),
	(34, 'Albahaca', 'Herbáceas', '0,30 m x 0,25 m x 0,25 m', 6, 'Planta aromática y medicinal con un sabor intenso y ligeramente picante. Ideal para condimentar pastas, pizzas y salsas.', 25, 5.50, 3.80),
	(35, 'Tomillo limón', 'Herbáceas', '0,25 m x 0,20 m x 0,20 m', 6, 'Variedad de tomillo con un aroma cítrico y limón. Ideal para condimentar pescados, mariscos y ensaladas.', 18, 5.00, 3.50),
	(36, 'Romero limón', 'Herbáceas', '0,30 m x 0,20 m x 0,20 m', 6, 'Variedad de romero con un aroma cítrico y limón. Ideal para condimentar carnes, pollos y verduras.', 20, 6.00, 4.00),
	(37, 'Perejil rizado', 'Herbáceas', '0,30 m x 0,25 m x 0,25 m', 6, 'Variedad de perejil con hojas rizadas y un sabor más intenso. Ideal para condimentar sopas, salsas y ensaladas.', 107, 4.50, 3.00),
	(38, 'Cebollino fino', 'Herbáceas', '0,20 m x 0,10 m x 0,10 m', 6, 'Variedad de cebollino con tallos más finos y un sabor más suave. Ideal para ensaladas, salsas y guarniciones.', 12, 3.50, 2.50),
	(39, 'Estragón', 'Herbáceas', '0,30 m x 0,20 m x 0,20 m', 6, 'Planta aromática con un sabor anisado y ligeramente picante. Ideal para condimentar pescados, salsas y vinagretas.', 22, 6.00, 4.00);

INSERT INTO pais (id_pais, nombre_pais, iso3, prefijo) VALUES
    (1, 'España', 'ESP', '+34'),
    (2, 'Francia', 'FRA', '+33'),
    (3, 'Italia', 'ITA', '+39'),
    (4, 'Alemania', 'DEU', '+49'),
    (5, 'Reino Unido', 'GBR', '+44'),
    (6, 'Estados Unidos', 'USA', '+1');



INSERT INTO region (id_region, nombre_region, id_pais) VALUES
    (1, 'Andalucía', 1),
    (2, 'Île-de-France', 2),
    (3, 'Lombardía', 3),
    (4, 'Renania del Norte-Westfalia', 4),
    (5, 'Inglaterra', 5),
    (6, 'California', 6);



INSERT INTO ciudad (id_ciudad, nombre_ciudad, id_region, codigo_postal) VALUES
    (1, 'Sevilla', 1, '41001'),
    (2, 'París', 2, '75001'),
    (3, 'Milán', 3, '20121'),
    (4, 'Colonia', 4, '50667'),
    (5, 'Londres', 5, 'SW1A 1AA'),
    (6, 'Los Ángeles', 6, '90001'),
    (7, 'Barcelona', 1, '08001'),
    (8, 'Marsella', 2, '13001'),
    (9, 'Roma', 3, '00184'),
    (10, 'Berlín', 4, '10115'),
    (11, 'Manchester', 5, 'M1 1AF'),
    (12, 'San Francisco', 6, '94102'),
    (13, 'Madrid', 1, '28001'),
    (14, 'Sevilla', 1, '41001'),
    (15, 'Valencia', 1, '46001'),
    (16, 'Bilbao', 1, '48001'),
    (17, 'Granada', 1, '18001');



INSERT INTO oficina (id_oficina, id_ciudad) VALUES
    (1, 13),   -- Oficina en Madrid
    (2, 14),   -- Oficina en Sevilla
    (3, 15);   -- Oficina en Valencia


INSERT INTO tipo_telefono (id_tipo_telefono, tipo) VALUES
	(1, 'Casa'),
	(2, 'Primario'),
	(3, 'Móvil'),
	(4, 'Fax'),
	(5, 'Secundario'),
	(6, 'Temporal'),
	(7, 'Fijo');


INSERT INTO telefono (id_telefono, num_telefono, id_tipo_telefono, observaciones) VALUES
	(4, '4567890123', 2, 'Teléfono principal oficina en Madrid'),
	(5, '5678901234', 3, 'Móvil contacto en Sevilla'),
	(6, '6789012345', 7, 'Teléfono fijo oficina en Valencia'),
	(7, '7890123456', 2, 'Teléfono cliente A'),
	(8, '8901234567', 3, 'Móvil cliente B'),
	(9, '9012345678', 7, 'Teléfono fijo cliente C'),
	(10, '1123456789', 2, 'Teléfono cliente D'),
	(11, '1234567801', 3, 'Móvil cliente E'),
	(12, '1345678902', 7, 'Teléfono fijo cliente F'),
	(13, '1456789013', 2, 'Teléfono cliente G'),
	(14, '1567890124', 3, 'Móvil cliente H'),
	(15, '1678901235', 7, 'Teléfono fijo cliente I'),
	(16, '1789012346', 2, 'Teléfono cliente J'),
	(17, '1890123457', 3, 'Móvil cliente K'),
	(18, '1901234568', 7, 'Teléfono fijo cliente L'),
	(19, '2012345679', 2, 'Teléfono cliente M'),
	(20, '2123456789', 3, 'Móvil cliente N'),
	(21, '2234567890', 7, 'Teléfono fijo cliente O'),
	(22, '2345678901', 2, 'Teléfono cliente P'),
	(23, '2456789012', 3, 'Móvil cliente Q');


INSERT INTO telefono_oficina (id_telefono_oficina, id_telefono, id_oficina) VALUES
	(1, 4, 1),  -- Teléfono de oficina en Madrid
	(2, 5, 2),  -- Teléfono de oficina en Sevilla
	(3, 6, 3);  -- Teléfono de oficina en Valencia

	
INSERT INTO tipo_direccion (id_tipo_direccion, tipo) VALUES
	(1, 'Principal'),
	(2, 'Secundaria'),
	(3, 'Entrega'),
	(4, 'Facturación');


INSERT INTO direccion (id_direccion, direccion, id_tipo_direccion, observaciones) VALUES
(1, '123 Main Street', 1, 'Edificio principal Garden'),
(2, '456 Elm Street', 2, 'Suite 100'),
(3, '789 Oak Street', 1, 'Edificio principal Garden'),
(4, '321 Pine Street', 3, 'Para entrega'),
(5, '654 Maple Street', 4, 'Para facturación'),
(6, '987 Cedar Street', 3, 'Para entrega'),
(7, '135 Birch Street', 1, 'Edificio principal Garden'),
(8, '246 Walnut Street', 2, 'Suite 200'),
(9, '357 Cherry Street', 1, 'Edificio principal'),
(10, '468 Sycamore Street', 4, 'Para facturación'),
(11, '579 Willow Street', 3, 'Para entrega'),
(12, '680 Pineapple Street', 1, 'Edificio principal'),
(13, '791 Banana Street', 2, 'Suite 300'),
(14, '802 Orange Street', 1, 'Edificio principal'),
(15, '913 Mango Street', 4, 'Para facturación'),
(16, '124 Papaya Street', 1, 'Edificio principal'),
(17, '235 Guava Street', 3, 'Para entrega'),
(18, '346 Kiwi Street', 1, 'Edificio principal'),
(19, '457 Dragonfruit Street', 2, 'Suite 400'),
(20, '568 Avocado Street', 1, 'Edificio principal');


INSERT INTO direccion_oficina (id_direccion_oficina, id_direccion, id_oficina)
VALUES
    (1, 1, 1), -- Oficina en Madrid
    (2, 3, 2), -- Oficina en Sevilla
    (3, 7, 3); -- Oficina en Valencia


INSERT INTO empleado (id_empleado, id_oficina, nombre, apellido1, apellido2, extension, email, id_jefe, puesto) VALUES
	(1, 1, 'John', 'Doe', NULL, '1001', 'john.doe@example.com', NULL, 'Director General'),
	(2, 1, 'Jane', 'Smith', NULL, '1002', 'jane.smith@example.com', 1, 'Subdirector Marketing'),
	(3, 2, 'Alice', 'Johnson', NULL, '2001', 'alice.johnson@example.com', 1, 'Subdirector Ventas'),
	(4, 2, 'Bob', 'Williams', NULL, '2002', 'bob.williams@example.com', 2, 'Representante de Ventas'),
	(5, 3, 'Charlie', 'Brown', NULL, '3001', 'charlie.brown@example.com', 3, 'Representante de Ventas'),
	(6, NULL, 'David', 'Davis', NULL, '3002', 'david.davis@example.com', 4, 'Secretaria'),
	(7, 1, 'Eve', 'Miller', NULL, '1003', 'eve.miller@example.com', 1, 'Director Oficina'),
	(8, 2, 'Frank', 'Wilson', NULL, '2003', 'frank.wilson@example.com', 7, 'Representante de Ventas'),
	(9, 3, 'Grace', 'Moore', NULL, '3003', 'grace.moore@example.com', 7, 'Representante de Ventas'),
	(10, 1, 'Hank', 'Taylor', NULL, '1004', 'hank.taylor@example.com', 7, 'Representante de Ventas');


INSERT INTO cliente (id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax, id_ciudad, id_empleado_rep_ventas, limite_credito) VALUES
	(1, 'TechCorp', 'Carlos', 'Lopez', '555-0001', 1, 7, 50000.00),
	(2, 'GreenFields', 'Ana', 'Martinez', '555-0002', 2, 9, 30000.00),
	(3, 'Sunshine Ltd.', 'Miguel', 'Hernandez', '555-0003', 13, 5, 40000.00),
	(4, 'OceanBlue', 'Laura', 'Gonzalez', '555-0004', 4, 8, 45000.00),
	(5, 'SkyHigh Inc.', 'Daniel', 'Perez', '555-0005', 5, 10, 60000.00),
	(6, 'MountainView', 'Sofia', 'Rodriguez', '555-0006', 6, 5, 35000.00),
	(7, 'RiverSide', 'Julio', 'Garcia', '555-0007', 7, 8, 30000.00),
	(8, 'StarLight', 'Natalia', 'Fernandez', '555-0008', 8, 9, 25000.00),
	(9, 'Galaxy Co.', 'Luis', 'Martinez', '555-0009', 9, 5, 55000.00),
	(10, 'Thunderbolt', 'Carlos', 'Lopez', '555-0010', 13, 10, 50000.00),
	(11, 'WindPower', 'Ana', 'Martinez', '555-0011', 11, 7, 30000.00),
	(12, 'FireLight', 'Miguel', 'Hernandez', '555-0012', 12, 9, 40000.00),
	(13, 'EarthBound', 'Laura', 'Gonzalez', '555-0013', 13, 5, 45000.00),
	(14, 'WaveMotion', 'Daniel', 'Perez', '555-0014', 14, 8, 60000.00),
	(15, 'QuantumTech', 'Sofia', 'Rodriguez', '555-0015', 15, 10, 35000.00),
	(16, 'AeroDynamics', 'Julio', 'Garcia', '555-0016', 16, 8, 30000.00),
	(17, 'FusionCore', 'Natalia', 'Fernandez', '555-0017', 17, 8, 25000.00);


INSERT INTO direccion_cliente (id_direccion_cliente, id_direccion, id_cliente) VALUES
    (1, 4, 1),   -- Direccion de TechCorp en Madrid
    (2, 5, 2),   -- Direccion de GreenFields en Sevilla
    (3, 6, 3),   -- Direccion de Sunshine Ltd. en Valencia
    (4, 7, 4),   -- Direccion de OceanBlue en Zaragoza
    (5, 8, 5),   -- Direccion de SkyHigh Inc. en Barcelona
    (6, 9, 6),   -- Direccion de MountainView en Bilbao
    (7, 10, 7),  -- Direccion de RiverSide en Málaga
    (8, 11, 8),  -- Direccion de StarLight en Palma de Mallorca
    (9, 12, 9),  -- Direccion de Galaxy Co. en Las Palmas de Gran Canaria
    (10, 13, 10),-- Direccion de Thunderbolt en Alicante
    (11, 14, 11),-- Direccion de WindPower en Córdoba
    (12, 15, 12),-- Direccion de FireLight en Valladolid
    (13, 16, 13),-- Direccion de EarthBound en Vigo
    (14, 17, 14),-- Direccion de WaveMotion en Gijón
    (15, 18, 15),-- Direccion de QuantumTech en Hospitalet de Llobregat
    (16, 19, 16),-- Direccion de AeroDynamics en A Coruña
    (17, 20, 17);-- Direccion de FusionCore en Vitoria-Gasteiz

INSERT INTO telefono_cliente (id_telefono_cliente, id_telefono, id_cliente) VALUES
    (1, 4, 1),   -- Teléfono de TechCorp
    (2, 5, 2),   -- Teléfono de GreenFields
    (3, 6, 3),   -- Teléfono de Sunshine Ltd.
    (4, 7, 4),   -- Teléfono de OceanBlue
    (5, 8, 5),   -- Teléfono de SkyHigh Inc.
    (6, 9, 6),   -- Teléfono de MountainView
    (7, 10, 7),  -- Teléfono de RiverSide
    (8, 11, 8),  -- Teléfono de StarLight
    (9, 12, 9),  -- Teléfono de Galaxy Co.
    (10, 13, 10),-- Teléfono de Thunderbolt
    (11, 14, 11),-- Teléfono de WindPower
    (12, 15, 12),-- Teléfono de FireLight
    (13, 16, 13),-- Teléfono de EarthBound
    (14, 17, 14),-- Teléfono de WaveMotion
    (15, 18, 15),-- Teléfono de QuantumTech
    (16, 19, 16),-- Teléfono de AeroDynamics
    (17, 20, 17);-- Teléfono de FusionCore



-- Inserciones para la tabla pago
INSERT INTO pago (id_transaccion, id_cliente, forma_pago, fecha_pago, total)
VALUES
    (1, 1, 'Tarjeta de crédito', '2008-05-31', 150.00),
    (2, 1, 'Transferencia bancaria', '2024-05-30', 200.00),
    (3, 3, 'Efectivo', '2024-05-29', 180.50),
    (4, 4, 'Tarjeta de débito', '2024-05-28', 220.00),
    (5, 5, 'Paypal', '2008-05-27', 190.00),
    (6, 6, 'Transferencia bancaria', '2008-05-26', 205.00),
    (7, 7, 'Efectivo', '2024-05-25', 250.00),
    (8, 8, 'Tarjeta de crédito', '2024-05-24', 170.00),
    (9, 9, 'Tarjeta de débito', '2024-05-23', 230.00),
    (10, 10, 'Paypal', '2008-05-22', 195.00),
    (11, 11, 'Efectivo', '2024-05-21', 210.00),
    (12, 12, 'Transferencia bancaria', '2024-05-20', 185.00),
    (13, 13, 'Tarjeta de crédito', '2024-05-19', 225.00),
    (14, 14, 'Tarjeta de débito', '2024-05-18', 240.00),
    (15, 15, 'Paypal', '2008-05-17', 175.00),
    (16, 16, 'Efectivo', '2024-05-16', 195.00),
    (17, 17, 'Transferencia bancaria', '2024-05-15', 260.00);
   
   
INSERT INTO estado (id_estado, estado)
VALUES
    (1, 'En proceso'),
    (2, 'Rechazado'),
    (3, 'Enviado'),
    (4, 'Entregado');

   
-- Inserciones para la tabla pedido con id_empleado
INSERT INTO pedido (id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, id_estado, observaciones, id_cliente, id_empleado)
VALUES
    (1, '2024-05-01', '2024-05-02', '2024-04-03', 1, 'Pedido urgente', 1, 1),
    (2, '2009-05-02', '2024-05-03', '2024-05-04', 2, 'Pedido regular', 2, 2),
    (3, '2024-05-03', '2024-05-04', '2024-05-05', 3, 'Pedido urgente', 3, 3),
    (4, '2024-05-04', '2024-05-05', '2024-01-06', 1, 'Pedido regular', 4, 4),
    (5, '2009-05-05', '2024-05-06', '2024-04-07', 2, 'Pedido urgente', 5, 5),
    (6, '2009-05-06', '2024-05-07', '2024-05-08', 3, 'Pedido regular', 6, 6),
    (7, '2024-05-07', '2024-05-08', '2024-05-09', 1, 'Pedido urgente', 7, 7),
    (8, '2024-05-08', '2024-05-09', '2024-01-10', 2, 'Pedido regular', 8, 8),
    (9, '2024-05-09', '2024-05-10', '2024-01-11', 3, 'Pedido urgente', 9, 9),
    (10, '2008-05-10', '2008-05-11', '2008-04-12', 1, 'Pedido regular', 10, 10),
    (11, '2009-05-11', '2024-05-12', '2024-05-13', 2, 'Pedido urgente', 11, 1),
    (12, '2024-05-12', '2024-05-13', '2024-01-14', 3, 'Pedido regular', 12, 2),
    (13, '2024-05-13', '2024-05-14', '2024-04-15', 1, 'Pedido urgente', 13, 3),
    (14, '2009-05-14', '2024-05-15', '2024-05-16', 2, 'Pedido regular', 14, 4),
    (15, '2008-05-15', '2008-05-16', '2008-04-17', 3, 'Pedido urgente', 15, 5),
    (16, '2024-05-16', '2024-05-17', '2024-01-18', 1, 'Pedido regular', 16, 6),
    (17, '2008-05-17', '2008-05-18', '2008-05-19', 2, 'Pedido urgente', 17, 7);
   
   
   
-- Inserciones para la tabla detalle_pedido
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unidad, numero_linea)
VALUES
    -- Detalles del pedido 1
    (1, 1, 10, 3.50, 1),
    (1, 2, 5, 2.80, 2),
    -- Detalles del pedido 2
    (2, 3, 8, 3.20, 1),
    (2, 4, 12, 2.50, 2),
    -- Detalles del pedido 3
    (3, 5, 15, 2.70, 1),
    (3, 6, 6, 12.00, 2),
    -- Detalles del pedido 4
    (4, 7, 20, 8.00, 1),
    (4, 8, 10, 15.00, 2),
    -- Detalles del pedido 5
    (5, 9, 25, 5.00, 1),
    (5, 10, 10, 7.00, 2),
    -- Detalles del pedido 6
    (6, 11, 8, 12.00, 1),
    (6, 12, 6, 15.00, 2),
    -- Detalles del pedido 7
    (7, 13, 10, 8.00, 1),
    (7, 14, 12, 15.00, 2),
    -- Detalles del pedido 8
    (8, 15, 15, 9.00, 1),
    (8, 16, 20, 7.50, 2),
    -- Detalles del pedido 9
    (9, 17, 18, 12.00, 1),
    (9, 18, 22, 10.00, 2),
    -- Detalles del pedido 10
    (10, 19, 10, 4.50, 1),
    (10, 20, 8, 5.00, 2),
    -- Detalles del pedido 11
    (11, 21, 12, 6.00, 1),
    (11, 22, 15, 15.00, 2),
    -- Detalles del pedido 12
    (12, 23, 18, 7.00, 1),
    (12, 24, 20, 10.00, 2),
    -- Detalles del pedido 13
    (13, 25, 8, 12.00, 1),
    (13, 26, 10, 8.00, 2),
    -- Detalles del pedido 14
    (14, 27, 12, 14.00, 1),
    (14, 28, 15, 9.00, 2),
    -- Detalles del pedido 15
    (15, 29, 20, 4.00, 1),
    (15, 30, 22, 5.00, 2),
    -- Detalles del pedido 16
    (16, 31, 18, 4.50, 1),
    (16, 32, 20, 6.00, 2),
    -- Detalles del pedido 17
    (17, 33, 22, 5.00, 1),
    (17, 34, 18, 5.50, 2);

