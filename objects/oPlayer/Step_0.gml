   //Core Player Logic
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1, oWall) && (key_jump))
{
	vsp = -jumpsp;
}
//Horizontal Collison
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collison
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;
//Double Jump
vsp += grv;

if(keyboard_check_pressed(vk_space) && jump_current > 0)
{
    vsp = -9;
    jump_current--;
}

if(place_meeting(x, y + vsp, oWall))
{
    while(!place_meeting(x, y + sign(vsp), oWall))
    {
        y += sign(vsp);
    }
 
    if(vsp > 0)
    {
        jump_current = jump_number;
    }
 
    vsp = 0;
}

y += vsp;
//Wall Jump
if(key_jump && place_meeting(x, y + 1, oWall))
{
vsp = -9
}

if(key_jump && place_meeting(x +1, y, oWall))
{
vsp = -9
hsp = -6
}

if(key_jump && place_meeting(x -1, y, oWall))
{
vsp = -9
hsp = +6
}