-- Insertamos un cuestionario
INSERT INTO Cuestionarios (Nombre, Descripcion) VALUES ('Cuestionario General', 'Un cuestionario general para determinar intereses y habilidades.');

-- Insertamos preguntas para el cuestionario
INSERT INTO Preguntas (ID_Cuestionario, Texto_Pregunta) VALUES 
(1, '¿Disfrutas trabajar en equipo?'),
(1, '¿Te consideras una persona creativa?'),
(1, '¿Prefieres trabajar solo?'),
(1, '¿Te interesan las ciencias exactas?'),
(1, '¿Te gusta ayudar a los demás?');

-- Insertamos opciones para cada pregunta
INSERT INTO Opciones (ID_Pregunta, Texto_Opcion, Puntuacion) VALUES 
(1, 'Sí', 10), (1, 'No', 0),
(2, 'Sí', 10), (2, 'No', 0),
(3, 'Sí', 10), (3, 'No', 0),
(4, 'Sí', 10), (4, 'No', 0),
(5, 'Sí', 10), (5, 'No', 0);

-- Insertamos carreras
INSERT INTO Carreras (Nombre, Descripcion) VALUES 
('Ingeniería', 'Estudio de la ingeniería.'),
('Medicina', 'Estudio de las ciencias de la salud.'),
('Derecho', 'Estudio de las leyes y la justicia.'),
('Arte', 'Estudio de las artes.'),
('Ciencias Sociales', 'Estudio de las ciencias sociales.');

-- Insertamos áreas de interés
INSERT INTO AreasInteres (Nombre, Descripcion) VALUES 
('Tecnología', 'Interés en tecnología y ciencias exactas.'),
('Salud', 'Interés en la salud y el bienestar.'),
('Humanidades', 'Interés en las ciencias humanas y sociales.'),
('Creatividad', 'Interés en la creatividad y el arte.');

-- Insertamos competencias
INSERT INTO Competencias (Nombre, Descripcion) VALUES 
('Trabajo en equipo', 'Capacidad para trabajar en equipo.'),
('Innovación', 'Capacidad para innovar y crear.'),
('Análisis', 'Capacidad para analizar y resolver problemas.'),
('Empatía', 'Capacidad para entender y compartir los sentimientos de otros.');

-- Relacionamos carreras con áreas de interés
INSERT INTO CarrerasAreasInteres (ID_Carrera, ID_AreaInteres) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 3);

-- Relacionamos carreras con competencias
INSERT INTO CarrerasCompetencias (ID_Carrera, ID_Competencia) VALUES 
(1, 3), (2, 4), (3, 1), (4, 2), (5, 1);

-- Insertamos usuarios
INSERT INTO Usuarios (Nombre, Edad, Correo) VALUES 
('Usuario1', 20, 'usuario1@example.com'),
('Usuario2', 22, 'usuario2@example.com'),
...
('Usuario100', 25, 'usuario100@example.com');


