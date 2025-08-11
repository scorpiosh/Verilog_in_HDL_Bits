module top_module (
    input d, 
    input ena,
    output q);
    always@(ena or d)
        if (ena)
        q = d;  
        //q<=(ena?d:q);
endmodule
