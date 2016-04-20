include <MCAD/units.scad>;
include <../utils/colors.scad>;

thickness=3.17;

module threaded_rod_plate_body(w, h, r=5, thickness=3) {
  cut=(w-r*2)/3;
  body=[[r, r], [w-r, r], [w-r, h-r-cut], [w-r-cut, h-r], [r+cut, h-r], [r, h-r-cut]];
  linear_extrude(thickness) offset(r=r) polygon(body);
}

module threaded_rod_plate_holes(d, thickness) {
  union() {
    translate([0, 0, 1.17]) cylinder(r=8.025, h=thickness);
    translate([0, 0, -1]) cylinder(r=5.5, h=3);
    for (i=[0:90:180])
      rotate([0, 0, i]) translate([d, 0, -0.5]) cylinder(r=M3/2, h=thickness+1);
  }
}

module threaded_rod_plate_nema17(material=color_black) {
  w=53;
  h=59.29;
  color(material) difference() {
    threaded_rod_plate_body(w, h, thickness=thickness);
    translate([w/2, 32.43, 0]) threaded_rod_plate_holes(21.91, thickness);
    translate([6.5, 7.5, -0.5]) union() {
      for (i=[0:4]) {
        translate([10*i, 0, 0]) hull() {
          cylinder(r=2.5, h=thickness+1);
          translate([0, 5.8, 0]) cylinder(r=2.5, h=thickness+1);
        }
      }
    }
  }
}

module threaded_rod_plate_nema23(material=color_black) {
  w=80;
  h=72.5;
  color(material) difference() {
    threaded_rod_plate_body(w, h, thickness=thickness);
    translate([w/2, 32.43, 0]) union() {
      threaded_rod_plate_holes(21.91, thickness);
      for (i=[0:90:180])
        rotate([0, 0, i]) translate([33.3, 0, -0.5]) cylinder(r=M5/2, h=thickness+1);
    }
    translate([10, 7.5, -0.5]) union() {
      for (i=[0:6]) {
        translate([10*i, 0, 0]) hull() {
          cylinder(r=2.5, h=thickness+1);
          translate([0, 5.8, 0]) cylinder(r=2.5, h=thickness+1);
        }
      }
    }
  }
}

module threaded_rod_plate_test() {
  threaded_rod_plate_nema17();
  translate([80, 0, 0]) threaded_rod_plate_nema23();
}
