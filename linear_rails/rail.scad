use <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module rail(length=50) {
  width=19.52;
  height=2.3750;
  space=50.00;
  hole_diameter=5.30;
  nb_holes=floor((length-(space/2)) / space) + 1;
  head=[[0.00, 0.00], [0.00, height*2], [0.60, height*2], [height+0.60, height], [0.60, 0.00], [0.00, 0.00]];

  module profile() {
    translate([0, 0, length/2]) difference() {
      union() {
        roundedBox(width + 0.25, height, length, 0.25);
        translate([width/2 - 0.25, -height/2, -length/2]) linear_extrude(length) polygon(head);
      }
      for (x=[0:nb_holes-1]) {
        hull() {
          rotate([90, 0, 0]) translate([-hole_diameter/2, -length/2 + space/2 + space*x, -height]) cylinder(r=hole_diameter/2,h=height*2);
          rotate([90, 0, 0]) translate([hole_diameter/2, -length/2 + space/2 + space*x, -height]) cylinder(r=hole_diameter/2,h=height*2);
        }
      }
    }
  }
  color(color_black) profile();
}

module rail_test() {
  rail();
  translate([40, 0, 0]) rail(100);
  translate([80, 0, 0]) rail(150);
  translate([120, 0, 0]) rail(200);
}
