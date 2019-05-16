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

CREATE OR REPLACE type int_list is varray(1000) of integer;
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
  nume VARCHAR2(15) NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE trasee_statii(
  id int primary key,
  id_traseu INT NOT NULL,
  id_statie_from INT NOT NULL,
  id_statie_to INT NOT NULL,
  FOREIGN KEY (id_traseu) REFERENCES trasee(id),
  FOREIGN KEY (id_statie_from) REFERENCES statii(id),
  FOREIGN KEY (id_statie_to) REFERENCES statii(id),
  constraint trasee_uniqueness unique (id_traseu, id_statie_from, id_statie_to),
  created_at DATE,
  updated_at DATE 
);
/

CREATE TABLE curse(
  id INT NOT NULL PRIMARY KEY,
  id_traseu int,
  id_soferi int,
  id_vehicul int,
  FOREIGN KEY (id_traseu) REFERENCES trasee(id),
  FOREIGN KEY (id_soferi) REFERENCES soferi(id),
  FOREIGN KEY (id_vehicul) REFERENCES vehicule_depou(id),

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
    id int primary key,
    id_nod_from INT,
    id_nod_to INT,
    cost_muchie INT,
    created_at DATE,
    updated_at DATE,
    constraint costuri_muchii_uniqueness unique (id_nod_from, id_nod_to)
);
/

insert into statii (id, nume, adresa, created_at, updated_at) values (1, 'test1', 'test', sysdate, sysdate);
insert into statii (id, nume, adresa, created_at, updated_at) values (2, 'test2', 'test', sysdate, sysdate);
insert into statii (id, nume, adresa, created_at, updated_at) values (3, 'test3', 'test', sysdate, sysdate);
insert into statii (id, nume, adresa, created_at, updated_at) values (4, 'test4', 'test', sysdate, sysdate);
insert into statii (id, nume, adresa, created_at, updated_at) values (5, 'test5', 'test', sysdate, sysdate);

insert into trasee (id, nume, created_at, updated_at) values (1, 'test1', sysdate, sysdate);
insert into trasee (id, nume, created_at, updated_at) values (2, 'test2', sysdate, sysdate);
insert into trasee (id, nume, created_at, updated_at) values (3, 'test3', sysdate, sysdate);

insert into trasee_statii values (1, 1, 1, 2, sysdate, sysdate);
insert into trasee_statii values (2, 1, 2, 3, sysdate, sysdate);
insert into trasee_statii values (3, 1, 3, 4, sysdate, sysdate);
insert into trasee_statii values (4, 1, 4, 1, sysdate, sysdate);
insert into trasee_statii values (5, 2, 1, 3, sysdate, sysdate);
insert into trasee_statii values (6, 2, 3, 4, sysdate, sysdate);
insert into trasee_statii values (7, 2, 4, 2, sysdate, sysdate);
insert into trasee_statii values (8, 2, 2, 1, sysdate, sysdate);
insert into trasee_statii values (9, 3, 1, 5, sysdate, sysdate);
insert into trasee_statii values (10, 3, 5, 1, sysdate, sysdate);

insert into costuri_muchii values (1, 1, 2, 5, sysdate, sysdate);
insert into costuri_muchii values (2, 1, 3, 5, sysdate, sysdate);
insert into costuri_muchii values (3, 1, 4, 5, sysdate, sysdate);
insert into costuri_muchii values (4, 1, 5, 5, sysdate, sysdate);

insert into costuri_muchii values (5, 2, 1, 5, sysdate, sysdate);
insert into costuri_muchii values (6, 2, 3, 5, sysdate, sysdate);
insert into costuri_muchii values (7, 2, 4, 5, sysdate, sysdate);
insert into costuri_muchii values (8, 2, 5, 5, sysdate, sysdate);

insert into costuri_muchii values (9, 3, 1, 5, sysdate, sysdate);
insert into costuri_muchii values (10, 3, 2, 5, sysdate, sysdate);
insert into costuri_muchii values (11, 3, 4, 5, sysdate, sysdate);
insert into costuri_muchii values (12, 3, 5, 5, sysdate, sysdate);

insert into costuri_muchii values (13, 4, 1, 5, sysdate, sysdate);
insert into costuri_muchii values (14, 4, 2, 5, sysdate, sysdate);
insert into costuri_muchii values (15, 4, 3, 5, sysdate, sysdate);
insert into costuri_muchii values (16, 4, 5, 5, sysdate, sysdate);

insert into costuri_muchii values (17, 5, 1, 5, sysdate, sysdate);
insert into costuri_muchii values (18, 5, 2, 5, sysdate, sysdate);
insert into costuri_muchii values (19, 5, 3, 5, sysdate, sysdate);
insert into costuri_muchii values (20, 5, 4, 5, sysdate, sysdate);

insert into soferi values (1, 'test', 'ptest', 0552, 19852123, sysdate, sysdate);
insert into depou values (1, 'test', 60, sysdate, sysdate);
insert into vehicule_depou values (1, 30, 1, 1, sysdate, sysdate);
insert into curse values (1, 1, 1, sysdate, sysdate);
insert into curse values (2, 3, 1, sysdate, sysdate);
insert into curse values (3, 2, 1, sysdate, sysdate);
insert into curse values (4, 2, 1, sysdate, sysdate);