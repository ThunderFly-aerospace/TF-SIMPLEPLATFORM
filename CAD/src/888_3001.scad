include <../parameters.scad>
use <./lib/ALU_profile.scad>



module 888_3001() {
	difference() {
		union() {
			hull() {
				cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width+ALU_profile_holder_wall_thickness, ALU_profile_width+ALU_profile_holder_wall_thickness*2]);

				translate([ALU_profile_width, 34-5, ALU_profile_width+ALU_profile_holder_wall_thickness+8])
				rotate([-90, 0, 0])
				cylinder(d=12, h=5, $fn=30);

			}
		}
		
		union() {
			// cut the hole for axle
			translate([ALU_profile_width, 40, ALU_profile_width+ALU_profile_holder_wall_thickness+8])
			rotate([90, 0, 0])
			union() {
				cylinder(d=3.2, h=ALU_profile_width+ALU_profile_holder_wall_thickness*2, $fn=30);

				translate([0, 0, 15])
				cylinder(d=8, h=ALU_profile_width, $fn=30);

				translate([0, 0, 10])
				cylinder(d=6, h=ALU_profile_width, $fn=6);
			}
		}
		
		// profile hole cutout
		translate([-200, -1, ALU_profile_holder_wall_thickness])
		cube([400, ALU_profile_width, ALU_profile_width]);

		// screw holding profile
		translate([ALU_profile_width/2, ALU_profile_width/2+ALU_profile_holder_wall_thickness, -5])
		union() {
			cylinder(d=6.5, h=100, $fn=30);

			translate([0, 0, ALU_profile_width+ALU_profile_holder_wall_thickness*4])
			cylinder(d=18, h=100, $fn=30);
		}

		translate([ALU_profile_width/2, 0, ALU_profile_width/2+ALU_profile_holder_wall_thickness])
		rotate([-90, 0, 0])
		cylinder(d=6.5, h=100, $fn=30);
	}
}

888_3001();


translate([-200, ALU_profile_width/2, ALU_profile_holder_wall_thickness+ALU_profile_width/2])
rotate([0, 90, 0])
#ALU_profile(height=400);
