// 1. Import and include all the necessary files
import uvm_pkg::*;
`include "uvm_macros.svh"

// 2. Define the class and register it with the factory
class comparator extends uvm_scoreboard;
  `uvm_component_utils(comparator)

...
endclass

// 3. Declare all the fields
uvm_analysis_export #(transaction) expected_export; // receive result from predictor
uvm_analysis_export #(transaction) actual_export; // receive result from DUT
uvm_tlm_analysis_fifo #(transaction) expected_fifo;
uvm_tlm_analysis_fifo #(transaction) actual_fifo;

int m_matches, m_mismatches; // records number of matches and mismatches

// 4. Create all objects in build_phase
function void build_phase( uvm_phase phase );
  expected_export = new("expected_export", this);
  actual_export = new("actual_export", this);
  expected_fifo = new("expected_fifo", this);
  actual_fifo = new("actual_fifo", this);
endfunction

// 5. Connect fifo to analysis exports
function void connect_phase(uvm_phase phase);
  expected_export.connect(expected_fifo.analysis_export);
  actual_export.connect(actual_fifo.analysis_export);
endfunction

// 6. Design the run_phase
task run_phase(uvm_phase phase);
  transaction expected_tx; // transaction from predictor
  transaction actual_tx;  // transaction from DUT
  forever begin
    // get expected and actual output from fifo
    expected_fifo.get(expected_tx);
    actual_fifo.get(actual_tx);

    // print the transaction data to simulator terminal
    uvm_report_info("Comparator", $psprintf("\nexpected:\nrollover_val: %d\nnum_clk: %d\ncount_out: %d\nflag: %d\n~~~~~~~~~~~~~~~~~~\nactual:\ncount_out: %d\nflag:%d\n", expected_tx.rollover_value, expected_tx.num_clk, expected_tx.result_count_out, expected_tx.result_flag, actual_tx.result_count_out, actual_tx.result_flag));
    
    // compares if the data matches and the print
    if(expected_tx.compare(actual_tx)) begin
      m_matches++;
      uvm_report_info("Comparator", "Data Match");
    end else begin
      m_mismatches++;
      uvm_report_error("Comparator", "Error: Data Mismatch");
    end
  end
endtask


// 7. [optional] Print the overall results report_phase will be executed at the end of the simulation.
function void report_phase(uvm_phase phase);
  uvm_report_info("Comparator", $sformatf("Matches:    %0d", m_matches));
  uvm_report_info("Comparator", $sformatf("Mismatches: %0d", m_mismatches));
endfunction
