//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_1003.scad>
use <../888_1004.scad>
use <../888_1006.scad>
use <../888_1007.scad>
use <../888_1009.scad>

888_1003();
translate([0,15,0])
    888_1003();
    
translate([0,-10,6.5])
    888_1004();

translate([30,-7,0])
    888_1006();
translate([30,7,0])
    888_1006();

translate([-30,-10,0])
    888_1007();

translate([-30,0,0])
    888_1007();
    
translate([-30,10,0])
    888_1007();

translate([40,30,0])
    888_1009();