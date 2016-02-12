#define collision
///collision()
//because I figured that everybody didn't put the collision code on a script just for funsies
landed=place_meeting(x,y+1,cl_solid) && vsp==0
if !global.paused
{
// vertical speed
vsp+=grav

//Horizontal Collision
if (place_meeting(x+hsp,y,cl_solid))
{
    while(!place_meeting(x+sign(hsp),y,cl_solid))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x+=(hsp);

//are you humping a bouncer?
if landed==false
    {
    if place_meeting(x,y+vsp,cl_bounce)
        {
        vsp*=-1
        vsp=(vsp)+sign(vsp)*cl_bounce.b_power
        }
    }

//Vertical Collision
if (place_meeting(x,y+vsp,cl_solid))
{
    while(!place_meeting(x,y+sign(vsp),cl_solid))
    {
        y += sign(vsp);
    }
        vsp = 0;
}

    {y = round(y) + round(vsp);}
} else { x=x;y=y}

if place_meeting(x,y,cl_lava)
{
    instance_destroy()
}    

//destroys if it leaves the room at all
if   bbox_bottom > room_height //|| bbox_top < room_height || bbox_left < room_width || bbox_right > room_width
{
    instance_destroy()
}

#define collision_init
///initializing collision variables
grav = 0.08;
hsp = 0;
vsp = 0;
jumpspeed = 1.5;
movespeed = 1;
dir=-1
landed=false