module front() {
    include <config.scad>;
    cube([(pocket_width * 2) + (thickness * 3), thickness, pocket_height + thickness]);
}
