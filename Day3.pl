% Arithmetic operations
add(X, Y, R) :- R is X + Y.
subtract(X, Y, R) :- R is X - Y.
multiply(X, Y, R) :- R is X * Y.
divide(X, Y, R) :- Y =\= 0, R is X / Y.
modulus(X, Y, R) :- Y =\= 0, R is X mod Y.
power(X, Y, R) :- R is X ** Y.

%Sum of a List
sum_list([], 0).
sum_list([H|T], Total) :-
    sum_list(T, Rest),
    Total is H + Rest.
%Average of a List
average(List, Avg) :-
    sum_list(List, Sum),
    length(List, Len),
    Len > 0,
    Avg is Sum / Len.
%Max Element in a List
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, TempMax),
    Max is max(H, TempMax).
