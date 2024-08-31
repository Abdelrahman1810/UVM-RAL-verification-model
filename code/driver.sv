package driver_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"
import sequenceItem_pkg::*;

////	driver
`define DRIV_IF vif.DRIVER.driver_cb

class driver extends uvm_driver #(seq_item);

  virtual interf vif;
  `uvm_component_utils(driver)
    
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

 //// build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     if(!uvm_config_db#(virtual interf)::get(this, "", "vif", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  
  endfunction: build_phase

  seq_item item;

  virtual task run_phase(uvm_phase phase);
    forever begin
      item = seq_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive();
      seq_item_port.item_done();
    end
  endtask
  
  virtual task drive();
    `DRIV_IF.valid  <= 0 ;   
    @(posedge vif.DRIVER.clk);
    
    `DRIV_IF.rst    <= item.rst    ; 
    `DRIV_IF.addr   <= item.addr   ; 
    `DRIV_IF.wr_en  <= item.wr_en  ;   
    `DRIV_IF.valid  <= item.valid  ;  

    if(item.wr_en) begin // write
      `DRIV_IF.wdata  <= item.wdata  ;   
      @(posedge vif.DRIVER.clk);
    end else begin // read
      @(posedge vif.DRIVER.clk);
      item.rdata <= `DRIV_IF.rdata   ;
    end
    
    `DRIV_IF.valid  <= 0  ;   
  endtask

endclass
    
endpackage