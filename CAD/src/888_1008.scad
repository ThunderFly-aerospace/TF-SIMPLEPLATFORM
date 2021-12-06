include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>

use <./lib/servos.scad>

module 888_1008() {
	difference() {
		union() {
			translate([0, -35.01, 0])
			ALU_profile_holder_top();

			difference() {
				hull() {
					cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, 6, ALU_profile_width]);

					translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, lock_axle_diameter/2+10, 0])
					cylinder(d=lock_axle_diameter+5, h=ALU_profile_width+12, $fn=30);
				}

				translate([0, 0, 5])
				cube([ALU_profile_width*2, ALU_profile_width*2, lock_depth+1]);
			}

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness, -35.01-12-40-5, 0])
			cube([ALU_profile_holder_wall_thickness, 12+40+1+5, ALU_profile_width]);

			// servo holders
			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2-1, -(lock_arms_joint_offset+servo_joint_offset+servo_joint_offset_by_angle)+23.1, 0])
			cube([10+1+2, 6, 2]);

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2-1, -(lock_arms_joint_offset+servo_joint_offset+servo_joint_offset_by_angle)-6, 0])
			cube([10+1+2, 6, 2]);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, lock_axle_diameter/2+10, lock_depth/2+5])
			difference() {
				cube([10, 10, lock_depth+1], center=true);

				translate([0, 0, -1])
				cube([10-1, 10-1, lock_depth+3], center=true);
			}
		}

		translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, lock_axle_diameter/2+10, -1])
		union() {
			cylinder(d=8.1, h=31, $fn=30);

			translate([0, 0, 30])
			cylinder(d=M6_screw_diameter, h=ALU_profile_width*2, $fn=30);

			translate([0, 0, 36])
			cylinder(d=M6_nut_diameter, h=ALU_profile_width*2, $fn=6);
		}


		translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+12.1/2+.1, -(lock_arms_joint_offset+servo_joint_offset+servo_joint_offset_by_angle-0.5)+23.1/2, 26.7/2])
		rotate([180, 0, 90])
		D5313_servo(true);

		translate([0, -80, ALU_profile_width/2])
		rotate([0, 90, 0])
		cylinder(d=M6_screw_diameter, h=60, $fn=30);
	}
}

888_1008();

/*
translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+12.1/2+.1, -23.1/2-35.1, 26.7/2])
rotate([0, 180, -90])
#D5313_servo();
*/
