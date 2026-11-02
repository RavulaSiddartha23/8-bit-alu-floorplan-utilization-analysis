# Load Nangate45 physical and timing libraries
read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib

# Load the original 30% floorplan
read_db physical_design/stages/floorplan/alu_floorplan_30.odb

# Load timing constraints
read_sdc physical_design/alu.sdc

# Place input and output pins
# Horizontal pins: metal3
# Vertical pins: metal2
place_pins -hor_layers metal3 -ver_layers metal2

# Save the pin-placed design separately
write_db physical_design/stages/pin_placement/alu_pins_30.odb
write_def physical_design/stages/pin_placement/alu_pins_30.def

puts "30% UTILIZATION I/O PIN PLACEMENT COMPLETED"
