include <MCAD/units.scad>;
include <../utils/colors.scad>;

module micro_limit_switch_plate(material=color_black) {
  thickness=3;
  w=32;
  h=15;
  color(material) difference() {
    linear_extrude(thickness) square([w, h]);
    translate([3/4*w, h/2]) union() {
      for (a=[0:90:270]) {
        rotate([0, 0, a]) hull() {
          translate([3, 0, -0.5]) cylinder(r=M3/2, thickness+1);
          translate([4.5, 0, -0.5]) cylinder(r=M3/2, thickness+1);
        }
      }
    }
    translate([1/4*w, h/2]) hull() {
      translate([-3, 0, -0.5]) cylinder(r=M5/2, thickness+1);
      translate([3, 0, -0.5]) cylinder(r=M5/2, thickness+1);
    }
  }
}

module micro_limit_switch_plate_test() {
  micro_limit_switch_plate();
}
