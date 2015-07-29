// Z motor mount

include <settings.scad>;
use <tslot.scad>;
include <MCAD/stepper.scad>;
include <MCAD/boxes.scad>;
use <MCAD/hardware.scad>;

module zMotorMount(showVisuals){
    $fn = 90;
    //%translate([-20,-5,25]) rotate([0,90,0]) tslot20(90);
    
    width = 45;
    thickness = 5;
    offset = 8;
    
    difference(){
        translate([width/2,(thickness+tslotWidth)/2, tslotWidth]) roundedBox([width,thickness+tslotWidth,tslotWidth*2],3,false);
        
        // motor shaft and pulley hole
        translate([22.5,30,40]) rotate([90]) cylinder(d=25,h=tslotWidth*2);
        
        // motor mounting screw holes
        translate([7,40,tslotWidth+4.3]) rotate([90]) cylinder(d=3,h=tslotWidth*thickness);
        translate([38,40,tslotWidth+4.3]) rotate([90]) cylinder(d=3,h=tslotWidth*thickness);
        
        translate([7,20,tslotWidth+4.3]) rotate([90]) cylinder(d=6,h=tslotWidth*thickness);
        translate([38,20,tslotWidth+4.3]) rotate([90]) cylinder(d=6,h=tslotWidth*thickness);
        
        // extrusion mounting screw holes
        translate([offset,tslotWidth*1.4,tslotWidth/2]) rotate([90]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=65);
        translate([width-offset,tslotWidth*1.4,tslotWidth/2]) rotate([90]) cylinder(d=tslotScrewDiam,h=thickness*2,$fn=65);
        
        // remove the bit where it will sit on the extrusion
        translate([-1,-1,-1]) cube([width+2,tslotWidth+1,tslotWidth+1]);
    }
    
    if(showVisuals){
        // Z motor
        color("gray") translate([22.5,24.2,40]) rotate([90,0,180]) motor(Nema17);
        
        // extrusion mounting
        color("silver") translate([offset,tslotWidth+thickness,tslotWidth/2]) rotate([90,0,180]) screw(screwSize=tslotScrewDiam,thickness*2);
        color("silver") translate([width-offset,tslotWidth+thickness,tslotWidth/2]) rotate([90,0,180]) screw(screwSize=tslotScrewDiam,thickness*2);
    }
}
zMotorMount(true);