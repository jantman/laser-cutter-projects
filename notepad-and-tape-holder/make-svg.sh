#!/bin/bash

for i in back bottom front long_side short_side spacer cylinder_end_stop; do
    echo "use <${i}.scad>;" > tmp.scad
    echo '$fn = 360;' >> tmp.scad
    echo 'projection() {' >> tmp.scad
    echo '    rotate([-90, 0, 0]) {' >> tmp.scad
    echo "        ${i}();" >> tmp.scad
    echo '    }' >> tmp.scad
    echo '}' >> tmp.scad
    openscad --autocenter --viewall -o ${i}.svg tmp.scad
    sed -ri 's/width="([[:digit:]]+)mm"/width="\1in"/' ${i}.svg
    sed -ri 's/height="([[:digit:]]+)mm"/height="\1in"/' ${i}.svg
done

rm -f tmp.scad
