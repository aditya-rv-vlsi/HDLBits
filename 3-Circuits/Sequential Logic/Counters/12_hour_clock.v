module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always@(posedge clk) begin
        if(reset)begin
            hh<=8'h12;
            mm<=8'h00;
            ss<=8'h00;
            pm<=0;
        end
        else begin
            if(ena)
                if(ss==8'h59)begin
                    ss<=0;
                    if(mm==8'h59)begin
                        mm<=0;
                        if(hh==8'h11)begin
                            hh<=8'h12;
                            pm <= pm?0:1;
                        end
                        else if(hh==8'h09)begin
                            hh[7:4]<=4'h1;
                            hh[3:0]<=4'h0;
                        end
                        else if(hh==8'h12)begin
                            hh[7:4]<=0;
                            hh[3:0]<=1;
                        end
                        else
                            hh<=hh+1;
                    end
                    else if(mm[3:0]==4'h9)begin
                        mm[7:4]<=mm[7:4]+1;
                        mm[3:0]<=0;
                    end
                    else
                        mm<=mm+1;
                end
            	else if(ss[3:0]==4'h9)begin
                    ss[7:4]<=ss[7:4]+1;
                    ss[3:0]<=0;
                end
                else
                    ss<=ss+1;
        end
    end
endmodule
