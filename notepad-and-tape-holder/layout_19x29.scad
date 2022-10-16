include <config.scad>;
use <back.scad>;
use <short_side.scad>;
use <long_side.scad>;
use <front.scad>;
use <bottom.scad>;
use <spacer.scad>;
use <cylinder_end_stop.scad>;

$fn = 360;

spacing = 0.125;

back_width = (pocket_width * 3) + (thickness * 4);
back_height = pocket_height + top_height + bottom_height + thickness;
long_height = pocket_height + bottom_height + thickness;
front_height = pocket_height + thickness;

projection() {
    rotate([-90, 0, 0]) {
        // for visualizing layout on 23x35 stock sheet
        //#cube([35, 1, 23]);
        translate([spacing, 0, spacing]) {
            back();
        }
        translate([spacing, 0, spacing + back_height + spacing]) {
            front();
        }
        translate([spacing + back_width + spacing, 0, spacing]) {
            long_side();
        }
        translate([spacing + back_width + spacing, 0, spacing + long_height + spacing]) {
            long_side();
        }
        translate([spacing + back_width + spacing + pocket_depth + spacing, 0, spacing]) {
            short_side();
        }
        translate([spacing + back_width + spacing + pocket_depth + spacing, 0, spacing + pocket_height + spacing]) {
            short_side();
        }
        translate([((spacing + pocket_width) * 2) + spacing, 0, spacing + back_height + spacing + front_height + spacing]) {
            rotate([90, 0, 0]) {
                bottom();
            }
        }
        translate([spacing + pocket_width + spacing, 0, spacing + back_height + spacing + front_height + spacing]) {
            rotate([90, 0, 0]) {
                bottom();
            }
        }
        translate([spacing + pocket_width + spacing, 0,  spacing + back_height + spacing + front_height + spacing + pocket_depth + spacing]) {
            rotate([90, 0, 0]) {
                spacer();
            }
        }
        translate([spacing, 0,  spacing + back_height + spacing + front_height + spacing + pocket_depth + spacing]) {
            rotate([90, 0, 0]) {
                spacer();
            }
        }
        translate([spacing, 0, spacing + back_height + spacing + front_height + spacing]) {
            rotate([90, 0, 0]) {
                bottom();
            }
        }
        translate([((spacing + pocket_width) * 3) + spacing + (tape_holder_diameter), 0, ((spacing + long_height) * 2) + spacing + tape_holder_diameter]) {
            rotate([-90, 0, 0]) {
                cylinder_end_stop();
            }
        }
    }
}
