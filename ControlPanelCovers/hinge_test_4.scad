// dimensions in inches

use <rounded_square.scad>;

material_thickness = 0.120;
hinge_cutout_width = material_thickness + 0.001;
hinge_depth = material_thickness;
hinge_inset = 0.25;

corner_radius = 0.1;

overall_length = 2;
overall_width = 1;

$fn = 360;

difference() {
    top_rounded_square(overall_length, overall_width, corner_radius);
    translate([hinge_inset, 0, 0]) {
        square([hinge_cutout_width, hinge_depth]);
    }
    translate([overall_length - hinge_inset - hinge_cutout_width, 0, 0]) {
        square([hinge_cutout_width, hinge_depth]);
    }
}

translate([2.1, 0, 0]) {
    difference() {
        top_rounded_square(overall_length, overall_width, corner_radius);
        translate([hinge_inset, 0, 0]) {
            square([hinge_cutout_width, hinge_depth]);
        }
        translate([overall_length - hinge_inset - hinge_cutout_width, 0, 0]) {
            square([hinge_cutout_width, hinge_depth]);
        }
    }
}

translate([-0.1, material_thickness, 0]) {
    union() {
        circle(d=material_thickness);
        translate([0, material_thickness, 0]) {
            circle(d=material_thickness);
        }
        translate([-1 * (material_thickness / 2), 0, 0]) {
            square([material_thickness, material_thickness]);
        }
    }
    translate([0, 0.1 + (material_thickness * 2), 0]) {
        union() {
            circle(d=material_thickness);
            translate([0, material_thickness, 0]) {
                circle(d=material_thickness);
            }
            translate([-1 * (material_thickness / 2), 0, 0]) {
                square([material_thickness, material_thickness]);
            }
        }
    }
}
