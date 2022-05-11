include <../../parameters.scad>
use <../lib/ALU_profile.scad>

use <../888_2001.scad>


module main_box() {
	// MAIN BOX
	// ALU profiles and corners
	box_point_x = (profile_length_x + ALU_profile_width)/2 + 3;
	box_point_y = (profile_length_y + ALU_profile_width)/2 + 3;
	box_point_z = profile_length_z - ALU_profile_width;

	// bottom rectangle
	// ALU profiles
	translate([0, 0, ALU_profile_width/2])
	color([.6, .6, .6])
	for(i=[0:1]) {
		rotate([0, 0, i*180])
		union() {
			translate([box_point_x, box_point_y, -ALU_profile_width/2])
			ALU_profile(height=profile_length_z);

			translate([-box_point_x, box_point_y, -ALU_profile_width/2])
			ALU_profile(height=profile_length_z);

			translate([-box_point_x, profile_length_y/2, 0])
			rotate([90, 0, 0])
			ALU_profile(height=profile_length_y);

			translate([-profile_length_x/2, box_point_y, 0])
			rotate([0, 90, 0])
			ALU_profile(height=profile_length_x);

			translate([-box_point_x, profile_length_y/2, box_point_z])
			rotate([90, 0, 0])
			ALU_profile(height=profile_length_y);

			translate([-profile_length_x/2, box_point_y, box_point_z])
			rotate([0, 90, 0])
			ALU_profile(height=profile_length_x);
		}
	}
		
	translate([-profile_length_x/2-ALU_profile_width, 0, box_point_z+ALU_profile_width*1.5+3])
	rotate([0, 90, 0])
	color([.6, .6, .6])
	ALU_profile(height=profile_length_x+ALU_profile_width*2);
	
	// corners of the box 888_2001
	color([1, 1, 1])
	for(x=[0:1]) {
		mirror([x, 0, 0])
		for(y=[0:1]) {
			mirror([0, y, 0])
			for(z=[0:1]) {
				translate([0, 0, profile_length_z*z])
				mirror([0, 0, z])
				translate([-box_point_x, -box_point_y, 0])
				888_2001();
			}
		}
	}
}

main_box();
