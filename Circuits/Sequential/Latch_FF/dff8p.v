module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always@(negedge clk)begin 
        q<=(reset?16'h34:d); 
    end
endmodule
