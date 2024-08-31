// mem_interface
interface interf(input logic clk);

  //// declaring the signals
  logic         rst;
  logic [31:0]  addr;
  logic         wr_en;
  logic         valid;
  logic [31:0]  wdata;
  logic [31:0]  rdata;
  
  //// driver clocking block
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    output rst;
    output addr;
    output wr_en;
    output valid;
    output wdata;
    input  rdata;  
  endclocking
  
  //// monitor clocking block
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input rst;
    input addr;
    input wr_en;
    input valid;
    input wdata;
    input rdata;  
  endclocking
  
  //// driver modport
  modport DRIVER  (clocking driver_cb,input clk);
  
  //// monitor modport  
  modport MONITOR (clocking monitor_cb,input clk);
  
endinterface