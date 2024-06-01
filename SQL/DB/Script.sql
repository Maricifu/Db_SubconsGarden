CREATE DATABASE gardenDB;
USE gardenDB;

CREATE TABLE gama_producto (
    gama VARCHAR(50) PRIMARY KEY,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256)
);

CREATE TABLE proveedor (
    id_proveedor INT(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
    id_producto INT(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    gama VARCHAR(50) NOT NULL,
    dimensiones VARCHAR(25),
    id_proveedor INT(15) NOT NULL,
    descripcion TEXT,
    cantidad_en_stock INT(200) NOT NULL,
    precio_venta DECIMAL(15,2) NOT NULL,
    precio_proveedor DECIMAL(15,2),
    FOREIGN KEY (gama) REFERENCES gama_producto(gama),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE pais (
    id_pais INT(15) PRIMARY KEY,
    nombre_pais VARCHAR(50) NOT NULL,
    iso3 CHAR(3) NOT NULL,
    prefijo VARCHAR(10)
);

CREATE TABLE region (
    id_region INT(15) PRIMARY KEY,
    nombre_region VARCHAR(50) NOT NULL,
    id_pais INT(15) NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE ciudad (
    id_ciudad INT(15) PRIMARY KEY,
    nombre_ciudad VARCHAR(50) NOT NULL,
    id_region INT(15) NOT NULL,
    codigo_postal VARCHAR(20),
    FOREIGN KEY (id_region) REFERENCES region(id_region)
);

CREATE TABLE oficina (
    id_oficina INT(15) PRIMARY KEY,
    id_ciudad INT(15) NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE tipo_telefono (
    id_tipo_telefono INT(15) PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL
);

CREATE TABLE telefono (
    id_telefono INT(15) PRIMARY KEY,
    num_telefono VARCHAR(20) NOT NULL,
    id_tipo_telefono INT(15) NOT NULL,
    observaciones VARCHAR(100),
    FOREIGN KEY (id_tipo_telefono) REFERENCES tipo_telefono(id_tipo_telefono)
);

CREATE TABLE telefono_oficina (
    id_telefono_oficina INT(15) PRIMARY KEY,
    id_telefono INT(15) NOT NULL, 
    id_oficina INT(15) NOT NULL,
    FOREIGN KEY (id_telefono) REFERENCES telefono(id_telefono),
    FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina)
);

CREATE TABLE tipo_direccion (
    id_tipo_direccion INT(15) PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL
);

CREATE TABLE direccion (
    id_direccion INT(15) PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    id_tipo_direccion INT(15) NOT NULL,
    observaciones VARCHAR(100),
    FOREIGN KEY (id_tipo_direccion) REFERENCES tipo_direccion(id_tipo_direccion)
);

CREATE TABLE direccion_oficina (
    id_direccion_oficina INT(15) PRIMARY KEY,
    id_direccion INT(15) NOT NULL, 
    id_oficina INT(15) NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
    FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina)
);

CREATE TABLE empleado (
    id_empleado INT(15) PRIMARY KEY,
    id_oficina INT(15) ,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    extension VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_jefe INT(15),
    puesto VARCHAR(50),
    FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina),
    FOREIGN KEY (id_jefe) REFERENCES empleado(id_empleado)
);

CREATE TABLE cliente (
    id_cliente INT(15) PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    fax VARCHAR(15) NOT NULL,
    id_ciudad INT(15) NOT NULL,
    id_empleado_rep_ventas INT(15),
    limite_credito DECIMAL(15,2),
    FOREIGN KEY (id_empleado_rep_ventas) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE direccion_cliente (
    id_direccion_cliente INT(15) PRIMARY KEY,
    id_direccion INT(15) NOT NULL, 
    id_cliente INT(15) NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE telefono_cliente (
    id_telefono_cliente INT(15) PRIMARY KEY,
    id_telefono INT(15) NOT NULL, 
    id_cliente INT(15) NOT NULL,
    FOREIGN KEY (id_telefono) REFERENCES telefono(id_telefono),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

	CREATE TABLE pago (
	    id_transaccion INT NOT NULL,
	    id_cliente INT(15),
	    forma_pago VARCHAR(40) NOT NULL,
	    fecha_pago DATE NOT NULL,
	    total DECIMAL(15,2) NOT NULL,
	    PRIMARY KEY (id_transaccion, id_cliente),
	    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	);
	
	CREATE TABLE estado (
	    id_estado INT(15) PRIMARY KEY,
	    estado VARCHAR(50) NOT NULL
	);
	
	CREATE TABLE pedido (
	    id_pedido INT(15) PRIMARY KEY,
	    fecha_pedido DATE NOT NULL,
	    fecha_esperada DATE NOT NULL,
	    fecha_entrega DATE,
	    id_estado INT(15) NOT NULL,
	    observaciones TEXT,
	    id_cliente INT(15),
	    id_empleado INT(15),
	    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	    FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
	    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
	);
	
	CREATE TABLE detalle_pedido (
	    id_pedido INT(15) NOT NULL,
	    id_producto INT(15),
	    cantidad INT(11) NOT NULL,
	    precio_unidad DECIMAL(15,2) NOT NULL,
	    numero_linea SMALLINT(6) NOT NULL,
	    PRIMARY KEY(id_pedido, id_producto),
	    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
	    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
	);
