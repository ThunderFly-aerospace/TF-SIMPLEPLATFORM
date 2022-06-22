include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



module 888_3001() {
	difference() {
		union() {
			hull() {
				cube([ALU_profile_width+ALU_profile_holder_wall_thickness*4, ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width]);

				translate([ALU_profile_width, 0, ALU_profile_width+ALU_profile_holder_wall_thickness*2])
				rotate([-90, 0, 0])
				cylinder(d=12, h=ALU_profile_width+ALU_profile_holder_wall_thickness*2, $fn=30);

			}
		}
		
		union() {
			// cut the hole for axle
			translate([ALU_profile_width, -3, ALU_profile_width+ALU_profile_holder_wall_thickness*2])
			rotate([-90, 0, 0])
			cylinder(d=3.2, h=ALU_profile_width+ALU_profile_holder_wall_thickness*4, $fn=30);
		}
	}
}

888_3001();
