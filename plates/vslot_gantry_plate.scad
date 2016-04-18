include <MCAD/shapes.scad>;
include <../utils/colors.scad>;

r1=2.5;
r2=3.6;
r3=1.5;
h=3;
// 5.05

module plate_fixation() {
  translate([-23.40, 0, 0]) union() {
    hull() {
      translate([0, 0, 0])   cylinder(r=r3, h+1);
      translate([6.5, 0, 0]) cylinder(r=r3, h+1);
    }
    hull() {
      translate([20.15, 0, 0]) cylinder(r=r3, h+1);
      translate([26.65, 0, 0]) cylinder(r=r3, h+1);
    }
    hull() {
      translate([40.29, 0, 0]) cylinder(r=r3, h+1);
      translate([46.79, 0, 0]) cylinder(r=r3, h+1);
    }
    hull() {
      translate([13.08, 7.7, 0]) cylinder(r=r1, h+1);
      translate([33.72, 7.7, 0]) cylinder(r=r1, h+1);
    }
  }
}

module 20mm_v_plate() {
  holes=[
    [12.6, 12.75, r1],  [12.6, 22.75, r1],  [12.6, 32.75, r1],  [12.6, 42.75, r1], [12.6, 52.75, r1],
                                            [22.75, 32.75, r1],
                        [32.75, 22.75, r1], [32.75, 32.75, r1], [32.75, 42.75, r1],
                                            [42.75, 32.75, r1],
    [52.75, 12.75, r2], [52.75, 22.75, r1], [52.75, 32.75, r2], [52.75, 42.75, r1], [52.75, 52.75, r2]
  ];
  width=65.5;
  height=65.5;
  color(color_black) difference() {
    roundedBox(width, height, h, 3.38);
    for(x=[0:len(holes)-1])
      translate([holes[x][0]-width/2, holes[x][1]-height/2, -h/2-0.5]) cylinder(r=holes[x][2], h+1);
    translate([0, 5.05-height/2, -h/2-0.5]) plate_fixation();
    rotate([0, 0, 180]) translate([0, 5.05-height/2, -h/2-0.5]) plate_fixation();
  }
}

module universel_v_plate() {
  holes=[
    [13.65,  13.65, r1], [13.65,  23.65, r1],                      [13.65,  43.65, r1],                      [13.65,  63.65, r1], [13.65,  73.65, r1],
    [23.65,  13.65, r1], [23.65,  23.65, r1],                      [23.65,  43.65, r1],                      [23.65,  63.65, r1], [23.65,  73.65, r1],
    [33.65,  13.65, r1], [33.65,  23.65, r1], [33.65,  33.65, r1], [33.65,  43.65, r1], [33.65,  53.65, r1], [33.65,  63.65, r1], [33.65,  73.65, r1],
    [43.65,  13.65, r1], [43.65,  23.65, r1], [43.65,  33.65, r1], [43.65,  43.65, r1], [43.65,  53.65, r1], [43.65,  63.65, r1], [43.65,  73.65, r1],
                         [53.65,  23.65, r1],                      [53.65,  43.65, r1],                      [53.65,  63.65, r1],
                         [63.65,  23.65, r1], [63.65,  33.65, r1], [63.65,  43.65, r1], [63.65,  53.65, r1], [63.65,  63.65, r1],
                         [73.65,  23.65, r1],                      [73.65,  43.65, r1],                      [73.65,  63.65, r1],
    [83.65,  13.65, r2], [83.65,  23.65, r1], [83.65,  33.65, r1], [83.65,  43.65, r2], [83.65,  53.65, r1], [83.65,  63.65, r1], [83.65,  73.65, r2],
    [93.65,  13.65, r2], [93.65,  23.65, r1], [93.65,  33.65, r1], [93.65,  43.65, r2], [93.65,  53.65, r1], [93.65,  63.65, r1], [93.65,  73.65, r2],
    [103.65, 13.65, r2], [103.65, 23.65, r1],                      [103.65, 43.65, r2],                      [103.65, 63.65, r1], [103.65, 73.65, r2],
    [113.65, 13.65, r2], [113.65, 23.65, r1],                      [113.65, 43.65, r2],                      [113.65, 63.65, r1], [113.65, 73.65, r2],

    [48.65, 28.65, r1], [48.65, 58.65, r1],
    [78.65, 28.65, r1], [78.65, 58.65, r1]
  ];
  width=127;
  height=88;
  color(color_black) difference() {
    roundedBox(width, height, h, 3.38);
    for(x=[0:len(holes)-1])
      translate([holes[x][0]-width/2, holes[x][1]-height/2, -h/2-0.5]) cylinder(r=holes[x][2], h+1);
    translate([0, 5.05-height/2, -h/2-0.5]) plate_fixation();
    rotate([0, 0, 180]) translate([0, 5.05-height/2, -h/2-0.5]) plate_fixation();
  }
}

module vslot_gantry_plate_test() {
  translate([0, 0, 0]) 20mm_v_plate();
  translate([140, 0, 0]) universel_v_plate();
}
