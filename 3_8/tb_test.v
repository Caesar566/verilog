//~ `New testbench
`timescale  1ns / 1ns
`include "test.v"

module tb_test;

// test Parameters
parameter PERIOD  = 10;


// test Inputs
reg   [2:0]  data_i                        = 3'b010 ;
reg   [2:0]  en_i                          = 3'b001 ;

// test Outputs
wire  [7:0]  data_o                        ;


// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

test  u_test (
    .data_i                  ( data_i  [2:0] ),
    .en_i                    ( en_i    [2:0] ),

    .data_o                  ( data_o  [7:0] )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    #1;
    en_i = 3'b100;
    data_i = 3'b010;
    $finish;
end

endmodule