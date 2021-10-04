vlib work

vcom -93 -work work FDIV.vhd
vcom -93 -work work machineEtatReception.vhd
vcom -93 -work work reception.vhd
vcom -93 -work work reception_tb.vhd

vsim reception_tb(bench)
view signals
add wave *
run -all
