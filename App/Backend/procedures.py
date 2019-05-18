import cx_Oracle

_conn = cx_Oracle.connect('STUDENT/STUDENT@localhost/orcl.local')
_cursor = _conn.cursor()

available_procedures = [
    "AddStation",
    "DeleteStation",
    "AddDriver",
    "DeleteDriver",
    "AddVehicle",
    "DeleteVehicle",
    "MoveVehicle",
    "AddTraseu",
    "AddCursa",
    "EndCursa",
    "PassagerIn",
    "PassagerOut"
]

def ExecuteProcedure(procedure, args_list):
    if procedure in available_procedures:
        try:
            _cursor.callproc(procedure, args_list)
            _cursor.execute("commit")
        except Exception, e:
            print("Error encountered while executing procedure '{}':\n{}".format(procedure, e))
            return False
        return True
    print("Procedure '{}' is not in the 'available procedures' list.".format(procedure))
    return False

ExecuteProcedure("AddDriver", ["test", "test", "0737555666", "1983234456652"])

import atexit
def _atexit(connection):
    connection.close()
atexit.register(_atexit, _conn)