module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    wire [3:0]q;
    
    d_ff df0(clk, resetn, in,   q[0]);
    d_ff df1(clk, resetn, q[0], q[1]);
    d_ff df2(clk, resetn, q[1], q[2]);
    d_ff df3(clk, resetn, q[2], out);
   
endmodule

module d_ff(input clk, input reset, input D, output Q);
    always@(posedge clk)
        if(!reset)
            Q<=1'b0;
    else
        Q<=D;
endmodule
