DROP TABLE soferi CASCADE CONSTRAINTS;
DROP TABLE clienti CASCADE CONSTRAINTS;
DROP TABLE curse CASCADE CONSTRAINTS;
DROP TABLE depou CASCADE CONSTRAINTS;
DROP TABLE vehicule_depou CASCADE CONSTRAINTS;
DROP TABLE statii CASCADE CONSTRAINTS;
DROP TABLE trasee CASCADE CONSTRAINTS;
DROP TABLE trasee_statii CASCADE CONSTRAINTS;



/

create TABLE soferi(
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  nr_telefon	NUMBER(10,0) NOT NULL,
  id_sofer INT NOT NULL PRIMARY KEY,
  cnp	NUMBER(10,0) NOT NULL,
  created_at DATE,
  updated_at DATE

);
/

create table clienti(
  nume VARCHAR2(50) NOT NULL,
  prenume VARCHAR2(50) NOT NULL,
  fonduri int,
  id_clienti INT NOT NULL PRIMARY KEY,
  nr_telefon int NOT NULL,
  email VARCHAR2(40),
  cnp int NOT NULL,
  created_at DATE,
  updated_at DATE
);

/
CREATE TABLE depou(
   adresa varchar2(50) NOT NULL,
   id_depou INT NOT NULL PRIMARY KEY,
   capacitate NUMBER(3,0) NOT NULL,
  created_at DATE,
  updated_at DATE
);

/

CREATE TABLE vehicule_depou(
   id_vehicule_depou INT NOT NULL PRIMARY KEY,
   capacitate_pasageri NUMBER(3,0) NOT NULL,
   stare number(1) NOT NULL,
  created_at DATE,
  updated_at DATE       
);

/
CREATE TABLE statii(
  id_statii INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  adresa varchar2(50) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/
CREATE TABLE trasee(
  id_trasee INT NOT NULL PRIMARY KEY,
  durata number(2,2) NOT NULL,
  nume VARCHAR2(15) NOT NULL,
  created_at DATE,
  updated_at DATE
);


/
CREATE TABLE trasee_statii(
    ID_statii INT NOT NULL PRIMARY KEY,
    id_traseu INT,
    id_statie_from INT,
    id_statie_to INT,
    FOREIGN KEY (id_traseu) REFERENCES trasee(id_trasee),
    FOREIGN KEY (id_statie_from) REFERENCES statii(id_statii),
    FOREIGN KEY (id_statie_to) REFERENCES statii(id_statii),
    CONSTRAINT no_duplicates UNIQUE (id_statie_from, id_statie_to),

    created_at DATE,
    updated_at DATE 

);
/
CREATE TABLE curse(
ID_curse INT NOT NULL PRIMARY KEY,
id_traseu int,
id_soferi int,
 FOREIGN KEY (id_traseu) REFERENCES trasee(id_trasee),
  FOREIGN KEY (id_soferi) REFERENCES soferi(id_sofer),
 created_at DATE,
 updated_at DATE 
);
/