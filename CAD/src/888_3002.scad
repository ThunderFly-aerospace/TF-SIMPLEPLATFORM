include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>


module carbon_tube() {
	difference() {
		cylinder(d=13, h=400, $fn=30);

		translate([0, 0, -1])
		cylinder(d=11, h=402, $fn=30);
	}
}

module 888_3002(side=true) {
	difference() {
		union() {
			hull() {
				cylinder(d=16, h=40, $fn=30);

				translate([-12, -5, 28])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

				translate([12, -5, 28])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

				translate([-12, -5, 12])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

				translate([12, -5, 12])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

				translate([0, -9, 0])
				rotate([-90, 0, 0])
				cylinder(d=26, h=18, $fn=30);

			}
		}
		
		// cut side
		if(side) {
			translate([-30, 0, -50])
			cube([200, 50, 100]);
		} else {
			translate([-30, -100, -50])
			cube([200, 100, 100]);
		}
		
		// carbon tube
		translate([0, 0, 0])
		cylinder(d=13, h=400, $fn=30);

		// tube holding screws
		translate([-12, -10, 28])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 12])
			cylinder(d=6, h=10, $fn=6);
		}
		translate([12, -10, 28])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 12])
			cylinder(d=6, h=10, $fn=6);
		}
		translate([-12, -10, 12])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 12])
			cylinder(d=6, h=10, $fn=6);
		}
		translate([12, -10, 12])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 12])
			cylinder(d=6, h=10, $fn=6);
		}

		// bearing hole
		translate([0, -15, 0])
		rotate([-90, 0, 0])
		cylinder(d=22, h=30, $fn=30);

		// part gap
		translate([-100, -1, -50])
		cube([200, 2, 200]);

		translate([0, -.1, -50])
		cube([200, .2, 200]);
	}
}

translate([0, 0, 11])
#carbon_tube();

888_3002();
888_3002(false);
