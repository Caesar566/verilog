module scan (
    input clk,
    input rstn,
    input [7:0] seg_data_0,
    input [7:0] seg_data_1,
    output reg [5:0] seg_sel,
    output reg [7:0] seg_data 
);

parameter SCAN_FREQ = 200;     //scan frequency
parameter CLK_FREQ = 50000000; //clock frequency

parameter SCAN_COUNT = CLK_FREQ /(SCAN_FREQ * 6) - 1;

reg [31:0] scan_timer;
reg [3:0] scan_sel;

initial begin
    scan_timer <= 0;
    seg_sel <= 0;
end

always @(posedge clk or negedge rstn) begin
    if(!rstn)
        begin
            scan_timer <= 0;
        end
    else if(scan_timer >= SCAN_COUNT) begin
        scan_timer <= 0;
        if (scan_sel == 4'd5) begin
            scan_sel <= 0;
        end
        scan_sel <= scan_sel + 1;
    end
    else
        begin
            scan_timer <= scan_timer + 32'd1;
        end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) 
        begin
            seg_sel <= 6'b111111;
            seg_data <= 8'hff;
        end
    else
        begin
            case(seg_sel)
                4'd0:
                begin
                    seg_sel <= 6'b11_1110;
                    seg_data <= seg_data_0;
                end
                //second digital led
                4'd1:
                begin
                    seg_sel <= 6'b11_1101;
                    seg_data <= seg_data_1;
                end
                //...
                4'd2:
                begin
                    seg_sel <= 6'b11_1011;
                    seg_data <= 0;
                end
                4'd3:
                begin
                    seg_sel <= 6'b11_0111;
                    seg_data <= 0;
                end
                4'd4:
                begin
                    seg_sel <= 6'b10_1111;
                    seg_data <= 0;
                end
                4'd5:
                begin
                    seg_sel <= 6'b01_1111;
                    seg_data <= 0;
                end
                default:
                begin
                    seg_sel <= 6'b11_1111;
                    seg_data <= 8'hff;
                end
            endcase
        end
    end


endmodule //scan