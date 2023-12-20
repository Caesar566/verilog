//~ `New testbench
`timescale  1ns / 1ps
`include "button.v"

module tb_button;

// button Parameters
parameter PERIOD  = 10;


// button Inputs
reg   a                                    = 0 ;
reg   clk                                  = 0 ;

// button Outputs
wire  out                                  ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

button  u_button (
    .a                       ( a     ),
    .clk                     ( clk   ),

    .out                     ( out   )
);


initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    a = 1;
    #5
    a = 0;
    #10
    a = 1;
    #10000
    a = 0;
    #10
    a = 0;
    #8000
    a = 1;
    #10000
    a = 0;
    #10000
    $finish;
end

endmodule