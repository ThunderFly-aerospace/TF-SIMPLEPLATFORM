//@set_slicing_config(../../slicing/default.ini)
include <../../parameters.scad>

use <../888_3005.scad>
use <../888_3006.scad>

translate([-40,-30,50])
    rotate([-90,0,0])
        888_3005();


translate([-40,+30,50])
    rotate([-90,0,0])
        888_3006();