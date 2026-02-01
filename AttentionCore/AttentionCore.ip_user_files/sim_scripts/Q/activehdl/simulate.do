transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+Q  -L blk_mem_gen_v8_4_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.Q xil_defaultlib.glbl

do {Q.udo}

run

endsim

quit -force
