module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // Detect if counter reached 12 (decimal)
    wire at_12; 
    assign at_12 = (Q == 4'd12);

    // Load signal: reset has highest priority, then wrap on 12
    assign c_load = reset | (at_12 & enable);

    // Enable counting only if not loading and enable input is high
    assign c_enable = enable & ~c_load;

    // Load data is 1 when loading, else 0 (don't care)
    assign c_d = 4'd1;

    // Instantiate the provided 4-bit counter
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule

