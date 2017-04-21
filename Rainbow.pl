%Database
%?ring(?Name,?Radius,?Color)
%rings_db:-
%    recorded(ring,-),
%    !.
rings_db:-
    recordz(ring,(r1,3,red)),
    recordz(ring,(o1,6,orange)),
    recordz(ring,(o2,6,orange)),
    recordz(ring,(g1,6,yellow)),
    recordz(ring,(g2,9,green)).

%?Color, ?NextColor
rainbow(red,orange).
rainbow(orange,yellow).
rainbow(yellow,green).


%?First ring, -MultyRing
ring_main(R1,[R1|Rs]):-
    rings_db,
    var(R1),
    first_ring(R1,R,C),
    rings_generation(R,C,Rs).
ring_main(R1,[R1|Rs]):-
    nonvar(R1),
    recorded(ring,(R1,R,C)),
    rings_generation(R,C,Rs).

%+Radius, +Color, -MultuRing
rings_generation(R,C,[Ring|Rings]):-
    R1 is R + 3,
    next_color(C,C1),
    recorded(ring,(Ring,R1,C1)),
    rings_generation(R1,C1,Rings).
%When we can not create new Ring
rings_generation(R,C,[]):-
     not((R1 is R + 3,
     next_color(C,C1),
     recorded(_,R1,C1))).

%?Color, ?Next Color
next_color(C,C1):-
    rainbow(C,C1).
next_color(C,C1):-
    rainbow(C,Cp),
    next_color(Cp,C1).

%-First ring, -Radius, -Color
first_ring(Ring,R,C):-
    recorded(ring,(Ring,R,C)),
    not((R1 is R - 3,
    next_color(C1,C),
    recorded(ring,(_,R1,C1)))).


