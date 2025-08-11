module top_module (
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
//Consider the n-bit shift register circuit. Write a Verilog module named top_module for one stage of this circuit, including both the flip-flop and multiplexers.