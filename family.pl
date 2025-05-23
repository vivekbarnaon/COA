% ---------- Gender ----------
male(john).
male(robert).
male(michael).
male(david).
male(rahul).
male(ankit).

female(susan).
female(linda).
female(mary).
female(riya).
female(neha).
female(anu).

% ---------- Parent Relationships ----------
parent(john, robert).
parent(susan, robert).
parent(john, linda).
parent(susan, linda).

parent(robert, michael).
parent(mary, michael).
parent(robert, riya).
parent(mary, riya).

parent(linda, david).
parent(rahul, david).
parent(linda, neha).
parent(rahul, neha).

parent(riya, ankit).
parent(ankit, anu).  % For in-law relations

% ---------- Spouse Relationships ----------
spouse(john, susan).
spouse(susan, john).

spouse(robert, mary).
spouse(mary, robert).

spouse(linda, rahul).
spouse(rahul, linda).

spouse(riya, ankit).
spouse(ankit, riya).

% ---------- Inference Rules ----------

% 1. mother
mother(M, C) :- parent(M, C), female(M).

% 2. father
father(F, C) :- parent(F, C), male(F).

% 3. son
son(S, P) :- parent(P, S), male(S).

% 3. daughter
daughter(D, P) :- parent(P, D), female(D).

% 4. uncle
uncle(U, C) :-
    parent(P, C),
    sibling(U, P),
    male(U).

% 4. aunt
aunt(A, C) :-
    parent(P, C),
    sibling(A, P),
    female(A).

% 5. maternal_grandmother
maternal_grandmother(MGM, C) :-
    mother(M, C),
    mother(MGM, M).

% 5. maternal_grandfather
maternal_grandfather(MGF, C) :-
    mother(M, C),
    father(MGF, M).

% 6. paternal_grandmother
paternal_grandmother(PGM, C) :-
    father(F, C),
    mother(PGM, F).

% 6. paternal_grandfather
paternal_grandfather(PGF, C) :-
    father(F, C),
    father(PGF, F).

% 7. siblings
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 8. wife
wife(W, H) :-
    spouse(H, W),
    female(W).

% 9. son-in-law
sonin_law(SIL, P) :-
    child(C, P),
    spouse(SIL, C),
    male(SIL).

% 10. daughter-in-law
daughterin_law(DIL, P) :-
    child(C, P),
    spouse(DIL, C),
    female(DIL).

% Helper: child
child(C, P) :- parent(P, C).
