include <../parameters.scad>

use <./lib/ALU_profile.scad>


module 888_1004() {
	difference() {
		union() {
            hull()
            {
                for(i=[-1,1])
                    translate([i*servo_joint_offset/2,0,-0.05])
                        cylinder(d=19, h=0.1, center=true,$fn=90);
                
                for(i=[-1,1])
                    translate([i*servo_joint_offset/2,0,-5.5+0.05])
                        cylinder(d=10, h=0.1, center=true,$fn=90);
            }

            hull()
            {
                for(i=[-1,1])
                    translate([i*servo_joint_offset/2,0,0])
                        cylinder(d=8.0, h=6, center=true,$fn=90);
            }
		}

        for(i=[-1,1])
        {
            translate([i*servo_joint_offset/2, 0, -7])
            {
                translate([0,0,8-2.8])
                    cylinder(d=M3_screw_diameter, h=16, $fn=30);
                translate([0,0,-8-3])
                cylinder(d=M3_nut_diameter, h=16, $fn=6);
            }

		}
	}
}


888_1004();

//použivame jiny profil
/*translate([-100, 0, -ALU_profile_width/2+2.5])
rotate([0, 90, 0])
#ALU_profile(height=200); */
