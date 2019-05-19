DECLARE
    TYPE varr IS VARRAY (1000) OF varchar2(255);
    lista_nume           varr     := varr('Ababei', 'Acasandrei', 'Adascalitei', 'Afanasie', 'Agafitei', 'Agape',
                                          'Aioanei',
                                          'Alexandrescu', 'Alexandru', 'Alexe', 'Alexii', 'Amarghioalei', 'Ambroci',
                                          'Andonesei', 'Andrei', 'Andrian', 'Andrici', 'Andronic', 'Andros',
                                          'Anghelina',
                                          'Anita', 'Antochi', 'Antonie', 'Apetrei', 'Apostol', 'Arhip', 'Arhire',
                                          'Arteni',
                                          'Arvinte', 'Asaftei', 'Asofiei', 'Aungurenci', 'Avadanei', 'Avram', 'Babei',
                                          'Baciu', 'Baetu', 'Balan', 'Balica', 'Banu', 'Barbieru', 'Barzu', 'Bazgan',
                                          'Bejan', 'Bejenaru', 'Belcescu', 'Belciuganu', 'Benchea', 'Bilan', 'Birsanu',
                                          'Bivol', 'Bizu', 'Boca', 'Bodnar', 'Boistean', 'Borcan', 'Bordeianu',
                                          'Botezatu',
                                          'Bradea', 'Braescu', 'Budaca', 'Bulai', 'Bulbuc-aioanei', 'Burlacu',
                                          'Burloiu',
                                          'Bursuc', 'Butacu', 'Bute', 'Buza', 'Calancea', 'Calinescu', 'Capusneanu',
                                          'Caraiman', 'Carbune', 'Carp', 'Catana', 'Catiru', 'Catonoiu', 'Cazacu',
                                          'Cazamir', 'Cebere', 'Cehan', 'Cernescu', 'Chelaru', 'Chelmu', 'Chelmus',
                                          'Chibici', 'Chicos', 'Chilaboc', 'Chile', 'Chiriac', 'Chirila', 'Chistol',
                                          'Chitic', 'Chmilevski', 'Cimpoesu', 'Ciobanu', 'Ciobotaru', 'Ciocoiu',
                                          'Ciofu',
                                          'Ciornei', 'Citea', 'Ciucanu', 'Clatinici', 'Clim', 'Cobuz', 'Coca',
                                          'Cojocariu',
                                          'Cojocaru', 'Condurache', 'Corciu', 'Corduneanu', 'Corfu', 'Corneanu',
                                          'Corodescu', 'Coseru', 'Cosnita', 'Costan', 'Covatariu', 'Cozma', 'Cozmiuc',
                                          'Craciunas', 'Crainiceanu', 'Creanga', 'Cretu', 'Cristea', 'Crucerescu',
                                          'Cumpata', 'Curca', 'Cusmuliuc', 'Damian', 'Damoc', 'Daneliuc', 'Daniel',
                                          'Danila', 'Darie', 'Dascalescu', 'Dascalu', 'Diaconu', 'Dima', 'Dimache',
                                          'Dinu',
                                          'Dobos', 'Dochitei', 'Dochitoiu', 'Dodan', 'Dogaru', 'Domnaru', 'Dorneanu',
                                          'Dragan', 'Dragoman', 'Dragomir', 'Dragomirescu', 'Duceac', 'Dudau', 'Durnea',
                                          'Edu', 'Eduard', 'Eusebiu', 'Fedeles', 'Ferestraoaru', 'Filibiu', 'Filimon',
                                          'Filip', 'Florescu', 'Folvaiter', 'Frumosu', 'Frunza', 'Galatanu',
                                          'Gavrilita',
                                          'Gavriliuc', 'Gavrilovici', 'Gherase', 'Gherca', 'Ghergu', 'Gherman',
                                          'Ghibirdic',
                                          'Giosanu', 'Gitlan', 'Giurgila', 'Glodeanu', 'Goldan', 'Gorgan', 'Grama',
                                          'Grigore', 'Grigoriu', 'Grosu', 'Grozavu', 'Gurau', 'Haba', 'Harabula',
                                          'Hardon',
                                          'Harpa', 'Herdes', 'Herscovici', 'Hociung', 'Hodoreanu', 'Hostiuc', 'Huma',
                                          'Hutanu', 'Huzum', 'Iacob', 'Iacobuta', 'Iancu', 'Ichim', 'Iftimesei', 'Ilie',
                                          'Insuratelu', 'Ionesei', 'Ionesi', 'Ionita', 'Iordache', 'Iordache-tiroiu',
                                          'Iordan', 'Iosub', 'Iovu', 'Irimia', 'Ivascu', 'Jecu', 'Jitariuc', 'Jitca',
                                          'Joldescu', 'Juravle', 'Larion', 'Lates', 'Latu', 'Lazar', 'Leleu', 'Leon',
                                          'Leonte', 'Leuciuc', 'Leustean', 'Luca', 'Lucaci', 'Lucasi', 'Luncasu',
                                          'Lungeanu', 'Lungu', 'Lupascu', 'Lupu', 'Macariu', 'Macoveschi', 'Maftei',
                                          'Maganu', 'Mangalagiu', 'Manolache', 'Manole', 'Marcu', 'Marinov', 'Martinas',
                                          'Marton', 'Mataca', 'Matcovici', 'Matei', 'Maties', 'Matrana', 'Maxim',
                                          'Mazareanu', 'Mazilu', 'Mazur', 'Melniciuc-puica', 'Micu', 'Mihaela', 'Mihai',
                                          'Mihaila', 'Mihailescu', 'Mihalachi', 'Mihalcea', 'Mihociu', 'Milut', 'Minea',
                                          'Minghel', 'Minuti', 'Miron', 'Mitan', 'Moisa', 'Moniry-abyaneh', 'Morarescu',
                                          'Morosanu', 'Moscu', 'Motrescu', 'Motroi', 'Munteanu', 'Murarasu', 'Musca',
                                          'Mutescu', 'Nastaca', 'Nechita', 'Neghina', 'Negrus', 'Negruser', 'Negrutu',
                                          'Nemtoc', 'Netedu', 'Nica', 'Nicu', 'Oana', 'Olanuta', 'Olarasu', 'Olariu',
                                          'Olaru', 'Onu', 'Opariuc', 'Oprea', 'Ostafe', 'Otrocol', 'Palihovici',
                                          'Pantiru',
                                          'Pantiruc', 'Paparuz', 'Pascaru', 'Patachi', 'Patras', 'Patriche', 'Perciun',
                                          'Perju', 'Petcu', 'Pila', 'Pintilie', 'Piriu', 'Platon', 'Plugariu', 'Podaru',
                                          'Poenariu', 'Pojar', 'Popa', 'Popescu', 'Popovici', 'Poputoaia', 'Postolache',
                                          'Predoaia', 'Prisecaru', 'Procop', 'Prodan', 'Puiu', 'Purice', 'Rachieru',
                                          'Razvan', 'Reut', 'Riscanu', 'Riza', 'Robu', 'Roman', 'Romanescu', 'Romaniuc',
                                          'Rosca', 'Rusu', 'Samson', 'Sandu', 'Sandulache', 'Sava', 'Savescu',
                                          'Schifirnet',
                                          'Scortanu', 'Scurtu', 'Sfarghiu', 'Silitra', 'Simiganoschi', 'Simion',
                                          'Simionescu', 'Simionesei', 'Simon', 'Sitaru', 'Sleghel', 'Sofian', 'Soficu',
                                          'Sparhat', 'Spiridon', 'Stan', 'Stavarache', 'Stefan', 'Stefanita',
                                          'Stingaciu',
                                          'Stiufliuc', 'Stoian', 'Stoica', 'Stoleru', 'Stolniceanu', 'Stolnicu',
                                          'Strainu',
                                          'Strimtu', 'Suhani', 'Tabusca', 'Talif', 'Tanasa', 'Teclici', 'Teodorescu',
                                          'Tesu', 'Tifrea', 'Timofte', 'Tincu', 'Tirpescu', 'Toader', 'Tofan', 'Toma',
                                          'Toncu', 'Trifan', 'Tudosa', 'Tudose', 'Tuduri', 'Tuiu', 'Turcu', 'Ulinici',
                                          'Unghianu', 'Ungureanu', 'Ursache', 'Ursachi', 'Urse', 'Ursu', 'Varlan',
                                          'Varteniuc', 'Varvaroi', 'Vasilache', 'Vasiliu', 'Ventaniuc', 'Vicol',
                                          'Vidru',
                                          'Vinatoru', 'Vlad', 'Voaides', 'Vrabie', 'Vulpescu', 'Zamosteanu', 'Zazuleac');
    lista_prenume_fete   varr     := varr('Adina', 'Alexandra', 'Alina', 'Ana', 'Anca', 'Anda', 'Andra', 'Andreea',
                                          'Andreia', 'Antonia', 'Bianca', 'Camelia', 'Claudia', 'Codrina', 'Cristina',
                                          'Daniela', 'Daria', 'Delia', 'Denisa', 'Diana', 'Ecaterina', 'Elena',
                                          'Eleonora',
                                          'Elisa', 'Ema', 'Emanuela', 'Emma', 'Gabriela', 'Georgiana', 'Ileana',
                                          'Ilona',
                                          'Ioana', 'Iolanda', 'Irina', 'Iulia', 'Iuliana', 'Larisa', 'Laura',
                                          'Loredana',
                                          'Madalina', 'Malina', 'Manuela', 'Maria', 'Mihaela', 'Mirela', 'Monica',
                                          'Oana',
                                          'Paula', 'Petruta', 'Raluca', 'Sabina', 'Sanziana', 'Simina', 'Simona',
                                          'Stefana',
                                          'Stefania', 'Tamara', 'Teodora', 'Theodora', 'Vasilica', 'Xena');
    lista_prenume_baieti varr     := varr('Adrian', 'Alex', 'Alexandru', 'Alin', 'Andreas', 'Andrei', 'Aurelian',
                                          'Beniamin', 'Bogdan', 'Camil', 'Catalin', 'Cezar', 'Ciprian', 'Claudiu',
                                          'Codrin',
                                          'Constantin', 'Corneliu', 'Cosmin', 'Costel', 'Cristian', 'Damian', 'Dan',
                                          'Daniel', 'Danut', 'Darius', 'Denise', 'Dimitrie', 'Dorian', 'Dorin',
                                          'Dragos',
                                          'Dumitru', 'Eduard', 'Elvis', 'Emil', 'Ervin', 'Eugen', 'Eusebiu', 'Fabian',
                                          'Filip', 'Florian', 'Florin', 'Gabriel', 'George', 'Gheorghe', 'Giani',
                                          'Giulio',
                                          'Iaroslav', 'Ilie', 'Ioan', 'Ion', 'Ionel', 'Ionut', 'Iosif', 'Irinel',
                                          'Iulian',
                                          'Iustin', 'Laurentiu', 'Liviu', 'Lucian', 'Marian', 'Marius', 'Matei',
                                          'Mihai',
                                          'Mihail', 'Nicolae', 'Nicu', 'Nicusor', 'Octavian', 'Ovidiu', 'Paul', 'Petru',
                                          'Petrut', 'Radu', 'Rares', 'Razvan', 'Richard', 'Robert', 'Roland', 'Rolland',
                                          'Romanescu', 'Sabin', 'Samuel', 'Sebastian', 'Sergiu', 'Silviu', 'Stefan',
                                          'Teodor', 'Teofil', 'Theodor', 'Tudor', 'Vadim', 'Valentin', 'Valeriu',
                                          'Vasile',
                                          'Victor', 'Vlad', 'Vladimir', 'Vladut');
    v_nume               VARCHAR2(255);
    v_prenume            VARCHAR2(255);
    v_prenume1           VARCHAR2(255);
    v_prenume2           varchar2(255);
    v_fonduri            int;
    v_nr_telefon         int;
    v_email              varchar2(255);
    v_cnp                int;
    id_cursa             int;
    v_adresa             varchar2(255);
    lista_statii         INT_LIST := INT_LIST();
    v_count              int;
    v_temp               int;
    lista_soferi         INT_LIST := INT_LIST();
    lista_vehicule       INT_LIST := INT_LIST();
    v_id                 int;
