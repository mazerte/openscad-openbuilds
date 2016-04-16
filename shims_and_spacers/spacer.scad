include <MCAD/units.scad>;
use <utils/colors.scad>;

module spacer(length=6) {
  r1=5;
  r2=2.55;
  body=[[r2, 0.25], [r2+0.25, 0], [r1-0.25, 0.00], [r1, 0.25], [r1, length-0.25], [r1-0.25, length], , [r2+0.25, length], [r2, length-0.25]];
  color(color_aluminum) rotate_extrude(convexity = 32) polygon(body);
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
}
