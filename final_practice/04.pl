tower(1,Source,Destination,_):-
    write('Move top disk from' ),write(Source),write(' to '),write(Destination),nl.

tower(N,Source,Auxillary,Destination):-
    N>1,
    N1 is N-1,
    tower(N1,Source,Auxillary,Destination),
    tower(1,Source,Destination,_),
    tower(N1,Auxillary,Destination,Source).

move(state(atdoor,atfloor,box,no),move_to_window,state(atwindow,onfloor,box,no)).
move(state(atwindow,onfloor,atwindow,no),push_the_box,state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no),climb,state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no),grasp,state(middle,onbox,middle,yes)).

goal_state(state(_,_,_,yes)).

plan(State,[]):-goal_state(State).
plan(State,[Action|Actions]):-
    move(State,Action,NewState),
    plan(State,Actions).

