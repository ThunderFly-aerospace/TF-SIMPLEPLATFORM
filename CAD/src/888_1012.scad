include <../parameters.scad>

use <./888_1011.scad>


module 888_1012() {
	difference() {
		union() {
			difference() {
				// main body
				hull() {
					translate([30-7.9/2, 40-7.9/2, 0])
					cylinder(d=7.9, h=20, $fn=30);

					translate([70-7.9/2, 40-7.9/2, 0])
					cylinder(d=7.9, h=20, $fn=30);

					translate([70-7.9/2, 7.9/2, 0])
					cylinder(d=7.9, h=20, $fn=30);

					translate([7.9/2, 7.9/2, 0])
					cylinder(d=7.9, h=20, $fn=30);

					translate([7.9/2, 25-6.1/2-1.8/2, 0])
					cylinder(d=7.9, h=20, $fn=30);
				}

				// joint hole
				hull() {
					translate([10+7.9/2, 35-6.1/2-1.8/2, 6])
					cylinder(d=7.9, h=8, $fn=30);

					translate([10+7.9/2, 20-6.1/2-1.8/2, 6])
					cylinder(d=7.9, h=8, $fn=30);

					translate([-5+7.9/2, 35-6.1/2-1.8/2, 6])
					cylinder(d=7.9, h=8, $fn=30);

					translate([-5+7.9/2, 20-6.1/2-1.8/2, 6])
					cylinder(d=7.9, h=8, $fn=30);
				}
				
				// joint screw
				translate([5+7.9/2, 25-6.1/2-1.8/2, -1])
				union() {
					cylinder(d=6.1, h=22, $fn=30);

					translate([0, 0, -.01])
					cylinder(d=M6_nut_diameter+1, h=2, $fn=30);
			
					translate([0, 0, -.01])
					rotate([0, 0, 30])
					cylinder(d=M6_nut_diameter, h=6, $fn=6);

					translate([0, 0, 20-3.5])
					cylinder(d=M6_nut_diameter, h=5, $fn=30);
				}

				// body hole
				hull() {
					translate([32-7.9/2, 2+7.9/2, 2])
					cylinder(d=7.9, h=22, $fn=30);

					translate([32-7.9/2, 38-7.9/2, 2])
					cylinder(d=7.9, h=22, $fn=30);

					translate([60-7.9/2, 38-7.9/2, 2])
					cylinder(d=7.9, h=22, $fn=30);

					translate([60-7.9/2, 2+7.9/2, 2])
					cylinder(d=7.9, h=22, $fn=30);
				}

				// cable hole
				translate([45, 20, 11])
				rotate([0, 90, 0])
				union() {
					cylinder(d=12.5, h=40, $fn=30);

					cylinder(d=18, h=23, $fn=30);
				}

				// LEDs holes
				translate([30, -2, 20/2])
				rotate([0, 90, 90])
				cylinder(d=5.01, h=10, $fn=30);

				translate([40, -2, 20/2])
				rotate([0, 90, 90])
				cylinder(d=5.01, h=10, $fn=30);

				// microswitch hole
				translate([30, 31, 6.5/2+2])
				cube([20.1, 10, 6.5]);
			}
			
			// microswitch bed
			translate([23.5, 19, .1])
			cube([30, 20, 6.5/2+1.9]);
		}

		// microswitch holes for screws
		translate([30+5.5, 30+2.5, -1])
		cylinder(d=2, h=10, $fn=30);

		translate([30+15, 30+2.5, -1])
		cylinder(d=2, h=10, $fn=30);


		// cover screw holes
		union() {
			translate([23-7.9/2, 35-7.9/2, 10])
			cylinder(d=2, h=12, $fn=30);

			translate([70-7.9/2, 40-7.9/2, 10])
			cylinder(d=2, h=12, $fn=30);

			translate([70-7.9/2, 7.9/2, 10])
			cylinder(d=2, h=12, $fn=30);

			translate([7.9/2, 7.9/2, 10])
			cylinder(d=2, h=12, $fn=30);
		}
	}
}

888_1012();

translate([5+7.9/2, 25-6.1/2-1.8/2, 7.5/2-1.25])
rotate([-90, 0, 0])
#888_1011();
