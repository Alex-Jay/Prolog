del(X, [X | T], T).

del(X, [H | T], [H | A]) :- del(X, T, A).

not_member(X,L) :- not(del(X, L, _)).	% Determine if not() a member of list

action(state(X,Y),
	fill_from_4(X,Y),		% Fill 7 from 4
	state(7,Z)) :-
		Z is (X + Y) - 7,
		Z > 7.

action(state(X,Y),
	fill_from_7(X,Y),		% Fill 4 from 7
	state(Z,4)) :-
		Z is (X + Y) - 4,
		Z >= 4.

action(state(X,Y),
	empty_into_7(X,Y),		% Empty 4 into 7
	state(Z,0)) :-
		Z is (X + Y),
		Z =< 7.

action(state(X,Y),
	empty_into_4(X,Y),		% Empty 7 into 4
	state(0,Z)) :-
		Z is (X + Y),
		Z =< 4.

action(state(X,Y),
	fill(X),			% Fill 7
	state(7,Y)).

action(state(X,Y),
	fill(Y),			% Fill 4
	state(X,7)).

action(state(X,Y),
	empty(X),			% Empty 7
	state(0,Y)).

action(state(X,Y),
	empty(Y),			% Empty 4
	state(X,0)).

solve(state(5,_) , Res, Res).

solve(State1, Curr, Res) :-
	action(State1, Move, State2),
	solve(State2, [Move|Curr], Res).

% Example: solve(state(0, 0 ), [], L). 