//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_1007.scad>

for(j=[-10,10])
for(i=[-10,10])
translate([i,j,0])
    888_1007();
