module time_true (
    input [3:0] nums_0_m,
    input [2:0] nums_1_m,
    input [3:0] nums_0_s,
    input [2:0] nums_1_s,
    output reg true
);

initial begin
    true <= 0;
end
always @( * ) begin
    if (nums_0_m == 9 && nums_1_m == 5 && nums_0_s == 3 && nums_1_s == 5) begin
        true <= 1;     
    end
    else if(nums_0_m == 0 && nums_1_m == 0 && nums_0_s == 0 && nums_1_s == 0) begin
        true <= 0;
    end


end

endmodule //time_true