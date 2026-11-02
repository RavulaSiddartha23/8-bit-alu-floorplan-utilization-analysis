read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_verilog synthesis/alu_mapped.v
link_design alu
read_sdc physical_design/alu.sdc

initialize_floorplan -utilization 70 -aspect_ratio 1.0 -core_space 5 -site FreePDK45_38x28_10R_NP_162NW_34O
make_tracks

report_design_area

write_db physical_design/stages/floorplan/alu_floorplan_70.odb

puts "70% UTILIZATION FLOORPLAN COMPLETED"
