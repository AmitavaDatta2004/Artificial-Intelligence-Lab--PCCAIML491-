%facts 
edge(1,2). 
edge(1,6). 
edge(2,3). 
edge(2,5). 
edge(2,6). 
edge(3,4). 
edge(3,5). 
edge(4,5). 
edge(5,6).

goal(1).
goal(2).
goal(3).
goal(4).
goal(5).
goal(6).

dfs(Node,[Node]):-
    goal(Node).

dfs(Node,[Node|Path]):-
    edge(Node,Next),
    dfs(Next,Path).

bfs([[Node|Path]|_],Result,1):-
    goal(Node),
    reverse([Node|Path],Result).

bfs([[Node|Path]|Rest],Result,N):-
    findall(
        [Next,Node|Path],
        edge(Node,Next),
        NewPaths
    ),
    append(Rest,NewPaths,Queue),
    bfs(Queue,Result,N1),
    N is N1 +1.
