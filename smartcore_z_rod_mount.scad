// smartcore-like Z rod mount

include <settings.scad>;
use <MCAD/hardware.scad>;
use <MCAD/boxes.scad>;
use <MCAD/bearing.scad>;

module zRodMount(showVisuals = false){
    mountingHoleOffset = 6;
    thickness = 5;
    width = 110;
    rodHoleOffset = 6;
    width2 = 74;
    depth = thickness+19;
    
    difference(){
        union(){
            cube([width,thickness,tslotWidth]);
            translate([width2/2+(width-width2)/2,12,10]) difference(){
                roundedBox([width2,24,tslotWidth], 7, true);
                translate([0,-17,0]) cube([100,tslotWidth,25],center=true);
            }
        }
        // Rod holes
        translate([(width-width2)/2+rodHoleOffset,thickness*2+1,-1]) cylinder(d=zRodDiam,h=22,$fn=90);
        translate([width-(width-width2)/2-rodHoleOffset,thickness*2+1,-1]) cylinder(d=zRodDiam,h=22,$fn=90);
        
        // extrusion mounting holes
        translate([mountingHoleOffset,thickness+1,10]) rotate([90]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=50);
        translate([width-mountingHoleOffset,thickness+1,10]) rotate([90]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=50);
        
        // 608zz bearing hole
        // 8x22x7mm
        translate([width/2-28/2,depth-12,-1]) cube([28,9,25]);
        translate([width/2,depth+1,10]) rotate([90]) cylinder(d=8.1,h=7,$fn=90);
    }
    if(showVisuals){
        // extrusion mounting screws
        color("silver") translate([mountingHoleOffset,thickness,10]) rotate([270]) screw(screwsize=tslotScrewDiam,thickness+2);
        color("silver") translate([width-mountingHoleOffset,thickness,10]) rotate([270]) screw(screwsize=tslotScrewDiam,thickness*2);
        
        // 608zz bearing
        color("silver") translate([width/2,depth-4,10]) rotate([90]) bearing();
    }
}
zRodMount(true);