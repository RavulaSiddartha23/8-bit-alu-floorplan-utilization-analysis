# Load physical library
read_lef pdk/nangate45/lef/Nangate45-opt.lef
read_liberty pdk/nangate45/lib/NangateOpenCellLibrary_typical.lib

# Load mapped ALU
read_verilog synthesis/alu_mapped.v
link_design alu

# Load timing constraints
read_sdc physical_design/alu.sdc

# Initialize floorplan
initialize_floorplan -utilization 30 -aspect_ratio 1.0 -core_space 5 -site FreePDK45_38x28_10R_NP_162NW_34O

# Create placement rows
make_tracks

# Report floorplan information
report_design_area

# Save floorplan database
write_db physical_design/stages/floorplan/alu_floorplan_30.odb

puts "30 PERCENT UTILIZATION FLOORPLAN COMPLETED"
