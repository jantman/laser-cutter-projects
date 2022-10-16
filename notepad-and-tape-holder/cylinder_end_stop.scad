module cylinder_end_stop() {
    include <config.scad>;
    cylinder(d=tape_holder_diameter * 2, h=thickness);
}
