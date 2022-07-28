include <../parameters.scad>
use <./lib/ALU_profile.scad>


$fn=30;
height_offset = (profile_length_x+5)/2*tan(starting_platform_angle);


module cep_8_70() {
	cylinder(d=8, h=70, $fn=30);
	cylinder(d=15, h=7, $fn=30);

	translate([0, -15, 65/2+1])
		rotate([0, 90, 0])
		union() {
			difference() {
				cylinder(d=65, h=2.5, $fn=300);

				translate([0, 0, -1])
					cylinder(d=60, h=5, $fn=300);

				translate([-50, 0, -50])
					cube([100, 100, 100]);
			}

			translate([65/2-2.5, 0, 0])
				cube([2.5, 15, 2.5]);

			translate([-65/2, 0, 0])
				cube([2.5, 15, 2.5]);
		}
}

module 888_2004() {
	difference(){
		union(){
			hull() {
				for(x=[60/2, -60/2])
				translate([0, x, 0])
				cylinder(d=ALU_profile_width, h=5);

				translate([-15,-15-8/2, 5])
				cube([30, 30+8, 10]);
			}
	

			hull() {
				translate([0, 0, 3])
				cube([ALU_profile_width, 40, 5], true);

				translate([0, -25, height_offset-ALU_profile_width/2])
				rotate([-90, 0, 0])
				cylinder(d=ALU_profile_width, h=50);
			}
		}


		for(x=[60/2, -60/2]) translate([0, x, -1]) cylinder(d=6.3, h=20);
		for(x=[60/2, -60/2]) translate([0, x, +5]) cylinder(d=19, h=10);

		translate([-profile_length_x/2, 0, -ALU_profile_width/2])
		rotate([0, -90-starting_platform_angle, 0])
		translate([ALU_profile_width/2, 0, 0])
		cube([ALU_profile_width*2, ALU_profile_width, 1000], true);
		
		translate([0, -30, height_offset-ALU_profile_width/2])
		rotate([-90, 0, 0])
		cylinder(d=8.1, h=60);
	}
}

translate([0, -70/2, height_offset])
rotate([-90, 0, 0])
color([.3, .3, .3])
cep_8_70();


translate([-profile_length_x/2, 0, 0])
rotate([0, -90-starting_platform_angle, 0])
translate([0, 0, -starting_platform_length/2])
color([.6, .6, .6])
ALU_profile(height=starting_platform_length);


translate([0, 0, ALU_profile_width/2])
888_2004();
