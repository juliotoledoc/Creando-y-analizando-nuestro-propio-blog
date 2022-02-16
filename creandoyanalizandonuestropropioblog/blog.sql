-- 1 Crear base de datos llamada blog
CREATE DATABASE blog;
\c blog;

-- 2 Crear las tablas indicadas de acuerdo al modelo de datos
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comentarios;

CREATE TABLE usuarios(
    id SERIAL,
    email VARCHAR (30) UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE posts(
    id SERIAL,
    usuario_id INT,
    titulo TEXT,
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    usuario_id INT,
    texto TEXT,
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (post_id) REFERENCES usuarios(id)
);

-- 3 Insertar registros
INSERT INTO usuarios(email)
    VALUES ('usuario01@hotmail.com'),
           ('usuario02@gmail.com'),
           ('usuario03@gmail.com'),
           ('usuario04@hotmail.com'),
           ('usuario05@yahoo.com'),
           ('usuario06@hotmail.com'),
           ('usuario07@yahoo.com'),
           ('usuario08@yahoo.com'),
           ('usuario09@yahoo.com'),

INSERT INTO posts(usuario_id, titulo, fecha)
    VALUES (1. 'Post1: Esto es malo', '2020-06-29')
           (5, 'Post2: Esto es malo', '2020-06-20')
           (1, 'Post3: Esto es excelente', '2020-05-30')
           (9, 'Post4: Esto es bueno', '2020-05-09')
           (7, 'Post5: Esto es bueno', '2020-07-18')
           (5, 'Post6: Esto es excelente', '2020-07-18')
           (8, 'Post7: Esto es excelente', '2020-07-07')
           (5, 'Post8: Esto es excelente', '2020-05-14')
           (2, 'Post9: Esto es bueno', '2020-05-08')
           (6, 'Post10: Esto es bueno', '2020-06-02')
           (4, 'Post11: Esto es bueno', '2020-05-05')
           (9, 'Post12: Esto es malo', '2020-07-23')
           (5, 'Post13: Esto es excelente', '2020-05-30')
           (8, 'Post14: Esto es excelente', '2020-05-01')
           (7, 'Post15: Esto es malo', '2020-06-17')

INSERT INTO comentarios(usuario_id, post_id, texto, fecha)
    VALUES (3, 6, 'Este es el comentario 1', '2020-07-08'),
           (4, 2, 'Este es el comentario 2', '2020-06-07'),
           (6, 4, 'Este es el comentario 3', '2020-06-16'),
           (2, 13, 'Este es el comentario 4', '2020-06-15'),
           (6, 6, 'Este es el comentario 5', '2020-05-14'),
           (3,3, 'Este es el comentario 6', '2020-07-08'),
           (6, 1, 'Este es el comentario 7', '2020-05-22'),
           (6, 7, 'Este es el comentario 8', '2020-070-09'),
           (8, 13, 'Este es el comentario 9', '2020-06-30'),
           (8,6 'Este es el comentario 10', '2020-06-19'),
           (5, 1, 'Este es el comentario 11', '2020-05-09'),
           (8, 15, 'Este es el comentario 12', '2020-06-17'),
           (1, 9, 'Este es el comentario 13', '2020-05-01'),
           (2, 5, 'Este es el comentario 14', '2020-05-31'),
           (4, 3, 'Este es el comentario 15', '2020-06-28');

-- 4 Seleccionar el correo, id y título de todos los post publicados por el usuario 5
SELECT p.id, u.email, p.titulo FROM post AS p INNER JOIN usuarios AS u ON p.usuario_id = u.id WHERE p.usuario_id = 5;

-- 5 Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com 
--no pude hacerlo...

-- 6 Listar los usuarios que no han publicado ningún post
SELECT u.email, c.id, c.texto FROM comentarios AS c JOIN usuarios AS u ON c.usuario_id = u.id WHERE u.email <> 'usuario06@hotmail.com';

-- 7 Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios)
SELECT u.email, u.id FROM usuarios AS u JOIN posts AS p ON u.id = p.usuario_id WHERE CAST(p.fecha AS VARCHAR) LIKE '%-06-%';

-- 8 Listar todos los usuarios que hayan publicado un post en Junio
SELECT * FROM usuarios WHERE id IN (SELECT usuario_id FROM articulos WHERE articulos.fecha BETWEEN '2020-06-01' AND '2020-06-30');