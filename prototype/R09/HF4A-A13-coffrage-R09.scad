// R09 PROTOTYPE. Units mm. NOT physically fit/optically validated.
// Phone upper-left viewed THROUGH screen; table z=-sole, base underside z=0.
// Printables 924841 / D Har (CC BY-SA 4.0) inspected as dimensional reference.
// No imported mesh in this design. Parametric design based on R08 + factory CAD.
// Phone A13 SM-A137F/DSN WITHOUT CASE. Round PMW vendor thickness remains assumed.
part="assembly";
$fn=64;
phone_w=76.4;phone_l=165.1;phone_t=8.8;
sole=.8;base=1.6;back_height=12;
phone_back=back_height-sole;phone_front=phone_back+phone_t;pad=.3;
sensor_x=60;sensor_ys=[59,141];sensor_d=32;sensor_pcb_t=1.6;
sensor_top=7.4-sole;sensor_shelf=sensor_top-sensor_pcb_t;
t7_top=7.3;t7_bottom=t7_top-1;
t7_holes=[[37.49124,93.57352],[37.49124,67.50808]];
feet_xy=[[79.8,54],[79.8,146],[-1.5,110]];
clip_x=[-2.7,79.1];clip_y=153;
clip_z=base;lip_z=phone_front+.6;
lens_d=6.28;lens_h=2.44;lens_bore=6.65;
bridge_y=22;rail_z=3.4;
assert(sole+sensor_top==7.4);
assert(t7_top-5-base>=.6);
assert(phone_back-(t7_top+3.3)>=.59);

