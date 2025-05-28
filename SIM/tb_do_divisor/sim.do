if {[file isdirectory work]} {vdel -all -lib work}
vlib work
vmap work work

vlog -work work ../HDL/clock_divider.sv

vlog -work work tb_divisor.sv
vsim -voptargs=+acc work.tb_divisor

quietly set StdArithNoWarnings 1
quietly set StdVitalGlitchNoWarnings 1

do wave.do
run -all
