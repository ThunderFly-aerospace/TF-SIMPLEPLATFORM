include <./parameters.scad>
use <./src/lib/ALU_profile.scad>

use <./src/888_1001.scad>
use <./src/888_1002.scad>
use <./src/888_1003.scad>




// lock mechanism
translate([400-ALU_profile_width*1.5, 0, 0])
ALU_profile(height=60);

/*
// back support
translate([400-ALU_profile_width*2, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, 75-35])
rotate([90, 0, 90])
color([1, 0.5, 0])
888_1001();

translate([400-ALU_profile_width*1.5, 0, 0])
ALU_profile(height=75);
*/


// front support
translate([0, -front_holder_width/2, front_holder_height])
rotate([front_holder_angle, 0, 0])
translate([front_holder_offset, ALU_profile_width/2, 0])
rotate([90, 0, 0])
color([1, 0.5, 0])
888_1003();

translate([0, front_holder_width/2, front_holder_height])
rotate([-front_holder_angle, 0, 0])
translate([front_holder_offset, ALU_profile_width/2, 0])
rotate([90, 0, 0])
color([1, 0.5, 0])
888_1003();

color([1, 0.7, 0])
translate([ALU_profile_width, 0, 0])
888_1002();


translate([0, 0, -ALU_profile_width/2])
rotate([0, 90, 0])
ALU_profile(height=400);

translate([0, 0, 100])
color([0.3, 0.55, 0.8])
import("./STL/full_assembly.stl");
