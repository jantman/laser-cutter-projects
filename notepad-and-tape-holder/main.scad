include <config.scad>;
use <back.scad>;
use <short_side.scad>;
use <long_side.scad>;
use <front.scad>;
use <bottom.scad>;
use <cylinder_end_stop.scad>;

$fn = 360;

back();
translate([0, 0, bottom_height]) {
    rotate([0, 0, -90]) {
        short_side();
    }
}
translate([pocket_width + thickness, 0, 0]) {
    rotate([0, 0, -90]) {
        long_side();
    }
}
translate([(pocket_width * 2) + (thickness * 2), 0, 0]) {
    rotate([0, 0, -90]) {
        long_side();
    }
}
translate([(pocket_width * 3) + (thickness * 3), 0, bottom_height]) {
    rotate([0, 0, -90]) {
        short_side();
    }
}
translate([0, -1 * (pocket_depth + thickness), bottom_height]) {
    front();
}
translate([thickness, -1 * pocket_depth, bottom_height]) {
    bottom();
}
translate([(thickness * 2) + pocket_width, -1 * pocket_depth, bottom_height]) {
    bottom();
}
translate([(thickness * 3) + (pocket_width * 2), -1 * pocket_depth, bottom_height]) {
    bottom();
}
translate([(pocket_width * 2) + (thickness * 3), -2 * (pocket_depth / 3), bottom_height / 3]) {
    rotate([0, 90, 0]) {
        cylinder_end_stop();
    }
}
