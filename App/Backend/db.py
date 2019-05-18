import cx_Oracle

_conn = cx_Oracle.connect('STUDENT/STUDENT@localhost/xe')
_cursor = _conn.cursor()

def _atexit():
    _conn.close()
    

# sql = "select * from curse"
# print list(cursor.execute(sql))
# print cursor.callfunc("get_traseu_cursa", cursor.arrayvar(cx_Oracle.NUMBER, []), 3)

class DB:
    def __init__(self):
        pass

    def get_active_routes(self):
        return _cursor.callfunc(
            "get_active_routes", _cursor.var(cx_Oracle.OBJECT, typename='int_list')
            ).aslist()

    def get_traseu_cursa(self, cursa_id):
        return _cursor.callfunc(
            "get_traseu_cursa", _cursor.var(cx_Oracle.OBJECT, typename='int_list'), [cursa_id]
            ).aslist()

import atexit
atexit.register(_atexit)