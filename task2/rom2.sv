
module rom2 #(
    parameter ADDRESS_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input logic                     clk,
    input logic [ADDRESS_WIDTH-1:0] addr,
    input logic [DATA_WIDTH-1:0]    phase,
    output logic [DATA_WIDTH-1:0]   dout
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading rom.");
    $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk)
    // output is synchronous
    if(addr + phase > 0 && addr + phase < 256) dout <= rom_array [addr+phase];


endmodule

