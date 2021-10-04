vlib work 

vcom -93 -work work CompteurEmission.vhd
vcom -93 -work work DecalageEmission.vhd
vcom -93 -work work machineEtatEmission.vhd
vcom -93 -work work emission.vhd
vcom -93 -work work FDIV.vhd
vcom -93 -work work machineEtatReception.vhd
vcom -93 -work work reception.vhd
vcom -93 -work work uart.vhd
vcom -93 -work work uart_tb.vhd

vsim uart_tb(bench)
view signals
add wave *
run -all