//@set_slicing_config(../../slicing/gensupport.ini)
include <../../parameters.scad>

//cube([10,10,10]);

c=10;
d1=3.2;
d2=6.6;

module cube_with_screw_nut()
{
    difference()
    {
    cube([c,c,c],center=true);
    
    cylinder(d=d2,h=30,$fn=6);
    translate([0,0,-20])
    cylinder(d=d1,h=30,$fn=60);
    }
}

cube_with_screw_nut();

translate([20,0,0])
rotate([90,0,0])
cube_with_screw_nut();

translate([-20,0,0])
rotate([0,90,0])
cube_with_screw_nut();
