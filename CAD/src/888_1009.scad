include <../parameters.scad>

use <./888_1008.scad>

module 888_1009() {
	difference() {
		union() {
			hull() {
				cylinder(d=15, h=3, $fn=30);

				translate([servo_arm_length+servo_arm_hole_length, 0, 0])
				cylinder(d=M3_nut_diameter+2, h=3, $fn=30);

				translate([0, 19, 0])
				cylinder(d=M3_nut_diameter+2, h=3, $fn=30);
			}
		}

		translate([0, 0, -1])
		cylinder(d=lock_screws_dia, h=17, $fn=30);

		for(i=[10:2.725:19]) {
			translate([0, i, -1])
			cylinder(d=1.6, h=5, $fn=30);
		}

		translate([servo_arm_length, 0, -1])
		hull() {
			cylinder(d=lock_screws_dia, h=17, $fn=30);

			translate([servo_arm_hole_length, 0, 0])
			cylinder(d=lock_screws_dia, h=17, $fn=30);
		}
	}
}

888_1009();