begin
    lista_statii.extend(1000);
    --inserare statii
    FOR v_i IN 1..10000


        LOOP
            v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0, lista_nume.count)) + 1);
            IF (DBMS_RANDOM.VALUE(0, 100) < 50) THEN
                v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            ELSE
                v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            END IF;

            IF (DBMS_RANDOM.VALUE(0, 100) < 60) THEN
                IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
                    v_adresa := v_prenume1 || ' ' || v_prenume2 || ' ' || v_i;
                END IF;
            else
                v_adresa := v_prenume1 || ' ' || v_i;
            END IF;

            v_nume := v_nume || ' ' || v_i;
            insert into STATII values (v_i, v_nume, v_adresa, sysdate, sysdate);

        END LOOP;

--inserare soferi
    FOR v_i IN 1..10000
        LOOP
            v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0, lista_nume.count)) + 1);
            IF (DBMS_RANDOM.VALUE(0, 100) < 50) THEN
                v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            ELSE
                v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            END IF;

            IF (DBMS_RANDOM.VALUE(0, 100) < 60) THEN
                IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
                    v_prenume := v_prenume1 || ' ' || v_prenume2;
                END IF;
            else
                v_prenume := v_prenume1;
            END IF;

            iF (DBMS_RANDOM.VALUE(0, 100) < 25) THEN
                v_cnp := 1 * 1000000000 + v_i;
            else
                v_cnp := 2 * 1000000000 + v_i * 5431;
            END IF;


            v_nr_telefon := DBMS_RANDOM.VALUE(700000000, 799999999);

            insert into soferi values (v_i, v_nume, v_prenume, v_nr_telefon, v_cnp, sysdate, sysdate);

        END LOOP;

