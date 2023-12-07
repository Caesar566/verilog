module mux3_1a (
    input  wire [2:0] sl,
    input  wire a,
    input  wire b,
    input  wire c,
    output reg out 
);

always @(*) begin
    case (sl)
        3'b001 : out = a;
        3'b010 : out = b;
        3'b100 : out = c; 
    endcase
end

endmodule //mux3_1a