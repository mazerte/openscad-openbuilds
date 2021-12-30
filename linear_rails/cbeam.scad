use <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module cbeam(length=50, finish=color_aluminum) {

  size = 20;

  cutext=[[0.00, 5.43], [4.57, 10.00], [4.57, 10.10], [-4.57, 10.10], [-4.57, 10.00]];
  cutint=[[-2.84, 3.90], [-0.21, 3.90], [0.00, 3.70], [0.21, 3.90], [2.84, 3.90], [5.50, 6.56], [5.50, 8.20], [2.89, 8.20], [2.89, 9.20], [-2.89, 9.20], [-2.89, 8.20], [-5.50, 8.20], [-5.50, 6.56]];

  cut_big =
    [[6.1, -2.84],
     [6.1, -0.21],
     [6.3, 0],
     [6.1, 0.21],
     [6.1, 2.84],
     [2.7, 6.2],
     [2.7, 8.2],
     [-0.1, 8.2],
     [-0.1, -8.2],
     [2.7, -8.2],
     [2.7, -6.2]];

  cut_big_corner =
    [[6.1, -2.84],
     [6.1, -0.21],
     [6.3, 0],
     [6.1, 0.21],
     [6.1, 2.84],
     [0.739, 8.2],
     [-0.1, 8.2],
     [-0.1, -8.2],
     [2.7, -8.2],
     [2.7, -6.2]];

  color(finish)
  translate([0, 0, length/2]) difference(convexity=16) {

    // Stock
    union() {
      roundedBox(size*4, size, length, 1.8);
      for (x = [-30, 30])
        translate([x, 20, 0])
          roundedBox(size, size, length, 1.8);
      for (x = [-30, 30])
        translate([x, 10, 0])
          cube([size, size/2, length], center=true);
    }

    // Screw holes
    for (section = [[-1, 0],
                    [-2, 0],
                    [-2, 1],
                    [1, 0],
                    [2, 0],
                    [2, 1]]) {
      translate([section[0]*size-sign(section[0])*size/2, section[1]*size, 0])
        cylinder(d=4.2, h=length+2, center=true);
    }

    // Interior cuts
    translate([0, 0, -length/2-1]) {
      linear_extrude(length + 2, convexity=8) {

        polygon(cut_big);
        mirror([1, 0]) polygon(cut_big);

        interior_half();
        mirror([1, 0]) interior_half();

      }
    }
  }

  module interior_half() {

    translate([size, 0]) {
      polygon(cut_big_corner);
      mirror([1, 0]) polygon(cut_big);
    }

    translate([size*1.5, size/2]) rotate(90) {
      polygon(cut_big);
      mirror([1, 0]) polygon(cut_big_corner);
    }

    translate([size/2, 0]) {
      mirror([0, 1]) { polygon(cutext); polygon(cutint); }
      polygon(cutext); polygon(cutint);
    }

    translate([size*1.5, 0]) {
      mirror([0, 1]) { polygon(cutext); polygon(cutint); }
      translate([0, size]) { polygon(cutext); polygon(cutint); }
    }

    translate([size*1.5, 0]) rotate(270) { polygon(cutext); polygon(cutint); }
    translate([size*1.5, size]) rotate(270) { polygon(cutext); polygon(cutint); }
    translate([size*1.5, size]) rotate(90) { polygon(cutext); polygon(cutint); }

  }
}
