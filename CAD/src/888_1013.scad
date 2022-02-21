include <../parameters.scad>


module 888_1013() {
	difference() {
		union() {
			difference() {
				// main body
				hull() {
					translate([30-7.9/2, 40-7.9/2, 0])
					cylinder(d=7.9, h=2, $fn=30);

					translate([70-7.9/2, 40-7.9/2, 0])
					cylinder(d=7.9, h=2, $fn=30);

					translate([70-7.9/2, 7.9/2, 0])
					cylinder(d=7.9, h=2, $fn=30);

					translate([7.9/2, 7.9/2, 0])
					cylinder(d=7.9, h=2, $fn=30);

					translate([7.9/2, 25-6.1/2-1.8/2, 0])
					cylinder(d=7.9, h=2, $fn=30);
				}
			}
		}

		// cover screw holes
		union() {
			translate([23-7.9/2, 35-7.9/2, -0.01])
			cylinder(d1=2, d2=4.65, h=2.1, $fn=30);

			translate([70-7.9/2, 40-7.9/2, -0.01])
			cylinder(d1=2, d2=4.65, h=2.1, $fn=30);

			translate([70-7.9/2, 7.9/2, -0.01])
			cylinder(d1=2, d2=4.65, h=2.1, $fn=30);

			translate([7.9/2, 7.9/2, -0.01])
			cylinder(d1=2, d2=4.65, h=2.1, $fn=30);
		}

		// cover ThunderFly text
		translate([35, 15, 1.55])
		linear_extrude(height = 0.5) {
			text("ThunderFly", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}

	}
}

888_1013();
