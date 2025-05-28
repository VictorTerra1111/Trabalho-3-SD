onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate tb_deserializador/data_in
add wave -noupdate tb_deserializador/reset
add wave -noupdate tb_deserializador/clock_100KHz
add wave -noupdate tb_deserializador/ack_in
add wave -noupdate tb_deserializador/write_in
add wave -noupdate tb_deserializador/status_out
add wave -noupdate tb_deserializador/data_out
add wave -noupdate tb_deserializador/data_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {377768 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1050 us}
view wave
WaveCollapseAll -1
