package agent_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import sequences_pkg::*;
import sequenceItem_pkg::*;
import sequencer_pkg::*;
import driver_pkg::*;
import monitor_pkg::*;

class agent extends uvm_agent;

  driver    drv;
  sequencer sqr;
  monitor   mon;

  `uvm_component_utils(agent)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    mon = monitor::type_id::create("mon", this);

    if(get_is_active() == UVM_ACTIVE) begin
      drv    = driver::type_id::create("drv", this);
      sqr = sequencer::type_id::create("sqr", this);
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
  endfunction

endclass

endpackage