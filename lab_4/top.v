
module top
(
    input  io_72,
    input  io_73,
    output io_74, io_75, io_76, io_77,
    output io_2, io_4, io_6, io_8, io_14, io_16, io_18
);
    // input signals
    wire       clk = io_72;
    wire       rst = io_73;

    // shift_register output signal
    wire [3:0] dig;
    wire [6:0] hex;

    // connecting couter output with top module ports
    assign { io_74, io_75, io_76, io_77 } = dig;
    assign { io_2, io_4, io_6, io_8, io_14, io_16, io_18 } = hex;

    // counter
    counter cntr
    (
        .clk ( clk ),
        .rst ( rst ),
        .q   ( dig ) 
    );

    // binary to 7-segment
    seven_seg_digit seg7
    (
        .dig ( dig ),
        .hex ( hex )
    );

endmodule

module counter
(
    input            clk,
    input            rst,
    output reg [3:0] q
);
    always @(posedge clk)
        if(rst)
            q <= 4'b0;
        else
            q <= q + 1;

endmodule

module seven_seg_digit
(
    input      [3:0] dig,
    output reg [7:0] hex
);

    // . g f e d c b a   // Letter from the diagram below
    // 7 6 5 4 3 2 1 0   // Bit in seg

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d-- 

    always @*
        case (dig)
        4'h0: hex = 8'b11000000;
        4'h1: hex = 8'b11111001;
        4'h2: hex = 8'b10100100;
        4'h3: hex = 8'b10110000;
        4'h4: hex = 8'b10011001;
        4'h5: hex = 8'b10010010;
        4'h6: hex = 8'b10000010;
        4'h7: hex = 8'b11111000;
        4'h8: hex = 8'b10000000;
        4'h9: hex = 8'b10010000;
        4'ha: hex = 8'b10001000;
        4'hb: hex = 8'b10000011;
        4'hc: hex = 8'b11000110;
        4'hd: hex = 8'b10100001;
        4'he: hex = 8'b10000110;
        4'hf: hex = 8'b10001110;
        endcase

endmodule
