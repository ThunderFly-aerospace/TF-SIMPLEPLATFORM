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
                    translate([i*servo_joint_offset/2,0,-5.4+0.05])
                        cylinder(d=10, h=0.1, center=true,$fn=90);
            }

            hull()
            {
                for(i=[-1,1])
                    translate([i*servo_joint_offset/2,0,0])
                        cylinder(d=8.0, h=6, center=true,$fn=90);
                
            }
            
            translate([-servo_joint_offset/2,0,0])
                        cylinder(d=8.0, h=10,$fn=90);
		}

        for(i=[-1,1])
        {
            translate([i*servo_joint_offset/2, 0, 0])
            {
                translate([0,0,-0.6+0.2])
                    cylinder(d=M3_screw_diameter, h=16, $fn=30);
                translate([0,0,-16-0.6])
                cylinder(d=M3_nut_diameter, h=16, $fn=6);
            }

		}
	}
}


intersection()
{
888_1004();
    translate([-servo_joint_offset/2,0,-50])
    cube([100,100,100]);
}
//použivame jiny profil
/*translate([-100, 0, -ALU_profile_width/2+2.5])
rotate([0, 90, 0])
#ALU_profile(height=200); */
