include <MCAD/units.scad>;
include <../utils/colors.scad>;
use <../bearings/bearing.scad>;
use <../shims_and_spacers/spacer.scad>;

module pulley(material=color_black) {
  body=[[6.945, 1.55], [8, 1.55], [8, 6.35], [11, 6.35], [11, 5.25], [8.75, 5.25], [8.75, -5.25], [11, -5.25], [11, -6.35], [8, -6.35], [8, -1.55], [6.945, -1.55]];
  color(material) rotate_extrude(convexity = 32) polygon(body);
  rotate([0, 0, 0])   translate([0, 0, 1.55]) bearing(model=625, material=color_aluminum, sideMaterial=color_aluminum);
  translate([0, 0, -1/16*inch]) nylon_spacer(1/8*inch);
  rotate([180, 0, 0]) translate([0, 0, 1.55]) bearing(model=625, material=color_aluminum, sideMaterial=color_aluminum);
}

module pulley_test() {
  pulley();
}
