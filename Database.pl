:- dynamic point/3.
%Database filling
db_filling :-
 assert(point(p1, 1, 1)),
 assert(point(p2, 1, 2)),
 assert(point(p3, 1, 3)),
 assert(point(p4, 1, 4)),
 assert(point(p5, 1, 5)).
db_filling2 :-
 recordz(point,(p1, 1, 1)),
 recordz(point,(p2, 1, 2)),
 recordz(point,(p3, 1, 3)),
 recordz(point,(p4, 1, 4)),
 recordz(point,(p5, 1, 5)).

%+Radius, -Result
main(Radius, Result) :-
 db_filling, setof(N, find(N, Radius), Result).
main2(Radius, Result) :-
 db_filling2, setof(N, find2(N, Radius), Result).

% -Pair of Points, +Radius
find([C1, C2], Radius) :-
 point(C1, X1, Y1),
 point(C2, X2, Y2),
 C1 @< C2,
 sqrt(((X2-X1)*(X2-X1))+((Y2-Y1)*(Y2-Y1))) > Radius*2.
find2([C1, C2], Radius) :-
 recorded(point,(C1, X1, Y1)),
 recorded(point,(C2, X2, Y2)),
 C1 @< C2,
 sqrt(((X2-X1)*(X2-X1))+((Y2-Y1)*(Y2-Y1))) > Radius*2.


%+First List,-New List
remove_duplicates([],[]).
remove_duplicates([H | T], List) :-
     member(H, T),
     remove_duplicates( T, List).
remove_duplicates([H | T], [H|T1]) :-
      \+member(H, T),
      remove_duplicates( T, T1).





