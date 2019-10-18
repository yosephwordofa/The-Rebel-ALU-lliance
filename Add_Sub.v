// Nicholas Dobmeier
// using:    Icarus Verilog
// source:   $ git clone https://github.com/steveicarus/iverilog.git
// 4341.502

//---------------------------------------------------------------
//-----------------------------------------------------Half Adder

module Add_half (a, b,c_out,sum);
	
	input 	a,b;
	output 	c_out,sum;
	
	xor G1(sum, a, b);				// Gate instance names are optional xor denoted as a: ^
  	and G2(c_out, a, b);
endmodule


//---------------------------------------------------------------
//-----------------------------------------------------Full Adder

module Add_full (a,b,c_in,c_out,sum);	 
	
	input 	a,b,c_in;
	output 	c_out,sum;

	wire w1, w2, w3;				// w1 is c_out; w2 is sum
  	Add_half M1 (a, b, w1, w2);
  	Add_half M0 (w2, c_in, w3, sum);
  	or (c_out, w1, w3);				// or() xor() and() part of basic verilog library
endmodule


//---------------------------------------------------------------
//---------------------------------------------------Put Together SIXTEEN

module Add_rca_16 (a,b,c_in,c_out,sum);

	input [15:0] 	a,b;
	input		    c_in;
	output		    c_out;
	output [15:0]	sum;

							// Intermediate carries
	wire c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7, c_in8, c_in9;
	wire c_in10, c_in11, c_in12, c_in13, c_in14, c_in15;
	
	wire input1, input2, input3, input4, input5, input6, input7, input8;
	wire input9, input10, input11, input12, input13, input14, input15, input16;
	
	xor(input1, c_in, b[0]);            		// xor B bits with M to third input into FULL-Adder
	xor(input2, c_in, b[1]);
	xor(input3, c_in, b[2]);
	xor(input4, c_in, b[3]);
	xor(input5, c_in, b[4]);            		
	xor(input6, c_in, b[5]);
	xor(input7, c_in, b[6]);
	xor(input8, c_in, b[7]);
	xor(input9, c_in, b[8]);            		
	xor(input10, c_in, b[9]);
	xor(input11, c_in, b[10]);
	xor(input12, c_in, b[11]);
	xor(input13, c_in, b[12]);            		
	xor(input14, c_in, b[13]);
	xor(input15, c_in, b[14]);
	xor(input16, c_in, b[15]);
	
  	Add_full M0 (a[0], input1, c_in,  c_in1, sum[0]);
  	Add_full M1 (a[1], input2, c_in1, c_in2, sum[1]);
  	Add_full M2 (a[2], input3, c_in2, c_in3, sum[2]);
  	Add_full M3 (a[3], input4, c_in3, c_in4, sum[3]);
	Add_full M4 (a[4], input5, c_in4, c_in5, sum[4]);
  	Add_full M5 (a[5], input6, c_in5, c_in6, sum[5]);
  	Add_full M6 (a[6], input7, c_in6, c_in7, sum[6]);
  	Add_full M7 (a[7], input8, c_in7, c_in8, sum[7]);
	Add_full M8 (a[8], input9, c_in8, c_in9, sum[8]);
  	Add_full M9 (a[9], input10, c_in9, c_in10, sum[9]);
  	Add_full M10 (a[10], input11, c_in10, c_in11, sum[10]);
  	Add_full M11 (a[11], input12, c_in11, c_in12, sum[11]);
	Add_full M12 (a[12], input13, c_in12, c_in13, sum[12]);
  	Add_full M13 (a[13], input14, c_in13, c_in14, sum[13]);
  	Add_full M14 (a[14], input15, c_in14, c_in15, sum[14]);
  	Add_full M15 (a[15], input16, c_in15, c_out, sum[15]);
endmodule

//----------------------------------------------------------------------
//------------------------------------------------------------------Main

module testbench();

 	//Registers act like local variables

 	reg [15:0] a; 	//4 Bits to store binary numbers 0-15
	reg [15:0] b;
	
	reg M;        // M value
  
 	wire  carry;		//A wire can hold the return of a function
	wire [15:0] sum;

  
	Add_rca_16 processAdd (a, b, M, carry, sum);
	Add_rca_16 processSub (a, b, M, carry, sum);
     
      
			                    //Initial means "start," like a Main() function.
	initial begin		        //Begin denotes the start of a block of code. ***begin = '{'	
   	  
   	a=2733;                       // must initialize variables INSIDE the "intital begin" block
	b=2732;
	
	M=0;
   	            
		                        //$display acts like a classic C printf command.
	$display ("|   A  |   B  |  M  |   Sum  |  Carry  |");
	$display ("|==+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=|");


	#10                         // need a time delay BEFORE each $display that changes a variable variables
	$display ("| %1b | %1b |  %1d  |  %1b  |     %1b   |",a,b,M,sum,carry);
    
    M=1;
    
	#10
	$display ("| %1b | %1b |  %1d  |  %1b  |     %1b   |",a,b,M,sum,carry);
    
    
    $finish;	                //A command, not unlike System.exit(0) in Java.
    end  		    	     	//End the code block of the main (initial)
  
endmodule			//Close the testbench module