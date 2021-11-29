include <../../parameters.scad>


module D485HW_servo(screw_holes=false) {
	difference() {
		union() {
			cube([39.8, 19.8, 38], center=true);

			translate([0, 0, 28-38/2+1.25/2])
			cube([53.5, 19.8, 1.25], center=true);

			translate([53.5/2-16.8, 0, 38/2-1])
			cylinder(d=M5_screw_diameter, h=7.6, $fn=30);
		}

		if(screw_holes==false) {
			translate([-48.5/2, 5, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([-48.5/2, -5, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([48.5/2, 5, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);

			translate([48.5/2, -5, 0])
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
		}
	}

	if(screw_holes==true) {
		translate([-48.5/2, 5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([-48.5/2, -5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([48.5/2, 5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);

		translate([48.5/2, -5, 0])
		cylinder(d=M3_screw_diameter, h=30, $fn=30);
	}
}

module D5313_servo(screw_holes=false) {
	difference() {
		union() {
			cube([23.1, 12.1, 26.7], center=true);

			translate([0, 0, 26.7/2-7])
			cube([32, 12.1, 1.25], center=true);

			translate([23.1/2-5.5, 0, 26.7/2-1])
			cylinder(d=M5_screw_diameter, h=4.6, $fn=30);
		}

		if(screw_holes==false) {
			translate([-28/2, 6.5/2, 0])
			cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

			translate([-28/2, -6.5/2, 0])
			cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

			translate([28/2, 6.5/2, 0])
			cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

			translate([28/2, -6.5/2, 0])
			cylinder(d=M2_5_screw_diameter, h=30, $fn=30);
		}
	}

	if(screw_holes==true) {
		translate([-28/2, 6.5/2, 0])
		cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

		translate([-28/2, -6.5/2, 0])
		cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

		translate([28/2, 6.5/2, 0])
		cylinder(d=M2_5_screw_diameter, h=30, $fn=30);

		translate([28/2, -6.5/2, 0])
		cylinder(d=M2_5_screw_diameter, h=30, $fn=30);
	}
}

D5313_servo();
