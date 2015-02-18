%% @author HassanNazar

-module(brot).
-compile(export_all).

%% ====================================================================
%% API functions
%% ====================================================================

mandelbrot(C, M) ->
	Z0 = cmplx:new(0,0),
	I = 0,
	test(I, Z0, C, M).

%The test/4 function should of course test if we have reached the max-
%imum iteration, in which case it returns zero, or if the absolute value of Z
%is greater than 2, in which case it returns I.
test(_,_,_,0)->
	0;

test(I, Z0, C, M)->
	Znew = cmplx:add(cmplx:sqr(Z0), C),
    Abs = cmplx:abs(Znew),
    if  
		Abs >= 2 ->
		    I;
		true ->
		    test(I+1,Znew,C,M-1)       
    end.



	