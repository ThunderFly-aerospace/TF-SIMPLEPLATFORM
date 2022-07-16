include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>


module 888_3004(printplate=true) {
	// holder
	cube([3, 80, 20]);

	// shifted holder
	if(printplate) {
		translate([70, 0, 0])
		cube([3, 80, 20]);
	}

	// hair
	for(i=[3:2.5:77]) {
		for(vertical=[3:2.5:17]) {
			translate([2, i, vertical])
			rotate([0, 90, 0])
			union() {
				cylinder_length = printplate ? 70 : 35;

				cylinder(d=0.5, h=cylinder_length, $fn=20);

				translate([-1.25, 1.25, 0])
				cylinder(d=0.5, h=cylinder_length, $fn=20);
	

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
