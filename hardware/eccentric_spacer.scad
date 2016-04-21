include <MCAD/units.scad>;
include <../utils/colors.scad>;

module eccentric_nut(length=5, material=color_aluminum) {
  screw_size=M5;
  wrench_size=M8;
  thread=0.4;
  r=wrench_size/2;
  intersection() {
    cylinder(r=r, h=length, $fn=6);
    offset=r*1.1*0.25*9/16;
    translate([0, 0, offset]) union() {
      scale([1, 1, 0.25]) sphere(r=r*1.1);
      cylinder(r=r*1.1, h=length-offset);
    }
  }
}

module eccentric_spacer(length=6, material=color_aluminum) {
  color(material) difference() {
    union() {
      eccentric_nut(length-1, material);
      translate([0,0,length-1]) cylinder(r=5,h=1);
      translate([0,0,length])   cylinder(r=3.55, h=2.5);
    }
    translate([0,-0.79,-0.5])   cylinder(r=2.25, h=length+2.5+1);
    translate([-2,-4.67-4,length-2])   cube(4);
  }
}

module eccentric_spacer_test() {
  eccentric_spacer();
  translate([20, 0, 0]) eccentric_spacer(1/4*inch);
}
