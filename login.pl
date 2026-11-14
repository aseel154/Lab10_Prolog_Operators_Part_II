% Task 2 - Login Program

% Example dataset
user(aseel, 1234).
user(ali, 5678).
user(sara, 1111).

login :-
    check_login(3).

check_login(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check_user(Username, Password, Attempts).

check_user(Username, Password, _) :-
    user(Username, Password),
    write('Login Successful'),
    nl.

check_user(Username, Password, Attempts) :-
    \+ user(Username, Password),
    write('Login Unsuccessful'),
    nl,
    Remaining is Attempts - 1,
    check_login(Remaining).

check_login(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'),
    nl.
