# operating conditions and boundary conditions #

set cycle  50         ;#clock period defined by designer

create_clock -period $cycle [get_ports  clk]
set_dont_touch_network      [all_clocks]
set_fix_hold                [all_clocks]
set_clock_uncertainty  0.1  [all_clocks]
set_clock_latency      0.5  [all_clocks]
set_ideal_network           [get_ports clk]

#Don't touch the basic env setting as below
set_input_delay  1     -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 1     -clock clk [all_outputs] 
set_load         1     [all_outputs]
set_drive        1     [all_inputs]

set_operating_conditions -max_library slow -max slow
set_wire_load_model -name tsmc18_wl10 -library slow                        

set_max_fanout 6 [all_inputs]

                       
