use <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module vslot(length=50, sections=1, finish) {
  size=20;
  cutext=[[0.00, 5.43], [4.57, 10.00], [4.57, 10.10], [-4.57, 10.10], [-4.57, 10.00]];
  cutint=[[-2.84, 3.90], [-0.21, 3.90], [0.00, 3.70], [0.21, 3.90], [2.84, 3.90], [5.50, 6.56], [5.50, 8.20], [2.89, 8.20], [2.89, 9.20], [-2.89, 9.20], [-2.89, 8.20], [-5.50, 8.20], [-5.50, 6.56]];
  cutintin=[[-2.84, 3.90], [-0.21, 3.90], [0.00, 3.70], [0.21, 3.90], [2.84, 3.90], [6.20, 7.30], [8.20, 7.30], [8.20, 10.10], [-8.20, 10.10], [-8.20, 7.30], [-6.20, 7.30]];
  cutint2=[[8.20, 8.20], [6.57, 8.20], [6.57, 7.62], [7.62, 6.57], [8.20, 6.57]];

  module profile() {
    translate([0, 0, length/2]) difference() {
      roundedBox(size*sections, size, length, 1.8);
      for (section=[0:sections-1]) {
        offset = -(sections-1)*(size/2)+section*size;
        total_length = length+10;
        translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) circle(4.2/2);
        for (angle=[0:90:270]) {
          if (angle==0 || angle==180 || (angle==90 && section==0) || (angle==270 && section==sections-1)) {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutext);
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutint);
          } else {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutintin);
          }
          if ((section==0 && (angle==90 || angle==180)) || (section==sections-1 && (angle==0 || angle==270))) {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutint2);
          }
        }
      }
    }
  }

  if(finish)
		color(finish) profile();
	else
		color(color_aluminum) profile();
}

module vslot20x20(length, finish) { vslot(length, 1, finish); }
module vslot20x40(length, finish) { vslot(length, 2, finish); }
module vslot20x60(length, finish) { vslot(length, 3, finish); }
module vslot20x80(length, finish) { vslot(length, 4, finish); }


module vslot_test() {
  vslot20x20(50);
  translate([40, 0, 0]) vslot20x40(100, color_black);
  translate([100, 0, 0]) vslot20x60(150);
  translate([180, 0, 0]) vslot20x80(200, color_black);
}
