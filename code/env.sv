package env_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import reg_block_pkg::*;
import agent_pkg::*;
import adapter_pkg::*;

class environment extends uvm_env;
  
  agent      agt;
  reg_block  blk;   
  adapter    adp;
  
  `uvm_component_utils(environment)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    blk = reg_block::type_id::create("blk", this);
    blk.build();
    adp = adapter::type_id::create("adp",, get_full_name());
  endfunction
  

  function void connect_phase(uvm_phase phase);
     
    blk.default_map.set_sequencer( .sequencer(agt.sqr), .adapter(adp) );
    blk.default_map.set_base_addr('h4000_C000);        
    //// blk.add_hdl_path("tbench_top.DUT"); // somthing related to back-door I don't get it yet 
  endfunction

endclass
  
endpackage