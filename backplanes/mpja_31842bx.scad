$fn = 360;

height = 150;
height_minor = 122;
width = 150;
width_minor = 110;
hole_diameter = 5.5;
hole_center_spacing = 139.5;

cutout_width = (width - width_minor) / 2;
cutout_height = (height - height_minor) / 2;

difference() {
    square([width, height]);
    // cutouts for box lid standoffs
    square([cutout_width, cutout_height]);
    translate([width - cutout_width, 0, 0]) {
        square([cutout_width, cutout_height]);
    }
    translate([0, height - cutout_height, 0]) {
        square([cutout_width, cutout_height]);
    }
    translate([width - cutout_width, height - cutout_height, 0]) {
        square([cutout_width, cutout_height]);
    }
    // bottom screw hole for threaded standoff
    translate([width / 2, (height - hole_center_spacing) / 2, 0]) {
        circle(d=hole_diameter);
    }
    // top screw hole for threaded standoff
    translate([width / 2, ((height - hole_center_spacing) / 2) + hole_center_spacing, 0]) {
        circle(d=hole_diameter);
    }
}
