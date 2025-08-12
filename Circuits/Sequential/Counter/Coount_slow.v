module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always@(posedge clk)
		begin 
            if(q<4'd9)
            q<=reset?4'b0:(slowena?(q+1'b1):q);
            else q<=reset?4'b0:(slowena?4'b0:q);
        
        end
endmodule
//Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. 
//The reset input is synchronous, and should reset the counter to 0. We want to be able 
//to pause the counter rather than always incrementing every clock cycle, so the slowena 
//input indicates when the counter should increment.