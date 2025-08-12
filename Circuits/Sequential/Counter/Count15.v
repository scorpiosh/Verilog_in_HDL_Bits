module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    initial q=4'b0;
    always@(posedge clk)
        begin
            q<= reset?4'b0:(q+1'b1);
        end
endmodule
