#!/bin/python3


import mysql.connector
from mysql.connector import Error
 
 
def connect():
    """ Connect to MySQL database """
    try:
        conn = mysql.connector.connect(host='gator3290.hostgator.com',
                                       database='anzlovar_pythons',
                                       user='anzlovar_pythons',
                                       password='Unintelligible123')
        if conn.is_connected():
            print('Connected to MySQL database')
 
    except Error as e:
        print(e)
 
    finally:
        conn.close()
 
 
if __name__ == '__main__':
    connect()