% State(MonkeyPos, MonkeyHeight, BoxPos, HasBanana)

move(state(atdoor,onfloor,box,no), go_to_box, state(box,onfloor,box,no)).
move(state(box,onfloor,box,no), push_the_box, state(middle,onfloor,middle,no)).
move(state(middle,onfloor,middle,no), climb_box, state(middle,onbox,middle,no)).
move(state(middle,onbox,middle,no), grasp_banana, state(middle,onbox,middle,yes)).

goal(state(_,_,_,yes)).

plan(State,[]) :- goal(State).
plan(State,[Move|Actions]) :-
    move(State,Move,NewState),
    plan(NewState,Actions).

solve(Plan) :-
    InitialState = state(atdoor,onfloor,box,no),
    plan(InitialState, Plan).
