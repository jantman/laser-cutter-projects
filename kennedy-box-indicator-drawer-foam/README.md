# github.com/jantman/laser-cutter-projects/kennedy-box-indicator-drawer-foam

Laser cutter project to cut 1/4" (6mm) EVA foam to make an indicator holder for the narrow, tall drawer of a Kennedy machinist box.

This was cut on a Glowforge Pro set to 300 speed, 100 power, 2 passes.

* Box: Model [520](https://buykennedy.com/product/20-7-drawer-machinists-chest/); other Kennedy boxes should be largely the same.
* Drawer: The tall half-width drawer on the left side. Interior dimensions are 218 mm widr x 186 mm deep x 50 mm high.
* Indicators:
  * Accusize Industrial Tools [P900-S102](https://smile.amazon.com/gp/product/B00SG6CIVO/) 0-1" x 0.001" dial indicator (same size as many similar ones)
  * Mitutoyo [513-402-10E](https://smile.amazon.com/gp/product/B079H8T1LV/) dial test indicator, with dovetail stem
  * 6-piece indicator extension stem rods, 1-6"
  * [TÜRLEN](https://smile.amazon.com/gp/product/B0043F776I/) 22-piece indicator tip set, in plastic box

## Directory contents

* [main.scad](main.scad) - Full model
* [slice.scad](slice.scad) - File used by [build.sh](build.sh) to generate the foam slice SVG outlines for laser cutting
* [build.sh](build.sh) - Command-line OpenSCAD script to generate the per-slice SVG files
* layerX.svg - Per-slice layer files for cutting layers from 6mm foam
* [main.stl](main.stl) - STL file of full model
* [config.scad](config.scad) - Various settings; included in other scad files
* [modules.scad](modules.scad) - Modules representing individual components
* [glue_guide.scad](glue_guide.scad) - 3D printed guide for gluing down the "fingers" of the indicator stem extension cutouts

## Notes for Next Time

* The drawer is actually one layer shallower than I'd designed for; omit the final bottom layer (layer 0).
* The DTI dovetail stem needs to be one layer higher; as is, it's very difficult to remove.
