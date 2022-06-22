include <../../parameters.scad>
use <../lib/ALU_profile.scad>

use <../888_3001.scad>
use <../888_3002.scad>
use <../888_3003.scad>
use <../888_3004.scad>
use <../888_3005.scad>
use <../888_3006.scad>


module rotor_holder() {
	// rotor holder
	translate([0, 0, 400])
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
	translate([0, 0, 400])
	rotate([0, 90, 0])
	color([1, .1, .1])
	union() {
		translate([-75.9, -40, -10.2])
		888_3004(false);

		translate([-4.6, 40, -10.2])
		rotate([0, 0, 180])
		888_3004(false);
	}
	color([.1, .1, .1])
	difference() {
		cylinder(d=13, h=400, $fn=30);

		translate([0, 0, -1])
		cylinder(d=10, h=402, $fn=30);
	}
}

rotor_holder();
