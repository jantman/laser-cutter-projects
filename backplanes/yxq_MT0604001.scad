$fn = 360;
function inch(x) = x * 25.4;

width = inch(5.45);
height = inch(7.4);
standoff_diameter = 18;
hole_diameter = 5.5;
hole_center_spacing = 160;

difference() {
    square([width, height]);
    // cutouts for box lid standoffs
    circle(r=standoff_diameter);
    translate([width, 0, 0]) {
        circle(r=standoff_diameter);
    }
    translate([0, height, 0]) {
        circle(r=standoff_diameter);
    }
    translate([width, height, 0]) {
        circle(r=standoff_diameter);
    }
    // bottom screw hole for threaded standoff
    translate([width / 2, (height - 160) / 2, 0]) {
        circle(d=hole_diameter);
    }
    // top screw hole for threaded standoff
    translate([width / 2, ((height - 160) / 2) + 160, 0]) {
        circle(d=hole_diameter);
    }
}
