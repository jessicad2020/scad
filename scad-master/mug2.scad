//parameters
width=40;
height=60;
bottom_thickness=5;
wall_thickness=4;

//render
    difference() {
        intersection() {
            cube ([width,width,height], center=true);
            scale([1,1,height/width])
            sphere (width/2 * sqrt(2));
        }
        translate([0,0,-height/2+bottom_thickness])
        cylinder(h=height, r=width/2-wall_thickness);
    }