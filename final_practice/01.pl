%%%%%%%%%%%%%%%%%%%%% Question 1

food(burger).
food(pizza).
food(sandwich).

lunch(sandwich).
dinner(pizza).

meal(X):-food(X).

%%%%%%%%%%%%%%%%%%%%% Question 2

studies(charlie,csc135).
studies(olivia,csc135).
studies(jack,csc131).
studies(arthur,csc134).

teaches(kirke,csc135).
teaches(collins,csc131).
teaches(collins,csc134).

professor(X,Y):-teaches(X,C),studies(Y,C).

%%%%%%%%%%%%%%%%%%%%% Question 3

owns(jack,bmw).
owns(john,chevy).
owns(olivia,civic).
owns(jane,chevy).

sedan(bmw).
sedan(civic).
truck(chevy).

%%%%%%%%%%%%%%%%%%%%%% Question 13

c_to_f(C,F):-
    F is (C*9/5)+32.

%%%%%%%%%%%%%%%%%%%%%% Question 12

check_number(N):-
    N>0,write('The number is positive'),nl.
check_number(N):-
    N<0,write('The number is negative'),nl.
check_number(N):-
    N=:=0,write('The number is zero'),nl.

%%%%%%%%%%%%%%%%%%%%%%% Question 11

cube(N,Cube):-
    write('The cube of'),
    write(N),
    write('is'),
    Cube is N*N*N,
    write(Cube).
    
%%%%%%%%%%%%%%%%%%%%%%%% Question 10

maximun(A,B,Max):-
    A>B,Max is A.
maximun(A,B,Max):-
    A<B,Max is B.

%%%%%%%%%%%%%%%%%%%%%%% Question 9

sumation(A,B):-
    Sum is A+B.
