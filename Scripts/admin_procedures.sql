-- Procedura AddStation(name, city), DeleteStation(name, city):
--     Pentru adaugarea unei statii in tabela statii.
--     Pentru stergerea unei statii din tabela statii si din traseele in care apare, inlocuind automat drumul vechi cu unul direct intre nodurile adiacente.


-- Procedura AddStationToTraseu(traseu, from_station, new_station, to_station):
--     Adauga o statie intre 2 statii ale unui traseu daca exista un drum intre acestea.


-- Procedura AddDriver(driver), RemoveDriver(driver):
--     Adauga sofer.
--     Sterge sofer.


-- Procedura AddVehicle(vehicle, garage), RemoveVehicle(vehicle, garage), MoveVehicle(vehicle, from_garage, to_garage):
--     Adauga un vehicul intr-un depou. (a se intelege 'cumpara')
--     Sterge un vehicul dintr-un depou. (a se intelege 'vinde' sau 'scoatere din functiune')
--     Muta un vehicul dintr-un depou in altul.


-- Procedura AddTraseu(from_station, to_station), DeleteTraseu(traseu):
--     Adauga un traseu intre doua statii, urmand sa fie adaugate statii dupa nevoie folosind AddStationToTraseu.
--     Sterge un traseu.


-- Procedura StartRide(vehicul, sofer, traseu), FinishRide(vehicul):
--     Adauga o cursa folosind un vehicul, un sofer si un traseu.
--     Incheie cursa, eliberand vehiculul si soferul.


-- Procedura PassangerIn(passanger, cursa), PassengerOut(passanger, cursa):
--     Inregistreaza pasagerul cand urca/coboara in/din cursa.

