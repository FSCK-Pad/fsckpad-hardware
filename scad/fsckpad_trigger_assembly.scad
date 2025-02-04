include <fsckpad_board.scad>

module basic_volume(l=40){
    rotate([90,0,0]) linear_extrude(height=l, center=true, convexity=1)
        import(file = "../dxf/trigger_profile.dxf", layer="Layer 1");
}

!basic_volume();