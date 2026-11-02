# 1. Load physical technology and standard-cell LEF
read_lef pdk/nangate45/lef/Nangate45-opt.lef

# 2. Load standard-cell timing library
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib

# 3. Load technology-mapped ALU netlist
read_verilog synthesis/alu_mapped.v

# 4. Link top-level design
link_design alu

# 5. Load timing constraints
read_sdc physical_design/alu.sdc

# 6. Check timing setup
check_setup

# 7. Report design statistics
report_design_area

puts "ALU LIBRARY AND DESIGN VALIDATION COMPLETED"
