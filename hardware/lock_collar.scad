include <MCAD/units.scad>;
include <../utils/colors.scad>;

module lock_collar(d=0.25*inch, material=color_black) {
  r=d/2;
  r1=(d+0.25*inch)/2;
  r2=0.188*inch/2;
  length=0.281*inch;
  color(color_black) difference() {
    cylinder(r=r1, h=length);
    translate([0, 0, -0.5]) cylinder(r=r, h=length+1);
    translate([0, 0, length/2]) rotate([90, 0, 0]) cylinder(r=r2, h=10);
  }
}

module lock_collar_test() {
  translate([0, 0, 0])  lock_collar(5);
  translate([20, 0, 0]) lock_collar(0.25*inch);
  translate([40, 0, 0]) lock_collar(5);
}
