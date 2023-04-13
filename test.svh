import uvm_pkg::*;
`include "uvm_macros.svh"
`include "apb_environment.svh"

////////////////////////////////// uvm_test
class test extends uvm_test;
  `uvm_component_utils(test)

  environment env;
  virtual apb_if vif;
  apb_sequence seq;

  function new(string name = "test", uvm_component parent);
		super.new(name, parent);
	endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
		env = environment::type_id::create("env",this);
    seq = apb_sequence::type_id::create("seq");

    // send the interface down
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "apb_vif", vif)) begin 
      // check if interface is correctly set in testbench top level
		   `uvm_fatal("TEST", "No virtual interface specified for this test instance")
		end 

		uvm_config_db#(virtual apb_if)::set(this, "env.agt*", "apb_vif", vif);

  endfunction: build_phase

  task run_phase(uvm_phase phase);
    phase.raise_objection( this, "Starting sequence in main phase" );
		$display("%t Starting sequence run_phase",$time);
 		seq.start(env.agt.sqr);
		#100ns;
		phase.drop_objection( this , "Finished in main phase" );
  endtask

endclass: test
