include <../parameters.scad>


module 888_1011() {
	difference() {
		union() {
			translate([0, -7.5/2, 0])
			union() {
				rotate([90, 0, 0])
				cylinder(d=M8_screw_diameter, h=7.5, $fn=30);

				hull() {
					rotate([90, 0, 0])
					cylinder(d=M8_screw_diameter, h=5.5, $fn=30);
		
					translate([0, 0, 15])
					rotate([90, 0, 0])
					cylinder(d=M8_screw_diameter, h=5.5, $fn=30);
				}
			}
			
			minkowski() {
				union() {
					translate([0, 0, 15])
					rotate([0, -30, 0])
					translate([0, -15, 0.3])
					cube([20, 1, 1]);

					translate([cos(20)*20-2, -15, sin(20)*30+15])
					cube([40, 1, 1]);
				}
	

				translate([0, 20-3, 0])
				rotate([90, 0, 0])
				cylinder(d=4, h=20, $fn=30);
			}
		}

		rotate([90, 0, 0])
		translate([0, 0, -1])
		cylinder(d=M6_screw_diameter, h=17, $fn=30);
	}
}

888_1011();
