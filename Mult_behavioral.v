module mult(product,multiplier,multiplicand); 
   input [15:0] multiplier, multiplicand;	
   output [31:0] product;
//internal
   reg [31:0] product;

   integer       i;

   always @( multiplier or multiplicand )
//out <= a * b;
     begin
        
        product = 0;//set out to 0
            
        for(i=0; i<16; i=i+1)
          if( multiplier[i] == 1'b1 )//for every bit
		product = product + ( multiplicand << i );//shift
  
     end
     
endmodule

module test();
	reg [15:0] multiplier;		//16 Bits to store
	reg [15:0] multiplicand;	//16bit
	wire [31:0] product;		//32 bit for output return

	mult do(.product(product),.multiplier(multiplier), .multiplicand(multiplicand));

	initial begin
		multiplier = 100;
		multiplicand = 200000;			//limit 16bit<== this input should reduce
		#10 					//time delay
		$display("product|multiplier|multiplicand|");
		$display("|%1d|%1d|%1d|",product, multiplier, multiplicand);
		multiplier = 15'b100100011011011;	//bitwise input of 18651
        	multiplicand = 15'b101000101101000;	//bitwise input of 20840
		#10
		$display("product|multiplier|multiplicand|");
		$display("|%b|%b|%b|",product, multiplier, multiplicand);
	$finish;
	end 
endmodule