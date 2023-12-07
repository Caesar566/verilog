//~ `New testbench
`timescale  1ns / 1ps
`include "PWM.v"

module tb_PWM;

// PWM Parameters
parameter PERIOD  = 2;


// PWM Inputs
reg   clk                                  = 0 ;
reg   rstn                                 = 0 ;

// PWM Outputs
wire  out                                  ;
wire  [31 : 0]  timer                      ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rstn  =  1;
end

PWM  u_PWM (
    .clk                     ( clk             ),
    .rstn                    ( rstn            ),

    .out                     ( out             ),
    .timer                   ( timer  [31 : 0] )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    #100000
    $finish;
end

endmodule