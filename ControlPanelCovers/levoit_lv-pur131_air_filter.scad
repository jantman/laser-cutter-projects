// dimensions in inches

use <rounded_square.scad>;

overall_length = 10;
overall_width = 2.5;
cutout_length = 9;
cutout_width = 1.5;

corner_radius = 0.25;

$fn = 360;

translate([0, 0.1, 0]) {
    top_rounded_square(overall_length, overall_width, corner_radius);
}

translate([0, -1 * (overall_width + 0.1), 0]) {
    difference() {
        top_rounded_square(overall_length, overall_width, corner_radius);
        translate([(overall_length - cutout_length) /2, (overall_width - cutout_width) / 2, 0]) {
            square([cutout_length, cutout_width]);
        }
    }
}
