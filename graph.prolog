% Edges with costs
edge(a, b, 2).
edge(b, a, 2).
edge(a, c, 3).
edge(c, a, 3).
edge(a, f, 4).
edge(f, a, 4).
edge(b, c, 2).
edge(c, b, 2).
edge(c, d, 3).
edge(d, c, 3).
edge(c, e, 1).
edge(e, c, 1).
edge(d, f, 5).
edge(f, d, 5).

% Base case: direct connection
find_path(Start, End, Cost, Path) :-
    find_path(Start, End, Cost, Path, []).

% If Start and End are directly connected and End has not been visited
find_path(Start, End, Cost, [Start, End], Visited) :-
    edge(Start, End, Cost),
    \+ member(End, Visited).

% Recursive case: go through intermediate nodes
find_path(Start, End, TotalCost, [Start|TailPath], Visited) :-
    edge(Start, X, InitCost),
    \+ member(X, Visited),
    find_path(X, End, RestCost, TailPath, [Start|Visited]),
    TotalCost is InitCost + RestCost.
