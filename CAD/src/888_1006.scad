include <../parameters.scad>


module 888_1006() {
	tolerance_fix = 1; // generated lock model calculate without tolerances. This is to counter lock have any movement.

	difference() {
		hull() {
			cylinder(d=M3_nut_diameter+2, h=5, $fn=30);

			translate([lock_joint_arm_length+tolerance_fix, 0, 0])
			cylinder(d=M3_nut_diameter+2, h=5, $fn=30);
		}

	translate([0, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=30);

	translate([lock_joint_arm_length+tolerance_fix, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=30);
	}
}

888_1006();
