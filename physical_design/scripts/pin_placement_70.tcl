read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db physical_design/stages/floorplan/alu_floorplan_70.odb
read_sdc physical_design/alu.sdc

place_pins -hor_layers metal3 -ver_layers metal2

write_db physical_design/stages/pin_placement/alu_pins_70.odb
write_def physical_design/stages/pin_placement/alu_pins_70.def

puts "70% UTILIZATION I/O PIN PLACEMENT COMPLETED"
