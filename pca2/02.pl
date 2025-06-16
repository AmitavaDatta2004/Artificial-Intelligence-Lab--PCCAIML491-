move(state(atdoor,onfloor,box,no),go_to_window,state(atwindow,onfloor,box,no)).
move(state(atwindow,onfloor,atwindow,no),push_the_box,state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no),climb_box,state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no),grasp_banana,state(middle,onbox,middle,yes)).

goal(state(_,_,_,yes)).

plan(State,[]):-goal(State).
plan(State,[Action|Actions]):-
    move(State,Action,NewState),
    plan(NewState,Actions).


solve(Plan):-
    State=(atdoor,onfloor,box,no),
    plan(State,Plan).
