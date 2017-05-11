%Carlos Lozano Casado
%David Pacios Izquierdo
set of int:CHAR=1..4;

predicate substring(array [int] of var CHAR:a, 
					var int:ini,
                    array [int] of var CHAR:b) =
	( length(a) <= length(b)-ini+1) /\ forall (i in index_set(a)) (a[i]=b[i+ini-1]);

predicate reverse(array [int] of var CHAR:a, 
                  array [int] of var CHAR:b) =
	(length(a)) = (length(b)) /\ forall(i in index_set(a)) (b[length(a)-i+1] = a[i]);

predicate count (array [int] of var CHAR:a, 
				 var int:n,
                 var CHAR:c) =
	sum (i in  index_set(a) where a[i]==c) (1)=n;

predicate concat(array [int] of var CHAR:a, 
				 array [int] of var CHAR:b,
                 array [int] of var CHAR:c)=
	let {int: x = length(a)} in forall (i in 1..( x + length(b)) ) (if (i <= x) then c[i]=a[i] else c[i] = b[i-x] endif);

predicate index (array [int] of var CHAR:a, 
				 var int:l,
                 var CHAR:p) =
	(exists (i in index_set(a)) ( (a[i]==p /\ forall(j in 1..i-1) (a[j]!=p))->l=i )) \/ (forall (k in index_set(a)) ( a[k] != p)-> l=-1 );

predicate insert (array [int] of var CHAR:a, 
				  var CHAR:l,
				  var int:p,
                  array [int] of var CHAR:b) =
	(length(a)+1 = length(b)) /\ forall (i in 1..length(a)+1) (if (i<p) then b[i]=a[i] else (if (i==p) then b[i]=p else b[i]=a[i-1] endif) endif );


predicate remove (array [int] of var CHAR:a, 
				  var CHAR:l,
                  array [int] of var CHAR:b) =
	let {var int: w} in index(a,w,l) /\ forall (i in index_set(a) where (w!=-1 -> i!=w)) (if (i<w) then b[i]= a[i] else b[i-1]=a[i] endif);


















