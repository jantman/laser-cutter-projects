$fn = 360;

width = 150;
width_minor = 122;
height = 150;
height_minor = 110;
hole_diameter = 6;
hole_center_spacing = 139.5;

difference() {
    square([width, height]);
    // cutouts for box lid standoffs

    // bottom screw hole for threaded standoff

    // top screw hole for threaded standoff

}
