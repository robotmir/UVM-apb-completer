// 1. Before defining anything, import and include all the component files.
import uvm_pkg::*;
`include "uvm_macros.svh" // UVM library
`include "apb_agent.svh"
`include "apb_comparator.svh" // uvm_scoreboard
`include "apb_predictor.svh" // uvm_subscriber
`include "apb_transaction.svh" // uvm_sequence_item

// 2. Define the class and register it with the factory
class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  // 3. Declare all the fields
  agent agt_apb; // contains monitor and driver
  agent agt_bus; // contains monitor and driver
  predictor pred; // a reference model to check the result (note: `include "apb_predictor.svh" requried)
  comparator comp; // scoreboard (note: `include "apb_comparator.svh" required)

  // 4. Define the constructor
  function new(string name = "env", uvm_component parent = null);
		super.new(name, parent);
	endfunction

  // 5. Build all the components in build_phase function
  function void build_phase(uvm_phase phase);
    // instantiate all the components through factory method
    agt_apb = agent::type_id::create("agt_apb", this);
    agt_bus = agent::type_id::create("agt_bus", this);
    pred = predictor::type_id::create("pred", this);
    comp = comparator::type_id::create("comp", this);
  endfunction

  // 6. Connect all the components
  function void connect_phase(uvm_phase phase);
    agt_apb.mon.counter_ap.connect(pred.analysis_export); // connect monitor to predictor
    pred.pred_ap.connect(comp.expected_export); // connect predictor to comparator
    agt_apb.mon.result_ap.connect(comp.actual_export); // connect monitor to comparator
  endfunction

endclass: environment