module rr(x,y,w,l,z,h,r=.7){
 translate([x,y,z])linear_extrude(h)hull()
 for(i=[r,w-r],j=[r,l-r])translate([i,j])circle(r=r);
}
module hole(x,y,z,h,d){translate([x,y,z])cylinder(h=h,d=d);}
module slot(x,y,w,l,z,h){rr(x,y,w,l,z,h,min(w,l)/2);}
module route(p,w,z,h){for(i=[0:len(p)-2])hull(){hole(p[i][0],p[i][1],z,h,w);hole(p[i+1][0],p[i+1][1],z,h,w);}}
module pmw_hole(y){
 // Replaceable rotary LM19 shoe. Shoulder fixes its sitting plane, not glue.
 hole(sensor_x,y,-.1,base+.2,25);
 hole(sensor_x,y,.8,base,28.3);
}
module optical_d(extra=0){
 // PixArt Fig9: R2 minimum and 4mm minimum to right of optical centre.
 offset(delta=extra)union(){circle(r=2.2);translate([0,-2.2])square([4.2,4.4]);}
}
module pmw_shoe(){difference(){union(){
 hole(0,0,0,base,24.8);hole(0,0,.8,base-.8,28);
 // Seat 21.35 x19, cornerR7.05, around lens21.15 x18.85.
 difference(){rr(-11.5,-10.35,23,20.7,base,.6,7.3);
 rr(-10.675,-9.5,21.35,19,base-.1,.9,7.05);}
 }
 translate([-.3,0,0])hull(){
 translate([0,0,-.1])linear_extrude(.1)optical_d(1.1);
 translate([0,0,base])linear_extrude(.1)optical_d();
 }
 // Gate relief on lens left edge. PCB orientation confirmed with coupon.
 rr(-12,-1.6,2,3.2,base-.05,.8,.2);
}}
module baseplate(){difference(){
 rr(-4.8,-3,86.5,171.5,0,base,3);
 // Broad camera area, both sides of phone, plus left-side lower extension.
 rr(4.5,3,67.4,37,-.1,base+.2,1.2);
 rr(4.5,36,33.5,14,-.1,base+.2,1.2);
 for(y=sensor_ys)pmw_hole(y);
}}
module phone_lands(){
 for(q=[[-.3,52,2,9],[-.3,104,2,7],[-.3,160,3,5],
 [74.3,38,2.4,3],[74.3,80,2.4,29],[74.3,160,2.4,5],
 [3,0,70,2],[2,163,31,2],[49,163,25,2]])
 rr(q[0],q[1],q[2],q[3],base,phone_back-pad-base,.5);
 // Separated guides: no continuous wall over side keys or LilyGO USB.
 for(q=[[-3.2,3,2.8,25],[-3.2,52,2.8,9],[-3.2,102,2.8,35],
 [76.8,3,2.7,25],[76.8,82,2.7,33]])
 rr(q[0],q[1],q[2],q[3],base,phone_front-2-base,.5);
 // End stops, central bottom opening preserves phone USB access.
 rr(3,-2.7,70,2.3,base,phone_front-2-base,.5);
 for(x=[3,50])rr(x,165.5,23,2.3,base,phone_front-2-base,.5);
}
module top_hooks(){
 // Fixed short upper lips: slide phone in, do not flex PLA.
 rr(-3.2,6,2.8,11,base,lip_z+1.4-base,.5);
 rr(-3.2,6,4.1,11,lip_z,1.4,.5);
 rr(76.8,6,2.7,11,base,lip_z+1.4-base,.5);
 rr(75.5,6,4,11,lip_z,1.4,.5);
}
module t7_mount(){
 for(p=t7_holes)hole(p[0],p[1],base,t7_bottom-base,4.2);
 for(p=[[28,99],[27,61]])rr(p[0]-3,p[1]-2,6,4,base,2.5,.7);
}
module pmw_mount(y){
 for(a=[45,135,225,315])translate([sensor_x,y,0])rotate([0,0,a])
 rr(14.8,-2,3,4,base,sensor_shelf-base,.6);
 for(dy=[-19,19])hole(sensor_x,y+dy,base,sensor_top-base,5.4);
}
module battery_mount(){
 difference(){
 rr(1,109,38,56,base,7.3,1);
 rr(2,110.5,36,53,base-.1,7.6,.6);
 rr(12,108.8,17,3,base-.2,7.8,.5);
 }
 difference(){
 rr(2,98,29,11.5,base,4.8,.8);
 rr(3.2,99.2,26.6,9.1,base-.1,5,.4);
 rr(8,97.5,9,3,base-.2,5.2,.3);
 rr(13,107.8,10,3,base-.2,5.2,.3);
 }
}
module optical_rails(){
 rr(0,3,4.4,34,base,rail_z-base,.5);
 rr(72,3,4.4,34,base,rail_z-base,.5);
 // The LED ribbon shown by user is 12V: NOT specified for this assembly.
 // Optional small low-voltage LED carrier may use these two tie loops.
 for(x=[9,28])rr(x,49.5,6,3,base,2,.4);
}
module wire_guides(){
 rr(39,100,1,61,base,3,.4);
 rr(45,100,1,22,base,3,.4);
 rr(45,160,1,2,base,3,.4);
 for(p=[[42,105],[42,159],[25,57]])rr(p[0]-4,p[1]-2,8,4,base,4.2,.7);
}
module main(){difference(){union(){
 baseplate();phone_lands();top_hooks();t7_mount();battery_mount();optical_rails();wire_guides();
 for(y=sensor_ys)pmw_mount(y);
 // One-time mounting bosses for removable TPU clips. Daily use is screwless.
 for(x=clip_x,y=[clip_y-5,clip_y+5])hole(x,y,base,4,4.6);
 }
 for(x=clip_x,y=[clip_y-5,clip_y+5])hole(x,y,.55,base+4.2,1.7);
 for(p=t7_holes)hole(p[0],p[1],base+.7,t7_bottom-base,1.7);
 for(y=sensor_ys,dy=[-19,19])hole(sensor_x,y+dy,base+.7,6,1.7);
 for(x=[2.2,74.2],y=[10:6:28])hole(x,y,.5,rail_z,1.7);
 // Large open service side, not a USB shell-sized cutout.
 rr(-5.5,62,8.5,36,2,13,.5);
 for(p=feet_xy)rr(p[0]-2.8,p[1]-1.5,5.6,3,-.1,1.15,.4);
 for(p=[[42,105],[42,159],[25,57]])rr(p[0]-2.6,p[1]-2.2,5.2,4.4,base-.01,3,.5);
 for(p=[[28,99],[27,61]])slot(p[0]-2,p[1]-2.2,4,4.4,base,1.4);
 for(x=[9,28])slot(x+1,49.2,4,3.6,base,1.2);
}}
module flex_clip(right=false){
 // Local0,0 = mounting-screw axis midway; base rests on z=base+4.
 // TPU95A prototype. Printed on its outer side; longitudinal layers.
 h=lip_z-(base+4);
 mirror([right?1:0,0,0])difference(){union(){
 rr(-2.1,-8,4.2,16,0,1.8,.5);
 rr(-1.1,-6,1.8,12,0,h+1.8,.5);
 // Rounded inward lip overlaps bezel ~0.8mm, not compressed onto glass.
 rr(-1.1,-5,4.7,10,h,1.8,.6);
 // Outward pull tab for release; no sharp PLA touches the phone here.
 rr(-5,-4,4.4,8,h-1,1.8,.6);
 }
 for(y=[-5,5])hole(0,y,-.1,2.1,2.25);
 }
}
module print_clip(right=false){
 // Rotate outer face down, preserving attachment root and overhang-free lip.
 translate([0,0,3.6])rotate([0,right?-90:90,0])flex_clip(right);
}
module pmw_clip(){difference(){
 hull(){hole(0,0,0,1.6,5.8);rr(-3,2,6,2.5,0,1.6,.5);}
 hole(0,0,-.1,1.8,2.25);
}}
module bridge(){difference(){
 // Outer screws choose Y; parallel X slots position the lens cassette.
 rr(0,-8,76.4,16,0,1.6,1.1);
 slot(7,-3.25,62,6.5,-.1,1.8);
 for(y=[-5.5,5.5])slot(7,y-1.1,62,2.2,-.1,1.8);
 for(x=[2.2,74.2])slot(x-1.1,-5,2.2,10,-.1,1.8);
}}
module lens_holder(){difference(){union(){
 rr(-7,-9,14,18,0,1.6,1);
 hole(0,0,0,3.64,10.6);
 }
 // Seat at z1.0: only peripheral annulus. Never force the plastic optic.
 hole(0,0,1,5,lens_bore);
 hole(0,0,-.1,1.3,5.2);
 for(y=[-5.5,5.5])hole(0,y,-.1,2,2.25);
 // Screws for soft retaining cap (pilot holes), outside optical element.
 for(x=[-4.3,4.3])hole(x,0,1.7,3.1,1.2);
}}
module lens_cap(){difference(){
 rr(-5.8,-4,11.6,8,0,.8,.7);
 hole(0,0,-.1,1,5.4);
 for(x=[-4.3,4.3])hole(x,0,-.1,1,1.65);
}}
module foot(){
 rr(-3.5,-2.25,7,4.5,0,sole,.8);
 rr(-2.875,-1.575,5.75,3.15,sole,1.05,.35);
}
module washer(t){difference(){hole(0,0,0,t,6);hole(0,0,-.1,t+.2,2.3);}}
module grip_coupon(){
 // Simplified short cradle, same phone width, back plane and clip interfaces.
 difference(){union(){
 rr(-5,143,86.7,21,0,base,1);
 for(x=[-.3,74.3])rr(x,143,2.4,21,base,phone_back-pad-base,.5);
 for(x=clip_x,y=[clip_y-5,clip_y+5])hole(x,y,base,4,4.6);
 }for(x=clip_x,y=[clip_y-5,clip_y+5])hole(x,y,.55,base+4.2,1.7);}
}
module t7_coupon(){difference(){union(){
 rr(-5,61,47,41,0,base,1);t7_mount();
 }for(p=t7_holes)hole(p[0],p[1],base+.7,t7_bottom-base,1.7);
 for(p=[[28,99],[27,61]])slot(p[0]-2,p[1]-2.2,4,4.4,base,1.4);
}}
module upper_coupon(){
 union(){rr(-5,0,86.7,20,0,base,1);top_hooks();
 for(x=[-.3,74.3])rr(x,0,2.4,20,base,phone_back-pad-base,.5);}
}
module pmw_coupon(){difference(){union(){
 rr(-22,-24,44,48,0,base,2);
 translate([-sensor_x,-sensor_ys[0],0])pmw_mount(sensor_ys[0]);
 }
 hole(0,0,-.1,base+.2,25);hole(0,0,.8,base,28.3);
 for(dy=[-19,19])hole(0,dy,base+.7,6,1.7);
 for(p=[[-18,0],[18,-19],[18,19]])rr(p[0]-2.8,p[1]-1.5,5.6,3,-.1,1.15,.4);
}}
module components(){
 color("#188a7a")translate([1,64.8342,t7_bottom])cube([38.989,31.1658,1]);
 color("silver")rr(.157,72.3506,7.32,8.64,t7_top,3.3,.2);
 color("#555555")rr(9.5,71,29.5,18,t7_top,3.2,.2);
 color("ivory")rr(4.47211,84.08144,8.89618,5.61497,t7_top-5,4,.2);
 color("ivory")rr(1.5118,65.2552,5.8,6.524,t7_top-4,3,.2);
 color("#d6ad52")rr(2.75,111.5,34.5,51,base+.3,6.3,.8);
 for(y=sensor_ys){
 color("#237d51")hole(sensor_x,y,sensor_shelf,sensor_pcb_t,32);
 color("#444b53")rr(sensor_x-8,y-5.5,16,11,sensor_top,2.41,.5);
 color([.3,.7,.9,.4])hole(sensor_x,y,2.4-sole,3.4,23);
 }
 color("#ff6f36"){
 route([[44,59],[38,57],[27,57],[27,64]],2,base+.2,1.4);
 route([[44,141],[42,128],[42,102],[32,98],[28,94]],2,base+.2,1.4);
 route([[21,111],[21,104],[10,104],[10,91],[15,88]],2,base+.2,1.4);
 }
}
module phone(){rr(0,0,phone_w,phone_l,phone_back,phone_t,4);}
module assembled(show_phone=false,optics=false){
 color("#b4c6d0")main();components();
 for(y=sensor_ys)color("#91a6b3")translate([sensor_x,y,0])rotate([0,0,90])pmw_shoe();
 for(i=[0:1])color("#348574")translate([clip_x[i],clip_y,base+4])flex_clip(i==1);
 for(y=sensor_ys,s=[-1,1])color("#247ba4")translate([sensor_x,y+s*19,sensor_top])rotate([0,0,s>0?180:0])pmw_clip();
 for(p=feet_xy)color("#406d56")translate([p[0],p[1],-sole])foot();
 if(optics){
 color("#d5892b")translate([0,bridge_y,rail_z])bridge();
 color("#d5892b")translate([18,bridge_y,rail_z+1.6])lens_holder();
 color([.2,.6,.9,.6])hole(18,bridge_y,rail_z+2.6,lens_h,lens_d);
 color("#348574")translate([18,bridge_y,rail_z+1.6+3.64])lens_cap();
 }
 if(show_phone)color([.16,.22,.26,.25])phone();
}
// Bare reference envelopes for collision checks (not fit validation).
module rigid_boxes(){
 translate([1,64.8342,t7_bottom+.03])cube([38.989,31.1658,.97]);
 rr(.157,72.3506,7.32,8.64,t7_top,3.3,.2);
 rr(9.5,71,29.5,18,t7_top,3.2,.2);
 rr(4.47211,84.08144,8.89618,5.61497,t7_top-5,4,.2);
 rr(2.75,111.5,34.5,51,base+.3,6.3,.8);
 for(y=sensor_ys){hole(sensor_x,y,sensor_shelf+.03,sensor_pcb_t-.03,32);rr(sensor_x-8,y-5.5,16,11,sensor_top,2.41,.5);}
}
if(part=="main")translate([4.8,3,0])main();
else if(part=="clips")for(i=[0:1])translate([20+i*50,10,0])print_clip(i==1);
else if(part=="sensor_clips")for(i=[0:3])translate([5+i*12,5,0])pmw_clip();
else if(part=="bridge")translate([0,8,0])bridge();
else if(part=="lens_holder")translate([7,9,0])lens_holder();
else if(part=="lens_cap")translate([5.8,4,0])lens_cap();
else if(part=="feet")for(i=[0:2])translate([4+12*i,3,0])foot();
else if(part=="shoes")for(i=[0:1])translate([15+32*i,15,0])pmw_shoe();
else if(part=="washers")for(j=[0:2],i=[0:3])translate([4+9*i,4+9*j,0])washer(.4*(j+1));
else if(part=="coupon_grip")translate([4.8,-143,0])grip_coupon();
else if(part=="coupon_sensor")translate([22,24,0])pmw_coupon();
else if(part=="coupon_t7")translate([5,-59,0])t7_coupon();
else if(part=="coupon_upper")translate([5,0,0])upper_coupon();
else if(part=="collision_phone")intersection(){main();phone();}
else if(part=="collision_components")intersection(){main();rigid_boxes();}
else if(part=="phone")assembled(true,false);
else if(part=="optics")assembled(false,true);
else if(part=="service"){
 intersection(){assembled(false,false);translate([-6,61,-1])cube([48,40,25]);}
 // Plug-overmould reservation 18 x12 x7, indicative cable only.
 color("#52606b")rr(-22,70.7,18,12,5.45,7,1);
 color("silver")rr(-4,72.4,5,8.5,7.55,2.8,.2);
}
else if(part=="bottom")assembled(false,false);
else assembled(false,false);
