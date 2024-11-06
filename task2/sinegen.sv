module sinegen #(
    parameter WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic [WIDTH-1:0]     incr,   
    input logic [WIDTH-1:0]     phase,   
    output logic [WIDTH-1:0]    dout,
    output logic [WIDTH-1:0]    dout2,
);

    logic [WIDTH-1:0]           addr;


counter myCounter (
    .clk (clk),
    .en (en),
    .rst (rst),
    .incr (incr),
    .count (addr)
);

rom myRom (
    .clk (clk),
    .addr (addr),
    .dout (dout)
);
rom2 myRom2 (
    .clk (clk),
    .addr (addr),
    .phase (phase),
    .dout (dout2)
);

endmodule
