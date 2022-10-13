module long_side() {
    include <config.scad>;
    difference() {
        cube([pocket_depth, thickness, pocket_height + bottom_height + thickness]);
        translate([2 * (pocket_depth / 3), thickness * 2, bottom_height / 3]) {
            rotate([90, 0, 0]) {
                cylinder(d=tape_holder_diameter, h=2);
            }
        }
    }
}
