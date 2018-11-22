//Coin Trap: a 3D printed cage to hold a coin
//By jessicad2020
//v.0.3, 22 Nov 2018

//parameters -------------------------------------------------
$fa=0.75;
$fs=0.75;
quarter_d = 23.88; //diameter of a quarter
quarter_th = 1.58; //thickness of a quarter
penny_d = 19.05;
penny_th = 1.45;
loonie_d = 26.5;
loonie_th = 1.75;
gap=1;

//render -----------------------------------------------------

!trap(quarter_d, quarter_th); //the trap
translate([0,-40,0])trap(loonie_d, loonie_th);
translate([40,0,0])base(quarter_d);
translate([40,-40,0])base(loonie_d);
//modules ----------------------------------------------------
 
module base(coin_d) {
    difference(){
    sphere(d=coin_d);
    translate([0,0,-coin_d/2]) cube(size=coin_d, center=true);
        rotate([54.74,0,0])
        rotate([0,0,45])
        translate([coin_d/2,coin_d/2,coin_d/2])
        minkowski() {
            cube(size=0.8*coin_d, center=true);
            sphere(r=0.1*coin_d);
    }
        
        
    }
    
}
module trap(coin_d, coin_th) {
  translate([0,0,coin_d/2]) { 
    %cylinder(d=coin_d, th=coin_th, center=true);
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