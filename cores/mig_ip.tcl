open_project {./managed_ip_project/managed_ip_project.xpr}
create_ip -name mig_7series -vendor xilinx.com -library ip -module_name mig_7series_0 -dir {./}
set_property -dict [list CONFIG.XML_INPUT_FILE {../managed_ip_project/mig.prj} CONFIG.RESET_BOARD_INTERFACE {Custom} CONFIG.MIG_DONT_TOUCH_PARAM {Custom} CONFIG.BOARD_MIG_PARAM {Custom}] [get_ips mig_7series_0]
generate_target all [get_files {./../cores/mig_7series_0/mig_7series_0.xci}]
catch { config_ip_cache -export [get_ips -all mig_7series_0] }
export_ip_user_files -of_objects [get_files {./../cores/mig_7series_0/mig_7series_0.xci}] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] {./../cores/mig_7series_0/mig_7series_0.xci}]
launch_runs -jobs 16 mig_7series_0_synth_1
wait_on_run mig_7series_0_synth_1
export_simulation -of_objects [get_files {./../cores/mig_7series_0/mig_7series_0.xci}] -directory {.//ip_user_files/sim_scripts} -ip_user_files_dir {.//ip_user_files} -ipstatic_source_dir {.//ip_user_files/ipstatic} -lib_map_path [list {modelsim=.//managed_ip_project/managed_ip_project.cache/compile_simlib/modelsim} {questa=.//managed_ip_project/managed_ip_project.cache/compile_simlib/questa} {ies=.//managed_ip_project/managed_ip_project.cache/compile_simlib/ies} {xcelium=.//managed_ip_project/managed_ip_project.cache/compile_simlib/xcelium} {vcs=.//managed_ip_project/managed_ip_project.cache/compile_simlib/vcs} {riviera=.//managed_ip_project/managed_ip_project.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
