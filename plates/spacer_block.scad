include <../utils/colors.scad>;
use <MCAD/shapes.scad>;

module spacer_block(material=color_black) {
  w=20;
  h=86;
  thickness=12;
  color(material) difference() {
    translate([0, 0, thickness/2]) roundedBox(w, h, thickness, 3.36);
    for (y=[-30,0,30]) translate([0, y, -0.5]) cylinder(r=3.57, h=thickness+1);
    for (y=[-20,20])   translate([0, y, -0.5]) cylinder(r=2.5, h=thickness+1);
  }
}

module spacer_block_test() {
  spacer_block();
}
