// 1. Import and include all the necessary files
import uvm_pkg::*;
`include "uvm_macros.svh"

// 2. Define the class and register it with the factory
class driver extends uvm_driver#(transaction);
  `uvm_component_utils(driver)

  // 3. Declare all the fields
  virtual apb_if vif;

  // 4. Define constructor
  function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction: new

  // 5. Get virtual interface in build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // get interface from database
    if( !uvm_config_db#(virtual apb_if)::get(this, "", "apb_vif", vif) ) begin
      // if the interface was not correctly set, raise a fatal message
      `uvm_fatal("Driver", "No virtual interface specified for this test instance");
		end
  endfunction: build_phase

  // change it so it verifies apb_completer
  // // 6. Design the run_phase
  // task run_phase(uvm_phase phase);
  //   transaction req_item;
  //   vif.check = 0;

  //   forever begin 
  //     seq_item_port.get_next_item(req_item);
  //     DUT_reset();
  //     vif.rollover_val = req_item.rollover_value;
  //     vif.enable_time = req_item.num_clk;
  //     vif.count_enable = 1;
  //     repeat(req_item.num_clk) begin
  //       @(posedge vif.clk);
  //     end
  //     vif.count_enable = 0;
  //     #(0.2);
  //     vif.check = 1;
  //     @(posedge vif.clk);
  //     seq_item_port.item_done();
  //   end
  // endtask: run_phase

  // task DUT_reset();
  //   vif.check = 0;
  //   @(posedge vif.clk);
  //   vif.n_rst = 1;
  //   vif.clear = 0;
  //   vif.count_enable = 0;
  //   @(posedge vif.clk);
  //   vif.n_rst = 0;
  //   @(posedge vif.clk);
  //   vif.n_rst = 1;
  //   @(posedge vif.clk);
  // endtask

endclass: driver
