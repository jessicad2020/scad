boxw = 95;
boxl = 115;
boxh = 70;

shell();
translate ([0,20,0]) {
    cube([boxw-2,4,boxh]);
}

translate([25,45,30]) {
   ball();     
}

translate([25,85,30]) {
    ball();
}

translate([65,45,30]) {
    ball();
}

translate([65,85,30]) {
    ball();
}

module shell() {
    translate([boxw/2,boxl/2,boxh/2]) {
        difference() {
            cube([boxw, boxl, boxh], center=true);
            translate([0,boxl*0.2,boxh*0.9/2.7]) {
                cube([boxw*0.9, boxl*1.3, boxh*1.5], center=true);
            }
            translate([0,-boxl/3.3,boxh/6]) {
                #cube([boxw*2,4,4], center=true); //axis
            }
        }
    }
}

module ball() {
    %sphere(d=40);
}