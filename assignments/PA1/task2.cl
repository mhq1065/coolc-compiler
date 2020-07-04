

(*
   The class A2I provides integer-to-string and string-to-integer
conversion routines.  To use these routines, either inherit them
in the class where needed, have a dummy variable bound to
something of type A2I, or simpl write (new A2I).method(argument).
*)


(*
   c2i   Converts a 1-character string to an integer.  Aborts
         if the string is not "0" through "9"
*)
class A2I {

     c2i(char : String) : Int {
	if char = "0" then 0 else
	if char = "1" then 1 else
	if char = "2" then 2 else
        if char = "3" then 3 else
        if char = "4" then 4 else
        if char = "5" then 5 else
        if char = "6" then 6 else
        if char = "7" then 7 else
        if char = "8" then 8 else
        if char = "9" then 9 else
        { abort(); 0; }  -- the 0 is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   i2c is the inverse of c2i.
*)
     i2c(i : Int) : String {
	if i = 0 then "0" else
	if i = 1 then "1" else
	if i = 2 then "2" else
	if i = 3 then "3" else
	if i = 4 then "4" else
	if i = 5 then "5" else
	if i = 6 then "6" else
	if i = 7 then "7" else
	if i = 8 then "8" else
	if i = 9 then "9" else
	{ abort(); ""; }  -- the "" is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   a2i converts an ASCII string into an integer.  The empty string
is converted to 0.  Signed and unsigned strings are handled.  The
method aborts if the string does not represent an integer.  Very
long strings of digits produce strange answers because of arithmetic 
overflow.

*)
     a2i(s : String) : Int {
        if s.length() = 0 then 0 else
	if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
        if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
           a2i_aux(s)
        fi fi fi
     };

(*
  a2i_aux converts the usigned portion of the string.  As a programming
example, this method is written iteratively.
*)
     a2i_aux(s : String) : Int {
	(let int : Int <- 0 in	
           {	
               (let j : Int <- s.length() in
	          (let i : Int <- 0 in
		    while i < j loop
			{
			    int <- int * 10 + c2i(s.substr(i,1));
			    i <- i + 1;
			}
		    pool
		  )
	       );
              int;
	    }
        )
     };

(*
    i2a converts an integer to a string.  Positive and negative 
numbers are handled correctly.  
*)
    i2a(i : Int) : String {
	if i = 0 then "0" else 
        if 0 < i then i2a_aux(i) else
          "-".concat(i2a_aux(i * ~1)) 
        fi fi
    };
	
(*
    i2a_aux is an example using recursion.
*)		
    i2a_aux(i : Int) : String {
        if i = 0 then "" else 
	    (let next : Int <- i / 10 in
		i2a_aux(next).concat(i2c(i - next * 10))
	    )
        fi
    };

};

class List inherits IO
{
	isNil() : Bool 
	{
		--adding your code
		true
	};
	
	head() : String
	{
		--adding your code
		""
	};
	
	tail() : List
	{
		--adding your code
		{
			self;
		}
	};
	cons(i : String) : List
	{
		--adding your code
		(new Cons).init(i, self)
	};
};

class Cons inherits List
{
	first : String;
	rest :  List;
	isNil() : Bool
	{
		--adding your code
		false
	};
	head() : String
	{	
		--adding your code
		first
	};
	tail() : List
	{
		--adding your code
		rest
	};
	init(head : String, next : List) : List
	{
		--adding your code
		{
			first <- head;
			rest <- next;
			self;
		}
	};
};


class Main inherits IO
{
	stack : List;
	
	newline() : Object
	{
		out_string("\n")
	};
	
	prompt() : String
	{
		--adding your code
		{
			out_string(">");
			in_string();
		}
	};
	
	display_stack(s : List) : Object
	{
		--adding your code
		--out_string("hello\n");
		if s.isNil() then 
			out_string("")
		else
		{
			out_string(s.head());
			out_string("\n");
			display_stack(s.tail());
		}
		fi
		
	};
	
	main():Object
	{
		( let z : A2I <- new A2I  , stack : List <- new List in
			while true loop
			( let s : String <- prompt() in
				if s = "x" then
					abort()
				else
					if s = "d"  then
						display_stack(stack)
					else
					    if s = "e"  then
							{
								if stack.isNil() then out_string("")
								
								else
								if stack.head() = "+" then
									{
										stack <- stack.tail();
										(let a : Int <- new Int, b : Int <- new Int in 	
											--adding your code
											{
												--out_string(stack.head());
												a  <- z.a2i(stack.head());
												stack <- stack.tail();
												b  <- z.a2i(stack.head());
												stack <- stack.tail();
												a <- a + b;
												--out_string(z.i2a(a));
												stack <- stack.cons(z.i2a(a));
											}
										);
									}
								else
									if stack.head() = "s" then
										{
											stack <- stack.tail();
											(let a : String <- new String , b : String <- new String in 
												--adding your code
												{
													a  <- stack.head();
													stack <- stack.tail();
													b  <- stack.head();
													stack <- stack.tail();
													stack <- stack.cons(a);
													stack <- stack.cons(b);
												}
											);
										}
									else
										out_string("")
									fi
									fi
								fi;
							}
						else
							stack <- stack.cons(s)
						fi
					fi
				fi
			)
			pool
		)
	};
};
	
