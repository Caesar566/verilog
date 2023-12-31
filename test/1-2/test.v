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
wire cout_s;
wire cout_m;
wire cout_h;

wire [3:0] nums_0_s;
wire [2:0] nums_1_s;

timer  s_timer (
    .clk                     ( en_1hz         ),
    .rstn                    ( rstn        ),

    .nums_0                  ( nums_0_s  ),
    .nums_1                  ( nums_1_s  ),
    .cout                    ( cout_s   )
);

wire [3:0] nums_0_m;
wire [2:0] nums_1_m;

timer  m_timer (
    .clk                     ( cout_s         ),
    .rstn                    ( rstn        ),

    .nums_0                  ( nums_0_m  ),
    .nums_1                  ( nums_1_m  ),
    .cout                    ( cout_m   )
);

wire [3:0] nums_0_h;
wire [2:0] nums_1_h;

h_timer  h_timer (
    .clk                     ( cout_m         ),
    .rstn                    ( rstn          ),

    .nums_0                  ( nums_0_h  ),
    .nums_1                  ( nums_1_h  ),
    .cout                    ( cout_h    )
);

wire [7:0] seg_data_0;
wire [7:0] seg_data_1;
wire [7:0] seg_data_2;
wire [7:0] seg_data_3;
wire [7:0] seg_data_4;
wire [7:0] seg_data_5;


decoder  decoder_0 (
    .bin_data                ( nums_0_s ),
    .seg_data               ( seg_data_0        )
);

decoder  decoder_1 (
    .bin_data                ( nums_1_s ),
    .seg_data               ( seg_data_1  )
);

decoder  decoder_2 (
    .bin_data                ( nums_0_m ),
    .seg_data               ( seg_data_2 | 8'b10000000 )
);

decoder  decoder_3 (
    .bin_data                ( nums_1_m ),
    .seg_data               ( seg_data_3  )
);

decoder  decoder_4 (
    .bin_data                ( nums_0_h ),
    .seg_data               ( seg_data_4 | 8'b10000000  )
);

decoder  decoder_5 (
    .bin_data                ( nums_1_h ),
    .seg_data               ( seg_data_5  )
);

scan u_scan (
    .clk                     ( clk               ),
    .rstn                    ( rstn              ),
    .seg_data_0              ( seg_data_0   ),
    .seg_data_1              ( seg_data_1  ),
    .seg_data_2              ( seg_data_2   ),
    .seg_data_3              ( seg_data_3  ),
    .seg_data_4              ( seg_data_4   ),
    .seg_data_5              ( seg_data_5  ),
    .seg_sel                 ( seg_sel      ),
    .seg_data                ( seg_data     )
);


endmodule //test