package test_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import env_pkg::*;
import sequences_pkg::*;
import reg_pkg::*;
import reg_sequence_pkg::*;

class test extends uvm_test;

  `uvm_component_utils(test)
  
  environment env;
  reg_sequence reg_seq;
  write_sequence write_seq;
  read_sequence read_seq;
  reset_sequence rst_seq;

  function new(string name = "test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = environment::type_id::create("env", this);
    reg_seq = reg_sequence::type_id::create("reg_seq");
    write_seq = write_sequence::type_id::create("write_seq");
    read_seq = read_sequence::type_id::create("read_seq");
    rst_seq = reset_sequence::type_id::create("rst_seq");
  endfunction
  
 function void report_phase(uvm_phase phase);
   uvm_report_server svr;
   super.report_phase(phase);
   
   svr = uvm_report_server::get_server();
   if(svr.get_severity_count(UVM_FATAL)+svr.get_severity_count(UVM_ERROR)>0) begin
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     `uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end
    else begin
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     `uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end
  endfunction 

  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
      reg_seq.blk       = env.blk;
      
      `uvm_info(get_type_name(), "---------------------reg_seq start------------------", UVM_MEDIUM)
      reg_seq.start(env.agt.sqr);
      
      `uvm_info(get_type_name(), "---------------------rst_seq start------------------", UVM_MEDIUM)
      rst_seq.start(env.agt.sqr);
      
      `uvm_info(get_type_name(), "---------------------write_seq start------------------", UVM_MEDIUM)
      write_seq.start(env.agt.sqr);
      
      `uvm_info(get_type_name(), "---------------------read_seq start------------------", UVM_MEDIUM)
      read_seq.start(env.agt.sqr);
      
      `uvm_info(get_type_name(), "---------------------rst_seq start------------------", UVM_MEDIUM)
      rst_seq.start(env.agt.sqr);

    phase.drop_objection(this);
    
    // set a drain-time
    phase.phase_done.set_drain_time(this, 50);
  endtask

endclass  
endpackage