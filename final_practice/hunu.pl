move(state(atdoor,onfloor,box,no),go_to_box,state(box,onfloor,box,no)).
move(state(box,onfloor,box,no),push_the_box,state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no),climb_the_box,state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no),grasp_the_banana,state(middle,onbox,middle,yes)).

goal(state(_,_,_,yes)).

plan(State,[]):-goal(State).
plan(State,[Action|Actions]):-
    move(State,Action,NewState),
    plan(NewState,Actions).

tower(1,Source,_,Destination):-
    write('Move top disk from ') , write(Source), write(' to '),write(Destination).

tower(N,Source,Auxillary,Destination):-
    N>1,
    N1 is N - 1,
    tower(N1,Source,Auxillary,Destination),
    tower(1,Source,_,Auxillary),
    tower(N1,Auxillary,Source,Destination).

