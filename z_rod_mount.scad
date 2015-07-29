// Z Rod mount - Test

include <settings.scad>;
use <MCAD/hardware.scad>;

// TODO: add support

module zRodMount(showVisuals=false){
    holeOffset = 5.5;
    width = 42;
    
    translate([0,-13,0]) {
        difference(){
            union(){
                translate([0,10,0]) cube([width,6,18],center=true);
                cube([18,16,12],center=true);
            }
            // rod holes
            cylinder(d=zRodDiam*1.05,h=20,center=true,$fn=100);
            translate([0,-5,0]) cube([1,7,22],center=true);
            
            // holes for screw to secure the rod
            translate([10,-6,0]) rotate([90,0,90])  cylinder(d=3,h=20,center=true,$fn=60); //sized for an M3
            translate([-10,-6,0]) rotate([90,0,90])  cylinder(d=3.5,h=20,center=true,$fn=6); //sized for an M3 nut
            
            // extrusion mounting holes
            translate([width/2-holeOffset,10,0]) rotate([90]) cylinder(d=tslotScrewDiam,h=20,center=true,$fn=90);
            translate([-(width/2-holeOffset),10,0]) rotate([90]) cylinder(d=tslotScrewDiam,h=20,center=true,$fn=90);
        }
        if(showVisuals){
            // extrusion mounting screws
            color("silver") translate([width/2-holeOffset,8,0]) rotate([90]) screw(8,screwsize=tslotScrewDiam);
            color("silver") translate([-(width/2-holeOffset),8,0]) rotate([90]) screw(8,screwsize=tslotScrewDiam);
        }    
    }
}

zRodMount(true);