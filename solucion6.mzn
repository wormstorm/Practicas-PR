%Carlos Lozano Casado
%David Pacios Izquierdo

% num asignaturas;  1-> ge , 2->fp, 3->fc, 4-> mdl, 5->mmi
int:n=5;
% num dias con clase
int:dias=5;
% num horas/dia
int:horas=4;

% max. tamaño del bloque
int:maxbloque=2;

% bloques por asignaturas y por bloques, representados como un array unidimensional
array [1..n,1..maxbloque] of 0..horas*dias:bloques = [|0,2 | 2,1 | 2,1 | 4,0 | 4,0 |];

% esto es lo que queremos averiguar: para cada día cuantas horas
% de cada asignatura se imparten?
array [1..dias,1..n] of var 0..maxbloque:horario;

predicate horasDia (array[1..dias,1..n] of var 0..maxbloque:x) =
forall(i in index_set_1of2(x)) (sum(j in index_set_2of2(x))(x[i,j])<=horas);

predicate nbloques (array[1..dias,1..n] of var 0..maxbloque:x, var 1..n:as,var 1..maxbloque:bsize,var int:total) = (sum(i in index_set_1of2(x) where x[i,as]=bsize) (x[i,as]) div bsize )=total;

predicate bloquesPorAsignatura(array[1..dias,1..n] of var 0..maxbloque:x,array [1..n,1..maxbloque] of 0..horas*dias:bloq)
=forall(j in index_set_2of2(x),k in 1..maxbloque) (nbloques(x,j,k,bloq[j,k]));



constraint bloquesPorAsignatura(horario,bloques);
constraint horasDia(horario);
solve satisfy;

output ["L  M  X  J  V \n"] ++ [show(horario[i,j])++ "  "++ if j==n then "\n" else "" endif |i in index_set_1of2(horario),j in index_set_2of2(horario)]











%output [show ([ show(horario[i,j])++" " | i in index_set_1of2(horario) ]) ++"\n" | j in index_set_2of2(horario) ]
