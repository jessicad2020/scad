//Scoop for Dawg
//by jessicad2020
//v.1.0, 25 Jan 2019 

//parameters----------------------------------------------------------
boxw = 92;
boxl = 115;
boxh = 68;


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
            box();
            translate([boxw/4, boxl, boxh]) {
                rotate([-23,0,0]) {
                    cube([boxw*2, boxl*2, boxh*2], center=true);
                }
            }    
            translate([0,-boxl/3.3,boxh/6]) {
                cube([boxw*2,4,4], center=true); //axis
            }
            
        }          
    }
}

module box() {
    difference() {
        cube([boxw, boxl, boxh], center=true);
        translate([0,boxl*0.2,boxh*0.9/2.7]) {
            cube([boxw*0.93, boxl*1.33, boxh*1.55], center=true);
        }
        translate([0,boxl*0.9,boxh*0.12]) { //slope
            rotate([-6,0,0]) {
                cube([boxw*0.93, boxl*1.33, boxh*1.33], center=true);
            }
        }       
    }
    translate ([0,boxl/-2+30,0]) {
        cube([boxw-2,2.5,boxh], center=true); //wall
    }
}

module ball() {
    %sphere(d=40);
}