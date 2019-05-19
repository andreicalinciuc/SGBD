-- Procedura AddStation(name, city), DeleteStation(name, city):
--     Pentru adaugarea unei statii in tabela statii.
CREATE OR REPLACE PROCEDURE AddStation(nameStation IN VARCHAR, nameCity IN VARCHAR) AS
    v_id number;
BEGIN
    select count(*) into v_id from STATII;
    if (v_id < 1) then
        INSERT INTO STATII(id, NUME, ADRESA) VALUES (1, nameStation, nameCity);
    else
        INSERT INTO STATII(id, NUME, ADRESA) VALUES ((SELECT max(ID) + 1 from STATII), nameStation, nameCity);
    end if;
END AddStation;


--     Pentru stergerea unei statii din tabela statii si din traseele in care apare, inlocuind automat drumul vechi cu
--     unul direct intre nodurile adiacente.

CREATE OR REPLACE PROCEDURE DeleteStation(id_station IN number)
    IS
    v_statii_from  INT_LIST;
    v_statii_to    INT_LIST;
    v_found_node   INT := 0;
    v_statii_count int := 1;
    cursor c_traseu is
        (select unique ID_TRASEU
         from TRASEE_STATII where ID_STATIE_TO = id_station or ID_STATIE_FROM = id_station);
    cursor c_statii (traseu_id in integer) is
        (select ID_STATIE_FROM, ID_STATIE_TO from TRASEE_STATII where ID_TRASEU = traseu_id);
BEGIN
    for v_traseu in c_traseu
        loop
            for v_drum in c_statii(v_traseu.ID_TRASEU)
                loop
                    if v_drum.ID_STATIE_TO = id_station or v_drum.ID_STATIE_FROM = id_station then
                        if v_found_node = 1 then
                            v_statii_to(v_statii_count) := v_drum.ID_STATIE_TO;
                            v_found_node := 0;
                        else
                            v_statii_from.extend();
                            v_statii_to.extend();
                            v_statii_from(v_statii_count) := v_drum.ID_STATIE_FROM;
                            v_found_node := 1;
                            continue;

                        end if;
                    else
                        v_statii_from.extend();
                        v_statii_to.extend();
                        v_statii_to := v_drum.ID_STATIE_TO;
                        v_statii_from := v_drum.ID_STATIE_FROM;
                    end if;
                    v_statii_count := v_statii_count + 1;

                end loop;
            delete from TRASEE_STATII where ID_TRASEU=v_traseu.ID_TRASEU;
            insert into TRASEE_STATII ()

        end loop;
        for line in 1..v_statii_count
            loop
                 DBMS_OUTPUT.put_line(v_statii_from(line) ||' '||  v_statii_to(line));
            end loop;
END DeleteStation;


select ID_STATIE_FROM, ID_STATIE_TO
from TRASEE_STATII
where ID_TRASEU = 2
order by id;

-- Procedura AddStationToTraseu(traseu, from_station, new_station, to_station):
--     Adauga o statie intre 2 statii ale unui traseu daca exista un drum intre acestea.
-- Procedura AddDriver(driver), RemoveDriver(driver):

CREATE OR REPLACE PROCEDURE AddDriver(nume IN VARCHAR, prenume IN VARCHAR, nrTelefon in VARCHAR, cnp in VARCHAR) AS
    v_id number;
BEGIN
    select count(*) into v_id from SOFERI;
    if (v_id < 1) then
        INSERT INTO SOFERI(id, NUME, PRENUME, NR_TELEFON, CNP) VALUES (1, nume, prenume, nrTelefon, cnp);
    else
        INSERT INTO SOFERI(id, NUME, PRENUME, NR_TELEFON, CNP)
        VALUES ((SELECT max(ID) + 1 from SOFERI), nume, prenume, nrTelefon, cnp);

    end if;
END AddDriver;


--     Sterge sofer.

CREATE OR REPLACE PROCEDURE DeleteDriver(id_driver IN number)
    IS
    v_id int;
BEGIN
    SELECT id into v_id from SOFERI where id = id_driver;

    if v_id = NULL then
        raise NO_DATA_FOUND;
    end if;

    DELETE from CURSE where ID_SOFER = id_driver;

    DELETE
    FROM SOFERI
    WHERE ID = id_driver;
END DeleteDriver;



-- Procedura AddVehicle(vehicle, garage), RemoveVehicle(vehicle, garage), MoveVehicle(vehicle, from_garage, to_garage):
--     Adauga un vehicul intr-un depou. (a se intelege 'cumpara')

CREATE OR REPLACE PROCEDURE AddVehicle(capacitate IN NUMBER, stare IN number, id_depou in number) AS
    v_id number;
