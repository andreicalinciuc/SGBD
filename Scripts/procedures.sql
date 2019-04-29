create or replace procedure generate_nodes_and_edges(
    nr_nodes integer,
    nr_edges integer
) as
    v_node1 integer;
    v_node2 integer;
    v_cost integer;
    v_counter integer;
begin
    for v_counter in 1..nr_edges loop
        v_cost := dbms_random.value(1, 10);
        v_node1 := dbms_random.value(1, nr_nodes/2);
        v_node2 := dbms_random.value(nr_nodes/2+1, nr_nodes);
        while v_node1 = v_node2 loop
            v_node2 := dbms_random.value(nr_nodes/2+1, nr_nodes);
        end loop;
        insert into costuri_muchii (id_nod_from, id_nod_to, cost_muchie) values (v_node1, v_node2, v_cost);
    end loop;
end;
/

declare
    v_nodes integer := 10;
    v_edges integer := 10;
begin
    generate_nodes_and_edges(v_nodes, v_edges);
end;