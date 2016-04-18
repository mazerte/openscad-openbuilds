include <MCAD/units.scad>;
include <../utils/colors.scad>;

module hexa_screw(head, r1, r2, h1, h2, h3, material=color_black) {
  chamfer=0.25;
  head_offset=0.5;
  body=[[0.0, h1-head_offset], [(head/2)-chamfer, h1-head_offset], [(head/2)-chamfer, chamfer], [(head/2), 0], [r1-chamfer, 0], [r1, chamfer], [r1, h1], [r2+chamfer, h1], [r2+chamfer, h1+h2], [r2, h1+h2], [r2, h1+h2+h3-chamfer], [r2-chamfer, h1+h2+h3], [0.0, h1+h2+h3]];
  color(material)difference() {
    rotate_extrude(convexity=16) polygon(body);
    cylinder(r=head/2, h=h1-head_offset, $fn=6);
  }
}

module m5_screw(length=6) { hexa_screw(3, 4.5, M5/2, 1.5, 1.5, length-1.5); }
module m3_cap_head_screw(length=30) { hexa_screw(2.5, 2.5, M3/2, 3, length/2, length-length/2); }
module m4_cap_head_screw(length=6) { hexa_screw(2.5, 4, M4/2, 3, 0, length, color_aluminum); }

module screw_test() {
  translate([0, 0, 0]) m5_screw(6);
  translate([10, 0, 0]) m5_screw(8);
  translate([20, 0, 0]) m5_screw(10);
  translate([30, 0, 0]) m5_screw(15);
  translate([40, 0, 0]) m5_screw(20);
  translate([50, 0, 0]) m5_screw(25);
  translate([60, 0, 0]) m5_screw(30);
  translate([70, 0, 0]) m5_screw(35);
  translate([80, 0, 0]) m5_screw(40);
  translate([90, 0, 0]) m5_screw(45);
  translate([100, 0, 0]) m5_screw(50);
  translate([110, 0, 0]) m5_screw(55);
  translate([120, 0, 0]) m5_screw(60);
  translate([130, 0, 0]) m5_screw(65);

  translate([0, 10, 0]) m3_cap_head_screw(30);
  translate([10, 10, 0]) m3_cap_head_screw(45);

  translate([0, 20, 0]) m4_cap_head_screw();
}
