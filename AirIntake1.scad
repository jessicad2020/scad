//Air Intake Motor Part
//by jessicad2020
//v.0.7, 24 May 2019

//parameters
dshell = 52.7; //diameter of outer shell
hshell = 28.8; //height of outer shell
dpipe = 25; //diameter of air pipe
hpipe = 40; //height of air pipe
wwidth = 3.4; //wall width
dbrim = 47.7; //top brim diameter
depthbrim = 1.55; //depth of the top brim
dchannel = 8.55; //diameter of the channel for the screw
hchannel = 27; //height of the channel for the screw
dbasechannel = 12.9; //diameter of the base of the channel
hbasechannel = 10; //height of the base of the channel
dscrewChannel = 5; //diameter of the screw channel
dcut = 8.65; //diameter of the cut-out for the screws
hcut = 5.1; //height of the cut-out for the screws
cscrewwall = 6.7; //distance from the diameter of shell to center of screw channel
$fs = 0.5;
$fa = 1;

//render
screwCut();

//modules
module shell(){
    cylinder(d=dshell, h=hshell-3, center=true);
    translate([dshell/2,-dshell/4,0]){
        rotate([0,90,0]){
            cylinder(d=dpipe, h=hpipe, center=true);
        }
    }
    translate([hpipe+wwidth*1.7,-dshell/4,0]){
        translate([-1.5/2,0,0]){
            rotate([0,90,0]){
                rotate_extrude(convexity = 10) //rotate and translate over to pipe to  make brim for the mesh
                translate([dpipe/2-1.5/3,0,0])
                circle(r=1.5);
            }
        }
    }
}

module subtract(){
  difference(){
    shell();
    translate([0,0,-hshell/2+wwidth]){
        cylinder(d=dshell-2*wwidth, h=hshell*2);
    }
    translate([dshell/2,-dshell/4,0]){
        rotate([0,90,0]){
            cylinder(d=dpipe-2*wwidth, h=hpipe+5, center=true);
        }
    }
    translate([0,0,hshell/2-3]){
        cylinder(d=dbrim, h=hshell); //top brim
        
    }
}  
}

module pancakeTop(){
    hull(){
            rotate_extrude(convexity = 10)
            translate([dshell/2-3, 0, 0])
            circle(r = 3);
        }
}

module brim(){
   translate([0,0,-hshell/2+1.5]){
    difference(){
        pancakeTop();
        translate([0,0,hshell/2]){
            cylinder(d=dshell*2, h=hshell, center=true);
        }
    }
} 
}

module channel(){ //channels for the screws
    cylinder(d=dchannel, h=hchannel, center=true);
    translate([0,0,hchannel/-2]){
        translate([0,0,hbasechannel/2]){
            cylinder(d=dbasechannel, h=hbasechannel, center=true);
        }
    } 
}

module endShell(){
    subtract();
    brim();
    translate([dshell/2-cscrewwall,0,-1.5]){        
        channel();
    }
    translate([-dshell/2+cscrewwall,0,-1.5]){        
        channel();
    }
}

module screwCut(){ //cut-out for the screws
    difference(){
        endShell();
        translate([dshell/2+wwidth-10,0,-hshell/2-1.5]){ //right cut out for screws
            cylinder(d=dcut, h=hcut, center=true);
        }
        translate([dshell/2+wwidth-5,0,-hshell/2-1.5]){ //right cut out for screws
            cube([dcut,dcut,hcut], center=true);
        }
        translate([-dshell/2-wwidth+10,0,-hshell/2-1.5]){ //left cut out for screws
            cylinder(d=dcut, h=hcut, center=true);
        }
        translate([-dshell/2-wwidth+5,0,-hshell/2-1.5]){ //left cut out for screws
            cube([dcut,dcut,hcut], center=true);
        }
        translate([dshell/2-cscrewwall,0,-1.5]){        
            cylinder(d=dscrewChannel, h=hchannel*3, center=true);
        }
        translate([-dshell/2+cscrewwall,0,-1.5]){        
            cylinder(d=dscrewChannel, h=hchannel*3, center=true);
        }
        translate([0,0,hshell/2-3]){
            cylinder(d=dbrim, h=hshell); //top brim        
        }
    }
}