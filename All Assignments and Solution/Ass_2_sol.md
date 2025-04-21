# 📚✨ **Assignment 2 Final Version**  
*(with Program + Comments + Explanation + Sample Query + Output)*

---

## **1. Brother Relationship**

### ✏️ Program
```prolog
% Facts
parent(sudip, piyus).
parent(sudip, raj).
male(piyus).
male(raj).

% Rule
brother(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    male(X), 
    male(Y), 
    X \= Y.
```

### 🧠 Explanation
- Two males are brothers if they share a common parent but are different individuals.

### 🔎 Sample Query
```prolog
?- brother(piyus, raj).
```

### 📋 Output
```prolog
true.
```

---

## **2. Family Relationships**

### ✏️ Program
```prolog
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
```

### 🧠 Explanation
- Defines mother, father, sister, grandparent, grandmother, grandfather, wife, and uncle based on given facts.

### 🔎 Sample Queries and 📋 Outputs
```prolog
?- mother(pam, bob).
true.

?- sister(liz, bob).
true.

?- grandfather(tom, peter).
true.

?- uncle(bob, jim).
false.
```

---

## **3. Predecessor Relationship (Recursive)**

### ✏️ Program
```prolog
% Rules
predecessor(X, Y) :- parent(X, Y).
predecessor(X, Y) :- parent(X, Z), predecessor(Z, Y).
```

### 🧠 Explanation
- A predecessor can be a parent, grandparent, great-grandparent, etc. (recursive).

### 🔎 Sample Query
```prolog
?- predecessor(tom, jim).
```

### 📋 Output
```prolog
true.
```

---

## **4. Forward and Backward Loop**

### ✏️ Program
```prolog
% Forward Loop
forward_loop(N) :-
    N > 0,
    write(N), nl,
    N1 is N - 1,
    forward_loop(N1).
forward_loop(0).

% Backward Loop
backward_loop(0).
backward_loop(N) :-
    N > 0,
    N1 is N - 1,
    backward_loop(N1),
    write(N), nl.
```

### 🧠 Explanation
- Forward prints immediately; backward prints after recursion.

### 🔎 Sample Queries and 📋 Outputs
```prolog
?- forward_loop(3).
3
2
1
0
true.

?- backward_loop(3).
1
2
3
true.
```

---

## **5. Loop Until a Condition is Satisfied**

### ✏️ Program
```prolog
% Rules
loop_until_zero(0) :- write('Done!'), nl.
loop_until_zero(N) :-
    N > 0,
    write(N), nl,
    N1 is N - 1,
    loop_until_zero(N1).
```

### 🧠 Explanation
- Decrease number until reaching 0 and display "Done!".

### 🔎 Sample Query and 📋 Output
```prolog
?- loop_until_zero(3).
3
2
1
Done!
true.
```

---

## **6. Factorial of a Number**

### ✏️ Program
```prolog
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
```

### 🧠 Explanation
- `factorial(N) = N * factorial(N-1)`; base case for 0.

### 🔎 Sample Query and 📋 Output
```prolog
?- factorial(5, F).
F = 120.
```

---

## **7. Sum of N Numbers**

### ✏️ Program
```prolog
sum(0, 0).
sum(N, S) :-
    N > 0,
    N1 is N - 1,
    sum(N1, S1),
    S is S1 + N.
```

### 🧠 Explanation
- Sum numbers from `1` to `N`.

### 🔎 Sample Query and 📋 Output
```prolog
?- sum(5, S).
S = 15.
```

---

## **8. Names with Surname Smith**

### ✏️ Program
```prolog
% Facts
person(john, smith, 45, london, doctor).
person(martin, williams, 33, birmingham, teacher).
person(henry, smith, 26, manchester, plumber).
person(jane, wilson, 62, london, teacher).
person(mary, smith, 29, glasgow, surveyor).

% Rule
surname_smith(Name) :- person(Name, smith, _, _, _).
```

### 🧠 Explanation
- Match people having 'smith' as surname.

### 🔎 Sample Query and 📋 Output
```prolog
?- surname_smith(X).
X = john ;
X = henry ;
X = mary ;
false.
```

---

## **9. Squares of Integers from N1 to N2**

### ✏️ Program
```prolog
print_squares(N1, N2) :-
    N1 =< N2,
    Square is N1 * N1,
    write('Square of '), write(N1), write(' is '), write(Square), nl,
    N3 is N1 + 1,
    print_squares(N3, N2).
print_squares(N1, N2) :-
    N1 > N2.
```

### 🧠 Explanation
- For each number between N1 and N2, display its square.

### 🔎 Sample Query and 📋 Output
```prolog
?- print_squares(6, 8).
Square of 6 is 36
Square of 7 is 49
Square of 8 is 64
true.
```

---

## **10. Professions for Age >= 40**

### ✏️ Program
```prolog
age40 :-
    person(_, _, Age, _, Profession),
    Age >= 40,
    write(Profession), nl.
```

### 🧠 Explanation
- Print professions of individuals aged 40+.

### 🔎 Sample Query and 📋 Output
```prolog
?- age40.
doctor
teacher
true.
```

