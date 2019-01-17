//Design an Object: Outlet Phone Holder
//By jessicad2020
//v.0.8, 17 Jan 2019

//parameters -----------------------------------------------
chargeW = 25.7; //width of an Apple charger block
chargeL = 28; //length of an Apple charger block
chargeH = 26.3; //height of an Apple charger block
phoneL = 150; //length of phone with case
phoneW = 75; //width of phone with case
phoneH = 10; //height of phone with case
rad = 15; //cylinder radius
scrad = 16; //semi circle radius
hs = 15; //hook size
sd= 2; //sphere diameter

//render ---------------------------------------------------
%phone();
holder(1.3);
%charge();

//modules --------------------------------------------------
module holder(size) {
    minkowski() {
        difference() {
           triangle(size, 1);
           triangle(size-0.06, 5);
           semic(size);
        }
        sphere(r=sd*1.5);
    }
    translate([phoneL*size*0.44,0,phoneW/5*size]) {
        rotate([0,90,40]) {
            hook(10);
        }
    }
    translate([phoneL*size*0.44,0,phoneW/1.6*size]) {
        rotate([0,180,40]) {
            hook(10);
        }
    }
}

module hook(s) {
    minkowski() {
        difference() {
            roundbx(s);
            translate([s/1.5,0,s/-1.5]) {
                roundbx(s*2);
            }
        }
        sphere(d=sd/2);
    }
}

module roundbx(size) {
    minkowski() {
        cube(size=size, center=true);
        sphere(sd);
    }
}

module semic(size) {
   translate([phoneL*size*0.55, phoneW*size*-0.55, phoneW/2*size]) {
       rotate([0,90,0]) {
           difference() {
               cylinder(r=scrad, h=scrad*3, center=true);
               translate([0,-scrad*1.5,0]) {
                   cube([scrad*3.5,scrad*3,scrad*3.5], center=true);
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

module charge() {
    translate([0,phoneW*0.5,chargeL/2]) {
        cube([chargeW, chargeH, chargeL], center=true);
    }
}