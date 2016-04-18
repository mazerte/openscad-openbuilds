include <../utils/colors.scad>;

module angle_corner() {
  size=20.0;
  r1=5.5;
  r2=3.57;
  body=[[0.00, 0.00], [size, 0.00], [size, 1.00], [1.00, size], [0.00, size]];
  rotate([0, -90, 0]) color(color_black) difference() {
    linear_extrude(size) polygon(body);
    union() {
      translate([3.5, size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r1, h=size);
      translate([-1, size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r2, h=size);
    }
    rotate([0, 0, 90]) union() {
      translate([3.5, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r1, h=size);
      translate([-1, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r2, h=size);
    }
  }
}

module angle_corner_test() {
  angle_corner();
}
