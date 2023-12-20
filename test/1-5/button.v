module button(
    a, out, clk
);
    input a;
    input clk;
    output reg out;
    reg [31:0] timer;

    initial begin
        timer <= 32'b0;
    end

    always @(posedge clk) begin
        if(timer == 32'd100000 && a == 1'b0) begin
            timer <= 32'b0;
            out <= 1'b1;
        end
        else if(!a) begin
            timer <= timer + 32'b1;            
        end
        else if(a) begin
            if (timer == 32'd100000) begin
                timer <= 0;
                out <= 32'b0;
            end
            else
                timer <= timer + 32'b1;
        end

    end
endmodule