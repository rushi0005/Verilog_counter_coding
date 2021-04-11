module johnson_counter(clk,rst,out);
  input wire clk,rst ;
  output reg [3:0] out ;
  
  reg [3:0] out_d1 ;
  reg D ;
  always@(*)
   D = ~out_d1[3];
  
  always@(posedge rst or posedge clk) begin
    if (rst) begin
      out_d1 <= 0 ;
    end
    else begin
      out_d1 <= {out[2:0],D};
    end
  end
  
  assign out = out_d1 ;
endmodule

module tb () ;
  reg clk ,rst ;
  wire [3:0]out ;
  
  johnson_counter u1(clk,rst,out);
  
  initial begin
    rst = 1 ;
    clk = 0 ;
    #3 rst = 0 ;
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
