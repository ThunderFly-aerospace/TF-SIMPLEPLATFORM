include <../../parameters.scad>
use <../lib/ALU_profile.scad>

use <../888_3001.scad>
use <../888_3002.scad>
//use <../888_3003.scad>
use <../888_3004.scad>
use <../888_3005.scad>
use <../888_3006.scad>


module rotor_holder() {
	arm_angle = 45*(sin(360*$t)+1);

	// arm unit
	translate([0, 0, 50])
	rotate([0, -arm_angle, 0])
	translate([0, 0, -50])
	group() {
		// rotor holder
		translate([0, 0, 450])
		rotate([0, 90, 0])
		color([1, 1, 1])
		union() {
			translate([0, 0, 25/2])
			rotate([0, 180, 0])
			888_3005();
			translate([0, 0, -25/2])
			rotate([0, 0, 180])
			888_3006();
		}

		// hairs
		translate([0, 0, 450])
		rotate([0, 90, 0])
		color([1, .1, .1])
		union() {
			translate([-75.9, -40, -10.2])
			888_3004(false);

			translate([-4.6, 40, -10.2])
			rotate([0, 0, 180])
			888_3004(false);
		}

		// carbon tube
		color([.1, .1, .1])
		difference() {
			cylinder(d=13, h=450, $fn=30);

			translate([0, 0, -1])
			cylinder(d=10, h=452, $fn=30);
		}
	

		// arm bottom holders
		translate([0, 0, 50])
		color([1, 1, 1])
		888_3002();

		translate([0, 0, 50])
		color([1, 1, 1])
		rotate([0, 0, 180])
		888_3002();
	}

	// locking mechanism
	translate([-ALU_profile_width/2-3.25, -ALU_profile_width-7-16/2, 16.5])
	color([1, 1, 1])
	888_3001();
}

rotor_holder();
