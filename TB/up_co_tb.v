# code for up_co_tb.v
  ...
      module up_co_tb();
        reg [3:0]d_in;
        reg load,clk,reset;

        wire [3:0]count;

        parameter CYCLE=10;

        up_co DUT(d_in,load,clk,reset,count);

                task initialize();
         begin
            {load,clk,reset,d_in}=0;
         end
      endtask

                always
                        begin
                                #(CYCLE/2);
                                clk=1'b1;
                                #(CYCLE/2);
                                clk=1'b0;
                        end

      task rst_dut();
              begin
                      @(negedge clk);
                   reset=1'b1;
                 @(negedge clk);
                      reset=1'b0;
              end
      endtask

      task uc(input i, input [3:0]d);
              begin
                      @(negedge clk);
                     load=i;
                                  d_in=d;
              end
      endtask

        initial
      begin
         initialize;
         rst_dut;
         uc(1'b1,4'd13);
                        uc(1'b0,4'd09);
      end

   //Step3 : Use $monitor to display the various inputs and outputs
   initial
           $monitor("%b  %b  %b  %b  %b",clk,reset,d_in,load,count);


endmodule
...
