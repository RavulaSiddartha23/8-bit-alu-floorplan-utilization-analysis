read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db physical_design/stages/pin_placement/alu_pins_70.odb
read_sdc physical_design/alu.sdc

set_wire_rc -signal -layer metal3

global_placement -density 0.7
detailed_placement

check_placement -verbose
estimate_parasitics -placement

write_db physical_design/stages/cell_placement/alu_placed_70.odb
write_def physical_design/stages/cell_placement/alu_placed_70.def

puts "70% UTILIZATION PLACEMENT COMPLETED"
