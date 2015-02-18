%% @author HassanNazar

-module(mandel).

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

mandelbrot(Width, Height, X, Y, K, Depth) ->
	Trans = fun(W, H) ->
		cmplx:new(X + K*(W-1), Y-K*(H-1))
		end,
	rows(Width, Height, Trans, Depth, []).

rows(_,0,_,_,List)->
  	List;

rows(Width, Height, Trans, Depth, List)->
	Row = row(Width, Height, Trans, Depth, []),
	rows(Width, Height-1, Trans, Depth, [Row | List]).

row(0, _, _, _, Row)->
	Row;

row(Width, Height, Trans, Depth, Row)->
	Cmplx_Dpth = brot:mandelbrot(Trans(Width,Height),Depth),
	Cmplx_Clr = color:convert(Cmplx_Dpth, Depth),
	row(Width-1, Height, Trans, Depth, [Cmplx_Clr | Row]).
	
demo() ->
	small(-2.6,1.2,1.6).

small(X,Y,X1) ->
	Width = 960,
	Height = 540,
	K = (X1 - X)/Width,
	Depth = 64,
	T0 = now(),
	Image = mandelbrot(Width, Height, X, Y, K, Depth),
	T = timer:now_diff(now(), T0),
	io:format("picture generated in ~w ms~n", [T div 1000]),
	ppm:write("c:/Users/HassanNazar/Documents/GitHub/sem4/src/small.ppm", Image).

%% ====================================================================
%% Internal functions
%% ====================================================================


