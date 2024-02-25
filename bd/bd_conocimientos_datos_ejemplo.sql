-- Inserción de datos de ejemplo para Usuarios
INSERT INTO Usuarios (Nombre, Edad, Correo) VALUES 
('Usuario1', FLOOR(RAND() * (35 - 18 + 1)) + 18, 'usuario1@example.com'),
('Usuario2', FLOOR(RAND() * (35 - 18 + 1)) + 18, 'usuario2@example.com'),
-- Se añaden entradas hasta llegar a Usuario100
('Usuario100', FLOOR(RAND() * (35 - 18 + 1)) + 18, 'usuario100@example.com');

-- Inserción de datos para Cuestionarios
INSERT INTO Cuestionarios (Nombre, Descripcion) VALUES 
('Cuestionario 1', 'Descripción del Cuestionario 1'),
('Cuestionario 2', 'Descripción del Cuestionario 2');

-- Inserción de datos para Preguntas
INSERT INTO Preguntas (ID_Cuestionario, Texto_Pregunta) VALUES 
(1, '¿Pregunta 1 del Cuestionario 1?'),
(1, '¿Pregunta 2 del Cuestionario 1?'),
(2, '¿Pregunta 1 del Cuestionario 2?');

-- Inserción de datos para Opciones
INSERT INTO Opciones (ID_Pregunta, Texto_Opcion, Puntuacion) VALUES 
(1, 'Opción 1 de la Pregunta 1', 10),
(1, 'Opción 2 de la Pregunta 1', 5),
(2, 'Opción 1 de la Pregunta 2', 10);

-- Inserción de datos para Carreras
INSERT INTO Carreras (Nombre, Descripcion) VALUES 
('Ingeniería', 'Descripción de Ingeniería'),
('Medicina', 'Descripción de Medicina');

-- Inserción de datos para Áreas de Interés
INSERT INTO AreasInteres (Nombre, Descripcion) VALUES 
('Tecnología', 'Descripción de Tecnología'),
('Salud', 'Descripción de Salud');

-- Inserción de datos para Competencias
INSERT INTO Competencias (Nombre, Descripcion) VALUES 
('Lógica Matemática', 'Descripción de Lógica Matemática'),
('Empatía con los pacientes', 'Descripción de Empatía con los pacientes');

-- Inserción de respuestas de ejemplo para los usuarios
-- Suponiendo que todos los usuarios responden a todas las preguntas con opciones aleatorias
INSERT INTO Respuestas (ID_Usuario, ID_Pregunta, ID_Opcion) VALUES 
(1, 1, 1),
(2, 1, 2),
-- Repetir este patrón para cada usuario y cada pregunta
(100, 2, 2);

