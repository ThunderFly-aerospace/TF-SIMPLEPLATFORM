//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_3005.scad>

translate([0,0,50])
    rotate([-90,0,0])
        888_3005();
