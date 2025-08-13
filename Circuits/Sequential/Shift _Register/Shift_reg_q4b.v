module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF M_DFF0(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0] );
    MUXDFF M_DFF1(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1] );
    MUXDFF M_DFF2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2] );
    MUXDFF M_DFF3(KEY[0],  KEY[3], SW[3], KEY[1], KEY[2], LEDR[3] );

endmodule

module MUXDFF(
    input clk,
    input w, R, E, L,
    output Q
);
    wire out,out_temp;
    d_ff df0(.clk(clk),.D(out),.Q(Q));
    mux m1(.in1(Q),.in2(w),.L(E),.out(out_temp));
    mux m2(.in1(out_temp),.in2(R),.L(L),.out(out));
    
endmodule
module d_ff(input clk, input D, output Q);
    always@(posedge clk)
        Q<=D;
endmodule
module mux(input in1,input in2,input L, output out);
    assign out=(L?in2:in1);
endmodule    
//Write a top-level Verilog module (named top_module) for the shift register, assuming that n = 4. Instantiate four copies of your MUXDFF subcircuit in your top-level module. Assume that you are going to implement the circuit on the DE2 board.

//Connect the R inputs to the SW switches,
//clk to KEY[0],
//E to KEY[1],
//L to KEY[2], and
//w to KEY[3].
//Connect the outputs to the red lights LEDR[3:0].