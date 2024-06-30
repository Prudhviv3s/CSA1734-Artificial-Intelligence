% Define the graph as edges with costs
edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 4).
edge(b, e, 2).
edge(c, f, 3).
edge(c, g, 2).
edge(d, h, 1).
edge(e, h, 3).
edge(f, h, 2).
edge(g, h, 2).

% Define heuristic values for nodes
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 4).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 3).
heuristic(g, 3).
heuristic(h, 0).

% Best First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search([[Start]], Goal, Path).

best_first_search([[Goal|Path]|_], Goal, [Goal|Path]).
best_first_search([CurrentPath|Paths], Goal, FinalPath) :-
    extend(CurrentPath, NewPaths),
    append(Paths, NewPaths, AllPaths),
    sort_paths(AllPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath).

% Extend the current path by exploring all connected nodes
extend([Node|Path], NewPaths) :-
    findall([NewNode, Node|Path],
            (edge(Node, NewNode, _), \+ member(NewNode, [Node|Path])),
            NewPaths).

% Sort paths based on the heuristic value of the current node
sort_paths(Paths, SortedPaths) :-
    map_list_to_pairs(path_cost, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, SortedPaths).

% Calculate the cost of the path (heuristic of the current node)
path_cost([Node|_], Cost) :-
    heuristic(Node, Cost).

% Query to find the path from a start node to a goal node
% ?- best_first_search(a, h, Path).
