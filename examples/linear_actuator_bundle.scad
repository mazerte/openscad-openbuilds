include <MCAD/units.scad>
include <../utils/colors.scad>

include <MCAD/stepper.scad>;
use <../plates/threaded_rod_plate.scad>;
use <../plates/vslot_gantry_plate.scad>;
use <../plates/spacer_block.scad>;
use <../screws/acme_lead_screw.scad>;
use <../screws/screw.scad>;
use <../shims_and_spacers/spacer.scad>;
use <../shims_and_spacers/shim.scad>;
use <../linear_rails/vslot.scad>;
use <../bearings/bearing.scad>;
use <../hardware/flexible_coupling.scad>;
use <../hardware/acme_lead_screw_nut.scad>;
use <../hardware/lock_collar.scad>;
use <../hardware/hex_locknut.scad>;
use <../hardware/eccentric_spacer.scad>;
use <../wheels/vwheel.scad>;

$fn=16;

module linear_actuator_bundle(model=23, length=250, position=0.5, material=color_black) {
  p = (length-100) * position + 50;
  thickness=3.17;
  translate([-40-thickness+1, 0, 22.5]) rotate([0, -90, 0]) rotate([0, 0, 45]) motor(model == 23 ? Nema23 : Nema17, NemaMedium);
  translate([0, 0, 22.5]) rotate([0, 90, 0]) union() {
    translate([0, 0, -35]) flexible_coupling_5x8();
    bearing(model=688);
    translate([0, 0, 5]) lock_collar(8);
  }
  translate([-20+3, 0, 22.5]) rotate([0, 90, 0]) acme_lead_screw(length+20);
  translate([length, 0, 22.5]) rotate([0, -90, 0]) union() {
    bearing(model=688);
    translate([0, 0, 5]) lock_collar();
  }
  for (a=[0,90,180]) {
    translate([0, 0, 22.5]) rotate([-a]) union() {
      translate([-thickness, model == 23 ? -33 : -22, 0]) rotate([-90, 0, 90]) spacer(40);
      translate([1.5, model == 23 ? -33 : -22, 0])rotate([0, -90, 0]) m5_screw(55);
    }
  }

  for (y=model == 23 ? [30,10,-10,-30] : [20, 0, -20], x=[-thickness-1, length+thickness+1])
    translate([x, y, 0]) rotate([0, x<0 ? 90 : -90, 0]) m5_screw(15);

  if (model == 23) {
    translate([-thickness, -40, -10]) rotate([90, 0, 90]) threaded_rod_plate_nema23();
    translate([0, 0, 1]) rotate([90, 0, 90]) vslot20x80(length, material);
    translate([length+thickness, 40, -10]) rotate([90, 0, -90]) threaded_rod_plate_nema23();
  } else {
    translate([-thickness, -26, -10]) rotate([90, 0, 90]) threaded_rod_plate_nema17();
    translate([0, 0, 1]) rotate([90, 0, 90]) vslot20x60(length, material);
    translate([length+thickness, 26, -10]) rotate([90, 0, -90]) threaded_rod_plate_nema17();
  }

  translate([p, 0, 29]) union() {
    rotate([0, 0, 90]) universel_v_plate();

    translate([0, 10, 3]) rotate([180, 0, 0]) m5_screw(15);
    translate([0, -10, 3]) rotate([180, 0, 0]) m5_screw(15);
    translate([-6.5, 0, -1]) rotate([180, 0, 90]) acme_lead_screw_nut_block_anti_backlash();

    translate([0, model == 23 ? -50 : -40, -13.5]) rotate([0, 0, 90]) spacer_block();
    translate([0, model == 23 ? 50 : 40, -13.5])   rotate([0, 0, 90]) spacer_block();
    for (x=[30,-30], y=model == 23 ? [50, -50] : [40, -40]) {
      translate([x, y, -13.5-1/4*inch]) union() {
        if (y > 0) {
          spacer(1/4*inch);
        } else {
          translate([0, 0, 1/4*inch]) rotate([180, 0, 0]) eccentric_spacer();
        }
        translate([0, 0, -5.5]) xtreme_solid_vwheel();
        translate([0, 0, -11]) rotate([180, 0, 0]) hex_locknut();
        translate([0, 0, 23]) rotate([180, 0, 0]) m5_screw(40);
      }
    }
  }
}

translate([0, 0, 0]) linear_actuator_bundle(23, 250, 0.5);
translate([0, -150, 0]) linear_actuator_bundle(17, 250, 0.5, color_aluminum);
