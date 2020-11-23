
module tt();
  reg [7:0] data;
   reg enable;
  reg clk;
  reg rst_n;
  wire [7:0] out;
  
  register r1(.data(data), .enable(enable), .clk(clk), .rst_n(rst_n), .out(out));
  
  initial begin
    rst_n = 1'b0;
    #5 rst_n =1'b1;
    
    clk=1'b0;
   
  end
  
  always #5 clk = ~clk;
  
  initial begin
    data = 8'd1;
    enable = 1'b1;
    #10
    data =8'd5;
    enable =1'b0;

    
  end
  
  initial begin
    $monitor("[%0t],data=%b, out= %b",$time,data,out);
    $dumpfile("abc.vcd");
    $dumpvars;
    #100 $finish;
  end
endmodule

    
