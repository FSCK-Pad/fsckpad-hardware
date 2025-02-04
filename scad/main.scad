//! {cookiecutter.project_short_description}
$pp1_colour = "grey";           // Override any global defaults here if required, see NopSCADlib/global_defs.scad.
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.
include <fsckpad_enclosure.scad>
include <fsckpad_board.scad>


//! Assembly instructions in Markdown format in front of each module that makes an assembly.
module main_assembly()
assembly("main") {
    fsckpad_board_assembly();
    fsckpad_enclosure_assembly();
}

if($preview)
    main_assembly();