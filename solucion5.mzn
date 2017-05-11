%Carlos Lozano Casado
%David Pacios Izquierdo

int:n; % lado del cuadrado

array [1..n,1..n] of 1..9:h; % hitori
array [1..n,1..n] of var 0..9:z; % hitori solucion

% 1
predicate inBounds(array[int,int] of var int:t, var int:i, var int: j) =
(i in index_set_1of2(t))/\(j in index_set_2of2(t));

% 2
predicate nohayzeroalrededor(array[int,int] of var int:t, var int:i, var int:j) =
(inBounds(t,i+1,j) -> t[i+1,j]!=0) /\ (inBounds(t,i-1,j) -> t[i-1,j]!=0) /\ (inBounds(t,i,j+1)->t[i,j+1]!=0) /\ (inBounds(t,i,j-1)->t[i,j-1]!=0);

%3
predicate haynozeroalrededor(array[int,int] of var int:t,var int:i, var int:j) = 
(inBounds(t,i+1,j) -> t[i+1,j]!=0) \/ (inBounds(t,i-1,j) -> t[i-1,j]!=0) \/ (inBounds(t,i,j+1)->t[i,j+1]!=0) \/ (inBounds(t,i,j-1)->t[i,j-1]!=0);

%4
predicate copiadeh(array[int,int] of var int:t) =
forall (i in index_set_1of2(h),j in index_set_2of2(h)) ((t[i,j]!=0)->(t[i,j]=h[i,j]));

%5
predicate cerobien(array[int,int] of var int:t) =
forall (i in index_set_1of2(t),j in index_set_2of2(t)) (t[i,j]=0 -> nohayzeroalrededor(t,i,j));

%6
predicate nocerobien(array[int,int] of var int:t) =
forall (i in index_set_1of2(t),j in index_set_2of2(t)) (t[i,j]!=0 -> haynozeroalrededor(t,i,j));

%7
predicate diferenteporfilas(array[int,int] of var int:t) =
forall (k in index_set_1of2(t)) (forall (i,j in index_set_2of2(t) where i<j /\ (t[k,i]!=0)) (t[k,i]!=t[k,j]));

%8
predicate diferenteporcolumnas(array[int,int] of var int:t) =
forall (k in index_set_2of2(t)) (forall (i,j in index_set_1of2(t) where i<j /\ (t[i,k]!=0)) (t[i,k]!=t[j,k]));

%9
constraint copiadeh(z);
constraint cerobien(z);
constraint nocerobien(z);
constraint diferenteporfilas(z);
constraint diferenteporcolumnas(z);


solve satisfy;

%10
output [show ([ show(z[j,i])++" " | i in index_set_1of2(z) ]) ++"\n" | j in 1..n ]

