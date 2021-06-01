/// @description 

if keyboard_check(vk_shift)
{
	pressedMouse = true;
	if !instance_exists(oLaser)
	{
		instance_create_layer(oPlayer.x, oPlayer.y-15, "Instances", oLaser);
	}
	
}
if !keyboard_check(vk_shift)
{
	pressedMouse = false;	
}

if laserCount > 120
{
	laserCount = 0;
	if !instance_exists(oLaser)
	{
		instance_create_layer(oController.x, oController.y, "Instances", oLaser);
	}
	else with (oLaser) 
	{	
		instance_destroy();
	}
	
}
else laserCount++;