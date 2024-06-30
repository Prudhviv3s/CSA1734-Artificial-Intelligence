% Define the database of names and dates of birth.
% The format is dob(Name, DateOfBirth).

dob('Alice', '1990-01-01').
dob('Bob', '1985-05-12').
dob('Charlie', '1992-07-23').
dob('Diana', '1988-11-30').
dob('Eve', '1995-03-15').

% Query to find the date of birth of a given person.
% Usage: dob(Name, DateOfBirth).

% Query to find people born on a specific date.
% Usage: dob(Name, 'YYYY-MM-DD').

% Query to add a new person to the database.
add_person(Name, DOB) :-
    \+ dob(Name, _),  % Ensure the person is not already in the database.
    assertz(dob(Name, DOB)).

% Query to update the date of birth of an existing person.
update_dob(Name, NewDOB) :-
    retract(dob(Name, _)),
    assertz(dob(Name, NewDOB)).

% Query to remove a person from the database.
