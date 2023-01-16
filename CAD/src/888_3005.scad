include <../parameters.scad>
use <./lib/ALU_profile_holder_top.scad>



module 888_3005() {
	difference() {
		union() {
			// top holder
			translate([5.5+65, 0, 0])
			hull() {
				cube([10, 50, 25]);

				translate([10, 0, 0])
				cube([16, 8, 25]);
			}

			// holders connector
			translate([0, 40.5, 0])
			cube([80.5, 9.5, 25]);

			// tube holder
			hull() {
				// bottom holder
				cube([10, 50, 25]);

				translate([0, 0, 25/2])
				rotate([0, -90, 0])
				cylinder(d=16, h=16, $fn=50);

				translate([-14, 0, 0])
				cube([16, 8, 25]);
			}
		}
		

		// slot cutout
		translate([20, 40, 25/2])
		rotate([-90, 0, 0])
		hull() {
			cylinder(d=12, h=12, $fn=60);
			translate([40, 0, 0])
			cylinder(d=12, h=12, $fn=60);
		}

		// hair holder slots cutouts
		union() {
			// bottom holder
			translate([10-2-3.5, -1, 2.5])
			cube([3.5, 41.5, 20]);

			// top holder
			translate([10.5+60+2, -1, 2.5])
			cube([3.5, 41.5, 20]);

			// holders connector
			translate([10-2-3.5, -1, 2.5+3])
			cube([70, 41.4, 20-6]);
		}

		// bottom bolts
		translate([-10, 55, 4])
		{
			rotate([90, -90, 0])
			{
				cylinder(d=3.2, h=100, $fn=60);				
				cylinder(d=7.99, h=50, $fn=60);
			}

			translate([0, 0, 17])
			rotate([90, -90, 0])
			{
				cylinder(d=3.2, h=100, $fn=60);	
				cylinder(d=7.99, h=50, $fn=60);
			}
		}

		// top bolts
		translate([90, 55, 4])
		{
			rotate([90, -90, 0])
			{
				cylinder(d=3.2, h=100, $fn=60);		
				cylinder(d=7.99, h=50, $fn=60);
			}

			translate([0, 0, 17])
			rotate([90, -90, 0])
			{
				cylinder(d=3.2, h=100, $fn=60);		
				cylinder(d=7.99, h=50, $fn=60);
			}
		}

		// tube cutout
		union() {
			translate([0, 0, 25/2])
			rotate([0, -90, 0])
			cylinder(d=12.5, h=18, $fn=70);


			translate([-30, -20, -2])
			cube([50, 20, 30]);
		}
	}
}

888_3005();
