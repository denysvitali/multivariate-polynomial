variables(poly(Monomials), UniqueAndSorted) :-
	is_polynomial(poly(Monomials)),
	variables_worker(Monomials, [], Variables),
	sort(Variables, UniqueAndSorted). %sort already removes duplicates, so we are good

variables_worker([], CurrentVars, CurrentVars).
variables_worker([m(_Coefficient, _Degree, VarsPowers) | RestOfMonomials], CurrentVars, Answer) :-
	extract_vars(VarsPowers, CurrentVars, NewCurrentVars),
	variables_worker(RestOfMonomials, NewCurrentVars, Answer).

