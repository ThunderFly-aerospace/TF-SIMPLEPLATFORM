//@set_slicing_config(../../slicing/gensupport.ini)
include <../../parameters.scad>

use <../888_1005.scad>

rotate([180,0,0])
{
translate([0, -30, 0])
    888_1005(true);

translate([0, 30, 0])
    888_1005(false);
}