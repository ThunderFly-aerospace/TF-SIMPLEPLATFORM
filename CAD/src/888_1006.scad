include <../parameters.scad>


module 888_1006() {
	difference() {
		hull() {
			cylinder(d=M3_nut_diameter+2, h=5, $fn=30);

			translate([lock_joint_arm_length, 0, 0])
			cylinder(d=M3_nut_diameter+2, h=5, $fn=30);
		}

	translate([0, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=30);

	translate([lock_joint_arm_length, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=30);
	}
}

888_1006();
