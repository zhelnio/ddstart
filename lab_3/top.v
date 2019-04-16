
module top
(
    input  io_72,
    input  io_73,
    output io_74, io_75, io_76, io_77, io_78, io_81, io_82, io_83
);
    // input signals
    wire       clk = io_72;
    wire       d   = io_73;

    // shift_register output signal
    wire [7:0] q;

    // connecting shift_register output with top module ports
    assign io_83 = q[0]; // assign the 0   bit
    assign io_82 = q[1]; // assign the 1st bit
    assign { io_74, io_75, io_76, io_77, io_78, io_81 } = q[7:2]; // assign all othe bits (vector)

    shift_register sr
    (
        .clk ( clk ),
        .d   ( d   ),
        .q   ( q   ) 
    );

endmodule

module shift_register
(
    input            clk,
    input            d,
    output reg [7:0] q
);
    always @(posedge clk)
        q <= { q[6:0], d };

endmodule
