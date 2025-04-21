# 📚✨ **Assignment 3 Final Version**  
*(with Program + Comments + Explanation + Sample Query + Output)*

---

## **1. Member Check in List**

### ✏️ Program
```prolog
% Rule to check if X is a member of the list
mem_chck(X, [X|_]).
mem_chck(X, [_|T]) :- mem_chck(X, T).
```

### 🧠 Explanation
- Check if X matches head or recursively search in tail.

### 🔎 Sample Query
```prolog
?- mem_chck(3, [7,6,9,1]).
```

### 📋 Output
```prolog
false.
```

---

## **2. Find Length of List**

### ✏️ Program
```prolog
% Rule to find the length of the list
length1([], 0).
length1([_|T], N) :-
    length1(T, N1),
    N is N1 + 1.
```

### 🧠 Explanation
- Base case: Empty list has length 0.
- Recursive case: Length = 1 + Length of Tail.

### 🔎 Sample Query
```prolog
?- length1([sam,1,4,rat], Z).
```

### 📋 Output
```prolog
Z = 4.
```

---

## **3. Concatenation of Two Lists**

### ✏️ Program
```prolog
% Rule to concatenate two lists
concat([], L, L).
concat([H|T], L2, [H|T3]) :-
    concat(T, L2, T3).
```

### 🧠 Explanation
- Adding elements of first list to the front of the second list.

### 🔎 Sample Query
```prolog
?- concat([1,2], [7,8], L3).
```

### 📋 Output
```prolog
L3 = [1, 2, 7, 8].
```

---

## **4. Delete an Element from List**

### ✏️ Program
```prolog
% Rule to delete first occurrence of X from the list
delete1(_, [], []).
delete1(X, [X|T], T).
delete1(X, [H|T], [H|R]) :-
    X \= H,
    delete1(X, T, R).
```

### 🧠 Explanation
- If head matches X, remove it; else keep traversing.

### 🔎 Sample Query
```prolog
?- delete1(2, [1,2,9,0], R).
```

### 📋 Output
```prolog
R = [1, 9, 0].
```

---

## **5. Insert Element Anywhere in List**

### ✏️ Program
```prolog
% Rule to insert element X at any position
list_insert(X, L, [X|L]).
list_insert(X, [H|T], [H|R]) :-
    list_insert(X, T, R).
```

### 🧠 Explanation
- Insertion possible at every point recursively.

### 🔎 Sample Query
```prolog
?- list_insert(2, [3,8,9], R).
```

### 📋 Output
```prolog
R = [2, 3, 8, 9] ;
R = [3, 2, 8, 9] ;
R = [3, 8, 2, 9] ;
R = [3, 8, 9, 2] ;
false.
```

---

## **6. Check if List is Sorted**

### ✏️ Program
```prolog
% Rule to check if list is sorted in ascending order
list_order([]).
list_order([_]).
list_order([X,Y|T]) :-
    X =< Y,
    list_order([Y|T]).
```

### 🧠 Explanation
- Check every pair if first ≤ second.

### 🔎 Sample Queries and 📋 Outputs
```prolog
?- list_order([1,0,3,4]).
false.

?- list_order([1,2,3,4]).
true.
```

---

## **7. Sum of Elements in a List**

### ✏️ Program
```prolog
% Rule to find sum of elements
sum1([], 0).
sum1([H|T], Sum) :-
    sum1(T, Sum1),
    Sum is H + Sum1.
```

### 🧠 Explanation
- Add head to sum of tail recursively.

### 🔎 Sample Query
```prolog
?- sum1([5,8], R).
```

### 📋 Output
```prolog
R = 13.
```

---

## **8. Check Even or Odd Length of List**

### ✏️ Program
```prolog
% Rule to check if list has even number of elements
list_even_len(L) :-
    length1(L, Len),
    0 is Len mod 2.

% Helper: Length calculation
length1([], 0).
length1([_|T], N) :-
    length1(T, N1),
    N is N1 + 1.
```

### 🧠 Explanation
- Find list length and check if divisible by 2.

### 🔎 Sample Queries and 📋 Outputs
```prolog
?- list_even_len([1,2,3]).
false.

?- list_even_len([1,2,3,5]).
true.
```

---

## **9. Reverse a List**

### ✏️ Program
```prolog
% Rule to reverse a list
list_rev([], []).
list_rev([H|T], R) :-
    list_rev(T, R1),
    append(R1, [H], R).

% Helper append rule
append([], L, L).
append([H|T], L2, [H|R]) :-
    append(T, L2, R).
```

### 🧠 Explanation
- Move head to end recursively using `append`.

### 🔎 Sample Query
```prolog
?- list_rev([1,2,3], R).
```

### 📋 Output
```prolog
R = [3, 2, 1].
```

---

## **10. Shift List Left**

### ✏️ Program
```prolog
% Rule to shift list elements left
list_shift([H|T], R) :-
    append(T, [H], R).
```

### 🧠 Explanation
- Move first element to last position.

### 🔎 Sample Query
```prolog
?- list_shift([1,2,3], T).
```

### 📋 Output
```prolog
T = [2, 3, 1].
```

---

