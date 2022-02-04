include <../parameters.scad>


module 888_1010() {
	difference() {
		cube([ALU_profile_width*2, ALU_profile_width*2, 3]);

		for(i=[0:1:1]) {
			for(k=[0:1:1]) {
				translate([ALU_profile_width/2+ALU_profile_width*i, ALU_profile_width/2+ALU_profile_width*k, -1])
				cylinder(d=M6_screw_diameter, h=5, $fn=30);
			}
		}
	}
}

888_1010();
