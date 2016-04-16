include <MCAD/materials.scad>

color_black = [0.27, 0.27, 0.3];
color_aluminum = Aluminum;

module colors_test() {
  color(color_black)
    cube([10, 10, 1]);

  color(color_aluminum)
    translate([20, 0, 0])
      cube([10, 10, 1]);
}
