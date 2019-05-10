DROP TABLE soferi CASCADE CONSTRAINTS;
DROP TABLE clienti CASCADE CONSTRAINTS;
DROP TABLE curse CASCADE CONSTRAINTS;
DROP TABLE depou CASCADE CONSTRAINTS;
DROP TABLE vehicule_depou CASCADE CONSTRAINTS;
DROP TABLE statii CASCADE CONSTRAINTS;
DROP TABLE trasee CASCADE CONSTRAINTS;
DROP TABLE trasee_statii CASCADE CONSTRAINTS;
DROP TABLE costuri_muchii CASCADE CONSTRAINTS;
/

create or replace type int_list is table of integer;
/

create TABLE soferi(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  nr_telefon	NUMBER(10,0) NOT NULL,
  cnp	NUMBER(10,0) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE depou(
  id INT NOT NULL PRIMARY KEY,
  adresa varchar2(50) NOT NULL,
  capacitate NUMBER(3,0) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE vehicule_depou(
  id INT NOT NULL PRIMARY KEY,
  capacitate_pasageri NUMBER(3,0) NOT NULL,
  stare number(1) NOT NULL,
  id_depou int,
  CONSTRAINT fk_depou_veh FOREIGN KEY (id_depou)
    REFERENCES depou (id),
  created_at DATE,
  updated_at DATE       
);
/

CREATE TABLE statii(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  adresa varchar2(50) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE trasee(
  id INT NOT NULL PRIMARY KEY,
  durata number(2,2) NOT NULL,
  nume VARCHAR2(15) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE trasee_statii(
  id_traseu INT NOT NULL PRIMARY KEY,
  id_statie_from INT,
  id_statie_to INT,
  FOREIGN KEY (id_traseu) REFERENCES trasee(id),
  FOREIGN KEY (id_statie_from) REFERENCES statii(id),
  FOREIGN KEY (id_statie_to) REFERENCES statii(id),
  CONSTRAINT no_duplicate_muchii_statii UNIQUE (id_statie_from, id_statie_to),
  created_at DATE,
  updated_at DATE 
);
/

CREATE TABLE curse(
  id INT NOT NULL PRIMARY KEY,
  id_traseu int,
  id_soferi int,
  FOREIGN KEY (id_traseu) REFERENCES trasee(id),
  FOREIGN KEY (id_soferi) REFERENCES soferi(id),
  created_at DATE,
  updated_at DATE 
);
/

create table clienti(
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  fonduri int,
  id_clienti INT NOT NULL PRIMARY KEY,
  nr_telefon	NUMBER(10,0) NOT NULL,
  email VARCHAR2(40),
  cnp NUMBER(10,0) NOT NULL,
  created_at DATE,
  updated_at DATE,
  id_cursa INT,
  FOREIGN KEY (id_cursa) REFERENCES curse (id)
);
/

CREATE TABLE costuri_muchii(
    id_nod_from INT,
    id_nod_to INT,
    cost_muchie INT,
    created_at DATE,
    updated_at DATE,
    primary key (id_nod_from, id_nod_to)
);
/