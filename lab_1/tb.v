
`timescale 1 ns / 100 ps

//testbench
module tb;

    // input and output test signals
    reg  [1:0] btn;
    wire       led;

    // creating the instance of the module we want to test
    //  top  - module name
    //  dut  - instance name ('dut' means 'device under test')
    top dut ( btn[0], btn[1], led );

    // do at the beginning of the simulation

    initial begin
        btn = 2'b00;    // set test signals value
        #10;            // pause
        btn = 2'b01;    // set test signals value
        #10;            // pause
        btn = 2'b10;    // set test signals value
        #10;            // pause
        btn = 2'b11;    // set test signals value
        #10;            // pause
    end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("btn=%b led=%b", btn, led);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
