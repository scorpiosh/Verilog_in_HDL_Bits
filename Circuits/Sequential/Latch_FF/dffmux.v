module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
wire D, out;
    
    dff df0(.clk(clk),.D(out),.Q(Q));
    mux m1(.in1(q_in),.in2(r_in),.L(L),.out(out));
    
endmodule
module dff(input clk, input D, output Q);
    always@(posedge clk)
        Q<=D;
endmodule
module mux(input in1,input in2,input L, output out);
    assign out=(L?in2:in1);
endmodule    
