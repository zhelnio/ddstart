
module top
(
    input  io_72,
    input  io_73,
    output io_74
);
    d_flip_flop dff
    (
        .clk ( io_72 ),
        .d   ( io_73 ),
        .q   ( io_74 ) 
    );

endmodule

module d_flip_flop
(
    input      clk,
    input      d,
    output reg q
);
    always @(posedge clk)
        q <= d;

endmodule
