include <MCAD/units.scad>;
include <../utils/colors.scad>;

module lock_collar(material=color_black) {
  r1=0.5*inch/2;
  r2=0.25*inch/2;
  r3=0.188*inch/2;
  length=0.281*inch;
  color(color_black) difference() {
    cylinder(r=r1, h=length);
    translate([0, 0, -0.5]) cylinder(r=r2, h=length+1);
    translate([0, 0, length/2]) rotate([90, 0, 0]) cylinder(r=r3, h=10);
  }
}

module lock_collar_test() {
  lock_collar();
}
