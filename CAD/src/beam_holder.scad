// Profile holder 

$fn=60;

width = 60;

profile = 31;



difference(){
union(){
hull() {
    for(x=[width/2, -width/2]) translate([0, x, 0]) cylinder(d= profile, h=5);
        translate([-15,-15-8/2, 5]) cube([30, 30+8, 10]);
    }
    translate([-15,-15-8/2, 5]) cube([30, 30+8, 30]);
}

translate([-20, -15.5, 5]) cube([40, 31, 40]);

for(x=[width/2, -width/2]) translate([0, x, -1]) cylinder(d=6.3, h=20);
for(x=[width/2, -width/2]) translate([0, x, +5]) cylinder(d=19, h=30);

translate([0, 0, 5+profile/2+0.5]) rotate([90, 0, 0]) cylinder(d=6.3, h=100, center=true);


translate([0, 0, 5+profile/2+0.5]) rotate([90, 0, 0]) difference(){
    cylinder(d=19, h=100, center=true);
    cylinder(d=20, h=30+2*4, center=true);
   }

}