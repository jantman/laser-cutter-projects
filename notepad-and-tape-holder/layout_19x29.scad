include <config.scad>;
use <back.scad>;
use <short_side.scad>;
use <long_side.scad>;
use <front.scad>;
use <bottom.scad>;
use <spacer.scad>;

$fn = 360;

spacing = 0.125;

back_width = (pocket_width * 3) + (thickness * 4);
back_height = pocket_height + top_height + bottom_height + thickness;
long_height = pocket_height + bottom_height + thickness;
front_height = pocket_height + thickness;

projection() {
    rotate([-90, 0, 0]) {
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
        translate([spacing + back_width + spacing + pocket_depth + spacing + pocket_depth + spacing + pocket_depth, 0, spacing]) {
            rotate([0, -90, 0]) {
                rotate([90, 0, 0]) {
                    bottom();
                }
            }
        }
        translate([spacing + back_width + spacing + pocket_depth + spacing + pocket_depth + spacing + pocket_depth, 0, spacing + pocket_height + spacing]) {
            rotate([0, -90, 0]) {
                rotate([90, 0, 0]) {
                    bottom();
                }
            }
        }
        translate([spacing + back_width + spacing + pocket_depth + spacing + 1, 0, spacing + pocket_height + spacing + pocket_height + spacing + spacing]) {
            rotate([0, -90, 0]) {
                rotate([90, 0, 0]) {
                    spacer();
                }
            }
        }
        translate([spacing + back_width + spacing + pocket_depth + spacing + 2 + spacing, 0, spacing + pocket_height + spacing + pocket_height + spacing + spacing]) {
            rotate([0, -90, 0]) {
                rotate([90, 0, 0]) {
                    spacer();
                }
            }
        }
    }
}
