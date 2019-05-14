import cx_Oracle

conn = cx_Oracle.connect('STUDENT/STUDENT@localhost/orcl.local')

cursor = conn.cursor()
# sql = "select * from curse"
# print list(cursor.execute(sql))
print cursor.callfunc("get_active_routes", cursor.arrayvar(cx_Oracle.NUMBER, []))
# print cursor.callfunc("get_traseu_cursa", cursor.arrayvar(cx_Oracle.NUMBER, []), 3)
conn.close()
