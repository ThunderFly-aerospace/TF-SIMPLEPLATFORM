include <../parameters.scad>
use <./lib/gears.scad>



module carbon_tube() {
	difference() {
		cylinder(d=13, h=400, $fn=30);

		translate([0, 0, -1])
		cylinder(d=11, h=402, $fn=30);
	}
}

module 888_3002(side=true) {
	difference() {
		union() {
			hull() {
				cylinder(d=16, h=40, $fn=30);

				translate([-12, -5, 26])
				rotate([-90, 0, 0])
				cylinder(d=10, h=15, $fn=30);

				translate([12, -5, 26])
				rotate([-90, 0, 0])
				cylinder(d=10, h=15, $fn=30);

				translate([-12, -5, 12])
				rotate([-90, 0, 0])
				cylinder(d=10, h=15, $fn=30);

				translate([12, -5, 12])
				rotate([-90, 0, 0])
				cylinder(d=10, h=15, $fn=30);

				translate([0, -9, 0])
				rotate([-90, 0, 0])
				cylinder(d=26, h=18, $fn=30);

			}
				

			// gear
			translate([0, 7.5, 0])
			rotate([-90, 0, 0])
			translate([-97.75, 0, 0])
			difference() {
				pfeilkegelradpaar(modul=2, zahnzahl_rad=20, zahnzahl_ritzel=40, achsenwinkel=90, zahnbreite=8, bohrung_rad=3, bohrung_ritzel=1, eingriffswinkel=20, schraegungswinkel=30, zusammen_gebaut=false);

				cube(100, true);
			}
		}
		
		// cut side
		if(side) {
			translate([-100, 0, -50])
			cube([200, 200, 100]);
		} else {
			translate([-100, -100, -50])
			cube([200, 100, 100]);
		}
		
		// carbon tube
		translate([0, 0, 0])
		cylinder(d=13, h=400, $fn=30);

		// tube holding screws
		translate([-12, -10, 26])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
			
			cylinder(d=8, h=5, $fn=30);

			translate([0, 0, 17])
            rotate([0,0,35])
			cylinder(d=M3_nut_diameter, h=10, $fn=6);
		}

		translate([12, -10, 26])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
			
			cylinder(d=8, h=5, $fn=30);

			translate([0, 0, 17])
            rotate([0,0,-35])
			cylinder(d=M3_nut_diameter, h=10, $fn=6);
		}

		translate([-12, -10, 12])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
			
			cylinder(d=8, h=5, $fn=30);

			translate([0, 0, 17])
			cylinder(d=M3_nut_diameter, h=10, $fn=6);
		}

		translate([12, -10, 12])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=M3_screw_diameter, h=30, $fn=30);
			
			cylinder(d=8, h=5, $fn=30);

			translate([0, 0, 17])
			cylinder(d=M3_nut_diameter, h=10, $fn=6);
		}

		// bearing hole
		translate([0, -10, 0])
		rotate([-90, 0, 0])
		union() {
			cylinder(d=20, h=30, $fn=30);

			cylinder(d=22.2, h=7.5, $fn=90);

			translate([0, 0, 21-8])
			cylinder(d=22.2, h=20, $fn=90);
		}

		// part gap
		translate([-100, -1, -50])
		cube([200, 2, 200]);

		translate([0, -.1, -50])
		cube([200, .2, 200]);
	}
}

translate([0, 0, 11])
#carbon_tube();

888_3002();
888_3002(false);
