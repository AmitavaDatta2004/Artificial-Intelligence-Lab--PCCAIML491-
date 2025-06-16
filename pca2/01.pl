% Facts
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(bob, peter).
parent(pat, jim).
parent(peter, jim).

female(pam).
female(liz).
female(pat).
female(ann).

male(tom).
male(bob).
male(jim).

% Rules
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- grandparent(X, Y), female(X).
grandfather(X, Y) :- grandparent(X, Y), male(X).
wife(X, Y) :- parent(X, Z), parent(Y, Z), female(X).
uncle(X, Y) :- parent(Z, Y), brother(X, Z).

% Brother definition reused
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), male(Y), X \= Y.

predecessor(X,Y):-parent(X,Y).
predecessor(X,Z):-predecessor(X,Y),parent(Y,Z).


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forward_loop(0).
forward_loop(N):-
    N>0,
    write(N),nl,
    N1 is N-1,
    forward_loop(N1).

backward_loop(0).
backward_loop(N):-
    N>0,
    N1 is N - 1,
    backward_loop(N1),
    write(N),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fact(0,1).
fact(N,F):-
    N > 0,
    N1 is N-1,
    fact(N1,F1),
    F is N*F1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sum(0,0).
sum(N,S):-
    N>0,
    N1 is N - 1,
    sum(N1,S1),
    S is N + S1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

print_sq(N1,N2):-
    N1<=N2,
    Square is N1*N1,
    write("Square of"),write(N1),write("is"),write(Square),
    N3 is N1+1,
    print_sq(N3,N2).
print_sq(N1,N2):-
    N1<N2.