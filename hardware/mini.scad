include <MCAD/units.scad>;
include <cyl_head_bolt.scad>;

width = 22+11;
height = 38;
screw_spacing = 4;
inner_width = 19;
inner_height = 34;


module a() {
    difference() {
        union() {
            cube([width,height,9.55]);
            translate([((width-inner_width)/2)+0.25,0,9]) cube([inner_width-0.5,2,6]);
            translate([3,3,0]) cylinder(r=2, h=9, $fn=30);
            translate([width - 3,3,0]) cylinder(r=2, h=9, $fn=30);
            translate([3,height-3,0]) cylinder(r=2, h=9, $fn=30);
            translate([width - 3,height-3,0]) cylinder(r=2, h=9, $fn=30);
        }
        translate([width-0.5,2,1.5]) rotate([90,0,90]) linear_extrude(2)
            text("A", size = 6, font = "Helvetica:style=Bold");
        translate([0.5,8,1.5]) {
            rotate([90,0,270]) linear_extrude(2)
            text("A", size = 6, font = "Helvetica:style=Bold");
        }

        translate([(width-inner_width+2)/2,3,3]) cube([inner_width-2,inner_height-2,1]);
        translate([(width-inner_width)/2,2,4]) cube([inner_width,inner_height+4,8]);
        //Screw holes
        translate([screw_spacing,screw_spacing,0]) rotate([0,180,0]) {
           nutcatch_parallel("M2", l=4, clk=0.3, clh=1.5, clsl=0.3); 
           translate([0,0,4]) hole_through(name="M2", l=20, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([width - screw_spacing,screw_spacing,0]) rotate([0,180,0]) {
           nutcatch_parallel("M2", l=4, clk=0.3, clh=1.5, clsl=0.3);
           translate([0,0,4]) hole_through(name="M2", l=20, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([screw_spacing,height-screw_spacing,0]) rotate([0,180,0]) {
           nutcatch_parallel("M2", l=4, clk=0.3, clh=1.5, clsl=0.3);
           translate([0,0,4]) hole_through(name="M2", l=20, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([width - screw_spacing,height-screw_spacing,0]) rotate([0,180,0]) {
           nutcatch_parallel("M2", l=4, clk=0.3, clh=1.5, clsl=0.3);
           translate([0,0,4]) hole_through(name="M2", l=20, cld=0.65, h=2.5, hcl=0.4);
        }
        
        //Connector hole
        translate([((width-inner_width)/2)+(inner_width - 9)/2,0,5.3]) cube([9,3,4]);
    }
    rotate([90,0,0]) translate([((width-inner_width)/2)-0.5,6,-8.5]) right_triangle(1.5,3,0.2,5);
    rotate([90,0,0]) translate([((width-inner_width)/2)-0.5,6,-30.5]) right_triangle(1.5,3,0.2,5);

    rotate([90,0,180]) translate([-(width-((width-inner_width)/2)+0.5),6,3.5]) right_triangle(1.5,3,0.2,5);
    rotate([90,0,180]) translate([-(width-((width-inner_width)/2)+0.5),6,25.5]) right_triangle(1.5,3,0.2,5);
}

module b() {
    difference() {
        union() {
            cube([width,height,9.55]);
            translate([((width-inner_width)/2)+0.25,0,9]) cube([inner_width-0.5,2,6]);
            translate([3,3,0]) cylinder(r=2, h=9, $fn=30);
            translate([width - 3,3,0]) cylinder(r=2, h=9, $fn=30);
            translate([3,height-3,0]) cylinder(r=2, h=9, $fn=30);
            translate([width - 3,height-3,0]) cylinder(r=2, h=9, $fn=30);
        }
        translate([width-0.5,8,7.5]) rotate([90,180,90]) linear_extrude(2)
        text("B", size = 6, font = "Helvetica:style=Bold");
        translate([0.5,2,7.5]) {
            rotate([90,180,270]) linear_extrude(2)
            text("B", size = 6, font = "Helvetica:style=Bold");
        }
        translate([(width-inner_width+2)/2,3,3]) cube([inner_width-2,inner_height-2,1]);
        translate([(width-inner_width)/2,2,4]) cube([inner_width,inner_height+4,8]);
        //Screw holes
        translate([screw_spacing,screw_spacing,0]) rotate([0,180,0]) {
           hole_through(name="M2", l=10, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([width - screw_spacing,screw_spacing,0]) rotate([0,180,0]) {
           hole_through(name="M2", l=10, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([screw_spacing,height-screw_spacing,0]) rotate([0,180,0]) {
           hole_through(name="M2", l=10, cld=0.65, h=2.5, hcl=0.4);
        }
        translate([width - screw_spacing,height-screw_spacing,0]) rotate([0,180,0]) {
           hole_through(name="M2", l=10, cld=0.65, h=2.5, hcl=0.4);
        }

        //Connector hole
        translate([((width-inner_width)/2)+(inner_width - 9)/2,0,5.3]) cube([9,3,4]);
    }

    rotate([90,0,0]) translate([((width-inner_width)/2)-0.5,6,-8.5]) right_triangle(1.5,3,0.2,5);
    rotate([90,0,0]) translate([((width-inner_width)/2)-0.5,6,-30.5]) right_triangle(1.5,3,0.2,5);

    rotate([90,0,180]) translate([-(width-((width-inner_width)/2)+0.5),6,3.5]) right_triangle(1.5,3,0.2,5);
    rotate([90,0,180]) translate([-(width-((width-inner_width)/2)+0.5),6,25.5]) right_triangle(1.5,3,0.2,5);
}

module right_triangle(side1,side2,corner_radius,triangle_height){
    translate([corner_radius,corner_radius,0]){
        hull(){  
            cylinder(r=corner_radius,h=triangle_height);
            translate([side1-corner_radius*2,0,0])cylinder(r=corner_radius,h=triangle_height);
            translate([0,side2-corner_radius*2,0])cylinder(r=corner_radius,h=triangle_height);
        }
    }
}

a();
translate([45,0,0]) b();
