module single_port_ram(
    input clk,
    input [3:0] addr,
    input [15:0] data_in,
    output reg [15:0] data_out,
    input cs,
    input we,
    input oe
  );

  reg [15:0] mem [0:15];

  always @(posedge clk) begin
    if (cs && we) //chip enable ve yazma etkin
      mem[addr] <= data_in;
  end

  always @(negedge clk) begin
    if (cs && oe) //chip enable ve okuma etkin
      data_out <= mem[addr];
    else
      data_out <= 'hz; // etkin olmayan durumda çıkış 'hz
  end

endmodule
