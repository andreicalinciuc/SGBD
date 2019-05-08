create or replace procedure generate_nodes_and_edges(
    nr_nodes integer,
    nr_edges integer
) as
    v_node1 integer;
    v_node2 integer;
    v_cost integer;
    v_counter integer;
begin
    v_counter := 1;
    while v_counter <= nr_edges/2 loop
        begin
            v_cost := dbms_random.value(1, 10);
            v_node1 := dbms_random.value(1, nr_nodes);
            v_node2 := dbms_random.value(1, nr_nodes);
            while v_node1 = v_node2 loop
                v_node2 := dbms_random.value(1, nr_nodes);
            end loop;
            insert into costuri_muchii (id_nod_from, id_nod_to, cost_muchie) values (v_node1, v_node2, v_cost);
            insert into costuri_muchii (id_nod_to, id_nod_from, cost_muchie) values (v_node1, v_node2, v_cost);
        exception when others then
                dbms_output.put_line('fail');
                v_counter := v_counter - 1;
        end;
        v_counter := v_counter + 1;
    end loop;
end;
/
set serveroutput on;
declare
    v_nodes integer := 1500;
    v_edges integer := 1000000;
begin
    generate_nodes_and_edges(v_nodes, v_edges);
end;
/
select count(*) from costuri_muchii;