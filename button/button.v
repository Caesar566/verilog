module button(
    a, out
);
    input a;
    output reg out;
    reg [15:0] timer;

    initial begin
        timer <= 15'b0;
    end

    always @(!a) begin
        if(timer == 16'b1_1111_1111 && a == 1'b0) begin
            timer <= 16'b0;
            out <= 1'b1;
        end
        else
            out <= 1'b0;
            timer <= timer + 16'b1;
    end

endmodule