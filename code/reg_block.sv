package reg_block_pkg;
  
import uvm_pkg::*;
`include "uvm_macros.svh"
import reg_pkg::*;

////	Register Block
class reg_block extends uvm_reg_block;
  `uvm_object_utils(reg_block)
  
  // register instances 
  rand UART0_DR_R 	reg_UART0_DR_R; 
  rand UART0_RSR_R 	reg_UART0_RSR_R;
  rand UART0_FR_R 	reg_UART0_FR_R;
  // rand UART0_IBRD_R reg_UART0_IBRD_R;
  
  function new (string name = "");
    super.new(name, build_coverage(UVM_NO_COVERAGE));
  endfunction

  function void build;
    
    // reg creation
    reg_UART0_DR_R = UART0_DR_R::type_id::create("reg_UART0_DR_R");
    reg_UART0_DR_R.build();
    reg_UART0_DR_R.configure(this);
 
    reg_UART0_RSR_R = UART0_RSR_R::type_id::create("reg_UART0_RSR_R");
    reg_UART0_RSR_R.build();
    reg_UART0_RSR_R.configure(this);
    
    reg_UART0_FR_R = UART0_FR_R::type_id::create("reg_UART0_FR_R");
    reg_UART0_FR_R.build();
    reg_UART0_FR_R.configure(this);
  
    // reg_UART0_IBRD_R = UART0_IBRD_R::type_id::create("reg_UART0_IBRD_R");
    // reg_UART0_IBRD_R.build();
    // reg_UART0_IBRD_R.configure(this);
    
    // memory map creation and reg map to it
    default_map = create_map("my_map", 'h4000_C000, 4, UVM_LITTLE_ENDIAN, 1); // name, base, nBytes
    default_map.add_reg(reg_UART0_DR_R	, 'h0000_0000, "RW");  // reg, offset, access
    default_map.add_reg(reg_UART0_RSR_R	, 'h0000_0004, "RW");
    default_map.add_reg(reg_UART0_FR_R	, 'h0000_0008, "RW");
    // default_map.add_reg(reg_UART0_IBRD_R, 'hC, "RW");    
    lock_model();
  endfunction
endclass
endpackage