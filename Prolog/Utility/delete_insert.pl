del(X, [X | T], T).
del(X, [H | T], [H | A]) :- del(X, T, A).

insert(X, L1, L2):- del(X, L2, L1).
insert(X, L):- del(X, L, _).