% Define the database of students, teachers, and subject codes.
% The format is teaches(Teacher, SubjectCode) and studies(Student, SubjectCode).

% Facts about which teacher teaches which subject.
teaches('Mr. Smith', 'CS101').
teaches('Mrs. Johnson', 'MATH204').
teaches('Mr. Brown', 'PHY301').
teaches('Ms. Davis', 'ENG102').
teaches('Mrs. Lee', 'BIO202').

% Facts about which student studies which subject.
studies('Alice', 'CS101').
studies('Alice', 'MATH204').
studies('Bob', 'CS101').
studies('Bob', 'PHY301').
studies('Charlie', 'ENG102').
studies('Diana', 'BIO202').
studies('Eve', 'MATH204').
studies('Eve', 'PHY301').

% Query to find the teacher of a specific subject.
% Usage: teaches(Teacher, 'SubjectCode').

% Query to find the subjects a specific student studies.
% Usage: studies(Student, 'SubjectCode').

% Query to find the students who study a specific subject.
students_of_subject(SubjectCode, Students) :-
    findall(Student, studies(Student, SubjectCode), Students).

% Query to find the subjects taught by a specific teacher.
subjects_by_teacher(Teacher, Subjects) :-
    findall(SubjectCode, teaches(Teacher, SubjectCode), Subjects).

% Query to find the teacher(s) of a specific student.
teachers_of_student(Student, Teachers) :-
    findall(Teacher, (studies(Student, SubjectCode), teaches(Teacher, SubjectCode)), Teachers).

% Query to add a new teacher-subject relationship.
add_teacher_subject(Teacher, SubjectCode) :-
    \+ teaches(Teacher, SubjectCode),  % Ensure the relationship does not already exist.
    assertz(teaches(Teacher, SubjectCode)).

% Query to add a new student-subject relationship.
add_student_subject(Student, SubjectCode) :-
    \+ studies(Student, SubjectCode),  % Ensure the relationship does not already exist.
    assertz(studies(Student, SubjectCode)).

% Query to remove a teacher-subject relationship.
remove_teacher_subject(Teacher, SubjectCode) :-
    retract(teaches(Teacher, SubjectCode)).

% Query to remove a student-subject relationship.
remove_student_subject(Student, SubjectCode) :-
    retract(studies(Student, SubjectCode)).

% Query to list all teacher-subject relationships.
list_all_teachers_subjects :-
    findall(Teacher-SubjectCode, teaches(Teacher, SubjectCode), TeacherSubjects),
    print_teacher_subjects(TeacherSubjects).

% Query to list all student-subject relationships.
list_all_students_subjects :-
    findall(Student-SubjectCode, studies(Student, SubjectCode), StudentSubjects),
    print_student_subjects(StudentSubjects).

% Helper predicate to print the list of teacher-subject relationships.
print_teacher_subjects([]).
print_teacher_subjects([Teacher-SubjectCode | Rest]) :-
    format('Teacher: ~w, Subject: ~w~n', [Teacher, SubjectCode]),
    print_teacher_subjects(Rest).

% Helper predicate to print the list of student-subject relationships.
print_student_subjects([]).
print_student_subjects([Student-SubjectCode | Rest]) :-
    format('Student: ~w, Subject: ~w~n', [Student, SubjectCode]),
    print_student_subjects(Rest).
