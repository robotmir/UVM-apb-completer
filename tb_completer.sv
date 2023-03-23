// include all the design files
`include "flex_counter.sv"

// include all the interface files
`include "counter_if.svh"

// include UVM test file
`include "test.svh"

`timescale 1ns/1ps

// import uvm packages
import uvm_pkg::*;

module tb_counter ();
  logic clk;
  
  // generate clock
  initial begin
    clk = 0;
    forever #10 clk = !clk;
  end

  // instantiate the interface
  counter_if fc_if(clk);
  
  // instantiate the DUT
  flex_counter counter(fc_if.counter);

  // start the test
  initial begin
    uvm_config_db#(virtual counter_if)::set( null, "", "vif", fc_if); // configure the interface into the database, so that it can be accessed throughout the hierachy
    run_test("test"); // initiate test component
    // you can also call run_test() without argument and specify the test name by using command line option +UVM_TESTNAME="test"
  end
endmodule
