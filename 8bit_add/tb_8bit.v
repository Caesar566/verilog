//~ `New testbench
`timescale  1ns / 1ps
`include "8bit_add.v"

module tb_moduleName;

// moduleName Parameters
parameter PERIOD  = 10;


// moduleName Inputs
reg   [7:0]  num1                          = 0 ;
reg   [7:0]  num2                          = 0 ;

// moduleName Outputs
wire  [7:0]  out                           ;
wire  c                                    ;


// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

moduleName  u_moduleName (
    .num1                    ( num1  [7:0] ),
    .num2                    ( num2  [7:0] ),

    .out                     ( out   [7:0] ),
    .c                       ( c           )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    num1 = 8'b10101010;
    num2 = 8'b11010111;
    #10
    $finish;
end

endmodule