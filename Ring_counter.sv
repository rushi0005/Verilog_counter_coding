// Code your design here
module ds (clk,rst, out);
  input clk ;
  input rst ;
  output reg [3:0] out ;
  
  reg [3:0] out_d;
  
  
  
  
  always @(posedge clk or rst) begin;
  if(rst) begin
    out <= 4'b1000;
  end
  
  else begin
    out <= {out[0],out[3:1]};
  end
  end
endmodule
  
// Code your testbench here
// or browse Examples
module tb ();
  reg clk ;
  reg rst ;
  wire [3:0] out ;
  
  ds u_1(clk,rst,out);
  initial begin
    rst = 0 ;
    clk = 0 ;
    #2 rst = 1 ;
    #2 rst = 0 ;
    forever begin
      #5 clk = ~clk ;
    end
  end
  
  initial begin
    #50 $finish ;
  end
  initial begin
    $dumpfile("abc.vcd");
    $dumpvars(0,tb);
  end
endmodule
