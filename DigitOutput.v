module DigitOutput( input	[3:0] a,
                    input	[3:0] b,
                    output	[6:0] d,
                    output	Overflow,
                    output	[3:0] AN);
		
		wire [4:0] w;
		
		FourBitAdder hexCalc( 	.a(a),
								.b(b),
								.s(w));
		
		Decoder dec (	.a(w[3:0]),
						.d(d));
						
		assign Overflow = ~w[4];
		
		assign AN[0] = 0;	// to activate the fouth seven-segment display 
		assign AN[1] = 1;	// to deactivate the third seven-segment display 
		assign AN[2] = 1;	// to deactivate the second seven-segment display 
		assign AN[3] = 1;	// to deactivate the first seven-segment display 
endmodule