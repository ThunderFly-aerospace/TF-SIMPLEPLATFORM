include <../parameters.scad>

module 888_3007(h=5) {
    difference()
    {
        cylinder(d=12,h=h,$fn=90);
        cylinder(d=8.2,h=3*h,center=true,$fn=90);
    }
    
}


888_3007();

//translate([20,0,0])
//888_3007(1.5);