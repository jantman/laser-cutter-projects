$fn = 180;

dial_test_indicator();
translate([20, 0, 0]) {
    dti_stem();
}

module dial_indicator() {

}

module dial_test_indicator() {
    // body
    translate([-4.4, 0, 0]) {
        cube([8.8, 59, 18.3]);
    }
    // dial / bezel
    translate([0, 59 - 20 + 3.8, 18.3]) {
        cylinder(d=40, h=8.75);
    }
    // cutout for tip
    translate([-2.75 / 2, -17, 0]) {
        cube([2.75, 17, 18.3]);
    }
}

module dti_stem() {
    cylinder(d=12, h=25.5);
}
