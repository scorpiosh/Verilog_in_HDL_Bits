module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always@(posedge clk)
        begin 
            if (load)
                q<=data;
            else begin
                case(ena)
                    2'b01: q <= {q[0], q[99:1]};

                    2'b10: q <= {q[98:0], q[99]};

                    2'b11: q<=q;
                    2'b00: q<=q;
                endcase
            end 
        end
endmodule
//Build a 100-bit left/right rotator, with synchronous load and left/right enable. 
//A rotator shifts-in the shifted-out bit from the other end of the register, 
//unlike a shifter that discards the shifted-out bit and shifts in a zero. 
//If enabled, a rotator rotates the bits around and does not modify/discard them.