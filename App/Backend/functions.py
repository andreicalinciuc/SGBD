import json
import cx_Oracle

#Default values
DB_CONFIG = {
"username": "STUDENT",
"password": "STUDENT",
"address": "localhost",
"database": "orcl.local"
}

try:
    with open("db_login_info.json", "rb") as f:
        DB_CONFIG = json.load(f)
except:
    try:
        with open("db_login_info.json", "w") as f:
            f.write(json.dumps(DB_CONFIG, indent=4))
        print("Failed to find db_login_info.json")
    except:
        print("Failed to write db_login_info.json")


_conn = cx_Oracle.connect('{}/{}@{}/{}'.format(
    DB_CONFIG["username"],
    DB_CONFIG["password"],
    DB_CONFIG["address"],
    DB_CONFIG["database"])
    )

_cursor = _conn.cursor()

def get_active_routes():
    return _cursor.callfunc(
        "get_active_routes", _cursor.var(cx_Oracle.OBJECT, typename='int_list')
        ).aslist()

def get_traseu_cursa(id_cursa):
    return _cursor.callfunc(
        "get_traseu_cursa", _cursor.var(cx_Oracle.OBJECT, typename='int_list', arguments=[id_cursa])
        ).aslist()

def get_fastest_ride(node_from, node_to):
    return _cursor.callfunc(
        "get_fastest_ride", _cursor.var(cx_Oracle.OBJECT, typename='int_list', arguments=[node_from, node_to])
        ).aslist()

print get_active_routes()

import atexit
def _atexit(connection):
    connection.close()
atexit.register(_atexit, connection = _conn)