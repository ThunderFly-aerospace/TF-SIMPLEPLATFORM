include <../parameters.scad>
use <./lib/gears.scad>


module 888_3003() {
	difference() {
		pfeilkegelradpaar(modul=2, zahnzahl_rad=20, zahnzahl_ritzel=40, achsenwinkel=90, zahnbreite=8, bohrung_rad=3, bohrung_ritzel=22, eingriffswinkel=20, schraegungswinkel=30, zusammen_gebaut=false);
		
		// removing other gear
		translate([100, 0, 0])
		cube(100, true);

		// axle for servo mount
		translate([0, 0, -.1])
		union() {
			// bottom hole
			cylinder(d=5, h=4-.1, $fn=30);

			// top hole for screw head
			translate([0, 0, 5])
			cylinder(d=8, h=5, $fn=30);

			// FOR for servo teeth
			for(i=[0:24]) {
				rotate([0, 0, i*(360/25)])
				translate([5/2, 0, 0])
				cylinder(d=.6, h=4-.1, $fn=3);
			}
		}
	}
}


888_3003();
