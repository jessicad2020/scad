//Scoop for Dawg
//by jessicad2020
//v.1.0, 25 Jan 2019 

//parameters----------------------------------------------------------
boxw = 95;
boxl = 115;
boxh = 70;
sd = 2; //minkowski sphere diameter

//render--------------------------------------------------------------

shell();

translate([25,50,30]) {
   ball();     
}

translate([25,90,30]) {
    ball();
}

translate([65,50,30]) {
    ball();
}

translate([65,90,30]) {
    ball();
}

//modules-------------------------------------------------------------
module shell() {
    translate([boxw/2,boxl/2,boxh/2]) {
        difference() {
            minkowski() {
                box();
                sphere(d=sd);
            }
            translate([0,-boxl/3.3,boxh/6]) {
                cube([boxw*2,4,4], center=true); //axis
            }           
        }          
    }
}

module box() {
    difference() {
        cube([boxw-4, boxl-4, boxh-4], center=true);
        translate([0,boxl*0.2,boxh*0.9/2.7]) {
            cube([boxw*0.9-4, boxl*1.3-4, boxh*1.5-4], center=true);
        }
        translate([0,boxl*0.9,boxh*0.23]) { //slope
            rotate([-8,0,0]) {
                cube([boxw*0.9-4, boxl*1.3-4, boxh*1.5], center=true);
            }
        }       
    }
    translate ([0,boxl/-2+30,0]) {
        cube([boxw-6,4,boxh-4], center=true); //wall
    }
}

module ball() {
    %sphere(d=40);
}