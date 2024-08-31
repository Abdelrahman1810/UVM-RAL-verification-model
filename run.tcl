vlib work
vlog {code\shared_pkg.sv}
vlog {code\design.sv}
vlog {code\interface.sv}

vlog {code\sequenceItem.sv}
vlog {code\sequencer.sv}
vlog {code\driver.sv}
vlog {code\monitor.sv}

vlog {code\reg.sv}
vlog {code\reg_block.sv}
vlog {code\sequences.sv}
vlog {code\reg_sequence.sv}
vlog {code\adapter.sv}
vlog {code\agent.sv}
vlog {code\env.sv}
vlog {code\test.sv}
vlog {code\top.sv}

vsim -voptargs=+acc work.tbench_top

add wave -position insertpoint  \
sim:/tbench_top/DUT/ADDR_WIDTH \
sim:/tbench_top/DUT/DATA_WIDTH \
sim:/tbench_top/DUT/clk \
sim:/tbench_top/DUT/rst \
sim:/tbench_top/DUT/addr \
sim:/tbench_top/DUT/wr_en \
sim:/tbench_top/DUT/valid \
sim:/tbench_top/DUT/wdata \
sim:/tbench_top/DUT/rdata \
sim:/tbench_top/DUT/t_data \
sim:/tbench_top/DUT/UART0_DR_R \
sim:/tbench_top/DUT/UART0_RSR_R \
sim:/tbench_top/DUT/UART0_FR_R 
# sim:/tbench_top/DUT/UART0_IBRD_R 

run -all
# quit -sim