BEGIN
    select count(*) into v_id from VEHICULE_DEPOU;
    if (v_id < 1) then
        INSERT INTO VEHICULE_DEPOU(id, capacitate_pasageri, stare, id_depou) VALUES (1, capacitate, stare, id_depou);
    else
        INSERT INTO VEHICULE_DEPOU(id, capacitate_pasageri, stare, id_depou)
        VALUES ((SELECT max(ID) + 1 from VEHICULE_DEPOU), capacitate, stare, id_depou);
    end if;
END AddVehicle;


--     Sterge un vehicul dintr-un depou. (a se intelege 'vinde' sau 'scoatere din functiune')

CREATE OR REPLACE PROCEDURE DeleteVehicle(id_vehicle IN number)
    IS
    v_id number;
BEGIN
    SELECT id into v_id from VEHICULE_DEPOU where id = id_vehicle;

    if v_id = NULL then
        raise NO_DATA_FOUND;
    end if;

    DELETE from VEHICULE_DEPOU where ID = id_vehicle;
END DeleteVehicle;



--     Muta un vehicul dintr-un depou in altul.
CREATE OR REPLACE PROCEDURE MoveVehicle(id_vehicul in number, id_depou in number) AS
    v_id number;
BEGIN

    SELECT id into v_id from VEHICULE_DEPOU where id = id_vehicul;

    if v_id = NULL then
        raise NO_DATA_FOUND;
    end if;

    UPDATE VEHICULE_DEPOU set ID_DEPOU= id_depou where ID = id_vehicul;
END MoveVehicle;



-- Procedura AddTraseu(from_station, to_station), DeleteTraseu(traseu):
--     Adauga un traseu intre doua statii, urmand sa fie adaugate statii dupa nevoie folosind AddStationToTraseu.
--     Sterge un traseu.

CREATE OR REPLACE PROCEDURE AddTraseu(traseu in number, from_station IN NUMBER, to_station IN NUMBER) AS
    v_id number;
BEGIN
    select count(*) into v_id from TRASEE_STATII;
    if (v_id < 1) then
        INSERT INTO TRASEE_STATII(ID, ID_TRASEU, ID_STATIE_FROM, ID_STATIE_TO)
        VALUES ('1', traseu, from_station, to_station);
    else
        INSERT INTO TRASEE_STATII(ID, ID_TRASEU, ID_STATIE_FROM, ID_STATIE_TO)
        VALUES ((SELECT max(ID) + 1 from TRASEE_STATII), traseu, from_station, to_station);
    end if;
END AddTraseu;


-- Procedura StartRide(vehicul,sofer, traseu), FinishRide(vehicul):
--     Adauga o cursa folosind un vehicul, un sofer si un traseu.

CREATE OR REPLACE PROCEDURE StartCursa(vehicul in number, sofer IN NUMBER, traseu IN NUMBER) AS
    v_id number;
BEGIN
    select count(*) into v_id from CURSE;
    if (v_id < 1) then
        INSERT INTO CURSE(id, id_traseu, id_sofer, ID_VEHICUL) VALUES ('1', traseu, sofer, vehicul);

    else
        INSERT INTO CURSE(id, id_traseu, id_sofer, ID_VEHICUL)
        VALUES ((SELECT max(ID) + 1 from CURSE), traseu, sofer, vehicul);
    end if;
    UPDATE VEHICULE_DEPOU set STARE= '1' where id = vehicul;

END StartCursa;


--     Incheie cursa, eliberand vehiculul si soferul.

CREATE OR REPLACE PROCEDURE EndCursa(id_cursa in number) AS
    v_id number;
BEGIN
    SELECT id into v_id from CURSE where id = id_cursa;

    if v_id = NULL then
        raise NO_DATA_FOUND;
    end if;

    DELETE from CURSE where ID = id_cursa;
END EndCursa;


-- Procedura PassangerIn(passanger, cursa):
CREATE OR REPLACE PROCEDURE PassagerIn(id_pasager in number, v_id_cursa in number) AS
    v_id    number;
    v_cursa_curenta number;
    v_cursa number;
BEGIN

    SELECT ID into v_cursa from CURSE where ID = v_id_cursa;
    SELECT ID, ID_CURSA into v_id, v_cursa_curenta from CLIENTI where ID = id_pasager;


    if v_id is NULL or v_cursa is NULL or v_cursa_curenta is not NULL then
        raise NO_DATA_FOUND;
    end if;


    UPDATE CLIENTI set ID_CURSA= v_id_cursa where ID = id_pasager;
END PassagerIn;


--PassengerOut(passanger):

CREATE OR REPLACE PROCEDURE PassagerOut(id_pasager in number) AS
    v_id number;
    v_cursa number;
BEGIN

    SELECT ID, ID_CURSA into v_id, v_cursa from CLIENTI where ID = id_pasager;
    if v_id is NULL or v_cursa is NULL then
        raise NO_DATA_FOUND;
    end if;

    UPDATE CLIENTI set ID_CURSA= NULL where ID = id_pasager;
END PassagerOut;

