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

create or replace type int_list is varray(1000) of integer;
/

create TABLE soferi(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(50) NOT NULL,
  prenume VARCHAR2(50) NOT NULL,
  nr_telefon	VARCHAR2(10) NOT NULL,
  cnp	VARCHAR2(13) unique NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE depou(
  id INT NOT NULL PRIMARY KEY,
  adresa varchar2(50) unique NOT NULL,
  capacitate int NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE vehicule_depou(
  id INT NOT NULL PRIMARY KEY,
  capacitate_pasageri int NOT NULL,
  stare number(1) NOT NULL,
  id_depou int,
  foreign key (id_depou) references depou(id),
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE statii(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(25) unique NOT NULL,
  adresa varchar2(50) unique NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE trasee(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(25) unique NOT NULL,
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE trasee_statii(
  id int primary key,
  id_traseu INT NOT NULL,
  id_statie_from INT NOT NULL,
  id_statie_to INT NOT NULL,
  foreign key (id_traseu) REFERENCES trasee(id),
  foreign key (id_statie_from) REFERENCES statii(id),
  foreign key (id_statie_to) REFERENCES statii(id),
  constraint trasee_uniqueness unique (id_traseu, id_statie_from, id_statie_to),
  created_at DATE,
  updated_at DATE
);
/

CREATE TABLE curse(
  id int not null primary key,
  id_traseu int not null,
  id_sofer int unique not null,
  id_vehicul int unique not null,
  foreign key (id_traseu) references trasee(id),
  foreign key (id_sofer) references soferi(id),
  foreign key (id_vehicul) references vehicule_depou(id),
  created_at DATE,
  updated_at DATE
);
/

create table clienti(
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(50) NOT NULL,
  prenume VARCHAR2(50) NOT NULL,
  fonduri int NOT NULL,
  nr_telefon	VARCHAR2(10) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  cnp VARCHAR2(13) unique NOT NULL,
  id_cursa int,
  foreign key (id_cursa) references curse(id),
  created_at DATE,
  updated_at DATE
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



/*

insert into depou values (1, 'test', 60, sysdate, sysdate);

insert into vehicule_depou values (4, 30, 1, 1, sysdate, sysdate);

insert into curse values (4, 2, 4, 4, sysdate, sysdate);

insert into clienti values (4, 'test', 'ptest', 0, '0737853905', 'raduradu55@gmail.com', '1980512553454', NULL, sysdate, sysdate);
*/
