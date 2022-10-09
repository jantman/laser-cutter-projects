module short_side() {
    include <config.scad>;
    cube([pocket_depth, thickness, pocket_height + thickness]);
}
