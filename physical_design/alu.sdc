# =====================================
# ALU Timing Constraints
# Nangate45 - Experimental Setup
# =====================================

# Virtual clock: 10 ns
create_clock -name virtual_clk -period 10.0

# Input delay: 1 ns
set_input_delay 1.0 -clock virtual_clk [get_ports {A[*] B[*] opcode[*]}]

# Input transition: 100 ps
set_input_transition 0.1 [get_ports {A[*] B[*] opcode[*]}]

# Output delay: 1 ns
set_output_delay 1.0 -clock virtual_clk [get_ports {result[*] carry}]

# Output load: 5 fF
set_load 5.0 [get_ports {result[*] carry}]
