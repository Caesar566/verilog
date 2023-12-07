//~ `New testbench
`timescale  1ns / 1ps
`include "D_trigger.v"

module tb_D_trigger;

// D_trigger Parameters
parameter PERIOD  = 10;


// D_trigger Inputs
reg   D                                    = 0 ;
reg   clk                                  = 0 ;

// D_trigger Outputs
wire  Q                                    ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

D_trigger  u_D_trigger (
    .D                       ( D     ),
    .clk                     ( clk   ),

    .Q                       ( Q     )
);

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars;
    #10
    D = 1;
    #20
    D = 0;
    #20
    $finish;
end

endmodule