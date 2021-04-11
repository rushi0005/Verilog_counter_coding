module LFSR(clk,rst,in);
  input clk,rst ;
  reg [3:0] out_d,out;
  input in ; 
  reg D ;
  
  assign D = out_d[3] ^ in ;
  assign out = out_d ;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      out_d <= 0 ;
    end
    else begin
      out_d <= {out[2:0],D};
    end
  end
endmodule

module tb () ;
  reg clk ,rst , in;
  //wire [3:0]out ;
  
  LFSR u1(clk,rst,in);
  
  initial begin
    rst = 1 ;
    clk = 0 ;
    #3 rst = 0 ;
    in =1 ;
    
  //  #11 in = 0 ;
  end
  
  always #5 clk = ~clk ;
  
  initial begin
    #100 ;
    $finish ;
  end
  
  initial begin
    $dumpfile("abc.vcd");
    $dumpvars(0,tb);
  end
endmodule
