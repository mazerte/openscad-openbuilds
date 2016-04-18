use <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module end_cap() {
  size=20;
  r1=5;
  r2=2.5;
  color(color_black) difference() {
    roundedBox(size, size, 3, 1);
    cylinder(r=r1,h=2);
    translate([0, 0, -2]) cylinder(r=r2,h=3);
  }
}

module end_cap_test() {
  end_cap();
}
