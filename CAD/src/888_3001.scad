include <../parameters.scad>
use <./lib/ALU_profile.scad>



module 888_3001() {
	difference() {
		union() {
			hull() {
				translate([0, -ALU_profile_holder_wall_thickness*2, -ALU_profile_holder_wall_thickness])
				cube([ALU_profile_width+ALU_profile_holder_wall_thickness*2, ALU_profile_width+ALU_profile_holder_wall_thickness*4, ALU_profile_width+ALU_profile_holder_wall_thickness*4]);

				translate([ALU_profile_width/2+12, -5, ALU_profile_width+20])
				rotate([-90, 0, 0])
				cylinder(d=16, h=40, $fn=30);

				translate([2.5, -5, ALU_profile_width+30])
				rotate([-90, 0, 0])
				cylinder(d=5, h=40, $fn=30);
			}
	
			// servo holder
			translate([0, -36, 11.5])
			difference() {
				cube([36.5, 33, 58]);

				// servo cutouts
				union() {
					translate([5, -10, 8])
					cube([28, 50, 42]);

					translate([-2, 8, 8])
					cube([40, 20, 42]);

					translate([5, 8, 8])
					cube([40, 30, 70]);
				}
			}
		}
		
		// cut the hole for axle
		translate([ALU_profile_width/2+5, -23, ALU_profile_width+20])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=6, h=100, $fn=30);

			cylinder(d=18, h=20, $fn=30);

			cylinder(d=8, h=50, $fn=30);

			translate([0, 0, 53])
			cylinder(d=15, h=5, $fn=6);

			translate([0, 0, 58-.01])
			cylinder(d=18, h=40, $fn=30);
		}

		translate([ALU_profile_width/2, ALU_profile_width/2, -10])
		translate([0, 0, ALU_profile_width+ALU_profile_holder_wall_thickness*4])
		hull() {
			cylinder(d=24, h=100, $fn=30);

			rotate([0, 90, 0])
			cylinder(d=24, h=100, $fn=30);
		}
		
		// profile hole cutout
		translate([-200, 0, ALU_profile_holder_wall_thickness])
		cube([400, ALU_profile_width, ALU_profile_width]);

		// screw holding profile
		translate([ALU_profile_width/2, ALU_profile_width/2, -5])
		union() {
			cylinder(d=6.5, h=100, $fn=30);

			translate([0, 0, ALU_profile_width+ALU_profile_holder_wall_thickness*4])
			cylinder(d=18, h=100, $fn=30);

			translate([0, 0, -4])
			cylinder(d=18, h=10, $fn=30);
		}

		translate([ALU_profile_width/2, -9, ALU_profile_width/2+ALU_profile_holder_wall_thickness])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=6.5, h=100, $fn=30);

			translate([0, 0, ALU_profile_width+ALU_profile_holder_wall_thickness*4])
			cylinder(d=18, h=100, $fn=30);

			translate([0, 0, -4])
			cylinder(d=18, h=10, $fn=30);
		}

		// servo screw holes
		translate([0, 0, 50])
		union() {
		translate([1+25/2, -38, 11.5+4])
		rotate([-90, 0, 0])
		cylinder(d=2, h=30);

		translate([11+25/2, -38, 11.5+4])
		rotate([-90, 0, 0])
		cylinder(d=2, h=30);
		}

		union() {
		translate([1+25/2, -38, 11.5+4])
		rotate([-90, 0, 0])
		cylinder(d=2, h=30);

		translate([11+25/2, -38, 11.5+4])
		rotate([-90, 0, 0])
		cylinder(d=2, h=30);
		}
	}
}

888_3001();

translate([-200, ALU_profile_width/2, ALU_profile_holder_wall_thickness+ALU_profile_width/2])
rotate([0, 90, 0])
#ALU_profile(height=400);
