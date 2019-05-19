-- Functie GetTraseeActive():
--     Returneaza o lista cu traseele pe care circula macar un vehicul.
create or replace function get_active_routes
    return int_list
    is
    route_ids int_list;
begin
    select distinct id_traseu bulk collect into route_ids from curse;
    return (route_ids);
end get_active_routes;
/

-- Functie GetTraseuVehicul():
--     Returneaza o lista cu statiile prin care trece un vehicul.
create or replace function get_traseu_cursa(cursa_id integer)
    return int_list
    is
    node_ids int_list;
begin
    select id_statie_from bulk collect into node_ids
    from trasee_statii
    where id_traseu = (select id_traseu from curse where id = cursa_id)
    order by trasee_statii.id;
    return (node_ids);
end get_traseu_cursa;
/

-- Functie FindFastestRide(from_station, to_station):
--     Clientul cere ruta cea mai rapida de la from_station la to_station.
--     Aplicatia cauta ce trasee contin from_station si to_station.
--     Aplicatia calculeaza costul fiecarui drum de la from_station la to_station din aceste trasee si returneaza traseul cu cel mai ieftin drum.
--     Aplicatia cauta o cursa ce contine traseul selectat si o returneaza clientului.
--     Needs: Tabel nou cu costul muchiilor.
create or replace function get_fastest_ride(from_station integer, to_station integer)
    return int_list
    is
    v_traseu_id   integer;
    v_statii_count integer;
    v_from_id integer;
    v_to_id integer;
    v_found_from integer;
    v_sum_ride_cost integer;
    v_current_cost integer;
    v_returned_values int_list := int_list(0, 2147483647);
    cursor c_trasee_active is
        (select unique id_traseu from curse);
    cursor c_statii_traseu (traseu_id in integer) is
        (select id_statie_from, id_statie_to from trasee_statii where id_traseu = traseu_id order by id);
begin
    open c_trasee_active;
    loop
        fetch c_trasee_active into v_traseu_id;
        exit when c_trasee_active%notfound;
        select count(*) into v_statii_count
         from trasee_statii
         where id_traseu = v_traseu_id
           and (id_statie_from = from_station or id_statie_from = to_station);
        if v_statii_count >= 2 then
            v_sum_ride_cost := 0;
            open c_statii_traseu(v_traseu_id);
            loop
                fetch c_statii_traseu into v_from_id, v_to_id;
                exit when c_statii_traseu%notfound;
                if v_found_from = 1 or v_from_id = from_station then
                    v_found_from := 1;
                    select cost_muchie into v_current_cost from costuri_muchii where id_nod_from = v_from_id and id_nod_to = v_to_id;
                    v_sum_ride_cost := v_sum_ride_cost + v_current_cost;
                    exit when v_to_id = to_station;
                end if;
            end loop;
            close c_statii_traseu;
            if v_sum_ride_cost < v_returned_values(2) then
                v_returned_values(1) := v_traseu_id;
                v_returned_values(2) := v_sum_ride_cost;
            end if;
        end if;
    end loop;
    close c_trasee_active;
    return(v_returned_values);
end get_fastest_ride;
/


select *
from table (select get_active_routes() from dual);
select *
from table (select get_traseu_cursa(3) from dual);
select get_fastest_ride(1, 3)
from dual;
