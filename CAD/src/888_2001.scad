include <../parameters.scad>
use <./lib/ALU_profile.scad>

sphere_radius = 2.5;

module 888_2001() {
	difference() {
		hull() {
			for(i=[0:90:360]) {
				rotate([0, 0, i])
				translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
				sphere(sphere_radius, $fn=20);
			}

			translate([0, 0, ALU_profile_width+40])
			for(i=[0:90:360]) {
				rotate([0, 0, i])
				translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
				sphere(sphere_radius, $fn=20);
			}

			translate([0, ALU_profile_width/2+60, 0])
			rotate([90, 0, 0])
			translate([0, ALU_profile_width/2, 0])
			for(i=[0:90:360]) {
				rotate([0, 0, i])
				translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
				sphere(sphere_radius, $fn=20);
			}

			translate([ALU_profile_width/2+60, 0, 0])
			rotate([0, 90, 0])
			translate([-ALU_profile_width/2, 0, 0])
			for(i=[0:90:360]) {
				rotate([0, 0, i])
				translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
				sphere(sphere_radius, $fn=20);
			}
		}
	
		// holes for profiles
		union() {
			translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
			cube([ALU_profile_width, ALU_profile_width, 400]);

			translate([0, ALU_profile_width/2+3, ALU_profile_width/2])
			rotate([-90, 0, 0])
			translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
			cube([ALU_profile_width, ALU_profile_width, 400]);

			translate([ALU_profile_width/2+3, 0, ALU_profile_width/2])
			rotate([0, 90, 0])
			translate([-ALU_profile_width/2, -ALU_profile_width/2, 0])
			cube([ALU_profile_width, ALU_profile_width, 400]);
		}

		// main cutout
		translate([20/2+ALU_profile_width/2+3, 20/2+ALU_profile_width/2+3, 2.5])
		hull() {
			cylinder(d=20, h=200, $fn=30);

			translate([100, 0, 0])
			cylinder(d=20, h=200, $fn=30);

			translate([0, 100, 0])
			cylinder(d=20, h=200, $fn=30);
		}

		// x side cutout
		translate([40/2+ALU_profile_width/2-1, 40/2-ALU_profile_width/2, ALU_profile_width-.1])
		hull() {
			cylinder(d=40, h=200, $fn=40);

			translate([100, 0, 0])
			cylinder(d=40, h=200, $fn=40);

			translate([0, 100, 0])
			cylinder(d=40, h=200, $fn=40);
		}

		// y side cutout
		translate([40/2-ALU_profile_width/2, 40/2+ALU_profile_width/2-1, ALU_profile_width-.1])
		hull() {
			cylinder(d=40, h=200, $fn=40);

			translate([100, 0, 0])
			cylinder(d=40, h=200, $fn=40);

			translate([0, 100, 0])
			cylinder(d=40, h=200, $fn=40);
		}

		// x side profile holes
		translate([0, 0, ALU_profile_width/2])
		rotate([90, 0, 0])
		union() {
			cylinder(d=6.5, h=50, $fn=30);

			translate([0, 40, 0])
			cylinder(d=6.5, h=50, $fn=30);

			translate([30, 0, 0])
			cylinder(d=6.5, h=50, $fn=30);

			translate([60, 0, -25])
			cylinder(d=6.5, h=50, $fn=30);
		}

		// y side profile holes
		translate([0, 0, ALU_profile_width/2])
		rotate([0, -90, 0])
		union() {
			cylinder(d=6.5, h=50, $fn=30);

			translate([40, 0, 0])
			cylinder(d=6.5, h=50, $fn=30);

			translate([0, 30, 0])
			cylinder(d=6.5, h=50, $fn=30);

			translate([0, 60, -25])
			cylinder(d=6.5, h=50, $fn=30);
		}

		// mounting hole
		translate([20/2+ALU_profile_width/2+3, 20/2+ALU_profile_width/2+3, -3.5])
		union() {
			cylinder(d=6.5, h=40, $fn=30);

			translate([0, 0, 4])
			cylinder(d=20, h=40, $fn=30);
		}

		// cylinder edge cutout
		translate([-5, -5, ALU_profile_width-.1])
		cube(100);
	}
}

888_2001();

/*
#ALU_profile(height=400);

translate([0, ALU_profile_width/2+3, ALU_profile_width/2])
rotate([-90, 0, 0])
#ALU_profile(height=400);

translate([ALU_profile_width/2+3, 0, ALU_profile_width/2])
rotate([0, 90, 0])
#ALU_profile(height=400);
*/
