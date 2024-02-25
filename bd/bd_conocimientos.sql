CREATE DATABASE IF NOT EXISTS OrientacionVocacional;
USE OrientacionVocacional;

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Edad INT,
    Correo VARCHAR(255) UNIQUE
);

CREATE TABLE Cuestionarios (
    ID_Cuestionario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Preguntas (
    ID_Pregunta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cuestionario INT,
    Texto_Pregunta TEXT,
    FOREIGN KEY (ID_Cuestionario) REFERENCES Cuestionarios(ID_Cuestionario)
);

CREATE TABLE Opciones (
    ID_Opcion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pregunta INT,
    Texto_Opcion TEXT,
    Puntuacion INT,
    FOREIGN KEY (ID_Pregunta) REFERENCES Preguntas(ID_Pregunta)
);

CREATE TABLE Respuestas (
    ID_Respuesta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Pregunta INT,
    ID_Opcion INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Pregunta) REFERENCES Preguntas(ID_Pregunta),
    FOREIGN KEY (ID_Opcion) REFERENCES Opciones(ID_Opcion)
);

CREATE TABLE Carreras (
    ID_Carrera INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Recomendaciones (
    ID_Recomendacion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Carrera INT,
    Puntuacion INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Carrera) REFERENCES Carreras(ID_Carrera)
);

CREATE TABLE AreasInteres (
    ID_AreaInteres INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE CarrerasAreasInteres (
    ID_Carrera INT,
    ID_AreaInteres INT,
    PRIMARY KEY (ID_Carrera, ID_AreaInteres),
    FOREIGN KEY (ID_Carrera) REFERENCES Carreras(ID_Carrera),
    FOREIGN KEY (ID_AreaInteres) REFERENCES AreasInteres(ID_AreaInteres)
);

CREATE TABLE Competencias (
    ID_Competencia INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE CarrerasCompetencias (
    ID_Carrera INT,
    ID_Competencia INT,
    PRIMARY KEY (ID_Carrera, ID_Competencia),
    FOREIGN KEY (ID_Carrera) REFERENCES Carreras(ID_Carrera),
    FOREIGN KEY (ID_Competencia) REFERENCES Competencias(ID_Competencia)
);

CREATE TABLE ResultadosCuestionario (
    ID_Resultado INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Cuestionario INT,
    Resultado TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Cuestionario) REFERENCES Cuestionarios(ID_Cuestionario)
);

