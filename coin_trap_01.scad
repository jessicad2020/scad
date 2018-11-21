//Coin Trap: a 3D printed cage to hold a coin
//By jessicad2020
//v.0.2, 21 Nov 2018

//parameters -------------------------------------------------
$fa=1;
$fs=1;
coin_d = 23.88; //diameter of a quarter
coin_th = 1.58; //thickness of a quarter
gap=1;

//render -----------------------------------------------------

coin(coin_d, coin_th); //the coin
trap(coin_d, coin_th); //the trap

//modules ----------------------------------------------------
module coin(coin_d, coin_th) {
    %cylinder(d=coin_d, th=coin_th, center=true);
}

module trap(coin_d, coin_th) {
  translate(0,0,coin_d/2) {  
    difference() {
        minkowski() {
            cube(size=0.8*coin_d, center=true);
            sphere(r=0.1*coin_d);
        }
        cylinder(r=coin_d/3, h=coin_d*2, center=true);
        rotate([90,0,0]){
            cylinder(r=coin_d/3, h=coin_d*2, center=true);
        }
        rotate([0,90,0]){
            cylinder(r=coin_d/3, h=coin_d*2, center=true);
        sphere(d=coin_d+gap);
        translate([0,coin_d*0.85,0]) sphere(d=coin_d);
        translate([coin_d*0.85,0,0]) sphere(d=coin_d);
        translate([0,0,coin_d*0.85]) sphere(d=coin_d);
        translate([coin_d*-0.85,0,0]) sphere(d=coin_d);
        translate([0,coin_d*-0.85,0]) sphere(d=coin_d);
        translate([0,0,coin_d*-0.85]) sphere(d=coin_d);
        }
    }
}
}