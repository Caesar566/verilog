module led (
    input clk,
    input rstn,
    output reg [3:0] led_data
);
reg [31:0] timer;
reg [2:0] led_light;

initial begin
    led_light <= 0;
    timer <= 32'b0;
end
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        led_light <= 0;
        timer <= 32'b0;
    end
    else if(timer == 32'd200000000) begin
        if (led_light == 3'd3) begin
            led_light <= 0;
        end
        led_light <= led_light + 1;
    end
    else
        timer <= timer + 32'b1;
end

always @(posedge clk or negedge rstn) begin
    case(led_light ) 
    3'd0:led_data <= 4'b0001;
    3'd1:led_data <= 4'b0010;
    3'd2:led_data <= 4'b0100;
    3'd3:led_data <= 4'b1000;
    default:led_data <= 4'b0000;
endcase
end

endmodule //led