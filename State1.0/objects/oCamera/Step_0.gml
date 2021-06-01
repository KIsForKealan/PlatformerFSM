/// @description Update camera

// Update destination

if (instance_exists(follow))  
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 20;
y += (yTo - y) / 20;

// Keep camera inside room
x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

// Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);