include <MCAD/units.scad>;
include <MCAD/shapes.scad>;
include <../utils/colors.scad>;

module build_plate(material=color_black) {
  w=216;
  h=216;
  r=4;
  thickness=3;

  r0=1.8;
  r1=M5/2;
  r2=3;

  color(material) translate([w/2, h/2]) difference() {
    translate([0, 0, thickness/2]) roundedBox(w, h, thickness, r);
    union() {
      translate([w/2-25, h/2-4, -0.5]) cylinder(r=r0, h=thickness+1);
      translate([w/2-25, h/2-4-30, -0.5]) cylinder(r=r0, h=thickness+1);
    }
    for(x=[10,20], y=[50,-50]) translate([x, y, -0.5]) cylinder(r=r0, h=thickness+1);
    for(x=[5,15], y=[15,25]) translate([x, y, -0.5]) cylinder(r=r0, h=thickness+1);
    for (x =[1:-1:-1], y =[1:-1:-1]) translate([w/2*x-3.56*x, h/2*y-3.56*y, -0.5]) cylinder(r=r0, h=thickness+1);
    for (a=[0,180]) {
      rotate([0,0,a]) union() {
        hull() {
          translate([19.85-10,69,-0.5]) cylinder(r=r1, h=thickness+1);
          translate([-19.85+10,69,-0.5]) cylinder(r=r1, h=thickness+1);
        }
        for(x=[21:-21:-21]) {
          translate([x,h/2-10]) hull() {
            translate([5,0,-0.5]) cylinder(r=r0, h=thickness+1);
            translate([-5,0,-0.5]) cylinder(r=r0, h=thickness+1);
          }
        }
        for(x=[0:10:30]) translate([19.85+x,69,-0.5]) cylinder(r=r2, h=thickness+1);
        for(x=[0:10:30]) translate([-19.85-x,69,-0.5]) cylinder(r=r1, h=thickness+1);
        for(x=[0:10:30]) translate([22.5+x,80,-0.5]) cylinder(r=r1, h=thickness+1);
        for(x=[0:10:30]) translate([-22.5-x,80,-0.5]) cylinder(r=r2, h=thickness+1);
        translate([10, 0]) union() {
          for(x=[2:-1:-2]) {
            translate([abs(x)*10,x*10,-0.5]) cylinder(r=r1, h=thickness+1);
          }
        }
        translate([32,59,-0.5]) cylinder(r=r2, h=thickness+1);
        translate([-32,59,-0.5]) cylinder(r=r1, h=thickness+1);
      }
    }
  }
}

module build_plate_test() {
  build_plate();
}
