// based on: https://gist.github.com/LeSpocky/7880703

module rounded_square( width, length, radius_corner ) {
	translate( [ radius_corner, radius_corner, 0 ] ) {
		minkowski() {
			square( [width - 2 * radius_corner, length - 2 * radius_corner] );
			circle( radius_corner );
        }
	}
}

module top_rounded_square( width, length, radius_corner ) {
	hull() {
		square([radius_corner, radius_corner]);
		translate( [radius_corner, length - radius_corner, 0 ] ) circle( radius_corner );
		translate( [width - radius_corner, 0, 0] ) square([radius_corner, radius_corner]);
		translate( [width - radius_corner, length - radius_corner, 0] ) circle( radius_corner );
	}
}
