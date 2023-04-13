// include all the design files
`include "apb_completer.sv"

// include all the interface files
`include "apb_if.sv"
`include "bus_protocol_if.sv"

// include UVM test file
`include "apb_test.svh"

`timescale 1ns/1ps

// import uvm packages
import uvm_pkg::*;

module tb_completer ();
  logic PCLK;
  logic PRESETn;

  // generate clock
  initial begin
    PCLK = 0;
    forever #10 clk = !clk;
  end



  // instantiate the interface
    ////////////////////////////////////////////////////// edit
  apb_if apb_dut_if(PCLK, PRESETn);
  bus_protocol_if bus_dut_if();
  
  // instantiate the DUT
  apb_completer apb(apb_dut_if.apb);

  // start the test
  initial begin
    // uvm_config_db#(virtual counter_if)::set( null, "", "vif", apb_dut_if); // configure the interface into the database, so that it can be accessed throughout the hierachy
    uvm_config_db#(virtual apb_if)::set( null, "", "vif", apb_dut_if); // configure the interface into the database, so that it can be accessed throughout the hierachy
    run_test("test"); // initiate test component
    // you can also call run_test() without argument and specify the test name by using command line option +UVM_TESTNAME="test"
  end
endmodule
