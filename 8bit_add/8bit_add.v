module moduleName (
    input [7:0] num1,
    input [7:0] num2,
    output reg [7:0] out,
    output reg [7:0] c
);
    always @( * ) begin
        out <= num1 + num2;
        c[7] <= (num1[7] & num2[7]);
        c[6] <= (num1[6] & num2[6]);
        c[5] <= (num1[5] & num2[5]);
        c[4] <= (num1[4] & num2[4]);
        c[3] <= (num1[3] & num2[3]);
        c[2] <= (num1[2] & num2[2]);
        c[1] <= (num1[1] & num2[1]);
        c[0] <= (num1[0] & num2[0]);
    end
endmodule