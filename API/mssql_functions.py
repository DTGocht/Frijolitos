import pymssql
import datetime


def conectarse_a_sql():
    try:
        connection = pymssql.connect(
            server='10.14.255.84',
            user='SA',
            password='Shakira123.',
            database='pruebas',
            as_dict=True)
        return connection
    except Exception as e:
        print(f"Error al conectar a SQL Server {e}")
        return None


conn = conectarse_a_sql()


def obtener_recolectores():
    try:
        cursor = conn.cursor()
        cursor.execute(
            "SELECT ID_RECOLECTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO FROM RECOLECTORES")
        recolectores = cursor.fetchall()
        return recolectores
    except Exception as e:
        print(f"Error al obtener recolectores {e}")

    conn.close()


def obtener_recibos_recolector(id_recolector):
    try:
        cursor = conn.cursor()
        cursor.execute(
            "SELECT BP.ID_BITACORA BITACORA, \
            D.NOMBRE DONANTE_NOMBRE, \
            D.APELLIDO_PATERNO DONANTE_APELLIDOP, \
            D.APELLIDO_MATERNO DONANTE_APELLIDOM, \
            D.DIRECCION DONANTE_DIR, \
            D.COLONIA DONANTE_COL, \
            D.MUNICIPIO DONANTE_MUN, \
            D.CP DONANTE_CP,\
            D.TEL_MOVIL DONANTE_TELMOV,\
            D.TEL_CASA DONANTE_TELCASA,\
            BP.IMPORTE IMPORTE,\
            BP.ESTATUS ESTATUS \
            FROM DONANTES D \
            LEFT JOIN DONATIVOS_DONANTE DON ON DON.ID_DONANTE = D.ID_DONANTE \
            LEFT JOIN BITACORA_PAGOS BP ON BP.ID_DONATIVO = DON.ID_DONATIVO \
            WHERE BP.ID_RECOLECTOR = %d", id_recolector)
        recibos = cursor.fetchall()
        return recibos
    except Exception as e:
        print(f"Error al obtener recibos {e}")


def actualizar_recibo(id_bitacora, id_recolector, fecha_pago, estatus,
                      fecha_reprogramacion, usuario_cancelacion, comentarios):
    # Convierte la fecha a un objeto datetime
    fecha_date_pago = datetime.datetime.strptime(fecha_pago, '%d/%m/%Y')
    fecha_date_pago = fecha_date_pago.strftime('%Y-%m-%d')

    fecha_date_reprogramacion = datetime.datetime.strptime(
        fecha_reprogramacion, '%d/%m/%Y')
    fecha_date_reprogramacion = fecha_date_reprogramacion.strftime('%Y-%m-%d')
    print(type(fecha_date_pago))

    # cursor.execute("UPDATE users SET username = ?, email = ?, PasswordHash = HASHBYTES('SHA2_256',?) WHERE UserID = ?", (username, email, passwd, userID))
    try:
        cursor = conn.cursor()
        consulta = "UPDATE BITACORA_PAGOS \
            SET FECHA_PAGO = %s, \
            ESTATUS = %s, \
            FECHA_REPROGRAMACION = %s, \
            USUARIO_CANCELACION = %s, \
            COMENTARIOS = %s  \
            WHERE ID_BITACORA = %s AND ID_RECOLECTOR = %s"
        cursor.execute(consulta,
                       (fecha_date_pago, estatus, fecha_date_reprogramacion,
                        usuario_cancelacion, comentarios, id_bitacora,
                        id_recolector))
        return True
    except Exception as e:
        print(f"Error al actualizar recibo {e}")
        return False

    conn.commit()

    cursor.close()
    conn.close()


usuarios = obtener_recolectores()
print(usuarios)
recibos = obtener_recibos_recolector(1)
print(recibos)
bitacora = actualizar_recibo(1, 1, '01/01/2020', 'No Cobrado', '01/01/2020', 1, "Comentarios")
print(bitacora)
