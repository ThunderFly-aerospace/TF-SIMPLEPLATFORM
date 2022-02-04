include <../../parameters.scad>

use <../888_1002.scad>

translate([0, 0, ALU_profile_width/2])
rotate([0, -90, 0])
888_1002();
