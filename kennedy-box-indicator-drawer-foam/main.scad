$fn = 180;

scale_factor = 1.05;

difference() {
    cube([218, 186, 48]);
    translate([70, 60, 48 - ((18.3 + 8.75) * scale_factor) + 0.01]) {
        scale([scale_factor, scale_factor, scale_factor]) {
            dial_test_indicator();
        }
    }
    translate([35, 50, 48 - (25.5 * scale_factor) + 0.01]) {
        scale([scale_factor, scale_factor, scale_factor]) {
            dti_stem();
        }
    }
    translate([160, 110, 48 - (24 * scale_factor) + 0.01]) {
        scale([scale_factor, scale_factor, scale_factor]) {
            dial_indicator();
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
        translate([-1 * (9.5 / 2), -1 * (35 + 29), 3]) {
            cube([9.5, 36, 24 - 3]);
        }
        // second stem segment
        translate([-1 * (4.5 / 2), -1 * (35 + 29 + 20), 5.5]) {
            cube([4.5, 21, 24 - 5.5]);
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
}

module dti_stem() {
    cylinder(d=12, h=25.5);
}
