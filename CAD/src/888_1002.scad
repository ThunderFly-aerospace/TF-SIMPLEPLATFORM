include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



use <./888_1003.scad>


module 888_1002_joints() {
	translate([0, -front_holder_width/2, front_holder_height])
	rotate([front_holder_angle, 0, 0])
	translate([0, ALU_profile_width/2, 0])
	rotate([90, 0, 0])
	888_1003();

	translate([0, front_holder_width/2, front_holder_height])
	rotate([-front_holder_angle, 0, 0])
	translate([0, ALU_profile_width/2, 0])
	rotate([90, 0, 0])
	888_1003();
}

module 888_1002() {
	translate([-ALU_profile_width/2, 0, 0])
	difference() {
		translate([0, 0, (front_holder_width+50)/2])
		rotate([0, 90, 0])
		cylinder(d=front_holder_width+50, h=ALU_profile_width/2, $fn=200);
		

		// space for autogyro
		translate([0, 0, (front_holder_width+40)/2+front_holder_height-20])
		rotate([0, 90, 0])
		translate([0, 0, -1])
		cylinder(d=front_holder_width+40, h=ALU_profile_width+2, $fn=400);


		// cutting on end edges
		translate([0, -front_holder_width/2, front_holder_height])
		rotate([front_holder_angle, 0, 0])
		translate([ALU_profile_width/2, 0, 100/2])
		cube([ALU_profile_width+2, 100, 100], center=true);

		translate([0, front_holder_width/2, front_holder_height])
		rotate([-front_holder_angle, 0, 0])
		translate([ALU_profile_width/2, 0, 100/2])
		cube([ALU_profile_width+2, 100, 100], center=true);

		// screws for suspension holders
		translate([0, -front_holder_width/2, front_holder_height])
		rotate([front_holder_angle, 0, 0])
		union() {
			translate([ALU_profile_width/4, ALU_profile_width/2-7.5, -15])
			union() {
				cylinder(d=M3_screw_diameter, h=30, $fn=30);

				cylinder(d=M3_nut_diameter, h=10, $fn=6);
			}

			translate([ALU_profile_width/4, -ALU_profile_width/2+7.5, -15])
			union() {
				cylinder(d=M3_screw_diameter, h=30, $fn=30);

				cylinder(d=M3_nut_diameter, h=10, $fn=6);
			}
		}

		translate([0, front_holder_width/2, front_holder_height])
		rotate([-front_holder_angle, 0, 0])
		union() {
			translate([ALU_profile_width/4, ALU_profile_width/2-7.5, -15])
			union() {
				cylinder(d=M3_screw_diameter, h=30, $fn=30);

				cylinder(d=M3_nut_diameter, h=10, $fn=6);
			}

			translate([ALU_profile_width/4, -ALU_profile_width/2+7.5, -15])
			union() {
				cylinder(d=M3_screw_diameter, h=30, $fn=30);

				cylinder(d=M3_nut_diameter, h=10, $fn=6);
			}
		}

		// holes to lose weight and drag
		translate([-1, 0, 11.5])
		rotate([0, 90, 0])
		hull() {
			translate([0, 10, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([0, -10, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-19, 20, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-19, -20, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);
		}
	
		rotate([0, 0, 180])
		translate([-ALU_profile_width-1, -50, 11.5])
		rotate([0, 90, 0])
		hull() {
			translate([0, 25, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-25, 12, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-40, -18, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-36.5, -32, 0])
			cylinder(d=5, h=ALU_profile_width+2, $fn=30);

			translate([-22, -15, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-8, 5, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);
		}

		translate([-1, -50, 11.5])
		rotate([0, 90, 0])
		hull() {
			translate([0, 25, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-25, 12, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-40, -18, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-36.5, -32, 0])
			cylinder(d=5, h=ALU_profile_width+2, $fn=30);

			translate([-22, -15, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);

			translate([-8, 5, 0])
			cylinder(d=10, h=ALU_profile_width+2, $fn=30);
		}
	}


	translate([-ALU_profile_width/2, -ALU_profile_width/2-ALU_profile_holder_wall_thickness, -ALU_profile_width])
	rotate([90, 0, 90])
	ALU_profile_holder_top(ALU_profile_width);
}

888_1002();

translate([-ALU_profile_width/2, 0, 0])
#888_1002_joints();

