import cx_Oracle

# sql = "select * from curse"
# print list(cursor.execute(sql))
# print cursor.callfunc("get_traseu_cursa", cursor.arrayvar(cx_Oracle.NUMBER, []), 3)

class DB:
    _conn = None
    _cursor = None
    def __init__(self):
        self._conn = cx_Oracle.connect('STUDENT/STUDENT@localhost/xe')
        self._cursor = self._conn.cursor()

    def __del__(self):
        self._conn.close()

    def get_active_routes(self):
        return self._cursor.callfunc(
            "get_active_routes", self._cursor.var(cx_Oracle.OBJECT, typename='int_list')
            ).aslist()

    def get_traseu_cursa(self, cursa_id):
        return self._cursor.callfunc(
            "get_traseu_cursa", self._cursor.var(cx_Oracle.OBJECT, typename='int_list'), [cursa_id]
            ).aslist()