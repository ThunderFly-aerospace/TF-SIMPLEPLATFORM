include <../../parameters.scad>
use <../lib/ALU_profile.scad>
use <../lib/servos.scad>
use <../lib/gears.scad>

use <../888_3001.scad>
use <../888_3002.scad>
use <../888_3003.scad>
use <../888_3004.scad>
use <../888_3005.scad>
use <../888_3006.scad>


module rotor_holder() {
	arm_angle = 45*(sin(360*$t)+1);
	//arm_angle = 0;
	

	// Main holder part
	color([1, 1, 1])
	888_3001();

	// arm unit
	translate([0, -10, 41])
	rotate([0, -arm_angle, 0])
	translate([0, 0, 11])
	group() {
		// rotor holder
		translate([0, 0, 450])
		rotate([0, 90, 0])
		color([1, 1, 1])
		union() {
			translate([0, 0, 25/2])
			rotate([0, 180, 0])
			888_3005();
			translate([0, 0, -25/2])
			rotate([0, 0, 180])
			888_3006();
		}

		// hairs
		translate([0, 0, 450])
		rotate([0, 90, 0])
		color([1, .1, .1])
		union() {
			translate([-75.9, -40, -10.2])
			888_3004(false);

			translate([-4.6, 40, -10.2])
			rotate([0, 0, 180])
			888_3004(false);
		}

		// carbon tube
		color([.1, .1, .1])
		difference() {
			cylinder(d=13, h=450, $fn=30);

			translate([0, 0, -1])
			cylinder(d=10, h=452, $fn=30);
		}
	

		// arm bottom holders
		translate([0, 0, -11])
		color([1, 1, 1])
		rotate([0, 0, 180])
		888_3002(false);

		translate([0, 0, -11])
		color([1, 1, 1])
		rotate([0, 0, 180])
		888_3002();
	}

	// servo gear
	translate([0, -40, 0])
	rotate([0, 0, -arm_angle*2])
	888_3003();

	// servo	
	translate([-9.75, -40, -20.5])
	rotate([0, 0, 0])
	color([.2, .2, .2])
	LW20MG_servo();
}

rotor_holder();

// ALU profile
rotate([0, 90, 0])
translate([0, 0, -500])
#ALU_profile(height=1000);

/*
translate([0, -40, 0])
rotate([0, 0, -90])
pfeilkegelradpaar(modul=2, zahnzahl_rad=20, zahnzahl_ritzel=40, achsenwinkel=90, zahnbreite=8, bohrung_rad=3, bohrung_ritzel=22, eingriffswinkel=20, schraegungswinkel=30, zusammen_gebaut=true);
*/
