include <./parameters.scad>
use <./src/lib/ALU_profile.scad>

use <./src/888_1010.scad> // not used

use <./src/assembly/cube_box.scad>
use <./src/assembly/platform.scad>


// Measuring box
main_box();

// Platform
translate([-22, 0, profile_length_z-ALU_profile_width/2+2])
rotate([0, -starting_platform_angle, 180])
platform();
