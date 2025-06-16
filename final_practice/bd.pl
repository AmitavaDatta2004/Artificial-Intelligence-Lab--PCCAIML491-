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

dfs(Node, [Node]) :-         % If Node is goal, done
    goal(Node).

dfs(Node, [Node|Path]) :-    % Else explore neighbors
    graph(Node, Next),
    dfs(Next, Path).


bfs([[Node|Path]|_], Result) :-  % If goal found
    goal(Node),
    reverse([Node|Path], Result).

bfs([[Node|Path]|Rest], Result) :-  % Else explore neighbors
    findall([Next,Node|Path],
            graph(Node, Next),
            NewPaths),
    append(Rest, NewPaths, Queue),
    bfs(Queue, Result).
