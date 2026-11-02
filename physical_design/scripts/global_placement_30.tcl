# Load Nangate45 physical and timing libraries
read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib

# Load 30% floorplan with completed I/O pin placement
read_db physical_design/stages/pin_placement/alu_pins_30.odb

# Load timing constraints
read_sdc physical_design/alu.sdc

# Set signal wire resistance and capacitance estimation
set_wire_rc -signal -layer metal3

# Perform global placement
global_placement -density 0.7

# Perform detailed placement
detailed_placement

# Check placement legality
check_placement -verbose

# Estimate parasitics after placement
estimate_parasitics -placement

# Save placement results
write_db physical_design/stages/cell_placement/alu_placed_30.odb
write_def physical_design/stages/cell_placement/alu_placed_30.def

puts "30% UTILIZATION PLACEMENT COMPLETED"
