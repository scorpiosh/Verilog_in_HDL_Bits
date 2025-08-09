module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cin;
    wire [3:0] cout;
    assign cin = 0;

    full_adder FA1(.a(x[0]),.b(y[0]),.cin(cin),.sum(sum[0]),.cout(cout[0]));
    full_adder FA2(.a(x[1]),.b(y[1]),.cin(cout[0]),.sum(sum[1]),.cout(cout[1]));
    full_adder FA3(.a(x[2]),.b(y[2]),.cin(cout[1]),.sum(sum[2]),.cout(cout[2]));
    full_adder FA4(.a(x[3]),.b(y[3]),.cin(cout[2]),.sum(sum[3]),.cout(cout[3]));
    assign sum[4]= cout[3];
endmodule
module full_adder( 
    input a, b, cin,
    output cout, sum );
	assign sum= a^b^cin;
    assign cout = a&b|b&cin|cin&a;
endmodule
//another approach
//module top_module (
  //  input [3:0] x,
  // input [3:0] y, 
  //  output [4:0] sum);
  //  wire [3:0] cout;
  //  wire cin=0;
  //  assign {cout,sum} = x + y + cin;
//endmodule