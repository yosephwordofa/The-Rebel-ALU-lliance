// using:    Icarus Verilog
// source:   $ git clone https://github.com/steveicarus/iverilog.git
// 4341.502

// https://www.rapidtables.com/convert/number/binary-to-decimal.html
//---------------------------------------------------------------
//---------------------------------------------------XOR module

module xorModule (a,b,sum);

	input [15:0] 	a,b;
	output [15:0]	sum;

	
	xor(sum[0], a[0], b[0]);            		// xor B bits with M to third input into FULL-Adder
	xor(sum[1], a[1], b[1]);
	xor(sum[2], a[2], b[2]);
	xor(sum[3], a[3], b[3]);
	xor(sum[4], a[4], b[4]);            		
	xor(sum[5], a[5], b[5]);
	xor(sum[6], a[6], b[6]);
	xor(sum[7], a[7], b[7]);
	xor(sum[8], a[8], b[8]);            		
	xor(sum[9], a[9], b[9]);
	xor(sum[10], a[10], b[10]);
	xor(sum[11], a[11], b[11]);
	xor(sum[12], a[12], b[12]);            		
	xor(sum[13], a[13], b[13]);
	xor(sum[14], a[14], b[14]);
	xor(sum[15], a[15], b[15]);
	
endmodule

//----------------------------------------------------------------------
//------------------------------------------------------------------Main

module testbench();

 	//Registers act like local variables

 	reg [15:0] a; 		//4 Bits to store binary numbers 0-15
	reg [15:0] b;
	  
	wire [15:0] sum;	//A wire can hold the return of a function
  
	xorModule xor11 (a, b, sum);
     
      
			                    //Initial means "start," like a Main() function.
	initial begin		        //Begin denotes the start of a block of code. ***begin = '{'	
   	  
   	a=5465;                       // must initialize variables INSIDE the "intital begin" block
	b=5457;
	
   	            
		                        //$display acts like a classic C printf command.
	$display ("|   A  |   B  |   XOR  |");
	$display ("|==+=+=+=+=+=+=+=+=+=+=|");


	#10                         // need a time delay BEFORE each $display that changes a variable variables
	$display ("| %1b | %1b |  %1b  |",a,b,sum);

    
    
    $finish;	                //A command, not unlike System.exit(0) in Java.
    end  		    	     	//End the code block of the main (initial)
  
endmodule			//Close the testbench module
