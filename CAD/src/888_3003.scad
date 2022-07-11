include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>


module 888_3003() {
	difference() {
		union() {
			// axle hull
			hull() {
				rotate([-90, 0, 0])
				cylinder(d=17, h=6, $fn=30);
		
				translate([-5-17/2, 0, -7])
				cube([5, 14, 14]);
			}
			
			// top hull
			hull() {
				translate([-30-17/2, 0, -7])
				cube([5, 14, 14]);

				translate([-30-40, 40-10, -10])
				cube([15, 20, 20]);
			}
	
			// connecting cube
			translate([-30-17/2, 0, -7])
			cube([30, 14, 14]);

			// axle spacer
			translate([0, -2.5, 0])
			rotate([-90, 0, 0])
			cylinder(d=12, h=6, $fn=30);
		}

		// axle hole
		translate([0, -4, 0])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=9, h=20, $fn=30);

			translate([0, 0, 5])	
			hull() {
				cylinder(d=13, h=15, $fn=30);

				translate([-18, 0, 0])	
				cylinder(d=9, h=15, $fn=30);
			}
		}

		// hole for tube
		translate([-30, 35, 0])
		rotate([0, -90, 0])
		hull() {
			cylinder(d=14, h=50, $fn=30);

			translate([0, 30, 0])	
			cylinder(d=14, h=50, $fn=30);
		}
	}
}


888_3003();
