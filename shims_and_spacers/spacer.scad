include <MCAD/units.scad>;
include <../utils/colors.scad>;

module spacer(length=6) {
  r1=5;
  r2=2.55;
  body=[[r2, 0.25], [r2+0.25, 0], [r1-0.25, 0.00], [r1, 0.25], [r1, length-0.25], [r1-0.25, length], , [r2+0.25, length], [r2, length-0.25]];
  color(color_aluminum) rotate_extrude(convexity = 32) polygon(body);
}

module nylon_spacer(length=3.175) {
  r1=4;
  r2=M5/2;
  color(color_nylon) difference() {
    cylinder(r=r1, h=length);
    translate([0, 0, -0.5]) cylinder(r=r2, h=1+length);
  }
}

module spacer_test() {
  translate([0, 0, 0])   spacer((1/8)*inch);
  translate([30, 0, 0])  spacer((1/4)*inch);
  translate([60, 0, 0])  spacer((1/2)*inch);
  translate([90, 0, 0])  spacer(3);
  translate([120, 0, 0]) spacer(6);
  translate([150, 0, 0]) spacer(9);
  translate([180, 0, 0]) spacer(20);
  translate([210, 0, 0]) spacer(35);
  translate([240, 0, 0]) spacer(40);
  translate([270, 0, 0]) nylon_spacer(1/8*inch);
  translate([300, 0, 0]) nylon_spacer(1/4*inch);
}
