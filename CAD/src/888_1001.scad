include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



module 888_1001() {
	translate([0, 35.01, 0])
	difference() {
		union() {
			hull() {
				cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, 5, ALU_profile_width]);

				translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+8, 30, 0])
				cylinder(d=5, h=ALU_profile_width, $fn=30);

				translate([-8, 30, 0])
				cylinder(d=5, h=ALU_profile_width, $fn=30);
			}

			translate([0, -35.01, 0])
			ALU_profile_holder_top();
		}

		translate([0, 0, -1])
		hull() {
			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, 10, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+8, 40, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-8, 40, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);
		}
	}
}

888_1001();
