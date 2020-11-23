module counter(
  input [7:0] data,
  input enable,
  input load,
  input clk,
  input rst_n,
  output reg [7:0] out
);
  
  always @(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
        out <= 8'd0;
      else if(enable)
        out <= out + 1;
      else if(load)
        out <= data;
      else
        out <= out;
    end
endmodule
