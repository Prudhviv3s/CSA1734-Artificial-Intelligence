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
    infer(go_outside),
    fact(sunny).

rule(watch_movie) :-
    fact(weekend),
    fact(raining).

% Backward chaining procedure
infer(Fact) :-
    fact(Fact).

infer(Fact) :-
    rule(Fact).

% Queries: Check if a specific fact can be derived
query(Fact) :-
    infer(Fact).

% Reset facts (useful for multiple queries)
reset_facts :-
    retractall(fact(_)),
    assert(fact(sunny)),
    assert(fact(weekend)).
