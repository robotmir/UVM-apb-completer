`ifndef apb_BUS_AGENT_SVH
`define apb_BUS_AGENT_SVH

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "sequence.svh"
`include "apb_bus_driver.svh"
`include "apb_bus_monitor.svh"

class apb_bus_agent extends uvm_agent;
  `uvm_component_utils(apb_bus_agent)
  sequencer sqr;
  apb_bus_driver apb_drv;
  apb_bus_monitor apb_mon;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    sqr = sequencer::type_id::create("sqr", this);
    apb_drv = apb_bus_driver::type_id::create("apb_drv", this);
    apb_mon = apb_bus_monitor::type_id::create("apb_mon", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    apb_drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction

endclass : apb_bus_agent

`endif
