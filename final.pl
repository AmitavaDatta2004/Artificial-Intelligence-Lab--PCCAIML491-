parent(pam, bob). 
parent(tom, bob). 
parent(tom, liz). 
parent(bob, ann). 
parent(bob, pat). 
parent(pat, jim). 
parent(bob, peter). 
parent(peter, jim).


female(pam). 
female(liz). 
female(pat). 
female(ann). 

male(tom). 
male(bob). 
male(jim).

mother(X,Y):-female(X),parent(X,Y).
father(X,Y):-male(X),parent(X,Y).
sister(X,Y):-female(X),parent(Z,X),parent(Z,Y).
brother(X,Y):-male(X),parent(Z,X),parent(Z,Y).

grandparent(X,Y):-parent(X,Z),parent(Z,Y).

predecessor(X,Y):-parent(X,Y).
predecessor(X,Y):-
    parent(X,Z),predecessor(Z,Y).

factorial(0,1).
factorial(N,F):-
    N>0,
    N1 is N-1,
    factorial(N1,F1),
    F is N*F1.

sum(0,0).
sum(N,S):-
    N>0,
    N1 is N-1,
    sum(N1,S1),
    S is N+S1.

square(N1,S):-  S is N1*N1.
square_between(N1,N2,S):-N1=<N2 , square(N1,S).
square_between(N1,N2,S):-
    N1 < N2,
    N3 is N1 + 1,
    square_between(N3,N2,S).

mem_check(X,[X|_]).
mem_check(X,[_|T]):-mem_check(X,T).

len([],0).
len([_|T],L):-
    len(T,L1),
    L is L1+1.

% concatenate([],L,Result).
% concatenate([H|T1],L,[H|T2]):-
%     concatenate(T,L,T2).

tower(1,Source,_,Destination):-
    write('Move top disk from '),write(Source),write(' to '),write(Destination).
tower(N,Source,Auxillary,Destination):-
    N>1,
    N1 is N-1,
    tower(N1,Source,Auxillary,Destination),
    tower(1,Source,_,Auxillary),
    tower(N1,Auxillary,Source,Destination).

move(state(atdoor,onfloor,atwindow,no),move_to_window,state(atwindow,onfloor,atwindow,no)).
move(state(atwindow,onfloor,atwindow,no),push_the_box,state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no),climb_the_box,state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no),grasp_the_banana,state(middle,onbox,middle,yes)).

goal_state(state(_,_,_,yes)).

plan(State,[]):-goal_state(State).
plan(State,[Action|Actions]):-
    move(State,Action,NewState),
    plan(NewState,Actions).

edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(c,g).

goal(d).
goal(e).
goal(f).
goal(g).

dfs(Node,[Node]):- goal(Node).
dfs(Node,[Node|Path]):-
    edge(Node,Next),
    dfs(Next,Path).

bfs([[Node|Path]|_],Result):-
    goal(Node),
    reverse([Node|Path],Result).

bfs([[Node|Path]|Rest],Result):-
    findall(
        [Next,Node|Path],
        edge(Node,Next),
        NewPaths
        ),
    append(Rest,NewPaths,Queue),
    bfs(Queue,Result).
