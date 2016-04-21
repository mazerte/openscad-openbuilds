include <MCAD/units.scad>;
use <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module tnut(segment=1, material=color_aluminum) {
  margin=8.44;
  w=10;
  h=margin*2 + (segment-1) * 20;
  thickness=1.6;
  color(material) difference() {
    union() {
      translate([w/2, h/2, thickness/2]) roundedBox(w, h, thickness, 1.5);
      for (y=[0:segment-1]) translate([w/2, margin + y*20, 1.5]) cylinder(r=3.45, h=1.40);
    }
    for (y=[0:segment-1]) translate([w/2, margin + y*20, -0.5]) cylinder(r=M5/2, h=3+1);
  }
}

module tnut_test() {
  translate([0,0,0]) tnut();
  translate([20,0,0]) tnut(2);
}
