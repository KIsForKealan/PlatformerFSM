/// @description 

if (point_distance(x, y, oPlayer.x, oPlayer.y) < 32)
{
	image_index = 1;
	if (point_distance(x, y, oPlayer.x, oPlayer.y) < 18)
	{	
		image_index = 2;	
	}	
}
else image_index = 0;
