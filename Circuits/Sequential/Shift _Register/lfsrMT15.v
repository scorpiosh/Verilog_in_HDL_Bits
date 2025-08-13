module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire temp; 
    wire [2:0]D;
    assign temp = LEDR[1]^ LEDR[2];
    
    dff df0(.clk(KEY[0]),.D(D[0]),.Q(LEDR[0]));
    dff df1(.clk(KEY[0]),.D(D[1]),.Q(LEDR[1]));
    dff df2(.clk(KEY[0]),.D(D[2]),.Q(LEDR[2]));
    
    mux m1(.in1(LEDR[2]),.in2(SW[0]),.L(KEY[1]),.out(D[0]));
    mux m2(.in1(LEDR[0]),.in2(SW[1]),.L(KEY[1]),.out(D[1]));
    mux m3(.in1(temp),.in2(SW[2]),.L(KEY[1]),.out(D[2]));

endmodule

module dff(input clk, input D, output Q);
    always@(posedge clk)
        Q<=D;
endmodule
module mux(input in1,input in2,input L, output out);
    assign out=(L?in2:in1);
endmodule    

