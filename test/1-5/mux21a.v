module mux21a (
    a, b, out, sl
);
    input  a, b, sl;
    output reg out;

    always @( * )
        if( sl == 0 ) 
            out <= a;
        else 
            out <= b;
endmodule