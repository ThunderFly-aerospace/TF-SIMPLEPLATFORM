$fn=30;
h=5;
prof=30;
r=2;
noches=8;

module ALU_profile_cap() {
    rotate([180,0,0]){
        difference(){
            spheres(r=r);
            translate([0,0,-h]) outerCube(h=h);
        }
    
        translate([0,0,-h]) difference(){
            notches(h=h);
            innerCube(h=h+0.01);
        }
    }
}

module outerCube(h=10){
	translate([0,0,h/2]) cube([prof,prof,h], true);
}

module innerCube(h=10){
	translate([0,0,h/2-.6]) cube([10.2,10.2,h+1], true);
}

module notches(h=10){
	translate([0,0,h/2]) cube([noches,prof,h], true);
	translate([0,0,h/2]) cube([prof,noches,h], true);
}

module spheres(r=3){
	x=prof/2-r;
	hull(){
		translate([x,x,0]) sphere(r=r);
		translate([x,-x,0]) sphere(r=r);
		translate([-x,x,0]) sphere(r=r);
		translate([-x,-x,0]) sphere(r=r);
	}
}

ALU_profile_cap();