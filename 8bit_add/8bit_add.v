module moduleName (
    input [7:0] num1,
    input [7:0] num2,
    input [7:0] num3,
    output reg [7:0] out,
    output reg c
);
    always @( * ) begin
        out <= num1 + num2 + num3;
        c <= (num1[7] & num2[7]) | (num1[7] & num3[7]) | (num2[7] & num3[7]);
    end
endmodule