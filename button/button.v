module button(
    a, out, clk
);
    input a;
    input clk;
    output reg out;
    reg [15:0] timer;

    initial begin
        timer <= 15'b0;
    end

    always @(posedge clk) begin
        if(timer == 16'b1111_1111 && a == 1'b0) begin
            timer <= 16'b0;
            out <= 1'b1;
        end
        else if(!a) begin
            timer <= timer + 16'b1;            
        end
        else if(a) begin
            out <= 1'b0;
        end

    end

endmodule