//~ `New testbench
`timescale  1ns / 1ps
`include "button.v"

module tb_button;

// button Parameters
parameter PERIOD  = 10;


// button Inputs
reg   a                                    = 0 ;

// button Outputs
wire  out                                  ;



button  u_button (
    .a                       ( a     ),

    .out                     ( out   )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    a = 0;
    #5
    a = 1;
    #10
    a = 0;
    #50000
    a = 1;
    #10
    a = 1;
    #10000
    a = 0;
    $finish;
end

endmodule