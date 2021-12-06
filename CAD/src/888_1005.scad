include <../parameters.scad>


module 888_1005() {
	difference() {
		union() {
			hull() {
				cube([lock_hold_arm_length, 5, lock_depth]);

				translate([lock_axle_diameter/4, lock_push_arm_length, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth, $fn=30);

				translate([lock_hold_arm_length, 0, 0])
				difference() {
					cylinder(d=lock_axle_diameter+2, h=lock_depth, $fn=30);
		
					translate([-lock_axle_diameter, -lock_axle_diameter*2, -1])
					cube(lock_axle_diameter*2);
				}
			}

			translate([0, lock_push_arm_length, 0])
			cylinder(d=M3_nut_diameter+6, h=lock_depth, $fn=30);

			cylinder(d=lock_axle_diameter, h=lock_depth, $fn=30);
		}

		// arm pusher shape
		translate([lock_hold_arm_length, 0, -1])
		hull() {
			cylinder(d=lock_grab_axle_dia, h=lock_depth+2, $fn=30);

			translate([-12/2-2.5, 0, 0])
			cylinder(d=1, h=lock_depth+2, $fn=30);
		}


		// axle holes
		translate([0, 0, -1])
		cylinder(d=8.1, h=lock_depth+2, $fn=30);

		translate([0, lock_push_arm_length, -1])
		cylinder(d=lock_screws_dia, h=lock_depth+2, $fn=30);

		// axle holes for second lock arm
		for(i=[0:10:lock_depth]) {
			translate([0, 0, i-.5])
			cylinder(d=lock_axle_diameter+2, h=6, $fn=30);
		}

		// inside hole
		difference() {
			translate([lock_axle_diameter/2+lock_screws_dia, lock_axle_diameter/2+lock_screws_dia, -1])
			hull() {
				cylinder(d=lock_screws_dia*2, h=lock_depth+2, $fn=30);

				translate([lock_hold_arm_length/2-5, 0, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth+2, $fn=30);

				translate([0, lock_push_arm_length/2-5, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth+2, $fn=30);
			}

			translate([0, 0, -2])
			cylinder(d=lock_axle_diameter*2, h=lock_depth+4, $fn=30);
		}
	}
}

888_1005();

translate([0, .1, lock_depth])
rotate([180, 0, 0])
#888_1005();
