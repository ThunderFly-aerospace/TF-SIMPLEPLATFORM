include <../parameters.scad>



module 888_1003() {
	difference() {
		union() {
			hull() {
				cube([ALU_profile_width/2, 5, ALU_profile_width]);

				translate([ALU_profile_width/2+10, 40, 0])
				cylinder(d=5, h=ALU_profile_width, $fn=30);

				translate([-10, 20, 0])
				cylinder(d=5, h=ALU_profile_width, $fn=30);
			}
		}

		translate([0, 0, -1])
		hull() {
			translate([ALU_profile_width/4-5.5, 7.5, 0])
			cylinder(d=5, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/4+5.5, 7.5, 0])
			cylinder(d=5, h=ALU_profile_width+2, $fn=30);

			translate([ALU_profile_width/2+8, 50, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-10, 30, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);
		}


		translate([ALU_profile_width/4, 12.5, ALU_profile_width-7.5])
		rotate([90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([0, 0, -20])
			cylinder(d=M3_nut_diameter+2, h=30, $fn=30);
		}

		translate([ALU_profile_width/4, 12.5, 7.5])
		rotate([90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([0, 0, -20])
			cylinder(d=M3_nut_diameter+2, h=30, $fn=30);
		}
	}
}

888_1003();
