% Graph edges
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, f).
edge(f, g).

%DFS traversal from Start to Goal
dfs(Start, Goal, Path) :-
    dfs_util(Start, Goal, [Start], Path).

dfs_util(Goal, Goal, Path, Path).
dfs_util(Current, Goal, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),  % Avoid revisiting nodes
    dfs_util(Next, Goal, [Next | Visited], Path).
% BFS traversal from Start to Goal
bfs(Start, Goal, Path) :-
    bfs_util([[Start]], Goal, Path).

bfs_util([[Goal | Rest] | _], Goal, Path) :-
    reverse([Goal | Rest], Path).

bfs_util([[Current | Visited] | Queue], Goal, Path) :-
    findall([Next, Current | Visited],
            (edge(Current, Next), \+ member(Next, Visited)),
            NextPaths),
    append(Queue, NextPaths, NewQueue),
    bfs_util(NewQueue, Goal, Path).
