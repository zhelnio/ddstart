
module top
(
    input  io_72, io_73,
    input  io_71, io_70, io_69, io_68, io_67, io_66,
    output io_74, io_75
);
    // input signals
    wire [1:0] sel = { io_72, io_73 };
    wire [1:0] d0  = { io_71, io_70 };
    wire [1:0] d1  = { io_69, io_68 };
    wire [1:0] d2  = { io_67, io_66 };

    // connecting mux output with top module ports
    wire [1:0] y;
    assign { io_74, io_75 } = y;

    // mux
    mux mux
    (
        .d0  ( d0  ),
        .d1  ( d1  ),
        .d2  ( d2  ),
        .sel ( sel ),
        .y   ( y   )
    );

endmodule

module mux
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);
    // All possible values of input signals should be provided
    // or an inferred latch will be generated!
    always @(*) begin
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d2;
        endcase
    end
endmodule
