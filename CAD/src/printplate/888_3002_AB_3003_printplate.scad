//@set_slicing_config(../../slicing/gensupport.ini)
include <../../parameters.scad>

use <../888_3002.scad>
use <../888_3003.scad>

translate([-20, 20, -1])
rotate([-90, 0, 0])
888_3002();

translate([50, 0, -1])
rotate([90, 0, 0])
888_3002(false);

translate([-20, -20, 0])
888_3003();

