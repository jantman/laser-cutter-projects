$fn = 180;
use <modules.scad>
include <config.scad>

projection(cut = true) {
    translate([0, 0, -1 * (layer_top - 0.001)]) {
        cutout();
    }
}
