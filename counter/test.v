moudel test(

input clk,

input rst,

input start,

input stop,

ouput reg [9:0] cnt_o

);

reg [9:0] cnt_r;

always @(posedge clk) begin
    
    if(rst) begin

        cnt_o <= 0:
        
        cnt_r <= 0
        
        end else if( stop) begin
            cnt_r <= 0;

            cnt_o <= cnt_r;
            
            end else if(start) begin
            
            cnt_r <= 'd1;
        end else if(cnt_r != 0) begin

            cnt_r <= cnt_r + 1'b1;
            
            end
            
            end
            
endmodule