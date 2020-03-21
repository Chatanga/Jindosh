% lady(name, color, drink, place, object)

:- initialization(jindosh(true)).

jindosh(ShowResult) :-
	ladies(Ladies),

	member_of(lady(contee, red, _, _, _), Ladies),
	Ladies = [lady(natsiou, _, _, _, _), _, _, _, _],
	right_of(lady(_, white, _, _, _), lady(natsiou, _, _, _, _), Ladies),
	right_of(lady(_, green, _, _, _), lady(_, purple, _, _, _), Ladies),
	member_of(lady(_, purple, whisky, _, _), Ladies),
	member_of(lady(_, blue, _, dunwall, _), Ladies),
	next_to(lady(_, _, _, dunwall, _), lady(_, _, _, _, ring), Ladies),
	member_of(lady(finch, _, _, _, pendant), Ladies),
	member_of(lady(_, _, _, dabokva, diamond), Ladies),
	next_to(lady(_, _, _, fraeport, _), lady(_, _, _, _, snuffbox), Ladies),
	next_to(lady(_, _, _, fraeport, _), lady(_, _, bier, _, _), Ladies),
	member_of(lady(winslow, _, wine, _, _), Ladies),
	member_of(lady(_, _, absinthe, balelou, _), Ladies),
	Ladies = [_, _, lady(_, _, rhum, _, _), _, _],
	member_of(lady(marcolla, _, _, karnaca, _), Ladies),
	member_of(lady(_, _, _, _, medal), Ladies),

	(   ShowResult = true ->
	    print_ladies(Ladies)
	;   true).

ladies([
	lady(_, _, _, _, _),
	lady(_, _, _, _, _),
	lady(_, _, _, _, _),
	lady(_, _, _, _, _),
	lady(_, _, _, _, _)
]).

right_of(A, B, [B, A | _]).
right_of(A, B, [_ | Y]) :- right_of(A, B, Y).

next_to(A, B, [A, B | _]).
next_to(A, B, [B, A | _]).
next_to(A, B, [_ | Y]) :- next_to(A, B, Y).

member_of(X, [X|_]).
member_of(X, [_|Y]) :- member_of(X, Y).

print_ladies([]).
print_ladies([A|B]) :-
	write(A), nl,
	print_ladies(B).

