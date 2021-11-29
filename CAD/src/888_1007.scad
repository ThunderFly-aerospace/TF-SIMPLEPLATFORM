include <../parameters.scad>


module 888_1007() {
	difference() {
		cylinder(d=M3_nut_diameter+2, h=5, $fn=30);

		translate([0, 0, -1])
		cylinder(d=M3_screw_diameter+0.5, h=17, $fn=30);
	}
}

888_1007();
