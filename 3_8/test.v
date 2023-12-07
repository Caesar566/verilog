`timescale  1ns / 1ns

module test (
    input [2:0] data_i,
    input [2:0] en_i,
    output reg [7:0] data_o 
);
    always @(*) begin
        if (en_i[0] || en_i[1] || !en_i[2])
            begin
                data_o = 8'b1111_1111;
            end
        else
            case (data_i)
                3'b000: data_o = 8'b1111_1110;
                3'b001: data_o = 8'b1111_1101;
                3'b010: data_o = 8'b1111_1011;
                3'b011: data_o = 8'b1111_0111;
                3'b100: data_o = 8'b1110_1111;
                3'b101: data_o = 8'b1101_1111;
                3'b110: data_o = 8'b1011_1111;
                3'b111: data_o = 8'b0111_1111;
            endcase
        end
endmodule