if {[file isdirectory work]} {vdel -all -lib work}
vlib work
vmap work work

vlog -work work ../HDL/fila.sv

vlog -work work tb_fila.sv
vsim -voptargs=+acc work.tb_fila

quietly set StdArithNoWarnings 1
quietly set StdVitalGlitchNoWarnings 1

do wave.do
run -all
