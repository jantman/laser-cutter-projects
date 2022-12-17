#!/bin/bash

openscad -o main.stl main.scad

openscad -o layer8.svg -D'layer_top=48' slice.scad
openscad -o layer7.svg -D'layer_top=42' slice.scad
openscad -o layer6.svg -D'layer_top=36' slice.scad
openscad -o layer5.svg -D'layer_top=30' slice.scad
openscad -o layer4.svg -D'layer_top=24' slice.scad
openscad -o layer3.svg -D'layer_top=18' slice.scad
openscad -o layer2.svg -D'layer_top=12' slice.scad
openscad -o layer1.svg -D'layer_top=6' slice.scad
openscad -o layer0.svg -D'layer_top=1' slice.scad
