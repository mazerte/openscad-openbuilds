include <../utils/colors.scad>;
include <MCAD/units.scad>;

module hex_locknut(screw_size=M5, wrench_size=M8, inside_material=color_nylon, body_material=color_aluminum, length=5, head=1) {
  thread=0.4;
  r=wrench_size/2;
  r2=(wrench_size/2)*cos(360/12);
  color(body_material) difference() {
    union() {
      intersection() {
        cylinder(r=r, h=length-head, $fn=6);
        hull() {
          offset=r*1.1*0.25*9/16;
          translate([0, 0, (length-head)-offset]) scale([1, 1, 0.25]) sphere(r=r*1.1);
          translate([0, 0, offset]) scale([1, 1, 0.25]) sphere(r=r*1.1);
        }
      }
      union() {
        translate([0, 0, length-head]) rotate_extrude(convexity = 10) translate([r2-head, 0, 0]) circle(r=head);
        translate([0, 0, length-head]) cylinder(r=r2-head, h=head);
      }
    }
    translate([0, 0, -0.5]) cylinder(r=screw_size/2, h=length+1);
  }
  color(inside_material) difference() {
    cylinder(r=screw_size/2, h=length);
    translate([0, 0, -0.5]) cylinder(r=screw_size/2-thread, h=length+1);
  }
}

module hex_locknut_test() {
  hex_locknut();
}
