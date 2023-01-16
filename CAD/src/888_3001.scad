include <../parameters.scad>
use <./lib/ALU_profile.scad>
use <./lib/servos.scad>
use <./lib/gears.scad>
use <./lib/handy_lib.scad>

use <./888_3002.scad>
use <./888_3003.scad>
use <./888_3004.scad>
use <./888_3005.scad>
use <./888_3006.scad>

module 888_3001() {
	difference() {
		hull() {
			// main profile holder
			translate([-5, -10.01, 5])
			cube([100, ALU_profile_width+20, ALU_profile_width-1], true);
	
			// axle holder
			translate([0, -35, 41])
			rotate([-90, 0, 0])
			cylinder(d=20, h=40, $fn=30);
				
			// servo holder
			translate([-9.5, -40, -6])
			cube([60, 30, 8], true);
		}
	
		// ALU profile cutout
		cube([200, ALU_profile_width, ALU_profile_width], true);

		// Servo cutout
		translate([-9.5, -54, -10])
		cube([41, 40, 20], true);

		// Servo gear cutout
		translate([0, -45, -1])
		union() {
			hull() {
				cylinder(d=45, h=12, $fn=30);

				translate([0, -30, 0])
				cylinder(d=45, h=12, $fn=30);
			}

			// just for screw
			hull() {
				cylinder(d=8, h=40, $fn=30);

				translate([0, -30, 0])
				cylinder(d=8, h=40, $fn=30);
			}
		}

		// Rotor lock gear cutout
		translate([0, -20, 41])
		rotate([90, 0, 0])
		hull() {
			cylinder(d=90, h=12, $fn=90);

			translate([0, 30, 0])
			cylinder(d=90, h=12, $fn=90);
		}

		// Rotor lock arm holders cutout
		translate([0, -5, 41])
		rotate([90, 0, 0])
		hull() {
			cylinder(d=35, h=18, $fn=30);

			translate([-60, 0, 0])
			cylinder(d=35, h=18, $fn=30);
		}

		// Rotor lock axle hole
		translate([0, -15, 41])
		rotate([90, 0, 0])
		// Fitted bolt M6x40
		union() {
			translate([0, 0, -40])
			cylinder(d=6, h=80, $fn=30);

			translate([0, 0, -20])
			cylinder(d=8, h=45, $fn=30);

			translate([0, 0, -20+40])
			cylinder(d=18, h=10, $fn=30);

			translate([0, 0, -30])
			cylinder(d=15, h=10, $fn=6);
		}

		// Profile holding screws
		translate([-5, 0, 5])
		mirror_copy()
		translate([42, 0, 0])
		union() {
			cylinder(d=6.5, h=20, $fn=60);

			translate([0, 0, 15])
			cylinder(d=15.99, h=80, $fn=60);
		}

		rotate([90, 0, 0])
		translate([-5, 0, 5])
		union() {
			mirror_copy()
			translate([42, 0, 0])
			union() {
				cylinder(d=6.5, h=20, $fn=60);

				translate([0, 0, 15])
				cylinder(d=15.99, h=80, $fn=60);
			}
		}

		// Servo holding screws
		translate([-9.75, -45, -15])
		union() {
			mirror_copy([0, 1, 0])
			mirror_copy()
			translate([49.1/2, 10/2, 0])
			union() {
				cylinder(d=3, h=20, $fn=30);

				translate([0, 0, 10])
				cylinder(d=5.6, h=80, $fn=6);

				translate([0, 0, 15])
				cylinder(d=8, h=80, $fn=30);
			}
		}
	}
}

888_3001();

/*rotate([0, 90, 0])
translate([0, 0, -100])
#ALU_profile(height=200);


// servo gear
translate([0, -45, 0])
#888_3003();

// servo	
translate([-9.75, -45, -20.5])
color([.2, .2, .2])
#LW20MG_servo();

// arm bottom holders
translate([0, -15, 41])
color([1, 1, 1])
rotate([0, 0, 180])
#union() {
	888_3002();
	888_3002(false);
}*/

