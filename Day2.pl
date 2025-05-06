% factorial(N, F) means F is the factorial of N

factorial(0, 1).  % Base case
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
% gcd(A, B, G) means G is the GCD of A and B

gcd(A, 0, A) :- A > 0.   % Base case
gcd(A, B, G) :-
    B > 0,
    R is A mod B,
    gcd(B, R, G).
