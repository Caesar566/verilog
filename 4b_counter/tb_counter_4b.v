//~ `New testbench
`timescale  1ns / 1ps
`include "counter_4b.v"

module tb_counter_4b;

// counter_4b Parameters
parameter PERIOD  = 10;


// counter_4b Inputs
reg   clk                                  = 1 ;
reg   rstn                                 = 1 ;

// counter_4b Outputs
wire  [3:0]  nums                          ;
wire  cout                                 ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rstn  =  1;
end

counter_4b  u_counter_4b (
    .clk                     ( clk         ),
    .rstn                    ( rstn        ),

    .nums                    ( nums  [3:0] ),
    .cout                    ( cout        )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    rstn <= 0;
    #10
    rstn <=1;
    #200
    rstn <= 0;
    #10
    rstn <=1;
    #200
    $finish;
end

endmodule