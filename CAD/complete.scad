include <./parameters.scad>
use <./src/lib/ALU_profile.scad>

use <./src/888_1001.scad>
use <./src/888_1002.scad>
use <./src/888_1003.scad>
use <./src/888_1010.scad>

use <./src/assembly/lock.scad>




// back support
translate([400-ALU_profile_width/2-30, 0, 0])
union() {
	ALU_profile(height=100);

	translate([-ALU_profile_width/2, -ALU_profile_width/2, 100-ALU_profile_width-ALU_profile_holder_wall_thickness*2])
	rotate([90, 0, 90])
	color([1, 0.5, 0])
	888_1001();
}

// lock mechanism
translate([225, 0, 0])
union () {
	translate([-ALU_profile_width/2, 0, 100+ALU_profile_width/2])
	lock();

	ALU_profile(height=100);
}


// front support
translate([ALU_profile_width/2, -front_holder_width/2, front_holder_height+front_holder_height_offset])
rotate([front_holder_angle, 0, 0])
translate([front_holder_offset, ALU_profile_width/2, 0])
rotate([90, 0, 0])
color([1, 0.5, 0])
888_1003();

translate([ALU_profile_width/2, front_holder_width/2, front_holder_height+front_holder_height_offset])
rotate([-front_holder_angle, 0, 0])
translate([front_holder_offset, ALU_profile_width/2, 0])
rotate([90, 0, 0])
color([1, 0.5, 0])
888_1003();

color([1, 0.7, 0])
translate([ALU_profile_width/2+30, 0, front_holder_height_offset])
888_1002();

translate([ALU_profile_width/2+30, 0, 0])
ALU_profile(height=front_holder_height_offset);


translate([0, 0, -ALU_profile_width/2])
rotate([0, 90, 0])
ALU_profile(height=400);

translate([ALU_profile_width/4, 0, 100+lock_hold_arm_length+lock_grab_axle_dia+18])
color([0.3, 0.55, 0.8])
import("./STL/full_assembly.stl");


translate([400-ALU_profile_width*4, 0, 0])
union() {
	translate([0, ALU_profile_width/2+3, -ALU_profile_width*2])
	rotate([90, 0, 0])
	color([1, 1, 0])
	888_1010();

	translate([0, -ALU_profile_width/2, -ALU_profile_width*2])
	rotate([90, 0, 0])
	color([1, 1, 0])
	888_1010();
}

translate([80, 0, 0])
union() {
	translate([0, ALU_profile_width/2+3, -ALU_profile_width*2])
	rotate([90, 0, 0])
	color([1, 1, 0])
	888_1010();

	translate([0, -ALU_profile_width/2, -ALU_profile_width*2])
	rotate([90, 0, 0])
	color([1, 1, 0])
	888_1010();
}
