read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db physical_design/stages/cell_placement/alu_placed_70.odb
read_sdc physical_design/alu.sdc

set_wire_rc -signal -layer metal3

global_route
estimate_parasitics -global_routing

report_checks -path_delay max
report_design_area

write_db physical_design/stages/global_routing/alu_global_route_70.odb
write_def physical_design/stages/global_routing/alu_global_route_70.def

puts "70% UTILIZATION GLOBAL ROUTING COMPLETED"
