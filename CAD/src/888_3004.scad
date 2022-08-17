include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>


brush_length = 30;
brush_density = 5;
brush_diameter = .5;

module 888_3004(printplate=false) {
	// holder
	cube([3, 80, 20]);

	// shifted holder
	if(printplate) {
		translate([brush_length*2, 0, 0])
		cube([3, 80, 20]);
	}

	// brushes
	for(i=[3:brush_density:77]) {
		for(vertical=[3:brush_density:17]) {
			translate([2, i, vertical])
			rotate([0, 90, 0])
			union() {
				cylinder_length = brush_length*(printplate?2:1);

				cylinder(d=brush_diameter, h=cylinder_length, $fn=20);

				translate([-brush_density/2, brush_density/2, 0])
				cylinder(d=brush_diameter, h=cylinder_length, $fn=20);
	

				/*
				translate([0, 0, 35.2])
				union() {
					cylinder(d=0.5, h=34.8, $fn=20);

					translate([-1.25, 1.25, 0])
					cylinder(d=0.5, h=34.8, $fn=20);
				}
				*/
			}
		}
	}
}

888_3004();
