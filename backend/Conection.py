# import mysql.connector
# conexion  = mysql.connector.connect(user='root',password='22333686',
#                                     host='localhost',
#                                     database='easypark',
#                                     port='3306')
# cursor = conexion.cursor()
# cursor.execute("SELECT * FROM cliente")
# r = cursor.fetchall()




# # Rellenen los campos de datos en relacion a su servidor
import pymysql

class Database:
    def __init__(self):
        self.connection = pymysql.connect(
            user='root',
            password='22333686',
            host='localhost',
            database='easypark'
        )
        
        self.cursor = self.connection.cursor()
        print('conexion exitosa')


database = Database()