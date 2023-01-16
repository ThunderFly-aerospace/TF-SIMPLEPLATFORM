//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_2002.scad>

translate([0, 0, ALU_profile_width/2+2.5])
rotate([-90, 0, 0])
888_2002();
