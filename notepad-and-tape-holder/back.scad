module back() {
    include <config.scad>;
    cube([(pocket_width * 3) + (thickness * 4), thickness, pocket_height + top_height + bottom_height + thickness]);
}
