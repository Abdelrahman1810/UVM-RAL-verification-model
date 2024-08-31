package reg_sequence_pkg;
//	Register Access Sequence
import uvm_pkg::*;
`include "uvm_macros.svh"
import reg_block_pkg::*;
import sequenceItem_pkg::*;

class reg_sequence extends uvm_sequence;

  `uvm_object_utils(reg_sequence)
  
  reg_block blk;
  seq_item item;
    
  function new (string name = ""); 
    super.new(name);    
  endfunction
  

  task body;  
    uvm_status_e   status;
    uvm_reg_data_t incoming;
    bit [31:0]     rdata;
    bit [7:0] data;
    bit read_reg;
    item = seq_item::type_id::create("item");


  // RAL checking
  // Access full register
    //Write to the Registers
      assert (item.randomize());
      blk.reg_UART0_DR_R.write(status, item.wdata);
      assert (item.randomize());
      blk.reg_UART0_RSR_R.write(status, item.wdata);
      assert (item.randomize());
      blk.reg_UART0_FR_R.write(status, item.wdata);
      
    //Read from the registers
      blk.reg_UART0_DR_R.read(status, rdata);
      blk.reg_UART0_RSR_R.read(status, rdata);
      blk.reg_UART0_FR_R.read(status, rdata);

  // Access specefic fields
  /// Ignore warning appears about this part of code
    /// reporter [RegModel] Target bus does not support byte enabling ///
  /// it's an issue in UVM version

    //Write to the fields
      blk.reg_UART0_DR_R.DATA.write(status, 'hAC);
      blk.reg_UART0_FR_R.TXFF.write(status, 'b1);
      
    //Read from the fields
      blk.reg_UART0_DR_R.DATA.read(status, data);
      blk.reg_UART0_FR_R.TXFF.read(status, read_reg);     
  endtask
endclass
endpackage