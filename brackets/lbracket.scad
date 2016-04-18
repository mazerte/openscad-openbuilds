include <../utils/colors.scad>;

module lbracket(size=1) {
  r=2.75;

  function length(model) = [14.5,38,59.60][model-1];
  function holes(model) = [[5.5], [5.5, 29], [5.5, 28, 50.5]][model-1];

  color(color_aluminum) {
    difference() {
      union() {
        cube([20, length(size), 3]);
        translate([3, 0, 0]) rotate([0, -90, 0]) cube([20, length(size), 3]);
      }
      for (x=[0:size-1]) {
        translate([10, holes(size)[x], -0.5]) hull() {
          cylinder(r=r, h=4);
          translate([0, 3.5, 0]) cylinder(r=r, h=4);
        }
        translate([-0.5, holes(size)[x], 15]) rotate([0, 90, 0]) hull() {
          cylinder(r=r, h=4);
          translate([0, 3.5, 0]) cylinder(r=r, h=4);
        }
      }
    }
  }
}

module lbracket_test() {
  translate([0, 0, 0]) lbracket();
  translate([0, 25, 0]) lbracket(size=2);
  translate([0, 70, 0]) lbracket(size=3);
}
