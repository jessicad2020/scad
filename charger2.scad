//Design an Object: Outlet Phone Holder
//By jessicad2020
//v.1.1, 22 Jan 2019

//parameters -----------------------------------------------
chargeW = 25.7; //width of an Apple charger block
chargeL = 28; //length of an Apple charger block
chargeH = 26.3; //height of an Apple charger block
phoneL = 145; //length of phone with case
phoneW = 75; //width of phone with case
phoneH = 15; //height of phone with case
rad = 15; //cylinder radius
scrad = 12; //oval radius
hs = 15; //hook size
sd= 2; //sphere diameter

//render ---------------------------------------------------
%phone();
holder(1.1);
%charge();

//modules --------------------------------------------------
module holder(size) {
    difference() {
        minkowski() {
            holderbase(size);
            sphere(r=sd*1.5);
        }
        semic(size);
    }
    translate([phoneL*size*0.43,13,phoneW/5*size]) {
        rotate([0,90,58]) {
            hook(10);
        }
    }
    translate([phoneL*size*0.43,13,phoneW/1.6*size]) {
        rotate([0,180,58]) {
            hook(10);
        }
    }
}

module holderbase(size) {
    difference() {
        triangle(size, 1);
        triangle(size-0.06, 5);
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
   translate([phoneL*size*0.55, phoneW*size*-0.23, phoneW/2*size]) {
       rotate([0,90,0]) {
           scale([2,1,1]) {
               cylinder(r=scrad, h=scrad*3, center=true);
           }
       }
  } 
}

module triangle(size, height) {
    hull() {
        translate([phoneL*size*0.5, phoneW*size/2*-0.5, phoneW*size*0.5]) {
            cylinder(h=phoneW*size*height, r=rad, center=true);
    }
        translate([phoneL*size*-0.5, phoneW*size/2*-0.5, phoneW*size*0.5]) {
            cylinder(h=phoneW*size*height, r=rad, center=true);
        }
        translate([chargeW*size*0.5, phoneW*size/2*0.5, chargeL*size*0.5]) {
            cylinder(h=chargeL*size*height, r=rad, center=true);
        }
        translate([chargeW*size*-0.5, phoneW*size/2*0.5, chargeL*size*0.5]) {
            cylinder(h=chargeL*size*height, r=rad, center=true);
        }
    }
    
}

module phone() {
    translate([0,phoneL*-0.15, phoneW*0.5]) {
        cube([phoneL, phoneH, phoneW], center=true);
    }
}

module charge() {
    translate([0,phoneW*0.15,chargeL/2]) {
        cube([chargeW, chargeH, chargeL], center=true);
    }
}