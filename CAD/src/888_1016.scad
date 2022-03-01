include <../parameters.scad>


module 888_1016() {
	difference() {
		union() {
			translate([0, 0, 3/2])
			cube([103.5, 20, 3], true);

			translate([(103.2+56.5/2)/2, 0, 0])
			cube([56.2/2, 20, 6], true);

			translate([-(103.2+56.5/2)/2, 0, 0])
			cube([56.2/2, 20, 6], true);
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
	

		// ThunderFly text
		translate([0, 0, 2.55])
		linear_extrude(height = 0.5) {
			text("ThunderFly", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}
	}
}

888_1016();
