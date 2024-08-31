package reg_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

class UART0_DR_R extends uvm_reg;
  `uvm_object_utils(UART0_DR_R)
   
  rand uvm_reg_field DATA;
  rand uvm_reg_field FE;
  rand uvm_reg_field PE;
  rand uvm_reg_field BE;
  rand uvm_reg_field OE;
  uvm_reg_field RESERVED;

  function new (string name = "UART0_DR_R");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build; 
    
    // Create bitfield
    // field = uvm_reg_field::type_id::create("field");   
    // Configure
    // field.configure(.parent(), .size(), .lsb_pos(), .access(),  .volatile(), .reset(), .has_reset(), .is_rand(), .individually_accessible()); 
    // Below line is equivalen to above one   
    // field.configure(this,       32,   0,   "RW",        0,        0,        1,      1,          0); 
    //                  reg, bitwidth, lsb, access, volatile, reselVal, hasReset, isRand, fieldAccess
    
    DATA     = uvm_reg_field::type_id::create("DATA")     ;   
    FE       = uvm_reg_field::type_id::create("FE")       ;   
    PE       = uvm_reg_field::type_id::create("PE")       ;   
    BE       = uvm_reg_field::type_id::create("BE")       ;   
    OE       = uvm_reg_field::type_id::create("OE")       ;   
    RESERVED = uvm_reg_field::type_id::create("RESERVED") ;
    DATA.configure(
      .parent(this), .size(8), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    FE.configure(
      .parent(this), .size(1), .lsb_pos(8),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    PE.configure(
      .parent(this), .size(1), .lsb_pos(9),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    BE.configure(
      .parent(this), .size(1), .lsb_pos(10),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    OE.configure(
      .parent(this), .size(1), .lsb_pos(11),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    RESERVED.configure(
      .parent(this), .size(20), .lsb_pos(12),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(0), .individually_accessible(1)
    );

    endfunction
endclass

////	Register Class defination - UART0_RSR_R
class UART0_RSR_R extends uvm_reg;
  `uvm_object_utils(UART0_RSR_R)
   
  rand uvm_reg_field FE  ;
  rand uvm_reg_field PE  ;
  rand uvm_reg_field BE  ;
  rand uvm_reg_field OE  ;
  uvm_reg_field RESERVED ;

  function new (string name = "UART0_RSR_R");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

  function void build; 

    // Create bitfield
    // field = uvm_reg_field::type_id::create("field");   
    // Configure
    // field.configure(.parent(), .size(), .lsb_pos(), .access(),  .volatile(), .reset(), .has_reset(), .is_rand(), .individually_accessible()); 
    // Below line is equivalen to above one   
    // field.configure(this,       32,   0,   "RW",        0,        0,        1,      1,          0); 
    //                  reg, bitwidth, lsb, access, volatile, reselVal, hasReset, isRand, fieldAccess

    FE       = uvm_reg_field::type_id::create("FE")       ;   
    PE       = uvm_reg_field::type_id::create("PE")       ;   
    BE       = uvm_reg_field::type_id::create("BE")       ;   
    OE       = uvm_reg_field::type_id::create("OE")       ;   
    RESERVED = uvm_reg_field::type_id::create("RESERVED") ;
    FE.configure(
      .parent(this), .size(1), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    PE.configure(
      .parent(this), .size(1), .lsb_pos(1),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    BE.configure(
      .parent(this), .size(1), .lsb_pos(2),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    OE.configure(
      .parent(this), .size(1), .lsb_pos(3),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    RESERVED.configure(
      .parent(this), .size(28), .lsb_pos(4),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(0), .individually_accessible(1)
    );

    endfunction
endclass

////	Register Class defination - UART0_FR_R
class UART0_FR_R extends uvm_reg;
  `uvm_object_utils(UART0_FR_R)
   
  rand uvm_reg_field RESERVED_1;
  rand uvm_reg_field BUSY;
  rand uvm_reg_field RXFE;
  rand uvm_reg_field TXFF;
  rand uvm_reg_field RXFF;
  rand uvm_reg_field TXFE;
  rand uvm_reg_field RESERVED_2;
  
  function new (string name = "UART0_FR_R");
    super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
  endfunction

  function void build; 

    // Create bitfield
    // field = uvm_reg_field::type_id::create("field");   
    // Configure
    // field.configure(.parent(), .size(), .lsb_pos(), .access(),  .volatile(), .reset(), .has_reset(), .is_rand(), .individually_accessible()); 
    // Below line is equivalen to above one   
    // field.configure(this,       32,   0,   "RW",        0,        0,        1,      1,          0); 
    //                  reg, bitwidth, lsb, access, volatile, reselVal, hasReset, isRand, fieldAccess

    RESERVED_1 = uvm_reg_field::type_id::create("RESERVED_1") ;   
    BUSY       = uvm_reg_field::type_id::create("BUSY")       ;   
    RXFE       = uvm_reg_field::type_id::create("RXFE")       ;   
    TXFF       = uvm_reg_field::type_id::create("TXFF")       ;   
    RXFF       = uvm_reg_field::type_id::create("RXFF")       ;   
    TXFE       = uvm_reg_field::type_id::create("TXFE")       ;
    RESERVED_2 = uvm_reg_field::type_id::create("RESERVED_2") ;
    
    RESERVED_1.configure(
      .parent(this), .size(3), .lsb_pos(0),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(0), .individually_accessible(1)
    );
    BUSY.configure(
      .parent(this), .size(1), .lsb_pos(3),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    RXFE.configure(
      .parent(this), .size(1), .lsb_pos(4),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    TXFF.configure(
      .parent(this), .size(1), .lsb_pos(5),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    RXFF.configure(
      .parent(this), .size(1), .lsb_pos(6),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    TXFE.configure(
      .parent(this), .size(1), .lsb_pos(7),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(1), .is_rand(1), .individually_accessible(1)
    );
    RESERVED_2.configure(
      .parent(this), .size(24), .lsb_pos(8),
      .access("RW"),  .volatile(0), .reset(0),
      .has_reset(0), .is_rand(0), .individually_accessible(1)
    );

    endfunction
endclass

////	Register Class defination - UART0_IBRD_R
// class UART0_IBRD_R extends uvm_reg;
//   `uvm_object_utils(UART0_IBRD_R)
   
//   rand uvm_reg_field FIELD_MAME;

//   //// Constructor 
//   function new (string name = "UART0_IBRD_R");
//     super.new(name,32,UVM_NO_COVERAGE); //32 -> Register Width
//   endfunction
  
//   function void build; 
    
//     //// Create bitfield
//     FIELD_MAME = uvm_reg_field::type_id::create("FIELD_MAME");   
//     //// Configure
//     FIELD_MAME.configure(.parent(this), 
//                    .size(32), 
//                    .lsb_pos(0),  
//                    .access("RW"),   
//                    .volatile(0),  
//                    .reset(0),  
//                    .has_reset(1),  
//                    .is_rand(1),  
//                    .individually_accessible(0));   
//     endfunction
// endclass
  
endpackage