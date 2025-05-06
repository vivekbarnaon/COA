list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.


%Find the k-th Element of a List
kth_element(1, [H|_], H).
kth_element(K, [_|T], X) :-
    K > 1,
    K1 is K - 1,
    kth_element(K1, T, X).

%Check Whether X is Present in the List

is_member(X, [X|_]).
is_member(X, [_|T]) :-
    is_member(X, T).

%Check if Elements Are Vowels or Digits


vowel(a). vowel(e). vowel(i). vowel(o). vowel(u).
digit(0). digit(1). digit(2). digit(3). digit(4).
digit(5). digit(6). digit(7). digit(8). digit(9).

check_list([]).
check_list([H|T]) :-
    (vowel(H) -> write(H), write(' is a vowel'), nl ;
     digit(H) -> write(H), write(' is a digit'), nl ;
     write(H), write(' is neither vowel nor digit'), nl),
    check_list(T).
