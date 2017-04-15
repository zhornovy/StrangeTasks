% +Matrix
data([[1,1,1,1,0],
      [1,1,1,0,0],
      [1,1,0,0,0],
      [1,1,1,0,0],
      [1,1,1,1,0]]).

% -Sum
matrix_main(S):-
    data(M),
    length(M,K),
    Mdl is K // 2 + 1,
    matrix_rows(M,1,K,Mdl,0,S).

% +Matrix, +N1,+N2,+Mdl,+Acc, -S
matrix_rows([R|Rs],N1,N2,Mdl,Acc,S):-
    N1 =<Mdl,
    N11 is N1 + 1,
    N12 is N2 - 1,
    sum_rows(R,1,N1,N2,0,Sr),
    Acc1 is Acc + Sr,
    matrix_rows(Rs,N11,N12,Mdl,Acc1,S).
matrix_rows(_,N1,_,Mdl,S,S):-
    N1 > Mdl.

% +Row, +Counter, +From, +To, +Acc, -Sum
sum_rows([_|Xs],I,N1,N2,Acc,S):-
    I<N1,I1 is I + 1,
    sum_rows(Xs,I1,N1,N2,Acc,S).
sum_rows([X|Xs],I,N1,N2,Acc,S):-
    I >= N1, I =< N2,
    I1 is I + 1,
    Acc1 is Acc + X,
    sum_rows(Xs,I1,N1,N2,Acc1,S).
sum_rows(_,I,_,N2,S,S):-
    I>N2.

