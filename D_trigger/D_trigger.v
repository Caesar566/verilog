module D_trigger (
    input D,
    input clk,
    output reg Q
);

always @(posedge clk) begin
    Q <= D;
end

endmodule //D_trigger