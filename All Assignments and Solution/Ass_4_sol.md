# 📚✨ **Assignment 4 Final Version**  
*(Program + Comments + Explanation + Sample Query + Output)*

---

## **1. Tower of Hanoi**

### ✏️ Program
```prolog
% Rule to solve Tower of Hanoi
move(1, Source, Destination, _) :-
    write('Move top disk from '), write(Source),
    write(' to '), write(Destination), nl.

move(N, Source, Destination, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    move(N1, Source, Auxiliary, Destination),
    move(1, Source, Destination, _),
    move(N1, Auxiliary, Destination, Source).
```

### 🧠 Explanation
- Move `N-1` disks to Auxiliary.
- Move the last disk to Destination.
- Move the `N-1` disks from Auxiliary to Destination.

### 🔎 Sample Query
```prolog
?- move(3, source, destination, auxiliary).
```

### 📋 Output
```prolog
Move top disk from source to destination
Move top disk from source to auxiliary
Move top disk from destination to auxiliary
Move top disk from source to destination
Move top disk from auxiliary to source
Move top disk from auxiliary to destination
Move top disk from source to destination
true.
```

---

## **2. Depth First Search (DFS)**

### ✏️ Program
```prolog
% Graph facts
graph(a,b).
graph(a,c).
graph(b,d).
graph(b,e).
graph(c,f).
graph(c,g).

% Goal nodes
goal(f).
goal(g).

% Member check
member(X, [X|_]).
member(X, [_|Tail]) :- member(X, Tail).

% Solve predicate
solve(Node, Solution) :- dfs([], Node, Solution).

% DFS rule
dfs(Path, Node, [Node|Path]) :- goal(Node).

dfs(Path, Node, Solution) :-
    graph(Node, Node1),
    not(member(Node1, Path)),
    dfs([Node|Path], Node1, Solution).
```

### 🧠 Explanation
- Start from Node.
- Explore as deep as possible.
- Stop when reaching goal (F or G).

### 🔎 Sample Query
```prolog
?- solve(a, Sol).
```

### 📋 Output
```prolog
Sol = [f, c, a] ;
Sol = [g, c, a] ;
false.
```

---

## **3. Breadth First Search (BFS)**

### ✏️ Program
```prolog
% Graph facts
graph(a,b).
graph(a,c).
graph(b,d).
graph(b,e).
graph(c,f).
graph(c,g).

% Goal nodes
goal(f).
goal(g).

% Solve predicate for BFS
solve1(Start, Solution) :- bfs([[Start]], Solution).

% BFS rule
bfs([[Node|Path]|_], [Node|Path]) :-
    goal(Node).

bfs([Path|Paths], Solution) :-
    extend(Path, NewPaths),
    conc(Paths, NewPaths, Paths1),
    bfs(Paths1, Solution).

% Extend path
extend([Node|Path], NewPaths) :-
    bagof([NewNode, Node|Path],
          (graph(Node, NewNode), not(member(NewNode, [Node|Path]))),
          NewPaths), !.
extend(_, []).

% Concatenation of paths
conc([], L2, L2).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).
```

### 🧠 Explanation
- BFS explores level-by-level (shallow first).
- Extend paths and check for goal nodes.

### 🔎 Sample Query
```prolog
?- solve1(a, Solution).
```

### 📋 Output
```prolog
Solution = [f, c, a] ;
Solution = [g, c, a] ;
false.
```

---

## **4. Find All Paths between Two Nodes**

### ✏️ Program
```prolog
% Edge facts
edge(1,2).
edge(1,6).
edge(2,3).
edge(2,5).
edge(2,6).
edge(3,4).
edge(3,5).
edge(4,5).
edge(5,6).

% Undirected connection
connected(X, Y) :- edge(X, Y); edge(Y, X).

% Find a path from A to B
path(A, B, Path) :-
    traverse(A, B, [A], Q),
    reverse(Q, Path).

% Direct connection
traverse(A, B, P, [B|P]) :-
    connected(A, B).

% Indirect connection
traverse(A, B, Visited, Path) :-
    connected(A, C),
    C \== B,
    not(member(C, Visited)),
    traverse(C, B, [C|Visited], Path).
```

### 🧠 Explanation
- Use `traverse` to find paths by exploring neighbors.
- Reverse the result to display in correct order.

### 🔎 Sample Query
```prolog
?- path(1,4,Path).
```

### 📋 Output (Multiple Paths)
```prolog
Path = [1, 2, 3, 4] ;
Path = [1, 2, 3, 5, 4] ;
Path = [1, 2, 5, 4] ;
Path = [1, 2, 5, 3, 4] ;
Path = [1, 2, 6, 5, 4] ;
Path = [1, 2, 6, 5, 3, 4] ;
Path = [1, 6, 2, 3, 4] ;
Path = [1, 6, 2, 3, 5, 4] ;
Path = [1, 6, 2, 5, 4] ;
Path = [1, 6, 2, 5, 3, 4] ;
Path = [1, 6, 5, 4] ;
Path = [1, 6, 5, 2, 3, 4] ;
Path = [1, 6, 5, 3, 4] ;
false.
```

---

## **5. Count All Possible Paths between Two Nodes**

### ✏️ Program
```prolog
% Count paths from A to B
count_paths(A, B, Count) :-
    findall(Path, path(A, B, Path), Paths),
    length(Paths, Count).
```

### 🧠 Explanation
- Use `findall` to collect all paths.
- Use `length` to count them.

### 🔎 Sample Query
```prolog
?- count_paths(1,4,Count).
```

### 📋 Output
```prolog
Count = 13.
```

---