--trasee
    FOR v_i IN 1..1000
        LOOP
            v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0, lista_nume.count)) + 1);
            IF (DBMS_RANDOM.VALUE(0, 100) < 50) THEN
                v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            ELSE
                v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            END IF;


            v_nume := v_nume || ' ' || v_i;
            insert into TRASEE values (v_i, v_nume, sysdate, sysdate);

        END LOOP;


--trasee statii
    v_count := 1;
    FOR v_c in 1..1000

        loop
            lista_statii(1) := DBMS_RANDOM.VALUE(1, 10000);
            for v_i in 2..30
                loop
                    lista_statii(v_i) := DBMS_RANDOM.VALUE(1, 10000);
                    while lista_statii(v_i - 1) = lista_statii(v_i) or lista_statii(v_i) = lista_statii(1)
                        loop
                            lista_statii(v_i) := DBMS_RANDOM.VALUE(1, 10000);
                        end loop;
                end loop;
            lista_statii(31) := lista_statii(1);


            for v_nod in 2..31
                loop
                    insert into TRASEE_STATII(id, id_traseu, id_statie_from, id_statie_to, created_at, updated_at)
                    values (v_count, v_c, lista_statii(v_nod - 1), lista_statii(v_nod), sysdate, sysdate);
                    begin
                        select id into v_temp
                        from COSTURI_MUCHII
                        where ID_NOD_FROM = lista_statii(v_nod - 1)
                          and ID_NOD_TO = lista_statii(v_nod);
                    exception
                        when others then
                            insert into COSTURI_MUCHII(id, id_nod_from, id_nod_to, cost_muchie, created_at, updated_at)
                            values (v_count, lista_statii(v_nod - 1), lista_statii(v_nod), DBMS_RANDOM.VALUE(1, 100),
                                    sysdate, sysdate);
                    end;

                    v_count := v_count + 1;

                end loop;


        END LOOP;

