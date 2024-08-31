package sequenceItem_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

class seq_item extends uvm_sequence_item;

  bit       rst;
  rand bit [31:0] addr;
  rand bit       wr_en;
  rand bit [31:0] wdata;
       bit [31:0] rdata;
  rand bit valid;

  `uvm_object_utils_begin(seq_item)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wr_en,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_object_utils_end

int arr[] = '{32'h4000_C000, 32'h4000_C004, 32'h4000_C008};
  constraint cons {
    valid dist {1:=98, 0:=2};
    addr inside {arr};
  }
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
endclass
    
endpackage
