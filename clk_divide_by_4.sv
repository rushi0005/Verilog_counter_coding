// Code your design here
module dvdby4 (clk,rst,out);
  input wire rst,clk ;
  output reg out ;
  
  reg q,D ;
  reg q2,D2 ;
  
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
  //assign out = q ;
  assign D2 = ~q2 ;
  
  always@(posedge q or posedge rst) begin
    if(rst) begin
    	q2 <= 0 ;
    end
    else begin
      q2 <= D2 ;
    end
  end
  assign out = q2 ;
endmodule

// Code your testbench here
// or browse Examples

module tb () ;
  reg clk ,rst ;
  wire out ;
  
  dvdby4 u1(clk,rst,out);
  
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
  
