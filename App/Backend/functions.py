import cx_Oracle

_conn = cx_Oracle.connect('STUDENT/STUDENT@localhost/xe')
_cursor = _conn.cursor()

def get_active_routes():
    return _cursor.callfunc(
        "get_active_routes", _cursor.var(cx_Oracle.OBJECT, typename='int_list')
        ).aslist()

def get_traseu_cursa():
    return _cursor.callfunc(
        "get_traseu_cursa", _cursor.var(cx_Oracle.OBJECT, typename='int_list')
        ).aslist()

def get_fastest_ride():
    return _cursor.callfunc(
        "get_fastest_ride", _cursor.var(cx_Oracle.OBJECT, typename='int_list')
        ).aslist()

import atexit
def _atexit():
    _conn.close()
atexit.register(_atexit)