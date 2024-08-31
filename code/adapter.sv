package adapter_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
import sequences_pkg::*;
import reg_pkg::*;
import sequenceItem_pkg::*;

class adapter extends uvm_reg_adapter;
  `uvm_object_utils (adapter)

  function new (string name = "adapter");
      super.new (name);
   endfunction
  
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    seq_item tx;    
    tx = seq_item::type_id::create("tx");
    
    tx.wr_en = (rw.kind == UVM_WRITE);
    tx.addr  = rw.addr;
    if (tx.wr_en)  tx.wdata = rw.data;
    if (!tx.wr_en) tx.rdata = rw.data;
    tx.valid = 1;
    return tx;
  endfunction

  function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    seq_item tx;
    
    assert( $cast(tx, bus_item) )
      else `uvm_fatal("", "A bad thing has just happened in my_adapter")

    rw.kind = tx.wr_en ? UVM_WRITE : UVM_READ;
    rw.addr = tx.addr;
    rw.data = tx.rdata;
    
    rw.status = UVM_IS_OK;
  endfunction
endclass

endpackage