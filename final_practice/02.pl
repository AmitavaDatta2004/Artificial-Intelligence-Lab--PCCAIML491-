forward(0):-write(0).
forward(N):-
    N>0,write(N),nl,
    N1 is N-1,
    forward(N1).

factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

sum(0,0).
sum(N,S):-
    N>0,
    N1 is N-1,
    sum(N1,S1),
    S is N+S1.