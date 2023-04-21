onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_completer/apb_slave_if/PCLK
add wave -noupdate /tb_completer/apb_slave_if/PRESETn
add wave -noupdate /tb_completer/apb_slave_if/PADDR
add wave -noupdate /tb_completer/apb_slave_if/PRDATA
add wave -noupdate /tb_completer/apb_slave_if/PWDATA
add wave -noupdate /tb_completer/apb_slave_if/PPROT
add wave -noupdate /tb_completer/apb_slave_if/PSEL
add wave -noupdate /tb_completer/apb_slave_if/PENABLE
add wave -noupdate /tb_completer/apb_slave_if/PWRITE
add wave -noupdate /tb_completer/apb_slave_if/PSTRB
add wave -noupdate /tb_completer/apb_slave_if/PREADY
add wave -noupdate /tb_completer/apb_slave_if/PSLVERR
add wave -noupdate /tb_completer/bus_slave_if/wen
add wave -noupdate /tb_completer/bus_slave_if/ren
add wave -noupdate /tb_completer/bus_slave_if/request_stall
add wave -noupdate /tb_completer/bus_slave_if/addr
add wave -noupdate /tb_completer/bus_slave_if/error
add wave -noupdate /tb_completer/bus_slave_if/strobe
add wave -noupdate /tb_completer/bus_slave_if/wdata
add wave -noupdate /tb_completer/bus_slave_if/rdata
add wave -noupdate /tb_completer/bus_slave_if/is_burst
add wave -noupdate /tb_completer/bus_slave_if/burst_type
add wave -noupdate /tb_completer/bus_slave_if/burst_length
add wave -noupdate /tb_completer/bus_slave_if/secure_transfer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {555208162126 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1686797679 ns}
