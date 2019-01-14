//Design an Object: Outlet Phone Holder
//By jessicad2020
//v.0.5, 14 Jan 2019

//parameters -----------------------------------------------
chargeW = 25.7; //width of an Apple charger block
chargeL = 28; //length of an Apple charger block
chargeH = 26.3; //height of an Apple charger block
phoneL = 150; 
phoneW = 75;
phoneH = 10;
rad = 15;

//render ---------------------------------------------------
//%phone();
holder(1.3);

//modules --------------------------------------------------
module holder(size) {
    difference() {
       triangle(size, 1);
       triangle(size-0.1, 5);
       semic(size);
       //add a something to the difference for charging
        
    }
}

module semic(size) {
   translate([phoneL*size*0.55, phoneW*-0.5, phoneW/2*size]) {
       rotate([0,90,0]) {
           difference() {
               cylinder(r=rad, h=30, center=true);
               translate([0,-rad*1.5,0]) {
                   cube(size=rad*3, center=true);
                }
           }
       }
  } 
}

module triangle(size, height) {
    hull() {
        translate([phoneL*size*0.5, phoneW*size*-0.5, phoneW*size*0.5]) {
            cylinder(h=phoneW*size*height, r=rad, center=true);
    }
        translate([phoneL*size*-0.5, phoneW*size*-0.5, phoneW*size*0.5]) {
            cylinder(h=phoneW*size*height, r=rad, center=true);
        }
        translate([chargeW*size*0.5, phoneW*size*0.5, chargeL*size*0.5]) {
            cylinder(h=chargeL*size*height, r=rad, center=true);
        }
        translate([chargeW*size*-0.5, phoneW*size*0.5, chargeL*size*0.5]) {
            cylinder(h=chargeL*size*height, r=rad, center=true);
        }
    }
    
}

module phone() {
    translate([0,phoneL*-0.3, phoneW*0.5]) {
        cube([phoneL, phoneH, phoneW], center=true);
    }
}