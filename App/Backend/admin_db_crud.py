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

class Client:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    @staticmethod
    def Add(nume, prenume, nr_telefon, email, cnp):
        pass # Use add client procedure
    
    def Delete(self):
        pass # Use delete client procedure

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    def BoardVehicle(self, cursa_id):
        if not self.IsInVehicle:
            pass # Use board vehicle procedure
        else:
            raise Exception("Already in vehicle")

    def UnboardVehicle(self):
        if self.IsInVehicle:
            pass # Use board vehicle procedure
        else:
            raise Exception("Not in a vehicle")

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri

class Sofer:
    _id = None
    nume = None
    prenume = None
    nr_telefon = None
    cnp = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.nr_telefon, self.cnp, self.created_at, self.updated_at = result_set

    @property
    def IsDriving(self):
        _cursor.execute("select * from curse where id_sofer = {}".format(self._id))
        return bool(_cursor.fetchone())

class Vehicul:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri

class Traseu:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri

class Statie:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri

class Depou:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri

class Cursa:
    _id = None
    nume = None
    prenume = None
    fonduri = None
    nr_telefon = None
    email = None
    cnp = None
    id_cursa = None
    created_at = None
    updated_at = None

    result_set = None

    def __init__(self, _id):
        if type(_id) is not int:
            raise ValueError("_id should be an int")
        _cursor.execute("select * from clienti where id = {}".format(_id))
        result_set = _cursor.fetchone()
        self._id, self.nume, self.prenume, self.fonduri, self.nr_telefon, self.email, self.cnp, self.id_cursa, self.created_at, self.updated_at = result_set

    @property
    def IsInVehicle(self):
        return bool(self.id_cursa)

    @property
    def Funds(self):
        return self.fonduri


import atexit
def _atexit(connection):
    connection.close()
atexit.register(_atexit, connection = _conn)