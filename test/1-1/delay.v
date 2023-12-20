module delay (
    input clk,
    input rstn,
    output reg en_1hz
);

reg[31:0] timer_cnt;                          //1 second , 1 counter enable
always@(posedge clk or negedge rstn)
begin
    if(rstn == 1'b0)
    begin
        en_1hz <= 1'b0;
        timer_cnt <= 32'd0;
    end
    else if(timer_cnt >= 32'd49_999_999)
    begin
        en_1hz <= 1'b1;
        timer_cnt <= 32'd0;
    end
    else
    begin
        en_1hz <= 1'b0;
        timer_cnt <= timer_cnt + 32'd1; 
    end
end

endmodule //delay