include <../parameters.scad>
use <./lib/ALU_profile.scad>



sphere_radius = 2.5;
sphere_fn = 20;


module 888_2003() {
	difference() {
		union() {
			// main cube
			hull() {
				for(q=[0:1]) {
					for(r=[0:3]) {
						rotate([90*q, 90*r, 0])
						translate([ALU_profile_width/2, ALU_profile_width/2, ALU_profile_width/2])
						sphere(sphere_radius, $fn=sphere_fn);
					}
				}
			}

			// cable holder
			for(top=[0:1]) {
				translate([0, 0, 18*top])
				hull() {
					translate([-ALU_profile_width/2, ALU_profile_width/2, -8])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2, ALU_profile_width/2, -15])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2-8*5, ALU_profile_width/2, -5])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2-8*5, ALU_profile_width/2, -12])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2, ALU_profile_width/2-20, -8])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2, ALU_profile_width/2-20, -15])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2-8*5, ALU_profile_width/2-12, -5])
					sphere(sphere_radius, $fn=sphere_fn);

					translate([-ALU_profile_width/2-8*5, ALU_profile_width/2-12, -12])
					sphere(sphere_radius, $fn=sphere_fn);
				}
			}
		}
		
		// profile cutout
		translate([-ALU_profile_width/2, -100, -ALU_profile_width/2])
		cube([ALU_profile_width*2, 200, ALU_profile_width]);

		// profile screws
		translate([0, 0, -ALU_profile_width])
		cylinder(d=6.5, h=ALU_profile_width*2, $fn=30);

		// ethernet (STP) cable cutouts
		translate([-ALU_profile_width/2-8, 0, -1])
		rotate([90, 0, 0])
		translate([0, 0, -100])
		for(top=[-1:2:1]) {
			for(i=[0:3]) {
				rotate([0, 0, -5])
				translate([-9*i, 9*(-top), 0])
				hull() {
					translate([0, 5, 0])
					cylinder(d=7, h=200, $fn=30);
					#cylinder(d=7.3, h=200, $fn=30);
				}
			}
		}

		// holes for cable ties
		rotate([0, 1.5, 0])
		union() {
			translate([-ALU_profile_width/2-4, ALU_profile_width/4, 0])
			cube([4, 5, 50], true);

			translate([-ALU_profile_width/2-4-38, ALU_profile_width/4, 0])
			cube([4, 5, 50], true);
		}

		rotate([0, 5, 0])
		translate([-ALU_profile_width/2-20, ALU_profile_width/4, 12])
		cube([50, 5, 5], true);

		translate([0, 0, -18])
		rotate([0, 5, 0])
		translate([-ALU_profile_width/2-20, ALU_profile_width/4, 12])
		cube([50, 5, 5], true);
	}
}

888_2003();


rotate([90, 0, 0])
translate([0, 0, -100])
#ALU_profile(height=200);

translate([-ALU_profile_width/2-8, 0, -1])
rotate([90, 0, 0])
translate([0, 0, -25])
#for(top=[-1:2:1]) {
	for(i=[0:3]) {
		rotate([0, 0, -5])
		translate([-9*i, 9*(-top), 0])
		hull() {
			cylinder(d=7.3, h=50, $fn=30);
		}
	}
}
