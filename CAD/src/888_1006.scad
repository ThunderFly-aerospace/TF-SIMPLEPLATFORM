include <../parameters.scad>


module 888_1006(neck) {
	tolerance_fix = 1; // generated lock model calculate without tolerances. This is to counter lock have any movement.

	difference() {
        union()
        {
            hull() {
                cylinder(d=M3_nut_diameter+2, h=5, $fn=90);

                translate([lock_joint_arm_length+tolerance_fix, 0, 0])
                cylinder(d=M3_nut_diameter+2, h=5, $fn=90);
            }
            
            //translate([lock_joint_arm_length+tolerance_fix, 0, 0])
            cylinder(d=M3_nut_diameter+2, h=5+neck, $fn=90);
        }

	translate([0, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=90);

	translate([lock_joint_arm_length+tolerance_fix, 0, -1])
	cylinder(d=lock_screws_dia, h=17, $fn=90);
	}
}

module 888_1006_A()
{
    888_1006(5);
}

module 888_1006_B()
{
    888_1006(10);
}

888_1006_A();

translate([0,15,0])
    888_1006_B();
