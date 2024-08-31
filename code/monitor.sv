package monitor_pkg;
    
import uvm_pkg::*;
`include "uvm_macros.svh"
import sequenceItem_pkg::*;

`define MON vif.MONITOR.monitor_cb

//// monitor
class monitor extends uvm_monitor;

  virtual interf vif;
  
  uvm_analysis_port #(seq_item) mon_port;
  
  seq_item item;

  `uvm_component_utils(monitor)

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual interf)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
    item = seq_item::type_id::create("item");
    mon_port = new("mon_port", this);
  endfunction: build_phase
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.MONITOR.clk);
      wait(`MON.valid);
        item.addr = `MON.addr;
        item.wr_en = `MON.wr_en;
      
      if(`MON.wr_en) begin
        item.wr_en = `MON.wr_en;
        item.wdata = `MON.wdata;
        @(posedge vif.MONITOR.clk);
      end
      else begin
        @(posedge vif.MONITOR.clk);
        item.rdata = `MON.rdata;
      end
	    mon_port.write(item);
    end 
  endtask

endclass
endpackage