//Design an Object: Outlet Phone Holder
//By jessicad2020
//v.0.1, 4 Jan 2019

//parameters -----------------------------------------------
chargeW = 25.7; //width of an Apple charger block
chargeL = 28; //length of an Apple charger block
chargeH = 26.3; //height of an Apple charger block
phoneL = 150; 
phoneW = 75;
phoneH = 10;

//render ---------------------------------------------------
//phone();
triangle(1.3);
//modules --------------------------------------------------
module triangle(size) {
    cube([phoneL*size, phoneW*size, phoneL], center=true);
    //try hull instead
}

module phone() {
    cube([phoneL, phoneW, phoneH], center=true);
}
