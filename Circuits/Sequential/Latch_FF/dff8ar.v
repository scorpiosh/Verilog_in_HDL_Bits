module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk or posedge areset)begin
        q<=(areset?1'b0:d);
    end
    
endmodule
//Sensitivity list includes the clock and the reset signals (typically reset in the list as a level or edge).
//Reset happens asynchronously, i.e., output is reset immediately when reset signal asserts, regardless of the clock.
//Reset dominates over clock, so output changes as soon as reset is asserted.

