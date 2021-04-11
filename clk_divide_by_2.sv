// Code your design here
module dvdby2 (clk,rst,out);
  input wire rst,clk ;
  output reg out ;
  
  reg q,D ;
  
  always@(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 0 ;
    end
    else begin
      q <= D ;
    end
  end
  always@(*) begin
    $display("out is %0d",out);
  end
  assign D = ~q ;
  assign out = q ;
endmodule

// Code your testbench here
// or browse Examples

module tb () ;
  reg clk ,rst ;
  wire out ;
  
  dvdby2 u1(clk,rst,out);
  
  initial begin
    rst = 1 ;
    clk = 0 ;
    #3 rst = 0 ;
  end
  
  always #5 clk = ~clk ;
  
  initial begin
    #50 ;
    $finish ;
  end
  
  initial begin
    $dumpfile("abc.vcd");
    $dumpvars(0,tb);
  end
endmodule
  
