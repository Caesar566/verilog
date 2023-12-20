module test (
    input      clk,
    input      rst_n,
    input key1,
    input key2,
    input key3,
    output [5:0] seg_sel,
    output [7:0] seg_data,
    output [3:0] led_data
);

wire out_key1;
wire out_key2;
wire out_key3;

button  u_button_1 (
    .a                       ( key1     ),
    .clk                     ( clk   ),

    .out                     ( out_key1   )
);

button  u_button_2 (
    .a                       ( key2     ),
    .clk                     ( clk   ),

    .out                     ( out_key2   )
);

button  u_button_3 (
    .a                       ( key3     ),
    .clk                     ( clk   ),

    .out                     ( out_key3    )  //按键消抖及按键信号提取
);

wire key1_level;

l2h  u_l2h (
    .a                       ( out_key1       ),

    .level                   ( key1_level   )
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

wire out_h;
wire out_m;

mux21a  mux21a_h (
    .a                       ( cout_m      ),
    .b                       ( out_key2     ),
    .sl                      ( key1_level    ),

    .out                     ( out_h   )
);



mux21a  mux21a_m (
    .a                       ( cout_s     ),
    .b                       ( out_key3     ),
    .sl                      ( key1_level    ),

    .out                     ( out_m   )        //2c1 信号，选择按键与时钟模式
);

wire [3:0] nums_0_m;
wire [2:0] nums_1_m;

timer  m_timer (
    .clk                     ( out_m         ),
    .rstn                    ( rstn        ),

    .nums_0                  ( nums_0_m  ),
    .nums_1                  ( nums_1_m  ),
    .cout                    ( cout_m   )
);

wire [3:0] nums_0_h;
wire [2:0] nums_1_h;

h_timer  h_timer (
    .clk                     ( cout_h         ),
    .rstn                    ( rstn          ),

    .nums_0                  ( nums_0_h  ),
    .nums_1                  ( nums_1_h  ),
    .cout                    ( cout_h    )
);

wire out_led;

time_true  u_time_true (
    .nums_0_m                ( nums_0_m   ),
    .nums_1_m                ( nums_1_m   ),
    .nums_0_s                ( nums_0_s   ),
    .nums_1_s                ( nums_1_s   ),

    .true                    ( true            )
);

mux21a  mux21a_led (
    .a                       ( clk     ),
    .b                       (  0 ),
    .sl                      (  true   ),
    .out                     ( out_led   )        //2c1 信号，选择按键与时钟模式
);



led  u_led (
    .clk                     ( out_led             ),
    .rstn                    ( rstn            ),
    .led_data                ( led_data  )
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