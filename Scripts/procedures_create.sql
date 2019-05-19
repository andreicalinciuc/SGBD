CREATE OR REPLACE PROCEDURE AddClient(nume IN VARCHAR, prenume IN VARCHAR, telefon in varchar, email in varchar, cnp in varchar) AS
    v_id number;
BEGIN
    select count(*) into v_id from clienti;
    if (v_id < 1) then
        INSERT INTO clienti (ID, NUME, PRENUME, FONDURI, NR_TELEFON, EMAIL, CNP, CREATED_AT, UPDATED_AT)
        VALUES (1, nume, prenume, 0, telefon, email, cnp, sysdate, sysdate);
    else
        INSERT INTO clienti (ID, NUME, PRENUME, FONDURI, NR_TELEFON, EMAIL, CNP, CREATED_AT, UPDATED_AT)
        VALUES ((SELECT max(ID) + 1 from clienti), nume, prenume, 0, telefon, email, cnp, sysdate, sysdate);
    end if;
END AddClient;

CREATE OR REPLACE PROCEDURE StartCursa(id_vehicul IN int, id_sofer IN int, id_traseu in int) AS
    v_id number;
BEGIN
    select count(*) into v_id from curse;
    if (v_id < 1) then
        INSERT INTO curse (ID, ID_TRASEU, ID_SOFER, ID_VEHICUL, CREATED_AT, UPDATED_AT)
        VALUES (1, id_traseu, id_sofer, id_vehicul, sysdate, sysdate);
    else
        INSERT INTO curse (ID, ID_TRASEU, ID_SOFER, ID_VEHICUL, CREATED_AT, UPDATED_AT)
        VALUES ((SELECT max(ID) + 1 from curse), id_traseu, id_sofer, id_vehicul, sysdate, sysdate);
    end if;
END StartCursa;

CREATE OR REPLACE PROCEDURE AddDepou(adresa IN VARCHAR, capacitate IN int) AS
    v_id number;
BEGIN
    select count(*) into v_id from depou;
    if (v_id < 1) then
        INSERT INTO depou (ID, ADRESA, CAPACITATE, CREATED_AT, UPDATED_AT)
        VALUES (1, adresa, capacitate, sysdate, sysdate);
    else
        INSERT INTO depou
        VALUES ((SELECT max(ID) + 1 from depou), adresa, capacitate, sysdate, sysdate);
    end if;
END AddDepou;

CREATE OR REPLACE PROCEDURE AddSofer(nume in varchar, prenume in varchar, telefon in varchar, cnp in varchar) AS
    v_id number;
BEGIN
    select count(*) into v_id from soferi;
    if (v_id < 1) then
        INSERT INTO soferi (ID, NUME, PRENUME, NR_TELEFON, CNP, CREATED_AT, UPDATED_AT)
        VALUES (1, nume, prenume, telefon, cnp, sysdate, sysdate);
    else
        INSERT INTO soferi (ID, NUME, PRENUME, NR_TELEFON, CNP, CREATED_AT, UPDATED_AT)
        VALUES ((SELECT max(ID) + 1 from soferi), nume, prenume, telefon, cnp, sysdate, sysdate);
    end if;
END AddSofer;

CREATE OR REPLACE PROCEDURE AddStatie(nume IN VARCHAR, adresa IN VARCHAR) AS
    v_id number;
BEGIN
    select count(*) into v_id from statii;
    if (v_id < 1) then
        INSERT INTO statii (ID, NUME, ADRESA, CREATED_AT, UPDATED_AT)
        VALUES (1, nume, adresa, sysdate, sysdate);
    else
        INSERT INTO statii (ID, NUME, ADRESA, CREATED_AT, UPDATED_AT)
        VALUES ((SELECT max(ID) + 1 from statii), nume, adresa, sysdate, sysdate);
    end if;
END AddStatie;

-- CREATE OR REPLACE PROCEDURE AddTraseu(nume in varchar, node_from in int, node_to in int) AS -- Original idea
CREATE OR REPLACE PROCEDURE AddTraseu(nume in varchar) AS
    v_id number;
BEGIN
    select count(*) into v_id from trasee;
    if (v_id < 1) then
        INSERT INTO trasee (ID, NUME, CREATED_AT, UPDATED_AT)
        VALUES (1, nume, sysdate, sysdate);
    else
        INSERT INTO trasee (ID, NUME, CREATED_AT, UPDATED_AT)
        VALUES ((SELECT max(ID) + 1 from trasee), nume, sysdate, sysdate);
    end if;
END AddTraseu;

CREATE OR REPLACE PROCEDURE AddVehicul(capacitate in int, stare in varchar, id_depou in int) AS
    v_id number;
BEGIN
    select count(*) into v_id from VEHICULE_DEPOU;
    if (v_id < 1) then
        INSERT INTO VEHICULE_DEPOU (ID, CAPACITATE_PASAGERI, STARE, ID_DEPOU, CREATED_AT, UPDATED_AT)
        VALUES (1, capacitate, stare, id_depou, sysdate, sysdate);
    else
        INSERT INTO VEHICULE_DEPOU
        VALUES ((SELECT max(ID) + 1 from VEHICULE_DEPOU), capacitate, stare, id_depou, sysdate, sysdate);
    end if;
END AddVehicul;

