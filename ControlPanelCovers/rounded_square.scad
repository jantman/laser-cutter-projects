// based on: https://gist.github.com/LeSpocky/7880703

module rounded_square( width, length, radius_corner ) {
	translate( [ radius_corner, radius_corner, 0 ] ) {
		minkowski() {
			square( [width - 2 * radius_corner, length - 2 * radius_corner] );
			circle( radius_corner );
        }
	}
}
