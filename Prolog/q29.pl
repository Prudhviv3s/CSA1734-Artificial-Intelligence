% Facts: Initial known facts
fact(sunny).
fact(weekend).

% Rules: Define rules to infer new facts
rule(go_outside) :-
    fact(sunny),
    fact(weekend).

rule(take_umbrella) :-
    fact(raining).

rule(play_sports) :-
    fact(go_outside),
    fact(sunny).

rule(watch_movie) :-
    fact(weekend),
    fact(raining).

% Forward chaining procedure
forward_chain :-
    apply_rules,
    fail. % Force backtracking to apply all rules
forward_chain.

apply_rules :-
    rule(Fact),
    \+ fact(Fact), % If the fact is not already known
    assert(fact(Fact)),
    write('Derived: '), write(Fact), nl,
    fail. % Force backtracking to find more rules to apply
apply_rules.

% Queries: Check if a specific fact can be derived
query(Fact) :-
    forward_chain,
    fact(Fact).

% Reset facts (useful for multiple queries)
reset_facts :-
    retractall(fact(_)),
    assert(fact(sunny)),
    assert(fact(weekend)).
