rst=1; // reseting and setting the opcode to no-op
		select=4'b0000;
        #10
        rst=0;A=16'b0001_0010_1110_1100;B=16'b0001110111011100;load=1; // loading outside value into A 
		#10
		select=4'b0001;load=1;  // and operation
		$display("************ AND **************");
        #10
        select=4'b0010;load=1;  // nand operation
		$display("************ NAND *************");
		#10
		select=4'b0000;B=16'b0101011010010110;load=0; // loading A with the accumulator value
		$display("*********** NO-OP *************");
		#10
		select=4'b0011; // or operation
		$display("************* OR **************");
		#10
		select=4'b0100; // nor operation
  		$display("************ NOR **************");
		#10
		select=4'b0000;A=16'b0010100111111111;load=1; // loading in a outside value for A
		$display("*********** NO-OP *************");
		#10
		select=4'b0101; // xor operation
  		$display("************ XOR **************");
		#10
		select=4'b0110; // xnor operation
  		$display("*********** XNOR **************");
		#10
		rst=1; // reseting
		$display("*********** NO-OP *************");
		#10
		rst=0;A=16'b0000100010110111;load=1;select=4'b0000; // loading in outside value for A
		$display("*********** NO-OP *************");
		#10
		select=4'b0111; // not operation on a
		$display("************ NOT **************");
		

		//************************ MATHEMATICAL OPERATIONS **************************\\
		#10
		load=0;rst=1;select=4'b0000; //reseting
		#10
		//rst=0;A=16'b0100111000100000;B=16'b10000;load=1; // loading in outside value for A
		rst=0;A=-16'b0100111000100000;B=16'b10000;load=1;
		#10
		select=4'b1000;
		$display("********** DIVISION ***********");
		#10
		select=4'b0000;load=0;B=25; // loading in the result of the division into A for further calcs.
		#10
		select=4'b1011;
		$display("******* MULTIPLICATION ********");
		#10
		//load=0;select=4'b0000;B=12345; // loading in the result from the multiplication
		#10
		select=4'b1010;  // subtraction op
		$display("********* SUBTRACTION *********");
		#10
		select=4'b0000;load=0;B=17468;
		#10
		select=4'b1001; // addition op
		$display("********** ADDITION ***********");
		#10
		rst=1;  // reseting
		#10
		rst=0;A=16'b111111;B=1;load=1; // loading in outside value of A
		#10
		select=4'b1100;  // shift left op
		$display("********* SHIFT LEFT **********");
		#10
		select=4'b0000;A=00100000000000000; load=1; // loading in outside value of A
		#10
		select=4'b1101; // shift right op
		$display("******** SHIFT RIGHT **********");
		
		
		
		// showing error states
		#10
		select=4'b0000;A=16'b1000;B=0;load=1;
		#10
		select=4'b1000;
		$display("********** DIVISION ***********");
		#10
		rst=1;select=4'b0000;
		#10
		rst=0;A=9;B=1;load=1;
		#10
		select=4'b1000;
		$display("********** DIVISION ***********");
		#10
		select = 4'b0000;A=16'b0100_0000_0000_0000;B=16'b0100000000000000;load=1;
		//select = 4'b0000;A=-2;B=-3;load=1;
		#10
