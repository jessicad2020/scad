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
triangle(1.3);
//modules --------------------------------------------------
module triangle(size) {
    cube([phoneL*size, phoneW*size, phoneL], center=true);
}

module phone() {
    cube([phoneL, phoneW, phoneH], center=true);
}