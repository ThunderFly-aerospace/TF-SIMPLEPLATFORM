//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_2004.scad>
use <../888_2005.scad>




translate([30,0,ALU_profile_width/2])
rotate([0,90,0])
888_2004();

rotate([0, -47.8783, 0])
translate([15.25, 0, 0])
888_2005();