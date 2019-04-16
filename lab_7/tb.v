
`timescale 1 ns / 100 ps

//testbench
module tb;

    // input signals
    reg [1:0] d0;
    reg [1:0] d1;
    reg [1:0] d2;
    reg [1:0] sel;

    // output value
    wire [1:0] y;

    // creating the instance of the module we want to test
    mux dut
    (
        .d0  ( d0  ),
        .d1  ( d1  ),
        .d2  ( d2  ),
        .sel ( sel ),
        .y   ( y   )
    );

    initial begin
        d0  = 2'b00; d1  = 2'b01; d2  = 2'b10;
        #10;
        sel = 2'b00;
        #10;
        sel = 2'b01;
        #10;
        d0  = 2'b00; d1  = 2'b11; d2  = 2'b10;
        #10
        sel = 2'b10;
        #10;
        sel = 2'b11;
        #10;
        sel = 2'b00;
        #10;
        sel = 2'b11;
        #10;
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor ("d0=%2b d1=%2b d2=%2b sel=%2b y=%2b", d0, d1, d2, sel, y);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
