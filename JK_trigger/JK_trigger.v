module JK_trigger (
    input a;
);

always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
        a <= 0;
    end else begin
end

endmodule //JK_trigger