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
				cylinder(d=16, h=16, $fn=30);

				translate([-12, -5, 8])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

				translate([12, -5, 8])
				rotate([-90, 0, 0])
				cylinder(d=10, h=10, $fn=30);

			}
		}
		
		// cut side
		if(side) {
			translate([-30, 0, -5])
			cube([100, 50, 40]);
		} else {
			translate([-30, -50, -5])
			cube([100, 50, 40]);
		}
		
		// carbon tube
		translate([0, 0, -10])
		cylinder(d=13, h=400, $fn=30);

		// tube axle screw
		translate([12, -8, 8])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 8])
			cylinder(d=8, h=8, $fn=30);
		}

		// tube holding screw
		translate([-12, -8, 8])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=3.2, h=16, $fn=30);
			
			cylinder(d=8, h=3, $fn=30);

			translate([0, 0, 8])
			cylinder(d=6, h=8, $fn=6);
		}

		// part gap
		translate([-20, -1, -1])
		cube([20, 2, 20]);

		translate([0, -.1, -1])
		cube([20, .2, 20]);
	}
}

#carbon_tube();

888_3002();
888_3002(false);
