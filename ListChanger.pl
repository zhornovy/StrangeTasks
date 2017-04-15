% +List, +Acc,+Middle, -Part1, -Part2
parts([X|L],I,K2,[X|P1],P2):-
    I<K2,I1 is I + 1,
    parts(L,I1,K2,P1,P2).
parts(P3,I,I,[],P3).

% +List1, +List2, -Res
diver(A1,A2,RL):-
    length(A1,L1),
    length(A2,L2),
    Mdl1 is L1 // 2,
    Mdl2 is L2 // 2,
    parts(A1,0,Mdl1,AP1,AP2),
    parts(A2,0,Mdl2,AP3,AP4),
    append(AP1,AP3,RL1),
    append(AP2,AP4,RL2),
    append(RL1,RL2,RL).

