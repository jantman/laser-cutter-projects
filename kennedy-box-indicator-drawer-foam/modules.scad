module cutout() {
    include <config.scad>
    difference() {
        cube([218, 186, box_height]);
        translate([120, 80, 48 - ((18.3 + 8.75) * scale_factor) + 0.01]) {
            rotate([0, 0, 180]) {
                scale([scale_factor, scale_factor, scale_factor]) {
                    dial_test_indicator();
                }
            }
        }
        translate([110, 120, 48 - (25.5 * scale_factor) + 0.01]) {
            scale([scale_factor, scale_factor, scale_factor]) {
                dti_stem();
            }
        }
        translate([165, 115, 48 - (24 * scale_factor) + 0.01]) {
            scale([scale_factor, scale_factor, scale_factor]) {
                dial_indicator();
            }
        }
        // indicator stem extensions
        translate([20, 175, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=160);
            }
        }
        translate([20, 165, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=135);
            }
        }
        translate([20, 155, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=110);
            }
        }
        translate([20, 145, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=85);
            }
        }
        translate([20, 135, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=60);
            }
        }
        translate([20, 125, box_height]) {
            rotate([0, 90, 0]) {
                cylinder(d=5, h=35);
            }
        }
        // end cut-out for stem extension removal
        translate([15, 120, box_height - 0.1]) {
            cube([10, 60, 5]);
        }
        // dial indicator tips
        translate([15, 15, box_height - 16.99]) {
            cube([66, 95, 17]);
            translate([0, 95 / 2, -2.9]) {
                cylinder(d=20, h=20);
            }
            translate([66, 95 / 2, -2.9]) {
                cylinder(d=20, h=20);
            }
        }
    }
}

module dial_indicator() {
    union() {
        // main body
        translate([0, 0, 0]) {
            cylinder(d=60, h=24);
        }
        // first stem segment
        translate([-1 * (9.5 / 2), -1 * (20 + 29), 3]) {
            cube([9.5, 21, 24 - 3]);
        }
        // second stem segment
        translate([-1 * (4.5 / 2), -1 * (35 + 29 + 20), 5.5]) {
            cube([4.5, 36, 24 - 5.5]);
        }
        // back lug
        translate([-4.4, -8.25, -19]) {
            cube([8.8, 16.5, 19]);
        }
        // account for adjustment dial and top of stem
        intersection() {
            translate([0, 0, 3]) {
                cylinder(d=80, h=21);
            }
            translate([-12, 0, 0]) {
                cube([80, 80, 30]);
            }
        }
    }
}

module dial_test_indicator() {
    // body
    translate([-4.4, 0, 0]) {
        cube([8.8, 59, 18.3 + 8.75]);
    }
    // dial / bezel
    translate([0, 59 - 20 + 3.8, 18.3]) {
        cylinder(d=40, h=8.75);
    }
    // cutout for tip
    translate([-2.75 / 2, -17, 0]) {
        cube([2.75, 17, 18.3 + 8.75]);
    }
    // finger recesses for removal
    translate([-20, 59 - 20 + 3.8, 18.3]) {
        cylinder(d=20, h=10);
    }
    translate([20, 59 - 20 + 3.8, 18.3]) {
        cylinder(d=20, h=10);
    }
}

module dti_stem() {
    cylinder(d=12, h=25.5);
    // finger recesses for removal
    translate([6, 0, 25.5]) {
        sphere(d=6);
    }
    translate([-6, 0, 25.5]) {
        sphere(d=6);
    }
}
