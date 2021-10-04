vlib work

vcom -93 -work work CompteurEmission.vhd
vcom -93 -work work DecalageEmission.vhd
vcom -93 -work work machineEtatEmission.vhd
vcom -93 -work work emission.vhd
vcom -93 -work work FDIV.vhd
vcom -93 -work work machineEtatReception.vhd
vcom -93 -work work reception.vhd
vcom -93 -work work telemetre.vhd
vcom -93 -work work projet.vhd
vcom -93 -work work projet_tb.vhd

vsim projet_tb(bench)
view signals
add wave *
run -all