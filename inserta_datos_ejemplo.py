import mysql.connector
import random

# Conexión a la base de datos
db = mysql.connector.connect(
    host='172.17.0.2',
    user='root',
    password='sistemas_expertos',
    database='OrientacionVocacional',
    port='3306'
)
cursor = db.cursor()

# Obtener los IDs de usuarios existentes para garantizar la integridad referencial
cursor.execute("SELECT ID_Usuario FROM Usuarios")
usuarios_validos = [item[0] for item in cursor.fetchall()]  # Lista de IDs de usuario

# Obtener los IDs de las preguntas para asociar respuestas válidas
cursor.execute("SELECT ID_Pregunta FROM Preguntas")
preguntas_validas = [item[0] for item in cursor.fetchall()]  # Lista de IDs de pregunta

# Asumiendo que todas las preguntas tienen el mismo número de opciones
cursor.execute("SELECT COUNT(*) FROM Opciones WHERE ID_Pregunta = %s", (preguntas_validas[0],))
num_opciones = cursor.fetchone()[0]  # Número de opciones por pregunta

# Insertar respuestas para cada usuario en la base de datos
for usuario_id in usuarios_validos:
    for pregunta_id in preguntas_validas:
        # Seleccionar una opción aleatoria para la respuesta
        opcion_aleatoria = random.randint(1, num_opciones)
        # Preparar la consulta SQL para insertar la respuesta
        insert_query = """
        INSERT INTO Respuestas (ID_Usuario, ID_Pregunta, ID_Opcion)
        VALUES (%s, %s, %s)
        """
        # Ejecutar la consulta SQL con los valores correspondientes
        cursor.execute(insert_query, (usuario_id, pregunta_id, opcion_aleatoria))

# Guardar los cambios en la base de datos
db.commit()

# Cerrar el cursor y la conexión a la base de datos
cursor.close()
db.close()