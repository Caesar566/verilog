module timer (
    input clk,
    input rstn,
    output reg [3:0] nums, 
    output reg [2:0] cout

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
    else if(nums == 4'b1010)
        begin
            cout <= cout + 3'b001;
            nums <= 4'b0000;
        end
    else if(cout == 3'b110) begin
        cout <= 0;
    end
    else
        begin
            nums <= nums + 4'b0001;
        end
end

endmodule //timer