module l2h (
    input a,
    output reg level
);

initial begin
    level <= 0;
end

always @(posedge a) begin
    level <= ~level;
end

endmodule //l2h