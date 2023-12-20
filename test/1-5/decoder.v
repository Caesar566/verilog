module decoder
(
	input [3:0]      bin_data,     // bin data input
	output reg [6:0] seg_data      // seven segments LED output
);

always@(*)
begin
	case(bin_data)
		4'd0:seg_data <= 8'b0100_0000;
		4'd1:seg_data <= 8'b0111_1001;
		4'd2:seg_data <= 8'b0010_0100;
		4'd3:seg_data <= 8'b0011_0000;
		4'd4:seg_data <= 8'b0001_1001;
		4'd5:seg_data <= 8'b0001_0010;
		4'd6:seg_data <= 8'b0000_0010;
		4'd7:seg_data <= 8'b0111_1000;
		4'd8:seg_data <= 8'b0000_0000;
		4'd9:seg_data <= 8'b0001_0000;
		4'ha:seg_data <= 8'b0000_1000;
		4'hb:seg_data <= 8'b0000_0011;
		4'hc:seg_data <= 8'b0100_0110;
		4'hd:seg_data <= 8'b0010_0001;
		4'he:seg_data <= 8'b0000_0110;
		4'hf:seg_data <= 8'b0000_1110;
		default:seg_data <= 8'b0111_1111;
	endcase
end
endmodule