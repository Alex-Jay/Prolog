% Non-Recursive Part (Stopping Condition)

concat([], L, L).

% Recursive Part

concat([H | L1], L2, [H | L3]) :-
	concat(L1, L2, L3).