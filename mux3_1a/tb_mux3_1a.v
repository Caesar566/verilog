//~ `New testbench
`timescale  1ns / 1ns
`include "./mux3_1a.v"

module tb_mux3_1a;

// mux3_1a Parameters
parameter PERIOD  = 10;


// mux3_1a Inputs
reg   [2:0]  sl                            = 0 ;
reg   a                                    = 0 ;
reg   b                                    = 1 ;
reg   c                                    = 0 ;

// mux3_1a Outputs
wire  out                                  ;


// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

mux3_1a  u_mux3_1a (
    .sl                      ( sl   [2:0] ),
    .a                       ( a          ),
    .b                       ( b          ),
    .c                       ( c          ),

    .out                     ( out        )
);

initial
begin
    $dumpfile("wave.vcd"); 
    $dumpvars;
    sl = 3'b001;
    #10
    sl = 3'b010;
    #10
    sl = 3'b100;
    #10
    $finish;
end

endmodule