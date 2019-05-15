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
    cursor c_trase is
        (select unique ID_TRASEU
         from TRASEE_STATII
         where ID_STATIE_TO = 2
            or ID_STATIE_FROM = 2);
BEGIN
    for v_line in c_trase
        loop
            dbms_output.put_line(v_line.ID_TRASEU);
        end loop;

    /*   DELETE
       FROM SOFERI
       WHERE ID = id_driver;*/

END DeleteStation;


-- Procedura AddStationToTraseu(traseu, from_station, new_station, to_station):
--     Adauga o statie intre 2 statii ale unui traseu daca exista un drum intre acestea.
-- Procedura AddDriver(driver), RemoveDriver(driver):

CREATE OR REPLACE PROCEDURE AddDriver(nume IN VARCHAR, prenume IN VARCHAR, nrTelefon in number, cnp in number) AS
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
BEGIN
    DELETE from CURSE where ID_SOFERI = id_driver;

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
BEGIN
    DELETE from VEHICULE_DEPOU where ID = id_vehicle;
END DeleteVehicle;



--     Muta un vehicul dintr-un depou in altul.


-- Procedura AddTraseu(from_station, to_station), DeleteTraseu(traseu):
--     Adauga un traseu intre doua statii, urmand sa fie adaugate statii dupa nevoie folosind AddStationToTraseu.
--     Sterge un traseu.

CREATE OR REPLACE PROCEDURE AddTraseu(from_station IN NUMBER, to_station IN NUMBER) AS
    v_id number;
BEGIN
    select count(*) into v_id from TRASEE_STATII;
    if (v_id < 1) then
        INSERT INTO TRASEE_STATII(ID_TRASEU, ID_STATIE_FROM, ID_STATIE_TO) VALUES ('1', from_station, to_station);
    else
        INSERT INTO TRASEE_STATII(ID_TRASEU, ID_STATIE_FROM, ID_STATIE_TO)
        VALUES ((SELECT max(ID_TRASEU) + 1 from TRASEE_STATII), from_station, to_station);
    end if;
END AddTraseu;

BEGIN
    AddTraseu(1, 5);
    dbms_output.put_line('S-a inserat un nou traseu!');
END;

/*select *
from TRASEE_STATII;*/


-- Procedura StartRide(vehicul, sofer, traseu), FinishRide(vehicul):
--     Adauga o cursa folosind un vehicul, un sofer si un traseu.
--     Incheie cursa, eliberand vehiculul si soferul.


-- Procedura PassangerIn(passanger, cursa), PassengerOut(passanger, cursa):
--     Inregistreaza pasagerul cand urca/coboara in/din cursa.

