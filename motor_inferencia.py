import mysql.connector
from mysql.connector import Error

def conectar_bd():
    try:
        conexion = mysql.connector.connect(
            host='172.17.0.2',
            user='root',
            password='sistemas_expertos',
            database='OrientacionVocacional',
            port='3306'
        )
        if conexion.is_connected():
            print("Conexión exitosa a la base de datos")
            return conexion
    except Error as e:
        print("Error al conectar a MySQL", e)
        return None

def obtener_respuestas_usuario(conexion, id_usuario):
    try:
        cursor = conexion.cursor()
        consulta = "SELECT ID_Pregunta, ID_Opcion FROM Respuestas WHERE ID_Usuario = %s"
        cursor.execute(consulta, (id_usuario,))
        respuestas = cursor.fetchall()
        print(f"Respuestas encontradas para el usuario {id_usuario}: {respuestas}")
        return dict(respuestas)
    finally:
        if conexion.is_connected():
            cursor.close()

def recomendar_carrera(respuestas_usuario):
    if respuestas_usuario:
        opciones_favorables = [opcion for opcion in respuestas_usuario.values() if opcion == 1]
        print(f"Opciones favorables: {opciones_favorables}")
        if len(opciones_favorables) > len(respuestas_usuario) / 2:
            return "Ingeniería"
        else:
            return "Medicina"
    return "No hay suficiente información para hacer una recomendación."

def main():
    conexion = conectar_bd()
    if conexion:
        id_usuario = 1  # Cambiar por el ID del usuario que se desea evaluar
        respuestas_usuario = obtener_respuestas_usuario(conexion, id_usuario)
        if respuestas_usuario:
            carrera_recomendada = recomendar_carrera(respuestas_usuario)
            print(f"La carrera recomendada para el usuario {id_usuario} es: {carrera_recomendada}")
        else:
            print(f"No se encontraron respuestas para el usuario {id_usuario}")
        conexion.close()

if __name__ == "__main__":
    main()
