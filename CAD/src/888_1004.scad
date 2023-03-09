include <../parameters.scad>

use <./lib/ALU_profile.scad>


module 888_1004() {
	difference() {
		union() {
			translate([0, 0, -5])
			cube([10+servo_joint_offset, 12, 3], center=true);

			translate([0, 0, -5/2])
			cube([10+servo_joint_offset, 8.2, 5], center=true);
		}

		translate([servo_joint_offset/2, 0, -7])
		union() {
            translate([0,0,3.9])
                cylinder(d=M3_screw_diameter, h=8, $fn=30);
			cylinder(d=M3_nut_diameter, h=M3_nut_height+1, $fn=6);
		}

		translate([-servo_joint_offset/2, 0, -7])
		union() {
            translate([0,0,3.9])
                cylinder(d=M3_screw_diameter, h=8, $fn=30);
			cylinder(d=M3_nut_diameter, h=M3_nut_height+1, $fn=6);
		}
	}
}


888_1004();


translate([-100, 0, -ALU_profile_width/2])
rotate([0, 90, 0])
#ALU_profile(height=200);
