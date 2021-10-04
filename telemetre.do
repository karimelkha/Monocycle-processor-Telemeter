vlib work 

vcom -93 -work work telemetre.vhd
vcom -93 -work work telemetre_tb.vhd

vsim telemetre_tb(bench)
view signals
add wave *
run -all