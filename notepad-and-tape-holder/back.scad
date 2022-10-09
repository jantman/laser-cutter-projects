module back() {
    include <config.scad>;
    cube([(pocket_width * 2) + (thickness * 3), thickness, pocket_height + top_height + bottom_height + thickness]);
}
