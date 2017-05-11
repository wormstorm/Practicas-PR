%Carlos Lozano Casado
%David Pazios Izquierdo

array [1..2,1..2,1..6] of var 1..4: liga; % [partido,local..visitante,semana]


constraint forall (i in 1..6) (liga[1,1,i]!=liga[1,2,i]/\liga[1,1,i]!=liga[2,1,i]/\liga[1,1,i]!=liga[2,2,i] /\ liga[1,2,i]!=liga[2,1,i] /\ liga[1,2,i]!=liga[2,2,i]/\liga[2,1,i]!=liga[2,2,i]);% todos distintos por semana

constraint forall (e1,e2 in 1..4 where e1!=e2) (sum([liga[p,1,s]=e1 /\ liga[p,2,s]=e2 | s in 1..6, p in 1..2] )=1);

constraint forall (s in 1..6,p in 1..2) ( let {var 1..4:k, var 1..4:z} in ( (liga[p,1,s]==k /\ liga[p,2,s]==z) /\ not exists (sem in 1..6, pr in 1..2 where sem=s -> pr!=p) (liga[pr,1,sem]==k /\ liga[pr,2,sem]==z)  ));

solve satisfy;

output([ (if p=1 then ("Semana "++show(i)++": \n") else "" endif)
       ++show(liga[p,1,i])++"-"++show(liga[p,2,i])++"\n" | i in 1..6,p in 1..2]/*++["casa-fuera ",show(casafuera)]*/)

