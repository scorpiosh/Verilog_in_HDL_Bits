module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    //assign f = (x3?x1:x2);
    wire term2, term3, term5, term7;

    assign term2 = (~x3) & x2 & (~x1);
    assign term3 = (~x3) & x2 & x1;
    assign term5 = x3 & (~x2) & x1;
    assign term7 = x3 & x2 & x1;

    assign f = term2 | term3 | term5 | term7;
    
endmodule
