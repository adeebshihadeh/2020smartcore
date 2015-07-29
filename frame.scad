// 2020 smartcore frame

use <tslot.scad>;
include <settings.scad>;

tslotOffset = 5;
tslotWidth = 20;

module frame(){
    color("silver"){
        // vertical extrusions
        tslot20(frameHeight,false);
        translate([sideLength,0,0]) tslot20(frameHeight,false);
        translate([sideLength,sideLength,0]) tslot20(frameHeight,false);
        translate([0,sideLength,0]) tslot20(frameHeight,false);
        
        // bottom extrusions
        translate([tslotOffset*tslotOffset,0,0]) rotate(90) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([tslotOffset*tslotOffset,sideLength,0]) rotate(90) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([sideLength,sideLength+tslotOffset,0]) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([0,sideLength+tslotOffset,0]) rotate([90]) tslot20(sideLength-tslotWidth,false);
        
        // top extrusions
        topTslotOffset = frameHeight-tslotOffset-tslotWidth;
        
        translate([tslotOffset*tslotOffset,0,topTslotOffset]) rotate(90) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([tslotOffset*tslotOffset,sideLength,topTslotOffset]) rotate(90) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([sideLength,sideLength+tslotOffset,topTslotOffset]) rotate([90]) tslot20(sideLength-tslotWidth,false);
        translate([0,sideLength+tslotOffset,topTslotOffset]) rotate([90]) tslot20(sideLength-tslotWidth,false);
    }
}

frame();