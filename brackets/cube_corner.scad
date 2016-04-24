include <../utils/colors.scad>;

module cube_corner() {
  size=20.0;
  r1=5.5;
  r2=3.57;
  color(color_black) difference() {
    cube(size);
    union() {
      translate([3.5, size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r1, h=size);
      translate([-1, size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r2, h=size);
    }
    rotate([0, 0, 90]) union() {
      translate([3.5, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r1, h=size);
      translate([-1, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r2, h=size);
    }
    translate([0, 0, size]) rotate([0, 90, 90]) union() {
      translate([3.5, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r1, h=size);
      translate([-1, -size/2, size/2]) rotate([0, 90, 0]) cylinder(r=r2, h=size);
    }
  }
}

module cube_corner_test() {
  cube_corner();
}
