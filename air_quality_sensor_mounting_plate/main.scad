// https://github.com/jantman/glowforge-projects/blob/main/air_quality_sensor_mounting_plate/main.scad

// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

$fn = 72;
show_boards = 0;

module esp32_holes() {
  translate([1.0 + 1.55, 1.55 + 1, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([28.5 - (0.8 + 1.55), 1.55 + 1, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([1.0 + 1.55, 51.5 - (1.55 + 1), -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([28.5 - (0.8 + 1.55), 51.5 - (1.55 + 1), -0.5]) {
    cylinder(h=2, d=3.1);
  }
}

module esp32(show_boards) {
  if(show_boards) {
    difference() {
      #cube([28.5, 51.5, 1]);
      esp32_holes();
    }
  } else {
    //#cube([28.5, 51.5, 1]);
    esp32_holes();
  }
}

module sgp30holes() {
  translate([1.4 + 1.55, 1.55 + 1.5, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([(1.4 + 1.55) + 10.25 + 2.5, 1.55 + 1.5, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([1.4 + 1.55, (1.55 + 1.5) + 17.75 + 2.5, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([(1.4 + 1.55) + 10.25 + 2.5, (1.55 + 1.5) + 17.75 + 2.5, -0.5]) {
    cylinder(h=2, d=3.1);
  }
}

module sgp30(show_boards) {
  if(show_boards) {
    difference() {
      #cube([17.8, 25.5, 1]);
      sgp30holes();
    }
  } else {
    //#cube([17.8, 25.5, 1]);
    sgp30holes();
  }
}

module pmsa003iholes() {
  translate([1.5 + 1.55, 3.05, -0.5]) {
    cylinder(h=2, d=3.1);
  }
  translate([1.5 + 1.55, 3.05 + 28 + (4.75 / 2), -0.5]) {
    cylinder(h=2, d=3.1);
  }
}

module pmsa003i(show_boards) {
  if(show_boards) {
    difference() {
      #cube([51.25, 35.6, 1]);
      pmsa003iholes();
    }
  } else {
    //#cube([51.25, 35.6, 1]);
    pmsa003iholes();
  }
}

projection(cut = true) {
  translate([0, 0, -0.5]) {
    difference() {
      dims = [20 + 28.5 + 20 + 17.8 + 20 + 51.25 + 20, 20 + 51.5 + 20, 2];
      //cube(dims);
      roundedcube(dims, false, 2, "all");
      translate([20, 20, 0]) {
        esp32(show_boards);
        translate([28.5 + 20, (51.5 - 25.5) / 2, 0]) {
          sgp30(show_boards);
        }
        translate([28.5 + 20 + 17.8 + 20, (51.5 - 35.6) / 2, 0]) {
          pmsa003i(show_boards);
        }
      }
    }
  }
}
