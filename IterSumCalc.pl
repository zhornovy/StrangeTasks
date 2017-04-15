%+N, +X, -Res
calc(N,X,Res):-
    sum(1,N,X,0,R),
    Res is R + tan(X).

%+I, +N, +X, +Acc, -Res
sum(I,N,X,Acc,Res):-
    I =< N,!,
    Xkv is X * X,
    Div is I + X,
    Tres is Xkv / Div,
    I1 is I + 1,
    Acc1 is Acc + Tres,!,
    sum(I1,N,X,Acc1,Res).
sum(I,N,_,Acc,Acc):- I>= N.

%+X1, +X2, +Xstep, +N, +Acc, -Res
doLab(X1,X2,Xstep,N,Acc,Res):-
    X1 =< X2,!,
    calc(N,X1,R),
    Xnew is X1 + Xstep,
    doLab(Xnew,X2,Xstep,N,[R | Acc],Res).
doLab(X1,X2,_,_,Acc,Acc):- X1 >= X2.