--depou

    FOR v_i IN 1..100


        LOOP
            v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0, lista_nume.count)) + 1);
            IF (DBMS_RANDOM.VALUE(0, 100) < 50) THEN
                v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            ELSE
                v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            END IF;

            IF (DBMS_RANDOM.VALUE(0, 100) < 60) THEN
                IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
                    v_adresa := v_prenume1 || ' ' || v_prenume2 || ' ' || v_i;
                END IF;
            else
                v_adresa := v_prenume1 || ' ' || v_i;
            END IF;

            insert into DEPOU(id, adresa, capacitate, created_at, updated_at)
            values (v_i, v_adresa, DBMS_RANDOM.VALUE(1, 50), sysdate, sysdate);

        END LOOP;

--vehicule depou

    FOR v_i IN 1..12000
        LOOP
            insert into VEHICULE_DEPOU(id, capacitate_pasageri, stare, id_depou, created_at, updated_at)
            values (v_i, DBMS_RANDOM.VALUE(1, 50), 'functional', DBMS_RANDOM.VALUE(1, 100), sysdate, sysdate);
        END LOOP;
    --curse

      v_count :=1;
      FOR v_i IN 1..5000
          LOOP
              insert into CURSE(id, id_traseu, id_sofer, id_vehicul, created_at, updated_at)
              values (v_i, DBMS_RANDOM.VALUE(1, 1000),v_i, v_i, sysdate, sysdate);
          END LOOP;

--clienti
 for v_i in 1..100000
        LOOP
            v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0, lista_nume.count)) + 1);
            IF (DBMS_RANDOM.VALUE(0, 100) < 50) THEN
                v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_fete.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            ELSE
                v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                LOOP
                    v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0, lista_prenume_baieti.count)) + 1);
                    exit when v_prenume1 <> v_prenume2;
                END LOOP;
            END IF;


            IF (DBMS_RANDOM.VALUE(0, 100) < 60) THEN
                IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
                    v_prenume := v_prenume1 || ' ' || v_prenume2;
                END IF;
            else
                v_prenume := v_prenume1;
            END IF;

            v_fonduri := 0;
            IF (DBMS_RANDOM.VALUE(0, 100) < 10) THEN
                v_fonduri := TRUNC(DBMS_RANDOM.VALUE(0, 10)) * 10 + 50;
            else
                v_fonduri := 100;
            END IF;

              iF (DBMS_RANDOM.VALUE(0, 100) < 25) THEN
                v_cnp := 1 * 1000000000 + v_i;
            else
                v_cnp := 2 * 1000000000 + v_i * 51;
            END IF;

            id_cursa := DBMS_RANDOM.VALUE(1, 2000);
            select count(*) into v_id from CURSE;
            insert into clienti(id, nume, prenume, fonduri, nr_telefon, email, cnp, id_cursa, created_at, updated_at)
            values (v_i, v_nume, v_prenume, 0, '123456', 'email', v_cnp, DBMS_RANDOM.VALUE(1, 5000), sysdate, sysdate);

        END LOOP;
end;


/*    FOR v_i IN 1..2000


end loop;
/*
clienti 1.000.000
depou 100
soferi 10000
statii 10000
trasee 1000
vehicule_depou 12000*/


