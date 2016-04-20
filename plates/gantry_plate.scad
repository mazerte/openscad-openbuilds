include <MCAD/units.scad>;
include <MCAD/shapes.scad>;
include <../utils/colors.scad>;

r1=M5/2;
r2=3.6;
thickness=3.2;
margin=17;

module copy_mirror(vec=[0,0,0])
{
    children();
    mirror(vec) children();
}

module gantry_plate(w, h, material=color_black) {
  color(color_black) translate([w/2, h/2]) difference() {
    translate([0, 0, thickness/2]) roundedBox(w, h, thickness, 10);
    for(x=[1:-1:-1],y=[1:-1:-1])
      translate([x*(w/2-margin), y*(h/2-margin), -0.5]) cylinder(r=(x==-1 ? r2 : r1), thickness+1);
    for(a=[0:90:270])
      rotate([0, 0, a]) translate([10, 0, -0.5]) cylinder(r=r1, thickness+1);
    children();
    mirror([0,1,0]) children();
  }
}

module gantry_plate20() { gantry_plate(80, 80); }
module gantry_plate40() {
  gantry_plate(100, 120) {
    for(x=[2:-1:-2]) translate([x*20, 10, -0.5]) cylinder(r=r1, thickness+1);
    for(x=[10,-10], y=[23,33,43]) translate([x, y, -0.5]) cylinder(r=r1, thickness+1);
    translate([20, 43, -0.5]) cylinder(r=r1, thickness+1);
    translate([-20, 43, -0.5]) cylinder(r=r2, thickness+1);
  }
}
module gantry_plate60() {
  gantry_plate(120, 140) {
    for(x=[3:-1:-3]) translate([x*10, 0, -0.5]) cylinder(r=r1, thickness+1);
    for(a=[[20,30],[30, 20],[45,10]],b=[1:-1:-1]) translate([b*a[0], a[1], -0.5]) cylinder(r=r1, thickness+1);
    for(x=[10,23,33]) {
      translate([x, 70-margin, -0.5]) cylinder(r=r1, thickness+1);
      translate([-x, 70-margin, -0.5]) cylinder(r=(x==10 ? r1 : r2), thickness+1);
    }
    translate([-60+margin, (70-margin)/2, -0.5]) cylinder(r=r2, thickness+1);
    translate([60-margin, (70-margin)/2, -0.5]) cylinder(r=r1, thickness+1);
  };
}
module gantry_plate80() {
  gantry_plate(140, 160) {
    holes=[[0,25], [10,35], [35,35], [45,25], [35,0], [45,10], [60,10]];
    copy_mirror([1,0,0]) for(a=holes) translate([a[0], a[1], -0.5]) cylinder(r=r1, thickness+1);
    for(x=[10,23,33,43]) {
      translate([x, 80-margin, -0.5]) cylinder(r=r1, thickness+1);
      translate([-x, 80-margin, -0.5]) cylinder(r=(x==10 ? r1 : r2), thickness+1);
    }
    translate([-70+margin, (80-margin)/2, -0.5]) cylinder(r=r2, thickness+1);
    translate([70-margin, (80-margin)/2, -0.5]) cylinder(r=r1, thickness+1);
  }
}


module gantry_plate_test() {
  translate([0 ,0])   gantry_plate20();
  translate([120 ,0]) gantry_plate40();
  translate([260 ,0]) gantry_plate60();
  translate([440 ,0]) gantry_plate80();
}
