include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



module 888_3004() {
	// holder
	cube([3, 80, 20]);

	// shifted holder
	translate([70, 0, 0])
	cube([3, 80, 20]);

	// hair
	for(i=[3:2.5:77]) {
		for(vertical=[3:2.5:17]) {
			translate([2, i, vertical])
			rotate([0, 90, 0])
			union() {
				cylinder(d=0.5, h=70, $fn=20);

				translate([-1.25, 1.25, 0])
				cylinder(d=0.5, h=70, $fn=20);
			}
		}
	}
}

888_3004();
