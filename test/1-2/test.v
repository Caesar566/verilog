module test (
    input      clk,
    input      rst_n,
    output[5:0]seg_sel,
    output[7:0]seg_data
);



wire en_1hz;

delay  u_delay (
    .clk                     ( clk      ),
    .rstn                    ( rstn     ),

    .en_1hz                  ( en_1hz   )
);

wire [3:0] nums;
wire [2:0] cout;

timer  u_timer (
    .clk                     ( en_1hz         ),
    .rstn                    ( rstn        ),

    .nums                    ( nums   ),
    .cout                    ( cout   )
);

wire [7:0] seg_data_0;
wire [7:0] seg_data_1;

decoder  decoder_0 (
    .bin_data                ( nums ),
    .seg_data               ( seg_data_0        )
);

decoder  decoder_1 (
    .bin_data                ( cout ),
    .seg_data               ( seg_data_1        )
);



scan u_scan (
    .clk                     ( clk               ),
    .rstn                    ( rstn              ),
    .seg_data_0              ( seg_data_0   ),
    .seg_data_1              ( seg_data_1  ),

    .seg_sel                 ( seg_sel      ),
    .seg_data                ( seg_data     )
);


endmodule //test