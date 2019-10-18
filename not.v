// using:    Icarus Verilog
// source:   $ git clone https://github.com/steveicarus/iverilog.git
// 4341.502

// https://www.rapidtables.com/convert/number/binary-to-decimal.html
//---------------------------------------------------------------
//---------------------------------------------------NOT module

module notModule (a,sum);

	input [15:0] 	a;
	output [15:0]	sum;

	
	not(sum[0], a[0]);            		// xor same index bits of A and B
	not(sum[1], a[1]);
	not(sum[2], a[2]);
	not(sum[3], a[3]);
	not(sum[4], a[4]);            		
	not(sum[5], a[5]);
	not(sum[6], a[6]);
	not(sum[7], a[7]);
	not(sum[8], a[8]);            		
	not(sum[9], a[9]);
	not(sum[10], a[10]);
	not(sum[11], a[11]);
	not(sum[12], a[12]);            		
	not(sum[13], a[13]);
	not(sum[14], a[14]);
	not(sum[15], a[15]);
	
endmodule

//----------------------------------------------------------------------
//------------------------------------------------------------------Main

module testbench();

 	//Registers act like local variables

 	reg [15:0] a; 			//16 Bits to store binary numbers
	  
	wire [15:0] sum;		//A wire can hold the return of a function
  
	notModule not11 (a, sum);
     
      
			                    //Initial means "start," like a Main() function.
	initial begin		        //Begin denotes the start of a block of code. ***begin = '{'	
   	  
   	a=5465;                       	// must initialize variables INSIDE the "initial begin" block
	
   	            
		                        //$display acts like a classic C printf command.
	$display ("|          A         |         NOT        |");
	$display ("|=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=|");


	#10                         // need a time delay BEFORE each $display that changes a variable variables
	$display ("|  %1b  |  %1b  |",a,sum);

    
    
    $finish;	                //A command, not unlike System.exit(0) in Java.
    end  		    	     	//End the code block of the main (initial)
  
endmodule			//Close the testbench module
