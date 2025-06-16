move(state(atdoor,onfloor,box,no),gotobox,state(box,onfloor,box,no)).
move(state(box,onfloor,box,no),pushbox,state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no),climbbox,state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no),graspbanana,state(middle,onbox,middle,yes)).

goal(state(_,_,_,yes)).

plan(State,[]):-goal(State).
plan(State,[Action|Actions]):-
    move(State,Action,NewState),
    plan(NewState,Actions).

