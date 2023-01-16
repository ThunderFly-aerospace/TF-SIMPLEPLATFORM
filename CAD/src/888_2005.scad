include <../parameters.scad>
use <./lib/ALU_profile.scad>
use <./lib/handy_lib.scad>

$fn=30;
height_offset = (profile_length_x+5)/2*tan(starting_platform_angle);

module 888_2005() {
	difference(){
		union(){
			hull() {
				for(x=[60/2, -60/2])
				translate([0, x, 0])
				cylinder(d=ALU_profile_width, h=5);

				translate([-15,-15-8/2, 5])
				cube([30, 30+8, 10]);
			}
	
			mirror_copy([0, 1, 0])
			hull() {
				translate([0, -17.5, 3])
				cube([ALU_profile_width, 5, 5], true);

				translate([0, -25, ALU_profile_width/2])
				rotate([-90, 0, 0])
				cylinder(d=25, h=10);

				translate([-50, -25, height_offset])
				rotate([-90, 0, 0])
				cylinder(d=20, h=10);
			}

			translate([0, -20, 7.5])
			rotate([-90, 0, 0])
			difference() {
				cylinder(d=30, h=40);
				
				translate([-50, 0, -1])
				cube(100);
			}

			translate([-50, -25, height_offset])
			rotate([-90, 0, 0])
			cylinder(d=20, h=50);
		}


		for(x=[60/2, -60/2]) translate([0, x, -1]) cylinder(d=6.3, h=20);
		for(x=[60/2, -60/2]) translate([0, x, +5]) cylinder(d=19, h=10);
	}
}


translate([-profile_length_x/2, 0, 0])
rotate([0, -90-starting_platform_angle, 0])
translate([0, 0, -starting_platform_length/2])
color([.6, .6, .6])
ALU_profile(height=starting_platform_length);


translate([0, 0, ALU_profile_width/2])
888_2005();
