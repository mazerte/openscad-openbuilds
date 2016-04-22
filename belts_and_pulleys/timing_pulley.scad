include <../utils/colors.scad>;

module timing_pulley(pitch, tooth, belt=6, r=8.5, material=color_aluminum) {
  r1=tooth*pitch/(2*3.1416);
  color(material) difference() {
    union() {
      translate([0, 0, 0])        cylinder(r=min(r, r1+belt/3), h=5);
      translate([0, 0, 5])        cylinder(r=r1+belt/3, h=1);
      translate([0, 0, 6])        cylinder(r=r1, h=belt+1);
      translate([0, 0, 6+belt+1]) cylinder(r=r1+belt/3, h=1);
    }
    translate([0, 0, -0.5]) cylinder(r=2.5, h=6+belt+2+1);
    for (a=[0:tooth-1])
      rotate([0, 0, (360/tooth)*a]) translate([r1-pitch/2, -pitch/4, 6]) cube([pitch/2, pitch/2, belt+1]);
    for (a=[0,90])
      translate([0, 0, 2.5]) rotate([0, 90, a]) translate([1]) cylinder(r=1, h=min(r, r1+belt/3));
  }
}

module timing_pulley_gt2_14() { timing_pulley(2, 14); }
module timing_pulley_gt2_20() { timing_pulley(2, 20); }
module timing_pulley_gt2_30() { timing_pulley(2, 30, r=6); }
module timing_pulley_gt3_20() { timing_pulley(3, 20, r=6); }
module timing_pulley_gt3_20_hightorque() { timing_pulley(3, 20, 9, r=6); }
module timing_pulley_gt3_40_hightorque() { timing_pulley(3, 40, 9, 9); }

module timing_pulley_test() {
  translate([0, 0, 0])   timing_pulley_gt2_14();
  translate([40, 0, 0])  timing_pulley_gt2_20();
  translate([80, 0, 0])  timing_pulley_gt2_30();
  translate([120, 0, 0]) timing_pulley_gt3_20();
  translate([160, 0, 0]) timing_pulley_gt3_20_hightorque();
  translate([200, 0, 0]) timing_pulley_gt3_40_hightorque();
}
