import uvm_pkg::*;
`include "uvm_macros.svh"
import test_pkg::*;

module tbench_top;

  bit clk;
  
  always #1 clk = ~clk;
  
  initial begin
    intf.rst = 1;
    #5 intf.rst =0;
  end

  interf intf(clk);
  
  UART_Registers DUT (
    .clk(clk),
    .rst(intf.rst),
    .addr(intf.addr),
    .wr_en(intf.wr_en),
    .valid(intf.valid),
    .wdata(intf.wdata),
    .rdata(intf.rdata)
   );
  
  initial begin 
    // uvm_config_db#(virtual interf)::set(uvm_root::get(),"*","vif",intf);
    uvm_config_db#(virtual interf)::set(null,"*","vif",intf);
    run_test("test");
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  initial begin 
  end
  
endmodule