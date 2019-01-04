//Design an Object: Outlet Phone Holder
//By jessicad2020
//v.0.1, 4 Jan 2019

//parameters -----------------------------------------------
chargeL = 25.7; //length of an Apple charger block
chargeW = 26.26; //width of an Apple charger block
chargeH = 44.28; //height of an Apple charger block
phoneL = 150; 
phoneW = 75;
phoneH = 10;

//render ---------------------------------------------------
//phone();
triangle();
//modules --------------------------------------------------
module triangle() {
    cube([phoneL*1.2, phoneW*1.2, phoneL], center=true);
}

module phone() {
    cube([phoneL, phoneW, phoneH], center=true);
}