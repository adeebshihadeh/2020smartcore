// 

module right_angle_bracket(screwDiam=3, wallThickness=6){
    difference(){
        cube([45,45,20],center=true);
        
        translate([]) cube([45,45,20],center=true);
    }
}

right_angle_bracket();