//~ `New testbench
`timescale  1ms / 1ps
`include "led.v"

module tb_led;

// led Parameters
parameter PERIOD  = 10;


// led Inputs
reg   clk                                  = 0 ;
reg   rstn                                 = 0 ;

// led Outputs
wire  [3:0]  led_c                         ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rstn  =  1;
end

led  u_led (
    .clk                     ( clk          ),
    .rstn                    ( rstn         ),

    .led_c                   ( led_c  [3:0] )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    #10
    rstn <= 1;
    #10
    rstn <= 0;
    #2000000
    $finish;
end

endmodule