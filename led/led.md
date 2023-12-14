# 流水灯实验

通过计数器来计时，当时间记录到时，便移位，实现流水灯

```verilog
module led (
    input clk,
    input rstn,
    output reg [3:0] led_c
);

reg [31:0] timer;

initial begin
    
    timer <= 32'd0;
    led_c <= 4'b0;
end

always @(posedge clk or negedge rstn) begin
    if ( rstn ) 
    begin
        timer <= 32'd0;
    end
    else if( timer == 32'd1_9999_9999 ) begin
        
    end
    else begin
        timer <= timer + 32'd1;
    end

end

always @( posedge clk or negedge rstn) begin
    if ( rstn ) 
    begin
        led_c <= 4'b0;
    end
    else if(timer == 32'd1_9999_9999) begin
        timer <= 32'd0;
    end
    else if(timer == (32'd1_4999_9999)) begin
        led_c <= 4'b1000;
    end
    else if(timer == (32'd9999_9999)) begin
        led_c <= 4'b0100;
    end
    else if(timer == (32'd4999_9999)) begin
        led_c <= 4'b0010;
    end
    else if(timer == (32'd0)) begin
        led_c <= 4'b0001;
    end
end

endmodule //led
```