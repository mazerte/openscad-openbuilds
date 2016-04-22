include <MCAD/units.scad>;
include <../utils/colors.scad>;

module mounting_hub(material=color_black) {
  size=21.21;
  thickness=6;
  color(material) difference() {
    translate([0, 0, thickness/2]) cube([size, size, thickness], center=true);
    translate([0, 0, -0.5]) cylinder(r=2.5, h=thickness+1);
    for (x=[1:-2:-1], y=[1:-2:-1]) {
      translate([x*7.07, y*7.07, -0.5]) cylinder(r=M5/2, h=thickness+1);
      translate([x*size/2, y*size/2, thickness/2]) rotate([0,0,45]) cube([2.5, 2.5, thickness+1], center=true);
    }
    translate([size/2+0.5, 0, thickness/2]) rotate([0, -90, 0]) cylinder(r=M3/2, h=size+1);
  }
}

module mounting_hub_test() {
  mounting_hub();
}
