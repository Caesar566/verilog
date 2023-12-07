module counter_4b (
    input clk,
    input rstn,
    output reg [3:0] nums, 
    output reg cout
);

initial begin
    nums <= 4'b0000;
    cout <= 0;
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) 
        begin
            nums <= 4'b0000;
        end
    else if(nums == 4'b1111)
        begin
            cout <= 1;
            nums <= 4'b0000;
        end
    else
        begin
            cout <= 0;
            nums <= nums + 4'b0001;
        end
end

endmodule //4b_counter