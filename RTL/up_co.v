# code for up_co.v
  ...
      module up_co(d_in,load,clk,reset,count);
        input [3:0]d_in;
        input load,clk,reset;
        output reg [3:0]count;

        always@(posedge clk)
        begin
                if(reset)
                        count<=4'b0;
                else if(load)
                        count<=d_in;
                else
                        count<=count+1'b1;
        end
        endmodule
...
