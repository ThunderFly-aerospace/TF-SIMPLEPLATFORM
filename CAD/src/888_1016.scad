include <../parameters.scad>


module 888_1016() {
	difference() {
		union() {
			translate([0, 0, 3/2])
			cube([103.5, 20, 3], true);

			translate([(103.2+54.5/2)/2, 0, -.5])
			cube([54.2/2, 20, 7], true);

			translate([-(103.2+54.5/2)/2, 0, -.5])
			cube([54.2/2, 20, 7], true);

			translate([-30, 0, 0])
			hull() {
				translate([0, 0, -0.1])
				cube([50, 20, 0.1], true);

				translate([0, 0, 15])
				rotate([90, 0, 0])
				cylinder(d=30, h=10, $fn=60);

				translate([75, -5-5/2, -0.1])
				cube([10, 5, 0.1], true);
			}
		}
	
		// holding screws slots
		translate([(103.5+56.2/2)/2-15/2, 0, -5])
		hull() {
			cylinder(d=M6_screw_diameter, h=10, $fn=30);

			translate([15, 0, 0])
			cylinder(d=M6_screw_diameter, h=10, $fn=30);
		}

		rotate([0, 0, 180])
		translate([(103.5+56.2/2)/2-15/2, 0, -5])
		hull() {
			cylinder(d=M6_screw_diameter, h=10, $fn=30);

			translate([15, 0, 0])
			cylinder(d=M6_screw_diameter, h=10, $fn=30);
		}
	
		/*
		// ThunderFly text
		translate([25, 0, 2.55])
		linear_extrude(height = 0.5) {
			text("ThunderFly", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}
		*/
		

		// crane hole
		translate([-30, 11, 15])
		rotate([90, 0, 0])
		cylinder(d=20, h=22, $fn=60);
	}
}

888_1016();
