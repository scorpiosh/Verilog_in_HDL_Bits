module top_module (
    input  [15:0] a,      
    input  [15:0] b,      
    input         cin,    
    output        cout,  
    output [15:0] sum     
);

    wire [3:0] carry;     // carry between digits

    assign carry[0] = cin;

    bcd_fadd digit0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(carry[0]),
        .cout(carry[1]),
        .sum(sum[3:0])
    );

    bcd_fadd digit1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(carry[1]),
        .cout(carry[2]),
        .sum(sum[7:4])
    );

    bcd_fadd digit2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(carry[2]),
        .cout(carry[3]),
        .sum(sum[11:8])
    );

    bcd_fadd digit3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(carry[3]),
        .cout(cout),
        .sum(sum[15:12])
    );

endmodule
