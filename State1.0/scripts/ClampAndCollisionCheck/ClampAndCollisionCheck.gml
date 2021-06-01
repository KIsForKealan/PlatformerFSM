

function CollisionCheck(){
	
	// Check for collision and adjust velocity
	if place_meeting(x+hSpeed, y, oCollision)
	{
		while (!place_meeting(x+sign(hSpeed), y, oCollision))
		{
			x += sign(hSpeed);	
		}
		hSpeed = 0;	
	}
	
	
	if place_meeting(x, y+vSpeed, oCollision)
	{
		while (!place_meeting(x, y+sign(vSpeed), oCollision))
		{
			y += sign(vSpeed);	
		}
		vSpeed = 0;	
	}
}