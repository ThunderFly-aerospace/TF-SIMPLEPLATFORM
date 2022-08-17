include <../../parameters.scad>
use <../lib/ALU_profile.scad>
use <../lib/handy_lib.scad>

use <./lock.scad>
use <./rotor_lock.scad>
use <./front_support.scad>
use <../888_1001.scad>

module platform(gyrocopter=true) {
	// Starting platform base profile
	rotate([0, 90, 0])
	translate([0, 0, -starting_platform_length/2])
	color([.6, .6, .6])
	ALU_profile(height=starting_platform_length);


	// Holding screw mark
	rotate([90, 0, 0])
	translate([500-200, 0, -100])
	#cylinder(d=8, h=200, $fn=6);

	
	// Main lock
	translate([-50, 0, ALU_profile_width/2+130+18])
	lock();

	// Rotor lock
	translate([370, 0, 0])
	rotate([0, 0, 180])
	rotor_holder();

	// Front support
	translate([150, 0, ALU_profile_width/2])
	rotate([0, 0, 180])
	front_support();


	// Back support
	translate([-210, 0, ALU_profile_width/2])
	union() {
		color([.6, .6, .6])
		ALU_profile(height=140);

		translate([-ALU_profile_width/2, -ALU_profile_width/2, 140-ALU_profile_width-ALU_profile_holder_wall_thickness*2])
		rotate([90, 0, 90])
		color([1, 1, 1])
		888_1001();
	}


	// Electronic box
	translate([0, 0, -90/2-ALU_profile_width/2])
	color([.65, .65, .5])
	cube([255, 180, 90], true);


	// Gyrocopter model
	if(gyrocopter) {
		translate([190, 0, 130+18+ALU_profile_width+lock_hold_arm_length])
		rotate([0, 0, 180])
		//color([0.3, 0.55, 0.8])
		#import("../../STL/full_assembly.stl");
	}
}

platform(true);
