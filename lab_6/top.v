
module top
(
    input  io_67, io_69, io_71,
    output io_100, io_2, io_4, io_6, io_8, io_14, io_16, io_18
);
    // input signals
    wire [2:0] a = { io_67, io_69, io_71 };

    // connecting couter output with top module ports
    wire [7:0] y;
    assign { io_100, io_2, io_4, io_6, io_8, io_14, io_16, io_18 } = y;

    // counter
    demux_1 demux (a, y);

endmodule

module demux_1
(
    input      [2:0] a,
    output reg [7:0] y
);
    always @(*) begin
        case(a)
            3'b000 : y = 8'b00000001;
            3'b001 : y = 8'b00000010;
            3'b010 : y = 8'b00000100;
            3'b011 : y = 8'b00001000;
            3'b100 : y = 8'b00010000;
            3'b101 : y = 8'b00100000;
            3'b110 : y = 8'b01000000;
            3'b111 : y = 8'b10000000;
        endcase
    end

endmodule

module demux_2
(
    input      [2:0] a,
    output reg [7:0] y
);
    always @(*) begin
        y = ( 1 << a );
    end

endmodule

module demux_3
(
    input  [2:0] a,
    output [7:0] y
);
    assign y = ( 1 << a );

endmodule
