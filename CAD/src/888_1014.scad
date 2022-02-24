include <../parameters.scad>


module 888_1014() {
	difference() {
		hull() {
			translate([4, 4, 0])
			cylinder(d=8, h=2, $fn=30);

			translate([4, 53-4, 0])
			cylinder(d=8, h=2, $fn=30);

			translate([103-4, 4, 0])
			cylinder(d=8, h=2, $fn=30);

			translate([103-4, 53-4, 0])
			cylinder(d=8, h=2, $fn=30);
		}

		// screw holes
		translate([4, 4, -0.1])
		cylinder(d1=4, d2=6, h=2.2, $fn=30);

		translate([4, 53-4, -0.1])
		cylinder(d1=4, d2=6, h=2.2, $fn=30);

		translate([103-4, 4, -0.1])
		cylinder(d1=4, d2=6, h=2.2, $fn=30);

		translate([103-4, 53-4, -0.1])
		cylinder(d1=4, d2=6, h=2.2, $fn=30);

		// power cable (12V)
		translate([16+4, 19+4, -1])
		cylinder(d=10, h=4, $fn=30);

		// USB cable
		translate([58+4, 19+4, 1])
		cube([12, 10.5, 4], true);

		// comfirm button cable
		translate([80+4, 19+4, -1])
		cylinder(d=16, h=4, $fn=30);

		// LEDs holes
		translate([10+4, 19+15+4, -1])
		cylinder(d=7.6, h=4, $fn=30);

		translate([24+4, 19+15+4, -1])
		cylinder(d=7.6, h=4, $fn=30);

		// open button
		translate([40+4, 19+15+4, -1])
		cylinder(d=12, h=4, $fn=30);

		// open text
		translate([40+4+25, 19+15+4, 1.55])
		linear_extrude(height = 0.5) {
			text("OPEN", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}

		// ThunderFly text
		translate([40+4, 2+4, 1.55])
		linear_extrude(height = 0.5) {
			text("ThunderFly", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}
	}
}

888_1014();
