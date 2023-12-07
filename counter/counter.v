module first (
    clk, q1, q2,  clr, enb, cout, sig
);
    input  clk, clr, enb, sig;
    input[3:0] q1;
    input[7:4] q2;
    output cout;

    reg cout;

    initial begin
        enb = 1;
        q1[3:0] <= 'd0;
        q2[7:4] <= 'd0;
        sig <= 0;
    end


    always @(clk)
        begin
            if ( clr ) begin
                enb = 1;
                sig <= 1;
            end
            else if(sig) begin
                if (clk) begin
                    enb = 1;
                    q1 <= q1 + 1'b1;
                end
            end
            else if(q1 == 10) begin
                enb = 0;
                q1 <= 'd0;
                q2 <= q2 + 'b1;
            end
        end  
endmodule //first