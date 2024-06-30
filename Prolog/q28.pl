% Facts: Define symptoms for various diseases
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, sore_throat).
symptom(flu, headache).
symptom(flu, tiredness).

symptom(cold, cough).
symptom(cold, sneezing).
symptom(cold, runny_nose).
symptom(cold, sore_throat).

symptom(covid19, fever).
symptom(covid19, cough).
symptom(covid19, tiredness).
symptom(covid19, loss_of_taste_or_smell).

symptom(allergy, sneezing).
symptom(allergy, runny_nose).
symptom(allergy, itchy_eyes).
symptom(allergy, headache).

% Rule: Determine if a disease has a specific symptom
has_symptom(Disease, Symptom) :-
    symptom(Disease, Symptom).

% Rule: Diagnose a disease based on a list of symptoms
diagnose(Disease, Symptoms) :-
    findall(S, symptom(Disease, S), DiseaseSymptoms),
    subset(DiseaseSymptoms, Symptoms).

% Utility to check if a list is a subset of another
subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Query to diagnose based on given symptoms
% ?- diagnose(Disease, [fever, cough, headache]).

% Rule: Provide possible diagnoses based on symptoms
possible_diagnoses(Symptoms, Diseases) :-
    findall(Disease, diagnose(Disease, Symptoms), Diseases).
