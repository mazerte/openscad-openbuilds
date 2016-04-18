include <MCAD/units.scad>;
include <../utils/colors.scad>;

module joining_plate(holes=[], h=4, d=M5, pintch=20, material=color_aluminum) {
  function before(value) = value*pintch-pintch/2;
  function after(value) = value*pintch+pintch/2;

  x1 = max([for(i=[0:len(holes)-1]) if(holes[i][1] == 0) holes[i][0]]); // max(firstLine(x))
  x2 = max([for(i=[0:len(holes)-1]) holes[i][0]]);
  y1 = max([for(i=[0:len(holes)-1]) if(holes[i][0] == 0) holes[i][1]]); // max(firstColumn(y))
  y2 = max([for(i=[0:len(holes)-1]) holes[i][1]]);

  body=[
    [before(x1), before(0)], [after(x1), before(0)],
    [after(x2), before(y1)], [after(x2), after(y1)],
    [after(x1), after(y2)], [before(x1), after(y2)],
    [before(0), after(y1)], [before(0), before(y1)]
  ];
  color(material) translate([pintch/2, pintch/2, 0]) difference() {
    linear_extrude(h) polygon(body);
    for (i=[0:len(holes)-1])
      translate([holes[i][0]*pintch, holes[i][1]*pintch, -0.5]) cylinder(r=d/2, h=h+1);
  }
}

module t_joining_plate()     { joining_plate([[1, 0], [1, 1], [0, 2], [1, 2], [2, 2]]); }
module 90_joining_plate()    { joining_plate([[0, 0], [0, 1], [0, 2], [1, 2], [2, 2]]); }
module cross_joining_plate() { joining_plate([[2, 0], [0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [2, 2]]); }
module 2_joining_plate()     { joining_plate([[0, 0], [1, 0]]); }
module 3_joining_plate()     { joining_plate([[0, 0], [1, 0], [2, 0]]); }

module joining_plate_test() {
  translate([0, 0, 0])   t_joining_plate();
  translate([80, 0, 0])  90_joining_plate();
  translate([160, 0, 0]) cross_joining_plate();
  translate([280, 0, 0]) 2_joining_plate();
  translate([340, 0, 0]) 3_joining_plate();
}
