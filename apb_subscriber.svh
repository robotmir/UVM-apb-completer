// 1. Import and include all the necessary files
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "transaction.svh"

// 2. Define the class and register it with the factory
// our example class is derived form uvm_subscriber parametrized by transaction we defined in chapter 6
class predictor extends uvm_subscriber #(transaction);
  `uvm_component_utils(predictor) 
//////////////////////////////////////////////////////////////////////// edit

...
endclass

// 3. Declare all the fields
uvm_analysis_port #(transaction) pred_ap; // write the result to the scoreboard
transaction output_tx; // handle to prediction result

// 4. Define constructor
function new(string name, uvm_component parent = null);
  super.new(name, parent);
endfunction: new

// 5. Construct the analysis port in build_phase
function void build_phase(uvm_phase phase);
  pred_ap = new("pred_ap", this);
endfunction

// 6. Implement write method to receive data
function void write(transaction t);
  // t is the transaction sent from monitor
  output_tx = transaction#(4)::type_id::create("output_tx", this);
  output_tx.copy(t);
  // calculate the expected count_out
  output_tx.result_count_out = 0;
  for (int lcv = 0; lcv < t.num_clk; lcv++) begin
    output_tx.result_count_out++;
    if (output_tx.result_count_out == t.rollover_value + 1) begin
      output_tx.result_count_out = 1;
    end
  end

  // calculate the expected rollover_flag
  if (output_tx.result_count_out == t.rollover_value) begin
    output_tx.result_flag = 1;
  end else begin
    output_tx.result_flag = 0;
  end

  // after prediction, the expected output send to the scoreboard 
  pred_ap.write(output_tx);
endfunction: write
