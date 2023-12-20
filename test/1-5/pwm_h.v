module pwm_h(
    clk, out, rstn
);
    input clk;
    input rstn;
    output out;
    reg out;
    reg [31 : 0]timer ;
    
    initial begin
        timer <= 32'b0;
        out <= 1'b0;
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            timer <= 32'd0;
        end
        else if(timer == 32'b1111) begin
            timer <= 32'd0;
        end
        else if(timer == 32'b100) begin
            out <= 32'd1;
            timer <= timer + 32'b1;
        end
        else if(timer == 32'b111) begin
            out <= 32'd0;
            timer <= timer + 32'b1;
        end
        else begin
            timer <= timer + 32'b1;
        end
    end
endmodule