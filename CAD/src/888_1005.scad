include <../parameters.scad>


module 888_1005() {
	difference() {
		union() {
			hull() {
				cube([lock_hold_arm_length, 5, lock_depth]);

				translate([lock_axle_diameter/4, lock_push_arm_length, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth, $fn=30);

				translate([lock_hold_arm_length, 0, 0])
				cylinder(d=lock_axle_diameter+2, h=lock_depth, $fn=30);
			}

			translate([0, lock_push_arm_length, 0])
			hull() {
				translate([lock_axle_diameter/4, 0, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth, $fn=30);

				translate([0, -15, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth, $fn=30);

				translate([-lock_arms_joint_offset, 0, 0])
				cylinder(d=lock_screws_dia*2, h=lock_depth, $fn=30);
			}

			cylinder(d=lock_axle_diameter, h=lock_depth-.1, $fn=30);
		}

		// lock arm tooth and axle grabber
		translate([lock_push_arm_length, 0, 0])
		union() {
			for(i=[0:lock_depth/4:lock_depth])
			translate([0, -lock_axle_diameter*2+lock_tooth_width+1, -.2+i])
			cube([lock_axle_diameter, lock_axle_diameter*2, lock_depth/8+.4]);

			translate([-lock_hold_arm_length+lock_axle_diameter/2, -lock_axle_diameter*2, -1])
			cube([lock_hold_arm_length-lock_axle_diameter+5, lock_axle_diameter*2, lock_depth+1.5]);

			translate([-lock_hold_arm_length/2, -lock_axle_diameter*2-lock_tooth_width-0.5, -1])
			cube([lock_hold_arm_length, lock_axle_diameter*2, lock_depth+2]);
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
		cylinder(d=8.2, h=lock_depth+2, $fn=30);

		translate([-lock_arms_joint_offset, lock_push_arm_length, -1])
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

		//translate([lock_hold_arm_length, 0, -1])
		//cube([lock_depth, lock_tooth_width, lock_depth/2+1.5]);
	
	}
}

888_1005();

translate([0, .1, lock_depth])
rotate([180, 0, 0])
#888_1005();
