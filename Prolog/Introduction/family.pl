% Figure 1.8 - Family Program.

parent(pam, bob).					% Pam is a parent of Bob
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).						% Pam is female
female(liz).
female(ann).
female(pat).
male(jim).
male(tom).							% Tom is male
male(bob).

offspring(X, Y) :-					% Y is an offspring of X if
	parent(X, Y).					% X is parent of Y
	
mother(X, Y) :-						% X is mother of Y if
	parent(X, Y),					% X is parent of Y and
	female(X).						% X is female
	
grandparent(X, Z) :-				% X is grandparent of Z if | gp(X,Z) <- [p(X,Y)^p(Y,Z)]
	parent(X, Y),					% X is parent of Y and
	parent(Y, Z).					% Y is parent of Z
	
different(X, Y) :-
	X==Y,
	!,
	false.
	
different(X, Y).
	
sister(X, Y) :-						% X is sister of Y if
	parent(Z, X),
	parent(Z, Y),					% X and Y have the same parent and
	female(X),						% X is female and
	different(X, Y).				% X and Y are different
	
predecessor(X, Z) :-				% Rule pr1: X is a predecessor of Z
	parent(X, Z).
	
predecessor(X, Z) :-				% Rule pr2: X is a predecessor of Z
	parent(X, Y),
	predecessor(Y, Z).
	
sibling(X, Y) :-
	parent(P, X),
	parent(P, Y),
	different(X, Y).				% if X is not Y

immediatefamily(X, Y) :-
	parent(X, Y).
	
immediatefamily(X, Y) :-
	sibling(X, Y).