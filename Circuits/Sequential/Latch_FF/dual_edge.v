module top_module (
    input clk,
    input d,
    output q
);
    wire q1,q2;
    initial q=1'h0;
    always@(posedge clk)
        q1<=d;
    always@(negedge clk)
        q2<=d;
    assign q=(clk?q1:q2);	
endmodule
//posedge triggered FF, negedge triggered FF, select one of them for output.