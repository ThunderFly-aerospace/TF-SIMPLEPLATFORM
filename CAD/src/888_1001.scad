include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



module 888_1001() {
	translate([0, 35.01, 0])
	difference() {
		union() {
			hull() {
				cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, 5, ALU_profile_width]);

				translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+8, 70, 0])
				cylinder(d=5, h=ALU_profile_width/2, $fn=30);

				translate([-8, 70, 0])
				cylinder(d=5, h=ALU_profile_width/2, $fn=30);
			}

			translate([0, -35.01, 0])
			ALU_profile_holder_top();
		}
		

		// tube hole
		translate([0, 0, -1])
		hull() {
			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness, 60, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width+ALU_profile_holder_wall_thickness*2+8, 80, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([-8, 80, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);
		}

		// middle body hole
		translate([0, 0, -1])
		hull() {
			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-8, 15, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-10, 15, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-8, 40, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([2, 50, 0])

			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);
		}

		mirror([1, 0, 0])
		translate([-ALU_profile_width-ALU_profile_holder_wall_thickness*2, 0, -1])
		hull() {
			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-8, 15, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-10, 15, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/2+ALU_profile_holder_wall_thickness-8, 40, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);

			translate([2, 50, 0])
			cylinder(d=lock_grab_axle_dia, h=ALU_profile_width+2, $fn=30);
		}
	}
}

888_1001();
