:- dynamic point/3.
%Database filling
db_filling :-
assert(point(p1, 1, 1)),
assert(point(p2, 1, 2)),
assert(point(p3, 1, 3)),
assert(point(p4, 1, 4)),
assert(point(p5, 1, 5)).
% +Radius, -Result List

main(Radius, Result) :-
db_filling, setof(N, findIntersections(N, Radius), Result).

% -Centers and points count, +Radius
findIntersections([C1, C2], Radius) :-
point(C1, X1, Y1),
point(C2, X2, Y2),
C1 @< C2,
sqrt(((X2-X1)*(X2-X1))+((Y2-Y1)*(Y2-Y1))) > Radius*2.

remove_duplicates([],[]).
remove_duplicates([H | T], List) :-
     member(H, T),
     remove_duplicates( T, List).
remove_duplicates([H | T], [H|T1]) :-
      \+member(H, T),
      remove_duplicates( T, T1).





