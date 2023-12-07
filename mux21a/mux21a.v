module mux21a (
    a, b, out, clk
);
    input  a, b, clk;
    output out;
    reg out;
    always @(a or b or clk)
        if( clk == 0 ) 
            out = a;
        else 
            out = b;
            
endmodule