module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
	initial q = 4'b0;
    always@(posedge clk)
        begin
            if (q<4'd9)
                q<= reset?4'b0:(q+1'b1);
            else 
                q<=4'b0;
        end
endmodule
