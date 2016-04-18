include <MCAD/units.scad>;
include <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module mini_v_gantry_plate(material=color_black) {
  w=50;
  h=50;
  thickness=6.35;
  color(color_black) translate([w/2, h/2]) difference() {
    translate([0, 0, thickness/2])roundedBox(w, h, thickness, 4);
    translate([0, 0, -0.5]) cylinder(r=M5/2, h=thickness+1);
    for (a=[0:90:270]) {
      rotate([0, 0, a]) union() {
        translate([0, 10, -0.5]) cylinder(r=M5/2, h=thickness+1);
        translate([0, 10, -1]) cylinder(r=5.5, h=3+1);
        translate([15, 15, -0.5]) cylinder(r=M5/2, h=thickness+1);
        translate([15, 15, thickness-3]) cylinder(r=5.5, h=3+1);
      }
    }
    for(a=[0,180]) {
      rotate([0, 0, a]) union() {
        hull() {
          translate([w/2-M3*3/2, 2, -0.5])  cylinder(r=M3, h=thickness+1);
          translate([w/2-M3*3/2, -2, -0.5]) cylinder(r=M3, h=thickness+1);
        }
        hull() {
          translate([w/2-M3*1/2, 2,  thickness/2]) cylinder(r=M3, h=thickness+1);
          translate([w/2-M3*1/2, -2, thickness/2]) cylinder(r=M3, h=thickness+1);
        }
      }
    }
  }
}

module mini_v_gantry_plate_test() {
  mini_v_gantry_plate();
}
