

module first (
    a, b, out, sl1
);
    input  a, b, sl1;
    output out;
    reg out;
    always @(*)
    begin
        if( sl1 ) 
            out = a;
        else 
            out = b;
    end
        
        
endmodule //first