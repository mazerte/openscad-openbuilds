include <../utils/colors.scad>;
use <../bearings/bearing.scad>;

module vwheel(type="solid", material=color_black) {
  model = type == "mini" ? 105 : 625;
  rotate([0, 0, 0])   translate([0, 0, 0.5]) bearing(model=model, material=color_aluminum, sideMaterial=color_aluminum);
  rotate([180, 0, 0]) translate([0, 0, 0.5]) bearing(model=model, material=color_aluminum, sideMaterial=color_aluminum);

  body =
    type == "solid" ? [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]]:
    type == "delrin" ? [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [9.5, 5.5], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]]:
    type == "mini" ? [[5, 1], [6, 1], [9, 3], [9, 8], [6, 10], [5, 10]]:
    [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]];

  color(material) translate([0, 0, -5.5]) rotate_extrude(convexity = 32) polygon(body);
}

module solid_vwheel() { vwheel(); }
module xtreme_solid_vwheel() { vwheel(material=color_white); }
module derlin_vwheel() { vwheel(type="delrin"); }
module xtreme_derlin_vwheel() { vwheel(type="delrin", material=color_white); }
module mini_vwheel() { vwheel(type="mini"); }
module xtrem_mini_vwheel() { vwheel(type="mini", material=color_white); }
module metal_vwheel() { vwheel(type="delrin", material=color_aluminum); }

module vwheel_test() {
  translate([0, 0, 0])   solid_vwheel();
  translate([40, 0, 0])  xtreme_solid_vwheel();
  translate([80, 0, 0])  derlin_vwheel();
  translate([120, 0, 0])  xtreme_derlin_vwheel();
  translate([160, 0, 0])  mini_vwheel();
  translate([200, 0, 0]) xtrem_mini_vwheel();
  translate([240, 0, 0]) metal_vwheel();
}
