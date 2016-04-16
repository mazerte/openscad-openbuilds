$fn = 32;

include <utils/colors.scad>;
colors_test();

include <linear_rails/vslot.scad>;
translate([0, 40, 0]) vslot_test();

include <linear_rails/rail.scad>;
translate([0, -80, 0]) rail_test();
