%Carlos Lozano Casado
%David Pacios Izquierdo
int: n;
int: ini;
int: fin;
int: max;

var 1..max: cfin;% puntero a la posicion donde se encuentra la ciudad final
var int: coste;%el coste total

array [1..n,1..n] of var int : t;
array [0..max] of var 1..n: ciudades; %ciudades por las que pasa contando la inicial y la final
array [0..max-1] of var int: aux;%los costes de cadad viaje


constraint ciudades[0]=ini;
constraint ciudades[cfin]=fin;

constraint forall (i in 0..cfin-1) (aux[i]=t[ciudades[i],ciudades[i+1]]);
constraint forall (i in 0..max-1) (aux[i]>=0);
constraint forall (i in cfin..max-1) (aux[i]=0);
constraint forall (i,j in 0..cfin where i < j) (ciudades[i] != ciudades[j]);

constraint coste = sum(aux);


solve minimize coste;
%solve minimize cfin;


