// plier handles
screw_hole_dia = inch(0.164);
hole_spacing = inch(0.4496);
hole_from_tip = inch(0.2949);
length_behind_hole = inch(0.2);
width = inch(0.600);
body_thickness = inch(0.118);

// siding clip jaws
notch_width = inch(0.100); // originally 0.078
notch_center_from_tip = inch(0.300);
jaw_stickout_from_tip = inch(0.650);

$fn = 360;

length_over_handle = hole_from_tip + hole_spacing + length_behind_hole;

translate([-1 * width / 2, -1 * length_over_handle, 0]) {
    roundedcube(size = [width, length_over_handle + jaw_stickout_from_tip, body_thickness], center = false, radius = 0.5);
}

function inch(x) = x * 25.4;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "zmax") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}
