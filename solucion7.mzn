%Carlos Lozano Casado
%David Pacios Izquierdo

var 0..1:a;
var 0..1:b;
var 0..1:c;
var 0..1:d;
var 0..1:y;


% r es a AND b
predicate and(var 0..1:a, var 0..1: b, var 0..1: r) =
r = max(0,(a+b-1));

% r es a OR b
predicate or(var 0..1:a, var 0..1: b, var 0..1: r) =
r = max(a,b);

% r es la negación de a
predicate neg(var 0..1: a, var 0..1: r) =
r = -(a-1);

% r es 0
predicate cero(var 0..1: r) =
r = 0;

% r es 1
predicate uno(var 0..1: r) =
r = 1;

% r es a
predicate cable(var 0..1: a, var 0..1: r) =
r = a;

% construir nor a partir de las anteriores
predicate nor(var 0..1:a, var 0..1: b, var 0..1: r) =
let {var 0..1:x} in
or(a,b,x) /\ neg(x,r);

% construir nand a partir de las anteriores
predicate nand(var 0..1:a, var 0..1: b, var 0..1: r) =
let {var 0..1:x} in and(a,b,x) /\ neg(x,r);


constraint let {var 0..1:aux1,var 0..1:aux2,var 0..1:aux3} in and(a,b,aux1) /\ and(c,d,aux2) /\ or(aux1,aux2,aux3) /\ neg(aux3,y);


solve satisfy;






