Functie GetTraseeActive():
    Returneaza o lista cu traseele pe care circula macar un vehicul.
Functie GetTraseuVehicul():
    Returneaza o lista cu statiile prin care trece un vehicul.
Functie FindFastestRide(from_station, to_station):
    Clientul cere ruta cea mai rapida de la from_station la to_station.
    Aplicatia cauta ce trasee contin from_station si to_station.
    Aplicatia calculeaza costul fiecarui drum de la from_station la to_station din aceste trasee si returneaza traseul cu cel mai ieftin drum.
    Aplicatia cauta o cursa ce contine traseul selectat si o returneaza clientului.
    ( Daca traseul cursei sare peste o statie dintre from_station si to_station, aceasta trebuie luata in calcul la cost )
    Needs: Tabel nou cu costul muchiilor.