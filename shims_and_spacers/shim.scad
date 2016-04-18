include <../utils/colors.scad>;

module shim(r1=5, r2=2.5, length=1) {
  color(color_aluminum) difference() {
    cylinder(r=r1, h=length);
    translate([0, 0, -0.5]) cylinder(r=r2, h=length+1);
  }
}

module precision_shim()     { shim(r1=5, r2=2.5, length=1); }
module mini_x_wheel_shim()  { shim(r1=4, r2=2.5, length=1); }
module slot_washer()        { shim(r1=7.5, r2=2.5, length=2); }
module 8mm_shim()           { shim(r1=6.35, r2=4, length=1.5); }
module flat_washer()        { shim(r1=9.32, r2=3.175, length=2); }

module shim_test() {
  translate([0, 0, 0]) precision_shim();
  translate([20, 0, 0]) mini_x_wheel_shim();
  translate([40, 0, 0]) slot_washer();
  translate([60, 0, 0]) 8mm_shim();
  translate([80, 0, 0]) flat_washer();
}
