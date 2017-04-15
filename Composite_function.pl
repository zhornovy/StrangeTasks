%+X +K -F
f(X, K, F):-
    X > 0,
    X < 10,
    Dob is K * X,
    factorial(Dob,2,1,F).
f(X, K, F):-
    X >= 10,
    power(X,1,K,1,F).

%+X +I +Power +Acc -Result
power(X,I,K,Acc,Res):-
    I =< K,
    I1 is I + 1,
    Acc1 is Acc * X,
    power(X,I1,K,Acc1,Res).

power(_,I,K,Pow,Pow):-
    I > K.


%+N +Iterator +Accumulator -Result
factorial(N, I, Result, Result):-
    I > N.

factorial(N, I, Acc, Result):-
    I =< N,
    I1 is I + 1,
    Acc1 is Acc * I,
    factorial(N, I1, Acc1, Result).

