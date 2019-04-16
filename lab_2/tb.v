
`timescale 1 ns / 100 ps

//testbench
module tb;

    // input and output test signals
    reg  clk, d;
    wire q;

    // creating the instance of the module we want to test
    //  d_flip_flop - module name
    //  dut         - instance name ('dut' means 'device under test')
    d_flip_flop dut (clk, d, q);

    // do at the beginning of the simulation
    initial begin
        # 20;   clk = 0; d = 0; // wait for pause and set test signals
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 20;   clk = 0; d = 0;
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0; 
        # 10;   clk = 0; d = 0;
        # 10;   clk = 0; d = 0;
        # 10;   clk = 1; d = 0;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0;
        # 20;
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
