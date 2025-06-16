mem_check(X,[X|_]).
mem_check(X,[_|T]):-mem_check(X,T).

len([],0).
len([_|T],N):-
    len(T,N1),
    N is N1+1.

concat([], L, L).
concat([H|T],L2,[H|T3]):-
    concat(T,L2,T3).

sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S is H + S1.

insert(I,L,[I|L]).
% insert([H|T],I,[H|I]):-
%     insert