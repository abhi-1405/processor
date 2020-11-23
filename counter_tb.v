module tt();
  reg [7:0] data;
   reg enable;
  reg load;
  reg clk;
  reg rst_n;
  wire [7:0] out;
  
  counter r1(.data(data), .load(load), .enable(enable), .clk(clk), .rst_n(rst_n), .out(out));
  
  initial begin
    rst_n = 1'b0;
    #5 rst_n =1'b1;
    
    clk=1'b0;
   
  end
  
  always #5 clk = ~clk;
  
  initial begin
    data = 8'd1;
    enable = 1'b1;
    load = 1'b1;
    #50
    
    rst_n = 1'b0;
    #6 rst_n =1'b1;
    
   data = 8'd55;
   enable =1'b0;
   load = 1'b1;
   #10
    enable =1'b1;
    
  end
  
  initial begin
    $monitor("[%0t],data=%b, en=%d, load=%d, out= %b",$time,data,enable, load,out);
    $dumpfile("abc.vcd");
    $dumpvars;
    #100 $finish;
  end
endmodule
