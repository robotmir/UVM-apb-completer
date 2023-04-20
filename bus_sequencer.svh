import uvm_pkg::*;
`include "uvm_macros.svh"
`include "bus_transaction.svh"

class bus_sequencer extends uvm_sequencer#(bus_transaction);
    `uvm_component_utils(bus_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

endclass : bus_sequencer
