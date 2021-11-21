include <../parameters.scad>

use <./888_1008.scad>

module 888_1009() {
	difference() {
		union() {
			hull() {
				cylinder(d=15, h=2, $fn=30);

				translate([servo_arm_length+servo_arm_hole_length, 0, 0])
				cylinder(d=M3_nut_diameter+2, h=2, $fn=30);
			}

			cylinder(d=15, h=6, $fn=30);
		}

		translate([0, 0, -1])
		cylinder(d=M4_screw_diameter, h=17, $fn=30);

		translate([servo_arm_length, 0, -1])
		hull() {
			cylinder(d=M3_screw_diameter, h=17, $fn=30);

			translate([servo_arm_hole_length, 0, 0])
			cylinder(d=M3_screw_diameter, h=17, $fn=30);
		}
	}
}

888_1009();
