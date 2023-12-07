module counter_4b (
    input clk,
    input rstn,
    output reg [5:0] nums, 
    output reg cout
);

initial begin
    nums <= 6'b000000;
    cout <= 0;
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) 
        begin
            nums <= 6'b000000;
        end
    else if(nums == 6'b111100)
        begin
            cout <= 1;
            nums <= 6'b000000;
        end
    else
        begin
            cout <= 0;
            nums <= nums + 1;
        end
end

endmodule //4b_counter