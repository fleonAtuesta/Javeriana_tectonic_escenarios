CREATE TABLE productos (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(100),
    categoria VARCHAR(50),
    precio    DECIMAL(10,2)
);

CREATE TABLE clientes (
    id             SERIAL PRIMARY KEY,
    nombre         VARCHAR(100),
    email          VARCHAR(100),
    region         VARCHAR(50),
    fecha_creacion DATE DEFAULT CURRENT_DATE
);

CREATE TABLE ventas (
    id          SERIAL PRIMARY KEY,
    fecha       DATE DEFAULT CURRENT_DATE,
    producto_id INT REFERENCES productos(id),
    cliente_id  INT REFERENCES clientes(id),
    importe     DECIMAL(10,2),
    region      VARCHAR(50)
);

CREATE USER app_user WITH PASSWORD 'userpass';
CREATE USER readonly  WITH PASSWORD 'readonlypass';

GRANT ALL PRIVILEGES ON ALL TABLES    IN SCHEMA public TO app_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO app_user;
GRANT SELECT         ON ALL TABLES    IN SCHEMA public TO readonly;

INSERT INTO productos (nombre, categoria, precio) VALUES
    ('Laptop Pro 15',     'electronica', 1299.99),
    ('Mouse Inalambrico', 'electronica',   29.99),
    ('Teclado Mecanico',  'electronica',   89.99),
    ('Monitor 4K',        'electronica',  499.99),
    ('Silla Ergonomica',  'mobiliario',   349.99),
    ('Escritorio',        'mobiliario',   199.99),
    ('Auriculares BT',    'electronica',   79.99),
    ('Webcam HD',         'electronica',   59.99);

INSERT INTO clientes (nombre, email, region, fecha_creacion) VALUES
    ('Ana Garcia',    'ana@gmail.com',     'norte', '2024-01-15'),
    ('Luis Martinez', 'luis@hotmail.com',  'sur',   '2024-02-20'),
    ('Maria Lopez',   'maria@gmail.com',   'norte', '2024-03-10'),
    ('Pedro Sanchez', 'pedro@yahoo.com',   'este',  '2024-04-05'),
    ('Sofia Ruiz',    'sofia@gmail.com',   'oeste', '2024-05-18'),
    ('Carlos Diaz',   'carlos@gmail.com',  'sur',   '2024-06-22'),
    ('Elena Torres',  'elena@hotmail.com', 'norte', '2024-07-30'),
    ('Miguel Flores', 'miguel@yahoo.com',  'este',  '2024-08-14');

INSERT INTO ventas (fecha, producto_id, cliente_id, importe, region) VALUES
    ('2025-10-01', 1, 1, 1299.99, 'norte'),
    ('2025-10-03', 2, 2,   29.99, 'sur'),
    ('2025-10-05', 3, 3,   89.99, 'norte'),
    ('2025-10-08', 4, 4,  499.99, 'este'),
    ('2025-10-10', 5, 5,  349.99, 'oeste'),
    ('2025-10-12', 1, 6, 1299.99, 'sur'),
    ('2025-10-15', 7, 7,   79.99, 'norte'),
    ('2025-10-18', 8, 8,   59.99, 'este'),
    ('2025-10-20', 2, 1,   29.99, 'norte'),
    ('2025-10-22', 6, 2,  199.99, 'sur'),
    ('2025-11-01', 1, 3, 1299.99, 'norte'),
    ('2025-11-03', 4, 4,  499.99, 'este'),
    ('2025-11-05', 5, 5,  349.99, 'oeste'),
    ('2025-11-08', 3, 6,   89.99, 'sur'),
    ('2025-11-10', 7, 7,   79.99, 'norte');
