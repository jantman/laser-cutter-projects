make_svg = false;

// plier handles
screw_hole_dia = inch(0.164);
hole_spacing = inch(0.4496);
hole_from_tip = inch(0.2949);
length_behind_hole = inch(0.2);
width = inch(0.400);
body_thickness = inch(0.118);

// siding clip jaws
notch_width = inch(0.100); // originally 0.078
notch_center_from_tip = inch(0.300);
jaw_stickout_from_tip = inch(0.650);

$fn = 360;

length_over_handle = hole_from_tip + hole_spacing + length_behind_hole;

if(make_svg) {
    projection(cut=true) {
        translate([0, 0, -0.05]) {
            jaw();
        }
    }
} else {
    jaw();
}

module jaw() {
    difference() {
        translate([-1 * width / 2, -1 * length_over_handle, 0]) {
            alternative_square(width, length_over_handle + jaw_stickout_from_tip, body_thickness, inch(0.1));
        }
        // screw hole closest to tip
        translate([0, -1 * hole_from_tip, inch(-5)]) {
            cylinder(d=screw_hole_dia, h=inch(10));
        }
        // screw hole closest to handles
        translate([0, -1 * (hole_from_tip + hole_spacing), inch(-5)]) {
            cylinder(d=screw_hole_dia, h=inch(10));
        }
        // cutout for siding clip
        translate([width / 20, (-1 * notch_width / 2) + (jaw_stickout_from_tip - notch_center_from_tip), 0]) {
            rotate([0, 0, -10]) {
                cube([width, notch_width, width]);
            }
        }
    }
}

function inch(x) = x * 25.4;

module alternative_square( width, length, height, r_c ) {
    // from: https://gist.github.com/LeSpocky/7880703
    linear_extrude(height=height) {
        hull() {
            translate( [r_c, r_c, 0] ) circle( r_c );
            translate( [r_c, length - r_c, 0 ] ) circle( r_c );
            translate( [width - r_c, r_c, 0] ) circle( r_c );
            translate( [width - r_c, length - r_c, 0] ) circle( r_c );
        }
    }
}
