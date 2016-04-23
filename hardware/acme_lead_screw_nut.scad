include <MCAD/units.scad>
include <MCAD/shapes.scad>
include <../utils/colors.scad>

module acme_lead_screw_hole() {
  union() {
    translate([0, 0, -0.5])     cylinder(r=4.5, h=1.6+1);
    translate([0, 0, 1.6-0.5])  cylinder(r=2.5, h=5.43+1);
    translate([0, 0, 1.6+5.43]) cylinder(r=9.24/2, h=4.97+1, $fn=6);
  }
}

module acme_lead_screw_nut_plate(material=color_black) {
  w=34;
  h=20;
  thickness=12;
  color(color_black) difference() {
    translate([0, 0, thickness/2]) cube([w, h, thickness], center=true);
    translate([-10, 0, 0]) acme_lead_screw_hole();
    translate([10, 0, 0])  acme_lead_screw_hole();
    translate([0, (h+1)/2, thickness/2]) rotate([90]) cylinder(r=4, h=h+1);
  }
}

module acme_lead_screw_nut_block_anti_backlash(material=color_black) {
  w=34;
  h=33;
  thickness=12;
  hole=26+5;
  color(color_black) difference() {
    translate([0, 0, thickness/2]) roundedBox(w, h, thickness, 3.04);
    translate([-10, h/2-10, 0]) acme_lead_screw_hole();
    translate([10, h/2-10, 0])  acme_lead_screw_hole();
    translate([0, (h+1)/2, thickness/2]) rotate([90]) cylinder(r=4, h=h+1);
    translate([-10, -h/2-0.5, thickness/2]) rotate([-90]) cylinder(r=2, h=8+1);
    translate([hole/2-w/2-2.5, 10.5-h/2, (thickness)/2]) roundedBox(hole, 5, thickness+1, 2.5);
  }
}

module acme_lead_screw_nut_block(material=color_black) {
  w=40;
  h=20;
  thickness=3.2;
  color(color_black) difference() {
    union() {
      translate([0, 0, thickness/2]) roundedBox(w, h, thickness, 1.5);
      rotate([0, 0, 360/12]) cylinder(r=6, h=12.7, $fn=6);
    }
    translate([-10, 0, 0])  acme_lead_screw_hole();
    translate([10, 0, 0])   acme_lead_screw_hole();
    translate([0, 0, -0.5]) cylinder(r=3, h=12.7+1);
  }
}

module acme_lead_screw_nut_test() {
  translate([0, 0, 0])   acme_lead_screw_nut_plate();
  translate([50, 0, 0])  acme_lead_screw_nut_block();
  translate([100, 0, 0]) acme_lead_screw_nut_block_anti_backlash();
}
