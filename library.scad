$fn = 32;

include <linear_rails/vslot.scad>;
translate([0, 0, 0]) vslot_test();

include <linear_rails/rail.scad>;
translate([0, -80, 0]) rail_test();

include <wheels/vwheel.scad>;
translate([0, 80, 0]) vwheel_test();

include <wheels/pulley.scad>;
translate([0, 40, 0]) pulley_test();

include <brackets/lbracket.scad>;
translate([0, 120, 0]) lbracket_test();

include <brackets/angle_corner.scad>;
translate([60, 120, 0]) angle_corner_test();

include <brackets/cube_corner.scad>;
translate([100, 120, 0]) cube_corner_test();

include <brackets/end_cap.scad>;
translate([140, 120, 0]) end_cap_test();

include <shims_and_spacers/spacer.scad>;
translate([-340, 0, 0]) spacer_test();

include <shims_and_spacers/shim.scad>;
translate([-150, 40, 0]) shim_test();

include <screws/screw.scad>;
translate([-200, -60, 0]) screw_test();

include <plates/vslot_gantry_plate.scad>;
translate([-250, 120, 0]) vslot_gantry_plate_test();

include <plates/joining_plate.scad>;
translate([-210, -200, 0]) joining_plate_test();

include <plates/micro_limit_switch_plate.scad>;
translate([-100, 200, 0]) micro_limit_switch_plate_test();

include <plates/threaded_rod_plate.scad>;
translate([-300, 200, 0]) threaded_rod_plate_test();

include <plates/motor_mount_plate.scad>;
translate([-210, -340, 0]) motor_mount_plate_test();

include <plates/mini_v_gantry_plate.scad>;
translate([0, -340, 0])  mini_v_gantry_plate_test();

include <plates/build_plate.scad>;
translate([300, -300, 0]) build_plate_test();

include <plates/gantry_plate.scad>;
translate([150, 200, 0]) gantry_plate_test();

include <hardware/hex_locknut.scad>;
translate([40, 40, 0]) hex_locknut_test();

include <hardware/eccentric_spacer.scad>;
translate([60, 40, 0]) eccentric_spacer_test();
