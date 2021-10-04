vlib work
vcom -93 -work work CompteurEmission.vhd
vcom -93 -work work DecalageEmission.vhd
vcom -93 -work work machineEtatEmission.vhd
vcom -93 -work work emission.vhd
vcom -93 -work work emission_tb.vhd

vsim emission_tb(bench)
view signals
add wave *
run -all