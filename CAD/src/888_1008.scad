include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>

module D485HW_servo() {
	difference() {
		union() {
			cube([39.8, 19.8, 38], center=true);

			translate([0, 0, 28-38/2+2.5/2])
			cube([53.5, 19.8, 2.5], center=true);

			translate([53.5/2-16.8, 0, 38/2-1])
			cylinder(d=M5_screw_diameter, h=7.6, $fn=30);
		}

		translate([-48.5/2, 5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([-48.5/2, -5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([48.5/2, 5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([48.5/2, -5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);
	}
}

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

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2-1, -35.01, 0])
			cube([20+1+2, 12, 2]);

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2-1, -35.01-12-40, 0])
			cube([20+1+2, 12, 2]);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, lock_axle_diameter/2+10, lock_depth/2+5])
			difference() {
				cube([10, 10, lock_depth+1], center=true);

				translate([0, 0, -1])
				cube([10-.5, 10-.5, lock_depth+3], center=true);
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

		translate([ALU_profile_width/2, -35.01-12-40-5+9, ALU_profile_width/2])
		rotate([0, 90, 0])
		cylinder(d=M6_screw_diameter, h=ALU_profile_width, $fn=30);

		translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+19.8/2+2, -39.8/2-ALU_profile_width-5, -10])
		union() {
			translate([5, -48.5/2, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([-5, -48.5/2, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([5, 48.5/2, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([-5, 48.5/2, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
		}
	}
}

/*
888_1008();

translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+19.8/2+2, -39.8/2-ALU_profile_width-5, 38/2])
rotate([0, 180, -90])
#D485HW_servo();
*/
