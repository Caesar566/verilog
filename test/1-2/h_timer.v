module h_timer (
    input clk,
    input rstn,
    output reg [3:0] nums_0, 
    output reg [1:0] nums_1,
    output reg cout 

);

initial begin
    nums_0 <= 4'b0000;
    nums_1 <= 3'b00;
    cout <= 0;
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) 
        begin
            nums_0 <= 4'b0000;
        end
    else if(nums_0 == 4'b1010)
        begin
            nums_1 <= nums_1 + 4'b0001;
            nums_0 <= 4'b0000;
        end
    else if(nums_1 == 2'b10 && nums_0 == 3'b100) begin
        nums_1 <= 0;
        cout <= 1;
    end
    else
        begin
            nums_0 <= nums_0 + 4'b0001;
        end
end

endmodule //timer