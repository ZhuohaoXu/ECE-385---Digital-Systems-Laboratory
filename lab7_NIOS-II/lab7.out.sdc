## Generated SDC file "lab7.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

## DATE    "Fri Oct 16 01:50:09 2020"

##
## DEVICE  "10M50DAF484C7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_oci_break:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr[33]}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr[0]}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr[34]}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_ocimem:the_lab7_soc_nios2_gen2_0_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_tck:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_tck|*sr*}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_sysclk:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper|lab7_soc_nios2_gen2_0_cpu_debug_slave_sysclk:the_lab7_soc_nios2_gen2_0_cpu_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*lab7_soc_nios2_gen2_0_cpu:*|lab7_soc_nios2_gen2_0_cpu_nios2_oci:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci|lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug:the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug|monitor_go}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] 100.000
set_max_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] -100.000
set_min_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************

set_net_delay -max 2.000 -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}]
set_net_delay -max 2.000 -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}]
