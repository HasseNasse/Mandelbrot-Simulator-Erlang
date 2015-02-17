%% @author HassanNazar


-module(cmplx).
-compile(export_all).

%% ====================================================================
%% API functions
%% ====================================================================

%returns the complex number with real value X and imaginary Y
new(X, Y)->
	{X,Y}.

% Addition of two complex numbers A,B
add(A,B)->
	case A of
		{A1,A2}->
			case B of
				{B1,B2}->
					{A1+B1,A2+B2}; % (A+Bi)+(C+Di)=(A+C)+(B+D)i
			true->
				'Not a valid input!'
			end;
		true-> 
			'Not a valid input!'
	end.

% Will return the sqr of A
sqr(A)->
	case A of
		{A1,A2}->
			{((A1*A1)+(A2*A2))*(-1)}; % (A+Bi)²=-1(A²+B²)
		true-> 
			'Not a valid input!'
	end.

% Will return the absolute Val. of A
abs(A)->
	case A of
		{A1,A2}->
			math:sqrt(((A1*A1)+(A2*A2)));
		true-> 
			'Not a valid input!'
	end.
	%Use sqrt/1 func from Math lib when counting abs value........
	

%% ====================================================================
%% Internal functions
%% ====================================================================


