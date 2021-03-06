include <../parameters.scad>


module 888_1015() {
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

		// XT60 connector hole
		translate([20, 20, -5])
		union() {
			translate([0, 0, 5])
			cube([15.7, 8.1, 10], true);
			
			translate([20.5/2, 0, 0])
			cylinder(d=M3_screw_diameter, h=10, $fn=30);
			
			translate([-20.5/2, 0, 0])
			cylinder(d=M3_screw_diameter, h=10, $fn=30);
		}

		// servo cable hole
		translate([40, 20, 0])
		cube([2.54*3+.2, 2.54+.2, 10], true);

		// Servo text
		translate([40, 25.5, 1.55])
		linear_extrude(height = 0.5) {
			text("Servo", size=2, font = "Cabin:style=Bold", valign="center", halign="center");
			translate([0, -2.5, 0])
			text("s + -", size=2, font = "Cabin:style=Bold", valign="center", halign="center");
		}

		// Sound buzzer hole
		translate([80, 30, -5])
		cylinder(d=32, h=10, $fn=80);

		// ThunderFly text
		translate([40+4, 2+4, 1.55])
		linear_extrude(height = 0.5) {
			text("ThunderFly", size=7.5, font = "Cabin:style=Bold", valign="center", halign="center");
		}
	}
}

888_1015();
