//~ `New testbench
`timescale  100ns / 1ns
`include "first.v"

module tb_first;

// first Parameters
parameter PERIOD  = 10;


// first Inputs
reg   a                                    = 1 ;
reg   b                                    = 0 ;
reg   clk                                   = 0 ;
// first Outputs
wire  out                                  ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

first  u_first (
    .a                       ( a     ),
    .b                       ( b     ),
    .clk                     ( clk    ),

    .out                     ( out   )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    #50
    a = 1'b1;
    b = 1'b0;
    $finish;
end

endmodule