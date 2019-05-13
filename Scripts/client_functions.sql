-- Functie GetTraseeActive():
--     Returneaza o lista cu traseele pe care circula macar un vehicul.
create or replace function get_active_routes
return int_list
is
route_ids int_list;
begin
  select distinct id_traseu bulk collect into route_ids from curse;
  return(route_ids);
end get_active_routes;
/

-- Functie GetTraseuVehicul():
--     Returneaza o lista cu statiile prin care trece un vehicul.
create or replace function get_traseu_cursa
( cursa_id integer )
return int_list
is
node_ids int_list;
begin
  select id_statie_from bulk collect into node_ids from trasee_statii where id_traseu = (select id_traseu from curse where id = cursa_id) order by trasee_statii.id;
  return(node_ids);
end get_traseu_cursa;
/

-- Functie FindFastestRide(from_station, to_station):
--     Clientul cere ruta cea mai rapida de la from_station la to_station.
--     Aplicatia cauta ce trasee contin from_station si to_station.
--     Aplicatia calculeaza costul fiecarui drum de la from_station la to_station din aceste trasee si returneaza traseul cu cel mai ieftin drum.
--     Aplicatia cauta o cursa ce contine traseul selectat si o returneaza clientului.
--     ( Daca traseul cursei sare peste o statie dintre from_station si to_station, aceasta trebuie luata in calcul la cost )
--     Needs: Tabel nou cu costul muchiilor.
create or replace function get_fastest_ride
( from_station integer, to_station integer )
return integer
is
node_ids int_list;
begin
  return(1);
end get_fastest_ride;
/

create or replace function get_fastest_ride_duration
( from_station integer, to_station integer )
return integer
is
node_ids int_list;
begin
  return(2);
end get_fastest_ride_duration;
/


select * from table(select get_active_routes() from dual);
select * from table(select get_traseu_cursa(3) from dual);
select get_fastest_ride(3, 5) from dual;
select get_fastest_ride_duration(3, 5) from dual;