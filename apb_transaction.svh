`ifndef TRANSACTION_SVH
`define TRANSACTION_SVH

// 2. Import and include all the necessary files
import uvm_pkg::*;
`include "uvm_macros.svh"

// 3. Define the class
class transaction #(parameter NUM_BITS = 4) extends uvm_sequence_item;
  // 4. Declare all the fields
  /////////////////////////////////////////////////////////////////////// edit and check tutorial
  rand bit [NUM_BITS - 1:0] rollover_value;
  rand int num_clk; // number of clk cycles that counter_enable keeps on
  bit [NUM_BITS - 1:0] result_count_out;
  bit result_flag;

  // 5. Register the class and the fields with the factory
  `uvm_object_utils_begin(transaction)
    `uvm_field_int(rollover_value, UVM_NOCOMPARE)
    `uvm_field_int(num_clk, UVM_NOCOMPARE)
    `uvm_field_int(result_count_out, UVM_DEFAULT)
    `uvm_field_int(result_flag, UVM_DEFAULT)
  `uvm_object_utils_end

  // 6. Set constraints for rand fields
  /////////////////////////////////////////////////////////////////////change from counter to transaction
  constraint rollover {rollover_value != 0; rollover_value != 1;}
  constraint clk_number{num_clk > 0; num_clk < 20;}

  // 7. Define constructor
  function new(string name = "transaction");
    super.new(name);
  endfunction: new

  // comparison between two transaction object
  // if two transactions are the same, return 1 else return 
  function int input_equal(transaction tx);
    int result;
    if((rollover_value == tx.rollover_value) && (num_clk == tx.num_clk)) begin
      result = 1;
      return result;
    end
    result = 0;
    return result;
  endfunction

endclass //transaction

`endif
