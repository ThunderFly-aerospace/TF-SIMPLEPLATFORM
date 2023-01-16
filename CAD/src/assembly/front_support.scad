include <../../parameters.scad>
use <../lib/ALU_profile.scad>
use <../lib/handy_lib.scad>

use <../888_1002.scad>
use <../888_1003.scad>

module front_support() {
		translate([0, -front_holder_width/2, front_holder_height+front_holder_height_offset])
		rotate([front_holder_angle, 0, 0])
		translate([-front_holder_offset, ALU_profile_width/2, 0])
		rotate([90, 0, 0])
		color([1, .1, .1])
		888_1003();

		translate([0, front_holder_width/2, front_holder_height+front_holder_height_offset])
		rotate([-front_holder_angle, 0, 0])
		translate([-front_holder_offset, ALU_profile_width/2, 0])
		rotate([90, 0, 0])
		color([1, .1, .1])
		888_1003();

		color([1, 1, 1])
		translate([0, 0, front_holder_height_offset])
		888_1002();

		color([.6, .6, .6])
		ALU_profile(height=front_holder_height_offset);
}

front_support();
