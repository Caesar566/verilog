module pwm_l(
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
        else if (timer < 125000) begin
            if(timer == 32'd50) begin
                timer <= 32'd0;
            end
            else if(timer == 32'd10) begin
                out <= 32'd1;
                timer <= timer + 32'b1;
            end
            else if(timer == 32'd20) begin
                out <= 32'd0;
                timer <= timer + 32'b1;
            end
            else begin
                timer <= timer + 32'b1;
            end
        end
        else if(timer  == 32'd500000) begin
            timer <= 32'd0;
        end
    end
endmodule