include <MCAD/units.scad>;
include <../utils/colors.scad>;

module flexible_coupling(d1, d2, h=25, d3=20, material=color_aluminum) {
  color(material) difference() {
    cylinder(r=d3/2, h=h);
    translate([0, 0, -0.5]) cylinder(r=d1/2, h=h/2+1);
    translate([0, 0, h/2])  cylinder(r=d2/2, h=h/2+0.5);
    translate([2-d3/2, 0, -0.5])  cube([d3, 1, h/3+0.5]);
    translate([2-d3/2, 0, 2/3*h]) cube([d3, 1, h/3+0.5]);
    for (z=[1/6*h, 5/6*h]) {
      translate([1/4*d3, d3/4+0.5, z]) rotate([90]) cylinder(r=M3/2, h=d3/2+0.5);
      translate([1/4*d3, 3/4*d3, z]) rotate([90]) cylinder(r=3, h=d3/2);
    }
    translate([0, 0, h/3]) linear_extrude(h/3, convexity=10, twist=360*6) translate([d2/2, 0]) square([(d3-d2)/2+0.5, (d3-d2)/2+0.5]);
  }
}

module flexible_coupling_5x8()       { flexible_coupling(5, 8); }
module flexible_coupling_5x6()       { flexible_coupling(5, 6); }
module flexible_coupling_025inchx8() { flexible_coupling(1/4*inch, 8); }

module flexible_coupling_test() {
  translate([0, 0, 0])  flexible_coupling_5x8();
  translate([40, 0, 0]) flexible_coupling_5x6();
  translate([80, 0, 0]) flexible_coupling_025inchx8();
}
