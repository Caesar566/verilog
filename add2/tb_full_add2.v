//~ `New testbench
`timescale  1ns / 1ps

`include "full_add2.v"

module tb_full_add2;

// full_add2 Parameters
parameter PERIOD  = 10;


// full_add2 Inputs
reg   a                                    = 0 ;
reg   b                                    = 0 ;
reg   cin                                  = 0 ;

// full_add2 Outputs
wire  sum                                  ;
wire  cout                                 ;


// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

full_add2  u_full_add2 (
    .a                       ( a      ),
    .b                       ( b      ),
    .cin                     ( cin    ),

    .sum                     ( sum    ),
    .cout                    ( cout   )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    a = 1;
    b = 1;
    cin = 1;
    #10
    a = 0;
    b = 0;
    cin = 0;
    #10
    a = 1;
    b = 1;
    cin = 1;
    #10
    $finish;
end

endmodule