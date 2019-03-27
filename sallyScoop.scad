//Scoop for Dawg
//by jessicad2020
//v.3.0, 23 Mar 2019 

//parameters----------------------------------------------------------
boxw = 172;
boxl = 83;
boxh = 70;


//render--------------------------------------------------------------

shell();

translate([25,25,25]) {
   ball();     
}

translate([25,65,25]) {
    ball();
}

translate([65,25,25]) {
    ball();
}

translate([65,65,25]) {
    ball();
}

//modules-------------------------------------------------------------
module shell() {
    translate([boxw/2,boxl/2,boxh/2]) {
        difference() {
            box();
            translate([boxw/4, boxl, boxh]) {
                rotate([-30,0,0]) {
                    cube([boxw*2, boxl*2, boxh*2], center=true);
                }
            }    
            translate([0,-boxl/2+35,-boxh/2+50]) {
                cube([boxw*2,4,4], center=true); //axis
            }
            
        }          
    }
}

module box() {
    difference() {
        cube([boxw, boxl, boxh], center=true);
        translate([0,boxl*0.2,boxh*0.9/2.7]) {
            cube([boxw*0.96, boxl*1.33, boxh*1.55], center=true);
        }
    }
}

module ball() {
    %sphere(d=40);
}