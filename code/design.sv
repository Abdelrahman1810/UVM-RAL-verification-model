module UART_Registers #( 
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
  input   logic                   clk   ,
  input   logic                   rst   ,
  
  input   logic [ADDR_WIDTH-1:0]  addr  ,
  input   logic                   wr_en ,
  input   logic                   valid ,
  
  input   logic [DATA_WIDTH-1:0]  wdata ,
  output  logic [DATA_WIDTH-1:0]  rdata
); 
  
  logic [DATA_WIDTH-1:0] t_data;
  
  reg [DATA_WIDTH-1:0] UART0_DR_R;
  reg [DATA_WIDTH-1:0] UART0_RSR_R;
  reg [DATA_WIDTH-1:0] UART0_FR_R;
  // reg [DATA_WIDTH-1:0] UART0_IBRD_R;
  
  always @(posedge rst) begin
    UART0_DR_R        <= 0;
    UART0_RSR_R     <= 0;
    UART0_FR_R  <= 0;
    // UART0_IBRD_R <= 0;
  end

  assign rdata = t_data;

  always @(posedge clk) begin
    if (wr_en & valid) begin
           if (addr == 32'h4000_C000) UART0_DR_R   <= wdata;
      else if (addr == 32'h4000_C004) UART0_RSR_R  <= wdata;
      else if (addr == 32'h4000_C008) UART0_FR_R   <= wdata;
      // else if (addr == 32'h40C) UART0_IBRD_R <= wdata;
      $display("Design WR addr %0h Data %0h",addr,wdata);
    end
    else if (!wr_en & valid) begin
      
           if (addr == 32'h4000_C000) t_data = UART0_DR_R   ;
      else if (addr == 32'h4000_C004) t_data = UART0_RSR_R  ;
      else if (addr == 32'h4000_C008) t_data = UART0_FR_R   ;
      // else if (addr == 32'h40C) t_data = UART0_IBRD_R  ;
      $display("Design RD addr %0h Data %0h",addr,t_data);
    end
  end  

endmodule