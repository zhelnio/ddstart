
`timescale 1 ns / 100 ps

//testbench
module tb;

    reg  [2:0] a;
    wire [7:0] y;

    // creating the instance of the module we want to test
    demux_1 dut (a, y);

    initial begin
        #10; a = 3'h1;
        #10; a = 3'h4;
        #10; a = 3'h7;
        #10;
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor ("a=%3b %1h y=%8b %2h", a, a, y, y);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
