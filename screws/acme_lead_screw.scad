include <../utils/colors.scad>;

module acme_lead_screw(length=250, d=8, pitch=2, material=color_aluminum) {
  color(material) union() {
    cylinder(r=d/2-1, h=length);
    union() {
    for (a=[0:(360*length/pitch)/$fn-1])
      rotate([0,0,a*$fn]) translate([d/2-2, -1.15, length/(360*length/pitch)*a*$fn]) rotate([4.5]) cube([2,2.3,1]);
    }
  }
}

module acme_lead_screw_test() {
  translate([0, 0, 0])  acme_lead_screw(250);
  /*translate([20, 0, 0]) acme_lead_screw(500);
  translate([40, 0, 0]) acme_lead_screw(1000);*/
}
