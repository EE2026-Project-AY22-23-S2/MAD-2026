# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.cache/wt [current_project]
set_property parent.project_path C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu0.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu1.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu3.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu4.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu5.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/menu2.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/lockscreen.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/unlock1.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/unlock2.mem
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/unlock0.mem
}
read_verilog -library xil_defaultlib {
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/AudioInModule.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/AudioOutModule.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/imports/Desktop/Audio_Input.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/BlueMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/BlurMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/BlurringModule.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/ClapCounter.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Draw.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_CartMaster.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_DFF.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_OLED_Writer.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_RNG.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_Segment_Digits.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_car_position.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_clk_480hz.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_clocks.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_coins.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_points_counter.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_segment_counter.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Cart/E_y_movement.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/ErsMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/GreenMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/GreyMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/IndividualTasks.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Lenzes.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/OledDigitsModule.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/imports/Desktop/Oled_Display.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/OutlMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/OutlineFinder.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/RedMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/SelectColor.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/TeamBeeper.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/TeamTask.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/ThousandHZ.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/VHpaint.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/ZoomMode7Seg.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/altMouseDisplay.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/binary_to_seg_converter.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/clk.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/convertXY.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/count_100kHz.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/debouncer.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/debouncer_button.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/extract_exact_vol.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/handleClick.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/loud_range.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/mouseDisplay.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/mouse_disp_indv.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/oled_bar.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/oled_digit_0.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/oled_digit_4.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/oled_digit_5.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/oled_digit_6.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/ringerModule.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/seg_blocks.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/seg_display_mod_k.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/segment_display.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/segment_recog.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/soft_range.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/view_wvfrm.v
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/new/Top_Student.v
}
read_vhdl -library xil_defaultlib {
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/imports/Desktop/Audio_Output.vhd
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/imports/Desktop/Mouse_Control.vhd
  C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/sources_1/imports/Desktop/Ps2Interface.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/constrs_1/new/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/eugen/Downloads/rush2.xpr/MouseAudioDisplay/MouseAudioDisplay.srcs/constrs_1/new/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top_Student -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top_Student.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_Student_utilization_synth.rpt -pb Top_Student_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
