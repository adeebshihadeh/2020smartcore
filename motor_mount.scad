// motor mount for the 2020 smartcore

use <tslot.scad>;
include <MCAD/stepper.scad>;
use <MCAD/hardware.scad>;
include <settings.scad>;

motorWidth = 45;
smallHoleRes = 65;

module motorMount(showVisuals = true, thickness = 5){
    //%translate([-5,55,-5]) rotate([90]) tslot20(75);
    mountingHoleSep = 18;
    difference(){
        size = tslotWidth+thickness+motorWidth;
        cube([size,motorWidth,tslotWidth+thickness]);
        
        translate([-1,-1,-2]) cube([tslotWidth+1,size*2,tslotWidth+2]);
        translate([tslotWidth+thickness,-1,thickness]) cube([100,100,100]);
        
        // motor mounting holes
        translate([31.5,6.5,-1]) cylinder(d=3.5,h=thickness*2,$fn=smallHoleRes);
        translate([62.5,6.5,-1]) cylinder(d=3.5,h=thickness*2,$fn=smallHoleRes);
        translate([31.5,37.5,-1]) cylinder(d=3.5,h=thickness*2,$fn=smallHoleRes);
        translate([62.5,37.5,-1]) cylinder(d=3.5,h=thickness*2,$fn=smallHoleRes);
        
        translate([47,22,-1]) cylinder(d=25,h=thickness*2,$fn=165);
        
        // extrusion mounting screw holes
        translate([tslotWidth/2,motorWidth/2-mountingHoleSep/2,tslotWidth-thickness/2]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=smallHoleRes);
        translate([tslotWidth/2,motorWidth/2+mountingHoleSep/2,tslotWidth-thickness/2]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=smallHoleRes);
    }
    
    if(showVisuals){
        %translate([47,22,1]) rotate([180]) motor(Nema17);
        
        // motor mounting screws
        color("silver") translate([31.5,6.5,thickness+0.1]) screw(10,screwsize=3);
        color("silver") translate([62.5,6.5,thickness+0.1]) screw(10,screwsize=3);
        color("silver") translate([31.5,37.5,thickness+0.1]) screw(10,screwsize=3);
        color("silver") translate([62.5,37.5,thickness+0.1]) screw(10,screwsize=3);
        
        // extrusion mounting screws
        color("silver") translate([tslotWidth/2,motorWidth/2-mountingHoleSep/2,tslotWidth+thickness]) screw(8,screwsize=tslotScrewDiam);
        color("silver") translate([tslotWidth/2,motorWidth/2+mountingHoleSep/2,tslotWidth+thickness]) screw(8,screwsize=tslotScrewDiam);
    }
}

motorMount(true);