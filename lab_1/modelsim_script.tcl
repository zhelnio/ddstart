
# create modelsim working library
vlib work

# compile all the Verilog sources
vlog  ../tb.v ../top.v 

# open the testbench module for simulation
vsim -novopt work.tb

# add all testbench signals to time diagram
add wave sim:/tb/*

# run the simulation
run -all

# expand the signals time diagram
wave zoom full
