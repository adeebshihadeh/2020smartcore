// smartcore variant that uses 2020 extrusions

// 4 x 6.5in M8 rod
// 2 x 10in M8 rod

use <frame.scad>;
use <motor_mount.scad>;
//use <z_rod_mount.scad>;
use <smartcore_z_rod_mount.scad>;
use <z_motor_mount.scad>;
include <settings.scad>;


include <MCAD/stepper.scad>;
use <MCAD/bearing.scad>;
use <MCAD/hardware.scad>;

module smoothRod(length,diam){
    color("silver") cylinder(d=diam,h=length,$fn=100);
}

translate([-5,-5,0]) frame(sideLength = sideLength);

// XY Motor Mounts
translate([0,sideLength-45,frameHeight-tslotWidth]) motorMount(true);
mirror([1,0,0]) translate([-sideLength-tslotWidth,sideLength-45,frameHeight-tslotWidth]) motorMount(true);

// X Rods
rotate([90]) smoothRod(165,8);
translate([10,0,0]) rotate([90]) smoothRod(165,8);

// Y Rods
/*yRodOffset = 10;
translate([(sideLength+tslotWidth)/6,tslotWidth+yRodOffset,sideLength]) rotate([0,90,0]) smoothRod(165,8);
translate([30,0,0]) rotate([0,90,0]) smoothRod(165,8);*/

// Z axis
translate([(sideLength+tslotWidth)/2-100/2,tslotWidth,frameHeight-tslotWidth]) rotate(0) zRodMount(true);
translate([(sideLength+tslotWidth)/2-45/2,0,5]) zMotorMount(true);
//zRodSep = 70;
//translate([tslotWidth,(sideLength+tslotWidth)/2-zRodSep/2,sideLength-tslotWidth/2]) rotate(90) zRodMount(true);
//translate([tslotWidth,(sideLength+tslotWidth)/2+zRodSep/2,sideLength-tslotWidth/2]) rotate(90) zRodMount(true);*/
//translate([40,140,0]) smoothRod(254,8);
//translate([40,160,0]) smoothRod(254,8);