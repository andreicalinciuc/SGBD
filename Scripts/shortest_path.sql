DROP TABLE shortest_paths CASCADE CONSTRAINTS;
/

CREATE TABLE shortest_paths(
    id_nod_from INT,
    id_nod_to INT,
    cost_muchie INT,
    parent_node INT,
    primary key (id_nod_from, id_nod_to),
    created_at DATE,
    updated_at DATE

);
/

create or replace procedure generate_floyd_warshall_paths(
  vertices integer
  ) as
  v_cost integer;
  dist_ij integer;
  dist_ik integer;
  dist_kj integer;
begin
  for v_i in 0 .. vertices loop
    for v_j in 0 .. vertices loop
      begin
        select cost_muchie into v_cost from costuri_muchii where id_nod_from = v_i and id_nod_to = v_j;
      exception when others then
        v_cost := 2147483647;
      end;
      insert into shortest_paths (id_nod_from, id_nod_to, cost_muchie) values (v_i, v_j, v_cost);
    end loop;
  end loop;
  for v_k in 0 .. vertices-1 loop
    for v_i in 0 .. vertices-1 loop
      for v_j in 0 .. vertices-1 loop
        select cost_muchie into dist_ij
        from shortest_paths where id_nod_from = v_i and id_nod_to = v_j;
        select cost_muchie into dist_ik
        from shortest_paths where id_nod_from = v_i and id_nod_to = v_k;
        select cost_muchie into dist_kj
        from shortest_paths where id_nod_from = v_k and id_nod_to = v_j;
        
        if dist_ik + dist_kj < dist_ij then
          dist_ij := dist_ik + dist_kj;
          update shortest_paths set cost_muchie = dist_ij, parent_node = v_k where id_nod_from = v_i and id_nod_to = v_j;
        end if;
      end loop;
    end loop;
  end loop;
end;
/



declare
  vertices integer;
begin
  select greatest(max(id_nod_from), max(id_nod_to)) into vertices from costuri_muchii;
  generate_floyd_warshall_paths(vertices);
end;