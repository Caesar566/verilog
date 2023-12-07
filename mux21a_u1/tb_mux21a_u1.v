//~ `New testbench
`timescale  1ns / 1ns
`include "mux21a_u1.v"

module tb_first;

// first Parameters
parameter PERIOD  = 10;


// first Inputs
reg   a                                    = 1 ;
reg   b                                    = 0 ;
reg   sl1                                  = 0 ;
reg   c                                    = 0 ;
reg   sl2                                  = 0 ;

// first Outputs
wire  out_firt                                  ;
wire  out_end                                   ;

// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

first  u_ab (
    .a                       ( a     ),
    .b                       ( b     ),
    .sl1                     ( sl1   ),

    .out                     ( out_firt   )
);

first u_bc(
    .a                       ( out_firt),
    .b                       ( c     ),
    .sl1                     ( sl2   ),

    .out                     ( out_end   )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars;
    #10;
    sl1 = 1;
    sl2 = 0;
    #10;
    sl2 = 1;
    #10
    $finish;
end

endmodule    