// using:    Icarus Verilog
// source:   $ git clone https://github.com/steveicarus/iverilog.git
// 4341.502

// https://www.rapidtables.com/convert/number/binary-to-decimal.html
//---------------------------------------------------------------
//---------------------------------------------------NOR module

module norModule (a,b,sum);

	input [15:0] 	a,b;
	output [15:0]	sum;

	
	nor(sum[0], a[0], b[0]);            		// nor same index bits of A and B
	nor(sum[1], a[1], b[1]);
	nor(sum[2], a[2], b[2]);
	nor(sum[3], a[3], b[3]);
	nor(sum[4], a[4], b[4]);            		
	nor(sum[5], a[5], b[5]);
	nor(sum[6], a[6], b[6]);
	nor(sum[7], a[7], b[7]);
	nor(sum[8], a[8], b[8]);            		
	nor(sum[9], a[9], b[9]);
	nor(sum[10], a[10], b[10]);
	nor(sum[11], a[11], b[11]);
	nor(sum[12], a[12], b[12]);            		
	nor(sum[13], a[13], b[13]);
	nor(sum[14], a[14], b[14]);
	nor(sum[15], a[15], b[15]);
	
endmodule

//----------------------------------------------------------------------
//------------------------------------------------------------------Main

module testbench();

 	//Registers act like local variables

 	reg [15:0] a; 			//16 Bits to store binary numbers
	reg [15:0] b;
	  
	wire [15:0] sum;		//A wire can hold the return of a function
  
	norModule nor11 (a, b, sum);
     
      
			                    //Initial means "start," like a Main() function.
	initial begin		        //Begin denotes the start of a block of code. ***begin = '{'	
   	  
   	a=65534;                       	// must initialize variables INSIDE the "initial begin" block
	b=65502;
	
   	            
		                        //$display acts like a classic C printf command.
	$display ("|          A         |          B         |          NOR         |");
	$display ("|=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+==|");


	#10                         // need a time delay BEFORE each $display that changes a variable variables
	$display ("|  %1b  |  %1b  |   %1b   |",a,b,sum);

    
    
    $finish;	                //A command, not unlike System.exit(0) in Java.
    end  		    	     	//End the code block of the main (initial)
  
endmodule			//Close the testbench module
