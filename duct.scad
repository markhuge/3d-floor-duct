/* 
 *---------------------------------------------------------------------------
 * Floor vent duct model by Mark Wilkerson
 * https://markhuge.com | pgp 8EA279E656673B23 | https://github.com/markhuge
 *---------------------------------------------------------------------------
 * License - CC-BY-SA-4.0
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 
 * International License - (https://creativecommons.org/licenses/by-sa/4.0/).
 *---------------------------------------------------------------------------
 *
 * 3D Printing
 * -----------
 * 0.3mm layer height
 * 3 top/bottom solid layers
 * 4 outline/perimeter shells
 * 0% infill
 * no supports
 *---------------------------------------------------------------------------
 */

// Base dimensions
width = 285;
depth = 135;
height = 30;

module side(depth,height,xpos,ypos) {
  hull(){
    translate([xpos,0,0])
      cube([1,1,1],true);
    translate([xpos,0,height])
      cube([1,1,1],true);
    translate([xpos,-depth,0])
      cube([1,1,10],true);
  }
}


module ramp(width,depth,height) {
  hull(){
    side(depth,height,-width/2);
    side(depth,height,width/2);
  }
}

module duct(){

    // main body
    difference(){
      ramp(width,depth,height);
      translate([0,1,-1])
        ramp(width-3,depth,height);
    }

    // center column
    difference(){
      translate([0,0,-3])
        ramp(11,depth,height+3);
      translate([0,0,-3])
        ramp(8.5,depth,height+3);
      translate([0,0,-3])
        cube([50,70,100],true);
      translate([0,-120,-3])
        cube([60,70,100],true);
    }
}

// Rotate to print flat
translate([0,0,height]) rotate([169.3,0,0]) duct();
