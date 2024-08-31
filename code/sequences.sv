/* 
This File Contains:
1. Sequence item -> seq_item
2. Sequencer -> sequencer
3. Sequences -> Sequences 
4. driver    -> driver 
*/
package sequences_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

import sequenceItem_pkg::*;
import sequencer_pkg::*;
import shared_pkg::*;

//// write_sequence - "write" type
class write_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(write_sequence)
   
  function new(string name = "write_sequence");
    super.new(name);
  endfunction
  
  seq_item item;

  virtual task body();
    repeat(WRITE_LOOP) begin
      item = seq_item::type_id::create("item");
      start_item(item);
      assert (item.randomize());
      item.wr_en = 1;
      finish_item(item);
    end
  endtask
endclass

//// read_sequence - "read" type
class read_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(read_sequence)
   
  function new(string name = "read_sequence");
    super.new(name);
  endfunction
  
  seq_item item;

  virtual task body();
    repeat(READ_LOOP) begin
      item = seq_item::type_id::create("item");
      start_item(item);
      assert (item.randomize());
      item.wr_en = 0;
      finish_item(item);
    end
  endtask
endclass

//// reset_sequence - "reset" type
class reset_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(reset_sequence)
   
  function new(string name = "reset_sequence");
    super.new(name);
  endfunction
  
  seq_item item;
  
  virtual task body();
      item = seq_item::type_id::create("item");
      start_item(item);
      item.rst = 1;
      finish_item(item);

      #30;

      start_item(item);
      item.rst = 0;
      finish_item(item);
  endtask
endclass

endpackage